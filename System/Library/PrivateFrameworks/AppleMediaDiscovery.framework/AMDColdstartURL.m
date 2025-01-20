@interface AMDColdstartURL
+ (id)deleteAllColdstartUrls:(id *)a3;
+ (id)deleteWithPredicate:(id)a3 error:(id *)a4;
+ (id)fetchAll:(id *)a3;
+ (id)fetchRequest;
+ (id)getColdstartURLForModel:(id)a3 error:(id *)a4;
+ (id)getCurrentURLInfoByModelId;
+ (void)deleteColdstartURLs:(id)a3 error:(id *)a4;
+ (void)saveColdstartURL:(id)a3 error:(id *)a4;
@end

@implementation AMDColdstartURL

+ (id)getColdstartURLForModel:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  int v31 = 838860800;
  int v32 = 48;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  int v24 = 838860800;
  int v25 = 48;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  id v9 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v21 = (id)[v9 getManagedObjectContext];

  id v8 = v21;
  uint64_t v14 = MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  v17 = __49__AMDColdstartURL_getColdstartURLForModel_error___block_invoke;
  v18 = &unk_263FE1C80;
  id v19 = location[0];
  v20[0] = v21;
  v20[1] = &v29;
  v20[2] = &v22;
  [v8 performBlockAndWait:&v14];
  if (v30[5])
  {
    id *v36 = (id) v30[5];
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v7 = location[0];
      id v6 = (id)[*v36 localizedDescription];
      id v11 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v39, (uint64_t)v7, (uint64_t)v11);
      _os_log_error_impl(&dword_20ABD4000, oslog, type, "Error fetching coldstart urls for model: %@ %@", v39, 0x16u);

      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v38 = 0;
  }
  else
  {
    id v38 = (id)v23[5];
  }
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v21, 0);
  _Block_object_dispose(&v22, 8);
  objc_storeStrong(&v28, 0);
  _Block_object_dispose(&v29, 8);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  v4 = v38;

  return v4;
}

void __49__AMDColdstartURL_getColdstartURLForModel_error___block_invoke(void *a1)
{
  v16[2] = a1;
  v16[1] = a1;
  v5 = (void *)MEMORY[0x263EFF260];
  id v7 = (id)+[AMDColdstartURL entity];
  id v6 = (id)[v7 name];
  v16[0] = (id)objc_msgSend(v5, "fetchRequestWithEntityName:");

  id v15 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"modelId == %@", a1[4]];
  [v16[0] setPredicate:v15];
  v1 = (void *)a1[5];
  location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v13 = *location;
  id v9 = (id)[v1 executeFetchRequest:v16[0] error:&v13];
  objc_storeStrong(location, v13);
  id v14 = v9;
  if (!*(void *)(*(void *)(a1[6] + 8) + 40) && v14)
  {
    id v11 = (id)[v14 firstObject];
    if (v11)
    {
      id v2 = (id)[v11 url];
      uint64_t v3 = *(void *)(a1[7] + 8);
      v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
    objc_storeStrong(&v11, 0);
    int v12 = 0;
  }
  else
  {
    int v12 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

+ (id)getCurrentURLInfoByModelId
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21[2] = a1;
  v21[1] = (id)a2;
  v21[0] = 0;
  id v19 = 0;
  id v14 = +[AMDColdstartURL fetchAll:&v19];
  objc_storeStrong(v21, v19);
  id v20 = v14;
  if (v21[0])
  {
    id v22 = MEMORY[0x263EFFA78];
    int v18 = 1;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v17 = (id)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v20, "count"));
    memset(__b, 0, sizeof(__b));
    id obj = v20;
    uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
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
        id v16 = *(id *)(__b[1] + 8 * v9);
        id v5 = v17;
        id v4 = v16;
        id v6 = (id)[v16 objectForKey:@"modelId"];
        objc_msgSend(v5, "setObject:forKey:", v4);

        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    id v22 = v17;
    int v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  id v2 = v22;

  return v2;
}

+ (id)fetchAll:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v34 = a1;
  SEL v33 = a2;
  int v32 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  uint64_t v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  id v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  id v7 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v17 = (id)[v7 getManagedObjectContext];

  id v6 = v17;
  uint64_t v11 = MEMORY[0x263EF8330];
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = __28__AMDColdstartURL_fetchAll___block_invoke;
  id v15 = &unk_263FE1CD0;
  v16[1] = &v18;
  v16[0] = v17;
  v16[2] = &v25;
  [v6 performBlockAndWait:&v11];
  if (v26[5])
  {
    *int v32 = (id) v26[5];
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v5 = (id)[*v32 localizedDescription];
      id location = v5;
      __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)location);
      _os_log_error_impl(&dword_20ABD4000, oslog, type, "Error fetching all the coldstart urls. %@", v36, 0xCu);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v35 = 0;
  }
  else
  {
    id v35 = (id)v19[5];
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v17, 0);
  _Block_object_dispose(&v18, 8);
  objc_storeStrong(&v24, 0);
  _Block_object_dispose(&v25, 8);
  objc_storeStrong(&v31, 0);
  uint64_t v3 = v35;

  return v3;
}

