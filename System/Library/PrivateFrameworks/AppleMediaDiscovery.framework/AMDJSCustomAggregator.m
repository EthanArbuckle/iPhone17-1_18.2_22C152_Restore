@interface AMDJSCustomAggregator
+ (id)aggregateUsing:(id)a3 forUserId:(id)a4 andDomain:(id)a5 error:(id *)a6;
+ (id)runBatchedSQLDescriptorsUsing:(id)a3 error:(id *)a4;
+ (id)runCustomAggregation:(id)a3 error:(id *)a4;
@end

@implementation AMDJSCustomAggregator

+ (id)runCustomAggregation:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  *a4 = 0;
  +[AMDPerf startMonitoringEvent:@"runCustomAggregator"];
  id v19 = (id)[location[0] objectForKey:0x26BEAE298];
  id v18 = (id)[location[0] objectForKey:0x26BEB0D98];
  if (v19 && v18)
  {
    id v16 = (id)[location[0] objectForKey:0x26BEADFF8];
    id v15 = (id)[location[0] objectForKey:0x26BEB85D8];
    if (v16 || v15)
    {
      id v14 = 0;
      if (v15)
      {
        id v4 = (id)[v22 aggregateUsing:v15 forUserId:v18 andDomain:v19 error:v20];
        id v5 = v14;
        id v14 = v4;
      }
      else
      {
        id v6 = +[AMDTasteProfile getFeatureValueWithName:v16 inDomain:v19 error:v20];
        id v7 = v14;
        id v14 = v6;

        if (*v20 || !v14)
        {
          id v8 = +[AMDSQLite getFeatureValueWithName:v16 inDomain:v19 withColumnName:0 skipRowset:0 error:v20];
          id v9 = v14;
          id v14 = v8;
        }
      }
      if (*v20)
      {
        id v23 = 0;
        int v17 = 1;
      }
      else
      {
        +[AMDPerf endMonitoringEvent:@"runCustomAggregator"];
        v24 = @"featureData";
        if (v14) {
          id v12 = v14;
        }
        else {
          id v12 = (id)MEMORY[0x263EFFA68];
        }
        v25[0] = v12;
        id v23 = (id)[NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
        int v17 = 1;
      }
      objc_storeStrong(&v14, 0);
    }
    else
    {
      id *v20 = +[AMDError allocError:15 withMessage:@"missing feature name and feature descriptor"];
      id v23 = 0;
      int v17 = 1;
    }
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id *v20 = +[AMDError allocError:15 withMessage:@"domain or userId missing"];
    id v23 = 0;
    int v17 = 1;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  v10 = v23;

  return v10;
}

+ (id)aggregateUsing:(id)a3 forUserId:(id)a4 andDomain:(id)a5 error:(id *)a6
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  v28 = a6;
  id v27 = (id)[location[0] objectForKey:@"version"];
  char v26 = 0;
  if (v27
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v27 isEqualToString:AMD_CUSTOM_AGG_VERSION_1] & 1) == 0)
  {
    if ([v27 isEqualToString:AMD_CUSTOM_AGG_VERSION_2])
    {
      char v26 = 2;
    }
    else if ([v27 isEqualToString:AMD_CUSTOM_AGG_VERSION_SQLITE_0])
    {
      char v26 = 3;
    }
  }
  else
  {
    char v26 = 1;
  }
  if (v26)
  {
    uint64_t v7 = v26;
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    char v6 = 0;
  }
  if ((v6 & 1) == 0)
  {
    switch(v7)
    {
      case 0:
        break;
      case 1:
        id v8 = [AMDFeatureDescriptor alloc];
        id v25 = [(AMDFeatureDescriptor *)v8 initWithDictionary:location[0] withUserId:v30 featureName:@"dummy"];
        if (v25)
        {
          id v32 = (id)[v25 getFeatureData:v28];
        }
        else
        {
          id *v28 = +[AMDError allocError:16 withMessage:@"Invalid V1 descriptor"];
          id v32 = 0;
        }
        int v24 = 1;
        objc_storeStrong(&v25, 0);
        goto LABEL_35;
      case 2:
        id v9 = [AMDFeatureDescriptor alloc];
        id v23 = [(AMDFeatureDescriptor *)v9 initWithDictionaryV2:location[0] withUserId:v30 featureName:@"dummy" withDomain:v29];
        if (v23)
        {
          id v22 = (id)[v23 getFeatureData:v28];
          if (v22) {
            id v32 = (id)[v22 objectForKey:0x26BEB1878];
          }
          else {
            id v32 = 0;
          }
          int v24 = 1;
          objc_storeStrong(&v22, 0);
        }
        else
        {
          id *v28 = +[AMDError allocError:16 withMessage:@"Invalid V2 descriptor"];
          id v32 = 0;
          int v24 = 1;
        }
        objc_storeStrong(&v23, 0);
        goto LABEL_35;
      case 3:
        id v21 = +[AMDSQLite getSharedInstance];
        if ([v21 getDb])
        {
          id v10 = (id)[v21 getDataSchema];
          BOOL v16 = v10 != 0;

          if (v16)
          {
            id v14 = [AMDFetchDescriptor alloc];
            id v13 = location[0];
            id v15 = (id)[v21 getDataSchema];
            id v20 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v14, "initWithDict:usingSchema:error:", v13);

            if (*v28) {
              id v32 = 0;
            }
            else {
              id v32 = (id)[v21 fetchRows:v20 andPersist:0 error:v28];
            }
            int v24 = 1;
            objc_storeStrong(&v20, 0);
          }
          else
          {
            id *v28 = +[AMDError allocError:22 withMessage:@"SQL database does not have a schema available"];
            id v32 = 0;
            int v24 = 1;
          }
        }
        else
        {
          id *v28 = +[AMDError allocError:22 withMessage:@"SQL database pointer is nil"];
          id v32 = 0;
          int v24 = 1;
        }
        objc_storeStrong(&v21, 0);
        goto LABEL_35;
      default:
        JUMPOUT(0);
    }
  }
  id *v28 = +[AMDError allocError:15 withMessage:@"Invalid version"];
  id v32 = 0;
  int v24 = 1;
