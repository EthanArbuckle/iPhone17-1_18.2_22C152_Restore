@interface AMDWorkflow
+ (id)deleteAllWorkflows:(id *)a3;
+ (id)deleteWithPredicate:(id)a3 error:(id *)a4;
+ (id)deleteWorkflowForDomain:(int64_t)a3 withModelId:(id)a4 withSecondaryModelId:(id)a5 andUsecaseId:(id)a6 andTreatmentId:(id)a7 error:(id *)a8;
+ (id)deleteWorkflowsForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6;
+ (id)deleteWorkflowsForDomain:(int64_t)a3 error:(id *)a4;
+ (id)deleteWorkflowsForModelId:(id)a3 error:(id *)a4;
+ (id)fetchAllWorkflows:(id *)a3;
+ (id)fetchRequest;
+ (id)fetchWithPredicates:(id)a3 error:(id *)a4;
+ (id)getAllActiveWorkflowsForDomain:(int64_t)a3 andUseCaseId:(id)a4 error:(id *)a5;
+ (id)getAllWorkflowsForDomain:(int64_t)a3 withUseCaseId:(id)a4 error:(id *)a5;
+ (id)getCurrentWorkflowForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6;
+ (id)getWorkflowsForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6;
+ (id)getWorkflowsForDomain:(int64_t)a3 error:(id *)a4;
+ (id)getWorkflowsForModelId:(id)a3 error:(id *)a4;
+ (id)performWorkflowCleanupForDomain:(int64_t)a3 error:(id *)a4;
+ (void)addWorkflowsFromInflightTable:(id)a3 error:(id *)a4;
+ (void)saveWorkflow:(id)a3 forDomain:(int64_t)a4 withCallUUID:(id)a5 error:(id *)a6;
@end

@implementation AMDWorkflow

+ (void)saveWorkflow:(id)a3 forDomain:(int64_t)a4 withCallUUID:(id)a5 error:(id *)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v49 = (void *)a4;
  id v48 = 0;
  objc_storeStrong(&v48, a5);
  v47 = a6;
  v14 = [AMDUseCaseWorkflow alloc];
  id v46 = [(AMDUseCaseWorkflow *)v14 initWithDictionary:location[0]];
  if ([v46 isValid])
  {
    id v41 = (id)[MEMORY[0x263F08900] dataWithJSONObject:location[0] options:6 error:v47];
    if (*v47)
    {
      v9 = NSString;
      id v8 = (id)[*v47 localizedDescription];
      id v40 = (id)[v9 stringWithFormat:@"Error serializing segment workflow: '%@'", v8];

      id v39 = &_os_log_internal;
      os_log_type_t v38 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v51, (uint64_t)v40);
        _os_log_impl(&dword_20ABD4000, (os_log_t)v39, v38, "%@", v51, 0xCu);
      }
      objc_storeStrong(&v39, 0);
      +[AMDFrameworkMetrics log:v40 withKey:@"SaveSegmentWorkflowFailure" atVerbosity:0];
      int v42 = 1;
      objc_storeStrong(&v40, 0);
    }
    else
    {
      uint64_t v31 = 0;
      v32 = &v31;
      int v33 = 838860800;
      int v34 = 48;
      v35 = __Block_byref_object_copy__1;
      v36 = __Block_byref_object_dispose__1;
      id v37 = 0;
      id v30 = +[AMDCoreDataPersistentContainer sharedContainer];
      id v29 = (id)[v30 getManagedObjectContext];
      id v7 = v29;
      uint64_t v18 = MEMORY[0x263EF8330];
      int v19 = -1073741824;
      int v20 = 0;
      v21 = __57__AMDWorkflow_saveWorkflow_forDomain_withCallUUID_error___block_invoke;
      v22 = &unk_263FE1EF8;
      id v23 = v29;
      v28[2] = v49;
      id v24 = v46;
      id v25 = v48;
      id v26 = v41;
      id v27 = location[0];
      v28[0] = v30;
      v28[1] = &v31;
      [v7 performBlockAndWait:&v18];
      if (v32[5])
      {
        id v6 = (id) v32[5];
        id *v47 = v6;
      }
      objc_storeStrong(v28, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
      _Block_object_dispose(&v31, 8);
      objc_storeStrong(&v37, 0);
      int v42 = 0;
    }
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v13 = NSString;
    id v12 = (id)[location[0] objectForKey:@"use_case_id"];
    id v11 = (id)[location[0] objectForKey:@"model_id"];
    id v45 = (id)[v13 stringWithFormat:@"Invalid segment workflow, useCaseId: '%@' modelId: '%@'", v12, v11];

    id v44 = &_os_log_internal;
    os_log_type_t v43 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v45);
      _os_log_impl(&dword_20ABD4000, (os_log_t)v44, v43, "%@", v52, 0xCu);
    }
    objc_storeStrong(&v44, 0);
    +[AMDFrameworkMetrics log:v45 withKey:@"SaveSegmentWorkflowFailure" atVerbosity:0];
    id v10 = +[AMDError allocError:19 withMessage:v45];
    id *v47 = v10;
    int v42 = 1;
    objc_storeStrong(&v45, 0);
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
}

