@interface AMDAppTabInfo
+ (id)deleteAllTabs:(id *)a3;
+ (id)deleteTabsForUseCase:(id)a3 error:(id *)a4;
+ (id)fetchAllTabInfo:(id *)a3;
+ (id)fetchRequest;
+ (id)getInfoForTab:(id)a3 error:(id *)a4;
+ (id)refreshTabsForUseCase:(id)a3 tabs:(id)a4 error:(id *)a5;
+ (void)saveTabInfo:(id)a3 error:(id *)a4;
@end

@implementation AMDAppTabInfo

+ (void)saveTabInfo:(id)a3 error:(id *)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  id v22 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v21 = (id)[v22 getManagedObjectContext];
  uint64_t v14 = 0;
  v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v5 = v21;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __35__AMDAppTabInfo_saveTabInfo_error___block_invoke;
  v10 = &unk_263FE1C08;
  id v11 = location[0];
  id v12 = v21;
  v13[0] = v22;
  v13[1] = &v14;
  [v5 performBlockAndWait:&v6];
  if (v15[5]) {
    id *v23 = (id) v15[5];
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __35__AMDAppTabInfo_saveTabInfo_error___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v28 = a1;
  uint64_t v27 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
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
      uint64_t v26 = *(void *)(__b[1] + 8 * v14);
      id v24 = (id)[*(id *)(a1 + 32) objectForKey:v26];
      if (v24)
      {
        memset(v21, 0, sizeof(v21));
        id v10 = v24;
        uint64_t v11 = [v10 countByEnumeratingWithState:v21 objects:v29 count:16];
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
            v3 = (void *)MEMORY[0x263EFF240];
            id v5 = (id)+[AMDAppTabInfo entity];
            id v4 = (id)[v5 name];
            id v20 = (id)objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:");

            [v20 setTabName:v26];
            [v20 setUseCaseId:v22];
            objc_storeStrong(&v20, 0);
            ++v8;
            if (v6 + 1 >= v9)
            {
              uint64_t v8 = 0;
              unint64_t v9 = [v10 countByEnumeratingWithState:v21 objects:v29 count:16];
              if (!v9) {
                break;
              }
            }
          }
        }

        int v23 = 0;
      }
      else
      {
        int v23 = 3;
      }
      objc_storeStrong(&v24, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  v1 = *(void **)(a1 + 48);
  v2 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v19 = *v2;
  [v1 save:&v19];
  objc_storeStrong(v2, v19);
}

+ (id)refreshTabsForUseCase:(id)a3 tabs:(id)a4 error:(id *)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  id v38 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = a5;
  id v34 = (id)[v38 deleteTabsForUseCase:location[0] error:a5];
  if (*a5)
  {
    id v39 = 0;
    int v33 = 1;
  }
  else
  {
    if (v34) {
      objc_storeStrong(&v34, v34);
    }
    else {
      objc_storeStrong(&v34, &unk_26BEC17A8);
    }
    uint64_t v11 = (void *)MEMORY[0x263EFF9A0];
    v40 = @"deletedForRefresh";
    v41[0] = v34;
    id v10 = (id)[NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v32 = (id)objc_msgSend(v11, "dictionaryWithDictionary:");

    id v31 = +[AMDCoreDataPersistentContainer sharedContainer];
    id v30 = (id)[v31 getManagedObjectContext];
    uint64_t v23 = 0;
    id v24 = &v23;
    int v25 = 838860800;
    int v26 = 48;
    uint64_t v27 = __Block_byref_object_copy_;
    uint64_t v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    id v9 = v30;
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    int v17 = __50__AMDAppTabInfo_refreshTabsForUseCase_tabs_error___block_invoke;
    uint64_t v18 = &unk_263FE1C30;
    id v19 = v36;
    id v20 = v30;
    id v21 = location[0];
    v22[0] = v31;
    v22[1] = &v23;
    [v9 performBlockAndWait:&v14];
    if (v24[5])
    {
      id *v35 = (id) v24[5];
      id v39 = 0;
    }
    else
    {
      id v8 = v32;
      id v7 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v36, "count"));
      objc_msgSend(v8, "setObject:forKey:");

      id v39 = v32;
    }
    int v33 = 1;
    objc_storeStrong(v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    _Block_object_dispose(&v23, 8);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  id v5 = v39;

  return v5;
}

