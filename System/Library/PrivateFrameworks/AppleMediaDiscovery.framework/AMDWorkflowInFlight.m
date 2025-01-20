@interface AMDWorkflowInFlight
+ (id)deleteAllInflightWorkflows:(id *)a3;
+ (id)deleteWithPredicates:(id)a3 error:(id *)a4;
+ (id)deleteWorkflowForDomain:(int64_t)a3 withModelId:(id)a4 withSecondaryModelId:(id)a5 andUsecaseId:(id)a6 andTreatmentId:(id)a7 error:(id *)a8;
+ (id)fetchAllModelIds:(id *)a3;
+ (id)fetchAllWorkflowEntries:(id *)a3;
+ (id)fetchAllWorkflows:(id *)a3;
+ (id)fetchRequest;
+ (id)getAllWorkflowsForDomain:(int64_t)a3 withModelId:(id)a4 error:(id *)a5;
+ (id)getAllWorkflowsWithModelId:(id)a3 error:(id *)a4;
+ (id)moveInflightWorkflowsToWorkflows:(id)a3 withDomain:(int64_t)a4 error:(id *)a5;
+ (void)saveWorkflow:(id)a3 forDomain:(int64_t)a4 withCallUUID:(id)a5 error:(id *)a6;
@end

@implementation AMDWorkflowInFlight

+ (id)getAllWorkflowsForDomain:(int64_t)a3 withModelId:(id)a4 error:(id *)a5
{
  id v36 = a1;
  SEL v35 = a2;
  v34 = (void *)a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v32 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  v29 = __Block_byref_object_copy__10;
  v30 = __Block_byref_object_dispose__10;
  id v31 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  id v8 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v17 = (id)[v8 getManagedObjectContext];

  id v7 = v17;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  v13 = __66__AMDWorkflowInFlight_getAllWorkflowsForDomain_withModelId_error___block_invoke;
  v14 = &unk_263FE24F0;
  v16[3] = v34;
  id v15 = location;
  v16[1] = &v18;
  v16[0] = v17;
  v16[2] = &v25;
  [v7 performBlockAndWait:&v10];
  if (v26[5])
  {
    id *v32 = (id) v26[5];
    id v37 = 0;
  }
  else
  {
    id v37 = (id)v19[5];
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  _Block_object_dispose(&v18, 8);
  objc_storeStrong(&v24, 0);
  _Block_object_dispose(&v25, 8);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&location, 0);
  v5 = v37;

  return v5;
}

void __66__AMDWorkflowInFlight_getAllWorkflowsForDomain_withModelId_error___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  v18[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = v18[0];
  id v5 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"domain == %d", a1[8]);
  objc_msgSend(v4, "addObject:");

  id v6 = v18[0];
  id v7 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"modelId == %@ || secondaryModelId == %@", a1[4], a1[4]];
  objc_msgSend(v6, "addObject:");

  id v8 = (void *)MEMORY[0x263EFF260];
  id v10 = (id)+[AMDWorkflowInFlight entity];
  id v9 = (id)[v10 name];
  id v17 = (id)objc_msgSend(v8, "fetchRequestWithEntityName:");

  id v11 = v17;
  id v12 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:v18[0]];
  objc_msgSend(v11, "setPredicate:");

  [v17 setResultType:2];
  v1 = (void *)a1[5];
  v13 = (id *)(*(void *)(a1[7] + 8) + 40);
  id v16 = *v13;
  id v15 = (id)[v1 executeFetchRequest:v17 error:&v16];
  objc_storeStrong(v13, v16);
  uint64_t v2 = *(void *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v15;

  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)getAllWorkflowsWithModelId:(id)a3 error:(id *)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  int v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  id v30 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  int v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  id v23 = 0;
  id v7 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v7 getManagedObjectContext];

  id v6 = v16;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = __56__AMDWorkflowInFlight_getAllWorkflowsWithModelId_error___block_invoke;
  v13 = &unk_263FE1CA8;
  id v14 = location[0];
  v15[1] = &v17;
  v15[0] = v16;
  v15[2] = &v24;
  [v6 performBlockAndWait:&v9];
  if (v25[5])
  {
    *id v31 = (id) v25[5];
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
  id v4 = v33;

  return v4;
}

