@interface AMDSplunkLogger
+ (BOOL)checkSchemaValidity:(id)a3;
+ (id)logEvents:(id)a3 toTopic:(id)a4 withSchema:(id)a5;
+ (id)logPayload:(id)a3 error:(id *)a4;
+ (void)flushEvents:(id)a3;
@end

@implementation AMDSplunkLogger

+ (void)flushEvents:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[objc_alloc(MEMORY[0x263F27D40]) initWithContainerID:@"com.apple.AppleMediaServices" bag:0];
  [v3 enqueueEvents:location[0]];
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)checkSchemaValidity:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(__b[1] + 8 * v6);
      id v11 = (id)[location[0] objectForKey:v13];
      if (([v11 isEqualToString:@"string"] & 1) != 0
        || ([v11 isEqualToString:@"number"] & 1) != 0
        || ([v11 isEqualToString:@"dictionary"] & 1) != 0
        || ([v11 isEqualToString:@"array"] & 1) != 0)
      {
        int v10 = 0;
      }
      else
      {
        char v15 = 0;
        int v10 = 1;
      }
      objc_storeStrong(&v11, 0);
      if (v10) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
LABEL_14:
    int v10 = 0;
  }

  if (!v10) {
    char v15 = 1;
  }
  objc_storeStrong(location, 0);
  return v15 & 1;
}

+ (id)logEvents:(id)a3 toTopic:(id)a4 withSchema:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v58 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v56 = 0;
  objc_storeStrong(&v56, a4);
  id v55 = 0;
  objc_storeStrong(&v55, a5);
  uint64_t v54 = [location[0] count];
  id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
  unsigned int v52 = 0;
  unsigned int v51 = 0;
  memset(__b, 0, sizeof(__b));
  id v37 = location[0];
  uint64_t v38 = [v37 countByEnumeratingWithState:__b objects:v63 count:16];
  if (v38)
  {
    uint64_t v32 = *(void *)__b[2];
    uint64_t v33 = 0;
    unint64_t v34 = v38;
    while (1)
    {
      uint64_t v31 = v33;
      if (*(void *)__b[2] != v32) {
        objc_enumerationMutation(v37);
      }
      id v50 = *(id *)(__b[1] + 8 * v33);
      char v48 = 0;
      memset(v46, 0, sizeof(v46));
      id v29 = v55;
      uint64_t v30 = [v29 countByEnumeratingWithState:v46 objects:v62 count:16];
      if (v30)
      {
        uint64_t v26 = *(void *)v46[2];
        uint64_t v27 = 0;
        unint64_t v28 = v30;
        while (1)
        {
          uint64_t v25 = v27;
          if (*(void *)v46[2] != v26) {
            objc_enumerationMutation(v29);
          }
          uint64_t v47 = *(void *)(v46[1] + 8 * v27);
          id v45 = (id)[v55 objectForKey:v47];
          id v44 = (id)[v50 objectForKey:v47];
          if (v44)
          {
            if (([v45 isEqualToString:@"string"] & 1) == 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if (([v45 isEqualToString:@"number"] & 1) == 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if (([v45 isEqualToString:@"dictionary"] & 1) == 0
                  || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if (([v45 isEqualToString:@"array"] & 1) == 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v22 = (void *)MEMORY[0x263F08900];
                    uint64_t v60 = v47;
                    id v61 = v44;
                    id v23 = (id)[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
                    char v24 = objc_msgSend(v22, "isValidJSONObject:");

                    if (v24)
                    {
                      int v43 = 0;
                    }
                    else
                    {
                      char v48 = 1;
                      int v43 = 4;
                    }
                  }
                  else
                  {
                    char v48 = 1;
                    int v43 = 4;
                  }
                }
                else
                {
                  char v48 = 1;
                  int v43 = 4;
                }
              }
              else
              {
                char v48 = 1;
                int v43 = 4;
              }
            }
            else
            {
              char v48 = 1;
              int v43 = 4;
            }
          }
          else
          {
            char v48 = 1;
            int v43 = 4;
          }
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
          if (v43) {
            break;
          }
          ++v27;
          if (v25 + 1 >= v28)
          {
            uint64_t v27 = 0;
            unint64_t v28 = [v29 countByEnumeratingWithState:v46 objects:v62 count:16];
            if (!v28) {
              goto LABEL_29;
            }
          }
        }
      }
      else
      {
LABEL_29:
        int v43 = 0;
      }

      if (v48)
      {
        ++v52;
      }
      else
      {
        id v5 = objc_alloc(MEMORY[0x263F27D48]);
        id v42 = (id)[v5 initWithTopic:v56];
        memset(v40, 0, sizeof(v40));
        id v20 = v55;
        uint64_t v21 = [v20 countByEnumeratingWithState:v40 objects:v59 count:16];
        if (v21)
        {
          uint64_t v17 = *(void *)v40[2];
          uint64_t v18 = 0;
          unint64_t v19 = v21;
          while (1)
          {
            uint64_t v16 = v18;
            if (*(void *)v40[2] != v17) {
              objc_enumerationMutation(v20);
            }
            uint64_t v41 = *(void *)(v40[1] + 8 * v18);
            id v14 = v42;
            id v15 = (id)[v50 objectForKey:v41];
            objc_msgSend(v14, "setProperty:forBodyKey:");

            ++v18;
            if (v16 + 1 >= v19)
            {
              uint64_t v18 = 0;
              unint64_t v19 = [v20 countByEnumeratingWithState:v40 objects:v59 count:16];
              if (!v19) {
                break;
              }
            }
          }
        }

        ++v51;
        [v53 addObject:v42];
        objc_storeStrong(&v42, 0);
      }
      ++v33;
      if (v31 + 1 >= v34)
      {
        uint64_t v33 = 0;
        unint64_t v34 = [v37 countByEnumeratingWithState:__b objects:v63 count:16];
        if (!v34) {
          break;
        }
      }
    }
  }

  if ([v53 count]) {
    [v58 flushEvents:v53];
  }
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = v39;
  id v8 = (id)[NSNumber numberWithLong:v54];
  objc_msgSend(v7, "setObject:forKey:");

  id v9 = v39;
  id v10 = (id)[NSNumber numberWithInt:v51];
  objc_msgSend(v9, "setObject:forKey:");

  id v11 = v39;
  id v12 = (id)[NSNumber numberWithInt:v52];
  objc_msgSend(v11, "setObject:forKey:");

  id v13 = v39;
  int v43 = 1;
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);

  return v13;
}

