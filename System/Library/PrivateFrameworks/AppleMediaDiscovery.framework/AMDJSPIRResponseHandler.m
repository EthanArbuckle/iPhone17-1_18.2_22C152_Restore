@interface AMDJSPIRResponseHandler
+ (id)persistPIRData:(id)a3 error:(id *)a4;
@end

@implementation AMDJSPIRResponseHandler

+ (id)persistPIRData:(id)a3 error:(id *)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v60 = a4;
  id v59 = (id)[location[0] objectForKey:@"PIRKeywordArray"];
  if (v59)
  {
    id v56 = (id)[location[0] objectForKey:@"PIRDataArray"];
    if (v56)
    {
      id v54 = (id)[location[0] objectForKey:@"CipherMLCallHandle"];
      if (v54)
      {
        id v52 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v59 options:4 error:v60];
        if (*v60)
        {
          id v51 = &_os_log_internal;
          os_log_type_t type = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
          {
            log = v51;
            os_log_type_t v27 = type;
            id v28 = (id)[*v60 localizedDescription];
            id v49 = v28;
            __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v49);
            _os_log_error_impl(&dword_20ABD4000, log, v27, "Error deserializing PIR keyword: %@", v69, 0xCu);

            objc_storeStrong(&v49, 0);
          }
          objc_storeStrong(&v51, 0);
          id v62 = 0;
          int v57 = 1;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v47 = v52;
            id v46 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v56 options:4 error:v60];
            if (*v60)
            {
              os_log_t oslog = (os_log_t)&_os_log_internal;
              os_log_type_t v44 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                v23 = oslog;
                os_log_type_t v24 = v44;
                id v25 = (id)[*v60 localizedDescription];
                id v43 = v25;
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v68, (uint64_t)v47, (uint64_t)v43);
                _os_log_error_impl(&dword_20ABD4000, v23, v24, "Error deserializing PIR data for keyword %@: %@", v68, 0x16u);

                objc_storeStrong(&v43, 0);
              }
              objc_storeStrong((id *)&oslog, 0);
              id v62 = 0;
              int v57 = 1;
            }
            else
            {
              id v42 = +[AMDKVStore fetchValueForKey:v54 error:v60];
              if (*v60)
              {
                os_log_t v41 = (os_log_t)&_os_log_internal;
                os_log_type_t v40 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  v20 = v41;
                  os_log_type_t v21 = v40;
                  id v22 = (id)[*v60 localizedDescription];
                  id v39 = v22;
                  __os_log_helper_16_2_1_8_64((uint64_t)v67, (uint64_t)v39);
                  _os_log_error_impl(&dword_20ABD4000, v20, v21, "KVStore fetch failed: %@", v67, 0xCu);

                  objc_storeStrong(&v39, 0);
                }
                objc_storeStrong((id *)&v41, 0);
                id v62 = 0;
                int v57 = 1;
              }
              else if (v42)
              {
                id v19 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"key == %@", v54];
                id v9 = +[AMDKVStore deleteWithPredicate:error:](AMDKVStore, "deleteWithPredicate:error:");

                if (*v60)
                {
                  os_log_t v37 = (os_log_t)&_os_log_internal;
                  os_log_type_t v36 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  {
                    v16 = v37;
                    os_log_type_t v17 = v36;
                    id v18 = (id)[*v60 localizedDescription];
                    id v35 = v18;
                    __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v35);
                    _os_log_error_impl(&dword_20ABD4000, v16, v17, "KVStore cleanup failed: %@", v66, 0xCu);

                    objc_storeStrong(&v35, 0);
                  }
                  objc_storeStrong((id *)&v37, 0);
                  id v62 = 0;
                  int v57 = 1;
                }
                else
                {
                  id v34 = (id)[v42 objectForKey:@"domain"];
                  id v64 = v47;
                  id v65 = v46;
                  id v15 = (id)[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
                  id v33 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:");

                  if (*v60)
                  {
                    os_log_t v32 = (os_log_t)&_os_log_internal;
                    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
                      v12 = v32;
                      os_log_type_t v13 = v31;
                      id v14 = (id)[*v60 localizedDescription];
                      id v30 = v14;
                      __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v30);
                      _os_log_error_impl(&dword_20ABD4000, v12, v13, "Taste profile save failed: %@", v63, 0xCu);

                      objc_storeStrong(&v30, 0);
                    }
                    objc_storeStrong((id *)&v32, 0);
                    id v62 = 0;
                    int v57 = 1;
                  }
                  else
                  {
                    id v62 = v33;
                    int v57 = 1;
                  }
                  objc_storeStrong(&v33, 0);
                  objc_storeStrong(&v34, 0);
                }
              }
              else
              {
                id v38 = (id)[NSString stringWithFormat:@"PIR Error: Unrecognized call handler"];
                id v8 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v38];
                id *v60 = v8;
                id v62 = 0;
                int v57 = 1;
                objc_storeStrong(&v38, 0);
              }
              objc_storeStrong(&v42, 0);
            }
            objc_storeStrong(&v46, 0);
            objc_storeStrong(&v47, 0);
          }
          else
          {
            id v48 = (id)[NSString stringWithFormat:@"Non string keyword present in PIR response"];
            id v7 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v48];
            id *v60 = v7;
            id v62 = 0;
            int v57 = 1;
            objc_storeStrong(&v48, 0);
          }
        }
        objc_storeStrong(&v52, 0);
      }
      else
      {
        id v53 = (id)[NSString stringWithFormat:@"Nil call handle present in PIR response"];
        id v6 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v53];
        id *v60 = v6;
        id v62 = 0;
        int v57 = 1;
        objc_storeStrong(&v53, 0);
      }
      objc_storeStrong(&v54, 0);
    }
    else
    {
      id v55 = (id)[NSString stringWithFormat:@"Nil data present in PIR response"];
      id v5 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v55];
      id *v60 = v5;
      id v62 = 0;
      int v57 = 1;
      objc_storeStrong(&v55, 0);
    }
    objc_storeStrong(&v56, 0);
  }
  else
  {
    id v58 = (id)[NSString stringWithFormat:@"Nil keyword present in PIR response"];
    id v4 = +[AMDMiscHelpers logAndCreateError:18 errorMessage:v58];
    id *v60 = v4;
    id v62 = 0;
    int v57 = 1;
    objc_storeStrong(&v58, 0);
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(location, 0);
  v10 = v62;

  return v10;
}

@end