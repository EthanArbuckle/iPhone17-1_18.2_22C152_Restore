@interface AMDModel
+ (id)deleteAllModelUrls:(id *)a3;
+ (id)deleteWithPredicate:(id)a3 error:(id *)a4;
+ (id)fetchAll:(id *)a3;
+ (id)fetchRequest;
+ (id)getCurrentModelInfoByModelId;
+ (id)getModelInfo:(id)a3 error:(id *)a4;
+ (id)getModelPath:(id)a3 error:(id *)a4;
+ (id)getModelPathForUsecase:(id)a3 inDomain:(id)a4 forModelId:(id)a5 withTreatmentId:(id)a6 error:(id *)a7;
+ (void)deleteModels:(id)a3 error:(id *)a4;
+ (void)saveModels:(id)a3 error:(id *)a4;
@end

@implementation AMDModel

+ (id)fetchAll:(id *)a3
{
  id v30 = a1;
  SEL v29 = a2;
  v28 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  id v27 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  id v6 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v13 = (id)[v6 getManagedObjectContext];

  id v5 = v13;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __21__AMDModel_fetchAll___block_invoke;
  v11 = &unk_263FE1CD0;
  v12[1] = &v14;
  v12[0] = v13;
  v12[2] = &v21;
  [v5 performBlockAndWait:&v7];
  if (v22[5])
  {
    id *v28 = (id) v22[5];
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
  v3 = v31;

  return v3;
}

void __21__AMDModel_fetchAll___block_invoke(void *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDModel entity];
  id v5 = (id)[v6 name];
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  [v11[0] setResultType:2];
  v1 = (void *)a1[4];
  location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v10 = *location;
  id v9 = (id)[v1 executeFetchRequest:v11[0] error:&v10];
  objc_storeStrong(location, v10);
  uint64_t v2 = *(void *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (void)deleteModels:(id)a3 error:(id *)a4
{
  id v25 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v23 = a4;
  uint64_t v16 = 0;
  int v17 = &v16;
  int v18 = 838860800;
  int v19 = 48;
  id v20 = __Block_byref_object_copy__9;
  uint64_t v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  id v15 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v14 = (id)[v15 getManagedObjectContext];
  id v5 = v14;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __31__AMDModel_deleteModels_error___block_invoke;
  v11 = &unk_263FE1FB0;
  id v12 = location[0];
  v13[2] = v25;
  v13[1] = &v16;
  v13[0] = v15;
  [v5 performBlockAndWait:&v7];
  if (v17[5])
  {
    id v4 = (id) v17[5];
    *int v23 = v4;
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __31__AMDModel_deleteModels_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v21 = a1;
  uint64_t v20 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
  if (v12)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v12;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(__b[1] + 8 * v8);
      id v17 = (id)[v19 objectForKey:@"modelId"];
      id v16 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"modelId == %@", v17];
      v1 = *(void **)(a1 + 56);
      location = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v15 = *location;
      id v2 = (id)[v1 deleteWithPredicate:v16 error:&v15];
      objc_storeStrong(location, v15);
      BOOL v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
      if (v14) {
        break;
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v9) {
          goto LABEL_8;
        }
      }
    }
  }
  else
  {
LABEL_8:
    BOOL v14 = 0;
  }

  if (!v14)
  {
    v3 = *(void **)(a1 + 40);
    id v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v13 = *v4;
    [v3 save:&v13];
    objc_storeStrong(v4, v13);
  }
}

