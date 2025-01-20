@interface AMDBiomeIntegration
+ (id)createRowSetFrom:(id)a3 withFetchDescriptor:(id)a4;
+ (id)fetchDataFromStream:(id)a3 usingDescriptor:(id)a4 error:(id *)a5;
+ (id)fetchLatestEventTimestampFromEvents:(id)a3;
+ (id)fetchLatestRowsFromStream:(id)a3 withFields:(id)a4 withBiomeTimestampDict:(id)a5 error:(id *)a6;
+ (id)queryBiomeFor:(id)a3 withError:(id *)a4;
+ (id)queryBiomeStream:(id)a3 withEventFields:(id)a4 fromTimestamp:(id)a5 error:(id *)a6;
+ (id)runBiomeQuery:(id)a3 error:(id *)a4;
@end

@implementation AMDBiomeIntegration

+ (id)queryBiomeFor:(id)a3 withError:(id *)a4
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  id v140 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v138 = a4;
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    log = oslog;
    os_log_type_t v59 = type;
    __os_log_helper_16_0_0(v135);
    _os_log_impl(&dword_20ABD4000, log, v59, "Loading new Biome events", v135, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v134 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!location[0])
  {
    v133 = @"Nil config passed for Biome Data refresh";
    id v4 = +[AMDMiscHelpers logAndCreateError:3 errorMessage:v133];
    id *v138 = v4;
    id v141 = 0;
    int v132 = 1;
    objc_storeStrong((id *)&v133, 0);
    goto LABEL_107;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v131 = @"Invalid payload type passed from the server for Biome Data refresh";
    id v5 = +[AMDMiscHelpers logAndCreateError:3 errorMessage:v131];
    id *v138 = v5;
    id v141 = 0;
    int v132 = 1;
    objc_storeStrong((id *)&v131, 0);
    goto LABEL_107;
  }
  id v130 = location[0];
  id v129 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v128 = +[AMDKVStore fetchValueForKey:@"biome_timestamps_dict" error:v138];
  if (*v138)
  {
    v56 = NSString;
    id v57 = (id)[*v138 localizedDescription];
    id v127 = (id)[v56 stringWithFormat:@"Biome book-keeping dict could not be fetched: %@", v57];

    id v6 = +[AMDMiscHelpers logAndCreateError:3 errorMessage:v127];
    id *v138 = v6;
    id v141 = 0;
    int v132 = 1;
    objc_storeStrong(&v127, 0);
    goto LABEL_106;
  }
  if (!v128)
  {
    id v128 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v126 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  for (unsigned int i = 0; ; ++i)
  {
    unint64_t v55 = (int)i;
    if (v55 >= [v130 count]) {
      break;
    }
    id v124 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v123 = (id)[v130 objectAtIndex:(int)i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v119 = v123;
      id v118 = (id)[v119 objectForKey:@"streamName"];
      id v117 = (id)[v119 objectForKey:@"fieldsRequired"];
      id v116 = (id)[v119 objectForKey:@"type"];
      id v115 = (id)[v119 objectForKey:@"fetchDescriptor"];
      id v114 = (id)[v119 objectForKey:@"persistanceRequired"];
      id v113 = (id)[v119 objectForKey:@"featureTransformations"];
      id v112 = 0;
      if (v116) {
        objc_storeStrong(&v112, v116);
      }
      else {
        objc_storeStrong(&v112, @"RefreshDB");
      }
      if (!v118 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v111 = (id)objc_msgSend(NSString, "stringWithFormat:", @"Stream Name missing/incorrectly formatted in the stream dictionary at index:%d", i);
        os_log_t v110 = (os_log_t)&_os_log_internal;
        os_log_type_t v109 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        {
          v51 = v110;
          os_log_type_t v52 = v109;
          __os_log_helper_16_2_1_8_64((uint64_t)v151, (uint64_t)v111);
          _os_log_error_impl(&dword_20ABD4000, v51, v52, "%@", v151, 0xCu);
        }
        objc_storeStrong((id *)&v110, 0);
        [v124 setObject:v111 forKey:@"biomeError"];
        [v129 addObject:v124];
        int v132 = 4;
        objc_storeStrong(&v111, 0);
        goto LABEL_101;
      }
      id v108 = v118;
      os_log_t v107 = (os_log_t)&_os_log_internal;
      os_log_type_t v106 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
      {
        v49 = v107;
        os_log_type_t v50 = v106;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v150, (uint64_t)v112, (uint64_t)v108);
        _os_log_impl(&dword_20ABD4000, v49, v50, "Running biome query operation: %@ for stream: %@", v150, 0x16u);
      }
      objc_storeStrong((id *)&v107, 0);
      id v105 = 0;
      if (([v112 isEqualToString:@"Retrieve"] & 1) == 0)
      {
        if ([v112 isEqualToString:@"RefreshDB"])
        {
          if (!v117)
          {
            id v71 = (id)objc_msgSend(NSString, "stringWithFormat:", @"Fields required parameter missing in the stream dictionary for the data fetch operation at index: %d", i);
            os_log_t v70 = (os_log_t)&_os_log_internal;
            os_log_type_t v69 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v16 = v70;
              os_log_type_t v17 = v69;
              __os_log_helper_16_2_1_8_64((uint64_t)v143, (uint64_t)v71);
              _os_log_error_impl(&dword_20ABD4000, v16, v17, "%@", v143, 0xCu);
            }
            objc_storeStrong((id *)&v70, 0);
            [v124 setObject:v71 forKey:@"biomeError"];
            [v129 addObject:v124];
            int v132 = 4;
            objc_storeStrong(&v71, 0);
            goto LABEL_100;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v68 = (id)objc_msgSend(NSString, "stringWithFormat:", @"Fields required parameter incorrectly formatted in the stream dictionary at index: %d", i);
            os_log_t v67 = (os_log_t)&_os_log_internal;
            os_log_type_t v66 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              v14 = v67;
              os_log_type_t v15 = v66;
              __os_log_helper_16_2_1_8_64((uint64_t)v142, (uint64_t)v68);
              _os_log_error_impl(&dword_20ABD4000, v14, v15, "%@", v142, 0xCu);
            }
            objc_storeStrong((id *)&v67, 0);
            [v124 setObject:v68 forKey:@"biomeError"];
            [v129 addObject:v124];
            int v132 = 4;
            objc_storeStrong(&v68, 0);
            goto LABEL_100;
          }
          id v65 = v117;
          if ([v65 count])
          {
            id v63 = v105;
            id v13 = (id)[v140 fetchLatestRowsFromStream:v108 withFields:v65 withBiomeTimestampDict:v128 error:&v63];
            objc_storeStrong(&v105, v63);
            id v64 = v13;
            if (v105)
            {
              id v11 = v124;
              id v12 = (id)[v105 localizedDescription];
              objc_msgSend(v11, "setObject:forKey:");

              [v129 addObject:v124];
              int v132 = 4;
            }
            else
            {
              if (v64) {
                [v124 setObject:v64 forKey:v108];
              }
              int v132 = 0;
            }
            objc_storeStrong(&v64, 0);
          }
          else
          {
            [v124 setObject:@"No fields requested" forKey:v108];
            int v132 = 4;
          }
          objc_storeStrong(&v65, 0);
          if (v132) {
            goto LABEL_100;
          }
          goto LABEL_99;
        }
        [v124 setObject:@"Invalid action" forKey:v108];
        [v129 addObject:v124];
        int v132 = 4;
LABEL_100:
        objc_storeStrong(&v105, 0);
        objc_storeStrong(&v108, 0);
LABEL_101:
        objc_storeStrong(&v112, 0);
        objc_storeStrong(&v113, 0);
        objc_storeStrong(&v114, 0);
        objc_storeStrong(&v115, 0);
        objc_storeStrong(&v116, 0);
        objc_storeStrong(&v117, 0);
        objc_storeStrong(&v118, 0);
        objc_storeStrong(&v119, 0);
        goto LABEL_102;
      }
      if (!v115)
      {
        id v104 = (id)objc_msgSend(NSString, "stringWithFormat:", @"Fetch descriptor missing in the stream dictionary for the data aggregation operation at index: %d", i);
        os_log_t v103 = (os_log_t)&_os_log_internal;
        os_log_type_t v102 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          v47 = v103;
          os_log_type_t v48 = v102;
          __os_log_helper_16_2_1_8_64((uint64_t)v149, (uint64_t)v104);
          _os_log_error_impl(&dword_20ABD4000, v47, v48, "%@", v149, 0xCu);
        }
        objc_storeStrong((id *)&v103, 0);
        [v124 setObject:v104 forKey:@"biomeError"];
        [v129 addObject:v124];
        int v132 = 4;
        objc_storeStrong(&v104, 0);
        goto LABEL_100;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v101 = (id)objc_msgSend(NSString, "stringWithFormat:", @"Fetch descriptor dict parameter incorrectly formatted in the stream dictionary at index: %d", i);
        os_log_t v100 = (os_log_t)&_os_log_internal;
        os_log_type_t v99 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v45 = v100;
          os_log_type_t v46 = v99;
          __os_log_helper_16_2_1_8_64((uint64_t)v148, (uint64_t)v101);
          _os_log_error_impl(&dword_20ABD4000, v45, v46, "%@", v148, 0xCu);
        }
        objc_storeStrong((id *)&v100, 0);
        [v124 setObject:v101 forKey:@"biomeError"];
        [v129 addObject:v124];
        int v132 = 4;
        objc_storeStrong(&v101, 0);
        goto LABEL_100;
      }
      char v98 = 0;
      if (v114)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v114 BOOLValue]) {
          char v98 = 1;
        }
      }
      id v97 = v115;
      id v96 = +[AMDSQLite getSharedInstance];
      if (([v96 isUsable] & 1) == 0)
      {
        id v95 = (id)[v96 connectionState];
        id v94 = (id)[NSString stringWithFormat:@"SQLite database is not usable: %@", v95];
        os_log_t v93 = (os_log_t)&_os_log_internal;
        os_log_type_t v92 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          v43 = v93;
          os_log_type_t v44 = v92;
          __os_log_helper_16_2_1_8_64((uint64_t)v147, (uint64_t)v94);
          _os_log_error_impl(&dword_20ABD4000, v43, v44, "%@", v147, 0xCu);
        }
        objc_storeStrong((id *)&v93, 0);
        [v124 setObject:v94 forKey:v108];
        [v129 addObject:v124];
        int v132 = 4;
        objc_storeStrong(&v94, 0);
        objc_storeStrong(&v95, 0);
