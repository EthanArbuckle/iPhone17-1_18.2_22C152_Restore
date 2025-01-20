@interface AMDUserDataManager
+ (id)clearDataForUser:(id)a3 error:(id *)a4;
+ (id)deleteAllUserData:(id *)a3;
@end

@implementation AMDUserDataManager

+ (id)deleteAllUserData:(id *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v44 = a1;
  SEL v43 = a2;
  v42 = a3;
  id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v40 = +[AMDAppEvent deleteAllEvents:v42];
  if (*v42)
  {
    id v39 = &_os_log_internal;
    char v38 = 16;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
    {
      log = v39;
      os_log_type_t type = v38;
      id v17 = (id)[*v42 localizedDescription];
      id v37 = v17;
      __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v37);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Error deleting previous user's events: %@", v52, 0xCu);

      objc_storeStrong(&v37, 0);
    }
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id v36 = &_os_log_internal;
    os_log_type_t v35 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v40);
      _os_log_impl(&dword_20ABD4000, (os_log_t)v36, v35, "Deleted %@ events", v51, 0xCu);
    }
    objc_storeStrong(&v36, 0);
    [v41 setObject:v40 forKey:@"eventsDeleted"];
  }
  id v34 = &_os_log_internal;
  char v33 = 1;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
  {
    v13 = v34;
    os_log_type_t v14 = v33;
    __os_log_helper_16_0_0(v32);
    _os_log_impl(&dword_20ABD4000, v13, v14, "Deleting in-app segments data", v32, 2u);
  }
  objc_storeStrong(&v34, 0);
  id v31 = +[AMDAppSegment deleteAllSegments:v42];
  if (*v42)
  {
    id v30 = &_os_log_internal;
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      v10 = v30;
      os_log_type_t v11 = v29;
      id v12 = (id)[*v42 localizedDescription];
      id v28 = v12;
      __os_log_helper_16_2_1_8_64((uint64_t)v50, (uint64_t)v28);
      _os_log_error_impl(&dword_20ABD4000, v10, v11, "Error deleting previous user's in-app segments: %@", v50, 0xCu);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v30, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t v26 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v31);
      _os_log_impl(&dword_20ABD4000, oslog, v26, "Deleted %@ in-app segments", v49, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [v41 setObject:v31 forKey:@"segmentsDeleted"];
  }
  os_log_t v25 = (os_log_t)&_os_log_internal;
  os_log_type_t v24 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v8 = v25;
    os_log_type_t v9 = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_impl(&dword_20ABD4000, v8, v9, "Deleting taste profile", v23, 2u);
  }
  objc_storeStrong((id *)&v25, 0);
  id v22 = +[AMDTasteProfile deleteAll:v42];
  if (*v42)
  {
    os_log_t v21 = (os_log_t)&_os_log_internal;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v5 = v21;
      os_log_type_t v6 = v20;
      id v7 = (id)[*v42 localizedDescription];
      id v19 = v7;
      __os_log_helper_16_2_1_8_64((uint64_t)v48, (uint64_t)v19);
      _os_log_error_impl(&dword_20ABD4000, v5, v6, "Error deleting previous user's taste profile: %@", v48, 0xCu);

      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong((id *)&v21, 0);
  }
  else
  {
    os_log_t v18 = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v47, (uint64_t)v22);
      _os_log_impl(&dword_20ABD4000, v18, OS_LOG_TYPE_INFO, "Deleted %@ TP entries", v47, 0xCu);
    }
    objc_storeStrong((id *)&v18, 0);
    [v41 setObject:v22 forKey:@"tpFeaturesDeleted"];
  }
  id *v42 = 0;
  v45 = @"userDataDeletionSummary";
  id v46 = v41;
  id v4 = (id)[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);

  return v4;
}

