@interface AMDBiomeTest
+ (id)test:(id)a3;
@end

@implementation AMDBiomeTest

+ (id)test:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v58 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unsigned int v57 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v29 = [obj countByEnumeratingWithState:__b objects:v64 count:16];
  if (v29)
  {
    uint64_t v25 = *(void *)__b[2];
    uint64_t v26 = 0;
    unint64_t v27 = v29;
    while (1)
    {
      uint64_t v24 = v26;
      if (*(void *)__b[2] != v25) {
        objc_enumerationMutation(obj);
      }
      id v56 = *(id *)(__b[1] + 8 * v26);
      ++v57;
      id v54 = 0;
      id v53 = (id)[v56 objectForKey:@"action"];
      id v52 = (id)[v56 objectForKey:@"table"];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        log = oslog;
        os_log_type_t v23 = type;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v63, (uint64_t)v53, (uint64_t)v52);
        _os_log_debug_impl(&dword_20ABD4000, log, v23, "=== Action : %@, table: %@", v63, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v49 = (id)[NSString stringWithFormat:@"%u: %@(%@)", v57, v53, v52];
      if ([v53 isEqualToString:@"fetchRecords"])
      {
        id v47 = v54;
        id v21 = +[AMDStorage fetchRecordsFrom:v52 error:&v47];
        objc_storeStrong(&v54, v47);
        id v48 = v21;
        if (v54)
        {
          os_log_t v46 = (os_log_t)&_os_log_internal;
          os_log_type_t v45 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v18 = v46;
            os_log_type_t v19 = v45;
            id v20 = (id)[v54 localizedDescription];
            __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v20);
            _os_log_error_impl(&dword_20ABD4000, v18, v19, "Fetch error: %@", v62, 0xCu);
          }
          objc_storeStrong((id *)&v46, 0);
          int v44 = 3;
        }
        else
        {
          [v58 setObject:v48 forKey:v49];
          int v44 = 0;
        }
        objc_storeStrong(&v48, 0);
        if (v44) {
          goto LABEL_34;
        }
      }
      else if ([v53 isEqualToString:@"insertRecords"])
      {
        id v43 = (id)[v56 objectForKey:@"records"];
        unsigned int v42 = 0;
        id v41 = v54;
        unsigned int v17 = +[AMDStorage saveRecords:v43 inTable:v52 error:&v41];
        objc_storeStrong(&v54, v41);
        unsigned int v42 = v17;
        if (v54)
        {
          os_log_t v40 = (os_log_t)&_os_log_internal;
          os_log_type_t v39 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v14 = v40;
            os_log_type_t v15 = v39;
            id v16 = (id)[v54 localizedDescription];
            __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v16);
            _os_log_error_impl(&dword_20ABD4000, v14, v15, "Insert error: %@", v61, 0xCu);
          }
          objc_storeStrong((id *)&v40, 0);
          int v44 = 3;
        }
        else
        {
          id v12 = v58;
          id v13 = (id)[NSNumber numberWithUnsignedInt:v42];
          objc_msgSend(v12, "setObject:forKey:");

          int v44 = 0;
        }
        objc_storeStrong(&v43, 0);
        if (v44) {
          goto LABEL_34;
        }
      }
      else if ([v53 isEqualToString:@"deleteRecords"])
      {
        id v38 = (id)[v56 objectForKey:@"predicates"];
        unsigned int v37 = 0;
        id v36 = v54;
        unsigned int v11 = +[AMDStorage deleteRecordsFrom:v52 usingPredicates:v38 error:&v36];
        objc_storeStrong(&v54, v36);
        unsigned int v37 = v11;
        if (v54)
        {
          os_log_t v35 = (os_log_t)&_os_log_internal;
          os_log_type_t v34 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v8 = v35;
            os_log_type_t v9 = v34;
            id v10 = (id)[v54 localizedDescription];
            __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v10);
            _os_log_error_impl(&dword_20ABD4000, v8, v9, "Delete error: %@", v60, 0xCu);
          }
          objc_storeStrong((id *)&v35, 0);
          int v44 = 3;
        }
        else
        {
          id v6 = v58;
          id v7 = (id)[NSNumber numberWithUnsignedInt:v37];
          objc_msgSend(v6, "setObject:forKey:");

          int v44 = 0;
        }
        objc_storeStrong(&v38, 0);
        if (v44) {
          goto LABEL_34;
        }
      }
      else if ([v53 isEqualToString:@"updateTables"])
      {
        id v33 = (id)[v56 objectForKey:@"streamNames"];
        id v32 = 0;
        id v30 = 0;
        id v5 = +[AMDBiomeIntegration queryBiomeFor:v33 withError:&v30];
        objc_storeStrong(&v32, v30);
        id v31 = v5;
        [v58 setObject:v5 forKey:v49];
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
      }
      int v44 = 0;
LABEL_34:
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v52, 0);
      objc_storeStrong(&v53, 0);
      objc_storeStrong(&v54, 0);
      ++v26;
      if (v24 + 1 >= v27)
      {
        uint64_t v26 = 0;
        unint64_t v27 = [obj countByEnumeratingWithState:__b objects:v64 count:16];
        if (!v27) {
          break;
        }
      }
    }
  }

  id v4 = v58;
  int v44 = 1;
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);

  return v4;
}

@end