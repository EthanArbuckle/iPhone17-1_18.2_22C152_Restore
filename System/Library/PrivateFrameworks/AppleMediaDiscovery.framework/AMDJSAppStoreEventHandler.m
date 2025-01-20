@interface AMDJSAppStoreEventHandler
+ (id)handleAggregatedAppStoreEvent:(id)a3 error:(id *)a4;
@end

@implementation AMDJSAppStoreEventHandler

+ (id)handleAggregatedAppStoreEvent:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = a4;
  unsigned int v41 = 0;
  id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v39 = (id)[location[0] objectForKey:@"events"];
  if (v39)
  {
    id v37 = (id)[location[0] objectForKey:0x26BEB0D98];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = v39;
      id v35 = 0;
      memset(__b, 0, sizeof(__b));
      id obj = v36;
      uint64_t v25 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
      if (v25)
      {
        uint64_t v21 = *(void *)__b[2];
        uint64_t v22 = 0;
        unint64_t v23 = v25;
        while (1)
        {
          uint64_t v20 = v22;
          if (*(void *)__b[2] != v21) {
            objc_enumerationMutation(obj);
          }
          id v34 = *(id *)(__b[1] + 8 * v22);
          id v32 = (id)[v34 mutableCopy];
          id v31 = (id)[v32 objectForKey:0x26BEB0DF8];
          if (v31)
          {
            [v32 removeObjectForKey:0x26BEB0DF8];
            memset(v29, 0, sizeof(v29));
            id v18 = v31;
            uint64_t v19 = [v18 countByEnumeratingWithState:v29 objects:v46 count:16];
            if (v19)
            {
              uint64_t v15 = *(void *)v29[2];
              uint64_t v16 = 0;
              unint64_t v17 = v19;
              while (1)
              {
                uint64_t v14 = v16;
                if (*(void *)v29[2] != v15) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v30 = *(void *)(v29[1] + 8 * v16);
                id v28 = (id)[v32 mutableCopy];
                [v28 setObject:v30 forKey:0x26BEB0DF8];
                v41 += +[AMDAppStoreEvent saveEvent:v28 forUser:v37 error:v42];
                if (*v42 && !v35)
                {
                  v12 = NSString;
                  id v13 = (id)[*v42 localizedDescription];
                  id v6 = (id)[v12 stringWithFormat:@"Error saving an event: %@", v13];
                  id v7 = v35;
                  id v35 = v6;
                }
                id *v42 = 0;
                objc_storeStrong(&v28, 0);
                ++v16;
                if (v14 + 1 >= v17)
                {
                  uint64_t v16 = 0;
                  unint64_t v17 = [v18 countByEnumeratingWithState:v29 objects:v46 count:16];
                  if (!v17) {
                    break;
                  }
                }
              }
            }

            int v38 = 0;
          }
          else
          {
            if (!v35)
            {
              id v4 = (id)[NSString stringWithFormat:@"Incomplete AppStore event. Timestamps are unavailable"];
              id v5 = v35;
              id v35 = v4;
            }
            int v38 = 3;
          }
          objc_storeStrong(&v31, 0);
          objc_storeStrong(&v32, 0);
          ++v22;
          if (v20 + 1 >= v23)
          {
            uint64_t v22 = 0;
            unint64_t v23 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
            if (!v23) {
              break;
            }
          }
        }
      }

      if (v35)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v35);
          _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "%@", v45, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        id *v42 = +[AMDError allocError:15 withMessage:v35];
        id v44 = 0;
        int v38 = 1;
      }
      else
      {
        id v10 = v40;
        id v11 = (id)[NSNumber numberWithUnsignedInt:v41];
        objc_msgSend(v10, "setObject:forKey:");

        id v44 = v40;
        int v38 = 1;
      }
      objc_storeStrong(&v35, 0);
      objc_storeStrong(&v36, 0);
    }
    else
    {
      id *v42 = +[AMDError allocError:0 withMessage:@"Not a list of AppStore events"];
      id v44 = 0;
      int v38 = 1;
    }
    objc_storeStrong(&v37, 0);
  }
  else
  {
    id *v42 = +[AMDError allocError:0 withMessage:@"Array of appstore events is not present."];
    id v44 = 0;
    int v38 = 1;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  v8 = v44;

  return v8;
}

@end