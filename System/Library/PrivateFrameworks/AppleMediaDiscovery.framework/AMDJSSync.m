@interface AMDJSSync
+ (id)dailyDataUpdate:(id)a3 forStoreFrontId:(unsigned int)a4 error:(id *)a5;
+ (id)runSync:(id)a3 withCallUUID:(id)a4 error:(id *)a5;
+ (id)runSyncForUnsignedUser:(id)a3 withCallUUID:(id)a4 error:(id *)a5;
+ (id)updateAMDSQLSchema:(id)a3 error:(id *)a4;
+ (void)updateArcadeUsageFeature:(id *)a3;
@end

@implementation AMDJSSync

+ (id)dailyDataUpdate:(id)a3 forStoreFrontId:(unsigned int)a4 error:(id *)a5
{
  v83[1] = *MEMORY[0x263EF8340];
  id v72 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v70 = a4;
  v69 = (uint64_t *)a5;
  *a5 = 0;
  id v68 = (id)[location[0] objectForKey:0x26BEAE298];
  id v67 = (id)[location[0] objectForKey:@"supportedDomains"];
  if (!v67)
  {
    v83[0] = v68;
    id v67 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:1];
  }
  id v66 = (id)[location[0] objectForKey:0x26BEB0D98];
  if (v68 && v66)
  {
    id v64 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_4_0_8_64((uint64_t)v82, v70, (uint64_t)v66);
      _os_log_impl(&dword_20ABD4000, (os_log_t)v64, type, "Running daily data update for store: %u, dsId:%@", v82, 0x12u);
    }
    objc_storeStrong(&v64, 0);
    +[AMDPerf startMonitoringEvent:@"dailyDataUpdate"];
    id v62 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v61 = 365;
    id v40 = (id)[location[0] objectForKey:0x26BEB85B8];

    if (v40)
    {
      id v39 = (id)[location[0] objectForKey:0x26BEB85B8];
      uint64_t v61 = [v39 unsignedLongLongValue];
    }
    id v60 = +[AMDAppEvent deleteAppEventsOlderThan:v61 forEventType:0 withPlatform:0 error:v69];
    if (*v69)
    {
      id v59 = &_os_log_internal;
      os_log_type_t v58 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v81, *v69);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v59, v58, "error deletig events: %@", v81, 0xCu);
      }
      objc_storeStrong(&v59, 0);
      id v36 = v62;
      v35 = NSString;
      id v38 = (id)[(id)*v69 localizedDescription];
      id v37 = (id)[v35 stringWithFormat:@"error: %@", v38];
      objc_msgSend(v36, "setObject:forKey:");

      uint64_t *v69 = 0;
    }
    else
    {
      [v62 setObject:v60 forKey:@"deletedOldEvents"];
    }
    uint64_t v61 = 30;
    id v34 = (id)[location[0] objectForKey:0x26BEB8898];

    if (v34)
    {
      id v33 = (id)[location[0] objectForKey:0x26BEB8898];
      uint64_t v61 = [v33 unsignedLongLongValue];
    }
    id v57 = +[AMDAppStoreEvent deleteEventsOlderThan:v61 error:v69];
    if (*v69)
    {
      id v56 = &_os_log_internal;
      os_log_type_t v55 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v80, *v69);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v56, v55, "error deleting appstore events: %@", v80, 0xCu);
      }
      objc_storeStrong(&v56, 0);
      id v30 = v62;
      v29 = NSString;
      id v32 = (id)[(id)*v69 localizedDescription];
      id v31 = (id)[v29 stringWithFormat:@"error: %@", v32];
      objc_msgSend(v30, "setObject:forKey:");

      uint64_t *v69 = 0;
    }
    else
    {
      [v62 setObject:v57 forKey:@"deletedOldAppStoreEvents"];
    }
    id v54 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    memset(__b, 0, sizeof(__b));
    id obj = v67;
    uint64_t v28 = [obj countByEnumeratingWithState:__b objects:v79 count:16];
    if (v28)
    {
      uint64_t v24 = *(void *)__b[2];
      uint64_t v25 = 0;
      unint64_t v26 = v28;
      while (1)
      {
        uint64_t v23 = v25;
        if (*(void *)__b[2] != v24) {
          objc_enumerationMutation(obj);
        }
        id v53 = *(id *)(__b[1] + 8 * v25);
        if ([v53 isEqualToString:@"apps"])
        {
          id v51 = +[AMDTasteProfile refreshAppInformationTasteProfile:v69];
          if (*v69)
          {
            id v20 = v54;
            v19 = NSString;
            id v22 = (id)[(id)*v69 localizedDescription];
            id v21 = (id)[v19 stringWithFormat:@"error: %@", v22];
            objc_msgSend(v20, "setObject:forKey:");

            uint64_t *v69 = 0;
          }
          else
          {
            [v54 setObject:v51 forKey:@"appInformationTPRefresh"];
          }
          objc_storeStrong(&v51, 0);
        }
        id v50 = +[AMDTasteProfile refreshAggregationTasteProfileForDomain:v53 forUser:v66 andStoreFrontId:v70 error:v69];
        if (*v69)
        {
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v48 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            v18 = oslog;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v78, *v69, (uint64_t)v53);
            _os_log_error_impl(&dword_20ABD4000, v18, v48, "error refreshing on-device taste profile: %@ for domain: %@", v78, 0x16u);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v15 = v54;
          v14 = NSString;
          id v17 = (id)[(id)*v69 localizedDescription];
          id v16 = (id)[v14 stringWithFormat:@"error: %@", v17];
          objc_msgSend(v15, "setObject:forKey:");

          uint64_t *v69 = 0;
        }
        else
        {
          [v54 setObject:v50 forKey:v53];
        }
        objc_storeStrong(&v50, 0);
        ++v25;
        if (v23 + 1 >= v26)
        {
          uint64_t v25 = 0;
          unint64_t v26 = [obj countByEnumeratingWithState:__b objects:v79 count:16];
          if (!v26) {
            break;
          }
        }
      }
    }

    [v62 setObject:v54 forKey:@"savedAggregatedTPFeatures"];
    id v47 = +[AMDAppSegment refreshSegmentsForAllTreatmentsForUser:v66 error:v69];
    if (*v69)
    {
      os_log_t v46 = (os_log_t)&_os_log_internal;
      os_log_type_t v45 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        id v13 = (id)[(id)*v69 localizedDescription];
        __os_log_helper_16_2_1_8_64((uint64_t)v77, (uint64_t)v13);
        _os_log_error_impl(&dword_20ABD4000, v46, v45, "error updating in-app segment data: %@", v77, 0xCu);
      }
      objc_storeStrong((id *)&v46, 0);
      id v10 = v62;
      v9 = NSString;
      id v12 = (id)[(id)*v69 localizedDescription];
      id v11 = (id)[v9 stringWithFormat:@"error: %@", v12];
      objc_msgSend(v10, "setObject:forKey:");

      uint64_t *v69 = 0;
    }
    else
    {
      if (v47) {
        objc_storeStrong(&v47, v47);
      }
      else {
        objc_storeStrong(&v47, MEMORY[0x263EFFA78]);
      }
      [v62 setObject:v47 forKey:@"refreshSegments"];
    }
    [v72 updateArcadeUsageFeature:v69];
    if (*v69)
    {
      v7 = NSString;
      id v8 = (id)[(id)*v69 localizedDescription];
      id v44 = (id)[v7 stringWithFormat:@"Arcade Usage feature could not be updated. Error: %@", v8];

      os_log_t v43 = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v44);
        _os_log_error_impl(&dword_20ABD4000, v43, OS_LOG_TYPE_ERROR, "%@", v76, 0xCu);
      }
      objc_storeStrong((id *)&v43, 0);
      [v62 setObject:v44 forKey:@"arcadeUsageUpdateError"];
      objc_storeStrong(&v44, 0);
    }
    +[AMDPerf endMonitoringEvent:@"dailyDataUpdate"];
    uint64_t *v69 = 0;
    v74 = @"summary";
    id v75 = v62;
    id v73 = (id)[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    int v65 = 1;
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v60, 0);
    objc_storeStrong(&v62, 0);
  }
  else
  {
    uint64_t *v69 = (uint64_t)+[AMDError allocError:15 withMessage:@"domain or userId missing"];
    id v73 = 0;
    int v65 = 1;
  }
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(location, 0);
  v5 = v73;

  return v5;
}