void __57__AMDWorkflow_saveWorkflow_forDomain_withCallUUID_error___block_invoke(uint64_t a1)
{
  v16[2] = (id)a1;
  v16[1] = (id)a1;
  id v6 = (void *)MEMORY[0x263EFF240];
  id v8 = (id)+[AMDWorkflow entity];
  id v7 = (id)[v8 name];
  v16[0] = (id)objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:");

  [v16[0] setDomain:(__int16)*(void *)(a1 + 88)];
  id v9 = (id)[*(id *)(a1 + 40) getUseCaseId];
  objc_msgSend(v16[0], "setUseCaseId:");

  [v16[0] setCallUUID:*(void *)(a1 + 48)];
  id location = (id)[*(id *)(a1 + 40) getTreatmentId];
  if (location) {
    objc_storeStrong(&location, location);
  }
  else {
    objc_storeStrong(&location, @"__defaultTreatment");
  }
  [v16[0] setTreatmentId:location];
  [v16[0] setWorkflow:*(void *)(a1 + 56)];
  id v4 = v16[0];
  id v5 = (id)[*(id *)(a1 + 64) objectForKey:@"model_id"];
  objc_msgSend(v4, "setModelId:");

  id v14 = (id)[*(id *)(a1 + 64) objectForKey:@"secondary_model_id"];
  if (v14) {
    [v16[0] setSecondaryModelId:v14];
  }
  id v13 = (id)[*(id *)(a1 + 64) objectForKey:@"startTime"];
  id v12 = (id)[*(id *)(a1 + 64) objectForKey:@"endTime"];
  if (v13 && v12)
  {
    objc_msgSend(v16[0], "setStartTime:", objc_msgSend(v13, "unsignedLongLongValue"));
    objc_msgSend(v16[0], "setEndTime:", objc_msgSend(v12, "unsignedLongLongValue"));
  }
  v1 = *(void **)(a1 + 72);
  v2 = (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v11 = *v2;
  objc_msgSend(v1, "save:", &v11, v2);
  objc_storeStrong(v3, v11);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v16, 0);
}

