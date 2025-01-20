@interface AMDJSConfigProcessor
+ (id)getBinariesToFetch:(id)a3 withCurrentColdstartInfo:(id)a4 andAMDColdstartBinariesToDelete:(id)a5 andSummaryContainer:(id)a6;
+ (id)getModelsToFetch:(id)a3 withCurrentModelInfo:(id)a4 andAMDModlsToDelete:(id)a5 andSummaryContainer:(id)a6;
+ (id)getUrlsWithVersion:(id)a3;
+ (id)processConfig:(id)a3 withCallUUID:(id)a4 error:(id *)a5;
+ (id)refreshDescriptors:(id)a3 forDomain:(id)a4;
+ (id)saveInAppSegmentsWorkflow:(id)a3 inDomain:(id)a4 withCallUUID:(id)a5 andSummaryContainer:(id)a6;
+ (id)saveInFlightWorkflows:(id)a3 forModels:(id)a4 inDomain:(id)a5 withCallUUID:(id)a6 error:(id *)a7;
+ (id)validateConfig:(id)a3 forDomain:(id)a4;
@end

@implementation AMDJSConfigProcessor

+ (id)processConfig:(id)a3 withCallUUID:(id)a4 error:(id *)a5
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v119 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v117 = 0;
  objc_storeStrong(&v117, a4);
  v116 = a5;
  id v115 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v114 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v113 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v112 = (id)[location[0] objectForKey:@"version"];
  if (v112) {
    v48 = (__CFString *)v112;
  }
  else {
    v48 = @"-1";
  }
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v48, @"configVersion");
  memset(__b, 0, sizeof(__b));
  id v46 = location[0];
  uint64_t v47 = [v46 countByEnumeratingWithState:__b objects:v132 count:16];
  if (v47)
  {
    uint64_t v43 = *(void *)__b[2];
    uint64_t v44 = 0;
    unint64_t v45 = v47;
    while (1)
    {
      uint64_t v42 = v44;
      if (*(void *)__b[2] != v43) {
        objc_enumerationMutation(v46);
      }
      uint64_t v111 = *(void *)(__b[1] + 8 * v44);
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        os_log_type_t v41 = type;
        __os_log_helper_16_2_1_8_64((uint64_t)v131, v111);
        _os_log_impl(&dword_20ABD4000, log, v41, "Processing config for domain '%@'", v131, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v107 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v106 = @"error";
      int64_t v105 = 0;
      int64_t v105 = +[AMDDomains getCodeForDomain:v111];
      if (v105)
      {
        id v100 = (id)[location[0] objectForKey:v111];
        if (v100)
        {
          id v96 = (id)[v119 validateConfig:v100 forDomain:v111];
          if (v96)
          {
            id v95 = (id)[NSString stringWithFormat:@"Bad config: %@", v96];
            os_log_t v94 = (os_log_t)&_os_log_internal;
            os_log_type_t v93 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            {
              v34 = v94;
              os_log_type_t v35 = v93;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v128, v111, (uint64_t)v95);
              _os_log_error_impl(&dword_20ABD4000, v34, v35, "%@: %@", v128, 0x16u);
            }
            objc_storeStrong((id *)&v94, 0);
            [v107 setObject:v95 forKey:v106];
            int v101 = 3;
            objc_storeStrong(&v95, 0);
          }
          else
          {
            id v92 = (id)[v100 objectForKey:0x26BEB8698];
            if (!v92 || ![v92 count])
            {
              os_log_t v91 = (os_log_t)&_os_log_internal;
              os_log_type_t v90 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
              {
                v32 = v91;
                os_log_type_t v33 = v90;
                __os_log_helper_16_0_0(v89);
                _os_log_impl(&dword_20ABD4000, v32, v33, "V3 model url bag not present or is empty", v89, 2u);
              }
              objc_storeStrong((id *)&v91, 0);
              id v5 = (id)[v100 objectForKey:0x26BEB8678];
              id v6 = v92;
              id v92 = v5;

              if (!v92 || ![v92 count])
              {
                os_log_t v88 = (os_log_t)&_os_log_internal;
                os_log_type_t v87 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
                {
                  v30 = v88;
                  os_log_type_t v31 = v87;
                  __os_log_helper_16_0_0(v86);
                  _os_log_impl(&dword_20ABD4000, v30, v31, "V2 model url bag not present or is empty", v86, 2u);
                }
                objc_storeStrong((id *)&v88, 0);
                id v7 = (id)[v100 objectForKey:0x26BEB8658];
                id v8 = v92;
                id v92 = v7;
              }
            }
            if (v92)
            {
              id v82 = (id)[v100 objectForKey:0x26BEB8558];
              if (!v82)
              {
                id v81 = @"No coldstart urls";
                os_log_t v80 = (os_log_t)&_os_log_internal;
                os_log_type_t v79 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                {
                  v26 = v80;
                  os_log_type_t v27 = v79;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v126, v111, (uint64_t)v81);
                  _os_log_error_impl(&dword_20ABD4000, v26, v27, "%@: %@", v126, 0x16u);
                }
                objc_storeStrong((id *)&v80, 0);
                objc_storeStrong(&v81, 0);
              }
              os_log_t v78 = (os_log_t)&_os_log_internal;
              os_log_type_t v77 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
              {
                v23 = v78;
                os_log_type_t v24 = v77;
                uint64_t v22 = [v92 count];
                id v25 = (id)[v92 allKeys];
                id v76 = v25;
                __os_log_helper_16_2_2_8_0_8_64((uint64_t)v125, v22, (uint64_t)v76);
                _os_log_debug_impl(&dword_20ABD4000, v23, v24, "ModelIds in config (%lu): %@", v125, 0x16u);

                objc_storeStrong(&v76, 0);
              }
              objc_storeStrong((id *)&v78, 0);
              id v75 = 0;
              id v73 = 0;
              id v21 = +[AMDWorkflow performWorkflowCleanupForDomain:v105 error:&v73];
              objc_storeStrong(&v75, v73);
              id v74 = v21;
              if (v75)
              {
                v72 = @"Error performing treatment workflow cleanup";
                os_log_t v71 = (os_log_t)&_os_log_internal;
                os_log_type_t v70 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                {
                  v19 = v71;
                  os_log_type_t v20 = v70;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v124, v111, (uint64_t)v72);
                  _os_log_error_impl(&dword_20ABD4000, v19, v20, "%@: %@", v124, 0x16u);
                }
                objc_storeStrong((id *)&v71, 0);
                [v107 setObject:v72 forKey:@"treatmentWorkflowCleanupError"];
                objc_storeStrong((id *)&v72, 0);
              }
              if (v74) {
                [v107 setObject:v74 forKey:@"treatmentWorkflowsDeleted"];
              }
              else {
                [v107 setObject:MEMORY[0x263EFFA68] forKey:@"treatmentWorkflowsDeleted"];
              }
              id v17 = v107;
              id v18 = (id)[v119 refreshDescriptors:v100 forDomain:v111];
              objc_msgSend(v17, "setObject:forKey:");

              id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
              id v68 = (id)[v119 saveInAppSegmentsWorkflow:v100 inDomain:v111 withCallUUID:v117 andSummaryContainer:v69];
              [v107 setObject:v69 forKey:0x26BEB8FB8];
              if ([v68 count])
              {
                id v64 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                id v63 = objc_alloc_init(MEMORY[0x263EFF980]);
                id v62 = +[AMDModel getCurrentModelInfoByModelId];
                id v61 = (id)[v119 getModelsToFetch:v92 withCurrentModelInfo:v62 andAMDModlsToDelete:v63 andSummaryContainer:v64];
                id v60 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
                id v58 = +[AMDColdstartURL getCurrentURLInfoByModelId];
                id v57 = (id)[v119 getBinariesToFetch:v82 withCurrentColdstartInfo:v58 andAMDColdstartBinariesToDelete:v59 andSummaryContainer:v60];
                id v56 = (id)[v119 saveInFlightWorkflows:v68 forModels:v61 inDomain:v111 withCallUUID:v117 error:v116];
                if (*v116)
                {
                  v13 = NSString;
                  id v14 = (id)[*v116 localizedDescription];
                  id v55 = (id)[v13 stringWithFormat:@"Error saving in-flight workflows: %@", v14];

                  os_log_t v54 = (os_log_t)&_os_log_internal;
                  os_log_type_t v53 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    v11 = v54;
                    os_log_type_t v12 = v53;
                    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v122, v111, (uint64_t)v55);
                    _os_log_error_impl(&dword_20ABD4000, v11, v12, "%@: %@", v122, 0x16u);
                  }
                  objc_storeStrong((id *)&v54, 0);
                  [v107 setObject:v55 forKey:v106];
                  id *v116 = 0;
                  int v101 = 3;
                  objc_storeStrong(&v55, 0);
                }
                else
                {
                  id v52 = +[AMDModelDownloader removeOldModels:v63];
                  id v51 = +[AMDModelDownloader removeOldColdstartBinaries:v59];
                  [v107 setObject:v52 forKey:0x26BEB4018];
                  [v107 setObject:v51 forKey:0x26BEB8F18];
                  [v107 setObject:v56 forKey:0x26BEB8F58];
                  [v107 setObject:v64 forKey:0x26BEB8F98];
                  [v115 setObject:v107 forKey:0x26BEB8F78];
                  [v114 setObject:v61 forKey:v111];
                  [v113 setObject:v57 forKey:v111];
                  objc_storeStrong(&v51, 0);
                  objc_storeStrong(&v52, 0);
                  int v101 = 0;
                }
                objc_storeStrong(&v56, 0);
                objc_storeStrong(&v57, 0);
                objc_storeStrong(&v58, 0);
                objc_storeStrong(&v59, 0);
                objc_storeStrong(&v60, 0);
                objc_storeStrong(&v61, 0);
                objc_storeStrong(&v62, 0);
                objc_storeStrong(&v63, 0);
                objc_storeStrong(&v64, 0);
              }
              else
              {
                v67 = @"No inference workflows";
                os_log_t v66 = (os_log_t)&_os_log_internal;
                os_log_type_t v65 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  v15 = v66;
                  os_log_type_t v16 = v65;
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v123, v111, (uint64_t)v67);
                  _os_log_error_impl(&dword_20ABD4000, v15, v16, "%@: %@", v123, 0x16u);
                }
                objc_storeStrong((id *)&v66, 0);
                [v107 setObject:v67 forKey:v106];
                int v101 = 3;
                objc_storeStrong((id *)&v67, 0);
              }
              objc_storeStrong(&v68, 0);
              objc_storeStrong(&v69, 0);
              objc_storeStrong(&v74, 0);
              objc_storeStrong(&v75, 0);
              objc_storeStrong(&v82, 0);
            }
            else
            {
              v85 = @"No model urls";
              os_log_t v84 = (os_log_t)&_os_log_internal;
              os_log_type_t v83 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              {
                v28 = v84;
                os_log_type_t v29 = v83;
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v127, v111, (uint64_t)v85);
                _os_log_error_impl(&dword_20ABD4000, v28, v29, "%@: %@", v127, 0x16u);
              }
              objc_storeStrong((id *)&v84, 0);
              [v107 setObject:v85 forKey:v106];
              int v101 = 3;
              objc_storeStrong((id *)&v85, 0);
            }
            objc_storeStrong(&v92, 0);
          }
          objc_storeStrong(&v96, 0);
        }
        else
        {
          v99 = @"No config";
          os_log_t v98 = (os_log_t)&_os_log_internal;
          os_log_type_t v97 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            v36 = v98;
            os_log_type_t v37 = v97;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v129, v111, (uint64_t)v99);
            _os_log_error_impl(&dword_20ABD4000, v36, v37, "%@: %@", v129, 0x16u);
          }
          objc_storeStrong((id *)&v98, 0);
          [v107 setObject:v99 forKey:v106];
          int v101 = 3;
          objc_storeStrong((id *)&v99, 0);
        }
        objc_storeStrong(&v100, 0);
      }
      else
      {
        v104 = @"Invalid domain";
        os_log_t v103 = (os_log_t)&_os_log_internal;
        os_log_type_t v102 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          v38 = v103;
          os_log_type_t v39 = v102;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v130, v111, (uint64_t)v104);
          _os_log_error_impl(&dword_20ABD4000, v38, v39, "%@: %@", v130, 0x16u);
        }
        objc_storeStrong((id *)&v103, 0);
        [v107 setObject:v104 forKey:v106];
        int v101 = 3;
        objc_storeStrong((id *)&v104, 0);
      }
      objc_storeStrong(&v106, 0);
      objc_storeStrong(&v107, 0);
      ++v44;
      if (v42 + 1 >= v45)
      {
        uint64_t v44 = 0;
        unint64_t v45 = [v46 countByEnumeratingWithState:__b objects:v132 count:16];
        if (!v45) {
          break;
        }
      }
    }
  }

  v120[0] = @"summary";
  v121[0] = v115;
  v120[1] = @"modelDownloadInfo";
  v121[1] = v114;
  v120[2] = @"coldstartBinaryDownloadInfo";
  v121[2] = v113;
  id v10 = (id)[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:3];
  int v101 = 1;
  objc_storeStrong(&v112, 0);
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(location, 0);

  return v10;
}