void __50__AMDAppTabInfo_refreshTabsForUseCase_tabs_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v18 = a1;
  uint64_t v17 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
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
      uint64_t v16 = *(void *)(__b[1] + 8 * v8);
      v3 = (void *)MEMORY[0x263EFF240];
      id v5 = (id)+[AMDAppTabInfo entity];
      id v4 = (id)[v5 name];
      id v14 = (id)objc_msgSend(v3, "insertNewObjectForEntityForName:inManagedObjectContext:");

      [v14 setTabName:v16];
      [v14 setUseCaseId:*(void *)(a1 + 48)];
      objc_storeStrong(&v14, 0);
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  v1 = *(void **)(a1 + 56);
  v2 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v13 = *v2;
  [v1 save:&v13];
  objc_storeStrong(v2, v13);
}

+ (id)deleteTabsForUseCase:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v33 = a4;
  id v32 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v31 = (id)[v32 getManagedObjectContext];
  uint64_t v24 = 0;
  int v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  uint64_t v28 = __Block_byref_object_copy_;
  id v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v8 = v31;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  uint64_t v12 = __44__AMDAppTabInfo_deleteTabsForUseCase_error___block_invoke;
  id v13 = &unk_263FE1C58;
  id v14 = location[0];
  id v15 = v31;
  v16[1] = &v24;
  v16[0] = v32;
  v16[2] = &v17;
  [v8 performBlockAndWait:&v9];
  if (v25[5])
  {
    id v4 = (id) v25[5];
    *int v33 = v4;
    id v35 = 0;
  }
  else
  {
    id v35 = (id)v18[5];
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  id v5 = v35;

  return v5;
}

void __44__AMDAppTabInfo_deleteTabsForUseCase_error___block_invoke(void *a1)
{
  v19[2] = a1;
  v19[1] = a1;
  uint64_t v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDAppTabInfo entity];
  id v8 = (id)[v9 name];
  v19[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  id v18 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"useCaseId == %@", a1[4]];
  [v19[0] setPredicate:v18];
  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v19[0]];
  [v17 setResultType:2];
  v1 = (void *)a1[5];
  location = (id *)(*(void *)(a1[7] + 8) + 40);
  id v15 = *location;
  id v11 = (id)[v1 executeRequest:v17 error:&v15];
  objc_storeStrong(location, v15);
  id v16 = v11;
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    int v14 = 1;
  }
  else
  {
    v2 = (void *)a1[6];
    uint64_t v6 = (id *)(*(void *)(a1[7] + 8) + 40);
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
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

+ (id)getInfoForTab:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v33 = a4;
  if (location[0])
  {
    uint64_t v25 = 0;
    int v26 = &v25;
    int v27 = 838860800;
    int v28 = 48;
    id v29 = __Block_byref_object_copy_;
    id v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    uint64_t v18 = 0;
    int v19 = &v18;
    int v20 = 838860800;
    int v21 = 48;
    uint64_t v22 = __Block_byref_object_copy_;
    id v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    id v8 = +[AMDCoreDataPersistentContainer sharedContainer];
    id v17 = (id)[v8 getManagedObjectContext];

    id v7 = v17;
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = __37__AMDAppTabInfo_getInfoForTab_error___block_invoke;
    int v14 = &unk_263FE1C80;
    id v15 = location[0];
    v16[0] = v17;
    v16[1] = &v25;
    v16[2] = &v18;
    [v7 performBlockAndWait:&v10];
    if (v26[5])
    {
      id v4 = (id) v26[5];
      *int v33 = v4;
      id v35 = 0;
    }
    else
    {
      id v35 = (id)v19[5];
    }
    int v32 = 1;
    objc_storeStrong(v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v17, 0);
    _Block_object_dispose(&v18, 8);
    objc_storeStrong(&v24, 0);
    _Block_object_dispose(&v25, 8);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    *int v33 = +[AMDError allocError:15 withMessage:@"no tab name"];
    id v35 = 0;
    int v32 = 1;
  }
  objc_storeStrong(location, 0);
  id v5 = v35;

  return v5;
}

