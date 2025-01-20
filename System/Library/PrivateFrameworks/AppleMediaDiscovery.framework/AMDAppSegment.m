@interface AMDAppSegment
+ (BOOL)evaluatePredicate:(id)a3 withOperands:(id)a4;
+ (id)assignSegmentsToApps:(id)a3 withFeatureDictionary:(id)a4 predicate:(id)a5;
+ (id)assignSegmentsWithParameters:(id)a3 error:(id *)a4;
+ (id)computeSegmentsForApps:(id)a3 withRules:(id)a4 error:(id *)a5;
+ (id)deleteAllSegments:(id *)a3;
+ (id)fetchRequest;
+ (id)getSegmentsDictForAllTreatments:(id *)a3;
+ (id)getSegmentsForTreatmentId:(id)a3 error:(id *)a4;
+ (id)getSegmentsInfoForTreatment:(id)a3 error:(id *)a4;
+ (id)refreshSegments:(id)a3 error:(id *)a4;
+ (id)refreshSegmentsForAllTreatmentsForUser:(id)a3 error:(id *)a4;
+ (void)saveSegments:(id)a3 withTreatmentId:(id)a4 andAlgoId:(id)a5 error:(id *)a6;
+ (void)validatePredicate:(id)a3 withFeatureList:(id)a4 error:(id *)a5;
@end

@implementation AMDAppSegment

+ (id)deleteAllSegments:(id *)a3
{
  id v32 = a1;
  SEL v31 = a2;
  v30 = a3;
  id v29 = +[AMDCoreDataPersistentContainer sharedContainer];
  id location = (id)[v29 getManagedObjectContext];
  uint64_t v21 = 0;
  v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  v25 = __Block_byref_object_copy__13;
  v26 = __Block_byref_object_dispose__13;
  id v27 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  id v6 = location;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __35__AMDAppSegment_deleteAllSegments___block_invoke;
  v11 = &unk_263FE1CA8;
  id v12 = location;
  v13[1] = &v21;
  v13[0] = v29;
  v13[2] = &v14;
  [v6 performBlockAndWait:&v7];
  if (v22[5])
  {
    id v3 = (id) v22[5];
    id *v30 = v3;
    id v33 = 0;
  }
  else
  {
    id v33 = (id)v15[5];
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v29, 0);
  v4 = v33;

  return v4;
}