+ (id)runSyncForUnsignedUser:(id)a3 withCallUUID:(id)a4 error:(id *)a5
{
  id v16 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = a5;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  +[AMDMiscHelpers setAppStoreDirAttributes];
  id v11 = (id)[location[0] objectForKey:0x26BEB8D38];
  if (v11)
  {
    id v10 = (id)[v16 updateAMDSQLSchema:v11 error:v13];
    if (*v13)
    {
      id v17 = 0;
      int v9 = 1;
    }
    else
    {
      [v12 setObject:v10 forKey:@"sqlSchemaUpdateSummary"];
      int v9 = 0;
    }
    objc_storeStrong(&v10, 0);
    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
    [v12 setObject:@"Missing schema" forKey:@"applySchema"];
  }
  id v17 = v12;
LABEL_8:
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  v5 = v17;

  return v5;
}

+ (id)runSync:(id)a3 withCallUUID:(id)a4 error:(id *)a5
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v92 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v90 = 0;
  objc_storeStrong(&v90, a4);
  v89 = a5;
  id v88 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  +[AMDMiscHelpers setAppStoreDirAttributes];
  id v87 = (id)[location[0] objectForKey:0x26BEB8D38];
  if (v87)
  {
    id v86 = 0;
    id v84 = 0;
    id v43 = (id)[v92 updateAMDSQLSchema:v87 error:&v84];
    objc_storeStrong(&v86, v84);
    id v85 = v43;
    if (v86)
    {
      id v41 = v88;
      id v42 = (id)[v86 localizedDescription];
      objc_msgSend(v41, "setObject:forKey:");
    }
    else if (v85)
    {
      [v88 setObject:v85 forKey:@"sqlSchemaUpdateSummary"];
    }
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, 0);
  }
  else
  {
    [v88 setObject:@"No schema" forKey:@"dailyDataUpdate"];
  }
  id v40 = (id)[location[0] objectForKey:0x26BEB8CD8];
  id v83 = (id)[v40 mutableCopy];

  if (v83)
  {
    id v81 = +[AMDJSConfigProcessor processConfig:v83 withCallUUID:v90 error:v89];
    if (*v89)
    {
      id v38 = NSString;
      id v39 = (id)[*v89 localizedDescription];
      id v80 = (id)[v38 stringWithFormat:@"Error processing config: %@", v39];

      id v79 = &_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v113, (uint64_t)v80);
        _os_log_impl(&dword_20ABD4000, (os_log_t)v79, type, "%@", v113, 0xCu);
      }
      objc_storeStrong(&v79, 0);
      id v36 = v88;
      v111 = @"error";
      id v112 = v80;
      id v37 = (id)[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      objc_msgSend(v36, "setObject:forKey:");

      id *v89 = 0;
      objc_storeStrong(&v80, 0);
    }
    else
    {
      [v88 setObject:v81 forKey:@"processConfig"];
    }
    id v77 = (id)[location[0] objectForKey:0x26BEB8D18];
    id v76 = (id)[location[0] objectForKey:0x26BEB8CF8];
    if (v76)
    {
      id v75 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v74 = v76;
        memset(__b, 0, sizeof(__b));
        id v34 = v74;
        uint64_t v35 = [v34 countByEnumeratingWithState:__b objects:v110 count:16];
        if (v35)
        {
          uint64_t v31 = *(void *)__b[2];
          uint64_t v32 = 0;
          unint64_t v33 = v35;
          while (1)
          {
            uint64_t v30 = v32;
            if (*(void *)__b[2] != v31) {
              objc_enumerationMutation(v34);
            }
            id v73 = *(id *)(__b[1] + 8 * v32);
            id v71 = (id)[v73 objectForKey:0x26BEAE298];
            if (v71)
            {
              id v67 = +[AMDTasteProfile refreshServerTasteProfile:v73 error:v89];
              if (*v89)
              {
                unint64_t v26 = NSString;
                id v27 = (id)[*v89 localizedDescription];
                id v66 = (id)[v26 stringWithFormat:@"Error refreshing server TP: %@", v27];

                id v65 = &_os_log_internal;
                os_log_type_t v64 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_INFO))
                {
                  uint64_t v25 = v65;
                  __os_log_helper_16_2_1_8_64((uint64_t)v109, (uint64_t)v66);
                  _os_log_impl(&dword_20ABD4000, v25, v64, "%@", v109, 0xCu);
                }
                objc_storeStrong(&v65, 0);
                id v23 = v75;
                v107 = @"error";
                id v108 = v66;
                id v24 = (id)[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
                objc_msgSend(v23, "setObject:forKey:");

                id *v89 = 0;
                objc_storeStrong(&v66, 0);
              }
              else
              {
                [v75 setObject:v67 forKey:v71];
              }
              objc_storeStrong(&v67, 0);
              int v82 = 0;
            }
            else
            {
              id v70 = &_os_log_internal;
              os_log_type_t v69 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
              {
                uint64_t v28 = v70;
                os_log_type_t v29 = v69;
                __os_log_helper_16_0_0(v68);
                _os_log_error_impl(&dword_20ABD4000, v28, v29, "Domain missing in Server TP payload", v68, 2u);
              }
              objc_storeStrong(&v70, 0);
              int v82 = 3;
            }
            objc_storeStrong(&v71, 0);
            ++v32;
            if (v30 + 1 >= v33)
            {
              uint64_t v32 = 0;
              unint64_t v33 = [v34 countByEnumeratingWithState:__b objects:v110 count:16];
              if (!v33) {
                break;
              }
            }
          }
        }

        [v88 setObject:v75 forKey:@"refreshServerTP"];
        objc_storeStrong(&v74, 0);
      }
      else
      {
        v63 = @"Server TP payload data is not an array";
        id v62 = &_os_log_internal;
        os_log_type_t v61 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v106, (uint64_t)v63);
          _os_log_impl(&dword_20ABD4000, (os_log_t)v62, v61, "%@", v106, 0xCu);
        }
        objc_storeStrong(&v62, 0);
        id v21 = v88;
        v104 = @"error";
        v105 = v63;
        id v22 = (id)[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
        objc_msgSend(v21, "setObject:forKey:");

        objc_storeStrong((id *)&v63, 0);
      }
      objc_storeStrong(&v75, 0);
    }
    else if (v77)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v60 = v77;
        id v59 = +[AMDTasteProfile refreshServerTasteProfile:v60 error:v89];
        if (*v89)
        {
          v19 = NSString;
          id v20 = (id)[*v89 localizedDescription];
          id v58 = (id)[v19 stringWithFormat:@"Error refreshing server TP: %@", v20];

          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v56 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v103, (uint64_t)v58);
            _os_log_impl(&dword_20ABD4000, oslog, v56, "%@", v103, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v17 = v88;
          v101 = @"error";
          id v102 = v58;
          id v18 = (id)[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
          objc_msgSend(v17, "setObject:forKey:");

          id *v89 = 0;
          objc_storeStrong(&v58, 0);
        }
        else
        {
          [v88 setObject:v59 forKey:@"refreshServerTP"];
        }
        objc_storeStrong(&v59, 0);
        objc_storeStrong(&v60, 0);
      }
      else
      {
        os_log_type_t v55 = @"Server TP payload is not a dictionary";
        os_log_t v54 = (os_log_t)&_os_log_internal;
        os_log_type_t v53 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v100, (uint64_t)v55);
          _os_log_impl(&dword_20ABD4000, v54, v53, "%@", v100, 0xCu);
        }
        objc_storeStrong((id *)&v54, 0);
        id v15 = v88;
        v98 = @"error";
        v99 = v55;
        id v16 = (id)[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        objc_msgSend(v15, "setObject:forKey:");

        objc_storeStrong((id *)&v55, 0);
      }
    }
    else
    {
      v52 = @"Server taste profile absent in Sync payload";
      os_log_t v51 = (os_log_t)&_os_log_internal;
      os_log_type_t v50 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v97, (uint64_t)v52);
        _os_log_error_impl(&dword_20ABD4000, v51, v50, "%@", v97, 0xCu);
      }
      objc_storeStrong((id *)&v51, 0);
      +[AMDFrameworkMetrics log:v52 withKey:@"ServerTasteProfileStatus" atVerbosity:0];
      objc_storeStrong((id *)&v52, 0);
    }
    id v49 = (id)[location[0] objectForKey:0x26BEB8798];
    if (v49)
    {
      id v13 = v92;
      id v14 = (id)[location[0] objectForKey:0x26BEB0DB8];
      id v48 = (id)objc_msgSend(v13, "dailyDataUpdate:forStoreFrontId:error:", v49, objc_msgSend(v14, "intValue"), v89);

      if (*v89)
      {
        id v11 = NSString;
        id v12 = (id)[*v89 localizedDescription];
        id v47 = (id)[v11 stringWithFormat:@"Error performing daily data update: %@", v12];

        os_log_t v46 = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v96, (uint64_t)v47);
          _os_log_impl(&dword_20ABD4000, v46, OS_LOG_TYPE_INFO, "%@", v96, 0xCu);
        }
        objc_storeStrong((id *)&v46, 0);
        id v9 = v88;
        v94 = @"error";
        id v95 = v47;
        id v10 = (id)[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        objc_msgSend(v9, "setObject:forKey:");

        id *v89 = 0;
        objc_storeStrong(&v47, 0);
      }
      else
      {
        [v88 setObject:v48 forKey:@"dailyDataUpdate"];
      }
      id v7 = v88;
      id v8 = +[AMDSQLite updateData:location[0]];
      objc_msgSend(v7, "setObject:forKey:");

      objc_storeStrong(&v48, 0);
    }
    else
    {
      [v88 setObject:&unk_26BEC32C8 forKey:@"dailyDataUpdate"];
    }
    +[AMDFrameworkMetrics log:v88 withKey:@"syncSummary" atVerbosity:0];
    id v93 = v88;
    int v82 = 1;
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v76, 0);
    objc_storeStrong(&v77, 0);
    objc_storeStrong(&v81, 0);
  }
  else
  {
    [v88 setObject:@"Missing config" forKey:@"processConfig"];
    +[AMDFrameworkMetrics log:v88 withKey:@"syncSummary" atVerbosity:0];
    id v93 = v88;
    int v82 = 1;
  }
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v90, 0);
  objc_storeStrong(location, 0);
  v5 = v93;

  return v5;
}