+ (id)refreshDescriptors:(id)a3 forDomain:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = &_os_log_internal;
  os_log_type_t v23 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v25);
    _os_log_impl(&dword_20ABD4000, (os_log_t)v24, v23, "Refreshing aggregation descriptors for domain '%@'", v33, 0xCu);
  }
  objc_storeStrong(&v24, 0);
  id v22 = 0;
  id v21 = (id)[location[0] objectForKey:0x26BEB84F8];
  id v20 = 0;
  if (v21)
  {
    id v19 = v20;
    id v10 = +[AMDDescriptor refreshDescriptors:forDomain:error:](AMDDescriptor, "refreshDescriptors:forDomain:error:", v21, +[AMDDomains getCodeForDomain:v25], &v19);
    objc_storeStrong(&v20, v19);
    id v4 = v22;
    id v22 = v10;

    if (v20)
    {
      id v18 = (id)[v20 localizedDescription];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v32, (uint64_t)v25, (uint64_t)v18);
        _os_log_impl(&dword_20ABD4000, oslog, v16, "Error saving descriptors for domain '%@': %@", v32, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v30 = @"error";
      id v31 = v18;
      id v5 = (id)[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      id v6 = v22;
      id v22 = v5;

      objc_storeStrong(&v18, 0);
    }
  }
  else
  {
    os_log_t v15 = (os_log_t)&_os_log_internal;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v25);
      _os_log_impl(&dword_20ABD4000, v15, v14, "No descriptors for domain '%@'", v29, 0xCu);
    }
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v22, &unk_26BEC27B0);
  }
  id v12 = v20;
  id v8 = +[AMDFetchDescriptor refreshAggregationDescriptors:location[0] forDomain:v25 error:&v12];
  objc_storeStrong(&v20, v12);
  id v13 = v8;
  v27[0] = @"coreData";
  v28[0] = v22;
  v27[1] = @"SQLite";
  v28[1] = v8;
  id v9 = (id)[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);

  return v9;
}

