@interface AMDAppStoreEvent
+ (id)deleteAllEvents:(id *)a3;
+ (id)deleteEventsForPredicate:(id)a3 error:(id *)a4;
+ (id)deleteEventsForUser:(id)a3 error:(id *)a4;
+ (id)deleteEventsOlderThan:(unint64_t)a3 error:(id *)a4;
+ (id)fetchEvents:(id *)a3;
+ (id)fetchRequest;
+ (id)retrieveEventsOfType:(id)a3 inPeriod:(id)a4 forUser:(id)a5 error:(id *)a6;
+ (signed)getEventType:(id)a3;
+ (unsigned)saveEvent:(id)a3 forUser:(id)a4 error:(id *)a5;
@end

@implementation AMDAppStoreEvent

+ (signed)getEventType:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getEventType__eventTypeMap_0) {
    objc_storeStrong((id *)&getEventType__eventTypeMap_0, &unk_26BEC27D8);
  }
  id v5 = (id)[(id)getEventType__eventTypeMap_0 objectForKey:location[0]];
  if (v5) {
    signed __int16 v4 = [v5 unsignedIntValue];
  }
  else {
    signed __int16 v4 = 2;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

+ (unsigned)saveEvent:(id)a3 forUser:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v55 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  v52 = a5;
  id v51 = (id)[location[0] objectForKey:@"adamId"];
  id v50 = (id)[location[0] objectForKey:@"time"];
  id v49 = (id)[location[0] objectForKey:@"type"];
  id v48 = (id)[location[0] objectForKey:@"source"];
  id v47 = (id)[location[0] objectForKey:@"usecase"];
  if (v51 && v50 && v49 && v48 && v47 && v53)
  {
    __int16 v42 = [v55 getEventType:v49];
    if (v42 == 2)
    {
      id v41 = (id)[NSString stringWithFormat:@"Invalid appstore event type."];
      id v40 = &_os_log_internal;
      os_log_type_t v39 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v41);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v40, v39, "%@", v58, 0xCu);
      }
      objc_storeStrong(&v40, 0);
      id v9 = +[AMDError allocError:15 withMessage:v41];
      id *v52 = v9;
      unsigned int v56 = 0;
      int v43 = 1;
      objc_storeStrong(&v41, 0);
    }
    else
    {
      uint64_t v32 = 0;
      v33 = &v32;
      int v34 = 838860800;
      int v35 = 48;
      v36 = __Block_byref_object_copy__7;
      v37 = __Block_byref_object_dispose__7;
      id v38 = 0;
      id v31 = +[AMDCoreDataPersistentContainer sharedContainer];
      id v30 = (id)[v31 getManagedObjectContext];
      id v8 = v30;
      uint64_t v16 = MEMORY[0x263EF8330];
      int v17 = -1073741824;
      int v18 = 0;
      v19 = __44__AMDAppStoreEvent_saveEvent_forUser_error___block_invoke;
      v20 = &unk_263FE22D8;
      id v21 = v30;
      id v22 = v50;
      id v23 = v51;
      __int16 v29 = v42;
      id v24 = v48;
      id v25 = v47;
      id v26 = v53;
      id v27 = v31;
      v28[1] = &v32;
      v28[0] = v49;
      [v8 performBlockAndWait:&v16];
      if (v33[5])
      {
        id v7 = (id) v33[5];
        id *v52 = v7;
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          id v6 = (id)[*v52 localizedDescription];
          id v13 = v6;
          __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v13);
          _os_log_error_impl(&dword_20ABD4000, oslog, v14, "Error saving appstore event: %@", v57, 0xCu);

          objc_storeStrong(&v13, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        unsigned int v56 = 0;
        int v43 = 1;
      }
      else
      {
        unsigned int v56 = 1;
        int v43 = 1;
      }
      objc_storeStrong(v28, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      _Block_object_dispose(&v32, 8);
      objc_storeStrong(&v38, 0);
    }
  }
  else
  {
    id v46 = (id)[NSString stringWithFormat:@"Incomplete AppStore event."];
    id v45 = &_os_log_internal;
    os_log_type_t v44 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v46);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v45, v44, "%@", v59, 0xCu);
    }
    objc_storeStrong(&v45, 0);
    id v10 = +[AMDError allocError:15 withMessage:v46];
    id *v52 = v10;
    unsigned int v56 = 0;
    int v43 = 1;
    objc_storeStrong(&v46, 0);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
  return v56;
}

