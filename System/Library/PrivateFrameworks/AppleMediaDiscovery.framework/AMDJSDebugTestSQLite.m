@interface AMDJSDebugTestSQLite
+ (id)getSchema:(id)a3;
+ (id)getTestFetchDescriptors;
+ (id)getTestSchemaDict;
+ (id)test:(id)a3 error:(id *)a4;
@end

@implementation AMDJSDebugTestSQLite

+ (id)getSchema:(id)a3
{
  id v16 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = +[AMDSQLite getSharedInstance];
  id v14 = (id)[v10 getDataSchema];

  id v13 = 0;
  id v11 = (id)[location[0] objectForKey:TEST_USE_TEST_SCHEMA];

  if (v11)
  {
    v7 = [AMDSQLiteSchema alloc];
    id v9 = (id)[v16 getTestSchemaDict];
    id v12 = v13;
    v8 = -[AMDSQLiteSchema initWithDict:error:](v7, "initWithDict:error:");
    objc_storeStrong(&v13, v12);
    id v3 = v14;
    id v14 = v8;
  }
  if (v13) {
    id v4 = 0;
  }
  else {
    id v4 = v14;
  }
  id v6 = v4;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);

  return v6;
}

+ (id)test:(id)a3 error:(id *)a4
{
  v194[1] = *MEMORY[0x263EF8340];
  id v173 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v171 = a4;
  id v170 = 0;
  id v169 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v91 = (id)[location[0] objectForKey:TEST_LOAD_DB];

  if (v91)
  {
    v89 = objc_alloc_init(AMDSQLite);
    id v168 = [(AMDSQLite *)v89 loadDb];

    [v169 setObject:v168 forKey:TEST_LOAD_DB];
    objc_storeStrong(&v168, 0);
  }
  id v88 = (id)[location[0] objectForKey:TEST_SHARED_INSTANCE];

  if (v88)
  {
    id v4 = +[AMDSQLite getSharedInstance];
    id v5 = v170;
    id v170 = v4;

    id v87 = v169;
    if ([v170 getDb]) {
      uint64_t v6 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v6 = MEMORY[0x263EFFA80];
    }
    [v87 setObject:v6 forKey:TEST_SHARED_INSTANCE];
  }
  id v86 = (id)[location[0] objectForKey:TEST_UPDATE_SCHEMA];

  if (v86)
  {
    id v7 = +[AMDSQLite getSharedInstance];
    id v8 = v170;
    id v170 = v7;

    id v83 = v169;
    id v82 = v170;
    id v85 = (id)[v173 getTestSchemaDict];
    id v84 = (id)objc_msgSend(v82, "updateSchema:error:");
    objc_msgSend(v83, "setObject:forKey:");
  }
  id v81 = (id)[location[0] objectForKey:TEST_SET_ENABLE];

  if (v81)
  {
    id v9 = +[AMDSQLite getSharedInstance];
    id v10 = v170;
    id v170 = v9;

    id v79 = (id)[location[0] objectForKey:TEST_SET_ENABLE];
    BOOL v80 = (int)[v79 intValue] > 0;

    BOOL v167 = v80;
    [v170 setEnable:v80];
    if (v80) {
      id v11 = @"enabled";
    }
    else {
      id v11 = @"diabled";
    }
    [v169 setObject:v11 forKey:TEST_SET_ENABLE];
  }
  id v78 = (id)[location[0] objectForKey:TEST_CREATE_TEST_TABLE];

  if (!v78) {
    goto LABEL_20;
  }
  v76 = [AMDSQLiteSchema alloc];
  id v77 = (id)[v173 getTestSchemaDict];
  id v166 = -[AMDSQLiteSchema initWithDict:error:](v76, "initWithDict:error:");

  if (*v171)
  {
    uint64_t v193 = TEST_CREATE_TEST_TABLE;
    id v75 = (id)[*v171 localizedDescription];
    v194[0] = v75;
    id v174 = (id)[NSDictionary dictionaryWithObjects:v194 forKeys:&v193 count:1];

    int v165 = 1;
  }
  else
  {
    id v12 = +[AMDSQLite getSharedInstance];
    id v13 = v170;
    id v170 = v12;

    id v74 = (id)[location[0] objectForKey:TEST_CREATE_TEST_TABLE];
    id v164 = (id)[v74 objectForKey:0x26BEB5158];

    id v163 = (id)[v170 createTable:v164 usingSchema:v166 error:v171];
    [v169 setObject:v163 forKey:TEST_CREATE_TEST_TABLE];
    objc_storeStrong(&v163, 0);
    objc_storeStrong(&v164, 0);
    int v165 = 0;
  }
  objc_storeStrong(&v166, 0);
  if (!v165)
  {
LABEL_20:
    id v73 = (id)[location[0] objectForKey:TEST_CREATE_TABLE];

    if (v73)
    {
      id v14 = +[AMDSQLite getSharedInstance];
      id v15 = v170;
      id v170 = v14;

      id v69 = (id)[location[0] objectForKey:TEST_CREATE_TABLE];
      id v162 = (id)[v69 objectForKey:0x26BEB5158];

      id v71 = v170;
      id v70 = v162;
      id v72 = (id)[v170 getDataSchema];
      id v161 = (id)objc_msgSend(v71, "createTable:usingSchema:error:", v70);

      [v169 setObject:v161 forKey:TEST_CREATE_TABLE];
      objc_storeStrong(&v161, 0);
      objc_storeStrong(&v162, 0);
    }
    id v68 = (id)[location[0] objectForKey:TEST_SAVE_EVENTS];

    if (v68)
    {
      id v67 = (id)[location[0] objectForKey:TEST_SAVE_EVENTS];
      id v160 = +[AMDSQLite saveEvents:error:](AMDSQLite, "saveEvents:error:");

      if (*v171)
      {
        id v65 = v169;
        id v66 = (id)[*v171 localizedDescription];
        objc_msgSend(v65, "setObject:forKey:");
      }
      else
      {
        [v169 setObject:v160 forKey:TEST_SAVE_EVENTS];
      }
      objc_storeStrong(&v160, 0);
    }
    id v64 = (id)[location[0] objectForKey:TEST_FETCH_ROWS];

    if (!v64) {
      goto LABEL_42;
    }
    id v16 = +[AMDSQLite getSharedInstance];
    id v17 = v170;
    id v170 = v16;

    id v159 = (id)[v173 getSchema:location[0]];
    id v158 = (id)[location[0] objectForKey:TEST_FETCH_ROWS];
    id v157 = [[AMDFetchDescriptor alloc] initWithDict:v158 usingSchema:v159 error:v171];
    if (*v171)
    {
      uint64_t v191 = TEST_FETCH_ROWS;
      id v63 = (id)[*v171 localizedDescription];
      id v192 = v63;
      id v174 = (id)[NSDictionary dictionaryWithObjects:&v192 forKeys:&v191 count:1];

      int v165 = 1;
    }
    else
    {
      id v156 = (id)[location[0] objectForKey:@"persist"];
      BOOL v155 = 0;
      if (v156) {
        BOOL v62 = [v156 intValue] != 0;
      }
      else {
        BOOL v62 = 0;
      }
      BOOL v155 = v62;
      id v154 = (id)[v170 fetchRowsUsingSchema:v159 andDescriptor:v157 andPersist:v62 error:v171];
      id v61 = v169;
      char v152 = 0;
      char v150 = 0;
      if (v154)
      {
        id v60 = v154;
      }
      else
      {
        v189 = @"failure";
        id v153 = (id)[*v171 localizedDescription];
        char v152 = 1;
        id v190 = v153;
        id v151 = (id)[NSDictionary dictionaryWithObjects:&v190 forKeys:&v189 count:1];
        char v150 = 1;
        id v60 = v151;
      }
      [v61 setObject:v60 forKey:TEST_FETCH_ROWS];
      if (v150) {

      }
      if (v152) {
      objc_storeStrong(&v154, 0);
      }
      objc_storeStrong(&v156, 0);
      int v165 = 0;
    }
    objc_storeStrong(&v157, 0);
    objc_storeStrong(&v158, 0);
    objc_storeStrong(&v159, 0);
    if (!v165)
    {
LABEL_42:
      id v59 = (id)[location[0] objectForKey:TEST_DELETE_ROWS];

      if (v59)
      {
        id v18 = +[AMDSQLite getSharedInstance];
        id v19 = v170;
        id v170 = v18;

        id v56 = v170;
        id v57 = (id)[location[0] objectForKey:TEST_DELETE_ROWS];
        id v149 = (id)objc_msgSend(v56, "deleteRows:error:");

        id v58 = v169;
        char v147 = 0;
        char v145 = 0;
        if (v149)
        {
          id v55 = v149;
        }
        else
        {
          v187 = @"failure";
          id v148 = (id)[*v171 localizedDescription];
          char v147 = 1;
          id v188 = v148;
          id v146 = (id)[NSDictionary dictionaryWithObjects:&v188 forKeys:&v187 count:1];
          char v145 = 1;
          id v55 = v146;
        }
        [v58 setObject:v55 forKey:TEST_DELETE_ROWS];
        if (v145) {

        }
        if (v147) {
        objc_storeStrong(&v149, 0);
        }
      }
      id v54 = (id)[location[0] objectForKey:TEST_INSERT_JS];

      if (v54)
      {
        id v144 = (id)[v173 getSchema:location[0]];
        id v143 = (id)[location[0] objectForKey:TEST_INSERT_JS];
        id v142 = +[AMDSQLite insertRowsInternal:v143 usingSchema:v144 error:v171];
        id v53 = v169;
        char v140 = 0;
        char v138 = 0;
        if (v142)
        {
          id v52 = v142;
        }
        else
        {
          v185 = @"failure";
          id v141 = (id)[*v171 localizedDescription];
          char v140 = 1;
          id v186 = v141;
          id v139 = (id)[NSDictionary dictionaryWithObjects:&v186 forKeys:&v185 count:1];
          char v138 = 1;
          id v52 = v139;
        }
        [v53 setObject:v52 forKey:TEST_INSERT_JS];
        if (v138) {

        }
        if (v140) {
        objc_storeStrong(&v142, 0);
        }
        objc_storeStrong(&v143, 0);
        objc_storeStrong(&v144, 0);
      }
      id v51 = (id)[location[0] objectForKey:TEST_DELETE_JS];

      if (v51)
      {
        id v137 = (id)[location[0] objectForKey:TEST_DELETE_JS];
        id v136 = +[AMDSQLite deleteRowsHandler:v137 error:v171];
        id v50 = v169;
        char v134 = 0;
        char v132 = 0;
        if (v136)
        {
          id v49 = v136;
        }
        else
        {
          v183 = @"failure";
          id v135 = (id)[*v171 localizedDescription];
          char v134 = 1;
          id v184 = v135;
          id v133 = (id)[NSDictionary dictionaryWithObjects:&v184 forKeys:&v183 count:1];
          char v132 = 1;
          id v49 = v133;
        }
        [v50 setObject:v49 forKey:TEST_DELETE_JS];
        if (v132) {

        }
        if (v134) {
        objc_storeStrong(&v136, 0);
        }
        objc_storeStrong(&v137, 0);
      }
      id v48 = (id)[location[0] objectForKey:TEST_ADD_DESCRIPTORS];

      if (v48)
      {
        id v20 = +[AMDSQLite getSharedInstance];
        id v21 = v170;
        id v170 = v20;

        id v131 = (id)[location[0] objectForKey:TEST_ADD_DESCRIPTORS];
        id v130 = (id)[v131 objectForKey:0x26BEAE298];
        id v129 = (id)[v131 objectForKey:@"fdConfig"];
        id v128 = +[AMDFetchDescriptor refreshAggregationDescriptors:v129 forDomain:v130 error:v171];
        id v47 = v169;
        char v126 = 0;
        char v124 = 0;
        if (v128)
        {
          id v46 = v128;
        }
        else
        {
          v181 = @"failure";
          id v127 = (id)[*v171 localizedDescription];
          char v126 = 1;
          id v182 = v127;
          id v125 = (id)[NSDictionary dictionaryWithObjects:&v182 forKeys:&v181 count:1];
          char v124 = 1;
          id v46 = v125;
        }
        [v47 setObject:v46 forKey:TEST_ADD_DESCRIPTORS];
        if (v124) {

        }
        if (v126) {
        objc_storeStrong(&v128, 0);
        }
        objc_storeStrong(&v129, 0);
        objc_storeStrong(&v130, 0);
        objc_storeStrong(&v131, 0);
      }
      id v45 = (id)[location[0] objectForKey:TEST_REFRESH_ODTP];

      if (v45)
      {
        id v123 = (id)[location[0] objectForKey:TEST_REFRESH_ODTP];
        id v122 = +[AMDSQLite refreshODTPForDomain:v123 error:v171];
        id v44 = v169;
        char v120 = 0;
        char v118 = 0;
        if (v122)
        {
          id v43 = v122;
        }
        else
        {
          v179 = @"failure";
          id v121 = (id)[*v171 localizedDescription];
          char v120 = 1;
          id v180 = v121;
          id v119 = (id)[NSDictionary dictionaryWithObjects:&v180 forKeys:&v179 count:1];
          char v118 = 1;
          id v43 = v119;
        }
        [v44 setObject:v43 forKey:TEST_REFRESH_ODTP];
        if (v118) {

        }
        if (v120) {
        objc_storeStrong(&v122, 0);
        }
        objc_storeStrong(&v123, 0);
      }
      id v42 = (id)[location[0] objectForKey:TEST_REFRESH_ENTITY_TABLE];

      if (v42)
      {
        id v117 = (id)[location[0] objectForKey:TEST_REFRESH_ENTITY_TABLE];
        id v116 = +[AMDSQLite refreshEntityTableForDomain:v117 error:v171];
        id v41 = v169;
        char v114 = 0;
        char v112 = 0;
        if (v116)
        {
          id v40 = v116;
        }
        else
        {
          v177 = @"failure";
          id v115 = (id)[*v171 localizedDescription];
          char v114 = 1;
          id v178 = v115;
          id v113 = (id)[NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
          char v112 = 1;
          id v40 = v113;
        }
        [v41 setObject:v40 forKey:TEST_REFRESH_ENTITY_TABLE];
        if (v112) {

        }
        if (v114) {
        objc_storeStrong(&v116, 0);
        }
        objc_storeStrong(&v117, 0);
      }
      id v39 = (id)[location[0] objectForKey:TEST_FETCH_FEATURE];

      if (v39)
      {
        id v22 = +[AMDSQLite getSharedInstance];
        id v23 = v170;
        id v170 = v22;

        id v111 = (id)[location[0] objectForKey:TEST_FETCH_FEATURE];
        id v110 = (id)[v111 objectForKey:0x26BEAE298];
        id v109 = (id)[v111 objectForKey:@"featureName"];
        id v108 = +[AMDSQLite getFeatureValueWithName:v109 inDomain:v110 withColumnName:0 skipRowset:0 error:v171];
        if (v108) {
          v38 = (__CFString *)v108;
        }
        else {
          v38 = @"Not found";
        }
        [v169 setObject:v38 forKey:TEST_FETCH_FEATURE];
        objc_storeStrong(&v108, 0);
        objc_storeStrong(&v109, 0);
        objc_storeStrong(&v110, 0);
        objc_storeStrong(&v111, 0);
      }
      id v37 = (id)[location[0] objectForKey:TEST_FETCH_SCHEMA];

      if (v37)
      {
        id v24 = +[AMDSQLite getSharedInstance];
        id v25 = v170;
        id v170 = v24;

        id v36 = (id)[v170 getDataSchema];
        id v107 = (id)[v36 getSchemaDict];

        if (v107) {
          v35 = (__CFString *)v107;
        }
        else {
          v35 = @"No schema";
        }
        [v169 setObject:v35 forKey:TEST_FETCH_SCHEMA];
        objc_storeStrong(&v107, 0);
      }
      id v34 = (id)[location[0] objectForKey:TEST_UPDATE_DATA];

      if (v34)
      {
        id v106 = (id)[location[0] objectForKey:TEST_UPDATE_DATA];
        id v105 = +[AMDSQLite updateData:v106];
        [v169 setObject:v105 forKey:TEST_UPDATE_DATA];
        objc_storeStrong(&v105, 0);
        objc_storeStrong(&v106, 0);
      }
      id v33 = (id)[location[0] objectForKey:TEST_UPDATE_BIOME_DATA];

      if (v33)
      {
        id v104 = 0;
        id v103 = &unk_26BEC34E0;
        id v101 = v104;
        id v32 = +[AMDBiomeIntegration queryBiomeFor:v103 withError:&v101];
        objc_storeStrong(&v104, v101);
        id v102 = v32;
        [v169 setObject:v32 forKey:TEST_UPDATE_DATA];
        objc_storeStrong(&v102, 0);
        objc_storeStrong(&v103, 0);
        objc_storeStrong(&v104, 0);
      }
      id v31 = (id)[location[0] objectForKey:TEST_UPDATE_STORAGE_DATA];

      if (v31)
      {
        id v100 = &unk_26BEC2B98;
        id v99 = +[AMDDeviceStorage performStorageUpdateWithPayload:v100];
        [v169 setObject:v99 forKey:TEST_UPDATE_STORAGE_DATA];
        objc_storeStrong(&v99, 0);
        objc_storeStrong(&v100, 0);
      }
      id v30 = (id)[location[0] objectForKey:TEST_UPDATE_TABLES];

      if (v30)
      {
        id v98 = (id)[v173 getSchema:location[0]];
        id v97 = (id)[location[0] objectForKey:TEST_UPDATE_TABLES];
        id v96 = +[AMDSQLite updateTablesInternal:v97 usingSchema:v98 error:v171];
        id v29 = v169;
        char v94 = 0;
        char v92 = 0;
        if (v96)
        {
          id v28 = v96;
        }
        else
        {
          v175 = @"failure";
          id v95 = (id)[*v171 localizedDescription];
          char v94 = 1;
          id v176 = v95;
          id v93 = (id)[NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
          char v92 = 1;
          id v28 = v93;
        }
        [v29 setObject:v28 forKey:TEST_UPDATE_TABLES];
        if (v92) {

        }
        if (v94) {
        objc_storeStrong(&v96, 0);
        }
        objc_storeStrong(&v97, 0);
        objc_storeStrong(&v98, 0);
      }
      id v174 = v169;
      int v165 = 1;
    }
  }
  objc_storeStrong(&v169, 0);
  objc_storeStrong(&v170, 0);
  objc_storeStrong(location, 0);
  v26 = v174;

  return v26;
}

+ (id)getTestFetchDescriptors
{
  v7[1] = *MEMORY[0x263EF8340];
  v5[0] = 0x26BEB4FB8;
  v6[0] = @"fetch_from_t1";
  v5[1] = 0x26BEB5158;
  v6[1] = @"testTable1";
  v5[2] = 0x26BEB4FD8;
  v6[2] = @"adamId";
  v5[3] = 0x26BEB4F98;
  v6[3] = &unk_26BEC34F8;
  v5[4] = 0x26BEB50F8;
  v6[4] = @"rowset";
  v5[5] = 0x26BEAE298;
  v6[5] = @"apps";
  id v3 = (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  v7[0] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v4;
}

+ (id)getTestSchemaDict
{
  v198[4] = *MEMORY[0x263EF8340];
  v197[0] = AMD_SQLITE_SCHEMA_NAME;
  v198[0] = @"testSchema";
  v197[1] = AMD_SQLITE_SCHEMA_VERSION;
  v198[1] = @"17";
  v197[2] = AMD_SQLITE_SCHEMA_TABLES;
  v195[0] = @"testUniqueColumns";
  v193[0] = @"c1";
  v191[0] = AMD_SQLITE_TYPE;
  v192[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v191[1] = AMD_SQLITE_NOT_NULL;
  uint64_t v3 = MEMORY[0x263EFFA88];
  v192[1] = MEMORY[0x263EFFA88];
  v191[2] = AMD_SQLITE_UNIQUE;
  v192[2] = MEMORY[0x263EFFA88];
  id v68 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v192, v191);
  v194[0] = v68;
  v193[1] = @"c2";
  v189[0] = AMD_SQLITE_TYPE;
  v190[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v189[1] = AMD_SQLITE_NOT_NULL;
  v190[1] = v3;
  v189[2] = AMD_SQLITE_UNIQUE;
  v190[2] = v3;
  id v67 = (id)[NSDictionary dictionaryWithObjects:v190 forKeys:v189 count:3];
  v194[1] = v67;
  v193[2] = @"c3";
  v187[0] = AMD_SQLITE_TYPE;
  v188[0] = AMD_SQLITE_DATA_TYPE_FLOAT;
  v187[1] = AMD_SQLITE_NOT_NULL;
  v188[1] = v3;
  id v66 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v188, v187);
  void v194[2] = v66;
  id v65 = (id)[NSDictionary dictionaryWithObjects:v194 forKeys:v193 count:3];
  v196[0] = v65;
  v195[1] = 0x26BEAD858;
  v185[0] = 0x26BEAEB38;
  v183[0] = AMD_SQLITE_TYPE;
  v184[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v183[1] = AMD_SQLITE_NOT_NULL;
  v184[1] = v3;
  id v64 = (id)[NSDictionary dictionaryWithObjects:v184 forKeys:v183 count:2];
  v186[0] = v64;
  v185[1] = 0x26BEB03F8;
  v181[0] = AMD_SQLITE_TYPE;
  v182[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v181[1] = AMD_SQLITE_NOT_NULL;
  v182[1] = v3;
  id v63 = (id)[NSDictionary dictionaryWithObjects:v182 forKeys:v181 count:2];
  v186[1] = v63;
  v185[2] = 0x26BEB0418;
  v179[0] = AMD_SQLITE_TYPE;
  v180[0] = AMD_SQLITE_DATA_TYPE_INT;
  v179[1] = AMD_SQLITE_NOT_NULL;
  v180[1] = v3;
  id v62 = (id)[NSDictionary dictionaryWithObjects:v180 forKeys:v179 count:2];
  v186[2] = v62;
  v185[3] = 0x26BEB0438;
  v177[0] = AMD_SQLITE_TYPE;
  v178[0] = AMD_SQLITE_DATA_TYPE_INT;
  v177[1] = AMD_SQLITE_NOT_NULL;
  v178[1] = v3;
  id v61 = (id)[NSDictionary dictionaryWithObjects:v178 forKeys:v177 count:2];
  v186[3] = v61;
  v185[4] = 0x26BEB0458;
  v175[0] = AMD_SQLITE_TYPE;
  v176[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v175[1] = AMD_SQLITE_NOT_NULL;
  v176[1] = v3;
  id v60 = (id)[NSDictionary dictionaryWithObjects:v176 forKeys:v175 count:2];
  v186[4] = v60;
  v185[5] = 0x26BEAEC58;
  v173[0] = AMD_SQLITE_TYPE;
  v174[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v173[1] = AMD_SQLITE_NOT_NULL;
  v174[1] = v3;
  id v59 = (id)[NSDictionary dictionaryWithObjects:v174 forKeys:v173 count:2];
  v186[5] = v59;
  id v58 = (id)[NSDictionary dictionaryWithObjects:v186 forKeys:v185 count:6];
  v196[1] = v58;
  v195[2] = @"testTable1";
  v171[0] = @"eventTime";
  v169[0] = AMD_SQLITE_TYPE;
  v170[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v169[1] = AMD_SQLITE_NOT_NULL;
  v170[1] = v3;
  id v57 = (id)[NSDictionary dictionaryWithObjects:v170 forKeys:v169 count:2];
  v172[0] = v57;
  v171[1] = @"eventType";
  v167[0] = AMD_SQLITE_TYPE;
  v168[0] = AMD_SQLITE_DATA_TYPE_INT;
  v167[1] = AMD_SQLITE_NOT_NULL;
  v168[1] = v3;
  id v56 = (id)[NSDictionary dictionaryWithObjects:v168 forKeys:v167 count:2];
  v172[1] = v56;
  v171[2] = @"adamId";
  v165[0] = AMD_SQLITE_TYPE;
  v166[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v165[1] = AMD_SQLITE_NOT_NULL;
  v166[1] = v3;
  id v55 = (id)[NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:2];
  v172[2] = v55;
  v171[3] = @"duration";
  v163[0] = AMD_SQLITE_TYPE;
  v164[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v163[1] = AMD_SQLITE_NOT_NULL;
  v164[1] = v3;
  v163[2] = AMD_SQLITE_DEFAULT_VALUE;
  v164[2] = &unk_26BEC1AD8;
  id v54 = (id)[NSDictionary dictionaryWithObjects:v164 forKeys:v163 count:3];
  v172[3] = v54;
  v171[4] = 0x26BEAEC58;
  v161[0] = AMD_SQLITE_TYPE;
  v162[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v161[1] = AMD_SQLITE_NOT_NULL;
  v162[1] = v3;
  id v53 = (id)[NSDictionary dictionaryWithObjects:v162 forKeys:v161 count:2];
  v172[4] = v53;
  id v52 = (id)[NSDictionary dictionaryWithObjects:v172 forKeys:v171 count:5];
  v196[2] = v52;
  v195[3] = @"testTable2";
  v159[0] = @"c1";
  v157[0] = AMD_SQLITE_TYPE;
  v158[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v157[1] = AMD_SQLITE_NOT_NULL;
  v158[1] = v3;
  v157[2] = AMD_SQLITE_DEFAULT_VALUE;
  v158[2] = @"foo_bar";
  id v51 = (id)[NSDictionary dictionaryWithObjects:v158 forKeys:v157 count:3];
  v160[0] = v51;
  v159[1] = @"c2";
  uint64_t v155 = AMD_SQLITE_TYPE;
  uint64_t v156 = AMD_SQLITE_DATA_TYPE_INT;
  id v50 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v156, &v155);
  v160[1] = v50;
  v159[2] = @"c22";
  v153[0] = AMD_SQLITE_TYPE;
  v154[0] = AMD_SQLITE_DATA_TYPE_INT;
  v153[1] = AMD_SQLITE_NOT_NULL;
  v154[1] = v3;
  v153[2] = AMD_SQLITE_DEFAULT_VALUE;
  v154[2] = &unk_26BEC1AF0;
  id v49 = (id)[NSDictionary dictionaryWithObjects:v154 forKeys:v153 count:3];
  v160[2] = v49;
  v159[3] = @"c3";
  v151[0] = AMD_SQLITE_TYPE;
  v152[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v151[1] = AMD_SQLITE_NOT_NULL;
  v152[1] = v3;
  v151[2] = AMD_SQLITE_DEFAULT_VALUE;
  v152[2] = &unk_26BEC1B08;
  id v48 = (id)[NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:3];
  v160[3] = v48;
  v159[4] = @"c4";
  v149[0] = AMD_SQLITE_TYPE;
  v150[0] = AMD_SQLITE_DATA_TYPE_FLOAT;
  v149[1] = AMD_SQLITE_NOT_NULL;
  v150[1] = v3;
  id v47 = (id)[NSDictionary dictionaryWithObjects:v150 forKeys:v149 count:2];
  v160[4] = v47;
  v159[5] = @"c5";
  uint64_t v147 = AMD_SQLITE_TYPE;
  uint64_t v148 = AMD_SQLITE_DATA_TYPE_BLOB;
  id v46 = (id)[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
  v160[5] = v46;
  v159[6] = @"c6";
  v145[0] = AMD_SQLITE_TYPE;
  v146[0] = AMD_SQLITE_DATA_TYPE_BLOB;
  v145[1] = AMD_SQLITE_NOT_NULL;
  v146[1] = v3;
  v145[2] = AMD_SQLITE_DEFAULT_VALUE;
  v146[2] = &unk_26BEC3780;
  id v45 = (id)[NSDictionary dictionaryWithObjects:v146 forKeys:v145 count:3];
  v160[6] = v45;
  id v44 = (id)[NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:7];
  v196[3] = v44;
  v195[4] = @"AMDAppStoreUsageEvents";
  v143[0] = @"adamId";
  v141[0] = AMD_SQLITE_TYPE;
  v142[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v141[1] = AMD_SQLITE_NOT_NULL;
  v142[1] = v3;
  id v43 = (id)[NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:2];
  v144[0] = v43;
  v143[1] = @"shortAppVersion";
  v139[0] = AMD_SQLITE_TYPE;
  v140[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v139[1] = AMD_SQLITE_NOT_NULL;
  v140[1] = v3;
  v139[2] = AMD_SQLITE_DEFAULT_VALUE;
  v140[2] = &stru_26BEAC9D8;
  id v42 = (id)[NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:3];
  v144[1] = v42;
  v143[2] = @"batteryUsage";
  uint64_t v137 = AMD_SQLITE_TYPE;
  uint64_t v138 = AMD_SQLITE_DATA_TYPE_FLOAT;
  id v41 = (id)[NSDictionary dictionaryWithObjects:&v138 forKeys:&v137 count:1];
  v144[2] = v41;
  v143[3] = @"dsId";
  v135[0] = AMD_SQLITE_TYPE;
  v136[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v135[1] = AMD_SQLITE_NOT_NULL;
  v136[1] = v3;
  id v40 = (id)[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:2];
  v144[3] = v40;
  v143[4] = @"eventTime";
  v133[0] = AMD_SQLITE_TYPE;
  v134[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v133[1] = AMD_SQLITE_NOT_NULL;
  v134[1] = v3;
  id v39 = (id)[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:2];
  v144[4] = v39;
  v143[5] = @"eventType";
  v131[0] = AMD_SQLITE_TYPE;
  v132[0] = AMD_SQLITE_DATA_TYPE_INT;
  v131[1] = AMD_SQLITE_NOT_NULL;
  v132[1] = v3;
  id v38 = (id)[NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:2];
  v144[5] = v38;
  v143[6] = @"eventSubType";
  uint64_t v129 = AMD_SQLITE_TYPE;
  uint64_t v130 = AMD_SQLITE_DATA_TYPE_INT;
  id v37 = (id)[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
  v144[6] = v37;
  v143[7] = @"eventVersion";
  uint64_t v127 = AMD_SQLITE_TYPE;
  uint64_t v128 = AMD_SQLITE_DATA_TYPE_TEXT;
  id v36 = (id)[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
  v144[7] = v36;
  v143[8] = @"foregroundDuration";
  v125[0] = AMD_SQLITE_TYPE;
  v126[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v125[1] = AMD_SQLITE_NOT_NULL;
  v126[1] = v3;
  v125[2] = AMD_SQLITE_DEFAULT_VALUE;
  v126[2] = &unk_26BEC1AD8;
  id v35 = (id)[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:3];
  v144[8] = v35;
  v143[9] = @"latitude";
  uint64_t v123 = AMD_SQLITE_TYPE;
  uint64_t v124 = AMD_SQLITE_DATA_TYPE_FLOAT;
  id v34 = (id)[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
  v144[9] = v34;
  v143[10] = @"locationAccuracy";
  uint64_t v121 = AMD_SQLITE_TYPE;
  uint64_t v122 = AMD_SQLITE_DATA_TYPE_FLOAT;
  id v33 = (id)[NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
  v144[10] = v33;
  v143[11] = @"longitude";
  uint64_t v119 = AMD_SQLITE_TYPE;
  uint64_t v120 = AMD_SQLITE_DATA_TYPE_FLOAT;
  id v32 = (id)[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
  v144[11] = v32;
  v143[12] = @"networkType";
  uint64_t v117 = AMD_SQLITE_TYPE;
  uint64_t v118 = AMD_SQLITE_DATA_TYPE_INT;
  id v31 = (id)[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
  v144[12] = v31;
  v143[13] = @"platform";
  v115[0] = AMD_SQLITE_TYPE;
  v116[0] = AMD_SQLITE_DATA_TYPE_INT;
  v115[1] = AMD_SQLITE_NOT_NULL;
  v116[1] = v3;
  id v30 = (id)[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:2];
  v144[13] = v30;
  v143[14] = @"storageUsed";
  uint64_t v113 = AMD_SQLITE_TYPE;
  uint64_t v114 = AMD_SQLITE_DATA_TYPE_INT64;
  id v29 = (id)[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
  v144[14] = v29;
  v143[15] = @"timeZoneOffset";
  v111[0] = AMD_SQLITE_TYPE;
  v112[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v111[1] = AMD_SQLITE_NOT_NULL;
  v112[1] = v3;
  v111[2] = AMD_SQLITE_DEFAULT_VALUE;
  v112[2] = &unk_26BEC1AD8;
  id v28 = (id)[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:3];
  v144[15] = v28;
  v143[16] = 0x26BEAEC58;
  v109[0] = AMD_SQLITE_TYPE;
  v110[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v109[1] = AMD_SQLITE_NOT_NULL;
  v110[1] = v3;
  id v27 = (id)[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:2];
  v144[16] = v27;
  id v26 = (id)[NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:17];
  v196[4] = v26;
  v195[5] = @"BiomeAppActivity";
  v107[0] = @"bundleId";
  v105[0] = AMD_SQLITE_TYPE;
  v106[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v105[1] = AMD_SQLITE_NOT_NULL;
  v106[1] = v3;
  v105[2] = AMD_SQLITE_DEFAULT_VALUE;
  v106[2] = @"nil_bundle_ID";
  id v25 = (id)[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:3];
  v108[0] = v25;
  v107[1] = @"activityType";
  v103[0] = AMD_SQLITE_TYPE;
  v104[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v103[1] = AMD_SQLITE_NOT_NULL;
  v104[1] = v3;
  v103[2] = AMD_SQLITE_DEFAULT_VALUE;
  v104[2] = @"nil_activity_type";
  id v24 = (id)[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:3];
  v108[1] = v24;
  v107[2] = @"eventTimestamp";
  v101[0] = AMD_SQLITE_TYPE;
  v102[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v101[1] = AMD_SQLITE_NOT_NULL;
  v102[1] = v3;
  v101[2] = AMD_SQLITE_DEFAULT_VALUE;
  v102[2] = &unk_26BEC1AD8;
  id v23 = (id)[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:3];
  v108[2] = v23;
  id v22 = (id)[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:3];
  v196[5] = v22;
  v195[6] = @"BiomeWifiActivity";
  v99[0] = @"SSID";
  v97[0] = AMD_SQLITE_TYPE;
  v98[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v97[1] = AMD_SQLITE_NOT_NULL;
  v98[1] = v3;
  v97[2] = AMD_SQLITE_DEFAULT_VALUE;
  v98[2] = @"nil_SSID";
  id v21 = (id)[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:3];
  v100[0] = v21;
  v99[1] = @"eventTimestamp";
  v95[0] = AMD_SQLITE_TYPE;
  v96[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v95[1] = AMD_SQLITE_NOT_NULL;
  v96[1] = v3;
  v95[2] = AMD_SQLITE_DEFAULT_VALUE;
  v96[2] = &unk_26BEC1AD8;
  id v20 = (id)[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:3];
  v100[1] = v20;
  id v19 = (id)[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:2];
  v196[6] = v19;
  v195[7] = @"DeviceStorageUsage";
  v93[0] = @"deviceId";
  v91[0] = AMD_SQLITE_TYPE;
  v92[0] = AMD_SQLITE_DATA_TYPE_TEXT;
  v91[1] = AMD_SQLITE_NOT_NULL;
  v92[1] = v3;
  v91[2] = AMD_SQLITE_DEFAULT_VALUE;
  v92[2] = @"undefined";
  id v18 = (id)[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];
  v94[0] = v18;
  v93[1] = @"time";
  v89[0] = AMD_SQLITE_TYPE;
  v90[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v89[1] = AMD_SQLITE_NOT_NULL;
  v90[1] = v3;
  v89[2] = AMD_SQLITE_DEFAULT_VALUE;
  v90[2] = &unk_26BEC1AD8;
  id v17 = (id)[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:3];
  v94[1] = v17;
  v93[2] = @"totalDeviceCapacityGB";
  v87[0] = AMD_SQLITE_TYPE;
  v88[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v87[1] = AMD_SQLITE_NOT_NULL;
  v88[1] = v3;
  v87[2] = AMD_SQLITE_DEFAULT_VALUE;
  v88[2] = &unk_26BEC1AD8;
  id v16 = (id)[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:3];
  v94[2] = v16;
  v93[3] = @"availableDeviceCapacityGB";
  v85[0] = AMD_SQLITE_TYPE;
  v86[0] = AMD_SQLITE_DATA_TYPE_INT64;
  v85[1] = AMD_SQLITE_NOT_NULL;
  v86[1] = v3;
  v85[2] = AMD_SQLITE_DEFAULT_VALUE;
  v86[2] = &unk_26BEC1AD8;
  id v15 = (id)[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:3];
  v94[3] = v15;
  id v14 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93);
  v196[7] = v14;
  v195[8] = @"topics";
  v83[0] = @"topicId";
  uint64_t v81 = AMD_SQLITE_TYPE;
  uint64_t v82 = AMD_SQLITE_DATA_TYPE_TEXT;
  id v13 = (id)[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
  v84[0] = v13;
  v83[1] = @"score";
  uint64_t v79 = AMD_SQLITE_TYPE;
  uint64_t v80 = AMD_SQLITE_DATA_TYPE_FLOAT;
  id v12 = (id)[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
  v84[1] = v12;
  v83[2] = @"most_recent_documentId";
  uint64_t v77 = AMD_SQLITE_TYPE;
  uint64_t v78 = AMD_SQLITE_DATA_TYPE_TEXT;
  id v11 = (id)[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  v84[2] = v11;
  id v10 = (id)[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:3];
  v196[8] = v10;
  v195[9] = @"megadome_topics";
  v75[0] = @"topicId";
  uint64_t v73 = AMD_SQLITE_TYPE;
  uint64_t v74 = AMD_SQLITE_DATA_TYPE_TEXT;
  id v9 = (id)[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
  v76[0] = v9;
  v75[1] = @"score";
  uint64_t v71 = AMD_SQLITE_TYPE;
  uint64_t v72 = AMD_SQLITE_DATA_TYPE_FLOAT;
  id v8 = (id)[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v76[1] = v8;
  v75[2] = @"most_recent_documentId";
  uint64_t v69 = AMD_SQLITE_TYPE;
  uint64_t v70 = AMD_SQLITE_DATA_TYPE_TEXT;
  id v7 = (id)[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
  v76[2] = v7;
  id v6 = (id)[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:3];
  v196[9] = v6;
  id v4 = (id)[NSDictionary dictionaryWithObjects:v196 forKeys:v195 count:10];
  v198[2] = v4;
  v197[3] = AMD_SQLITE_STREAM_TO_TABLE_MAP;
  v198[3] = &unk_26BEC2C60;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v198 forKeys:v197 count:4];

  return v5;
}

@end