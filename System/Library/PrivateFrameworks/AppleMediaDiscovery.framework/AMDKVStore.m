@interface AMDKVStore
+ (id)deleteWithPredicate:(id)a3 error:(id *)a4;
+ (id)fetchAllKeyValues:(id *)a3;
+ (id)fetchEntryForKey:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
+ (id)fetchValueForKey:(id)a3 error:(id *)a4;
+ (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
@end

@implementation AMDKVStore

+ (id)fetchValueForKey:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  id v18 = (id)[v21 fetchEntryForKey:location[0] error:a4];
  if (*a4)
  {
    uint64_t v22 = 0;
    int v17 = 1;
  }
  else if ([v18 count])
  {
    id v10 = (id)[v18 firstObject];
    id v16 = (id)[v10 objectForKey:@"value"];

    id v15 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v16 options:4 error:v19];
    if (*v19)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v8 = type;
        id v6 = location[0];
        id v9 = (id)[*v19 localizedDescription];
        id v12 = v9;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v23, (uint64_t)v6, (uint64_t)v12);
        _os_log_error_impl(&dword_20ABD4000, log, v8, "Error deserializing value for key %@: %@", v23, 0x16u);

        objc_storeStrong(&v12, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      uint64_t v22 = 0;
      int v17 = 1;
    }
    else
    {
      uint64_t v22 = [v15 mutableCopy];
      int v17 = 1;
    }
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    uint64_t v22 = 0;
    int v17 = 1;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  v4 = (void *)v22;

  return v4;
}

+ (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = a5;
  id v33 = (id)[MEMORY[0x263F08900] dataWithJSONObject:location[0] options:4 error:a5];
  if (*a5)
  {
    id v32 = &_os_log_internal;
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      id v8 = v35;
      id v7 = (id)[*v34 localizedDescription];
      id v30 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v8, (uint64_t)v30);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v32, v31, "Data could not be serialized for key: %@, with error: %@", v37, 0x16u);

      objc_storeStrong(&v30, 0);
    }
    objc_storeStrong(&v32, 0);
    int v29 = 1;
  }
  else
  {
    uint64_t v22 = 0;
    v23 = &v22;
    int v24 = 838860800;
    int v25 = 48;
    v26 = __Block_byref_object_copy__4;
    v27 = __Block_byref_object_dispose__4;
    id v28 = 0;
    id v21 = +[AMDCoreDataPersistentContainer sharedContainer];
    id v20 = (id)[v21 getManagedObjectContext];
    id v6 = v20;
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    v14 = __36__AMDKVStore_setValue_forKey_error___block_invoke;
    id v15 = &unk_263FE1C30;
    id v16 = v20;
    id v17 = v35;
    id v18 = v33;
    v19[0] = v21;
    v19[1] = &v22;
    [v6 performBlockAndWait:&v11];
    if (v23[5])
    {
      id v5 = (id) v23[5];
      id *v34 = v5;
    }
    objc_storeStrong(v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    _Block_object_dispose(&v22, 8);
    objc_storeStrong(&v28, 0);
    int v29 = 0;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __36__AMDKVStore_setValue_forKey_error___block_invoke(void *a1)
{
  v8[2] = a1;
  v8[1] = a1;
  v2 = (void *)MEMORY[0x263EFF240];
  id v4 = (id)+[AMDKVStore entity];
  id v3 = (id)[v4 name];
  v8[0] = (id)objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:");

  [v8[0] setKey:a1[5]];
  [v8[0] setValue:a1[6]];
  v1 = (void *)a1[7];
  location = (id *)(*(void *)(a1[8] + 8) + 40);
  id v7 = *location;
  [v1 save:&v7];
  objc_storeStrong(location, v7);
  objc_storeStrong(v8, 0);
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
  int v29 = __Block_byref_object_copy__4;
  id v30 = __Block_byref_object_dispose__4;
  id v31 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  uint64_t v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  id v17 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v17 getManagedObjectContext];
  id v6 = v16;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __40__AMDKVStore_deleteWithPredicate_error___block_invoke;
  int v12 = &unk_263FE1C58;
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

void __40__AMDKVStore_deleteWithPredicate_error___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  int v9 = (void *)MEMORY[0x263EFF260];
  id v11 = (id)+[AMDKVStore entity];
  id v10 = (id)[v11 name];
  v18[0] = (id)objc_msgSend(v9, "fetchRequestWithEntityName:");

  if (a1[4]) {
    [v18[0] setPredicate:a1[4]];
  }
  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  v1 = (void *)a1[5];
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

+ (id)fetchEntryForKey:(id)a3 error:(id *)a4
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
  int v28 = __Block_byref_object_copy__4;
  int v29 = __Block_byref_object_dispose__4;
  id v30 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  int v21 = __Block_byref_object_copy__4;
  uint64_t v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  id v7 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v7 getManagedObjectContext];

  id v6 = v16;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  int v12 = __37__AMDKVStore_fetchEntryForKey_error___block_invoke;
  id v13 = &unk_263FE1CA8;
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
  uint64_t v4 = v33;

  return v4;
}

void __37__AMDKVStore_fetchEntryForKey_error___block_invoke(void *a1)
{
  v12[2] = a1;
  v12[1] = a1;
  id v6 = (void *)MEMORY[0x263EFF260];
  id v8 = (id)+[AMDKVStore entity];
  id v7 = (id)[v8 name];
  v12[0] = (id)objc_msgSend(v6, "fetchRequestWithEntityName:");

  if (a1[4])
  {
    id v11 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"key == %@", a1[4]];
    [v12[0] setPredicate:v11];
    objc_storeStrong(&v11, 0);
  }
  [v12[0] setResultType:2];
  v1 = (void *)a1[5];
  uint64_t v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id v10 = *v4;
  id v5 = (id)[v1 executeFetchRequest:v12[0] error:&v10];
  objc_storeStrong(v4, v10);
  uint64_t v2 = *(void *)(a1[6] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v5;

  objc_storeStrong(v12, 0);
}

+ (id)fetchAllKeyValues:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v22 = a1;
  SEL v21 = a2;
  int v20 = a3;
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v18 = (id)[v22 fetchEntryForKey:0 error:v20];
  memset(__b, 0, sizeof(__b));
  id obj = v18;
  uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(__b[1] + 8 * v10);
      id v15 = (id)[v17 objectForKey:@"value"];
      id v14 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v15 options:4 error:v20];
      id v6 = v19;
      id v5 = v14;
      id v7 = (id)[v17 objectForKey:@"key"];
      objc_msgSend(v6, "setObject:forKey:", v5);

      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v4 = v19;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);

  return v4;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDKVStore", a2, a1);
}

@end