@interface AMDAppEvent
+ (BOOL)validateInput:(id)a3;
+ (id)deleteAllEvents:(id *)a3;
+ (id)deleteAllEventsForUser:(id)a3 error:(id *)a4;
+ (id)deleteAppEventsOlderThan:(unint64_t)a3 forEventType:(id)a4 withPlatform:(id)a5 error:(id *)a6;
+ (id)deleteUsingPredicates:(id)a3 error:(id *)a4;
+ (id)fetchEvents:(id *)a3;
+ (id)fetchEventsWithPredicate:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
+ (id)getEventPlatform:(id)a3;
+ (id)getEventSubType:(id)a3;
+ (id)getEventType:(id)a3;
+ (id)getSegmentsWithLookBack:(id)a3 andRecencyThreshold:(id)a4 andFrequencyThreshold:(id)a5 andDurationThreshold:(id)a6 withUserId:(id)a7 error:(id *)a8;
+ (unsigned)saveEvent:(id)a3 error:(id *)a4;
- (void)populateRecord:(id)a3;
@end

@implementation AMDAppEvent

+ (id)getEventType:(id)a3
{
  v16[6] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getEventType__eventTypeMap)
  {
    v15[0] = @"installs";
    id v13 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:1];
    v16[0] = v13;
    v15[1] = @"uninstalls";
    id v12 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:2];
    v16[1] = v12;
    v15[2] = @"launches";
    id v11 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:3];
    v16[2] = v11;
    v15[3] = @"crashes";
    id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:4];
    v16[3] = v10;
    v15[4] = @"subscribe";
    id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:5];
    v16[4] = v9;
    v15[5] = @"inAppPurchase";
    id v8 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:6];
    v16[5] = v8;
    id v3 = (id)[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
    v4 = (void *)getEventType__eventTypeMap;
    getEventType__eventTypeMap = (uint64_t)v3;
  }
  id v7 = (id)objc_msgSend((id)getEventType__eventTypeMap, "objectForKey:", location[0], location);
  objc_storeStrong(v6, 0);

  return v7;
}

+ (id)getEventSubType:(id)a3
{
  v16[6] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getEventSubType__eventSubTypeMap)
  {
    v15[0] = @"unknown";
    id v13 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:0];
    v16[0] = v13;
    v15[1] = @"autodownload";
    id v12 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:1];
    v16[1] = v12;
    v15[2] = @"buy";
    id v11 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:2];
    v16[2] = v11;
    v15[3] = @"redownload";
    id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:3];
    v16[3] = v10;
    v15[4] = @"restore";
    id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:4];
    v16[4] = v9;
    v15[5] = @"update";
    id v8 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:5];
    v16[5] = v8;
    id v3 = (id)[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
    v4 = (void *)getEventSubType__eventSubTypeMap;
    getEventSubType__eventSubTypeMap = (uint64_t)v3;
  }
  id v7 = (id)objc_msgSend((id)getEventSubType__eventSubTypeMap, "objectForKey:", location[0], location);
  objc_storeStrong(v6, 0);

  return v7;
}

+ (id)getEventPlatform:(id)a3
{
  v14[5] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getEventPlatform__platformMap)
  {
    v13[0] = @"iPhone";
    id v11 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:1];
    v14[0] = v11;
    v13[1] = @"iPad";
    id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:2];
    v14[1] = v10;
    v13[2] = @"iPodTouch";
    id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:3];
    v14[2] = v9;
    v13[3] = @"AppleTV";
    id v8 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:4];
    v14[3] = v8;
    v13[4] = @"watchOS";
    id v7 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:5];
    v14[4] = v7;
    id v3 = (id)[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];
    v4 = (void *)getEventPlatform__platformMap;
    getEventPlatform__platformMap = (uint64_t)v3;
  }
  id v6 = (id)[(id)getEventPlatform__platformMap objectForKey:location[0]];
  objc_storeStrong(location, 0);

  return v6;
}