+ (id)validateConfig:(id)a3 forDomain:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  os_log_t oslog = (os_log_t)&_os_log_internal;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v7);
    _os_log_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_INFO, "Validating config for domain '%@'", v9, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return 0;
}

+ (id)saveInAppSegmentsWorkflow:(id)a3 inDomain:(id)a4 withCallUUID:(id)a5 andSummaryContainer:(id)a6
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v65 = 0;
  objc_storeStrong(&v65, a4);
  id v64 = 0;
  objc_storeStrong(&v64, a5);
  id v63 = 0;
  objc_storeStrong(&v63, a6);
  id v62 = (id)[location[0] objectForKey:0x26BEB87F8];
  if (v62 && [v62 count])
  {
    id v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v62, "count"));
    memset(__b, 0, sizeof(__b));
    id v32 = v62;
    uint64_t v33 = [v32 countByEnumeratingWithState:__b objects:v70 count:16];
    if (v33)
    {
      uint64_t v29 = *(void *)__b[2];
      uint64_t v30 = 0;
      unint64_t v31 = v33;
      while (1)
      {
        uint64_t v28 = v30;
        if (*(void *)__b[2] != v29) {
          objc_enumerationMutation(v32);
        }
        id v57 = *(id *)(__b[1] + 8 * v30);
        id v55 = (id)[v57 mutableCopy];
        id v26 = (id)[v55 objectForKey:@"use_case_id"];
        char v27 = objc_msgSend(@"__segmentAggregator", "isEqualToString:");

        if (v27)
        {
          [v55 setObject:0x26BEB06F8 forKey:@"model_id"];
          id v54 = 0;
          id v25 = v55;
          int64_t v6 = +[AMDDomains getCodeForDomain:v65];
          id v53 = v54;
          +[AMDWorkflow saveWorkflow:v25 forDomain:v6 withCallUUID:v64 error:&v53];
          objc_storeStrong(&v54, v53);
          if (v54)
          {
            os_log_t v52 = (os_log_t)&_os_log_internal;
            os_log_type_t v51 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              id v22 = v52;
              os_log_type_t v23 = v51;
              id v24 = (id)[v54 localizedDescription];
              id v50 = v24;
              __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v50);
              _os_log_error_impl(&dword_20ABD4000, v22, v23, "Error saving workflow: %@", v69, 0xCu);

              objc_storeStrong(&v50, 0);
            }
            objc_storeStrong((id *)&v52, 0);
            int v59 = 3;
          }
          else
          {
            id v49 = (id)[v55 objectForKey:@"treatment_id"];
            if (v49) {
              id v21 = v49;
            }
            else {
              id v21 = @"__defaultTreatment";
            }
            objc_storeStrong(&v49, v21);
            [v63 addObject:v49];
            int v59 = 3;
            objc_storeStrong(&v49, 0);
          }
          objc_storeStrong(&v54, 0);
        }
        else
        {
          id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
          id v47 = (id)[v55 objectForKey:@"model_id"];
          if (v47)
          {
            [v48 addObject:v47];
            id v43 = (id)[v55 objectForKey:@"secondary_model_id"];
            if (v43)
            {
              os_log_t v42 = (os_log_t)&_os_log_internal;
              os_log_type_t v41 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                id v17 = v42;
                os_log_type_t v18 = v41;
                __os_log_helper_16_0_0(v40);
                _os_log_impl(&dword_20ABD4000, v17, v18, "Secondary model Id available for current workflow", v40, 2u);
              }
              objc_storeStrong((id *)&v42, 0);
              [v48 addObject:v43];
            }
            memset(v38, 0, sizeof(v38));
            id v15 = v48;
            uint64_t v16 = [v15 countByEnumeratingWithState:v38 objects:v68 count:16];
            if (v16)
            {
              uint64_t v12 = *(void *)v38[2];
              uint64_t v13 = 0;
              unint64_t v14 = v16;
              while (1)
              {
                uint64_t v11 = v13;
                if (*(void *)v38[2] != v12) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v39 = *(void *)(v38[1] + 8 * v13);
                id v37 = (id)[v58 objectForKey:v39];
                if (!v37)
                {
                  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
                  id v8 = v37;
                  id v37 = v7;
                }
                [v37 addObject:v55];
                [v58 setObject:v37 forKey:v39];
                objc_storeStrong(&v37, 0);
                ++v13;
                if (v11 + 1 >= v14)
                {
                  uint64_t v13 = 0;
                  unint64_t v14 = [v15 countByEnumeratingWithState:v38 objects:v68 count:16];
                  if (!v14) {
                    break;
                  }
                }
              }
            }

            objc_storeStrong(&v43, 0);
            int v59 = 0;
          }
          else
          {
            os_log_t v46 = (os_log_t)&_os_log_internal;
            os_log_type_t v45 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              id v19 = v46;
              os_log_type_t v20 = v45;
              __os_log_helper_16_0_0(v44);
              _os_log_error_impl(&dword_20ABD4000, v19, v20, "Programmer error: no modelId for workflow", v44, 2u);
            }
            objc_storeStrong((id *)&v46, 0);
            int v59 = 3;
          }
          objc_storeStrong(&v47, 0);
          objc_storeStrong(&v48, 0);
        }
        objc_storeStrong(&v55, 0);
        ++v30;
        if (v28 + 1 >= v31)
        {
          uint64_t v30 = 0;
          unint64_t v31 = [v32 countByEnumeratingWithState:__b objects:v70 count:16];
          if (!v31) {
            break;
          }
        }
      }
    }

    id v67 = v58;
    int v59 = 1;
    objc_storeStrong(&v58, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v65);
      _os_log_error_impl(&dword_20ABD4000, oslog, type, "No workflows for domain '%@'", v71, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v67 = MEMORY[0x263EFFA78];
    int v59 = 1;
  }
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(location, 0);
  id v9 = v67;

  return v9;
}