+ (id)clearDataForUser:(id)a3 error:(id *)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v62 = a4;
  id v61 = (id)[location[0] objectForKey:@"dsid"];
  id v60 = (id)[location[0] objectForKey:@"domain"];
  id v59 = (id)[location[0] objectForKey:@"storefrontId"];
  if (v61 && v60 && v59)
  {
    id v54 = 0;
    id v53 = +[AMDMiscHelpers getCurrentEpochSeconds];
    uint64_t v52 = 1000 * [v53 longLongValue];
    v71 = @"time";
    id v27 = (id)[NSNumber numberWithUnsignedLongLong:v52];
    id v72 = v27;
    id v26 = (id)[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    id v51 = v54;
    +[AMDKVStore setValue:forKey:error:](AMDKVStore, "setValue:forKey:error:");
    objc_storeStrong(&v54, v51);

    if (v54)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v49 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v23 = oslog;
        os_log_type_t v24 = v49;
        id v25 = (id)[v54 localizedDescription];
        id v48 = v25;
        __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v48);
        _os_log_error_impl(&dword_20ABD4000, v23, v24, "KV store update with clear data timestamp failed: %@", v70, 0xCu);

        objc_storeStrong(&v48, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v46 = +[AMDAppEvent deleteAllEventsForUser:v61 error:v62];
    if (*v62)
    {
      os_log_t v45 = (os_log_t)&_os_log_internal;
      os_log_type_t v44 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v20 = v45;
        os_log_type_t v21 = v44;
        id v22 = (id)[*v62 localizedDescription];
        id v43 = v22;
        __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v43);
        _os_log_error_impl(&dword_20ABD4000, v20, v21, "Clearing user data failed: Engagement events could not be deleted: %@", v69, 0xCu);

        objc_storeStrong(&v43, 0);
      }
      objc_storeStrong((id *)&v45, 0);
      id v64 = 0;
      int v55 = 1;
    }
    else
    {
      os_log_t v42 = (os_log_t)&_os_log_internal;
      os_log_type_t v41 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v46);
        _os_log_debug_impl(&dword_20ABD4000, v42, v41, "Deleted %@ events", v68, 0xCu);
      }
      objc_storeStrong((id *)&v42, 0);
      [v47 setObject:v46 forKey:@"engagmentEventsDeleted"];
      id v40 = +[AMDAppStoreEvent deleteEventsForUser:v61 error:v62];
      if (*v62)
      {
        os_log_t v39 = (os_log_t)&_os_log_internal;
        os_log_type_t v38 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v17 = v39;
          os_log_type_t v18 = v38;
          id v19 = (id)[*v62 localizedDescription];
          id v37 = v19;
          __os_log_helper_16_2_1_8_64((uint64_t)v67, (uint64_t)v37);
          _os_log_error_impl(&dword_20ABD4000, v17, v18, "Clearing user data failed: Impression events could not be deleted: %@", v67, 0xCu);

          objc_storeStrong(&v37, 0);
        }
        objc_storeStrong((id *)&v39, 0);
        id v64 = 0;
        int v55 = 1;
      }
      else
      {
        [v47 setObject:v40 forKey:@"impressionEventsDeleted"];
        id v15 = v60;
        id v16 = v61;
        uint64_t v5 = [v59 intValue];
        id v36 = +[AMDTasteProfile refreshAggregationTasteProfileForDomain:v15 forUser:v16 andStoreFrontId:v5 error:v62];
        if (*v62)
        {
          os_log_t v35 = (os_log_t)&_os_log_internal;
          os_log_type_t v34 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            id v12 = v35;
            os_log_type_t v13 = v34;
            id v14 = (id)[*v62 localizedDescription];
            id v33 = v14;
            __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v33);
            _os_log_error_impl(&dword_20ABD4000, v12, v13, "Clearing user data failed: Taste profiles could not be refreshed: %@", v66, 0xCu);

            objc_storeStrong(&v33, 0);
          }
          objc_storeStrong((id *)&v35, 0);
          id v64 = 0;
          int v55 = 1;
        }
        else
        {
          [v47 setObject:v36 forKey:@"tasteProfilesRefreshed"];
          id v32 = +[AMDAppSegment refreshSegmentsForAllTreatmentsForUser:v61 error:v62];
          if (*v62)
          {
            os_log_t v31 = (os_log_t)&_os_log_internal;
            os_log_type_t v30 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              os_log_type_t v9 = v31;
              os_log_type_t v10 = v30;
              id v11 = (id)[*v62 localizedDescription];
              id v29 = v11;
              __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v29);
              _os_log_error_impl(&dword_20ABD4000, v9, v10, "Clearing user data failed: Segments could not be refreshed: %@", v65, 0xCu);

              objc_storeStrong(&v29, 0);
            }
            objc_storeStrong((id *)&v31, 0);
          }
          if (v32) {
            id v8 = v32;
          }
          else {
            id v8 = (id)MEMORY[0x263EFFA78];
          }
          objc_storeStrong(&v32, v8);
          [v47 setObject:v32 forKey:@"segmentsRefreshed"];
          +[AMDFrameworkMetrics log:v47 withKey:@"clearUserDataSummary" atVerbosity:0];
          id v64 = v47;
          int v55 = 1;
          objc_storeStrong(&v32, 0);
        }
        objc_storeStrong(&v36, 0);
      }
      objc_storeStrong(&v40, 0);
    }
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v54, 0);
  }
  else
  {
    id v58 = (id)[NSString stringWithFormat:@"Incomplete parameters provided for clear user data request."];
    id v57 = &_os_log_internal;
    os_log_type_t v56 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v58);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v57, v56, "%@", v73, 0xCu);
    }
    objc_storeStrong(&v57, 0);
    id v4 = +[AMDError allocError:15 withMessage:v58];
    id *v62 = v4;
    id v64 = 0;
    int v55 = 1;
    objc_storeStrong(&v58, 0);
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
  os_log_type_t v6 = v64;

  return v6;
}

@end