+ (id)fetchEvents:(id *)a3
{
  id v31 = a1;
  SEL v30 = a2;
  v29 = a3;
  id v6 = +[AMDCoreDataPersistentContainer sharedContainer];
  id location = (id)[v6 getManagedObjectContext];

  uint64_t v21 = 0;
  v22 = &v21;
  int v23 = 838860800;
  int v24 = 48;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  id v7 = location;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __27__AMDAppEvent_fetchEvents___block_invoke;
  id v12 = &unk_263FE1CD0;
  v13[1] = &v14;
  v13[0] = location;
  v13[2] = &v21;
  [v7 performBlockAndWait:&v8];
  if (v22[5])
  {
    id v3 = (id) v22[5];
    id *v29 = v3;
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
  v4 = v32;

  return v4;
}

void __27__AMDAppEvent_fetchEvents___block_invoke(void *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDAppEvent entity];
  id v5 = (id)[v6 name];
  v11[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  [v11[0] setResultType:2];
  v1 = (void *)a1[4];
  id location = (id *)(*(void *)(a1[6] + 8) + 40);
  id v10 = *location;
  id v9 = (id)[v1 executeFetchRequest:v11[0] error:&v10];
  objc_storeStrong(location, v10);
  uint64_t v2 = *(void *)(a1[5] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v9;

  objc_storeStrong(v11, 0);
}

+ (BOOL)validateInput:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v44 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v46 count:16];
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
      id v42 = *(id *)(__b[1] + 8 * v10);
      id v7 = (id)[v42 objectForKey:@"itemId"];
      char v39 = 0;
      char v37 = 0;
      char v35 = 0;
      char v33 = 0;
      char v31 = 0;
      char v29 = 0;
      char v27 = 0;
      char v25 = 0;
      char v23 = 0;
      char v21 = 0;
      char v19 = 0;
      char v17 = 0;
      char v15 = 0;
      if (v7
        || (id v40 = (id)[v42 objectForKey:@"adamId"],
            char v39 = 1,
            char v6 = 1,
            v40))
      {
        id v38 = (id)[v42 objectForKey:@"shortAppVersion"];
        char v37 = 1;
        if (v38
          || (id v36 = (id)[v42 objectForKey:@"appVersion"],
              char v35 = 1,
              char v6 = 1,
              v36))
        {
          id v34 = (id)[v42 valueForKey:@"eventTime"];
          char v33 = 1;
          if (v34
            || (id v32 = (id)[v42 objectForKey:@"time"],
                char v31 = 1,
                char v6 = 1,
                v32))
          {
            id v5 = v44;
            id v30 = (id)[v42 objectForKey:@"eventType"];
            char v29 = 1;
            id v28 = (id)objc_msgSend(v5, "getEventType:");
            char v27 = 1;
            if (v28
              || (id v26 = (id)[v42 objectForKey:@"type"],
                  char v25 = 1,
                  char v6 = 1,
                  v26))
            {
              v4 = v44;
              id v24 = (id)[v42 valueForKey:@"platform"];
              char v23 = 1;
              id v22 = (id)objc_msgSend(v4, "getEventPlatform:");
              char v21 = 1;
              if (v22
                || (id v20 = (id)[v42 objectForKey:@"platform"],
                    char v19 = 1,
                    objc_opt_class(),
                    char v6 = 1,
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v18 = (id)[v42 valueForKey:@"userId"];
                char v17 = 1;
                char v6 = 1;
                if (v18)
                {
                  id v16 = (id)[v42 valueForKey:@"userId"];
                  char v15 = 1;
                  char v6 = [v16 isEqualToString:&stru_26BEAC9D8];
                }
              }
            }
          }
        }
      }
      if (v15) {

      }
      if (v17) {
      if (v19)
      }

      if (v21) {
      if (v23)
      }

      if (v25) {
      if (v27)
      }

      if (v29) {
      if (v31)
      }

      if (v33) {
      if (v35)
      }

      if (v37) {
      if (v39)
      }

      if (v6) {
        break;
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v46 count:16];
        if (!v11) {
          goto LABEL_47;
        }
      }
    }
    char v45 = 0;
    int v14 = 1;
  }
  else
  {
LABEL_47:
    int v14 = 0;
  }

  if (!v14) {
    char v45 = 1;
  }
  objc_storeStrong(location, 0);
  return v45 & 1;
}