LABEL_77:
        objc_storeStrong(&v96, 0);
        objc_storeStrong(&v97, 0);
        if (!v132) {
LABEL_99:
        }
          int v132 = 0;
        goto LABEL_100;
      }
      v40 = [AMDFetchDescriptor alloc];
      id v39 = v97;
      id v42 = (id)[v96 getDataSchema];
      id v90 = v105;
      v41 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v40, "initWithDict:usingSchema:error:", v39);
      objc_storeStrong(&v105, v90);
      id v91 = v41;

      if (v105)
      {
        os_log_t v89 = (os_log_t)&_os_log_internal;
        os_log_type_t v88 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        {
          v36 = v89;
          os_log_type_t v37 = v88;
          id v38 = (id)[v105 localizedDescription];
          id v87 = v38;
          __os_log_helper_16_2_1_8_64((uint64_t)v146, (uint64_t)v87);
          _os_log_error_impl(&dword_20ABD4000, v36, v37, "%@", v146, 0xCu);

          objc_storeStrong(&v87, 0);
        }
        objc_storeStrong((id *)&v89, 0);
        id v34 = v124;
        id v35 = (id)[v105 localizedDescription];
        objc_msgSend(v34, "setObject:forKey:");

        [v129 addObject:v124];
        int v132 = 4;
        goto LABEL_76;
      }
      if (!v91)
      {
        v86 = @"Internal logic error: Nil Fetch descriptor object";
        os_log_t v85 = (os_log_t)&_os_log_internal;
        os_log_type_t v84 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          v32 = v85;
          os_log_type_t v33 = v84;
          __os_log_helper_16_2_1_8_64((uint64_t)v145, (uint64_t)v86);
          _os_log_error_impl(&dword_20ABD4000, v32, v33, "%@", v145, 0xCu);
        }
        objc_storeStrong((id *)&v85, 0);
        [v124 setObject:v86 forKey:v108];
        [v129 addObject:v124];
        int v132 = 4;
        objc_storeStrong((id *)&v86, 0);
        goto LABEL_76;
      }
      id v82 = v105;
      id v31 = (id)[v140 fetchDataFromStream:v108 usingDescriptor:v91 error:&v82];
      objc_storeStrong(&v105, v82);
      id v83 = v31;
      if (v105)
      {
        os_log_t v81 = (os_log_t)&_os_log_internal;
        os_log_type_t v80 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          v28 = v81;
          os_log_type_t v29 = v80;
          id v30 = (id)[v105 localizedDescription];
          id v79 = v30;
          __os_log_helper_16_2_1_8_64((uint64_t)v144, (uint64_t)v79);
          _os_log_error_impl(&dword_20ABD4000, v28, v29, "%@", v144, 0xCu);

          objc_storeStrong(&v79, 0);
        }
        objc_storeStrong((id *)&v81, 0);
        id v26 = v124;
        id v27 = (id)[v105 localizedDescription];
        objc_msgSend(v26, "setObject:forKey:");

        [v129 addObject:v124];
        int v132 = 4;
      }
      else if (v83)
      {
        if (v98)
        {
          id v74 = v105;
          id v23 = (id)[v91 persist:v83 error:&v74];
          objc_storeStrong(&v105, v74);
          id v75 = v23;
          if (v105)
          {
            id v21 = v124;
            id v22 = (id)[v105 localizedDescription];
            objc_msgSend(v21, "setObject:forKey:");

            [v129 addObject:v124];
            int v132 = 4;
          }
          else
          {
            if (v75) {
              [v124 setObject:v75 forKey:@"resultSetPersistSummary"];
            }
            int v132 = 0;
          }
          objc_storeStrong(&v75, 0);
          if (v132) {
            goto LABEL_75;
          }
        }
        else
        {
          id v73 = 0;
          if (v113)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_storeStrong(&v73, v113);
            }
          }
          id v72 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v72 setObject:v83 forKey:@"featureData"];
          if (v73) {
            [v72 setObject:v73 forKey:@"featureTransformations"];
          }
          id v19 = v126;
          id v18 = v72;
          id v20 = (id)[v91 getId];
          objc_msgSend(v19, "setObject:forKey:", v18);

          objc_storeStrong(&v72, 0);
          objc_storeStrong(&v73, 0);
        }
        int v132 = 0;
      }
      else
      {
        os_log_t v78 = (os_log_t)&_os_log_internal;
        os_log_type_t v77 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v24 = v78;
          os_log_type_t v25 = v77;
          __os_log_helper_16_0_0(v76);
          _os_log_error_impl(&dword_20ABD4000, v24, v25, "Nil rowset returned", v76, 2u);
        }
        objc_storeStrong((id *)&v78, 0);
        [v124 setObject:@"Nil rowset for aggregation" forKey:v108];
        [v129 addObject:v124];
        int v132 = 4;
      }