void __35__AMDAppSegment_deleteAllSegments___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  uint64_t v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDAppSegment entity];
  id v8 = (id)[v9 name];
  v18[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  v1 = (void *)a1[4];
  id location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v15 = *location;
  id v11 = (id)[v1 executeRequest:v17 error:&v15];
  objc_storeStrong(location, v15);
  id v16 = v11;
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    int v14 = 1;
  }
  else
  {
    v2 = (void *)a1[5];
    id v6 = (id *)(*(void *)(a1[6] + 8) + 40);
    id v13 = *v6;
    [v2 save:&v13];
    objc_storeStrong(v6, v13);
    id v3 = (id)[v16 result];
    uint64_t v4 = *(void *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    int v14 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)refreshSegmentsForAllTreatmentsForUser:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v59 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = a4;
  +[AMDPerf startMonitoringEvent:@"RefreshSegments"];
  id v56 = +[AMDWorkflow getAllActiveWorkflowsForDomain:andUseCaseId:error:](AMDWorkflow, "getAllActiveWorkflowsForDomain:andUseCaseId:error:", +[AMDDomains getCodeForDomain:@"apps"], 0x26BEB06F8, a4);
  if (*a4)
  {
    id v60 = 0;
    int v55 = 1;
  }
  else if (v56)
  {
    id v51 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    memset(__b, 0, sizeof(__b));
    id v27 = v56;
    uint64_t v28 = [v27 countByEnumeratingWithState:__b objects:v63 count:16];
    if (v28)
    {
      uint64_t v24 = *(void *)__b[2];
      uint64_t v25 = 0;
      unint64_t v26 = v28;
      while (1)
      {
        uint64_t v23 = v25;
        if (*(void *)__b[2] != v24) {
          objc_enumerationMutation(v27);
        }
        id v50 = *(id *)(__b[1] + 8 * v25);
        id v48 = (id)[v50 objectForKey:@"rule_params"];
        if (v48)
        {
          id v47 = (id)[v50 objectForKey:0x26BEB05F8];
          if (!v47) {
            objc_storeStrong(&v47, @"__defaultTreatment");
          }
          id v46 = (id)[v48 objectForKey:0x26BEB06B8];
          id v45 = (id)[v48 objectForKey:0x26BEB06D8];
          id v44 = (id)[v48 objectForKey:0x26BEB0698];
          id v43 = (id)[v48 objectForKey:0x26BEB0678];
          id v42 = 0;
          if (v46 && (v45 || v44 || v43))
          {
            id v22 = (id)[v48 objectForKey:0x26BEB06B8];
            id v21 = (id)[v48 objectForKey:0x26BEB06D8];
            id v20 = (id)[v48 objectForKey:0x26BEB0698];
            id v19 = (id)[v48 objectForKey:0x26BEB0678];
            id v5 = +[AMDAppEvent getSegmentsWithLookBack:andRecencyThreshold:andFrequencyThreshold:andDurationThreshold:withUserId:error:](AMDAppEvent, "getSegmentsWithLookBack:andRecencyThreshold:andFrequencyThreshold:andDurationThreshold:withUserId:error:", v22, v21, v20);
            id v6 = v42;
            id v42 = v5;
          }
          else
          {
            id v7 = (id)[v59 assignSegmentsWithParameters:v48 error:v57];
            id v8 = v42;
            id v42 = v7;
          }
          if (*v57)
          {
            id v60 = 0;
            int v55 = 1;
          }
          else if (v42)
          {
            id v39 = (id)[v48 objectForKey:0x26BEB0658];
            id v16 = [AMDPair alloc];
            id v15 = v39 ? v39 : @"undefined";
            v38 = [(AMDPair *)v16 initWith:v42 and:v15];
            [v51 setObject:v38 forKey:v47];
            objc_storeStrong((id *)&v38, 0);
            objc_storeStrong(&v39, 0);
            int v55 = 0;
          }
          else
          {
            os_log_t v41 = (os_log_t)&_os_log_internal;
            os_log_type_t v40 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              id v17 = v41;
              os_log_type_t v18 = v40;
              __os_log_helper_16_2_1_8_64((uint64_t)v62, (uint64_t)v47);
              _os_log_error_impl(&dword_20ABD4000, v17, v18, "Programmer error! Nil segment data for treatment '%@'", v62, 0xCu);
            }
            objc_storeStrong((id *)&v41, 0);
            int v55 = 3;
          }
          objc_storeStrong(&v42, 0);
          objc_storeStrong(&v43, 0);
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
          objc_storeStrong(&v46, 0);
          objc_storeStrong(&v47, 0);
        }
        else
        {
          id v4 = +[AMDError allocError:16 withMessage:@"no segment aggregation params"];
          id *v57 = v4;
          id v60 = 0;
          int v55 = 1;
        }
        objc_storeStrong(&v48, 0);
        if (v55)
        {
          if (v55 != 3) {
            break;
          }
        }
        ++v25;
        if (v23 + 1 >= v26)
        {
          uint64_t v25 = 0;
          unint64_t v26 = [v27 countByEnumeratingWithState:__b objects:v63 count:16];
          if (!v26) {
            goto LABEL_36;
          }
        }
      }
    }
    else
    {
LABEL_36:
      int v55 = 0;
    }

    if (!v55)
    {
      id v37 = +[AMDAppSegment refreshSegments:v51 error:v57];
      if (*v57)
      {
        id v60 = 0;
        int v55 = 1;
      }
      else
      {
        os_log_t v36 = (os_log_t)&_os_log_internal;
        os_log_type_t v35 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          id v13 = v36;
          os_log_type_t v14 = v35;
          __os_log_helper_16_0_0(v34);
          _os_log_debug_impl(&dword_20ABD4000, v13, v14, "Sending IAE segment notification", v34, 2u);
        }
        objc_storeStrong((id *)&v36, 0);
        id v12 = +[AMDJSGetSegments getAppSegments:MEMORY[0x263EFFA78] error:v57];
        id v33 = (id)[v12 mutableCopy];

        if (*v57)
        {
          os_log_t v32 = (os_log_t)&_os_log_internal;
          os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            id v11 = (id)[*v57 localizedDescription];
            __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v11);
            _os_log_debug_impl(&dword_20ABD4000, v32, v31, "Error retrieving segment data for notification: %@", v61, 0xCu);
          }
          objc_storeStrong((id *)&v32, 0);
          id v60 = 0;
          int v55 = 1;
        }
        else
        {
          [v33 setObject:location[0] forKey:0x26BEAEC78];
          id v30 = (id)[MEMORY[0x263F087C8] defaultCenter];
          objc_msgSend(v30, "postNotificationName:object:userInfo:deliverImmediately:", 0x26BEB1858);
          +[AMDPerf endMonitoringEvent:@"RefreshSegments"];
          id v60 = v37;
          int v55 = 1;
          objc_storeStrong(&v30, 0);
        }
        objc_storeStrong(&v33, 0);
      }
      objc_storeStrong(&v37, 0);
    }
    objc_storeStrong(&v51, 0);
  }
  else
  {
    v54 = @"Could not refresh segments: no workflow";
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v66, (uint64_t)v54);
      _os_log_impl(&dword_20ABD4000, oslog, type, "%@", v66, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v64 = @"error";
    v65 = v54;
    id v60 = (id)[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    int v55 = 1;
    objc_storeStrong((id *)&v54, 0);
  }
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
  id v9 = v60;

  return v9;
}