+ (unsigned)saveEvent:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = a4;
  uint64_t v10 = v22;
  v27[0] = location[0];
  id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  char v12 = objc_msgSend(v10, "validateInput:");

  if (v12)
  {
    id v8 = (id)+[AMDAppEvent entity];
    id v15 = (id)[v8 name];

    if (v15)
    {
      id v24 = location[0];
      id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      unsigned int v23 = +[AMDStorage saveRecords:inTable:error:](AMDStorage, "saveRecords:inTable:error:");

      int v16 = 1;
    }
    else
    {
      int v14 = @"AMDAppEvent: Internal error: Table name is nil! MOC not loaded?";
      os_log_t oslog = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v14);
        _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "%@", v25, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v5 = +[AMDError allocError:29 withMessage:v14];
      *id v20 = v5;
      unsigned int v23 = 0;
      int v16 = 1;
      objc_storeStrong((id *)&v14, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  else
  {
    char v19 = @"One or more app events is invalid";
    id v18 = &_os_log_internal;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v19);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v18, v17, "%@", v26, 0xCu);
    }
    objc_storeStrong(&v18, 0);
    id v4 = +[AMDError allocError:15 withMessage:v19];
    *id v20 = v4;
    unsigned int v23 = 0;
    int v16 = 1;
    objc_storeStrong((id *)&v19, 0);
  }
  objc_storeStrong(location, 0);
  return v23;
}

+ (id)deleteAllEvents:(id *)a3
{
  return (id)[a1 deleteUsingPredicates:MEMORY[0x263EFFA68] error:a3];
}

+ (id)deleteAllEventsForUser:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10[1] = a4;
  v10[0] = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"userId == %@", location[0]];
  char v6 = v12;
  v13[0] = v10[0];
  id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v9 = (id)objc_msgSend(v6, "deleteUsingPredicates:error:");

  id v8 = v9;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);

  return v8;
}

+ (id)deleteAppEventsOlderThan:(unint64_t)a3 forEventType:(id)a4 withPlatform:(id)a5 error:(id *)a6
{
  id v26 = a1;
  SEL v25 = a2;
  unint64_t v24 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  char v21 = a6;
  id v20 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  id v17 = (id)[MEMORY[0x263EFF910] date];
  [v17 timeIntervalSince1970];
  unint64_t v18 = (unint64_t)((v6 - (double)(86400 * v24)) * 1000.0);

  id v19 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"time < %llu", v18);
  objc_msgSend(v20, "addObject:");

  if (location)
  {
    id v12 = (void *)MEMORY[0x263F08A98];
    id v14 = (id)[v26 getEventType:location];
    id v13 = (id)objc_msgSend(v12, "predicateWithFormat:", @"type == %d", (__int16)objc_msgSend(v14, "shortValue"));
    objc_msgSend(v20, "addObject:");
  }
  if (v22)
  {
    id v9 = (void *)MEMORY[0x263F08A98];
    id v11 = (id)[v26 getEventType:location];
    id v10 = (id)objc_msgSend(v9, "predicateWithFormat:", @"platform == %d", (__int16)objc_msgSend(v11, "shortValue"));
    objc_msgSend(v20, "addObject:");
  }
  id v8 = (id)[v26 deleteUsingPredicates:v20 error:v21];
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);

  return v8;
}

+ (id)deleteUsingPredicates:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = a4;
  +[AMDPerf startMonitoringEvent:@"DeleteEvents"];
  uint64_t v25 = 0;
  id v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  char v29 = __Block_byref_object_copy__5;
  id v30 = __Block_byref_object_dispose__5;
  id v31 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  int v20 = 838860800;
  int v21 = 48;
  id v22 = __Block_byref_object_copy__5;
  unsigned int v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  id v17 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v16 = (id)[v17 getManagedObjectContext];
  id v6 = v16;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __43__AMDAppEvent_deleteUsingPredicates_error___block_invoke;
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
    +[AMDPerf endMonitoringEvent:@"DeleteEvents"];
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

