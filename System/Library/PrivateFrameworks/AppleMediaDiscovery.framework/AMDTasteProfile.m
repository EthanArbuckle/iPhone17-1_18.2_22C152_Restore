@interface AMDTasteProfile
+ (BOOL)hasArcade:(id *)a3;
+ (id)deleteAll:(id *)a3;
+ (id)deleteAppInfoEntries:(id *)a3;
+ (id)deleteEntriesOfFeature:(id)a3 withDomain:(int64_t)a4 error:(id *)a5;
+ (id)deleteWithPredicates:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
+ (id)fetchTasteProfile:(id *)a3;
+ (id)getEntries:(id)a3 error:(id *)a4;
+ (id)getFeatureValueWithName:(id)a3 inDomain:(id)a4 error:(id *)a5;
+ (id)getFeatureWithName:(id)a3 inDomain:(id)a4 withColumnName:(id)a5 error:(id *)a6;
+ (id)getPurchasedAppsSet:(id *)a3;
+ (id)getPurchasedArcadeGamesSet:(id *)a3;
+ (id)getStorefrontIdForDomain:(id)a3;
+ (id)getUserIdForDomain:(id)a3;
+ (id)refreshAggregationTasteProfileForDomain:(id)a3 forUser:(id)a4 andStoreFrontId:(unsigned int)a5 error:(id *)a6;
+ (id)refreshAppInformationTasteProfile:(id *)a3;
+ (id)refreshServerTasteProfile:(id)a3 error:(id *)a4;
+ (id)saveTasteProfileEntriesFromDict:(id)a3 inDomain:(id)a4 forSource:(id)a5 error:(id *)a6;
+ (void)refreshCToLMaps;
+ (void)saveMinimalCToLMapForModelId:(id)a3 usingMapData:(id)a4 andPurchases:(id)a5;
@end

@implementation AMDTasteProfile

+ (id)fetchTasteProfile:(id *)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v52 = a1;
  SEL v51 = a2;
  v50 = a3;
  uint64_t v43 = 0;
  v44 = &v43;
  int v45 = 838860800;
  int v46 = 48;
  v47 = __Block_byref_object_copy__8;
  v48 = __Block_byref_object_dispose__8;
  id v49 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  int v38 = 838860800;
  int v39 = 48;
  v40 = __Block_byref_object_copy__8;
  v41 = __Block_byref_object_dispose__8;
  id v42 = 0;
  id v20 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v35 = (id)[v20 getManagedObjectContext];

  id v19 = v35;
  uint64_t v29 = MEMORY[0x263EF8330];
  int v30 = -1073741824;
  int v31 = 0;
  v32 = __37__AMDTasteProfile_fetchTasteProfile___block_invoke;
  v33 = &unk_263FE1CD0;
  v34[1] = &v36;
  v34[0] = v35;
  v34[2] = &v43;
  [v19 performBlockAndWait:&v29];
  if (v44[5])
  {
    id v18 = (id) v44[5];
    id *v50 = v18;
    id v53 = 0;
    int v28 = 1;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    id obj = (id)v37[5];
    uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0;
      unint64_t v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(id *)(__b[1] + 8 * v14);
        v11 = (void *)MEMORY[0x263F08900];
        id v10 = (id)[v27 objectForKey:@"value"];
        id v25 = (id)objc_msgSend(v11, "JSONObjectWithData:options:error:");

        if (*v50)
        {
          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t type = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            log = oslog;
            os_log_type_t v9 = type;
            id v6 = (id)[v27 objectForKey:@"feeatureName"];
            id v7 = v6;
            id v22 = v7;
            id v5 = (id)[*v50 localizedDescription];
            id location = v5;
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v54, (uint64_t)v7, (uint64_t)location);
            _os_log_error_impl(&dword_20ABD4000, log, v9, "error deserializing value for feature %@: %@", v54, 0x16u);

            objc_storeStrong(&location, 0);
            objc_storeStrong(&v22, 0);
          }
          objc_storeStrong((id *)&oslog, 0);
          id v53 = 0;
          int v28 = 1;
        }
        else
        {
          [v27 setValue:v25 forKey:@"value"];
          int v28 = 0;
        }
        objc_storeStrong(&v25, 0);
        if (v28) {
          break;
        }
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
          if (!v15) {
            goto LABEL_15;
          }
        }
      }
    }
    else
    {
LABEL_15:
      int v28 = 0;
    }

    if (!v28)
    {
      id v53 = (id)v37[5];
      int v28 = 1;
    }
  }
  objc_storeStrong(v34, 0);
  objc_storeStrong(&v35, 0);
  _Block_object_dispose(&v36, 8);
  objc_storeStrong(&v42, 0);
  _Block_object_dispose(&v43, 8);
  objc_storeStrong(&v49, 0);
  v3 = v53;

  return v3;
}

void __37__AMDTasteProfile_fetchTasteProfile___block_invoke(void *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDTasteProfile entity];
  id v5 = (id)[v6 name];
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  [v11[0] setResultType:2];
  v1 = (void *)a1[4];
  id location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v10 = *location;
  id v9 = (id)[v1 executeFetchRequest:v11[0] error:&v10];
  objc_storeStrong(location, v10);
  uint64_t v2 = *(void *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (id)getUserIdForDomain:(id)a3
{
  id v13 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  id v9 = 0;
  id v6 = (id)[v13 getFeatureWithName:@"OD_DSID" inDomain:location[0] withColumnName:0 error:&v9];
  objc_storeStrong(&v11, v9);
  id v10 = v6;
  char v7 = 0;
  if (v6)
  {
    id v8 = (id)[v10 getValue];
    char v7 = 1;
    id v3 = v8;
  }
  else
  {
    id v3 = 0;
  }
  id v14 = v3;
  if (v7) {

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  v4 = v14;

  return v4;
}

+ (id)getStorefrontIdForDomain:(id)a3
{
  id v16 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  id v12 = 0;
  id v9 = (id)[v16 getFeatureWithName:@"OD_STOREFRONT_ID" inDomain:location[0] withColumnName:0 error:&v12];
  objc_storeStrong(&v14, v12);
  id v13 = v9;
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v10 setNumberStyle:1];
    id v5 = v10;
    id v8 = (id)[v13 getValue];
    id v7 = (id)[v8 allKeys];
    id v6 = (id)[v7 firstObject];
    id v17 = (id)objc_msgSend(v5, "numberFromString:");

    int v11 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    id v17 = 0;
    int v11 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  id v3 = v17;

  return v3;
}

+ (id)getEntries:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v31 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  int v28 = __Block_byref_object_copy__8;
  uint64_t v29 = __Block_byref_object_dispose__8;
  id v30 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  v21 = __Block_byref_object_copy__8;
  id v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  id v7 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v7 getManagedObjectContext];

  id v6 = v16;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = __36__AMDTasteProfile_getEntries_error___block_invoke;
  id v13 = &unk_263FE1CA8;
  id v14 = location[0];
  v15[1] = &v17;
  v15[0] = v16;
  v15[2] = &v24;
  [v6 performBlockAndWait:&v9];
  if (v25[5])
  {
    *int v31 = (id) v25[5];
    id v33 = 0;
  }
  else
  {
    id v33 = (id)v18[5];
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  v4 = v33;

  return v4;
}