LABEL_75:
      objc_storeStrong(&v83, 0);
LABEL_76:
      objc_storeStrong(&v91, 0);
      goto LABEL_77;
    }
    id v122 = (id)objc_msgSend(NSString, "stringWithFormat:", @"Biome stream object not a dictionary at index:%d", i);
    os_log_t v121 = (os_log_t)&_os_log_internal;
    os_log_type_t v120 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
    {
      v53 = v121;
      os_log_type_t v54 = v120;
      __os_log_helper_16_2_1_8_64((uint64_t)v152, (uint64_t)v122);
      _os_log_error_impl(&dword_20ABD4000, v53, v54, "%@", v152, 0xCu);
    }
    objc_storeStrong((id *)&v121, 0);
    [v124 setObject:v122 forKey:@"biomeError"];
    [v129 addObject:v124];
    int v132 = 4;
    objc_storeStrong(&v122, 0);
LABEL_102:
    objc_storeStrong(&v123, 0);
    objc_storeStrong(&v124, 0);
  }
  id v62 = 0;
  id v61 = 0;
  +[AMDKVStore setValue:v128 forKey:@"biome_timestamps_dict" error:&v61];
  objc_storeStrong(&v62, v61);
  if (v62)
  {
    id v9 = v134;
    id v10 = (id)[v62 localizedDescription];
    objc_msgSend(v9, "setObject:forKey:");
  }
  [v134 setObject:v129 forKey:@"biomeUpdateSummaries"];
  +[AMDFrameworkMetrics log:v134 withKey:@"biomeQuerySummary" atVerbosity:0];
  id v141 = v126;
  int v132 = 1;
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v126, 0);
LABEL_106:
  objc_storeStrong(&v128, 0);
  objc_storeStrong(&v129, 0);
  objc_storeStrong(&v130, 0);