void __43__AMDAppEvent_deleteUsingPredicates_error___block_invoke(void *a1)
{
  v19[2] = a1;
  v19[1] = a1;
  id v7 = (void *)MEMORY[0x263EFF260];
  id v9 = (id)+[AMDAppEvent entity];
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

+ (id)getSegmentsWithLookBack:(id)a3 andRecencyThreshold:(id)a4 andFrequencyThreshold:(id)a5 andDurationThreshold:(id)a6 withUserId:(id)a7 error:(id *)a8
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *((void *)&v76 + 1) = 0;
  objc_storeStrong((id *)&v76 + 1, a4);
  *(void *)&long long v76 = 0;
  objc_storeStrong((id *)&v76, a5);
  id v75 = 0;
  objc_storeStrong(&v75, a6);
  id v74 = 0;
  objc_storeStrong(&v74, a7);
  v73 = a8;
  if (v76 != 0 || v75)
  {
    uint64_t v65 = 0;
    v66 = &v65;
    int v67 = 838860800;
    int v68 = 48;
    v69 = __Block_byref_object_copy__5;
    v70 = __Block_byref_object_dispose__5;
    id v71 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    int v60 = 838860800;
    int v61 = 48;
    v62 = __Block_byref_object_copy__5;
    v63 = __Block_byref_object_dispose__5;
    id v64 = 0;
    id v29 = +[AMDCoreDataPersistentContainer sharedContainer];
    id v57 = (id)[v29 getManagedObjectContext];

    id v28 = v57;
    uint64_t v49 = MEMORY[0x263EF8330];
    int v50 = -1073741824;
    int v51 = 0;
    v52 = __119__AMDAppEvent_getSegmentsWithLookBack_andRecencyThreshold_andFrequencyThreshold_andDurationThreshold_withUserId_error___block_invoke;
    v53 = &unk_263FE1C58;
    id v54 = location[0];
    id v55 = v74;
    v56[1] = &v58;
    v56[0] = v57;
    v56[2] = &v65;
    [v28 performBlockAndWait:&v49];
    if (v66[5])
    {
      id *v73 = (id) v66[5];
      id v78 = 0;
      int v72 = 1;
    }
    else if (v59[5])
    {
      unint64_t v45 = 0;
      id v27 = (id)[MEMORY[0x263EFF910] date];
      [v27 timeIntervalSince1970];
      unint64_t v26 = (unint64_t)v8;

      unint64_t v45 = v26;
      id v44 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      memset(__b, 0, sizeof(__b));
      id v24 = (id)v59[5];
      uint64_t v25 = [v24 countByEnumeratingWithState:__b objects:v80 count:16];
      if (v25)
      {
        uint64_t v21 = *(void *)__b[2];
        uint64_t v22 = 0;
        unint64_t v23 = v25;
        while (1)
        {
          uint64_t v20 = v22;
          if (*(void *)__b[2] != v21) {
            objc_enumerationMutation(v24);
          }
          id v43 = *(id *)(__b[1] + 8 * v22);
          id v41 = @"1";
          char v39 = 0;
          char v37 = 0;
          char v35 = 0;
          if (!*((void *)&v76 + 1)
            || (v40 = (id)[v43 objectForKey:@"mostRecentLaunchTimeMillis"], v39 = 1, v18 = objc_msgSend(v40, "unsignedLongLongValue") / 0x3E8uLL, v19 = v45, char v17 = 1, v18 >= v19 - objc_msgSend(*((id *)&v76 + 1), "unsignedLongLongValue")))
          {
            if (!(void)v76
              || (id v38 = (id)[v43 objectForKey:@"launchCount"],
                  char v37 = 1,
                  unsigned int v16 = [v38 unsignedIntValue],
                  char v17 = 1,
                  v16 >= [(id)v76 unsignedIntValue]))
            {
              BOOL v15 = 0;
              if (v75)
              {
                id v36 = (id)[v43 objectForKey:@"totalForegroundDuration"];
                char v35 = 1;
                unsigned int v14 = [v36 unsignedIntValue];
                BOOL v15 = v14 < [v75 unsignedIntValue];
              }
              char v17 = v15;
            }
          }
          if (v35) {

          }
          if (v37) {
          if (v39)
          }

          if (v17) {
            objc_storeStrong(&v41, @"2");
          }
          id v13 = v44;
          id v79 = v41;
          id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
          id v11 = (id)[v43 objectForKey:@"adamId"];
          objc_msgSend(v13, "setObject:forKey:", v12);

          objc_storeStrong(&v41, 0);
          ++v22;
          if (v20 + 1 >= v23)
          {
            uint64_t v22 = 0;
            unint64_t v23 = [v24 countByEnumeratingWithState:__b objects:v80 count:16];
            if (!v23) {
              break;
            }
          }
        }
      }

      id v78 = v44;
      int v72 = 1;
      objc_storeStrong(&v44, 0);
    }
    else
    {
      id v48 = (id)[NSString stringWithFormat:@"Nil Response from CoreData request during segment computation."];
      id v47 = &_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v81, (uint64_t)v48);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v47, type, "%@", v81, 0xCu);
      }
      objc_storeStrong(&v47, 0);
      id *v73 = +[AMDError allocError:15 withMessage:v48];
      id v78 = 0;
      int v72 = 1;
      objc_storeStrong(&v48, 0);
    }
    objc_storeStrong(v56, 0);
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v57, 0);
    _Block_object_dispose(&v58, 8);
    objc_storeStrong(&v64, 0);
    _Block_object_dispose(&v65, 8);
    objc_storeStrong(&v71, 0);
  }
  else
  {
    id *v73 = +[AMDError allocError:16 withMessage:@"programmer error!"];
    id v78 = 0;
    int v72 = 1;
  }
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong((id *)&v76, 0);
  objc_storeStrong((id *)&v76 + 1, 0);
  objc_storeStrong(location, 0);
  id v9 = v78;

  return v9;
}