void __36__AMDTasteProfile_getEntries_error___block_invoke(void *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDTasteProfile entity];
  id v5 = (id)[v6 name];
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  [v11[0] setPredicate:a1[4]];
  [v11[0] setResultType:2];
  v1 = (void *)a1[5];
  id location = (id *)(*(void *)(a1[7] + 8) + 40);
  id v10 = *location;
  id v9 = (id)[v1 executeFetchRequest:v11[0] error:&v10];
  objc_storeStrong(location, v10);
  uint64_t v2 = *(void *)(a1[6] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (id)getFeatureValueWithName:(id)a3 inDomain:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = a5;
  *a5 = 0;
  id v33 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"featureName == %@", location[0]];
  if (v35 && ([v35 isEqualToString:@"all"] & 1) == 0)
  {
    int64_t v32 = +[AMDDomains getCodeForDomain:v35];
    id v5 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"domain == %d AND featureName == %@", v32, location[0]];
    id v6 = v33;
    id v33 = v5;
  }
  id v31 = +[AMDTasteProfile getEntries:v33 error:v34];
  if (*v34)
  {
    id v30 = &_os_log_internal;
    char v29 = 16;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      log = v30;
      os_log_type_t type = v29;
      id v14 = location[0];
      id v17 = (id)[*v34 localizedDescription];
      id v28 = v17;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v40, (uint64_t)v14, (uint64_t)v28);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Error fetching feature %@: %@", v40, 0x16u);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v30, 0);
    id v37 = 0;
    int v27 = 1;
  }
  else if (v31 && [v31 count])
  {
    id v13 = (id)[v31 firstObject];
    id v24 = (id)[v13 objectForKey:@"value"];

    id v23 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v24 options:4 error:v34];
    if (*v34)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v10 = oslog;
        os_log_type_t v11 = v21;
        id v9 = location[0];
        id v12 = (id)[*v34 localizedDescription];
        id v20 = v12;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v38, (uint64_t)v9, (uint64_t)v20);
        _os_log_error_impl(&dword_20ABD4000, v10, v11, "Error deserializing value for feature %@: %@", v38, 0x16u);

        objc_storeStrong(&v20, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v37 = 0;
      int v27 = 1;
    }
    else
    {
      id v37 = v23;
      int v27 = 1;
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  else
  {
    id v26 = &_os_log_internal;
    os_log_type_t v25 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v39, (uint64_t)location[0], (uint64_t)v35);
      _os_log_impl(&dword_20ABD4000, (os_log_t)v26, v25, "Feature '%@' not found, domain: %@", v39, 0x16u);
    }
    objc_storeStrong(&v26, 0);
    id v37 = 0;
    int v27 = 1;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  id v7 = v37;

  return v7;
}

+ (id)getFeatureWithName:(id)a3 inDomain:(id)a4 withColumnName:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = a6;
  id v17 = (id)[v22 getFeatureValueWithName:location[0] inDomain:v20 error:a6];
  if (*a6 || !v17)
  {
    *id v18 = 0;
    id v6 = +[AMDSQLite getFeatureValueWithName:location[0] inDomain:v20 withColumnName:v19 skipRowset:1 error:v18];
    id v7 = v17;
    id v17 = v6;
  }
  if (*v18)
  {
    id v23 = 0;
    int v16 = 1;
  }
  else if (v17)
  {
    id v23 = +[AMDFeature featureFromValue:v17];
    int v16 = 1;
  }
  else
  {
    id v15 = (id)[NSString stringWithFormat:@"No feature '%@' in domain '%@'", location[0], v20];
    os_log_t oslog = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)v15);
      _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "%@", v24, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v8 = +[AMDError allocError:16 withMessage:v15];
    *id v18 = v8;
    id v23 = 0;
    int v16 = 1;
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  id v9 = v23;

  return v9;
}