+ (id)refreshSegments:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v32 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = a4;
  id v29 = (id)[v32 deleteAllSegments:a4];
  if (*a4)
  {
    id v33 = 0;
    int v28 = 1;
  }
  else
  {
    id v27 = &_os_log_internal;
    os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v29);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v27, v26, "RefreshSegments: deleted %@ segment entries", v35, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v25 setObject:v29 forKey:@"segmentsDeletedForRefresh"];
    unsigned int v24 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = location[0];
    uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
    if (v18)
    {
      uint64_t v14 = *(void *)__b[2];
      uint64_t v15 = 0;
      unint64_t v16 = v18;
      while (1)
      {
        uint64_t v13 = v15;
        if (*(void *)__b[2] != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(__b[1] + 8 * v15);
        id v21 = (id)[location[0] objectForKey:v23];
        id v20 = (id)[v21 first];
        int v4 = [v20 count];
        v24 += v4;
        id v11 = v32;
        id v9 = v20;
        uint64_t v10 = v23;
        id v12 = (id)[v21 second];
        objc_msgSend(v11, "saveSegments:withTreatmentId:andAlgoId:error:", v9, v10);

        if (*v30)
        {
          id v33 = 0;
          int v28 = 1;
        }
        else
        {
          int v28 = 0;
        }
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v21, 0);
        if (v28) {
          break;
        }
        ++v15;
        if (v13 + 1 >= v16)
        {
          uint64_t v15 = 0;
          unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
          if (!v16) {
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
      id v7 = v25;
      id v8 = (id)[NSNumber numberWithInt:v24];
      objc_msgSend(v7, "setObject:forKey:");

      id v33 = v25;
      int v28 = 1;
    }
    objc_storeStrong(&v25, 0);
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  id v5 = v33;

  return v5;
}

+ (void)saveSegments:(id)a3 withTreatmentId:(id)a4 andAlgoId:(id)a5 error:(id *)a6
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = a6;
  id v28 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v27 = (id)[v28 getManagedObjectContext];
  uint64_t v20 = 0;
  id v21 = &v20;
  int v22 = 838860800;
  int v23 = 48;
  unsigned int v24 = __Block_byref_object_copy__13;
  id v25 = __Block_byref_object_dispose__13;
  id v26 = 0;
  id v9 = v27;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = __62__AMDAppSegment_saveSegments_withTreatmentId_andAlgoId_error___block_invoke;
  uint64_t v14 = &unk_263FE27D8;
  id v15 = location[0];
  id v16 = v27;
  id v17 = v31;
  id v18 = v30;
  v19[0] = v28;
  v19[1] = &v20;
  [v9 performBlockAndWait:&v10];
  if (v21[5]) {
    *id v29 = (id) v21[5];
  }
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v20, 8);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __62__AMDAppSegment_saveSegments_withTreatmentId_andAlgoId_error___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v27 = a1;
  uint64_t v26 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v18)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    unint64_t v15 = v18;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(id *)(__b[1] + 8 * v14);
      id v23 = (id)[*(id *)(a1 + 32) objectForKey:v25];
      memset(v21, 0, sizeof(v21));
      id v10 = v23;
      uint64_t v11 = [v10 countByEnumeratingWithState:v21 objects:v28 count:16];
      if (v11)
      {
        uint64_t v7 = *(void *)v21[2];
        uint64_t v8 = 0;
        unint64_t v9 = v11;
        while (1)
        {
          uint64_t v6 = v8;
          if (*(void *)v21[2] != v7) {
            objc_enumerationMutation(v10);
          }
          uint64_t v22 = *(void *)(v21[1] + 8 * v8);
          id v3 = (void *)MEMORY[0x263EFF240];
          id v5 = (id)+[AMDAppSegment entity];
          id v4 = (id)[v5 name];
          id v20 = (id)objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:");

          objc_msgSend(v20, "setAdamId:", objc_msgSend(v25, "longLongValue"));
          [v20 setSegment:v22];
          [v20 setTreatmentId:*(void *)(a1 + 48)];
          [v20 setAlgoId:*(void *)(a1 + 56)];
          objc_storeStrong(&v20, 0);
          ++v8;
          if (v6 + 1 >= v9)
          {
            uint64_t v8 = 0;
            unint64_t v9 = [v10 countByEnumeratingWithState:v21 objects:v28 count:16];
            if (!v9) {
              break;
            }
          }
        }
      }

      objc_storeStrong(&v23, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  v1 = *(void **)(a1 + 64);
  v2 = (id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v19 = *v2;
  [v1 save:&v19];
  objc_storeStrong(v2, v19);
}

+ (id)getSegmentsForTreatmentId:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = a4;
  id v31 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v30 = (id)[v31 getManagedObjectContext];
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  int v25 = 838860800;
  int v26 = 48;
  uint64_t v27 = __Block_byref_object_copy__13;
  id v28 = __Block_byref_object_dispose__13;
  id v29 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  int v18 = 838860800;
  int v19 = 48;
  id v20 = __Block_byref_object_copy__13;
  id v21 = __Block_byref_object_dispose__13;
  id v22 = 0;
  id v8 = v30;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  uint64_t v12 = __49__AMDAppSegment_getSegmentsForTreatmentId_error___block_invoke;
  uint64_t v13 = &unk_263FE1CA8;
  id v14 = location[0];
  v15[1] = &v16;
  v15[0] = v30;
  v15[2] = &v23;
  [v8 performBlockAndWait:&v9];
  if (v24[5])
  {
    id v4 = (id) v24[5];
    *id v32 = v4;
    id v34 = 0;
  }
  else
  {
    id v34 = (id)v17[5];
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v14, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  id v5 = v34;

  return v5;
}

void __49__AMDAppSegment_getSegmentsForTreatmentId_error___block_invoke(void *a1)
{
  v12[2] = a1;
  v12[1] = a1;
  uint64_t v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDAppSegment entity];
  id v8 = (id)[v9 name];
  v12[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  if (a1[4])
  {
    id v6 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"treatmentId == %@", a1[4]];
    objc_msgSend(v12[0], "setPredicate:");
  }
  [v12[0] setResultType:2];
  v1 = (void *)a1[5];
  id location = (id *)(*(void *)(a1[7] + 8) + 40);
  id v11 = *location;
  id v5 = (id)[v1 executeFetchRequest:v12[0] error:&v11];
  objc_storeStrong(location, v11);
  uint64_t v2 = *(void *)(a1[6] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v5;

  objc_storeStrong(v12, 0);
}

+ (id)getSegmentsInfoForTreatment:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v30 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28[1] = a4;
  v28[0] = (id)[v30 getSegmentsForTreatmentId:location[0] error:a4];
  if (*a4)
  {
    uint64_t v31 = 0;
    int v27 = 1;
  }
  else if ([v28[0] count])
  {
    id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    memset(__b, 0, sizeof(__b));
    id obj = v28[0];
    uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
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
        id v25 = *(id *)(__b[1] + 8 * v14);
        id v23 = (id)[v25 objectForKey:@"adamId"];
        id v22 = (id)[v25 objectForKey:@"segment"];
        id v21 = (id)[NSString stringWithFormat:@"%@", v23];
        id v20 = (id)[v26 objectForKey:v21];
        if (v20)
        {
          [v20 addObject:v22];
        }
        else
        {
          id v10 = v26;
          id v5 = objc_alloc(MEMORY[0x263EFF980]);
          id v11 = (id)objc_msgSend(v5, "initWithObjects:", v22, 0);
          objc_msgSend(v10, "setObject:forKey:");
        }
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    id v9 = (id)[v28[0] firstObject];
    id v19 = (id)[v9 objectForKey:@"algoId"];

    id v6 = [AMDPair alloc];
    uint64_t v31 = [(AMDPair *)v6 initWith:v26 and:v19];
    int v27 = 1;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v4 = [AMDPair alloc];
    uint64_t v31 = [(AMDPair *)v4 initWith:MEMORY[0x263EFFA78] and:@"noApplicable"];
    int v27 = 1;
  }
  objc_storeStrong(v28, 0);
  objc_storeStrong(location, 0);
  uint64_t v7 = (void *)v31;

  return v7;
}

