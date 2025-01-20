@interface AMDStorage
+ (id)fetchCoreDataRecordsFrom:(id)a3 error:(id *)a4;
+ (id)fetchRecordsFrom:(id)a3 error:(id *)a4;
+ (id)persistFitnessData:(id)a3;
+ (unsigned)deleteCoreDataRecordsFrom:(id)a3 usingPredicates:(id)a4 error:(id *)a5;
+ (unsigned)deleteRecordsFrom:(id)a3 usingPredicates:(id)a4 error:(id *)a5;
+ (unsigned)saveRecords:(id)a3 inTable:(id)a4 error:(id *)a5;
+ (unsigned)saveRecordsToCoreData:(id)a3 inTable:(id)a4 error:(id *)a5;
@end

@implementation AMDStorage

+ (unsigned)saveRecords:(id)a3 inTable:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  id v10 = &_os_log_internal;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [location[0] count];
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v15, v5, (uint64_t)v12);
    _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v10, OS_LOG_TYPE_DEBUG, "Saving %lu events to table %@", v15, 0x16u);
  }
  objc_storeStrong(&v10, 0);
  unsigned int v7 = [v14 saveRecordsToCoreData:location[0] inTable:v12 error:v11];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)fetchRecordsFrom:(id)a3 error:(id *)a4
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[v8 fetchCoreDataRecordsFrom:location[0] error:a4];
  objc_storeStrong(location, 0);

  return v6;
}

+ (unsigned)deleteRecordsFrom:(id)a3 usingPredicates:(id)a4 error:(id *)a5
{
  id v11 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  unsigned int v8 = [v11 deleteCoreDataRecordsFrom:location[0] usingPredicates:v9 error:a5];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (unsigned)saveRecordsToCoreData:(id)a3 inTable:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = 0;
  objc_storeStrong(&v32, a4);
  v31 = a5;
  id v30 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v29 = (id)[v30 getManagedObjectContext];
  SEL v28 = NSSelectorFromString(&cfstr_Populaterecord.isa);
  uint64_t v21 = 0;
  v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  id v8 = v29;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  v15 = __50__AMDStorage_saveRecordsToCoreData_inTable_error___block_invoke;
  uint64_t v16 = &unk_263FE1F48;
  id v17 = location[0];
  id v18 = v32;
  id v19 = v29;
  v20[2] = (id)v28;
  v20[1] = &v21;
  v20[0] = v30;
  [v8 performBlockAndWait:&v12];
  if (v22[5])
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [location[0] count];
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v35, v7, (uint64_t)v32);
      _os_log_debug_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_DEBUG, "Failed to save %lu events to table %@", v35, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v6 = (id) v22[5];
    id *v31 = v6;
    unsigned int v34 = 0;
  }
  else
  {
    unsigned int v34 = [location[0] count];
  }
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v34;
}

void __50__AMDStorage_saveRecordsToCoreData_inTable_error___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v25 = a1;
  uint64_t v24 = a1;
  char v23 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(a1 + 32);
  uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
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
      uint64_t v22 = *(void *)(__b[1] + 8 * v9);
      id v20 = (id)[MEMORY[0x263EFF240] insertNewObjectForEntityForName:*(void *)(a1 + 40) inManagedObjectContext:*(void *)(a1 + 48)];
      if (v23 & 1) != 0 || (objc_opt_respondsToSelector())
      {
        char v23 = 1;
        v15 = 0;
        v15 = (void *)[v20 methodForSelector:*(void *)(a1 + 72)];
        v14[1] = v15;
        ((void (*)(id, void, uint64_t))v15)(v20, *(void *)(a1 + 72), v22);
        int v16 = 0;
      }
      else
      {
        id v19 = (id)[NSString stringWithFormat:@"MO for table '%@' missing selector 'populateRecord'", *(void *)(a1 + 40)];
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v19);
          _os_log_error_impl(&dword_20ABD4000, log, type, "%@", v26, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v1 = +[AMDError allocError:15 withMessage:v19];
        uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
        v3 = *(void **)(v2 + 40);
        *(void *)(v2 + 40) = v1;

        int v16 = 2;
        objc_storeStrong(&v19, 0);
      }
      objc_storeStrong(&v20, 0);
      if (v16) {
        break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v10) {
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
LABEL_14:
    int v16 = 0;
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v4 = *(void **)(a1 + 56);
    uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v14[0] = *v5;
    [v4 save:v14];
    objc_storeStrong(v5, v14[0]);
  }
}