void __44__AMDAppStoreEvent_saveEvent_forUser_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v10[2] = (id)a1;
  v10[1] = (id)a1;
  v2 = (void *)MEMORY[0x263EFF240];
  id v4 = (id)+[AMDAppStoreEvent entity];
  id v3 = (id)[v4 name];
  v10[0] = (id)objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:");

  objc_msgSend(v10[0], "setEventTimeMillis:", objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue"));
  [v10[0] setAdamId:*(void *)(a1 + 48)];
  [v10[0] setEventType:*(__int16 *)(a1 + 104)];
  [v10[0] setSourceSwoosh:*(void *)(a1 + 56)];
  [v10[0] setUsecase:*(void *)(a1 + 64)];
  [v10[0] setUserId:*(void *)(a1 + 72)];
  v1 = *(void **)(a1 + 80);
  location = (id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  id v9 = *location;
  [v1 save:&v9];
  objc_storeStrong(location, v9);
  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    int v8 = 1;
  }
  else
  {
    id v7 = &_os_log_internal;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, *(void *)(a1 + 88));
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v7, OS_LOG_TYPE_DEBUG, "Saved event of type %@", v11, 0xCu);
    }
    objc_storeStrong(&v7, 0);
    int v8 = 0;
  }
  objc_storeStrong(v10, 0);
}

+ (id)retrieveEventsOfType:(id)a3 inPeriod:(id)a4 forUser:(id)a5 error:(id *)a6
{
  id v41 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = 0;
  objc_storeStrong(&v39, a4);
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  v37 = a6;
  +[AMDPerf startMonitoringEvent:@"ImpressionEventsRetrieval"];
  uint64_t v30 = 0;
  id v31 = &v30;
  int v32 = 838860800;
  int v33 = 48;
  int v34 = __Block_byref_object_copy__7;
  int v35 = __Block_byref_object_dispose__7;
  id v36 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  int v25 = 838860800;
  int v26 = 48;
  id v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  id v9 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v22 = (id)[v9 getManagedObjectContext];

  id v8 = v22;
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  uint64_t v16 = __64__AMDAppStoreEvent_retrieveEventsOfType_inPeriod_forUser_error___block_invoke;
  int v17 = &unk_263FE2300;
  id v18 = v39;
  id v19 = location[0];
  v21[3] = v41;
  v21[1] = &v30;
  id v20 = v38;
  v21[2] = &v23;
  v21[0] = v22;
  [v8 performBlockAndWait:&v13];
  if (v31[5])
  {
    id *v37 = (id) v31[5];
    id v42 = 0;
  }
  else
  {
    +[AMDPerf endMonitoringEvent:@"ImpressionEventsRetrieval"];
    id v42 = (id)v24[5];
  }
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  _Block_object_dispose(&v30, 8);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  id v6 = v42;

  return v6;
}

void __64__AMDAppStoreEvent_retrieveEventsOfType_inPeriod_forUser_error___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v34[2] = (id)a1;
  v34[1] = (id)a1;
  uint64_t v16 = (void *)MEMORY[0x263EFF260];
  id v18 = (id)+[AMDAppStoreEvent entity];
  id v17 = (id)[v18 name];
  v34[0] = (id)objc_msgSend(v16, "fetchRequestWithEntityName:");

  id v19 = (id)[MEMORY[0x263EFF910] date];
  [v19 timeIntervalSince1970];
  unint64_t v20 = (unint64_t)v1;

  unint64_t v33 = v20;
  unint64_t v32 = 0;
  unint64_t v32 = 1000 * (v20 - 86400 * (__int16)[*(id *)(a1 + 32) shortValue]);
  id v31 = 0;
  if (!*(void *)(a1 + 40))
  {
    id v25 = &_os_log_internal;
    char v24 = 1;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
    {
      int v14 = v25;
      os_log_type_t v15 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_20ABD4000, v14, v15, "No appstore event type provided in request", v23, 2u);
    }
    objc_storeStrong(&v25, 0);
    id v7 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"eventTimeMillis >= %ull && userId == %@", v32, *(void *)(a1 + 48)];
    id v8 = v31;
    id v31 = v7;

    goto LABEL_10;
  }
  __int16 v30 = 0;
  __int16 v30 = [*(id *)(a1 + 80) getEventType:*(void *)(a1 + 40)];
  if (v30 != 2)
  {
    id v5 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"eventTimeMillis >= %ull && eventType == %d && userId == %@", v32, v30, *(void *)(a1 + 48)];
    id v6 = v31;
    id v31 = v5;

LABEL_10:
    [v34[0] setResultType:2];
    [v34[0] setPredicate:v31];
    id v9 = *(void **)(a1 + 56);
    uint64_t v12 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v22 = *v12;
    id v13 = (id)[v9 executeFetchRequest:v34[0] error:&v22];
    objc_storeStrong(v12, v22);
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v13;

    int v26 = 0;
    goto LABEL_11;
  }
  id v29 = (id)[NSString stringWithFormat:@"Unknown AppStore event type provided"];
  id location = &_os_log_internal;
  os_log_type_t v27 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v29);
    _os_log_error_impl(&dword_20ABD4000, (os_log_t)location, v27, "%@", v35, 0xCu);
  }
  objc_storeStrong(&location, 0);
  id v2 = +[AMDError allocError:15 withMessage:v29];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  int v26 = 1;
  objc_storeStrong(&v29, 0);