+ (id)getModelsToFetch:(id)a3 withCurrentModelInfo:(id)a4 andAMDModlsToDelete:(id)a5 andSummaryContainer:(id)a6
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v85 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v83 = 0;
  objc_storeStrong(&v83, a4);
  id v82 = 0;
  objc_storeStrong(&v82, a5);
  id v81 = 0;
  objc_storeStrong(&v81, a6);
  id v80 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v79 = (id)[v85 getUrlsWithVersion:location[0]];
  id v78 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id v48 = v79;
  uint64_t v49 = [v48 countByEnumeratingWithState:__b objects:v100 count:16];
  if (v49)
  {
    uint64_t v42 = *(void *)__b[2];
    uint64_t v43 = 0;
    unint64_t v44 = v49;
    while (1)
    {
      uint64_t v41 = v43;
      if (*(void *)__b[2] != v42) {
        objc_enumerationMutation(v48);
      }
      uint64_t v77 = *(void *)(__b[1] + 8 * v43);
      id v75 = (id)[v79 objectForKey:v77];
      id v74 = (id)[v75 objectAtIndexedSubscript:0];
      id v73 = (id)[v75 objectAtIndexedSubscript:1];
      id v72 = (id)[v83 objectForKey:v77];
      if (v72)
      {
        id v69 = (id)[v72 objectForKey:0x26BEACCB8];
        if ([v69 isEqualToString:v73])
        {
          id v66 = (id)[v72 objectForKey:0x26BEB09F8];
          id v31 = (id)[MEMORY[0x263F08850] defaultManager];
          char v32 = [v31 fileExistsAtPath:v66];

          if (v32)
          {
            [v78 addObject:v77];
            id v63 = &_os_log_internal;
            os_log_type_t v62 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEBUG))
            {
              id v26 = v63;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v90, v77, (uint64_t)v73);
              _os_log_debug_impl(&dword_20ABD4000, v26, v62, "Existing model found:%@, version:%@", v90, 0x16u);
            }
            objc_storeStrong(&v63, 0);
          }
          else
          {
            id v65 = &_os_log_internal;
            os_log_type_t v64 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v29 = v65;
              os_log_type_t v30 = v64;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v93, v77, (uint64_t)v66);
              _os_log_debug_impl(&dword_20ABD4000, v29, v30, "No model found:%@, at location:%@, downloading the model again", v93, 0x16u);
            }
            objc_storeStrong(&v65, 0);
            id v27 = v80;
            v91[0] = 0x26BEB09F8;
            v92[0] = v74;
            v91[1] = 0x26BEACCB8;
            v92[1] = v73;
            id v28 = (id)[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
            objc_msgSend(v27, "setObject:forKey:");

            [v82 addObject:v72];
          }
          objc_storeStrong(&v66, 0);
        }
        else
        {
          id v35 = v80;
          v95[0] = 0x26BEB09F8;
          v96[0] = v74;
          v95[1] = 0x26BEACCB8;
          v96[1] = v73;
          id v36 = (id)[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:2];
          objc_msgSend(v35, "setObject:forKey:");

          id v68 = &_os_log_internal;
          os_log_type_t v67 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v33 = v68;
            os_log_type_t v34 = v67;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v94, v77, (uint64_t)v73);
            _os_log_debug_impl(&dword_20ABD4000, v33, v34, "New model version to fetch:%@, version:%@", v94, 0x16u);
          }
          objc_storeStrong(&v68, 0);
        }
        objc_storeStrong(&v69, 0);
      }
      else
      {
        id v39 = v80;
        v98[0] = 0x26BEB09F8;
        v99[0] = v74;
        v98[1] = 0x26BEACCB8;
        v99[1] = v73;
        id v40 = (id)[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:2];
        objc_msgSend(v39, "setObject:forKey:");

        id v71 = &_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEBUG))
        {
          log = v71;
          os_log_type_t v38 = type;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v97, v77, (uint64_t)v73);
          _os_log_debug_impl(&dword_20ABD4000, log, v38, "New model to fetch:%@, version:%@", v97, 0x16u);
        }
        objc_storeStrong(&v71, 0);
      }
      objc_storeStrong(&v72, 0);
      objc_storeStrong(&v73, 0);
      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
      ++v43;
      if (v41 + 1 >= v44)
      {
        uint64_t v43 = 0;
        unint64_t v44 = [v48 countByEnumeratingWithState:__b objects:v100 count:16];
        if (!v44) {
          break;
        }
      }
    }
  }

  memset(v60, 0, sizeof(v60));
  id v24 = v83;
  uint64_t v25 = [v24 countByEnumeratingWithState:v60 objects:v89 count:16];
  if (v25)
  {
    uint64_t v21 = *(void *)v60[2];
    uint64_t v22 = 0;
    unint64_t v23 = v25;
    while (1)
    {
      uint64_t v20 = v22;
      if (*(void *)v60[2] != v21) {
        objc_enumerationMutation(v24);
      }
      uint64_t v61 = *(void *)(v60[1] + 8 * v22);
      id v6 = (id)[v79 objectForKey:v61];
      BOOL v19 = v6 != 0;

      if (!v19)
      {
        id v59 = 0;
        id v57 = 0;
        id v18 = +[AMDWorkflow getWorkflowsForModelId:v61 error:&v57];
        objc_storeStrong(&v59, v57);
        id v58 = v18;
        if (v59)
        {
          int v56 = 5;
        }
        else
        {
          if (!v58 || ![v58 count])
          {
            id v16 = v82;
            id v17 = (id)[v83 objectForKey:v61];
            objc_msgSend(v16, "addObject:");

            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t v54 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              id v15 = oslog;
              __os_log_helper_16_2_1_8_64((uint64_t)v88, v61);
              _os_log_debug_impl(&dword_20ABD4000, v15, v54, "Model to delete :%@", v88, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          int v56 = 0;
        }
        objc_storeStrong(&v58, 0);
        objc_storeStrong(&v59, 0);
      }
      ++v22;
      if (v20 + 1 >= v23)
      {
        uint64_t v22 = 0;
        unint64_t v23 = [v24 countByEnumeratingWithState:v60 objects:v89 count:16];
        if (!v23) {
          break;
        }
      }
    }
  }

  os_log_t v53 = (os_log_t)&_os_log_internal;
  os_log_type_t v52 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v53;
    os_log_type_t v13 = v52;
    uint64_t v11 = [v80 count];
    id v14 = (id)[v80 allKeys];
    id v51 = v14;
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v87, v11, (uint64_t)v51);
    _os_log_impl(&dword_20ABD4000, v12, v13, "Models to fetch (%lu): %@", v87, 0x16u);

    objc_storeStrong(&v51, 0);
  }
  objc_storeStrong((id *)&v53, 0);
  os_log_t v50 = (os_log_t)&_os_log_internal;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v86, [v82 count], (uint64_t)v82);
    _os_log_impl(&dword_20ABD4000, v50, OS_LOG_TYPE_INFO, "Models to delete (%lu): %@", v86, 0x16u);
  }
  objc_storeStrong((id *)&v50, 0);
  [v81 setObject:v78 forKey:@"modelsExisting"];
  id v8 = v81;
  id v9 = (id)[v80 allKeys];
  objc_msgSend(v8, "setObject:forKey:");

  [v81 setObject:v82 forKey:@"modelsToDelete"];
  id v10 = v80;
  int v56 = 1;
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v80, 0);
  objc_storeStrong(&v81, 0);
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v83, 0);
  objc_storeStrong(location, 0);

  return v10;
}