+ (id)deleteAllModelUrls:(id *)a3
{
  id v31 = a1;
  SEL v30 = a2;
  SEL v29 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  int v24 = 838860800;
  int v25 = 48;
  v26 = __Block_byref_object_copy__9;
  id v27 = __Block_byref_object_dispose__9;
  id v28 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  int v17 = 838860800;
  int v18 = 48;
  id v19 = __Block_byref_object_copy__9;
  uint64_t v20 = __Block_byref_object_dispose__9;
  id v21 = 0;
  id v14 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v13 = (id)[v14 getManagedObjectContext];
  id v5 = v13;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  unint64_t v9 = __31__AMDModel_deleteAllModelUrls___block_invoke;
  id v10 = &unk_263FE1CA8;
  id v11 = v13;
  v12[1] = &v22;
  v12[0] = v14;
  v12[2] = &v15;
  [v5 performBlockAndWait:&v6];
  if (v23[5])
  {
    *SEL v29 = (id) v23[5];
    id v32 = 0;
  }
  else
  {
    id v32 = (id)v16[5];
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  _Block_object_dispose(&v15, 8);
  objc_storeStrong(&v21, 0);
  _Block_object_dispose(&v22, 8);
  objc_storeStrong(&v28, 0);
  v3 = v32;

  return v3;
}

void __31__AMDModel_deleteAllModelUrls___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  int v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDModel entity];
  id v8 = (id)[v9 name];
  v18[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  v1 = (void *)a1[4];
  location = (id *)(*(void *)(a1[6] + 8) + 40);
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
    id v2 = (void *)a1[5];
    uint64_t v6 = (id *)(*(void *)(a1[6] + 8) + 40);
    id v13 = *v6;
    [v2 save:&v13];
    objc_storeStrong(v6, v13);
    id v3 = (id)[v16 result];
    uint64_t v4 = *(void *)(a1[7] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    int v14 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (void)saveModels:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v24 = a4;
  uint64_t v17 = 0;
  int v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  id v21 = __Block_byref_object_copy__9;
  uint64_t v22 = __Block_byref_object_dispose__9;
  id v23 = 0;
  id v16 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v15 = (id)[v16 getManagedObjectContext];
  id v5 = v15;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __29__AMDModel_saveModels_error___block_invoke;
  id v11 = &unk_263FE1C08;
  id v12 = location[0];
  id v13 = v15;
  v14[0] = v16;
  v14[1] = &v17;
  [v5 performBlockAndWait:&v7];
  if (v18[5])
  {
    id v4 = (id) v18[5];
    *int v24 = v4;
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

void __29__AMDModel_saveModels_error___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v30 = a1;
  uint64_t v29 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v23 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
  if (v23)
  {
    uint64_t v18 = *(void *)__b[2];
    uint64_t v19 = 0;
    unint64_t v20 = v23;
    while (1)
    {
      uint64_t v17 = v19;
      if (*(void *)__b[2] != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v28 = *(void *)(__b[1] + 8 * v19);
      id v26 = (id)[*(id *)(a1 + 32) objectForKey:v28];
      id v4 = (void *)MEMORY[0x263EFF240];
      id v6 = (id)+[AMDModel entity];
      id v5 = (id)[v6 name];
      id v25 = (id)objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:");

      id v7 = v25;
      id v8 = (id)[v26 objectForKey:@"modelId"];
      objc_msgSend(v7, "setModelId:");

      id v9 = v25;
      id v10 = (id)[v26 objectForKey:@"url"];
      objc_msgSend(v9, "setUrl:");

      id v11 = v25;
      id v12 = (id)[v26 objectForKey:@"compiledModelDir"];
      objc_msgSend(v11, "setCompiledModelDir:");

      id v13 = v25;
      id v14 = (id)[v26 objectForKey:@"version"];
      objc_msgSend(v13, "setVersion:");

      id v15 = v25;
      id v16 = (id)[MEMORY[0x263EFF910] date];
      [v16 timeIntervalSince1970];
      [v15 setCreationTimeSeconds:(unint64_t)v1];

      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v26, 0);
      ++v19;
      if (v17 + 1 >= v20)
      {
        uint64_t v19 = 0;
        unint64_t v20 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
        if (!v20) {
          break;
        }
      }
    }
  }

  id v2 = *(void **)(a1 + 48);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v24 = *v3;
  [v2 save:&v24];
  objc_storeStrong(v3, v24);
}

+ (id)getModelInfo:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  uint64_t v28 = __Block_byref_object_copy__9;
  uint64_t v29 = __Block_byref_object_dispose__9;
  id v30 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  id v21 = __Block_byref_object_copy__9;
  uint64_t v22 = __Block_byref_object_dispose__9;
  id v23 = 0;
  id v7 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v7 getManagedObjectContext];

  id v6 = v16;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = __31__AMDModel_getModelInfo_error___block_invoke;
  id v13 = &unk_263FE1C80;
  id v14 = location[0];
  v15[0] = v16;
  v15[1] = &v24;
  v15[2] = &v17;
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

void __31__AMDModel_getModelInfo_error___block_invoke(void *a1)
{
  id v14[2] = a1;
  v14[1] = a1;
  id v5 = (void *)MEMORY[0x263EFF260];
  id v7 = (id)+[AMDModel entity];
  id v6 = (id)[v7 name];
  v14[0] = (id)objc_msgSend(v5, "fetchRequestWithEntityName:");

  id v13 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"modelId == %@", a1[4]];
  [v14[0] setPredicate:v13];
  [v14[0] setResultType:2];
  double v1 = (void *)a1[5];
  location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v11 = *location;
  id v9 = (id)[v1 executeFetchRequest:v14[0] error:&v11];
  objc_storeStrong(location, v11);
  id v12 = v9;
  if (!*(void *)(*(void *)(a1[6] + 8) + 40) && v12)
  {
    id v2 = (id)[v12 firstObject];
    uint64_t v3 = *(void *)(a1[7] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
}

+ (id)getModelPath:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v28 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v26 = a4;
  id v25 = (id)[v28 getModelInfo:location[0] error:a4];
  if (*a4)
  {
    id v24 = &_os_log_internal;
    char v23 = 16;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      log = v24;
      os_log_type_t type = v23;
      id v13 = location[0];
      id v16 = (id)[*v26 localizedDescription];
      id v22 = v16;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v33, (uint64_t)v13, (uint64_t)v22);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Model: %@ could not be fetched. Error: %@", v33, 0x16u);

      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong(&v24, 0);
    id v29 = 0;
    int v21 = 1;
  }
  else if (v25)
  {
    id v8 = NSString;
    id v10 = (id)[v25 objectForKey:@"url"];
    id v9 = (id)[v25 objectForKey:@"compiledModelDir"];
    id v18 = (id)[v8 stringWithFormat:@"%@/%@", v10, v9];

    id v11 = v18;
    id v12 = (id)[MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
    id v4 = (id)objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:");
    id v5 = v18;
    id v18 = v4;

    id v30 = @"path";
    id v31 = v18;
    id v29 = (id)[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    int v21 = 1;
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v20 = &_os_log_internal;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)location[0]);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v20, v19, "Model: %@ not available", v32, 0xCu);
    }
    objc_storeStrong(&v20, 0);
    id v29 = 0;
    int v21 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  id v6 = v29;

  return v6;
}

