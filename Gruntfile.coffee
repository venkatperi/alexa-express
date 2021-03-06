module.exports = ( grunt ) ->

  grunt.initConfig
    pkg : grunt.file.readJSON "package.json"

    clean :
      dist : [ "dist", "*.{js,map}", "lib/**/*.{map,js}" ]

    coffee :
      options :
        sourceMap : false
        bare : true
        force : true

      dist :
        expand : true
        src : [ "lib/**/*.coffee", "*.coffee", "!Gruntfile.coffee" ]
        dest : "dist"
        ext : '.js'

    watch :
      dist :
        tasks : [ "coffee:dist" ]
        files : [ "lib/**/*coffee", "*.coffee" ]

  for t in [ "contrib-watch", "contrib-coffee", "contrib-clean" ]
    grunt.loadNpmTasks "grunt-#{t}"

  grunt.registerTask "default", [ "clean:dist", "coffee:dist" ]