+ (id)refreshAggregationTasteProfileForDomain:(id)a3 forUser:(id)a4 andStoreFrontId:(unsigned int)a5 error:(id *)a6
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v62 = 0;
  objc_storeStrong(&v62, a4);
  unsigned int v61 = a5;
  v60 = a6;
  id v59 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  +[AMDPerf startMonitoringEvent:@"RefreshODTP"];
  if (+[AMDMiscHelpers isValidDSID:v62])
  {
    int64_t v57 = +[AMDDomains getCodeForDomain:location[0]];
    if (v57)
    {
      id v56 = +[AMDDescriptor getDescriptorsForDomain:v57 error:v60];
      if (*v60)
      {
        id v64 = 0;
        int v58 = 1;
      }
      else
      {
        id v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v56, "count"));
        BOOL v54 = 0;
        id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
        memset(__b, 0, sizeof(__b));
        id v32 = v56;
        uint64_t v33 = [v32 countByEnumeratingWithState:__b objects:v71 count:16];
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
            uint64_t v51 = *(void *)(__b[1] + 8 * v30);
            id v49 = (id)[v56 objectForKey:v51];
            BOOL v48 = 0;
            id v6 = (id)[v49 objectForKey:@"required"];
            BOOL v26 = v6 != 0;

            BOOL v48 = v26;
            id v47 = 0;
            id v27 = (id)[v49 objectForKey:@"version"];

            id v7 = [AMDFeatureDescriptor alloc];
            if (v27) {
              id v8 = [(AMDFeatureDescriptor *)v7 initWithDictionaryV2:v49 withUserId:v62 featureName:v51 withDomain:location[0]];
            }
            else {
              id v8 = [(AMDFeatureDescriptor *)v7 initWithDictionary:v49 withUserId:v62 featureName:v51];
            }
            id v9 = v47;
            id v47 = v8;

            if (v47)
            {
              id v43 = (id)[v47 getFeatureData:v60];
              if (*v60)
              {
                [v52 addObject:v51];
                BOOL v54 = v54 || v48;
                int v58 = 3;
              }
              else
              {
                if (v43)
                {
                  [v53 addObject:v51];
                  [v55 setObject:v43 forKey:v51];
                }
                else
                {
                  [v52 addObject:v51];
                  os_log_t v42 = (os_log_t)&_os_log_internal;
                  os_log_type_t v41 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    id v23 = v42;
                    __os_log_helper_16_2_1_8_64((uint64_t)v69, v51);
                    _os_log_error_impl(&dword_20ABD4000, v23, v41, "Nil response obtained after running descriptor for feature: %@", v69, 0xCu);
                  }
                  objc_storeStrong((id *)&v42, 0);
                }
                int v58 = 0;
              }
              objc_storeStrong(&v43, 0);
            }
            else
            {
              id v46 = (id)[NSString stringWithFormat:@"could not build descriptor for feature '%@'", v51];
              os_log_t oslog = (os_log_t)&_os_log_internal;
              os_log_type_t type = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                log = oslog;
                os_log_type_t v25 = type;
                __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v46);
                _os_log_error_impl(&dword_20ABD4000, log, v25, "%@", v70, 0xCu);
              }
              objc_storeStrong((id *)&oslog, 0);
              id v10 = +[AMDError allocError:16 withMessage:v46];
              id *v60 = v10;
              BOOL v54 = v54 || v48;
              [v52 addObject:v51];
              int v58 = 3;
              objc_storeStrong(&v46, 0);
            }
            objc_storeStrong(&v47, 0);
            objc_storeStrong(&v49, 0);
            ++v30;
            if (v28 + 1 >= v31)
            {
              uint64_t v30 = 0;
              unint64_t v31 = [v32 countByEnumeratingWithState:__b objects:v71 count:16];
              if (!v31) {
                break;
              }
            }
          }
        }

        [v59 setObject:v53 forKey:@"computedFeatures"];
        [v59 setObject:v52 forKey:@"aggregationFailures"];
        id v40 = 0;
        if (v54)
        {
          [v59 setObject:@"Required descriptor failed. TP Save skipped" forKey:@"tpSaveSummary"];
          os_log_t v39 = (os_log_t)&_os_log_internal;
          os_log_type_t v38 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            id v15 = v39;
            os_log_type_t v16 = v38;
            __os_log_helper_16_0_0(v37);
            _os_log_error_impl(&dword_20ABD4000, v15, v16, "at least one required descriptor failed, not updating OD-TP", v37, 2u);
          }
          objc_storeStrong((id *)&v39, 0);
        }
        else
        {
          id v17 = v55;
          id v19 = (id)[NSString stringWithFormat:v61];
          id v67 = v19;
          v68 = &unk_26BEC1B50;
          id v18 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67);
          objc_msgSend(v17, "setObject:forKey:");

          id v20 = v55;
          id v22 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", v61 - 143440);
          id v65 = v22;
          v66 = &unk_26BEC1B50;
          id v21 = (id)[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          objc_msgSend(v20, "setObject:forKey:");

          [v55 setObject:v62 forKey:@"OD_DSID"];
          id v11 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:v55 inDomain:location[0] forSource:@"device" error:v60];
          id v12 = v40;
          id v40 = v11;

          if (!*v60) {
            [v59 setObject:v40 forKey:@"tpSaveSummary"];
          }
        }
        +[AMDPerf endMonitoringEvent:@"RefreshODTP"];
        id v64 = v59;
        int v58 = 1;
        objc_storeStrong(&v40, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
        objc_storeStrong(&v55, 0);
      }
      objc_storeStrong(&v56, 0);
    }
    else
    {
      id *v60 = +[AMDError allocError:15 withMessage:@"unknown domain"];
      id v64 = 0;
      int v58 = 1;
    }
  }
  else
  {
    id *v60 = +[AMDError allocError:15 withMessage:@"Invalid dsid"];
    id v64 = 0;
    int v58 = 1;
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
  id v13 = v64;

  return v13;
}