+ (id)getModelPathForUsecase:(id)a3 inDomain:(id)a4 forModelId:(id)a5 withTreatmentId:(id)a6 error:(id *)a7
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v53 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v51 = 0;
  objc_storeStrong(&v51, a4);
  id v50 = 0;
  objc_storeStrong(&v50, a5);
  id v49 = 0;
  objc_storeStrong(&v49, a6);
  v48 = a7;
  if (location[0] || v50)
  {
    if (v51)
    {
      int64_t v40 = +[AMDDomains getCodeForDomain:v51];
      if (v40)
      {
        if (v50)
        {
          id v54 = (id)[v53 getModelPath:v50 error:v48];
          int v44 = 1;
        }
        else if (location[0])
        {
          id v33 = +[AMDWorkflow getCurrentWorkflowForDomain:v40 andTreatmentId:v49 andUseCaseId:location[0] error:v48];
          if (*v48)
          {
            id v32 = &_os_log_internal;
            os_log_type_t v31 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
            {
              id v13 = v32;
              os_log_type_t v14 = v31;
              id v11 = v51;
              id v12 = location[0];
              id v15 = (id)[*v48 localizedDescription];
              id v30 = v15;
              __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v56, (uint64_t)v11, (uint64_t)v12, (uint64_t)v30);
              _os_log_error_impl(&dword_20ABD4000, v13, v14, "Workflow fetch failed for domain: %@, usecase: %@ error: %@", v56, 0x20u);

              objc_storeStrong(&v30, 0);
            }
            objc_storeStrong(&v32, 0);
            id v54 = 0;
            int v44 = 1;
          }
          else
          {
            id v29 = (id)[v33 second];
            id v7 = (id)[v29 objectForKey:@"model_id"];
            id v8 = v50;
            id v50 = v7;

            if (!v50)
            {
              os_log_t oslog = (os_log_t)&_os_log_internal;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v55, (uint64_t)location[0]);
                _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "ModelId not present in workflow for usecase: %@", v55, 0xCu);
              }
              objc_storeStrong((id *)&oslog, 0);
            }
            id v54 = (id)[v53 getModelPath:v50 error:v48];
            int v44 = 1;
            objc_storeStrong(&v29, 0);
          }
          objc_storeStrong(&v33, 0);
        }
        else
        {
          id v36 = &_os_log_internal;
          char v35 = 16;
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            id v16 = v36;
            os_log_type_t v17 = v35;
            __os_log_helper_16_0_0(v34);
            _os_log_error_impl(&dword_20ABD4000, v16, v17, "UsecaseId missing while querying for model path", v34, 2u);
          }
          objc_storeStrong(&v36, 0);
          id v54 = 0;
          int v44 = 1;
        }
      }
      else
      {
        id v39 = &_os_log_internal;
        char v38 = 16;
        if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
        {
          id v18 = v39;
          os_log_type_t v19 = v38;
          __os_log_helper_16_0_0(v37);
          _os_log_error_impl(&dword_20ABD4000, v18, v19, "Unsupported domain passed while querying for model path", v37, 2u);
        }
        objc_storeStrong(&v39, 0);
        id v54 = 0;
        int v44 = 1;
      }
    }
    else
    {
      id v43 = &_os_log_internal;
      char v42 = 16;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
      {
        id v20 = v43;
        os_log_type_t v21 = v42;
        __os_log_helper_16_0_0(v41);
        _os_log_error_impl(&dword_20ABD4000, v20, v21, "Domain missing while querying for model path. Defaulting to apps", v41, 2u);
      }
      objc_storeStrong(&v43, 0);
      id v54 = 0;
      int v44 = 1;
    }
  }
  else
  {
    id v47 = &_os_log_internal;
    char v46 = 16;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
    {
      log = v47;
      os_log_type_t type = v46;
      __os_log_helper_16_0_0(v45);
      _os_log_error_impl(&dword_20ABD4000, log, type, "UsecaseId and modelId missing while querying for model path", v45, 2u);
    }
    objc_storeStrong(&v47, 0);
    id v54 = 0;
    int v44 = 1;
  }
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
  id v9 = v54;

  return v9;
}

