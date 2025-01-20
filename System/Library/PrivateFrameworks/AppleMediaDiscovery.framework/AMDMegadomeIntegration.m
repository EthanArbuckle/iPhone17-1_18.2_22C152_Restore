@interface AMDMegadomeIntegration
+ (id)handleJSRequest:(id)a3 error:(id *)a4;
+ (id)run:(id)a3 usingView:(id)a4 andDb:(id)a5 returnColumnMajor:(BOOL)a6 returnRowMajor:(BOOL)a7 withError:(id *)a8;
+ (id)save:(id)a3 into:(id)a4 inDb:(id)a5 withError:(id *)a6;
@end

@implementation AMDMegadomeIntegration

+ (id)handleJSRequest:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v59 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = a4;
  id v56 = +[AMDSQLite getSharedInstance];
  if (([v56 isUsable] & 1) == 0)
  {
    id *v57 = (id)[v56 generateDBLoadError];
    id v60 = 0;
    int v55 = 1;
    goto LABEL_53;
  }
  id v4 = (id)[v56 getMegadomeSchema];
  BOOL v35 = v4 != 0;

  if (!v35)
  {
    id *v57 = +[AMDMiscHelpers logAndCreateError:17 errorMessage:@"Megadome: no megadome db"];
    id v60 = 0;
    int v55 = 1;
    goto LABEL_53;
  }
  id v54 = (id)[location[0] objectForKey:@"queries"];
  if (v54)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v53 = v54;
      id v52 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v53, "count"));
      memset(__b, 0, sizeof(__b));
      id obj = v53;
      uint64_t v34 = [obj countByEnumeratingWithState:__b objects:v65 count:16];
      if (!v34)
      {
LABEL_51:

        id v60 = v52;
        int v55 = 1;
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
        goto LABEL_52;
      }
      uint64_t v30 = *(void *)__b[2];
      uint64_t v31 = 0;
      unint64_t v32 = v34;
      while (1)
      {
        uint64_t v29 = v31;
        if (*(void *)__b[2] != v30) {
          objc_enumerationMutation(obj);
        }
        id v51 = *(id *)(__b[1] + 8 * v31);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v52 addObject:&unk_26BEC2378];
          goto LABEL_49;
        }
        id v49 = v51;
        id v5 = (id)[v49 objectForKey:@"sourceView"];
        id v6 = v54;
        id v54 = v5;

        if (v54)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
        }
        [v52 addObject:&unk_26BEC23A0];
        int v55 = 3;
LABEL_48:
        objc_storeStrong(&v49, 0);
