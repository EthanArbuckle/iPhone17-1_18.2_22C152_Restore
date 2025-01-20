@interface AMDDescriptor
+ (id)deleteAll:(id *)a3;
+ (id)fetchRequest;
+ (id)getDescriptorsForDomain:(int64_t)a3 error:(id *)a4;
+ (id)refreshDescriptors:(id)a3 forDomain:(int64_t)a4 error:(id *)a5;
@end

@implementation AMDDescriptor

+ (id)deleteAll:(id *)a3
{
  id v31 = a1;
  SEL v30 = a2;
  v29 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  int v24 = 838860800;
  int v25 = 48;
  v26 = __Block_byref_object_copy__11;
  v27 = __Block_byref_object_dispose__11;
  id v28 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  int v17 = 838860800;
  int v18 = 48;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  id v14 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v13 = (id)[v14 getManagedObjectContext];
  id v5 = v13;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __27__AMDDescriptor_deleteAll___block_invoke;
  v10 = &unk_263FE1CA8;
  id v11 = v13;
  v12[1] = &v22;
  v12[0] = v14;
  v12[2] = &v15;
  [v5 performBlockAndWait:&v6];
  if (v23[5])
  {
    id *v29 = (id) v23[5];
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

void __27__AMDDescriptor_deleteAll___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  int v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDDescriptor entity];
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
    v2 = (void *)a1[5];
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

+ (id)refreshDescriptors:(id)a3 forDomain:(int64_t)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v45 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = (void *)a4;
  v42 = a5;
  id v41 = (id)[v45 deleteAll:a5];
  uint64_t v34 = 0;
  v35 = &v34;
  int v36 = 838860800;
  int v37 = 48;
  v38 = __Block_byref_object_copy__11;
  v39 = __Block_byref_object_dispose__11;
  id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (*v42)
  {
    id v33 = &_os_log_internal;
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      id v9 = (id)[*v42 localizedDescription];
      id v31 = v9;
      __os_log_helper_16_2_1_8_64((uint64_t)v47, (uint64_t)v31);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v33, v32, "Error deleting descriptors: %@", v47, 0xCu);

      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong(&v33, 0);
    id *v42 = 0;
  }
  else
  {
    if (v41) {
      objc_storeStrong(&v41, v41);
    }
    else {
      objc_storeStrong(&v41, &unk_26BEC2198);
    }
    id v30 = &_os_log_internal;
    os_log_type_t v29 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v46, [v41 unsignedIntValue]);
      _os_log_impl(&dword_20ABD4000, (os_log_t)v30, v29, "Deleted %u descriptors", v46, 8u);
    }
    objc_storeStrong(&v30, 0);
    [(id)v35[5] setObject:v41 forKey:@"deletedForRefresh"];
  }
  uint64_t v22 = 0;
  v23 = &v22;
  int v24 = 838860800;
  int v25 = 48;
  v26 = __Block_byref_object_copy__11;
  v27 = __Block_byref_object_dispose__11;
  id v28 = 0;
  id v21 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v20 = (id)[v21 getManagedObjectContext];
  id v8 = v20;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __52__AMDDescriptor_refreshDescriptors_forDomain_error___block_invoke;
  id v16 = &unk_263FE26E8;
  id v17 = location[0];
  v19[1] = &v22;
  id v18 = v20;
  v19[3] = v43;
  v19[2] = &v34;
  v19[0] = v21;
  [v8 performBlockAndWait:&v12];
  if (v23[5])
  {
    id v5 = (id) v23[5];
    id *v42 = v5;
  }
  id v7 = (id)v35[5];
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  _Block_object_dispose(&v22, 8);
  objc_storeStrong(&v28, 0);
  _Block_object_dispose(&v34, 8);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);

  return v7;
}