+ (id)saveTasteProfileEntriesFromDict:(id)a3 inDomain:(id)a4 forSource:(id)a5 error:(id *)a6
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v68 = 0;
  objc_storeStrong(&v68, a4);
  id v67 = 0;
  objc_storeStrong(&v67, a5);
  v66 = a6;
  if ([location[0] count])
  {
    unsigned int v61 = 0;
    unsigned int v61 = +[AMDDomains getCodeForDomain:v68];
    id v60 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(location[0], "count"));
    memset(__b, 0, sizeof(__b));
    id v22 = location[0];
    uint64_t v23 = [v22 countByEnumeratingWithState:__b objects:v78 count:16];
    if (v23)
    {
      uint64_t v19 = *(void *)__b[2];
      uint64_t v20 = 0;
      unint64_t v21 = v23;
      while (1)
      {
        uint64_t v18 = v20;
        if (*(void *)__b[2] != v19) {
          objc_enumerationMutation(v22);
        }
        uint64_t v57 = *(void *)(__b[1] + 8 * v20);
        id v17 = (void *)MEMORY[0x263F08900];
        id v16 = (id)[location[0] valueForKey:v57];
        id v55 = (id)objc_msgSend(v17, "dataWithJSONObject:options:error:");

        if (*v66 || !v55)
        {
          id v14 = NSString;
          uint64_t v15 = v57;
          BOOL v6 = *v66 == 0;
          char v52 = 0;
          if (v6)
          {
            id v13 = @"No data";
          }
          else
          {
            id v53 = (__CFString *)(id)[*v66 localizedDescription];
            char v52 = 1;
            id v13 = v53;
          }
          id v54 = (id)[v14 stringWithFormat:@"Could not retrieve TP data for feature '%@': %@", v15, v13];
          if (v52) {

          }
          id v51 = &_os_log_internal;
          os_log_type_t v50 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
          {
            id v12 = v51;
            __os_log_helper_16_2_1_8_64((uint64_t)v77, (uint64_t)v54);
            _os_log_error_impl(&dword_20ABD4000, v12, v50, "%@", v77, 0xCu);
          }
          objc_storeStrong(&v51, 0);
          [v59 addObject:v57];
          id *v66 = 0;
          objc_storeStrong(&v54, 0);
        }
        [v58 setObject:v55 forKey:v57];
        objc_storeStrong(&v55, 0);
        ++v20;
        if (v18 + 1 >= v21)
        {
          uint64_t v20 = 0;
          unint64_t v21 = [v22 countByEnumeratingWithState:__b objects:v78 count:16];
          if (!v21) {
            break;
          }
        }
      }
    }

    if ([v59 count]) {
      [v60 setObject:v59 forKey:@"badFeatures"];
    }
    uint64_t v43 = 0;
    v44 = &v43;
    int v45 = 838860800;
    int v46 = 48;
    id v47 = __Block_byref_object_copy__8;
    BOOL v48 = __Block_byref_object_dispose__8;
    id v49 = 0;
    id v42 = +[AMDCoreDataPersistentContainer sharedContainer];
    id v41 = (id)[v42 getManagedObjectContext];
    id v11 = v41;
    uint64_t v32 = MEMORY[0x263EF8330];
    int v33 = -1073741824;
    int v34 = 0;
    id v35 = __76__AMDTasteProfile_saveTasteProfileEntriesFromDict_inDomain_forSource_error___block_invoke;
    uint64_t v36 = &unk_263FE24A0;
    id v37 = v58;
    id v38 = v41;
    id v39 = v67;
    v40[2] = v61;
    v40[0] = v42;
    v40[1] = &v43;
    [v11 performBlockAndWait:&v32];
    if (v44[5])
    {
      id *v66 = (id) v44[5];
      id v10 = NSString;
      id v9 = (id)[(id)v44[5] localizedDescription];
      id v31 = (id)[v10 stringWithFormat:@"Error saving TP entries: %@", v9];

      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v76, (uint64_t)v31);
        _os_log_error_impl(&dword_20ABD4000, oslog, v29, "%@", v76, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v74 = @"error";
      id v75 = v31;
      id v70 = (id)[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      int v62 = 1;
      objc_storeStrong(&v31, 0);
    }
    else
    {
      id v28 = (id)[v58 allKeys];
      os_log_t v27 = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_3_8_64_8_0_8_64((uint64_t)v73, (uint64_t)v67, [v28 count], (uint64_t)v28);
        _os_log_debug_impl(&dword_20ABD4000, v27, OS_LOG_TYPE_DEBUG, "Saved %@ TP features (%lu): %@", v73, 0x20u);
      }
      objc_storeStrong((id *)&v27, 0);
      v71 = @"savedFeatures";
      id v72 = v28;
      id v70 = (id)[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      int v62 = 1;
      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(v40, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
    _Block_object_dispose(&v43, 8);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v60, 0);
  }
  else
  {
    id v65 = @"Empty taste profile";
    id v64 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v81, (uint64_t)v65);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v64, type, "%@", v81, 0xCu);
    }
    objc_storeStrong(&v64, 0);

    v79 = @"error";
    id v80 = v65;
    id v70 = (id)[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    int v62 = 1;
    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(location, 0);
  id v7 = v70;

  return v7;
}

void __76__AMDTasteProfile_saveTasteProfileEntriesFromDict_inDomain_forSource_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v24 = a1;
  uint64_t v23 = a1;
  id v13 = (id)[MEMORY[0x263EFF910] date];
  [v13 timeIntervalSince1970];
  unint64_t v14 = (unint64_t)v1;

  unint64_t v22 = v14;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
  if (v17)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v17;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void *)(__b[1] + 8 * v11);
      v4 = (void *)MEMORY[0x263EFF240];
      id v6 = (id)+[AMDTasteProfile entity];
      id v5 = (id)[v6 name];
      id v19 = (id)objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:");

      [v19 setSource:*(void *)(a1 + 48)];
      [v19 setDomain:(__int16)*(void *)(a1 + 72)];
      [v19 setFeatureName:v21];
      id v7 = v19;
      id v8 = (id)[*(id *)(a1 + 32) objectForKey:v21];
      objc_msgSend(v7, "setValue:");

      [v19 setLastUpdated:v22];
      objc_storeStrong(&v19, 0);
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

  uint64_t v2 = *(void **)(a1 + 56);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v18 = *v3;
  [v2 save:&v18];
  objc_storeStrong(v3, v18);
}

+ (id)deleteWithPredicates:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v32 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  os_log_type_t v29 = __Block_byref_object_copy__8;
  uint64_t v30 = __Block_byref_object_dispose__8;
  id v31 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  unint64_t v22 = __Block_byref_object_copy__8;
  uint64_t v23 = __Block_byref_object_dispose__8;
  id v24 = 0;
  id v17 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v17 getManagedObjectContext];
  id v6 = v16;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __46__AMDTasteProfile_deleteWithPredicates_error___block_invoke;
  unint64_t v12 = &unk_263FE1C58;
  id v13 = location[0];
  id v14 = v16;
  v15[1] = &v25;
  v15[0] = v17;
  v15[2] = &v18;
  [v6 performBlockAndWait:&v8];
  if (v26[5])
  {
    *uint64_t v32 = (id) v26[5];
    id v34 = 0;
  }
  else
  {
    id v34 = (id)v19[5];
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  _Block_object_dispose(&v18, 8);
  objc_storeStrong(&v24, 0);
  _Block_object_dispose(&v25, 8);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  v4 = v34;

  return v4;
}

void __46__AMDTasteProfile_deleteWithPredicates_error___block_invoke(uint64_t a1)
{
  v19[2] = (id)a1;
  v19[1] = (id)a1;
  int v10 = (void *)MEMORY[0x263EFF260];
  id v12 = (id)+[AMDTasteProfile entity];
  id v11 = (id)[v12 name];
  v19[0] = (id)objc_msgSend(v10, "fetchRequestWithEntityName:");

  if (*(void *)(a1 + 32) && [*(id *)(a1 + 32) count])
  {
    id v9 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:*(void *)(a1 + 32)];
    objc_msgSend(v19[0], "setPredicate:");
  }
  id v18 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v19[0]];
  [v18 setResultType:2];
  double v1 = *(void **)(a1 + 40);
  id location = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v16 = *location;
  id v8 = (id)[v1 executeRequest:v18 error:&v16];
  objc_storeStrong(location, v16);
  id v17 = v8;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    int v15 = 1;
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 48);
    id v6 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v14 = *v6;
    [v2 save:&v14];
    objc_storeStrong(v6, v14);
    id v3 = (id)[v17 result];
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    int v15 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