void __56__AMDWorkflowInFlight_getAllWorkflowsWithModelId_error___block_invoke(void *a1)
{
  v16[2] = a1;
  v16[1] = a1;
  v16[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = v16[0];
  id v5 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"modelId == %@ || secondaryModelId == %@", a1[4], a1[4]];
  objc_msgSend(v4, "addObject:");

  id v6 = (void *)MEMORY[0x263EFF260];
  id v8 = (id)+[AMDWorkflowInFlight entity];
  id v7 = (id)[v8 name];
  id v15 = (id)objc_msgSend(v6, "fetchRequestWithEntityName:");

  id v9 = v15;
  id v10 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:v16[0]];
  objc_msgSend(v9, "setPredicate:");

  [v15 setResultType:2];
  v1 = (void *)a1[5];
  id location = (id *)(*(void *)(a1[7] + 8) + 40);
  id v14 = *location;
  id v13 = (id)[v1 executeFetchRequest:v15 error:&v14];
  objc_storeStrong(location, v14);
  uint64_t v2 = *(void *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v13;

  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

+ (id)deleteWithPredicates:(id)a3 error:(id *)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = a4;
  uint64_t v25 = 0;
  int v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  v29 = __Block_byref_object_copy__10;
  id v30 = __Block_byref_object_dispose__10;
  id v31 = 0;
  uint64_t v18 = 0;
  int v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  v22 = __Block_byref_object_copy__10;
  id v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  id v17 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v17 getManagedObjectContext];
  id v6 = v16;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  int v11 = __50__AMDWorkflowInFlight_deleteWithPredicates_error___block_invoke;
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

void __50__AMDWorkflowInFlight_deleteWithPredicates_error___block_invoke(void *a1)
{
  v19[2] = a1;
  v19[1] = a1;
  id v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDWorkflowInFlight entity];
  id v8 = (id)[v9 name];
  v19[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  id v10 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:a1[4]];
  objc_msgSend(v19[0], "setPredicate:");

  id v18 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v19[0]];
  [v18 setResultType:2];
  v1 = (void *)a1[5];
  id location = (id *)(*(void *)(a1[7] + 8) + 40);
  id v16 = *location;
  id v12 = (id)[v1 executeRequest:v18 error:&v16];
  objc_storeStrong(location, v16);
  id v17 = v12;
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    int v15 = 1;
  }
  else
  {
    uint64_t v2 = (void *)a1[6];
    id v6 = (id *)(*(void *)(a1[7] + 8) + 40);
    id v14 = *v6;
    [v2 save:&v14];
    objc_storeStrong(v6, v14);
    id v3 = (id)[v17 result];
    uint64_t v4 = *(void *)(a1[8] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    int v15 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

+ (id)deleteWorkflowForDomain:(int64_t)a3 withModelId:(id)a4 withSecondaryModelId:(id)a5 andUsecaseId:(id)a6 andTreatmentId:(id)a7 error:(id *)a8
{
  v26[1] = *MEMORY[0x263EF8340];
  id v25 = a1;
  SEL v24 = a2;
  int64_t v23 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  id v19 = 0;
  objc_storeStrong(&v19, a7);
  v18[1] = a8;
  v18[0] = 0;
  if (v21) {
    id v8 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"domain == %d && modelId == %@ && secondaryModelId == %@ && useCaseId == %@ && treatmentId == %@", v23, location, v21, v20, v19];
  }
  else {
    id v8 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"domain == %d && modelId == %@ && useCaseId == %@ && treatmentId == %@", v23, location, v20, v19];
  }
  id v9 = v18[0];
  v18[0] = v8;

  int v11 = v25;
  v26[0] = v18[0];
  id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v13 = (id)objc_msgSend(v11, "deleteWithPredicates:error:");

  objc_storeStrong(v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);

  return v13;
}