+ (id)logPayload:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v30 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v28 = a4;
  id v27 = (id)[location[0] objectForKey:@"topic"];
  if (v27)
  {
    id v22 = (id)[location[0] objectForKey:@"events"];
    if (v22)
    {
      id v18 = (id)[location[0] objectForKey:@"schema"];
      if (v18)
      {
        if ([v30 checkSchemaValidity:v18])
        {
          id v11 = (id)[v30 logEvents:v22 toTopic:v27 withSchema:v18];
          +[AMDFrameworkMetrics log:v11 withKey:@"AMDSplunkLoggerSummary" atVerbosity:0];
          id v31 = v11;
          int v23 = 1;
          objc_storeStrong(&v11, 0);
        }
        else
        {
          id v14 = @"Invalid Schema provided. Type can only be number, string, dictionary or an array.";
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v12 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)v14);
            _os_log_error_impl(&dword_20ABD4000, oslog, v12, "%@", v32, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v7 = +[AMDError allocError:15 withMessage:v14];
          *unint64_t v28 = v7;
          +[AMDFrameworkMetrics log:v14 withKey:@"AMDSplunkLoggerError" atVerbosity:0];
          id v31 = 0;
          int v23 = 1;
          objc_storeStrong((id *)&v14, 0);
        }
      }
      else
      {
        uint64_t v17 = @"Missing schema dictionary in splunk logging payload";
        id v16 = &_os_log_internal;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v17);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v16, v15, "%@", v33, 0xCu);
        }
        objc_storeStrong(&v16, 0);
        id v6 = +[AMDError allocError:15 withMessage:v17];
        *unint64_t v28 = v6;
        +[AMDFrameworkMetrics log:v17 withKey:@"AMDSplunkLoggerError" atVerbosity:0];
        id v31 = 0;
        int v23 = 1;
        objc_storeStrong((id *)&v17, 0);
      }
      objc_storeStrong(&v18, 0);
    }
    else
    {
      uint64_t v21 = @"Missing events array in splunk logging payload";
      id v20 = &_os_log_internal;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v21);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v20, v19, "%@", v34, 0xCu);
      }
      objc_storeStrong(&v20, 0);
      id v5 = +[AMDError allocError:15 withMessage:v21];
      *unint64_t v28 = v5;
      +[AMDFrameworkMetrics log:v21 withKey:@"AMDSplunkLoggerError" atVerbosity:0];
      id v31 = 0;
      int v23 = 1;
      objc_storeStrong((id *)&v21, 0);
    }
    objc_storeStrong(&v22, 0);
  }
  else
  {
    uint64_t v26 = @"Missing topic in splunk logging payload";
    id v25 = &_os_log_internal;
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v26);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v25, v24, "%@", v35, 0xCu);
    }
    objc_storeStrong(&v25, 0);
    id v4 = +[AMDError allocError:15 withMessage:v26];
    *unint64_t v28 = v4;
    +[AMDFrameworkMetrics log:v26 withKey:@"AMDSplunkLoggerError" atVerbosity:0];
    id v31 = 0;
    int v23 = 1;
    objc_storeStrong((id *)&v26, 0);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  id v8 = v31;

  return v8;
}

@end