+ (void)updateArcadeUsageFeature:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v25 = a1;
  SEL v24 = a2;
  id v23 = a3;
  char v22 = 0;
  id v21 = 0;
  id v20 = +[AMDTasteProfile getPurchasedArcadeGamesSet:a3];
  if (!*v23)
  {
    id v3 = +[AMDAppEvent fetchEvents:v23];
    id v4 = v21;
    id v21 = v3;
  }
  if (!*v23 && v20 && [v20 count] && v21 && objc_msgSend(v21, "count"))
  {
    memset(__b, 0, sizeof(__b));
    id obj = v21;
    uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(id *)(__b[1] + 8 * v9);
        id v17 = (id)[v19 objectForKey:@"type"];
        id location = (id)[v19 objectForKey:0x26BEAEB38];
        if ([v17 intValue] == 3
          && ([v20 containsObject:location] & 1) != 0)
        {
          char v22 = 1;
          int v15 = 2;
        }
        else
        {
          int v15 = 0;
        }
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v17, 0);
        if (v15) {
          break;
        }
        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
          if (!v10) {
            goto LABEL_19;
          }
        }
      }
    }
    else
    {
LABEL_19:
      int v15 = 0;
    }
  }
  if (v22) {
    v5 = @"true";
  }
  else {
    v5 = @"false";
  }
  id v14 = v5;
  unint64_t v26 = @"contains_arcade_plays";
  id v27 = v14;
  id v13 = (id)[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  id v6 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:v13 inDomain:@"apps" forSource:0x26BEB7E78 error:v23];
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
}

+ (id)updateAMDSQLSchema:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v10 = a4;
  id v9 = +[AMDSQLite getSharedInstance];
  if ([v9 getDb])
  {
    id v7 = (id)[v9 updateSchema:location[0] error:v10];
    if (*v10) {
      id v12 = 0;
    }
    else {
      id v12 = v7;
    }
    int v8 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    *unint64_t v10 = +[AMDMiscHelpers logAndCreateError:22 errorMessage:@"SQL Database is not usable"];
    id v12 = 0;
    int v8 = 1;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  id v4 = v12;

  return v4;
}

@end