LABEL_11:
  objc_storeStrong(&v31, 0);
  objc_storeStrong(v34, 0);
}

+ (id)deleteEventsOlderThan:(unint64_t)a3 error:(id *)a4
{
  id v14 = a1;
  SEL v13 = a2;
  unint64_t v12 = a3;
  v11 = a4;
  +[AMDPerf startMonitoringEvent:@"ImpressionEventsScrub"];
  id v7 = (id)[MEMORY[0x263EFF910] date];
  [v7 timeIntervalSince1970];
  id v8 = (void *)((v4 - (double)(86400 * v12)) * 1000.0);

  v10[1] = v8;
  v10[0] = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"eventTimeMillis < %llu", v8);
  id location = (id)[v14 deleteEventsForPredicate:v10[0] error:v11];
  if (*v11)
  {
    id v15 = 0;
  }
  else
  {
    +[AMDPerf endMonitoringEvent:@"ImpressionEventsScrub"];
    id v15 = location;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  id v5 = v15;

  return v5;
}

+ (id)deleteEventsForPredicate:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v32 = a4;
  uint64_t v25 = 0;
  int v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  id v29 = __Block_byref_object_copy__7;
  __int16 v30 = __Block_byref_object_dispose__7;
  id v31 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  id v22 = __Block_byref_object_copy__7;
  uint64_t v23 = __Block_byref_object_dispose__7;
  id v24 = 0;
  id v17 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v17 getManagedObjectContext];
  id v6 = v16;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = __51__AMDAppStoreEvent_deleteEventsForPredicate_error___block_invoke;
  unint64_t v12 = &unk_263FE1C58;
  id v13 = location[0];
  id v14 = v16;
  v15[1] = &v25;
  v15[0] = v17;
  v15[2] = &v18;
  [v6 performBlockAndWait:&v8];
  if (v26[5])
  {
    *unint64_t v32 = (id) v26[5];
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
  double v4 = v34;

  return v4;
}

void __51__AMDAppStoreEvent_deleteEventsForPredicate_error___block_invoke(void *a1)
{
  v18[2] = a1;
  v18[1] = a1;
  int v9 = (void *)MEMORY[0x263EFF260];
  id v11 = (id)+[AMDAppStoreEvent entity];
  id v10 = (id)[v11 name];
  v18[0] = (id)objc_msgSend(v9, "fetchRequestWithEntityName:");

  if (a1[4]) {
    [v18[0] setPredicate:a1[4]];
  }
  id v17 = (id)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v18[0]];
  [v17 setResultType:2];
  double v1 = (void *)a1[5];
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
    id v2 = (void *)a1[6];
    id v6 = (id *)(*(void *)(a1[7] + 8) + 40);
    id v13 = *v6;
    [v2 save:&v13];
    objc_storeStrong(v6, v13);
    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      int v14 = 1;
    }
    else
    {
      id v3 = (id)[v16 result];
      uint64_t v4 = *(void *)(a1[8] + 8);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      int v14 = 0;
    }
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

+ (id)deleteEventsForUser:(id)a3 error:(id *)a4
{
  id v10 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8[1] = a4;
  v8[0] = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"userId == %@", location[0]];
  id v7 = (id)[v10 deleteEventsForPredicate:v8[0] error:a4];
  if (*a4) {
    id v11 = 0;
  }
  else {
    id v11 = v7;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
  uint64_t v4 = v11;

  return v4;
}

+ (id)fetchEvents:(id *)a3
{
  id v30 = a1;
  SEL v29 = a2;
  int v28 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  uint64_t v25 = __Block_byref_object_copy__7;
  int v26 = __Block_byref_object_dispose__7;
  id v27 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  uint64_t v18 = __Block_byref_object_copy__7;
  id v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  id v6 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v13 = (id)[v6 getManagedObjectContext];

  id v5 = v13;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __32__AMDAppStoreEvent_fetchEvents___block_invoke;
  id v11 = &unk_263FE1CD0;
  v12[1] = &v14;
  v12[0] = v13;
  v12[2] = &v21;
  [v5 performBlockAndWait:&v7];
  if (v22[5])
  {
    *int v28 = (id) v22[5];
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

void __32__AMDAppStoreEvent_fetchEvents___block_invoke(void *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  uint64_t v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDAppStoreEvent entity];
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

+ (id)deleteAllEvents:(id *)a3
{
  id v8 = a1;
  SEL v7 = a2;
  id v6 = a3;
  id location = (id)[a1 deleteEventsForPredicate:0 error:a3];
  if (*v6) {
    id v9 = 0;
  }
  else {
    id v9 = location;
  }
  objc_storeStrong(&location, 0);
  id v3 = v9;

  return v3;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDAppStoreEvent", a2, a1);
}

@end