+ (void)saveWorkflow:(id)a3 forDomain:(int64_t)a4 withCallUUID:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = (void *)a4;
  id v46 = 0;
  objc_storeStrong(&v46, a5);
  v45 = a6;
  id v12 = [AMDUseCaseWorkflow alloc];
  id v44 = [(AMDUseCaseWorkflow *)v12 initWithDictionary:location[0]];
  if ([v44 isValid])
  {
    id v39 = (id)[MEMORY[0x263F08900] dataWithJSONObject:location[0] options:6 error:v45];
    if (*v45)
    {
      id v38 = &_os_log_internal;
      os_log_type_t v37 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
      {
        id v8 = (id)[*v45 localizedDescription];
        id v36 = v8;
        __os_log_helper_16_2_1_8_64((uint64_t)v49, (uint64_t)v36);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v38, v37, "Error serializing in-flight workflow: %@", v49, 0xCu);

        objc_storeStrong(&v36, 0);
      }
      objc_storeStrong(&v38, 0);
      int v40 = 1;
    }
    else
    {
      uint64_t v29 = 0;
      id v30 = &v29;
      int v31 = 838860800;
      int v32 = 48;
      id v33 = __Block_byref_object_copy__10;
      id v34 = __Block_byref_object_dispose__10;
      id v35 = 0;
      id v28 = +[AMDCoreDataPersistentContainer sharedContainer];
      id v27 = (id)[v28 getManagedObjectContext];
      id v7 = v27;
      uint64_t v16 = MEMORY[0x263EF8330];
      int v17 = -1073741824;
      int v18 = 0;
      id v19 = __65__AMDWorkflowInFlight_saveWorkflow_forDomain_withCallUUID_error___block_invoke;
      id v20 = &unk_263FE1EF8;
      id v21 = v27;
      id v22 = v46;
      void v26[2] = v47;
      id v23 = location[0];
      id v24 = v44;
      id v25 = v39;
      v26[0] = v28;
      v26[1] = &v29;
      [v7 performBlockAndWait:&v16];
      if (v30[5])
      {
        id v6 = (id) v30[5];
        id *v45 = v6;
      }
      objc_storeStrong(v26, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      _Block_object_dispose(&v29, 8);
      objc_storeStrong(&v35, 0);
      int v40 = 0;
    }
    objc_storeStrong(&v39, 0);
  }
  else
  {
    id v43 = &_os_log_internal;
    char v42 = 16;
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
    {
      log = v43;
      os_log_type_t type = v42;
      __os_log_helper_16_0_0(v41);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Ignoring invalid in-flight workflow", v41, 2u);
    }
    objc_storeStrong(&v43, 0);
    id v9 = +[AMDError allocError:19 withMessage:@"Invalid in-flight workflow"];
    id *v45 = v9;
    int v40 = 1;
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
}