+ (void)addWorkflowsFromInflightTable:(id)a3 error:(id *)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  id v16 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v15 = (id)[v16 getManagedObjectContext];
  id v5 = v15;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __51__AMDWorkflow_addWorkflowsFromInflightTable_error___block_invoke;
  id v11 = &unk_263FE1C08;
  id v12 = location[0];
  id v13 = v15;
  v14[0] = v16;
  v14[1] = &v17;
  [v5 performBlockAndWait:&v7];
  if (v18[5])
  {
    id v4 = (id) v18[5];
    *id v24 = v4;
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __51__AMDWorkflow_addWorkflowsFromInflightTable_error___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v36 = a1;
  uint64_t v35 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v30 = [obj countByEnumeratingWithState:__b objects:v37 count:16];
  if (v30)
  {
    uint64_t v25 = *(void *)__b[2];
    uint64_t v26 = 0;
    unint64_t v27 = v30;
    while (1)
    {
      uint64_t v24 = v26;
      if (*(void *)__b[2] != v25) {
        objc_enumerationMutation(obj);
      }
      id v34 = *(id *)(__b[1] + 8 * v26);
      v3 = (void *)MEMORY[0x263EFF240];
      id v5 = (id)+[AMDWorkflow entity];
      id v4 = (id)[v5 name];
      id v32 = (id)objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:");

      id v6 = v32;
      id v7 = (id)[v34 objectForKey:@"domain"];
      objc_msgSend(v6, "setDomain:", (__int16)objc_msgSend(v7, "shortValue"));

      id v8 = v32;
      id v9 = (id)[v34 objectForKey:@"useCaseId"];
      objc_msgSend(v8, "setUseCaseId:");

      id v10 = v32;
      id v11 = (id)[v34 objectForKey:@"treatmentId"];
      objc_msgSend(v10, "setTreatmentId:");

      id v12 = v32;
      id v13 = (id)[v34 objectForKey:@"workflow"];
      objc_msgSend(v12, "setWorkflow:");

      id v14 = v32;
      id v15 = (id)[v34 objectForKey:@"startTime"];
      objc_msgSend(v14, "setStartTime:", objc_msgSend(v15, "longLongValue"));

      id v16 = v32;
      id v17 = (id)[v34 objectForKey:@"endTime"];
      objc_msgSend(v16, "setEndTime:", objc_msgSend(v17, "longLongValue"));

      id v18 = v32;
      id v19 = (id)[v34 objectForKey:@"modelId"];
      objc_msgSend(v18, "setModelId:");

      id v20 = v32;
      id v21 = (id)[v34 objectForKey:@"callUUID"];
      objc_msgSend(v20, "setCallUUID:");

      id v22 = v32;
      id v23 = (id)[v34 objectForKey:@"secondaryModelId"];
      objc_msgSend(v22, "setSecondaryModelId:");

      objc_storeStrong(&v32, 0);
      ++v26;
      if (v24 + 1 >= v27)
      {
        uint64_t v26 = 0;
        unint64_t v27 = [obj countByEnumeratingWithState:__b objects:v37 count:16];
        if (!v27) {
          break;
        }
      }
    }
  }

  v1 = *(void **)(a1 + 48);
  v2 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v31 = *v2;
  [v1 save:&v31];
  objc_storeStrong(v2, v31);
}

+ (id)deleteWorkflowsForModelId:(id)a3 error:(id *)a4
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = v9;
  id v6 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"modelId == %d", location[0]);
  id v7 = (id)objc_msgSend(v5, "deleteWithPredicate:error:");

  objc_storeStrong(location, 0);

  return v7;
}

+ (id)deleteWorkflowsForDomain:(int64_t)a3 error:(id *)a4
{
  id v6 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"domain == %d", a3);
  id v7 = (id)objc_msgSend(a1, "deleteWithPredicate:error:");

  return v7;
}

+ (id)deleteWorkflowForDomain:(int64_t)a3 withModelId:(id)a4 withSecondaryModelId:(id)a5 andUsecaseId:(id)a6 andTreatmentId:(id)a7 error:(id *)a8
{
  id v24 = a1;
  SEL v23 = a2;
  int64_t v22 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  id v19 = 0;
  objc_storeStrong(&v19, a6);
  id v18 = 0;
  objc_storeStrong(&v18, a7);
  id v17 = a8;
  id v16 = 0;
  if (v20) {
    id v8 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"domain == %d && modelId == %@ && secondaryModelId == %@ && useCaseId == %@ && treatmentId == %@", v22, location, v20, v19, v18];
  }
  else {
    id v8 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"domain == %d && modelId == %@ && useCaseId == %@ && treatmentId == %@", v22, location, v19, v18];
  }
  id v9 = v16;
  id v16 = v8;

  id v11 = (id)[v24 deleteWithPredicate:v16 error:v17];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);

  return v11;
}

+ (id)deleteWorkflowsForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6
{
  id v15 = a1;
  SEL v14 = a2;
  int64_t v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  v10[1] = a6;
  v10[0] = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"domain == %d && treatmentId == %@ && useCaseId == %@", v13, location, v11];
  id v9 = (id)[v15 deleteWithPredicate:v10[0] error:a6];
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);

  return v9;
}

+ (id)deleteAllWorkflows:(id *)a3
{
  return (id)[a1 deleteWithPredicate:0 error:a3];
}