+ (id)deleteWithPredicate:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = a4;
  uint64_t v25 = 0;
  int v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  id v29 = __Block_byref_object_copy__9;
  id v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  uint64_t v18 = 0;
  os_log_type_t v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  id v22 = __Block_byref_object_copy__9;
  char v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  id v17 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v17 getManagedObjectContext];
  id v6 = v16;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __38__AMDModel_deleteWithPredicate_error___block_invoke;
  id v12 = &unk_263FE1C58;
  id v13 = location[0];
  id v14 = v16;
  v15[1] = &v25;
  v15[0] = v17;
  v15[2] = &v18;
  [v6 performBlockAndWait:&v8];
  if (v26[5])
  {
    *id v32 = (id) v26[5];
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

void __38__AMDModel_deleteWithPredicate_error___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  int v9 = (void *)MEMORY[0x263EFF260];
  id v11 = (id)+[AMDModel entity];
  id v10 = (id)[v11 name];
  v18[0] = (id)objc_msgSend(v9, "fetchRequestWithEntityName:");

  if (a1[4]) {
    [v18[0] setPredicate:a1[4]];
  }
  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  double v1 = (void *)a1[5];
  location = (id *)(*(void *)(a1[7] + 8) + 40);
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
    id v2 = (void *)a1[6];
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

+ (id)getCurrentModelInfoByModelId
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v27[2] = a1;
  v27[1] = (id)a2;
  v27[0] = 0;
  id v25 = 0;
  id v17 = (id)[a1 fetchAll:&v25];
  objc_storeStrong(v27, v25);
  id v26 = v17;
  if (v27[0])
  {
    id v24 = &_os_log_internal;
    char v23 = 16;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      log = v24;
      os_log_type_t type = v23;
      id v16 = (id)[v27[0] localizedDescription];
      id v22 = v16;
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v22);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Error fetching all model urls: '%@'", v30, 0xCu);

      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong(&v24, 0);
    id v28 = MEMORY[0x263EFFA78];
    int v21 = 1;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v20 = (id)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v26, "count"));
    memset(__b, 0, sizeof(__b));
    id obj = v26;
    uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
    if (v13)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v13;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(id *)(__b[1] + 8 * v9);
        id v5 = v20;
        id v4 = v19;
        id v6 = (id)[v19 objectForKey:@"modelId"];
        objc_msgSend(v5, "setObject:forKey:", v4);

        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    id v28 = v20;
    int v21 = 1;
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
  id v2 = v28;

  return v2;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDModel", a2, a1);
}

@end