LABEL_49:
        ++v31;
        if (v29 + 1 >= v32)
        {
          uint64_t v31 = 0;
          unint64_t v32 = [obj countByEnumeratingWithState:__b objects:v65 count:16];
          if (!v32) {
            goto LABEL_51;
          }
        }
      }
      id v48 = v54;
      id v7 = (id)[v49 objectForKey:@"fd"];
      id v8 = v54;
      id v54 = v7;

      if (!v54 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        [v52 addObject:&unk_26BEC23C8];
        int v55 = 3;
LABEL_47:
        objc_storeStrong(&v48, 0);
        goto LABEL_48;
      }
      id v47 = v54;
      id v46 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      char v45 = 0;
      id v44 = 0;
      id v9 = (id)[v49 objectForKey:@"persist"];
      id v10 = v54;
      id v54 = v9;

      if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v54 BOOLValue] & 1) != 0)
      {
        id v11 = (id)[v49 objectForKey:@"targetTable"];
        id v12 = v54;
        id v54 = v11;

        if (!v54 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          [v52 addObject:&unk_26BEC23F0];
          int v55 = 3;
LABEL_46:
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v46, 0);
          objc_storeStrong(&v47, 0);
          goto LABEL_47;
        }
        objc_storeStrong(&v44, v54);
        char v45 = 1;
      }
      else
      {
        [v46 setObject:@"Not persisting" forKey:@"persistStatus"];
      }
      id v13 = (id)[v49 objectForKey:@"returnResult"];
      id v14 = v54;
      id v54 = v13;

      char v43 = 0;
      char v28 = 0;
      if (v54)
      {
        objc_opt_class();
        char v28 = 0;
        if (objc_opt_isKindOfClass()) {
          char v28 = [v54 BOOLValue];
        }
      }
      char v43 = v28 & 1;
      if (v28 & 1) != 0 || (v45)
      {
        id v42 = 0;
        id v40 = 0;
        id v27 = (id)[v59 run:v47 usingView:v48 andDb:v56 returnColumnMajor:v43 & 1 returnRowMajor:v45 & 1 withError:&v40];
        objc_storeStrong(&v42, v40);
        id v41 = v27;
        if (v42)
        {
          id v24 = v52;
          v63 = @"error";
          id v26 = (id)[v42 localizedDescription];
          id v64 = v26;
          id v25 = (id)[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          objc_msgSend(v24, "addObject:");

          int v55 = 3;
        }
        else
        {
          id v15 = (id)[v41 objectForKey:0x26BEAD2B8];
          id v16 = v41;
          id v41 = v15;

          if ((v45 & 1) != 0 && v44)
          {
            id v38 = v42;
            id v23 = (id)[v59 save:v41 into:v44 inDb:v56 withError:&v38];
            objc_storeStrong(&v42, v38);
            id v39 = v23;
            if (v42)
            {
              id v21 = v46;
              id v22 = (id)[v42 localizedDescription];
              objc_msgSend(v21, "setObject:forKey:");
            }
            else
            {
              [v46 setObject:v39 forKey:@"persistStatus"];
            }
            objc_storeStrong(&v39, 0);
          }
          if (v43)
          {
            v61[0] = 0x26BEAEE38;
            id v20 = (id)[v41 objectForKeyedSubscript:0x26BEAEE38];
            v62[0] = v20;
            v61[1] = 0x26BEAEE58;
            id v19 = (id)[v41 objectForKeyedSubscript:0x26BEAEE58];
            v62[1] = v19;
            id v37 = (id)[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];

            [v46 setObject:v37 forKey:@"resultSet"];
            objc_storeStrong(&v37, 0);
          }
          [v52 addObject:v46];
          int v55 = 0;
        }
        objc_storeStrong(&v41, 0);
        objc_storeStrong(&v42, 0);
      }
      else
      {
        [v52 addObject:&unk_26BEC2418];
        int v55 = 3;
      }
      goto LABEL_46;
    }
  }
  id *v57 = +[AMDMiscHelpers logAndCreateError:17 errorMessage:@"Megadome: bad payload"];
  id v60 = 0;
  int v55 = 1;
LABEL_52:
  objc_storeStrong(&v54, 0);
LABEL_53:
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
  v17 = v60;

  return v17;
}

+ (id)run:(id)a3 usingView:(id)a4 andDb:(id)a5 returnColumnMajor:(BOOL)a6 returnRowMajor:(BOOL)a7 withError:(id *)a8
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v61 = 0;
  objc_storeStrong(&v61, a4);
  id v60 = 0;
  objc_storeStrong(&v60, a5);
  BOOL v59 = a6;
  BOOL v58 = a7;
  v57 = a8;
  id v56 = 0;
  id v55 = (id)[getGDViewServiceClass() clientService];
  id v54 = 0;
  id v53 = 0;
  id v52 = 0;
  id v51 = 0;
  if ([v61 isEqualToString:@"ShortTermTopics"])
  {
    id v8 = (id)[v55 firstPartyShortTermTopicViewWithError:v57];
    id v9 = v53;
    id v53 = v8;

    if (*v57)
    {
      id v63 = 0;
      int v50 = 1;
      goto LABEL_37;
    }
LABEL_4:
    id v10 = (id)[v53 databaseFilePath];
    id v11 = v54;
    id v54 = v10;

    goto LABEL_14;
  }
  if ([v61 isEqualToString:@"LongTermTopics"])
  {
    id v12 = (id)[v55 firstPartyLongTermTopicViewWithError:v57];
    id v13 = v53;
    id v53 = v12;

    if (*v57)
    {
      id v63 = 0;
      int v50 = 1;
      goto LABEL_37;
    }
    goto LABEL_4;
  }
  if (([v61 isEqualToString:@"languageView"] & 1) == 0)
  {
    id v19 = (id)[NSString stringWithFormat:@"Unsupported view: %@", v61];
    id v20 = v56;
    id v56 = v19;

    id *v57 = +[AMDError allocError:17 withMessage:v56];
    id v63 = 0;
    int v50 = 1;
    goto LABEL_37;
  }
  getGDRemoteViewAccessRequesterClass();
  uint64_t v30 = objc_opt_new();
  id v14 = v52;
  id v52 = v30;

  id v15 = (id)[v30 requestAssertionForViewName:@"languageView" error:v57];
  id v16 = v51;
  id v51 = v15;

  if (*v57)
  {
    id v63 = 0;
    int v50 = 1;
    goto LABEL_37;
  }
  id v49 = (id)[v51 viewArtifactURL];
  id v17 = (id)[v49 path];
  id v18 = v54;
  id v54 = v17;

  objc_storeStrong(&v49, 0);