+ (id)deleteWithPredicate:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  id v29 = __Block_byref_object_copy__1;
  uint64_t v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  int64_t v22 = __Block_byref_object_copy__1;
  SEL v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  id v17 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v17 getManagedObjectContext];
  id v6 = v16;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __41__AMDWorkflow_deleteWithPredicate_error___block_invoke;
  id v12 = &unk_263FE1C58;
  id v13 = location[0];
  id v14 = v16;
  v15[1] = &v25;
  v15[0] = v17;
  v15[2] = &v18;
  [v6 performBlockAndWait:&v8];
  if (v26[5])
  {
    id *v32 = (id) v26[5];
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
  id v4 = v34;

  return v4;
}

void __41__AMDWorkflow_deleteWithPredicate_error___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  int v9 = (void *)MEMORY[0x263EFF260];
  id v11 = (id)+[AMDWorkflow entity];
  id v10 = (id)[v11 name];
  v18[0] = (id)objc_msgSend(v9, "fetchRequestWithEntityName:");

  if (a1[4]) {
    [v18[0] setPredicate:a1[4]];
  }
  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  v1 = (void *)a1[5];
  id location = (id *)(*(void *)(a1[7] + 8) + 40);
  id v15 = *location;
  id v8 = (id)[v1 executeRequest:v17 error:&v15];
  objc_storeStrong(location, v15);
  id v16 = v8;
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    int v14 = 1;
  }
  else
  {
    v2 = (void *)a1[6];
    id v6 = (id *)(*(void *)(a1[7] + 8) + 40);
    id v13 = *v6;
    [v2 save:&v13];
    objc_storeStrong(v6, v13);
    id v3 = (id)[v16 result];
    uint64_t v4 = *(void *)(a1[8] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    int v14 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)fetchWithPredicates:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  int v28 = __Block_byref_object_copy__1;
  id v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  int v21 = __Block_byref_object_copy__1;
  int64_t v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  id v16 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v15 = (id)[v16 getManagedObjectContext];
  id v6 = v15;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __41__AMDWorkflow_fetchWithPredicates_error___block_invoke;
  id v12 = &unk_263FE1CA8;
  id v13 = location[0];
  v14[1] = &v17;
  v14[0] = v15;
  id v14[2] = &v24;
  [v6 performBlockAndWait:&v8];
  if (v25[5])
  {
    *id v31 = (id) v25[5];
    id v33 = 0;
  }
  else
  {
    id v33 = (id)v18[5];
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  uint64_t v4 = v33;

  return v4;
}

void __41__AMDWorkflow_fetchWithPredicates_error___block_invoke(void *a1)
{
  v12[2] = a1;
  v12[1] = a1;
  id v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDWorkflow entity];
  id v8 = (id)[v9 name];
  v12[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  if (a1[4])
  {
    id v6 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:a1[4]];
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

+ (id)getWorkflowsForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6
{
  id v19 = a1;
  SEL v18 = a2;
  int64_t v17 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  int v14 = a6;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"domain == %d", v17);
  objc_msgSend(v13, "addObject:");

  id v12 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"useCaseId == %@", v15];
  objc_msgSend(v13, "addObject:");

  if (location)
  {
    id v8 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"treatmentId == %@ || treatmentId == %@", @"__defaultTreatment", location];
    objc_msgSend(v13, "addObject:");
  }
  id v7 = (id)[v19 fetchWithPredicates:v13 error:v14];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);

  return v7;
}

+ (id)getWorkflowsForDomain:(int64_t)a3 error:(id *)a4
{
  id v12 = a1;
  SEL v11 = a2;
  int64_t v10 = a3;
  id v9 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = v8;
  id v6 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"domain == %d", v10);
  objc_msgSend(v5, "addObject:");

  id v7 = (id)[v12 fetchWithPredicates:v8 error:v9];
  objc_storeStrong(&v8, 0);

  return v7;
}

+ (id)getAllWorkflowsForDomain:(int64_t)a3 withUseCaseId:(id)a4 error:(id *)a5
{
  id v17 = a1;
  SEL v16 = a2;
  int64_t v15 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v13 = a5;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = v12;
  id v8 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"domain == %d", v15);
  objc_msgSend(v7, "addObject:");

  id v9 = v12;
  id v10 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"useCaseId == %@", location];
  objc_msgSend(v9, "addObject:");

  id v11 = (id)[v17 fetchWithPredicates:v12 error:v13];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);

  return v11;
}