+ (id)getBinariesToFetch:(id)a3 withCurrentColdstartInfo:(id)a4 andAMDColdstartBinariesToDelete:(id)a5 andSummaryContainer:(id)a6
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v72 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v70 = 0;
  objc_storeStrong(&v70, a4);
  id v69 = 0;
  objc_storeStrong(&v69, a5);
  id v68 = 0;
  objc_storeStrong(&v68, a6);
  id v67 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (location[0])
  {
    id v65 = (id)[v72 getUrlsWithVersion:location[0]];
    id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(__b, 0, sizeof(__b));
    id v38 = v65;
    uint64_t v39 = [v38 countByEnumeratingWithState:__b objects:v85 count:16];
    if (v39)
    {
      uint64_t v35 = *(void *)__b[2];
      uint64_t v36 = 0;
      unint64_t v37 = v39;
      while (1)
      {
        uint64_t v34 = v36;
        if (*(void *)__b[2] != v35) {
          objc_enumerationMutation(v38);
        }
        uint64_t v63 = *(void *)(__b[1] + 8 * v36);
        id v61 = (id)[v65 objectForKey:v63];
        id v60 = (id)[v61 objectAtIndexedSubscript:0];
        id v59 = (id)[v61 objectAtIndexedSubscript:1];
        id v58 = (id)[v70 objectForKey:v63];
        id v57 = (id)[v58 objectForKey:0x26BEACCB8];
        if (v58)
        {
          if ([v57 isEqualToString:v59])
          {
            [v64 addObject:v63];
            id v52 = &_os_log_internal;
            os_log_type_t v51 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v25 = v52;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v78, v63, (uint64_t)v59);
              _os_log_debug_impl(&dword_20ABD4000, v25, v51, "Existing Coldstart Binary found:%@, version:%@", v78, 0x16u);
            }
            objc_storeStrong(&v52, 0);
          }
          else
          {
            id v28 = v67;
            v80[0] = 0x26BEB09F8;
            v81[0] = v60;
            v80[1] = 0x26BEACCB8;
            v81[1] = v59;
            id v29 = (id)[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
            objc_msgSend(v28, "setObject:forKey:");

            id v54 = &_os_log_internal;
            os_log_type_t v53 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEBUG))
            {
              id v26 = v54;
              os_log_type_t v27 = v53;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v79, v63, (uint64_t)v59);
              _os_log_debug_impl(&dword_20ABD4000, v26, v27, "New Coldstart Binary version to fetch:%@, version:%@", v79, 0x16u);
            }
            objc_storeStrong(&v54, 0);
          }
        }
        else
        {
          id v32 = v67;
          v83[0] = 0x26BEB09F8;
          v84[0] = v60;
          v83[1] = 0x26BEACCB8;
          v84[1] = v59;
          id v33 = (id)[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
          objc_msgSend(v32, "setObject:forKey:");

          id v56 = &_os_log_internal;
          os_log_type_t type = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_DEBUG))
          {
            log = v56;
            os_log_type_t v31 = type;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v82, v63, (uint64_t)v59);
            _os_log_debug_impl(&dword_20ABD4000, log, v31, "New Coldstart Binary to fetch:%@, version:%@", v82, 0x16u);
          }
          objc_storeStrong(&v56, 0);
        }
        objc_storeStrong(&v57, 0);
        objc_storeStrong(&v58, 0);
        objc_storeStrong(&v59, 0);
        objc_storeStrong(&v60, 0);
        objc_storeStrong(&v61, 0);
        ++v36;
        if (v34 + 1 >= v37)
        {
          uint64_t v36 = 0;
          unint64_t v37 = [v38 countByEnumeratingWithState:__b objects:v85 count:16];
          if (!v37) {
            break;
          }
        }
      }
    }

    memset(v49, 0, sizeof(v49));
    id v23 = v70;
    uint64_t v24 = [v23 countByEnumeratingWithState:v49 objects:v77 count:16];
    if (v24)
    {
      uint64_t v20 = *(void *)v49[2];
      uint64_t v21 = 0;
      unint64_t v22 = v24;
      while (1)
      {
        uint64_t v19 = v21;
        if (*(void *)v49[2] != v20) {
          objc_enumerationMutation(v23);
        }
        uint64_t v50 = *(void *)(v49[1] + 8 * v21);
        id v6 = (id)[v65 objectForKey:v50];
        BOOL v18 = v6 != 0;

        if (!v18)
        {
          id v16 = v69;
          id v17 = (id)[v70 objectForKey:v50];
          objc_msgSend(v16, "addObject:");

          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v47 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            id v15 = oslog;
            __os_log_helper_16_2_1_8_64((uint64_t)v76, v50);
            _os_log_debug_impl(&dword_20ABD4000, v15, v47, "Coldstart binary to delete for model :%@", v76, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        ++v21;
        if (v19 + 1 >= v22)
        {
          uint64_t v21 = 0;
          unint64_t v22 = [v23 countByEnumeratingWithState:v49 objects:v77 count:16];
          if (!v22) {
            break;
          }
        }
      }
    }

    os_log_t v46 = (os_log_t)&_os_log_internal;
    os_log_type_t v45 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v46;
      os_log_type_t v13 = v45;
      uint64_t v11 = [v67 count];
      id v14 = (id)[v67 allKeys];
      id v44 = v14;
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v75, v11, (uint64_t)v44);
      _os_log_impl(&dword_20ABD4000, v12, v13, "Coldstart binaries to fetch (%lu): %@", v75, 0x16u);

      objc_storeStrong(&v44, 0);
    }
    objc_storeStrong((id *)&v46, 0);
    os_log_t v43 = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v74, [v69 count], (uint64_t)v69);
      _os_log_impl(&dword_20ABD4000, v43, OS_LOG_TYPE_INFO, "Coldstart binaries to delete (%lu): %@", v74, 0x16u);
    }
    objc_storeStrong((id *)&v43, 0);
    [v68 setObject:v64 forKey:@"binariesExisting"];
    id v9 = v68;
    id v10 = (id)[v67 allKeys];
    objc_msgSend(v9, "setObject:forKey:");

    [v68 setObject:v69 forKey:@"binariesToDelete"];
    id v73 = v67;
    int v66 = 1;
    objc_storeStrong(&v64, 0);
    objc_storeStrong(&v65, 0);
  }
  else
  {
    id v73 = v67;
    int v66 = 1;
  }
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(location, 0);
  id v7 = v73;

  return v7;
}