void __119__AMDAppEvent_getSegmentsWithLookBack_andRecencyThreshold_andFrequencyThreshold_andDurationThreshold_withUserId_error___block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x263EF8340];
  v33[2] = (id)a1;
  v33[1] = (id)a1;
  id v5 = (void *)MEMORY[0x263EFF260];
  id v7 = (id)+[AMDAppEvent entity];
  id v6 = (id)[v7 name];
  v33[0] = (id)objc_msgSend(v5, "fetchRequestWithEntityName:");

  [v33[0] setResultType:2];
  id v32 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  [v32 addObject:@"adamId"];
  double v8 = (void *)MEMORY[0x263F087F0];
  id v10 = (id)[MEMORY[0x263F087F0] expressionForKeyPath:@"time"];
  v36[0] = v10;
  id v9 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v36);
  id v31 = (id)objc_msgSend(v8, "expressionForFunction:arguments:", @"max:");

  id v30 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v30 setName:@"mostRecentLaunchTimeMillis"];
  [v30 setExpression:v31];
  objc_msgSend(v30, "setExpressionResultType:");
  [v32 addObject:v30];
  id v11 = (void *)MEMORY[0x263F087F0];
  id v13 = (id)objc_msgSend(MEMORY[0x263F087F0], "expressionForKeyPath:");
  id v35 = v13;
  id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  id v29 = (id)objc_msgSend(v11, "expressionForFunction:arguments:", @"count:");

  id v28 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v28 setName:@"launchCount"];
  [v28 setExpression:v29];
  [v28 setExpressionResultType:200];
  [v32 addObject:v28];
  unsigned int v14 = (void *)MEMORY[0x263F087F0];
  id v16 = (id)[MEMORY[0x263F087F0] expressionForKeyPath:@"foregroundDuration"];
  id v34 = v16;
  id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  id v27 = (id)objc_msgSend(v14, "expressionForFunction:arguments:", @"sum:");

  id v26 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v26 setName:@"totalForegroundDuration"];
  [v26 setExpression:v27];
  [v26 setExpressionResultType:300];
  [v32 addObject:v26];
  [v33[0] setPropertiesToFetch:v32];
  id v17 = (id)[MEMORY[0x263EFF910] date];
  [v17 timeIntervalSince1970];
  unint64_t v18 = (unint64_t)v1;

  unint64_t v25 = v18;
  unint64_t v24 = 0;
  unint64_t v24 = 1000 * (v18 - 86400 * [*(id *)(a1 + 32) unsignedIntValue]);
  id v23 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"time >= %ull && type == %d && userId == %@", v24, 3, *(void *)(a1 + 40)];
  [v33[0] setPredicate:v23];
  [v33[0] setPropertiesToGroupBy:&unk_26BEC3468];
  uint64_t v2 = *(void **)(a1 + 48);
  id location = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v22 = *location;
  id v21 = (id)[v2 executeFetchRequest:v33[0] error:&v22];
  objc_storeStrong(location, v22);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v21;

  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v33, 0);
}