+ (id)getSegmentsDictForAllTreatments:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v33 = a1;
  SEL v32 = a2;
  uint64_t v31 = a3;
  id v30 = (id)[a1 getSegmentsForTreatmentId:0 error:a3];
  if (*v31)
  {
    id v34 = 0;
    int v29 = 1;
  }
  else
  {
    id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    memset(__b, 0, sizeof(__b));
    id obj = v30;
    uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
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
        id v25 = (id)[v27 objectForKey:@"treatmentId"];
        id v24 = (id)[v27 objectForKey:@"algoId"];
        id v23 = (id)[v27 objectForKey:@"adamId"];
        id v22 = (id)[v27 objectForKey:@"segment"];
        id v21 = (id)[v28 objectForKey:v25];
        if (!v21)
        {
          id v10 = [AMDPair alloc];
          id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          id v3 = -[AMDPair initWith:and:](v10, "initWith:and:");
          id v4 = v21;
          id v21 = v3;
        }
        [v28 setObject:v21 forKey:v25];
        id v20 = (id)[v21 first];
        id v19 = (id)[NSString stringWithFormat:@"%@", v23];
        id location = (id)[v20 objectForKey:v19];
        if (location)
        {
          [location addObject:v22];
        }
        else
        {
          id v8 = v20;
          id v5 = objc_alloc(MEMORY[0x263EFF980]);
          id v9 = (id)objc_msgSend(v5, "initWithObjects:", v22, 0);
          objc_msgSend(v8, "setObject:forKey:");
        }
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
        objc_storeStrong(&v25, 0);
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    id v34 = v28;
    int v29 = 1;
    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(&v30, 0);
  id v6 = v34;

  return v6;
}