+ (id)deleteAll:(id *)a3
{
  return (id)[a1 deleteWithPredicates:0 error:a3];
}

+ (id)deleteAppInfoEntries:(id *)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = a1;
  v7[2] = (id)a2;
  v7[1] = a3;
  v7[0] = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"featureName == %@ || featureName == %@ || featureName == %@ || featureName == %@", @"APPS_IS_ARCADE", @"APPS_PURCHASED", @"APPS_GENRE", @"APPS_RATINGS_RANK"];
  uint64_t v4 = v8;
  v9[0] = v7[0];
  id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v6 = (id)objc_msgSend(v4, "deleteWithPredicates:error:");

  objc_storeStrong(v7, 0);

  return v6;
}

+ (id)deleteEntriesOfFeature:(id)a3 withDomain:(int64_t)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v13 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11[2] = (id)a4;
  v11[1] = a5;
  v11[0] = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"featureName == %@ && domain == %d", location[0], a4];
  id v8 = v13;
  v14[0] = v11[0];
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v10 = (id)objc_msgSend(v8, "deleteWithPredicates:error:");

  objc_storeStrong(v11, 0);
  objc_storeStrong(location, 0);

  return v10;
}

+ (id)refreshAppInformationTasteProfile:(id *)a3
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v94 = a1;
  SEL v93 = a2;
  v92 = a3;
  +[AMDPerf startMonitoringEvent:@"RefreshAppInfo"];
  id v91 = (id)[v94 deleteAppInfoEntries:v92];
  if (*v92)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v43 = type;
      id v44 = (id)[*v92 localizedDescription];
      id v88 = v44;
      __os_log_helper_16_2_1_8_64((uint64_t)v116, (uint64_t)v88);
      _os_log_error_impl(&dword_20ABD4000, log, v43, "Previous App Information Taste Profiles could not be deleted. %@", v116, 0xCu);

      objc_storeStrong(&v88, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v95 = 0;
    int v87 = 1;
  }
  else
  {
    if (v91) {
      objc_storeStrong(&v91, v91);
    }
    else {
      objc_storeStrong(&v91, &unk_26BEC1B68);
    }
    os_log_t v86 = (os_log_t)&_os_log_internal;
    os_log_type_t v85 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v115, (uint64_t)v91);
      _os_log_impl(&dword_20ABD4000, v86, v85, "Number of App Information Taste Profiles Deleted: %@", v115, 0xCu);
    }
    objc_storeStrong((id *)&v86, 0);
    id v84 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v83 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v82 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v81 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v80 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v79 = (id)[MEMORY[0x263F01878] enumeratorWithOptions:0];
    [v79 setFilter:&__block_literal_global_6];
    __int16 v78 = 0;
    unsigned __int16 v77 = 0;
    id v76 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v75 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v74 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v73 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v72 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v71 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(__b, 0, sizeof(__b));
    id v40 = v79;
    uint64_t v41 = [v40 countByEnumeratingWithState:__b objects:v114 count:16];
    if (v41)
    {
      uint64_t v37 = *(void *)__b[2];
      uint64_t v38 = 0;
      unint64_t v39 = v41;
      while (1)
      {
        uint64_t v36 = v38;
        if (*(void *)__b[2] != v37) {
          objc_enumerationMutation(v40);
        }
        id v70 = *(id *)(__b[1] + 8 * v38);
        ++v78;
        id v68 = (id)[v70 iTunesMetadata];
        uint64_t v67 = 0;
        uint64_t v67 = [v68 storeItemIdentifier];
        id v66 = (id)[NSString stringWithFormat:v67];
        id v65 = (id)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v70, "isArcadeApp") & 1);
        id v64 = (id)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v68, "isPurchasedRedownload") & 1);
        uint64_t v63 = 0;
        uint64_t v63 = [v68 genreIdentifier];
        id v62 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu", v63);
        uint64_t v61 = 0;
        uint64_t v61 = [v68 ratingRank];
        [v84 setObject:v65 forKey:v66];
        [v83 setObject:v64 forKey:v66];
        id v25 = v82;
        id v26 = (id)[NSNumber numberWithUnsignedLongLong:v63];
        objc_msgSend(v25, "setObject:forKey:");

        id v27 = v81;
        id v28 = (id)[NSNumber numberWithUnsignedLongLong:v61];
        objc_msgSend(v27, "setObject:forKey:");

        id v29 = v75;
        id v30 = (id)[NSNumber numberWithUnsignedLongLong:v67];
        objc_msgSend(v29, "addObject:");

        [v74 addObject:v65];
        [v73 addObject:v64];
        id v31 = v72;
        id v32 = (id)[NSNumber numberWithUnsignedLongLong:v63];
        objc_msgSend(v31, "addObject:");

        id v33 = v71;
        id v34 = (id)[NSNumber numberWithUnsignedLongLong:v61];
        objc_msgSend(v33, "addObject:");

        id v35 = (id)[v80 objectForKey:v62];
        if (v35)
        {
          id v60 = (id)[v80 objectForKey:v62];
          [v60 addObject:v66];
          objc_storeStrong(&v60, 0);
        }
        else
        {
          id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v59 addObject:v66];
          [v80 setObject:v59 forKey:v62];
          objc_storeStrong(&v59, 0);
        }
        __int16 v3 = ([v70 isArcadeApp] & 1) != 0;
        v77 += v3;
        objc_storeStrong(&v62, 0);
        objc_storeStrong(&v64, 0);
        objc_storeStrong(&v65, 0);
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v68, 0);
        ++v38;
        if (v36 + 1 >= v39)
        {
          uint64_t v38 = 0;
          unint64_t v39 = [v40 countByEnumeratingWithState:__b objects:v114 count:16];
          if (!v39) {
            break;
          }
        }
      }
    }

    id v12 = v76;
    v112[0] = 0x26BEAE018;
    v113[0] = v75;
    v112[1] = 0x26BEB1AB8;
    v113[1] = 0x26BEBA518;
    id v13 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v113, v112);
    objc_msgSend(v12, "setObject:forKey:");

    id v14 = v76;
    v110[0] = 0x26BEAE018;
    v111[0] = v74;
    v110[1] = 0x26BEB1AB8;
    v111[1] = 0x26BEBA4F8;
    id v15 = (id)[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:2];
    objc_msgSend(v14, "setObject:forKey:");

    id v16 = v76;
    v108[0] = 0x26BEAE018;
    v109[0] = v72;
    v108[1] = 0x26BEB1AB8;
    v109[1] = 0x26BEBA518;
    id v17 = (id)[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:2];
    objc_msgSend(v16, "setObject:forKey:");

    id v18 = v76;
    v106[0] = 0x26BEAE018;
    v107[0] = v73;
    v106[1] = 0x26BEB1AB8;
    v107[1] = 0x26BEBA4F8;
    id v19 = (id)[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:2];
    objc_msgSend(v18, "setObject:forKey:");

    id v20 = v76;
    v104[0] = 0x26BEAE018;
    v105[0] = v71;
    v104[1] = 0x26BEB1AB8;
    v105[1] = 0x26BEBA518;
    id v21 = (id)[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];
    objc_msgSend(v20, "setObject:forKey:");

    v102[0] = @"data";
    v103[0] = v76;
    v102[1] = @"tpContentType";
    v103[1] = @"v2FeatureDescriptor";
    id v58 = (id)[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:2];
    unint64_t v22 = (void *)MEMORY[0x263EFF9C0];
    id v23 = (id)[v83 allKeys];
    id v57 = (id)objc_msgSend(v22, "setWithArray:");

    id v56 = 0;
    id v54 = 0;
    id v24 = +[AMDTasteProfile getFeatureValueWithName:@"PURCHASED_ITEM_AFFINITY" inDomain:@"apps" error:&v54];
    objc_storeStrong(&v56, v54);
    id v55 = v24;
    if (!v56 && v55)
    {
      id v10 = v57;
      id v11 = (id)[v55 allKeys];
      objc_msgSend(v10, "addObjectsFromArray:");

      os_log_t v53 = (os_log_t)&_os_log_internal;
      os_log_type_t v52 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v101, [v55 count]);
        _os_log_impl(&dword_20ABD4000, v53, v52, "Found %lu apps from server TP", v101, 0xCu);
      }
      objc_storeStrong((id *)&v53, 0);
    }
    v99[0] = @"APPS_TP";
    v100[0] = v58;
    v99[1] = @"APPS_GENRE";
    v100[1] = v82;
    v99[2] = @"APPS_HAS_ARCADE";
    id v9 = (id)[NSNumber numberWithUnsignedShort:v77];
    v100[2] = v9;
    v99[3] = @"APPS_IS_ARCADE";
    v100[3] = v84;
    v99[4] = @"APPS_PURCHASED";
    v100[4] = v83;
    v99[5] = @"APPS_PURCHASED_ALL";
    id v8 = (id)[v57 allObjects];
    v100[5] = v8;
    v99[6] = @"APPS_RATINGS_RANK";
    v100[6] = v81;
    v99[7] = @"APPS_LIST_BY_GENRE";
    v100[7] = v80;
    id v51 = (id)[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:8];

    if (v78)
    {
      os_log_t v50 = (os_log_t)&_os_log_internal;
      os_log_type_t v49 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_0_8_64((uint64_t)v98, [v51 count], (uint64_t)v51);
        _os_log_debug_impl(&dword_20ABD4000, v50, v49, "App info TP (%lu): %@", v98, 0x16u);
      }
      objc_storeStrong((id *)&v50, 0);
    }
    else
    {
      os_log_t v48 = (os_log_t)&_os_log_internal;
      os_log_type_t v47 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        id v6 = v48;
        os_log_type_t v7 = v47;
        __os_log_helper_16_0_0(v46);
        _os_log_impl(&dword_20ABD4000, v6, v7, "No third party apps found", v46, 2u);
      }
      objc_storeStrong((id *)&v48, 0);
    }
    id v45 = (id)[v94 saveTasteProfileEntriesFromDict:v51 inDomain:@"apps" forSource:@"device" error:v92];
    +[AMDPerf endMonitoringEvent:@"RefreshAppInfo"];
    v96[0] = @"deletedForRefresh";
    v97[0] = v91;
    v96[1] = @"saved";
    v97[1] = v45;
    id v95 = (id)[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
    int v87 = 1;
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v57, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v71, 0);
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v73, 0);
    objc_storeStrong(&v74, 0);
    objc_storeStrong(&v75, 0);
    objc_storeStrong(&v76, 0);
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, 0);
    objc_storeStrong(&v81, 0);
    objc_storeStrong(&v82, 0);
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v84, 0);
  }
  objc_storeStrong(&v91, 0);
  uint64_t v4 = v95;

  return v4;
}