+ (id)getWorkflowsForModelId:(id)a3 error:(id *)a4
{
  id v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = v9;
  id v7 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"modelId == %@ || secondaryModelId == %@", location[0], location[0]];
  objc_msgSend(v6, "addObject:");

  id v8 = (id)[v12 fetchWithPredicates:v9 error:v10];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v8;
}

+ (id)getAllActiveWorkflowsForDomain:(int64_t)a3 andUseCaseId:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v28 = a1;
  SEL v27 = a2;
  int64_t v26 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  uint64_t v24 = a5;
  id v23 = +[AMDWorkflow getAllWorkflowsForDomain:v26 withUseCaseId:location error:a5];
  if (*a5)
  {
    id v29 = 0;
    int v22 = 1;
  }
  else if (v23 && [v23 count])
  {
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(__b, 0, sizeof(__b));
    id v11 = v23;
    uint64_t v12 = [v11 countByEnumeratingWithState:__b objects:v30 count:16];
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
        id v15 = (id)[v17 objectForKey:@"workflow"];
        id v14 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v15 options:4 error:v24];
        if (*v24)
        {
          id v29 = 0;
          int v22 = 1;
        }
        else
        {
          [v18 addObject:v14];
          int v22 = 0;
        }
        objc_storeStrong(&v14, 0);
        objc_storeStrong(&v15, 0);
        if (v22) {
          break;
        }
        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [v11 countByEnumeratingWithState:__b objects:v30 count:16];
          if (!v10) {
            goto LABEL_18;
          }
        }
      }
    }
    else
    {
LABEL_18:
      int v22 = 0;
    }

    if (!v22)
    {
      id v29 = v18;
      int v22 = 1;
    }
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v21 = (id)[NSString stringWithFormat:@"No workflows for useCase '%@'", location];
    id v20 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v21);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v20, type, "%@", v31, 0xCu);
    }
    objc_storeStrong(&v20, 0);
    +[AMDFrameworkMetrics log:v21 withKey:@"getWorkflowFailure" atVerbosity:0];
    id v29 = 0;
    int v22 = 1;
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
  id v5 = v29;

  return v5;
}