void __52__AMDDescriptor_refreshDescriptors_forDomain_error___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v44[2] = (id)a1;
  v44[1] = (id)a1;
  v44[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  char v43 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v31 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
  if (v31)
  {
    uint64_t v26 = *(void *)__b[2];
    uint64_t v27 = 0;
    unint64_t v28 = v31;
    while (1)
    {
      uint64_t v25 = v27;
      if (*(void *)__b[2] != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v42 = *(void *)(__b[1] + 8 * v27);
      id v21 = (void *)MEMORY[0x263F08900];
      id v24 = (id)[*(id *)(a1 + 32) objectForKey:v42];
      location = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v39 = *location;
      id v23 = (id)objc_msgSend(v21, "dataWithJSONObject:options:error:");
      objc_storeStrong(location, v39);
      id v40 = v23;

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        goto LABEL_29;
      }
      if (v40)
      {
        id v18 = (void *)MEMORY[0x263EFF240];
        id v20 = (id)+[AMDDescriptor entity];
        id v19 = (id)[v20 name];
        id v37 = (id)objc_msgSend(v18, "insertNewObjectForEntityForName:inManagedObjectContext:");

        [v37 setFeatureName:v42];
        [v37 setDescriptor:v40];
        [v37 setDomain:(__int16)*(void *)(a1 + 72)];
        [v44[0] addObject:v37];
        objc_storeStrong(&v37, 0);
        int v38 = 0;
      }
      else
      {
LABEL_29:
        if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          id v1 = +[AMDError allocError:11 withMessage:@"could not serialize descriptor data"];
          uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
          id v3 = *(void **)(v2 + 40);
          *(void *)(v2 + 40) = v1;
        }
        char v43 = 1;
        int v38 = 2;
      }
      objc_storeStrong(&v40, 0);
      if (v38) {
        break;
      }
      ++v27;
      if (v25 + 1 >= v28)
      {
        uint64_t v27 = 0;
        unint64_t v28 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
        if (!v28) {
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
LABEL_14:
    int v38 = 0;
  }

  if (v43)
  {
    memset(v35, 0, sizeof(v35));
    id v16 = v44[0];
    uint64_t v17 = [v16 countByEnumeratingWithState:v35 objects:v46 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)v35[2];
      uint64_t v14 = 0;
      unint64_t v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)v35[2] != v13) {
          objc_enumerationMutation(v16);
        }
        uint64_t v36 = *(void *)(v35[1] + 8 * v14);
        [*(id *)(a1 + 40) deleteObject:v36];
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [v16 countByEnumeratingWithState:v35 objects:v46 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    id v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v8 = NSString;
    id v11 = (id)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) localizedDescription];
    id v10 = (id)[v8 stringWithFormat:@"error: %@", v11];
    objc_msgSend(v9, "setObject:forKey:");
  }
  else
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v7 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v44[0], "count"));
    objc_msgSend(v6, "setObject:forKey:");

    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v45, [v44[0] count]);
      _os_log_impl(&dword_20ABD4000, oslog, type, "Added %lu descriptors", v45, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  uint64_t v4 = *(void **)(a1 + 48);
  id v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v32 = *v5;
  [v4 save:&v32];
  objc_storeStrong(v5, v32);
  objc_storeStrong(v44, 0);
}

+ (id)getDescriptorsForDomain:(int64_t)a3 error:(id *)a4
{
  id v32 = a1;
  SEL v31 = a2;
  id v30 = (void *)a3;
  os_log_type_t v29 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  int v24 = 838860800;
  int v25 = 48;
  uint64_t v26 = __Block_byref_object_copy__11;
  uint64_t v27 = __Block_byref_object_dispose__11;
  id v28 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  int v17 = 838860800;
  int v18 = 48;
  id v19 = __Block_byref_object_copy__11;
  id v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  id v7 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v14 = (id)[v7 getManagedObjectContext];

  id v6 = v14;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __47__AMDDescriptor_getDescriptorsForDomain_error___block_invoke;
  uint64_t v12 = &unk_263FE2710;
  v13[3] = v30;
  v13[0] = v14;
  v13[1] = &v22;
  v13[2] = &v15;
  [v6 performBlockAndWait:&v8];
  if (v23[5])
  {
    id *v29 = (id) v23[5];
    id v33 = 0;
  }
  else
  {
    id v33 = (id)v16[5];
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  _Block_object_dispose(&v15, 8);
  objc_storeStrong(&v21, 0);
  _Block_object_dispose(&v22, 8);
  objc_storeStrong(&v28, 0);
  uint64_t v4 = v33;

  return v4;
}

void __47__AMDDescriptor_getDescriptorsForDomain_error___block_invoke(void *a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33[2] = a1;
  v33[1] = a1;
  id v19 = (void *)MEMORY[0x263EFF260];
  id v21 = (id)+[AMDDescriptor entity];
  id v20 = (id)[v21 name];
  v33[0] = (id)objc_msgSend(v19, "fetchRequestWithEntityName:");

  id v32 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"domain == %d", a1[7]);
  [v33[0] setPredicate:v32];
  id v1 = (void *)a1[4];
  location = (id *)(*(void *)(a1[5] + 8) + 40);
  id v30 = *location;
  id v23 = (id)[v1 executeFetchRequest:v33[0] error:&v30];
  objc_storeStrong(location, v30);
  id v31 = v23;
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    int v29 = 1;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v2 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v31, "count"));
    uint64_t v3 = *(void *)(a1[6] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    memset(__b, 0, sizeof(__b));
    id obj = v31;
    uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
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
        id v28 = *(id *)(__b[1] + 8 * v14);
        uint64_t v8 = (void *)MEMORY[0x263F08900];
        id v11 = (id)[v28 descriptor];
        int v9 = (id *)(*(void *)(a1[5] + 8) + 40);
        id v25 = *v9;
        id v10 = (id)objc_msgSend(v8, "JSONObjectWithData:options:error:");
        objc_storeStrong(v9, v25);
        id v26 = v10;

        if (*(void *)(*(void *)(a1[5] + 8) + 40))
        {
          int v29 = 1;
        }
        else
        {
          id v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
          id v5 = v26;
          id v7 = (id)[v28 featureName];
          objc_msgSend(v6, "setValue:forKey:", v5);

          int v29 = 0;
        }
        objc_storeStrong(&v26, 0);
        if (v29) {
          break;
        }
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
          if (!v15) {
            goto LABEL_13;
          }
        }
      }
    }
    else
    {
LABEL_13:
      int v29 = 0;
    }

    if (!v29) {
      int v29 = 0;
    }
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v33, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDDescriptor", a2, a1);
}

@end