BOOL __53__AMDTasteProfile_refreshAppInformationTasteProfile___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] iTunesMetadata];
  BOOL v4 = [v3 storeItemIdentifier] != 0;

  objc_storeStrong(location, 0);
  return v4;
}

+ (BOOL)hasArcade:(id *)a3
{
  id v10 = a1;
  SEL v9 = a2;
  id v8 = a3;
  id location = (id)[a1 getFeatureWithName:@"APPS_HAS_ARCADE" inDomain:@"apps" withColumnName:0 error:a3];
  char v5 = 0;
  BOOL v4 = 0;
  if (!*v8)
  {
    BOOL v4 = 0;
    if (location)
    {
      id v6 = (id)[location getValue];
      char v5 = 1;
      BOOL v4 = [v6 longValue] != 0;
    }
  }
  BOOL v11 = v4;
  if (v5) {

  }
  objc_storeStrong(&location, 0);
  return v11;
}

+ (id)refreshServerTasteProfile:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = a4;
  id v16 = (id)[location[0] objectForKey:0x26BEAE298];
  if (v16)
  {
    id v13 = (id)[location[0] objectForKey:0x26BEADDF8];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v13;
        *id v17 = 0;
        id v19 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:v10 inDomain:v16 forSource:@"server" error:v17];
        int v14 = 1;
        objc_storeStrong(&v10, 0);
      }
      else
      {
        id v11 = (id)[NSString stringWithFormat:@"Server TP data not a dictionary for domain: %@", v16];
        id v6 = +[AMDError allocError:23 withMessage:v11];
        *id v17 = v6;
        id v20 = @"error";
        id v21 = v11;
        id v19 = (id)[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        int v14 = 1;
        objc_storeStrong(&v11, 0);
      }
    }
    else
    {
      id v12 = @"Missing TP data";
      id v5 = +[AMDError allocError:23 withMessage:v12];
      *id v17 = v5;
      unint64_t v22 = @"error";
      id v23 = v12;
      id v19 = (id)[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      int v14 = 1;
      objc_storeStrong((id *)&v12, 0);
    }
    objc_storeStrong(&v13, 0);
  }
  else
  {
    id v15 = @"Missing domian";
    id v4 = +[AMDError allocError:23 withMessage:v15];
    *id v17 = v4;
    id v24 = @"error";
    v25[0] = v15;
    id v19 = (id)[NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    int v14 = 1;
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  os_log_type_t v7 = v19;

  return v7;
}

+ (id)getPurchasedAppsSet:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v25 = a1;
  SEL v24 = a2;
  id v23 = a3;
  id v22 = +[AMDTasteProfile getFeatureValueWithName:@"APPS_PURCHASED_ALL" inDomain:@"apps" error:a3];
  if (!*v23 && v22)
  {
    id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v22, "count"));
    memset(__b, 0, sizeof(__b));
    id v11 = v22;
    uint64_t v12 = [v11 countByEnumeratingWithState:__b objects:v27 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(__b[1] + 8 * v9);
        id v5 = v17;
        id v6 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "longLongValue"));
        objc_msgSend(v5, "addObject:");

        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [v11 countByEnumeratingWithState:__b objects:v27 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    id v26 = v17;
    int v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v13 = NSString;
    id v14 = (id)[*v23 localizedDescription];
    id v21 = (id)[v13 stringWithFormat:@"Error fetching all purchases: %@", v14];

    id location = &_os_log_internal;
    os_log_type_t v19 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v28, (uint64_t)v21);
      _os_log_impl(&dword_20ABD4000, (os_log_t)location, v19, "%@", v28, 0xCu);
    }
    objc_storeStrong(&location, 0);
    +[AMDFrameworkMetrics log:v21 withKey:@"fetchAppPurchasesFailure" atVerbosity:0];
    id v26 = 0;
    int v18 = 1;
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v22, 0);
  id v3 = v26;

  return v3;
}