LABEL_35:
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  v11 = v32;

  return v11;
}

+ (id)runBatchedSQLDescriptorsUsing:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = a4;
  id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v40 = (id)[location[0] objectForKey:AMD_BATCHED_CUSTOM_AGG_DICT];
  if (v40)
  {
    id v38 = +[AMDSQLite getSharedInstance];
    if ([v38 getDb])
    {
      id v4 = (id)[v38 getDataSchema];
      BOOL v26 = v4 != 0;

      if (v26)
      {
        memset(__b, 0, sizeof(__b));
        id obj = v40;
        uint64_t v25 = [obj countByEnumeratingWithState:__b objects:v50 count:16];
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
            uint64_t v37 = *(void *)(__b[1] + 8 * v22);
            id v35 = 0;
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t type = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              log = oslog;
              os_log_type_t v19 = type;
              __os_log_helper_16_2_1_8_64((uint64_t)v49, v37);
              _os_log_debug_impl(&dword_20ABD4000, log, v19, "Running aggregation: %@", v49, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            id v32 = (id)[v40 objectForKey:v37];
            id v15 = [AMDFetchDescriptor alloc];
            id v14 = v32;
            id v17 = (id)[v38 getDataSchema];
            id v30 = v35;
            BOOL v16 = -[AMDFetchDescriptor initWithDict:usingSchema:error:](v15, "initWithDict:usingSchema:error:", v14);
            objc_storeStrong(&v35, v30);
            id v31 = v16;

            if (v35)
            {
              id v11 = v41;
              v47 = @"error";
              id v13 = (id)[v35 localizedDescription];
              id v48 = v13;
              id v12 = (id)[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
              objc_msgSend(v11, "setValue:forKey:");

              int v39 = 3;
            }
            else
            {
              id v28 = 0;
              id v10 = (id)[v38 fetchRows:v31 andPersist:0 error:&v28];
              objc_storeStrong(&v35, v28);
              id v29 = v10;
              if (v35)
              {
                id v7 = v41;
                v45 = @"error";
                id v9 = (id)[v35 localizedDescription];
                id v46 = v9;
                id v8 = (id)[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
                objc_msgSend(v7, "setValue:forKey:");

                int v39 = 3;
              }
              else
              {
                [v41 setObject:v29 forKey:v37];
                int v39 = 0;
              }
              objc_storeStrong(&v29, 0);
            }
            objc_storeStrong(&v31, 0);
            objc_storeStrong(&v32, 0);
            objc_storeStrong(&v35, 0);
            ++v22;
            if (v20 + 1 >= v23)
            {
              uint64_t v22 = 0;
              unint64_t v23 = [obj countByEnumeratingWithState:__b objects:v50 count:16];
              if (!v23) {
                break;
              }
            }
          }
        }

        id v44 = v41;
        int v39 = 1;
      }
      else
      {
        id *v42 = +[AMDError allocError:22 withMessage:@"SQL database does not have a schema available"];
        id v44 = 0;
        int v39 = 1;
      }
    }
    else
    {
      id *v42 = +[AMDError allocError:22 withMessage:@"SQL database pointer is nil"];
      id v44 = 0;
      int v39 = 1;
    }
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id *v42 = +[AMDError allocError:22 withMessage:@"batchedAggregatorDict not passed in payload"];
    id v44 = 0;
    int v39 = 1;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  id v5 = v44;

  return v5;
}

@end