+ (void)validatePredicate:(id)a3 withFeatureList:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  v17[1] = a5;
  v17[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  id v10 = v18;
  uint64_t v11 = [v10 countByEnumeratingWithState:__b objects:v20 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = *(void *)(__b[1] + 8 * v8);
      [v17[0] setObject:MEMORY[0x263EFFA88] forKey:v16];
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [v10 countByEnumeratingWithState:__b objects:v20 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v5 = (id)[MEMORY[0x263F08A98] predicateWithFormat:location[0]];
  id v14 = (id)[v5 predicateWithSubstitutionVariables:v17[0]];

  [v14 evaluateWithObject:0];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)evaluatePredicate:(id)a3 withOperands:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v6 = (id)[MEMORY[0x263F08A98] predicateWithFormat:location[0]];
  id v8 = (id)[v6 predicateWithSubstitutionVariables:v9];

  char v7 = [v8 evaluateWithObject:0];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

+ (id)assignSegmentsToApps:(id)a3 withFeatureDictionary:(id)a4 predicate:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v38 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = 0;
  objc_storeStrong(&v36, a4);
  id v35 = 0;
  objc_storeStrong(&v35, a5);
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  id v26 = location[0];
  uint64_t v27 = [v26 countByEnumeratingWithState:__b objects:v42 count:16];
  if (v27)
  {
    uint64_t v21 = *(void *)__b[2];
    uint64_t v22 = 0;
    unint64_t v23 = v27;
    while (1)
    {
      uint64_t v20 = v22;
      if (*(void *)__b[2] != v21) {
        objc_enumerationMutation(v26);
      }
      id v33 = *(id *)(__b[1] + 8 * v22);
      id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      memset(v29, 0, sizeof(v29));
      id v18 = v36;
      uint64_t v19 = [v18 countByEnumeratingWithState:v29 objects:v41 count:16];
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
          id v28 = (id)[v36 objectForKey:v30];
          id v13 = (id)[v28 objectForKey:v33];

          if (v13) {
            [v31 setObject:MEMORY[0x263EFFA88] forKey:v30];
          }
          else {
            [v31 setObject:MEMORY[0x263EFFA80] forKey:v30];
          }
          objc_storeStrong(&v28, 0);
          ++v16;
          if (v14 + 1 >= v17)
          {
            uint64_t v16 = 0;
            unint64_t v17 = [v18 countByEnumeratingWithState:v29 objects:v41 count:16];
            if (!v17) {
              break;
            }
          }
        }
      }

      if ([v38 evaluatePredicate:v35 withOperands:v31])
      {
        id v10 = v34;
        os_log_type_t v40 = @"1";
        id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
        id v11 = (id)objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v33, "longLongValue"));
        objc_msgSend(v10, "setObject:forKey:", v12);
      }
      else
      {
        id v7 = v34;
        id v39 = @"2";
        id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
        id v8 = (id)objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v33, "longLongValue"));
        objc_msgSend(v7, "setObject:forKey:", v9);
      }
      objc_storeStrong(&v31, 0);
      ++v22;
      if (v20 + 1 >= v23)
      {
        uint64_t v22 = 0;
        unint64_t v23 = [v26 countByEnumeratingWithState:__b objects:v42 count:16];
        if (!v23) {
          break;
        }
      }
    }
  }

  id v6 = v34;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);

  return v6;
}