void __28__AMDColdstartURL_fetchAll___block_invoke(void *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  id v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDColdstartURL entity];
  id v5 = (id)[v6 name];
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  [v11[0] setResultType:2];
  v1 = (void *)a1[4];
  id location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v10 = *location;
  id v9 = (id)[v1 executeFetchRequest:v11[0] error:&v10];
  objc_storeStrong(location, v10);
  uint64_t v2 = *(void *)(a1[5] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (void)deleteColdstartURLs:(id)a3 error:(id *)a4
{
  id v25 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  int v18 = 838860800;
  int v19 = 48;
  int v20 = __Block_byref_object_copy__3;
  int v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  id v15 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v14 = (id)[v15 getManagedObjectContext];
  id v5 = v14;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __45__AMDColdstartURL_deleteColdstartURLs_error___block_invoke;
  uint64_t v11 = &unk_263FE1FB0;
  id v12 = location[0];
  v13[2] = v25;
  v13[1] = &v16;
  v13[0] = v15;
  [v5 performBlockAndWait:&v7];
  if (v17[5])
  {
    id v4 = (id) v17[5];
    id *v23 = v4;
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __45__AMDColdstartURL_deleteColdstartURLs_error___block_invoke(uint64_t a1)
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
      id location = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
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
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v13 = *v4;
    [v3 save:&v13];
    objc_storeStrong(v4, v13);
  }
}

+ (void)saveColdstartURL:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = a4;
  uint64_t v17 = 0;
  int v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  uint64_t v21 = __Block_byref_object_copy__3;
  id v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  id v16 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v15 = (id)[v16 getManagedObjectContext];
  id v5 = v15;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __42__AMDColdstartURL_saveColdstartURL_error___block_invoke;
  uint64_t v11 = &unk_263FE1FD8;
  id v12 = v15;
  id v13 = location[0];
  v14[1] = &v17;
  v14[0] = v16;
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

void __42__AMDColdstartURL_saveColdstartURL_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18[2] = (id)a1;
  v18[1] = (id)a1;
  uint64_t v6 = (void *)MEMORY[0x263EFF240];
  id v8 = (id)+[AMDColdstartURL entity];
  id v7 = (id)[v8 name];
  v18[0] = (id)objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:");

  id v17 = (id)[*(id *)(a1 + 40) objectForKey:@"modelId"];
  id v16 = (id)[*(id *)(a1 + 40) objectForKey:@"url"];
  id v15 = (id)[*(id *)(a1 + 40) objectForKey:@"version"];
  if (v17 && v16 && v15)
  {
    [v18[0] setModelId:v17];
    [v18[0] setUrl:v16];
    [v18[0] setVersion:v15];
    id v4 = *(void **)(a1 + 48);
    id v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v10 = *v5;
    [v4 save:&v10];
    objc_storeStrong(v5, v10);
    int v11 = 0;
  }
  else
  {
    id v14 = (id)[NSString stringWithFormat:@"Incomplete coldstart info"];
    id location = &_os_log_internal;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v14);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)location, v12, "%@", v19, 0xCu);
    }
    objc_storeStrong(&location, 0);
    id v1 = +[AMDError allocError:15 withMessage:v14];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v1;

    int v11 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)deleteAllColdstartUrls:(id *)a3
{
  id v31 = a1;
  SEL v30 = a2;
  uint64_t v29 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  int v24 = 838860800;
  int v25 = 48;
  v26 = __Block_byref_object_copy__3;
  int v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  int v17 = 838860800;
  int v18 = 48;
  int v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  id v14 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v13 = (id)[v14 getManagedObjectContext];
  id v5 = v13;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __42__AMDColdstartURL_deleteAllColdstartUrls___block_invoke;
  id v10 = &unk_263FE1CA8;
  id v11 = v13;
  v12[1] = &v22;
  v12[0] = v14;
  v12[2] = &v15;
  [v5 performBlockAndWait:&v6];
  if (v23[5])
  {
    *uint64_t v29 = (id) v23[5];
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
  uint64_t v3 = v32;

  return v3;
}

void __42__AMDColdstartURL_deleteAllColdstartUrls___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  int v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDColdstartURL entity];
  id v8 = (id)[v9 name];
  v18[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  id v1 = (void *)a1[4];
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
    uint64_t v2 = (void *)a1[5];
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

+ (id)deleteWithPredicate:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  uint64_t v29 = __Block_byref_object_copy__3;
  SEL v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  uint64_t v18 = 0;
  int v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  uint64_t v22 = __Block_byref_object_copy__3;
  id v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  id v17 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v17 getManagedObjectContext];
  id v6 = v16;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __45__AMDColdstartURL_deleteWithPredicate_error___block_invoke;
  os_log_type_t v12 = &unk_263FE1C58;
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
  uint64_t v4 = v34;

  return v4;
}

void __45__AMDColdstartURL_deleteWithPredicate_error___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  int v9 = (void *)MEMORY[0x263EFF260];
  id v11 = (id)+[AMDColdstartURL entity];
  id v10 = (id)[v11 name];
  v18[0] = (id)objc_msgSend(v9, "fetchRequestWithEntityName:");

  if (a1[4]) {
    [v18[0] setPredicate:a1[4]];
  }
  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  id v1 = (void *)a1[5];
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
    uint64_t v2 = (void *)a1[6];
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

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDColdstartURL", a2, a1);
}

@end