void __65__AMDWorkflowInFlight_saveWorkflow_forDomain_withCallUUID_error___block_invoke(uint64_t a1)
{
  v17[2] = (id)a1;
  v17[1] = (id)a1;
  id v6 = (void *)MEMORY[0x263EFF240];
  id v8 = (id)+[AMDWorkflowInFlight entity];
  id v7 = (id)[v8 name];
  v17[0] = (id)objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:");

  id v9 = (id)[MEMORY[0x263EFF910] date];
  [v9 timeIntervalSince1970];
  [v17[0] setCreationTime:v1];

  [v17[0] setCallUUID:*(void *)(a1 + 40)];
  [v17[0] setDomain:(__int16)*(void *)(a1 + 88)];
  id v10 = (id)[*(id *)(a1 + 48) objectForKey:@"model_id"];
  objc_msgSend(v17[0], "setModelId:");

  id v11 = (id)[*(id *)(a1 + 56) getUseCaseId];
  objc_msgSend(v17[0], "setUseCaseId:");

  id location = (id)[*(id *)(a1 + 56) getTreatmentId];
  if (location) {
    objc_storeStrong(&location, location);
  }
  else {
    objc_storeStrong(&location, @"__defaultTreatment");
  }
  [v17[0] setTreatmentId:location];
  [v17[0] setWorkflow:*(void *)(a1 + 64)];
  id v15 = (id)[*(id *)(a1 + 48) objectForKey:@"start_timestamp"];
  id v14 = (id)[*(id *)(a1 + 48) objectForKey:@"end_timestamp"];
  if (v15 && v14)
  {
    objc_msgSend(v17[0], "setStartTime:", objc_msgSend(v15, "unsignedLongLongValue"));
    objc_msgSend(v17[0], "setEndTime:", objc_msgSend(v14, "unsignedLongLongValue"));
  }
  id v4 = (id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", @"secondary_model_id", v17[0]);
  objc_msgSend(v3, "setSecondaryModelId:");

  uint64_t v2 = *(void **)(a1 + 72);
  id v5 = (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v13 = *v5;
  [v2 save:&v13];
  objc_storeStrong(v5, v13);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v17, 0);
}

+ (id)deleteAllInflightWorkflows:(id *)a3
{
  return (id)[a1 deleteWithPredicates:MEMORY[0x263EFFA68] error:a3];
}

+ (id)moveInflightWorkflowsToWorkflows:(id)a3 withDomain:(int64_t)a4 error:(id *)a5
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v85 = a4;
  v84[1] = a5;
  v84[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v83 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v82 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v49 = [obj countByEnumeratingWithState:__b objects:v91 count:16];
  if (v49)
  {
    uint64_t v43 = *(void *)__b[2];
    uint64_t v44 = 0;
    unint64_t v45 = v49;
    while (1)
    {
      uint64_t v42 = v44;
      if (*(void *)__b[2] != v43) {
        objc_enumerationMutation(obj);
      }
      id v81 = *(id *)(__b[1] + 8 * v44);
      id v79 = 0;
      id v78 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v77 = (id)[v81 objectForKey:0x26BEAEA98];
      id v76 = (id)[v81 objectForKey:0x26BEAE8D8];
      id v75 = (id)[v81 objectForKey:0x26BEB05B8];
      id v74 = (id)[v81 objectForKey:0x26BEB05F8];
      if (!v74) {
        objc_storeStrong(&v74, @"__defaultTreatment");
      }
      id v72 = v79;
      id v41 = +[AMDModel getModelInfo:v76 error:&v72];
      objc_storeStrong(&v79, v72);
      id v73 = v41;
      if (v79)
      {
        id v39 = v83;
        id v40 = (id)[v79 localizedDescription];
        objc_msgSend(v39, "setObject:forKey:");

        int v71 = 3;
        goto LABEL_39;
      }
      if (!v73)
      {
        id v70 = (id)[NSString stringWithFormat:@"Primary model unavailable: %@", v76];
        [v83 setObject:v70 forKey:v77];
        int v71 = 3;
        objc_storeStrong(&v70, 0);
        goto LABEL_39;
      }
      if (v75)
      {
        id v68 = v79;
        id v38 = +[AMDModel getModelInfo:v75 error:&v68];
        objc_storeStrong(&v79, v68);
        id v69 = v38;
        if (v79)
        {
          id v36 = v83;
          id v37 = (id)[v79 localizedDescription];
          objc_msgSend(v36, "setObject:forKey:");

          int v71 = 3;
        }
        else if (v69)
        {
          int v71 = 0;
        }
        else
        {
          id v67 = (id)[NSString stringWithFormat:@"Secondary model unavailable: %@", v75];
          [v83 setObject:v67 forKey:v77];
          int v71 = 3;
          objc_storeStrong(&v67, 0);
        }
        objc_storeStrong(&v69, 0);
        if (v71) {
          goto LABEL_39;
        }
      }
      id v65 = v79;
      id v35 = +[AMDWorkflow deleteWorkflowForDomain:v85 withModelId:v76 withSecondaryModelId:v75 andUsecaseId:v77 andTreatmentId:v74 error:&v65];
      objc_storeStrong(&v79, v65);
      id v66 = v35;
      if (v79)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v33 = type;
          id v29 = v76;
          id v30 = v75;
          id v31 = v77;
          id v34 = (id)[v79 localizedDescription];
          id v62 = v34;
          __os_log_helper_16_2_4_8_64_8_64_8_64_8_64((uint64_t)v90, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v62);
          _os_log_error_impl(&dword_20ABD4000, log, v33, "Entry deletion from workflow table failed for modelId: %@ and secondaryModelId: %@ and usecaseId: %@ with error: %@", v90, 0x2Au);

          objc_storeStrong(&v62, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v27 = v84[0];
        id v28 = (id)[v79 localizedDescription];
        objc_msgSend(v27, "setObject:forKey:");

        int v71 = 3;
      }
      else
      {
        id v89 = v81;
        id v26 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
        id v61 = v79;
        +[AMDWorkflow addWorkflowsFromInflightTable:error:](AMDWorkflow, "addWorkflowsFromInflightTable:error:");
        objc_storeStrong(&v79, v61);

        if (v79)
        {
          os_log_t v60 = (os_log_t)&_os_log_internal;
          os_log_type_t v59 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            id v23 = v60;
            os_log_type_t v24 = v59;
            id v21 = v76;
            id v22 = v75;
            id v25 = (id)[v79 localizedDescription];
            id v58 = v25;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v88, (uint64_t)v21, (uint64_t)v22, (uint64_t)v58);
            _os_log_error_impl(&dword_20ABD4000, v23, v24, "Entry addition to workflow table from inflight table failed for modelId: %@ and secondaryModelId: %@ with error: %@", v88, 0x20u);

            objc_storeStrong(&v58, 0);
          }
          objc_storeStrong((id *)&v60, 0);
          id v19 = v83;
          id v20 = (id)[v79 localizedDescription];
          objc_msgSend(v19, "setObject:forKey:");

          int v71 = 3;
        }
        else
        {
          if (v76 && v75)
          {
            os_log_t v57 = (os_log_t)&_os_log_internal;
            os_log_type_t v56 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              int v17 = v57;
              os_log_type_t v18 = v56;
              __os_log_helper_16_0_0(v55);
              _os_log_impl(&dword_20ABD4000, v17, v18, "Both primary and secondary model are defined. Skipping inflight cleanup", v55, 2u);
            }
            objc_storeStrong((id *)&v57, 0);
          }
          else
          {
            id v53 = v79;
            id v16 = +[AMDWorkflowInFlight deleteWorkflowForDomain:v85 withModelId:v76 withSecondaryModelId:v75 andUsecaseId:v77 andTreatmentId:v74 error:&v53];
            objc_storeStrong(&v79, v53);
            id v54 = v16;
            if (v79)
            {
              os_log_t v52 = (os_log_t)&_os_log_internal;
              os_log_type_t v51 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                id v13 = v52;
                os_log_type_t v14 = v51;
                id v11 = v76;
                id v12 = v75;
                id v15 = (id)[v79 localizedDescription];
                id v50 = v15;
                __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v87, (uint64_t)v11, (uint64_t)v12, (uint64_t)v50);
                _os_log_error_impl(&dword_20ABD4000, v13, v14, "Entry deletion from inflight table failed for modelId: %@ and secondaryModelId: %@ with error: %@", v87, 0x20u);

                objc_storeStrong(&v50, 0);
              }
              objc_storeStrong((id *)&v52, 0);
              id v9 = v83;
              id v10 = (id)[v79 localizedDescription];
              objc_msgSend(v9, "setObject:forKey:");

              int v71 = 3;
            }
            else
            {
              [v78 setObject:v54 forKey:@"oldRemovedInflightTable"];
              int v71 = 0;
            }
            objc_storeStrong(&v54, 0);
            if (v71) {
              goto LABEL_38;
            }
          }
          [v78 setObject:v66 forKey:@"oldRemovedFromWorkflowTable"];
          [v82 addObject:v81];
          [v83 setObject:v78 forKey:v77];
          int v71 = 0;
        }
      }