+ (id)computeSegmentsForApps:(id)a3 withRules:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v34 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = 0;
  objc_storeStrong(&v32, a4);
  id v31 = a5;
  id v30 = (id)[v32 objectForKey:@"features"];
  id v29 = (id)[v32 objectForKey:@"predicate"];
  if (v30 && v29)
  {
    [v34 validatePredicate:v29 withFeatureList:v30 error:v31];
    if (*v31)
    {
      id v35 = 0;
      int v25 = 1;
    }
    else
    {
      id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
      memset(__b, 0, sizeof(__b));
      id v14 = v30;
      uint64_t v15 = [v14 countByEnumeratingWithState:__b objects:v36 count:16];
      if (v15)
      {
        uint64_t v11 = *(void *)__b[2];
        uint64_t v12 = 0;
        unint64_t v13 = v15;
        while (1)
        {
          uint64_t v10 = v12;
          if (*(void *)__b[2] != v11) {
            objc_enumerationMutation(v14);
          }
          uint64_t v22 = *(void *)(__b[1] + 8 * v12);
          id v20 = +[AMDTasteProfile getFeatureValueWithName:v22 inDomain:@"apps" error:v31];
          if (*v31)
          {
            int v25 = 2;
          }
          else if (v20)
          {
            [v24 setObject:v20 forKey:v22];
            int v25 = 0;
          }
          else
          {
            [v23 addObject:v22];
            int v25 = 3;
          }
          objc_storeStrong(&v20, 0);
          if (v25)
          {
            if (v25 != 3) {
              break;
            }
          }
          ++v12;
          if (v10 + 1 >= v13)
          {
            uint64_t v12 = 0;
            unint64_t v13 = [v14 countByEnumeratingWithState:__b objects:v36 count:16];
            if (!v13) {
              goto LABEL_21;
            }
          }
        }
      }
      else
      {
LABEL_21:
        int v25 = 0;
      }

      if (*v31)
      {
        id v35 = 0;
        int v25 = 1;
      }
      else
      {
        uint64_t v9 = [v30 count];
        if (v9 == [v24 count])
        {
          id v18 = (id)[v34 assignSegmentsToApps:location[0] withFeatureDictionary:v24 predicate:v29];
          id v35 = v18;
          int v25 = 1;
          objc_storeStrong(&v18, 0);
        }
        else
        {
          id v19 = (id)[NSString stringWithFormat:@"Requested features are absent: %@", v23];
          id v6 = +[AMDError allocError:21 withMessage:v19];
          *id v31 = v6;
          id v35 = 0;
          int v25 = 1;
          objc_storeStrong(&v19, 0);
        }
      }
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v24, 0);
    }
  }
  else
  {
    id v28 = @"Segmentation Error: Feature List or Predicate absent";
    id v27 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v28);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v27, type, "%@", v37, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    id v5 = +[AMDError allocError:21 withMessage:v28];
    *id v31 = v5;
    id v35 = 0;
    int v25 = 1;
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  id v7 = v35;

  return v7;
}