+ (id)getPurchasedArcadeGamesSet:(id *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v26 = a1;
  SEL v25 = a2;
  SEL v24 = a3;
  id v23 = +[AMDTasteProfile getFeatureValueWithName:@"APPS_IS_ARCADE" inDomain:@"apps" error:a3];
  if (!*v24 && v23)
  {
    id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v23, "count"));
    memset(__b, 0, sizeof(__b));
    id v11 = v23;
    uint64_t v12 = [v11 countByEnumeratingWithState:__b objects:v28 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(id *)(__b[1] + 8 * v9);
        id v15 = (id)[v23 objectForKey:v17];
        if ([v15 BOOLValue])
        {
          id v5 = v18;
          id v6 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "longLongValue"));
          objc_msgSend(v5, "addObject:");
        }
        objc_storeStrong(&v15, 0);
        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [v11 countByEnumeratingWithState:__b objects:v28 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    id v27 = v18;
    int v19 = 1;
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v13 = NSString;
    id v14 = (id)[*v24 localizedDescription];
    id v22 = (id)[v13 stringWithFormat:@"Error fetching arcade purchases: %@", v14];

    id location = &_os_log_internal;
    os_log_type_t v20 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v22);
      _os_log_impl(&dword_20ABD4000, (os_log_t)location, v20, "%@", v29, 0xCu);
    }
    objc_storeStrong(&location, 0);
    +[AMDFrameworkMetrics log:v22 withKey:@"fetchArcadePurchasesFailure" atVerbosity:0];
    id v27 = 0;
    int v19 = 1;
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v23, 0);
  id v3 = v27;

  return v3;
}

+ (void)saveMinimalCToLMapForModelId:(id)a3 usingMapData:(id)a4 andPurchases:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  id v42 = 0;
  objc_storeStrong(&v42, a5);
  id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v41 = (id)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v42, "count"));
  os_log_type_t v20 = [AMDSimpleHash alloc];
  id v40 = -[AMDSimpleHash initWithCapacity:](v20, "initWithCapacity:", [v42 count]);
  memset(__b, 0, sizeof(__b));
  id v21 = v42;
  uint64_t v22 = [v21 countByEnumeratingWithState:__b objects:v50 count:16];
  if (v22)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v22;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(v21);
      }
      id v39 = *(id *)(__b[1] + 8 * v15);
      if ((objc_msgSend(v40, "addForKey:theValue:", objc_msgSend(v39, "longLongValue"), 1) & 1) == 0)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v39);
          _os_log_error_impl(&dword_20ABD4000, log, type, "FastHash: could not save addamId %@", v49, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = [v21 countByEnumeratingWithState:__b objects:v50 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  id v35 = (unsigned int *)[v43 bytes];
  id v34 = 0;
  unsigned int v33 = 0;
  unsigned int v33 = *v35;
  os_log_t v32 = (os_log_t)&_os_log_internal;
  os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v48, [v42 count], v33);
    _os_log_debug_impl(&dword_20ABD4000, v32, v31, "SaveMinimalMap: mapping %lu values, remap from binary data (%d entries)", v48, 0x12u);
  }
  objc_storeStrong((id *)&v32, 0);
  ++v35;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  for (unsigned int i = 0; i < v33; ++i)
  {
    id v34 = v35++;
    uint64_t v29 = *(void *)v35;
    v35 += 2;
    if ([v40 getValueForKey:v29 into:&v30])
    {
      id v8 = v41;
      id v11 = (id)[NSNumber numberWithUnsignedInt:*v34];
      id v10 = (id)[NSNumber numberWithUnsignedLongLong:v29];
      id v9 = (id)[v10 stringValue];
      objc_msgSend(v8, "setObject:forKey:", v11);
    }
  }
  id v27 = (id)[NSString stringWithFormat:@"%@%@", @"__AAPS_CONTENT_TOLOGICAL_ID_MAP_", location[0]];
  id v26 = 0;
  id v46 = v27;
  id v47 = v41;
  id v7 = (id)[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  id v25 = v26;
  id v5 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:inDomain:forSource:error:](AMDTasteProfile, "saveTasteProfileEntriesFromDict:inDomain:forSource:error:");
  objc_storeStrong(&v26, v25);

  if (v26)
  {
    id v6 = (id)[v26 localizedDescription];
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");
  }
  else
  {
    id v24 = (id)[NSString stringWithFormat:@"Saved minimal map for modelId '%@': %lu of %lu values", location[0], objc_msgSend(v41, "count"), objc_msgSend(v42, "count")];
    os_log_t v23 = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v24);
      _os_log_impl(&dword_20ABD4000, v23, OS_LOG_TYPE_INFO, "%@", v45, 0xCu);
    }
    objc_storeStrong((id *)&v23, 0);
    +[AMDFrameworkMetrics log:v24 withKey:@"logicalMapSave" atVerbosity:0];
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
}