+ (id)fetchCoreDataRecordsFrom:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = a4;
  id v32 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v31 = (id)[v32 getManagedObjectContext];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  uint64_t v28 = __Block_byref_object_copy__2;
  id v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  uint64_t v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  id v9 = v31;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = __45__AMDStorage_fetchCoreDataRecordsFrom_error___block_invoke;
  int v14 = &unk_263FE1CA8;
  id v15 = location[0];
  v16[1] = &v17;
  v16[0] = v31;
  v16[2] = &v24;
  [v9 performBlockAndWait:&v10];
  if (v25[5])
  {
    id v4 = (id) v25[5];
    id *v33 = v4;
    id v35 = 0;
  }
  else
  {
    if (v18[5]) {
      id v5 = (id)v18[5];
    }
    else {
      id v5 = MEMORY[0x263EFFA68];
    }
    id v35 = v5;
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  id v6 = v35;

  return v6;
}

void __45__AMDStorage_fetchCoreDataRecordsFrom_error___block_invoke(void *a1)
{
  v8[2] = a1;
  v8[1] = a1;
  v8[0] = (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:a1[4]];
  [v8[0] setResultType:2];
  id v1 = (void *)a1[5];
  location = (id *)(*(void *)(a1[7] + 8) + 40);
  id v7 = *location;
  id v6 = (id)[v1 executeFetchRequest:v8[0] error:&v7];
  objc_storeStrong(location, v7);
  uint64_t v2 = *(void *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v6;

  objc_storeStrong(v8, 0);
}

+ (unsigned)deleteCoreDataRecordsFrom:(id)a3 usingPredicates:(id)a4 error:(id *)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  v33 = a5;
  id v32 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v31 = (id)[v32 getManagedObjectContext];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  uint64_t v28 = __Block_byref_object_copy__2;
  id v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  uint64_t v19 = 0;
  int v20 = &v19;
  int v21 = 0x20000000;
  int v22 = 32;
  int v23 = 0;
  id v9 = v31;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = __62__AMDStorage_deleteCoreDataRecordsFrom_usingPredicates_error___block_invoke;
  int v14 = &unk_263FE1F70;
  id v15 = location[0];
  id v16 = v34;
  id v17 = v31;
  v18[1] = &v24;
  v18[0] = v32;
  v18[2] = &v19;
  [v9 performBlockAndWait:&v10];
  if (v25[5])
  {
    id v5 = (id) v25[5];
    id *v33 = v5;
    unsigned int v36 = 0;
  }
  else
  {
    unsigned int v36 = *((_DWORD *)v20 + 6);
  }
  objc_storeStrong(v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v36;
}

void __62__AMDStorage_deleteCoreDataRecordsFrom_usingPredicates_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27[2] = (id)a1;
  v27[1] = (id)a1;
  v27[0] = (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (*(void *)(a1 + 40))
  {
    memset(__b, 0, sizeof(__b));
    id obj = *(id *)(a1 + 40);
    uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
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
        uint64_t v25 = *(void *)(__b[1] + 8 * v14);
        id v10 = v26;
        id v11 = (id)[MEMORY[0x263F08A98] predicateWithFormat:v25];
        objc_msgSend(v10, "addObject:");

        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }
  }
  id v6 = v27[0];
  id v7 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:v26];
  objc_msgSend(v6, "setPredicate:");

  id v1 = objc_alloc(MEMORY[0x263EFF1D0]);
  id v23 = (id)[v1 initWithFetchRequest:v27[0]];
  [v23 setResultType:2];
  uint64_t v2 = *(void **)(a1 + 48);
  location = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v21 = *location;
  id v9 = (id)[v2 executeRequest:v23 error:&v21];
  objc_storeStrong(location, v21);
  id v22 = v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    int v20 = 1;
  }
  else
  {
    v3 = *(void **)(a1 + 56);
    id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v19 = *v4;
    [v3 save:&v19];
    objc_storeStrong(v4, v19);
    id v5 = (id)[v22 result];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v5 unsignedIntValue];

    int v20 = 0;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
}

+ (id)persistFitnessData:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = (id)[location[0] allKeys];
  id v3 = +[AMDSQLite deleteEventsWithPredicate:forStreams:](AMDSQLite, "deleteEventsWithPredicate:forStreams:", 0);

  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
  if (v16)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v16;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(__b[1] + 8 * v12);
      id v20 = 0;
      v25[0] = 0x26BEAEC38;
      v26[0] = v22;
      v25[1] = 0x26BEAEC18;
      id v8 = (id)[location[0] objectForKey:v22];
      v26[1] = v8;
      id v19 = (id)[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

      id v17 = v20;
      id v9 = +[AMDSQLite saveEvents:v19 error:&v17];
      objc_storeStrong(&v20, v17);
      id v18 = v9;
      if (v20)
      {
        id v6 = v23;
        id v7 = (id)[v20 localizedDescription];
        objc_msgSend(v6, "setObject:forKey:");
      }
      if (v18) {
        [v23 setObject:v18 forKey:v22];
      }
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v20, 0);
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  id v5 = v23;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);

  return v5;
}

@end