+ (id)assignSegmentsWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v47 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = a4;
  id v44 = +[AMDTasteProfile getFeatureValueWithName:0x26BEB7DB8 inDomain:@"apps" error:a4];
  if (*a4)
  {
    id v48 = 0;
    int v43 = 1;
  }
  else if (v44)
  {
    id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unsigned int v36 = 0;
    memset(__b, 0, sizeof(__b));
    id v22 = v44;
    uint64_t v23 = [v22 countByEnumeratingWithState:__b objects:v49 count:16];
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
        uint64_t v35 = *(void *)(__b[1] + 8 * v20);
        id v33 = (id)[location[0] objectForKey:v35];
        id v32 = (id)[v44 objectForKey:v35];
        if (v33)
        {
          id v31 = 0;
          id v29 = 0;
          id v17 = (id)[v47 computeSegmentsForApps:v32 withRules:v33 error:&v29];
          objc_storeStrong(&v31, v29);
          id v30 = v17;
          if (v31)
          {
            id v15 = v37;
            id v16 = (id)[v31 localizedDescription];
            objc_msgSend(v15, "setObject:forKey:");

            [v39 addObject:v32];
            int v43 = 3;
          }
          else
          {
            int v5 = [v30 count];
            v36 += v5;
            [v38 addEntriesFromDictionary:v30];
            int v43 = 0;
          }
          objc_storeStrong(&v30, 0);
          objc_storeStrong(&v31, 0);
        }
        else
        {
          [v39 addObjectsFromArray:v32];
          int v43 = 3;
        }
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
        ++v20;
        if (v18 + 1 >= v21)
        {
          uint64_t v20 = 0;
          unint64_t v21 = [v22 countByEnumeratingWithState:__b objects:v49 count:16];
          if (!v21) {
            break;
          }
        }
      }
    }

    id v13 = v37;
    id v14 = (id)[NSNumber numberWithInt:v36];
    objc_msgSend(v13, "setObject:forKey:");

    id v28 = 0;
    id v27 = (id)[location[0] objectForKey:@"default"];
    if (v27)
    {
      id v25 = v28;
      id v12 = (id)[v47 computeSegmentsForApps:v39 withRules:v27 error:&v25];
      objc_storeStrong(&v28, v25);
      id v26 = v12;
      if (v28)
      {
        id v10 = v37;
        id v11 = (id)[v28 localizedDescription];
        objc_msgSend(v10, "setObject:forKey:");
      }
      else
      {
        [v38 addEntriesFromDictionary:v26];
        id v8 = v37;
        id v9 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
        objc_msgSend(v8, "setObject:forKey:");
      }
      +[AMDFrameworkMetrics log:v37 withKey:@"segmentationSummary" atVerbosity:0];
      id v48 = v38;
      int v43 = 1;
      objc_storeStrong(&v26, 0);
    }
    else
    {
      [v37 setObject:@"Default segmentation rules absent" forKey:@"default"];
      +[AMDFrameworkMetrics log:v37 withKey:@"segmentationSummary" atVerbosity:0];
      id v48 = v38;
      int v43 = 1;
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id v42 = @"AMD_TP_APP_LIST_BY_GENRE feature unavailable on the device";
    id v41 = &_os_log_internal;
    os_log_type_t v40 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v50, (uint64_t)v42);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v41, v40, "%@", v50, 0xCu);
    }
    objc_storeStrong(&v41, 0);
    +[AMDFrameworkMetrics log:v42 withKey:@"SegmentComputationFailed" atVerbosity:0];
    id v4 = +[AMDError allocError:21 withMessage:v42];
    *id v45 = v4;
    id v48 = 0;
    int v43 = 1;
    objc_storeStrong((id *)&v42, 0);
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  id v6 = v48;

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDAppSegment", a2, a1);
}

@end