- (void)populateRecord:(id)a3
{
  int v72 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v55 = (id)[location[0] objectForKey:@"itemId"];
  char v68 = 0;
  char v66 = 0;
  if (v55)
  {
    id v69 = (id)[location[0] objectForKey:@"itemId"];
    char v68 = 1;
    id v3 = v69;
  }
  else
  {
    id v67 = (id)[location[0] objectForKey:@"adamId"];
    char v66 = 1;
    id v3 = v67;
  }
  id v70 = v3;
  if (v66) {

  }
  if (v68) {
  id v54 = (id)[location[0] objectForKey:@"shortAppVersion"];
  }
  char v63 = 0;
  char v61 = 0;
  if (v54)
  {
    id v64 = (id)[location[0] objectForKey:@"shortAppVersion"];
    char v63 = 1;
    id v4 = v64;
  }
  else
  {
    id v62 = (id)[location[0] objectForKey:@"appVersion"];
    char v61 = 1;
    id v4 = v62;
  }
  id v65 = v4;
  if (v61) {

  }
  if (v63) {
  id v53 = (id)[location[0] valueForKey:@"eventTime"];
  }
  char v58 = 0;
  char v56 = 0;
  if (v53)
  {
    id v59 = (id)[location[0] valueForKey:@"eventTime"];
    char v58 = 1;
    id v5 = v59;
  }
  else
  {
    id v57 = (id)[location[0] valueForKey:@"time"];
    char v56 = 1;
    id v5 = v57;
  }
  id v60 = v5;
  if (v56) {

  }
  if (v58) {
  -[AMDAppEvent setAdamId:](v72, "setAdamId:", [v70 unsignedLongLongValue]);
  }
  [(AMDAppEvent *)v72 setAppVersion:v65];
  -[AMDAppEvent setTime:](v72, "setTime:", [v60 unsignedLongLongValue]);
  id v52 = (id)[location[0] objectForKey:@"eventType"];

  if (v52)
  {
    uint64_t v49 = v72;
    id v51 = (id)[location[0] objectForKey:@"eventType"];
    id v50 = +[AMDAppEvent getEventType:](AMDAppEvent, "getEventType:");
    -[AMDAppEvent setType:](v49, "setType:", (__int16)[v50 unsignedShortValue]);
  }
  else
  {
    id v47 = v72;
    id v48 = (id)[location[0] objectForKey:@"type"];
    -[AMDAppEvent setType:](v47, "setType:", (__int16)[v48 unsignedShortValue]);
  }
  id v45 = (id)[location[0] valueForKey:@"platform"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v43 = v72;
    id v44 = (id)[location[0] valueForKey:@"platform"];
    -[AMDAppEvent setPlatform:](v43, "setPlatform:", (__int16)[v44 unsignedShortValue]);
  }
  else
  {
    id v40 = v72;
    id v42 = (id)[location[0] valueForKey:@"platform"];
    id v41 = +[AMDAppEvent getEventPlatform:](AMDAppEvent, "getEventPlatform:");
    -[AMDAppEvent setPlatform:](v40, "setPlatform:", (__int16)[v41 unsignedShortValue]);
  }
  id v39 = (id)[location[0] valueForKey:@"eventSubtype"];

  if (v39)
  {
    id v37 = (id)[location[0] valueForKey:@"eventSubtype"];
    objc_opt_class();
    char v38 = objc_opt_isKindOfClass();

    if (v38)
    {
      id v34 = v72;
      id v36 = (id)[location[0] valueForKey:@"eventSubtype"];
      id v35 = +[AMDAppEvent getEventSubType:](AMDAppEvent, "getEventSubType:");
      -[AMDAppEvent setEventSubType:](v34, "setEventSubType:", (__int16)[v35 intValue]);
    }
    else
    {
      id v32 = v72;
      id v33 = (id)[location[0] valueForKey:@"eventSubtype"];
      -[AMDAppEvent setEventSubType:](v32, "setEventSubType:", (__int16)[v33 intValue]);
    }
  }
  id v29 = v72;
  id v30 = (id)[location[0] valueForKey:@"userId"];
  -[AMDAppEvent setUserId:](v29, "setUserId:");

  id v31 = (id)[location[0] objectForKey:@"batteryUsage"];
  if (v31)
  {
    id v27 = v72;
    id v28 = (id)[location[0] objectForKey:@"batteryUsage"];
    [v28 floatValue];
    -[AMDAppEvent setBatteryUsage:](v27, "setBatteryUsage:");
  }
  id v26 = (id)[location[0] valueForKey:@"foregroundDuration"];

  if (v26)
  {
    unint64_t v24 = v72;
    id v25 = (id)[location[0] valueForKey:@"foregroundDuration"];
    -[AMDAppEvent setForegroundDuration:](v24, "setForegroundDuration:", [v25 unsignedLongLongValue]);
  }
  id v23 = (id)[location[0] valueForKey:@"latitude"];

  if (v23)
  {
    id v21 = v72;
    id v22 = (id)[location[0] valueForKey:@"latitude"];
    [v22 floatValue];
    -[AMDAppEvent setLatitude:](v21, "setLatitude:");
  }
  id v20 = (id)[location[0] valueForKey:@"locationAccuracy"];

  if (v20)
  {
    unint64_t v18 = v72;
    id v19 = (id)[location[0] valueForKey:@"locationAccuracy"];
    [v19 floatValue];
    -[AMDAppEvent setLocationAccuracy:](v18, "setLocationAccuracy:");
  }
  id v17 = (id)[location[0] valueForKey:@"longitude"];

  if (v17)
  {
    id v15 = v72;
    id v16 = (id)[location[0] valueForKey:@"longitude"];
    [v16 floatValue];
    -[AMDAppEvent setLongitude:](v15, "setLongitude:");
  }
  id v14 = (id)[location[0] valueForKey:@"storageUsed"];

  if (v14)
  {
    id v12 = v72;
    id v13 = (id)[location[0] valueForKey:@"storageUsed"];
    -[AMDAppEvent setStorageUsed:](v12, "setStorageUsed:", (int)[v13 intValue]);
  }
  id v11 = (id)[location[0] valueForKey:@"timezoneOffset"];

  if (v11)
  {
    id v9 = v72;
    id v10 = (id)[location[0] valueForKey:@"timezoneOffset"];
    -[AMDAppEvent setTimeZoneOffset:](v9, "setTimeZoneOffset:", [v10 unsignedLongLongValue]);
  }
  id v8 = (id)[location[0] valueForKey:@"deviceId"];

  if (v8)
  {
    id v6 = v72;
    id v7 = (id)[location[0] objectForKey:@"deviceId"];
    -[AMDAppEvent setDeviceId:](v6, "setDeviceId:");
  }
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(location, 0);
}