LABEL_107:
  objc_storeStrong(&v134, 0);
  objc_storeStrong(location, 0);
  v7 = v141;

  return v7;
}

+ (id)queryBiomeStream:(id)a3 withEventFields:(id)a4 fromTimestamp:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v23 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  id v19 = a6;
  id v18 = (id)[v21 componentsJoinedByString:@", "];
  id v17 = (id)[NSString stringWithFormat:@"SELECT %@ FROM %@", v18, location[0]];
  if (v20)
  {
    id v11 = NSString;
    [v20 doubleValue];
    id v12 = (id)objc_msgSend(v11, "stringWithFormat:", @" WHERE eventTimestamp > %f", v6);
    id v7 = (id)objc_msgSend(v17, "stringByAppendingString:");
    id v8 = v17;
    id v17 = v7;
  }
  id v16 = &_os_log_internal;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)v17);
    _os_log_impl(&dword_20ABD4000, (os_log_t)v16, OS_LOG_TYPE_INFO, "Query string for biome data fetch operation: %@", v24, 0xCu);
  }
  objc_storeStrong(&v16, 0);
  id v10 = (id)[v23 runBiomeQuery:v17 error:v19];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);

  return v10;
}

+ (id)fetchLatestEventTimestampFromEvents:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v18 = -1.0;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v14)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v14;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(__b[1] + 8 * v11);
      double v15 = v18;
      id v7 = (id)[v17 objectForKey:@"eventTimestamp"];
      [v7 doubleValue];
      double v8 = v3;

      if (v15 >= v8) {
        double v6 = v15;
      }
      else {
        double v6 = v8;
      }
      double v18 = v6;
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  if (v18 >= 0.0) {
    id v20 = (id)[NSNumber numberWithDouble:v18];
  }
  else {
    id v20 = 0;
  }
  objc_storeStrong(location, 0);
  id v4 = v20;

  return v4;
}