void __37__AMDAppTabInfo_getInfoForTab_error___block_invoke(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v25[2] = a1;
  v25[1] = a1;
  int v11 = (void *)MEMORY[0x263EFF260];
  id v13 = (id)+[AMDAppTabInfo entity];
  id v12 = (id)[v13 name];
  v25[0] = (id)objc_msgSend(v11, "fetchRequestWithEntityName:");

  id v24 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"tabName == %@", a1[4]];
  [v25[0] setPredicate:v24];
  v1 = (void *)a1[5];
  location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v22 = *location;
  id v15 = (id)[v1 executeFetchRequest:v25[0] error:&v22];
  objc_storeStrong(location, v22);
  id v23 = v15;
  id v16 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v2 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v23, "count"));
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  memset(__b, 0, sizeof(__b));
  id obj = v23;
  uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
  if (v19)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v19;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(id *)(__b[1] + 8 * v9);
      id v5 = *(void **)(*(void *)(a1[7] + 8) + 40);
      id v6 = (id)[v21 useCaseId];
      objc_msgSend(v5, "addObject:");

      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
}

+ (id)deleteAllTabs:(id *)a3
{
  id v32 = a1;
  SEL v31 = a2;
  id v30 = a3;
  id v29 = +[AMDCoreDataPersistentContainer sharedContainer];
  id location = (id)[v29 getManagedObjectContext];
  uint64_t v21 = 0;
  id v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  uint64_t v25 = __Block_byref_object_copy_;
  int v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v6 = location;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  unint64_t v10 = __31__AMDAppTabInfo_deleteAllTabs___block_invoke;
  int v11 = &unk_263FE1CA8;
  id v12 = location;
  v13[1] = &v21;
  v13[0] = v29;
  id v13[2] = &v14;
  [v6 performBlockAndWait:&v7];
  if (v22[5])
  {
    id v3 = (id) v22[5];
    *id v30 = v3;
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
  id v4 = v33;

  return v4;
}

void __31__AMDAppTabInfo_deleteAllTabs___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  uint64_t v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDAppTabInfo entity];
  id v8 = (id)[v9 name];
  v18[0] = (id)objc_msgSend(v7, "fetchRequestWithEntityName:");

  id v1 = objc_alloc(MEMORY[0x263EFF1D0]);
  id v17 = (id)[v1 initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  uint64_t v2 = (void *)a1[4];
  id location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v15 = *location;
  id v11 = (id)[v2 executeRequest:v17 error:&v15];
  objc_storeStrong(location, v15);
  id v16 = v11;
  id v3 = (void *)a1[5];
  id v12 = (id *)(*(void *)(a1[6] + 8) + 40);
  id v14 = *v12;
  [v3 save:&v14];
  objc_storeStrong(v12, v14);
  id v4 = (id)[v16 result];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)fetchAllTabInfo:(id *)a3
{
  id v31 = a1;
  SEL v30 = a2;
  id v29 = a3;
  id v6 = +[AMDCoreDataPersistentContainer sharedContainer];
  id location = (id)[v6 getManagedObjectContext];

  uint64_t v21 = 0;
  id v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  uint64_t v25 = __Block_byref_object_copy_;
  int v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v7 = location;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __33__AMDAppTabInfo_fetchAllTabInfo___block_invoke;
  id v12 = &unk_263FE1CD0;
  v13[1] = &v14;
  v13[0] = location;
  id v13[2] = &v21;
  [v7 performBlockAndWait:&v8];
  if (v22[5])
  {
    id v3 = (id) v22[5];
    *id v29 = v3;
    id v32 = 0;
  }
  else
  {
    id v32 = (id)v15[5];
  }
  objc_storeStrong(v13, 0);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&location, 0);
  id v4 = v32;

  return v4;
}

void __33__AMDAppTabInfo_fetchAllTabInfo___block_invoke(void *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  id v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDAppTabInfo entity];
  id v5 = (id)[v6 name];
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  [v11[0] setResultType:2];
  id v1 = (void *)a1[4];
  id location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v10 = *location;
  id v9 = (id)[v1 executeFetchRequest:v11[0] error:&v10];
  objc_storeStrong(location, v10);
  uint64_t v2 = *(void *)(a1[5] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDAppTabInfo", a2, a1);
}

@end