+ (id)fetchEventsWithPredicate:(id)a3 error:(id *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = a4;
  id v8 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v31 = (id)[v8 getManagedObjectContext];

  uint64_t v24 = 0;
  id v25 = &v24;
  int v26 = 838860800;
  int v27 = 48;
  id v28 = __Block_byref_object_copy__5;
  id v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  id v21 = __Block_byref_object_copy__5;
  id v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  id v9 = v31;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __46__AMDAppEvent_fetchEventsWithPredicate_error___block_invoke;
  id v14 = &unk_263FE1CA8;
  id v15 = location[0];
  v16[1] = &v17;
  v16[0] = v31;
  v16[2] = &v24;
  [v9 performBlockAndWait:&v10];
  if (v25[5])
  {
    id v4 = (id) v25[5];
    *id v32 = v4;
    id v34 = 0;
  }
  else
  {
    id v34 = (id)v18[5];
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v15, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  id v5 = v34;

  return v5;
}

void __46__AMDAppEvent_fetchEventsWithPredicate_error___block_invoke(void *a1)
{
  void v13[2] = a1;
  v13[1] = a1;
  id v4 = (void *)MEMORY[0x263EFF260];
  id v6 = (id)+[AMDAppEvent entity];
  id v5 = (id)[v6 name];
  v13[0] = (id)objc_msgSend(v4, "fetchRequestWithEntityName:");

  id v7 = v13[0];
  id v8 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:a1[4]];
  objc_msgSend(v7, "setPredicate:");

  [v13[0] setResultType:2];
  double v1 = (void *)a1[5];
  id location = (id *)(*(void *)(a1[7] + 8) + 40);
  id v12 = *location;
  id v11 = (id)[v1 executeFetchRequest:v13[0] error:&v12];
  objc_storeStrong(location, v12);
  uint64_t v2 = *(void *)(a1[6] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v11;

  objc_storeStrong(v13, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:", @"AMDAppEvent", a2, a1);
}

@end