+ (id)runBiomeQuery:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = a4;
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v17 = objc_alloc_init(MEMORY[0x263F2A8E0]);
  id v16 = (id)[v17 executeQuery:@"%@", location[0]];
  while (([v16 next] & 1) != 0)
  {
    id v4 = (id)[v16 row];
    BOOL v13 = v4 == 0;

    if (!v13)
    {
      id v12 = (id)[v16 row];
      objc_msgSend(v18, "addObject:");
    }
  }
  id v11 = (id)[v16 error];

  if (v11)
  {
    double v8 = NSString;
    id v10 = (id)[v16 error];
    id v9 = (id)[v10 localizedDescription];
    id v15 = (id)[v8 stringWithFormat:@"Biome query failure: %@", v9];

    id v5 = +[AMDMiscHelpers logAndCreateError:3 errorMessage:v15];
    *id v19 = v5;
    id v21 = 0;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v21 = v18;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  double v6 = v21;

  return v6;
}

+ (id)fetchLatestRowsFromStream:(id)a3 withFields:(id)a4 withBiomeTimestampDict:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v33 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  os_log_type_t v29 = a6;
  id v28 = (id)[v30 objectForKey:location[0]];
  id v27 = (id)[v33 queryBiomeStream:location[0] withEventFields:v31 fromTimestamp:v28 error:a6];
  if (*a6)
  {
    id v34 = 0;
    int v26 = 1;
  }
  else
  {
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(__b, 0, sizeof(__b));
    id v14 = v27;
    uint64_t v15 = [v14 countByEnumeratingWithState:__b objects:v37 count:16];
    if (v15)
    {
      uint64_t v11 = *(void *)__b[2];
      uint64_t v12 = 0;
      unint64_t v13 = v15;
      while (1)
      {
        uint64_t v10 = v12;
        if (*(void *)__b[2] != v11) {
          objc_enumerationMutation(v14);
        }
        id v24 = *(id *)(__b[1] + 8 * v12);
        id v22 = (id)[v24 mutableCopy];
        id v8 = v22;
        id v9 = (id)[v22 objectForKey:@"eventTimestamp"];
        objc_msgSend(v8, "setObject:forKey:");

        [v25 addObject:v22];
        objc_storeStrong(&v22, 0);
        ++v12;
        if (v10 + 1 >= v13)
        {
          uint64_t v12 = 0;
          unint64_t v13 = [v14 countByEnumeratingWithState:__b objects:v37 count:16];
          if (!v13) {
            break;
          }
        }
      }
    }

    v35[0] = 0x26BEAEC38;
    v36[0] = location[0];
    v35[1] = 0x26BEAEC18;
    v36[1] = v25;
    id v21 = (id)[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    id v20 = +[AMDSQLite saveEvents:v21 error:v29];
    if (*v29)
    {
      id v34 = 0;
      int v26 = 1;
    }
    else
    {
      id v19 = (id)[v33 fetchLatestEventTimestampFromEvents:v27];
      if (v19) {
        [v30 setObject:v19 forKey:location[0]];
      }
      id v34 = v20;
      int v26 = 1;
      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v25, 0);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  double v6 = v34;

  return v6;
}

+ (id)fetchDataFromStream:(id)a3 usingDescriptor:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v18 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  uint64_t v15 = a5;
  id v14 = (id)[v16 getStatement];
  id v13 = &_os_log_internal;
  os_log_type_t v12 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)v14);
    _os_log_impl(&dword_20ABD4000, (os_log_t)v13, v12, "Biome SQL Query statement: %@", v20, 0xCu);
  }
  objc_storeStrong(&v13, 0);
  id v11 = (id)[v18 runBiomeQuery:v14 error:v15];
  if (*v15)
  {
    id v19 = 0;
    int v10 = 1;
  }
  else if (v11)
  {
    id v9 = (id)[v18 createRowSetFrom:v11 withFetchDescriptor:v16];
    id v19 = v9;
    int v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    id v19 = 0;
    int v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  id v5 = v19;

  return v5;
}