+ (void)refreshCToLMaps
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v61 = a1;
  v60[1] = (id)a2;
  v60[0] = 0;
  id v58 = 0;
  id v31 = +[AMDTasteProfile getPurchasedAppsSet:&v58];
  objc_storeStrong(v60, v58);
  id v59 = v31;
  if ([v31 count])
  {
    id v52 = v60[0];
    id v28 = +[AMDModel fetchAll:&v52];
    objc_storeStrong(v60, v52);
    id v53 = v28;
    if (v60[0])
    {
      id v51 = &_os_log_internal;
      os_log_type_t v50 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
      {
        id v27 = (id)[v60[0] localizedDescription];
        __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v27);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v51, v50, "Error fetching models' info: '%@'", v65, 0xCu);
      }
      objc_storeStrong(&v51, 0);
      int v54 = 1;
    }
    else
    {
      memset(__b, 0, sizeof(__b));
      id obj = v53;
      uint64_t v26 = [obj countByEnumeratingWithState:__b objects:v64 count:16];
      if (v26)
      {
        uint64_t v22 = *(void *)__b[2];
        uint64_t v23 = 0;
        unint64_t v24 = v26;
        while (1)
        {
          uint64_t v21 = v23;
          if (*(void *)__b[2] != v22) {
            objc_enumerationMutation(obj);
          }
          id v49 = *(id *)(__b[1] + 8 * v23);
          id v47 = (id)[v49 objectForKey:0x26BEAE8D8];
          id v46 = (id)[NSString stringWithFormat:@"RefreshCToL__%@", v47];
          +[AMDPerf startMonitoringEvent:v46];
          id v45 = (id)[v49 objectForKey:0x26BEB09F8];
          id v20 = (id)[v45 stringByAppendingPathComponent:@"model_metadata"];
          id v44 = (id)[v20 stringByAppendingPathExtension:@"json"];

          id v43 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:v44];
          if (v43)
          {
            uint64_t v2 = [AMDModelMetadata alloc];
            id v38 = v60[0];
            id v17 = [(AMDModelMetadata *)v2 initWithMetadataJSON:v43 error:&v38];
            objc_storeStrong(v60, v38);
            id v39 = v17;
            if (!v60[0] && v39)
            {
              uint64_t v12 = [AMDModelAssets alloc];
              id v11 = v45;
              id v14 = (id)[v39 getAssetsMetadata];
              id v33 = v60[0];
              id v13 = -[AMDModelAssets initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:](v12, "initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:", v11, &v33);
              objc_storeStrong(v60, v33);
              id v34 = v13;

              if (v60[0])
              {
                os_log_t v32 = (os_log_t)&_os_log_internal;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  id v9 = v32;
                  id v8 = v45;
                  id v10 = (id)[v60[0] localizedDescription];
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v62, (uint64_t)v8, (uint64_t)v10);
                  _os_log_error_impl(&dword_20ABD4000, v9, OS_LOG_TYPE_ERROR, "Error loading assets from %@: %@", v62, 0x16u);
                }
                objc_storeStrong((id *)&v32, 0);
                objc_storeStrong(v60, 0);
                int v54 = 3;
              }
              else
              {
                id v3 = (id)[v34 getContentToLogicalMap];
                BOOL v7 = v3 != 0;

                if (v7)
                {
                  id v5 = v61;
                  id v4 = v47;
                  id v6 = (id)[v34 getContentToLogicalMap];
                  objc_msgSend(v5, "saveMinimalCToLMapForModelId:usingMapData:andPurchases:", v4);

                  +[AMDPerf endMonitoringEvent:v46];
                  int v54 = 0;
                }
                else
                {
                  int v54 = 3;
                }
              }
              objc_storeStrong(&v34, 0);
            }
            else
            {
              os_log_t v37 = (os_log_t)&_os_log_internal;
              os_log_type_t v36 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                uint64_t v15 = v37;
                os_log_type_t v16 = v36;
                __os_log_helper_16_0_0(v35);
                _os_log_error_impl(&dword_20ABD4000, v15, v16, "Error initializing modelMetadata", v35, 2u);
              }
              objc_storeStrong((id *)&v37, 0);
              objc_storeStrong(v60, 0);
              int v54 = 3;
            }
            objc_storeStrong(&v39, 0);
          }
          else
          {
            id v42 = (id)[NSString stringWithFormat:@"No metadata for modelId '%@'!", v47];
            os_log_t oslog = (os_log_t)&_os_log_internal;
            os_log_type_t v40 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              id v18 = oslog;
              os_log_type_t v19 = v40;
              __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v42);
              _os_log_error_impl(&dword_20ABD4000, v18, v19, "%@", v63, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            int v54 = 3;
            objc_storeStrong(&v42, 0);
          }
          objc_storeStrong(&v43, 0);
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
          objc_storeStrong(&v46, 0);
          objc_storeStrong(&v47, 0);
          ++v23;
          if (v21 + 1 >= v24)
          {
            uint64_t v23 = 0;
            unint64_t v24 = [obj countByEnumeratingWithState:__b objects:v64 count:16];
            if (!v24) {
              break;
            }
          }
        }
      }

      int v54 = 0;
    }
    objc_storeStrong(&v53, 0);
  }
  else
  {
    id v57 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_INFO))
    {
      log = v57;
      os_log_type_t v30 = type;
      __os_log_helper_16_0_0(v55);
      _os_log_impl(&dword_20ABD4000, log, v30, "No purchases to map to logicalIds", v55, 2u);
    }
    objc_storeStrong(&v57, 0);
    int v54 = 1;
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(v60, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDTasteProfile", a2, a1);
}

@end