+ (id)fetchAllWorkflows:(id *)a3
{
  id v30 = a1;
  SEL v29 = a2;
  id v28 = a3;
  uint64_t v21 = 0;
  int v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  uint64_t v25 = __Block_byref_object_copy__1;
  int64_t v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  id v18 = __Block_byref_object_copy__1;
  id v19 = __Block_byref_object_dispose__1;
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v13 = (id)[v6 getManagedObjectContext];

  id v5 = v13;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  unint64_t v10 = __33__AMDWorkflow_fetchAllWorkflows___block_invoke;
  id v11 = &unk_263FE1F20;
  v12[0] = v13;
  v12[1] = &v21;
  v12[2] = &v14;
  [v5 performBlockAndWait:&v7];
  if (v22[5])
  {
    *id v28 = (id) v22[5];
    id v31 = 0;
  }
  else
  {
    id v31 = (id)v15[5];
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  id v3 = v31;

  return v3;
}

void __33__AMDWorkflow_fetchAllWorkflows___block_invoke(void *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v30[2] = a1;
  v30[1] = a1;
  uint64_t v12 = (void *)MEMORY[0x263EFF260];
  id v14 = (id)+[AMDWorkflow entity];
  id v13 = (id)[v14 name];
  v30[0] = (id)objc_msgSend(v12, "fetchRequestWithEntityName:");

  v1 = (void *)a1[4];
  id location = (id *)(*(void *)(a1[5] + 8) + 40);
  id v28 = *location;
  id v17 = (id)[v1 executeFetchRequest:v30[0] error:&v28];
  objc_storeStrong(location, v28);
  id v29 = v17;
  memset(__b, 0, sizeof(__b));
  id obj = v17;
  uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
  if (v19)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v19;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v27 = *(id *)(__b[1] + 8 * v10);
      uint64_t v4 = (void *)MEMORY[0x263F08900];
      id v7 = (id)[v27 workflow];
      id v5 = (id *)(*(void *)(a1[5] + 8) + 40);
      id v24 = *v5;
      id v6 = (id)objc_msgSend(v4, "JSONObjectWithData:options:error:");
      objc_storeStrong(v5, v24);
      id v25 = v6;

      if (*(void *)(*(void *)(a1[5] + 8) + 40))
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v3 = type;
          __os_log_helper_16_0_0(v21);
          _os_log_error_impl(&dword_20ABD4000, log, v3, "Workflow could not be deserialized", v21, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        int v20 = 1;
      }
      else
      {
        [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v25];
        int v20 = 0;
      }
      objc_storeStrong(&v25, 0);
      if (v20) {
        break;
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v29, 0);
  objc_storeStrong(v30, 0);
}

+ (id)getCurrentWorkflowForDomain:(int64_t)a3 andTreatmentId:(id)a4 andUseCaseId:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v50 = a1;
  SEL v49 = a2;
  int64_t v48 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v46 = 0;
  objc_storeStrong(&v46, a5);
  id v45 = a6;
  id v44 = (id)[v50 getWorkflowsForDomain:v48 andTreatmentId:location andUseCaseId:v46 error:a6];
  if (!*a6 && v44 && [v44 count])
  {
    id v42 = 0;
    memset(__b, 0, sizeof(__b));
    id v23 = v44;
    uint64_t v24 = [v23 countByEnumeratingWithState:__b objects:v54 count:16];
    if (v24)
    {
      uint64_t v20 = *(void *)__b[2];
      uint64_t v21 = 0;
      unint64_t v22 = v24;
      while (1)
      {
        uint64_t v19 = v21;
        if (*(void *)__b[2] != v20) {
          objc_enumerationMutation(v23);
        }
        id v41 = *(id *)(__b[1] + 8 * v21);
        id v39 = (id)[v41 objectForKey:@"treatmentId"];
        id v15 = (id)[v41 objectForKey:@"startTime"];
        uint64_t v16 = [v15 longLongValue];

        unint64_t v38 = v16;
        id v17 = (id)[v41 objectForKey:@"endTime"];
        uint64_t v18 = [v17 longLongValue];

        unint64_t v37 = v18;
        if ([v39 isEqual:@"__defaultTreatment"])
        {
          if (!v42) {
            objc_storeStrong(&v42, v41);
          }
        }
        else
        {
          id v13 = (id)[MEMORY[0x263EFF910] date];
          [v13 timeIntervalSince1970];
          unint64_t v14 = (unint64_t)v6;

          unint64_t v36 = v14;
          if (v14 >= v38 && v36 <= v37) {
            objc_storeStrong(&v42, v41);
          }
        }
        objc_storeStrong(&v39, 0);
        ++v21;
        if (v19 + 1 >= v22)
        {
          uint64_t v21 = 0;
          unint64_t v22 = [v23 countByEnumeratingWithState:__b objects:v54 count:16];
          if (!v22) {
            break;
          }
        }
      }
    }

    if (v42)
    {
      id v32 = (id)[v42 objectForKey:@"treatmentId"];
      id v31 = (id)[v42 objectForKey:@"callUUID"];
      id v30 = (id)[v42 objectForKey:@"workflow"];
      os_log_t v29 = (os_log_t)&_os_log_internal;
      os_log_type_t v28 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v32);
        _os_log_impl(&dword_20ABD4000, v29, v28, "Treatment chosen: %@", v52, 0xCu);
      }
      objc_storeStrong((id *)&v29, 0);
      id v27 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v30 options:4 error:v45];
      id v11 = v31;
      id v12 = (id)[v46 stringByAppendingString:@"UUID"];
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v11);

      if (*v45)
      {
        uint64_t v51 = 0;
      }
      else
      {
        uint64_t v8 = [AMDPair alloc];
        uint64_t v51 = [(AMDPair *)v8 initWith:v32 and:v27];
      }
      int v43 = 1;
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
    }
    else
    {
      id v35 = (id)[NSString stringWithFormat:@"No workflow could be found for the provided usecase: %@", v46];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v35);
        _os_log_error_impl(&dword_20ABD4000, oslog, type, "%@", v53, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v7 = +[AMDError allocError:15 withMessage:v35];
      *id v45 = v7;
      uint64_t v51 = 0;
      int v43 = 1;
      objc_storeStrong(&v35, 0);
    }
    objc_storeStrong(&v42, 0);
  }
  else
  {
    uint64_t v51 = 0;
    int v43 = 1;
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&location, 0);
  uint64_t v9 = (void *)v51;

  return v9;
}