+ (id)createRowSetFrom:(id)a3 withFetchDescriptor:(id)a4
{
  v41[2] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  id v34 = (id)[v35 getColumnSpecs];
  id v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v34, "count"));
  uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v34, "count"));
  for (unsigned int i = 0; ; ++i)
  {
    unint64_t v19 = i;
    if (v19 >= [v34 count]) {
      break;
    }
    id v30 = (id)[v34 objectAtIndex:i];
    id v29 = (id)[v30 getSelectColumnName];
    id v28 = (id)[v30 getTypeString];
    id v14 = (id)v32;
    v40[0] = @"name";
    v41[0] = v29;
    v40[1] = AMD_SQLITE_TYPE;
    v41[1] = v28;
    id v15 = (id)[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    objc_msgSend(v14, "addObject:");

    id v17 = v33;
    id v16 = objc_alloc(MEMORY[0x263EFF980]);
    id v18 = (id)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(location[0], "count"));
    objc_msgSend(v17, "addObject:");

    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  memset(__b, 0, sizeof(__b));
  id v12 = location[0];
  uint64_t v13 = [v12 countByEnumeratingWithState:__b objects:v39 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(v12);
      }
      id v27 = *(id *)(__b[1] + 8 * v10);
      for (unsigned int j = 0; ; ++j)
      {
        unint64_t v7 = j;
        if (v7 >= [v34 count]) {
          break;
        }
        id v24 = (id)[v34 objectAtIndex:j];
        id v23 = (id)[v24 getSelectColumnName];
        id v22 = (id)[v27 objectForKey:v23];
        id v6 = (id)[v33 objectAtIndex:j];
        [v6 addObject:v22];

        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [v12 countByEnumeratingWithState:__b objects:v39 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  v37[0] = 0x26BEAEE38;
  v38[0] = v32;
  v37[1] = 0x26BEAEE58;
  v38[1] = v33;
  id v21 = (id)[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  id v5 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);

  return v5;
}

@end