+ (id)getUrlsWithVersion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v21 = (id)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
  if (v15)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v15;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v11);
      id v18 = (id)[location[0] objectForKey:v20];
      id v17 = (id)[v18 componentsSeparatedByString:@"="];
      if ((unint64_t)[v17 count] >= 2)
      {
        id v5 = v21;
        v23[0] = v18;
        id v7 = (id)[v17 lastObject];
        v23[1] = v7;
        id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
        objc_msgSend(v5, "setObject:forKey:");
      }
      else
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)v18);
          _os_log_error_impl(&dword_20ABD4000, log, OS_LOG_TYPE_ERROR, "No version in url: '%@'", v24, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  id v4 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);

  return v4;
}

+ (id)saveInFlightWorkflows:(id)a3 forModels:(id)a4 inDomain:(id)a5 withCallUUID:(id)a6 error:(id *)a7
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v60 = 0;
  objc_storeStrong(&v60, a4);
  id v59 = 0;
  objc_storeStrong(&v59, a5);
  id v58 = 0;
  objc_storeStrong(&v58, a6);
  id v57 = a7;
  id v56 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id v38 = location[0];
  uint64_t v39 = [v38 countByEnumeratingWithState:__b objects:v67 count:16];
  if (v39)
  {
    uint64_t v31 = *(void *)__b[2];
    uint64_t v32 = 0;
    unint64_t v33 = v39;
    while (1)
    {
      uint64_t v30 = v32;
      if (*(void *)__b[2] != v31) {
        objc_enumerationMutation(v38);
      }
      uint64_t v55 = *(void *)(__b[1] + 8 * v32);
      char v53 = 0;
      char v52 = 0;
      id v51 = +[AMDModel getModelInfo:v55 error:v57];
      if (*v57)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v29 = type;
          __os_log_helper_16_2_1_8_64((uint64_t)v66, v55);
          _os_log_error_impl(&dword_20ABD4000, log, v29, "Fetch error for modelId: %@", v66, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v62 = 0;
        int v48 = 1;
      }
      else
      {
        if (v51) {
          char v53 = 1;
        }
        id v27 = (id)[v60 objectForKey:v55];

        if (v27) {
          char v52 = 1;
        }
        memset(v46, 0, sizeof(v46));
        id v25 = (id)[location[0] objectForKey:v55];
        uint64_t v26 = [v25 countByEnumeratingWithState:v46 objects:v65 count:16];
        if (v26)
        {
          uint64_t v22 = *(void *)v46[2];
          uint64_t v23 = 0;
          unint64_t v24 = v26;
          while (1)
          {
            uint64_t v21 = v23;
            if (*(void *)v46[2] != v22) {
              objc_enumerationMutation(v25);
            }
            id v47 = *(id *)(v46[1] + 8 * v23);
            if (v53)
            {
              id v20 = v47;
              int64_t v7 = +[AMDDomains getCodeForDomain:v59];
              +[AMDWorkflow saveWorkflow:v20 forDomain:v7 withCallUUID:v58 error:v57];
            }
            if (*v57)
            {
              os_log_t v45 = (os_log_t)&_os_log_internal;
              os_log_type_t v44 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                id v17 = v45;
                os_log_type_t v18 = v44;
                id v19 = (id)[*v57 localizedDescription];
                id v43 = v19;
                __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v43);
                _os_log_error_impl(&dword_20ABD4000, v17, v18, "Workflow save failed with error: %@", v64, 0xCu);

                objc_storeStrong(&v43, 0);
              }
              objc_storeStrong((id *)&v45, 0);
              id v62 = 0;
              int v48 = 1;
              goto LABEL_32;
            }
            if (v52)
            {
              id v16 = v47;
              int64_t v8 = +[AMDDomains getCodeForDomain:v59];
              +[AMDWorkflowInFlight saveWorkflow:v16 forDomain:v8 withCallUUID:v58 error:v57];
            }
            if (*v57) {
              break;
            }
            id v11 = v56;
            id v12 = (id)[v47 objectForKey:0x26BEB8818];
            objc_msgSend(v11, "addObject:");

            ++v23;
            if (v21 + 1 >= v24)
            {
              uint64_t v23 = 0;
              unint64_t v24 = [v25 countByEnumeratingWithState:v46 objects:v65 count:16];
              if (!v24) {
                goto LABEL_31;
              }
            }
          }
          os_log_t v42 = (os_log_t)&_os_log_internal;
          os_log_type_t v41 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            id v13 = v42;
            os_log_type_t v14 = v41;
            id v15 = (id)[*v57 localizedDescription];
            id v40 = v15;
            __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v40);
            _os_log_error_impl(&dword_20ABD4000, v13, v14, "Inflight workflow save failed with error: %@", v63, 0xCu);

            objc_storeStrong(&v40, 0);
          }
          objc_storeStrong((id *)&v42, 0);
          id v62 = 0;
          int v48 = 1;
        }
        else
        {
LABEL_31:
          int v48 = 0;
        }
LABEL_32:

        if (!v48) {
          int v48 = 0;
        }
      }
      objc_storeStrong(&v51, 0);
      if (v48) {
        break;
      }
      ++v32;
      if (v30 + 1 >= v33)
      {
        uint64_t v32 = 0;
        unint64_t v33 = [v38 countByEnumeratingWithState:__b objects:v67 count:16];
        if (!v33) {
          goto LABEL_37;
        }
      }
    }
  }
  else
  {
LABEL_37:
    int v48 = 0;
  }

  if (!v48)
  {
    id v62 = v56;
    int v48 = 1;
  }
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
  uint64_t v9 = v62;

  return v9;
}

@end