LABEL_14:
  id v48 = (id)[v60 getMegadomeSchema];
  id v47 = [[AMDFetchDescriptor alloc] initWithDict:location[0] usingSchema:v48 error:v57];
  if (*v57)
  {
    id v63 = 0;
    int v50 = 1;
  }
  else
  {
    unsigned int v46 = 0;
    ppDb = 0;
    id v44 = MEMORY[0x263EFFA78];
    char v43 = 0;
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v67, (uint64_t)v54, (uint64_t)v61);
      _os_log_debug_impl(&dword_20ABD4000, oslog, type, "MEGADOME opening DB '%@' for view '%@'", v67, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    unsigned int v46 = sqlite3_open_v2((const char *)[v54 UTF8String], &ppDb, 32769, 0);
    if (v46)
    {
      id v21 = (id)[NSString stringWithFormat:@"Failed to load megadome db from path '%@': %d", v54, v46];
      id v22 = v56;
      id v56 = v21;

      id *v57 = +[AMDError allocError:17 withMessage:v56];
      id v63 = 0;
      int v50 = 1;
    }
    else
    {
      os_log_t v40 = (os_log_t)&_os_log_internal;
      os_log_type_t v39 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v61);
        _os_log_debug_impl(&dword_20ABD4000, v40, v39, "MEGADOME reading from view '%@'", v66, 0xCu);
      }
      objc_storeStrong((id *)&v40, 0);
      id v23 = (id)[v60 fetchRowsFrom:ppDb usingDescriptor:v47 andSchema:v48 columnMajorOutput:v59 rowMajorOutput:v58 andPersist:0 error:v57];
      id v24 = v44;
      id v44 = v23;

      int v50 = 0;
    }
    int v29 = v50;
    if (ppDb)
    {
      unsigned int v46 = sqlite3_close_v2(ppDb);
      if (v46)
      {
        id v25 = (id)[NSString stringWithFormat:@"Failed to close megadome db, path '%@': %d", v54, v46];
        id v26 = v56;
        id v56 = v25;

        os_log_t v38 = (os_log_t)&_os_log_internal;
        os_log_type_t v37 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v56);
          _os_log_error_impl(&dword_20ABD4000, v38, v37, "%@", v65, 0xCu);
        }
        objc_storeStrong((id *)&v38, 0);
      }
      else
      {
        os_log_t v36 = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v64, (uint64_t)v54, (uint64_t)v61);
          _os_log_debug_impl(&dword_20ABD4000, v36, OS_LOG_TYPE_DEBUG, "MEGADOME closed DB '%@' for view '%@'", v64, 0x16u);
        }
        objc_storeStrong((id *)&v36, 0);
      }
    }
    if (v43) {
      objc_exception_rethrow();
    }
    int v50 = v29;
    if (!v29)
    {
      id v63 = v44;
      int v50 = 1;
    }
    objc_storeStrong(&v44, 0);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
LABEL_37:
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
  id v27 = v63;

  return v27;
}

+ (id)save:(id)a3 into:(id)a4 inDb:(id)a5 withError:(id *)a6
{
  v26[2] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = a6;
  v25[0] = 0x26BEB5158;
  v26[0] = v20;
  v25[1] = 0x26BEAEC18;
  id v13 = (id)[location[0] objectForKeyedSubscript:0x26BEAEE78];
  v26[1] = v13;
  id v17 = (id)[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  id v16 = (id)[v19 deleteRows:v17 error:a6];
  if (*a6)
  {
    id v22 = 0;
    int v15 = 1;
  }
  else
  {
    id v8 = v19;
    id v9 = (id)[v19 getDataSchema];
    id v14 = (id)objc_msgSend(v8, "insertRows:usingSchema:error:", v17);

    if (*v18)
    {
      id v22 = 0;
    }
    else
    {
      v23[0] = @"truncationSummary";
      v24[0] = v16;
      v23[1] = @"saveSummary";
      v24[1] = v14;
      id v22 = (id)[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    }
    int v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  id v6 = v22;

  return v6;
}

@end