+ (id)performWorkflowCleanupForDomain:(int64_t)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v49 = a1;
  SEL v48 = a2;
  int64_t v47 = a3;
  id v46 = a4;
  id v45 = (id)[a1 getWorkflowsForDomain:a3 error:a4];
  if (*v46)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v23 = type;
      id v24 = (id)[*v46 localizedDescription];
      id v42 = v24;
      __os_log_helper_16_2_1_8_64((uint64_t)v55, (uint64_t)v42);
      _os_log_error_impl(&dword_20ABD4000, log, v23, "Workflow fetch error: %@", v55, 0xCu);

      objc_storeStrong(&v42, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v50 = 0;
    int v41 = 1;
  }
  else if (v45)
  {
    id v16 = (id)[MEMORY[0x263EFF910] date];
    [v16 timeIntervalSince1970];
    unint64_t v17 = (unint64_t)v4;

    unint64_t v37 = v17;
    id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(__b, 0, sizeof(__b));
    id obj = v45;
    uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
    if (v19)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0;
      unint64_t v15 = v19;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(obj);
        }
        id v35 = *(id *)(__b[1] + 8 * v14);
        id v33 = (id)[v35 objectForKey:@"treatmentId"];
        id v32 = (id)[v35 objectForKey:@"endTime"];
        if ([v33 isEqualToString:@"__defaultTreatment"])
        {
          int v41 = 3;
        }
        else
        {
          unint64_t v11 = v37;
          if (v11 <= [v32 longLongValue]) {
            goto LABEL_22;
          }
          id v31 = (id)[v35 objectForKey:@"useCaseId"];
          id v30 = 0;
          id v29 = 0;
          id v5 = (id)[v49 deleteWorkflowsForDomain:v47 andTreatmentId:v33 andUseCaseId:v31 error:&v29];
          objc_storeStrong(&v30, v29);
          if (v30)
          {
            id v28 = (id)[NSString stringWithFormat:@"Error deleting workflow with domain: %ld, usecase: %@, treatmentId: %@", v47, v31, v33];
            os_log_t v27 = (os_log_t)&_os_log_internal;
            os_log_type_t v26 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              uint64_t v9 = v27;
              os_log_type_t v10 = v26;
              __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v28);
              _os_log_error_impl(&dword_20ABD4000, v9, v10, "%@", v53, 0xCu);
            }
            objc_storeStrong((id *)&v27, 0);
            +[AMDFrameworkMetrics log:v28 withKey:@"treatmentWorkflowDeletionError" atVerbosity:0];
            int v41 = 3;
            objc_storeStrong(&v28, 0);
          }
          else
          {
            v51[0] = @"usecase";
            v52[0] = v31;
            v51[1] = @"treatmentId";
            v52[1] = v33;
            v51[2] = @"domain";
            id v8 = (id)[NSNumber numberWithInteger:v47];
            v52[2] = v8;
            id v25 = (id)[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];

            [v36 addObject:v25];
            objc_storeStrong(&v25, 0);
            int v41 = 0;
          }
          objc_storeStrong(&v30, 0);
          objc_storeStrong(&v31, 0);
          if (!v41) {
LABEL_22:
          }
            int v41 = 0;
        }
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    id v50 = v36;
    int v41 = 1;
    objc_storeStrong(&v36, 0);
  }
  else
  {
    os_log_t v40 = (os_log_t)&_os_log_internal;
    os_log_type_t v39 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = v40;
      os_log_type_t v21 = v39;
      __os_log_helper_16_0_0(v38);
      _os_log_impl(&dword_20ABD4000, v20, v21, "No workflows to cleanup", v38, 2u);
    }
    objc_storeStrong((id *)&v40, 0);
    id v50 = 0;
    int v41 = 1;
  }
  objc_storeStrong(&v45, 0);
  double v6 = v50;

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDWorkflow", a2, a1);
}

@end