LABEL_38:
      objc_storeStrong(&v66, 0);
LABEL_39:
      objc_storeStrong(&v73, 0);
      objc_storeStrong(&v74, 0);
      objc_storeStrong(&v75, 0);
      objc_storeStrong(&v76, 0);
      objc_storeStrong(&v77, 0);
      objc_storeStrong(&v78, 0);
      objc_storeStrong(&v79, 0);
      ++v44;
      if (v42 + 1 >= v45)
      {
        uint64_t v44 = 0;
        unint64_t v45 = [obj countByEnumeratingWithState:__b objects:v91 count:16];
        if (!v45) {
          break;
        }
      }
    }
  }

  id v6 = v83;
  id v7 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v82, "count"));
  objc_msgSend(v6, "setObject:forKey:");

  [v84[0] setObject:v82 forKey:@"savedWorkflows"];
  [v84[0] setObject:v83 forKey:@"deletionSummary"];
  id v8 = v84[0];
  int v71 = 1;
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v83, 0);
  objc_storeStrong(v84, 0);
  objc_storeStrong(location, 0);

  return v8;
}

+ (id)fetchAllWorkflowEntries:(id *)a3
{
  id v30 = a1;
  SEL v29 = a2;
  id v28 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  id v25 = __Block_byref_object_copy__10;
  id v26 = __Block_byref_object_dispose__10;
  id v27 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  os_log_type_t v18 = __Block_byref_object_copy__10;
  id v19 = __Block_byref_object_dispose__10;
  id v20 = 0;
  id v6 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v13 = (id)[v6 getManagedObjectContext];

  id v5 = v13;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __47__AMDWorkflowInFlight_fetchAllWorkflowEntries___block_invoke;
  id v11 = &unk_263FE1CD0;
  v12[1] = &v14;
  v12[0] = v13;
  v12[2] = &v21;
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

void __47__AMDWorkflowInFlight_fetchAllWorkflowEntries___block_invoke(void *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  id v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDWorkflowInFlight entity];
  id v5 = (id)[v6 name];
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  [v11[0] setResultType:2];
  double v1 = (void *)a1[4];
  id location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v10 = *location;
  id v9 = (id)[v1 executeFetchRequest:v11[0] error:&v10];
  objc_storeStrong(location, v10);
  uint64_t v2 = *(void *)(a1[5] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (id)fetchAllWorkflows:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v25 = a1;
  SEL v24 = a2;
  int v23 = a3;
  id v22 = (id)[a1 fetchAllWorkflowEntries:a3];
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id obj = v22;
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(__b[1] + 8 * v9);
      id v18 = (id)[v20 objectForKey:0x26BEB0618];
      id location = (id)[MEMORY[0x263F08900] JSONObjectWithData:v18 options:4 error:v23];
      if (*v23)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v6 = type;
          __os_log_helper_16_0_0(v14);
          _os_log_error_impl(&dword_20ABD4000, log, v6, "Workflow could not be deserialized", v14, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v26 = 0;
        int v13 = 1;
      }
      else
      {
        [v21 addObject:location];
        int v13 = 0;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v18, 0);
      if (v13) {
        break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v10) {
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
LABEL_13:
    int v13 = 0;
  }

  if (!v13) {
    id v26 = v21;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  id v3 = v26;

  return v3;
}

+ (id)fetchAllModelIds:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v20 = a1;
  SEL v19 = a2;
  id v18 = a3;
  id v17 = (id)[a1 fetchAllWorkflowEntries:a3];
  if (!*v18 && v17)
  {
    id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v17, "count"));
    memset(__b, 0, sizeof(__b));
    id obj = v17;
    uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      unint64_t v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(__b[1] + 8 * v7);
        id v12 = (id)[v14 objectForKey:0x26BEAEC58];
        id v11 = (id)[v14 objectForKey:0x26BEAE8D8];
        [v15 setObject:v12 forKey:v11];
        objc_storeStrong(&v11, 0);
        objc_storeStrong(&v12, 0);
        ++v7;
        if (v5 + 1 >= v8)
        {
          uint64_t v7 = 0;
          unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }

    id v21 = v15;
    int v16 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v21 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  id v3 = v21;

  return v3;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDWorkflowInFlight", a2, a1);
}

@end