@interface IRReplayDatabaseHandler
+ (id)exportDatabaseToPath:(id)a3;
- (IRReplayDatabaseHandler)initWithPeristenceManager:(id)a3;
- (IRReplayDatabaseHandler)initWithStoreDirectory:(id)a3;
- (id)deviceAttributesFromCandidateIdentifier:(id)a3 withServiceIdentifier:(id)a4;
- (id)deviceAttributesSetFromCandidateIdentifier:(id)a3 withServiceIdentifier:(id)a4;
- (id)getAllServices;
- (id)getEventsForServiceIdentifier:(id)a3;
- (id)getSortedEventsForServiceIdentifier:(id)a3;
- (id)getSortedHistoryEventsForServiceIdentifier:(id)a3;
- (id)inspectEventByDate:(id)a3 andServiceIdentifier:(id)a4 historyEvents:(id)a5;
- (void)getAllServices;
@end

@implementation IRReplayDatabaseHandler

- (IRReplayDatabaseHandler)initWithStoreDirectory:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IRReplayDatabaseHandler;
  v5 = [(IRReplayDatabaseHandler *)&v14 init];
  if (!v5) {
    goto LABEL_3;
  }
  v6 = [IRPersistenceManager alloc];
  v7 = +[IRPersistenceManager defaultModelsDirectory];
  uint64_t v8 = [(IRPersistenceManager *)v6 initWithModelsDirectory:v7 storesDirectory:v4];
  persistanceManager = v5->_persistanceManager;
  v5->_persistanceManager = (IRPersistenceManager *)v8;

  if (![(IRPersistenceManager *)v5->_persistanceManager connectToStore])
  {
    v11 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_DEFAULT, "#appDBHandler, Could not connect to store", v13, 2u);
    }
    v10 = 0;
  }
  else
  {
LABEL_3:
    v10 = v5;
  }

  return v10;
}

- (IRReplayDatabaseHandler)initWithPeristenceManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IRReplayDatabaseHandler;
  v6 = [(IRReplayDatabaseHandler *)&v12 init];
  p_isa = (id *)&v6->super.isa;
  if (v6 && (objc_storeStrong((id *)&v6->_persistanceManager, a3), ([p_isa[1] connectToStore] & 1) == 0))
  {
    v9 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_DEFAULT, "#appDBHandler, Could not connect to store", v11, 2u);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = p_isa;
  }

  return v8;
}

+ (id)exportDatabaseToPath:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__12;
  v31 = __Block_byref_object_dispose__12;
  id v32 = [NSNumber numberWithBool:1];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  v25 = __Block_byref_object_dispose__12;
  id v26 = 0;
  id v5 = (void *)MEMORY[0x263F50108];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke;
  v16 = &unk_2653A0F80;
  v6 = v4;
  v17 = v6;
  v19 = &v27;
  id v7 = v3;
  id v18 = v7;
  v20 = &v21;
  [v5 databaseExportwithReply:&v13];
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v6, v8);
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", 0, v13, v14, v15, v16);
  v10 = (void *)v28[5];
  v28[5] = v9;

  id v11 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v11;
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v48[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_6((uint64_t)v6, v7);
    }
LABEL_4:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_34;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) BOOLValue])
  {
    if (!v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
        __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_1();
      }
      goto LABEL_4;
    }
    uint64_t v47 = *MEMORY[0x263F08078];
    v48[0] = &unk_2703AF320;
    dispatch_time_t v8 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    char v10 = [v9 fileExistsAtPath:*(void *)(a1 + 40)];

    if (v10)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
        __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_3();
      }
    }
    else
    {
      id v11 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v12 = *(void *)(a1 + 40);
      id v45 = 0;
      char v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:v8 error:&v45];
      id v14 = v45;

      if ((v13 & 1) == 0)
      {
        v36 = *MEMORY[0x263F50090];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
          __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_4((uint64_t)v14, v36);
        }
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

LABEL_33:
        goto LABEL_34;
      }
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v38 = v5;
    id obj = v5;
    uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      v37 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v20 = [MEMORY[0x263F08850] defaultManager];
          uint64_t v21 = [v19 path];
          char v22 = [v20 fileExistsAtPath:v21];

          if ((v22 & 1) == 0)
          {
            v35 = (void *)*MEMORY[0x263F50090];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
              __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_2(v35, v19);
            }
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

            id v6 = 0;
            id v5 = v38;
            dispatch_time_t v8 = v37;
            goto LABEL_33;
          }
          uint64_t v23 = NSURL;
          v24 = NSString;
          uint64_t v25 = *(void *)(a1 + 40);
          id v26 = [v19 lastPathComponent];
          uint64_t v27 = [v24 stringWithFormat:@"%@/%@", v25, v26];
          v28 = [v23 fileURLWithPath:v27 isDirectory:0];

          uint64_t v29 = [MEMORY[0x263F08850] defaultManager];
          [v29 copyItemAtURL:v19 toURL:v28 error:0];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
        dispatch_time_t v8 = v37;
        if (v16) {
          continue;
        }
        break;
      }
    }

    v30 = [obj firstObject];
    uint64_t v31 = [v30 URLByDeletingLastPathComponent];
    uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
    v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

    v34 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25418E000, v34, OS_LOG_TYPE_DEFAULT, "#appDBHandler, database export reply finished", buf, 2u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v6 = 0;
    id v5 = v38;
    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
    __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_5();
  }
LABEL_34:
}

- (id)getAllServices
{
  v2 = +[IRServiceStore fetchAllServicesWithPersistenceManager:self->_persistanceManager];
  if (v2)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3032000000;
    uint64_t v9 = __Block_byref_object_copy__12;
    char v10 = __Block_byref_object_dispose__12;
    id v11 = (id)objc_opt_new();
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __41__IRReplayDatabaseHandler_getAllServices__block_invoke;
    v5[3] = &unk_2653A0FA8;
    v5[4] = &v6;
    [v2 enumerateObjectsUsingBlock:v5];
    id v3 = (void *)[(id)v7[5] copy];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRReplayDatabaseHandler getAllServices]();
    }
    id v3 = 0;
  }

  return v3;
}

void __41__IRReplayDatabaseHandler_getAllServices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 clientIdentifier];
  dispatch_semaphore_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = [v3 serviceIdentifier];

  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (id)getSortedEventsForServiceIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[IRServiceStore alloc] initWithPersistenceManager:self->_persistanceManager serviceIdentifier:v4];

  id v6 = [(IRServiceStore *)v5 fetchReplayEventsContainer];
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
    uint64_t v8 = [v6 replayEvents];
    v12[0] = v7;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    char v10 = [v8 sortedArrayUsingDescriptors:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)getEventsForServiceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[IRServiceStore alloc] initWithPersistenceManager:self->_persistanceManager serviceIdentifier:v4];

  id v6 = [(IRServiceStore *)v5 getReplayEventDescriptors];

  return v6;
}

- (id)getSortedHistoryEventsForServiceIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[IRServiceStore alloc] initWithPersistenceManager:self->_persistanceManager serviceIdentifier:v4];

  id v6 = +[IRPreferences shared];
  id v7 = [v6 numberOfEventsToSaveInDisk];
  uint64_t v8 = -[IRServiceStore fetchHistoryEventsContainerWithLimit:](v5, "fetchHistoryEventsContainerWithLimit:", [v7 unsignedIntValue]);

  if (v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
    char v10 = [v8 historyEvents];
    v14[0] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    uint64_t v12 = [v10 sortedArrayUsingDescriptors:v11];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRReplayDatabaseHandler getSortedHistoryEventsForServiceIdentifier:]();
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)inspectEventByDate:(id)a3 andServiceIdentifier:(id)a4 historyEvents:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [[IRServiceStore alloc] initWithPersistenceManager:self->_persistanceManager serviceIdentifier:v10];

  uint64_t v12 = [(IRServiceStore *)v11 fetchReplayEventAtDate:v8];
  if (v12)
  {
    char v13 = [(IRServiceStore *)v11 fetchService];
    if (v13)
    {
      uint64_t v27 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K<=%@", @"date", v8];
      id v14 = [v9 filteredArrayUsingPredicate:v27];
      uint64_t v15 = +[IRPreferences shared];
      uint64_t v16 = [v15 numberOfHistoryEventsInCache];
      unint64_t v17 = [v16 unsignedIntValue];

      unint64_t v18 = [v14 count];
      uint64_t v19 = (v18 - v17) & ~((uint64_t)(v18 - v17) >> 63);
      if (v18 >= v17) {
        unint64_t v20 = v17;
      }
      else {
        unint64_t v20 = v18;
      }
      uint64_t v21 = [IRHistoryEventsContainerDO alloc];
      char v22 = objc_msgSend(v14, "subarrayWithRange:", v19, v20);
      uint64_t v23 = [(IRHistoryEventsContainerDO *)v21 initWithHistoryEvents:v22];

      v24 = -[IRReplayEventRunner initWithServicePackage:]([IRReplayEventRunner alloc], "initWithServicePackage:", [v13 servicePackage]);
      [(IRReplayEventRunner *)v24 runSingleReplayEvent:v12 withHistoryEventsContainer:v23];
      uint64_t v25 = [(IRReplayEventRunner *)v24 contextsInspection];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
        -[IRReplayDatabaseHandler inspectEventByDate:andServiceIdentifier:historyEvents:]();
      }
      uint64_t v25 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRReplayDatabaseHandler inspectEventByDate:andServiceIdentifier:historyEvents:]();
    }
    uint64_t v25 = 0;
  }

  return v25;
}

- (id)deviceAttributesFromCandidateIdentifier:(id)a3 withServiceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__12;
  char v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  id v8 = [[IRServiceStore alloc] initWithPersistenceManager:self->_persistanceManager serviceIdentifier:v7];
  id v9 = [(IRServiceStore *)v8 fetchCandidatesContainer];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 candidates];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __89__IRReplayDatabaseHandler_deviceAttributesFromCandidateIdentifier_withServiceIdentifier___block_invoke;
    v14[3] = &unk_2653A0FD0;
    id v15 = v6;
    uint64_t v16 = &v18;
    [v11 enumerateObjectsUsingBlock:v14];

    id v12 = (id)v19[5];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25418E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "error in fetchCandidatesContainer", buf, 2u);
    }
    id v12 = (id)v19[5];
  }

  _Block_object_dispose(&v18, 8);

  return v12;
}

void __89__IRReplayDatabaseHandler_deviceAttributesFromCandidateIdentifier_withServiceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v3 = [v19 candidateIdentifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  id v5 = v19;
  if (v4)
  {
    id v6 = [v19 nodes];
    id v7 = [v6 anyObject];

    id v8 = [v7 avOutputDevice];

    if (v8)
    {
      id v9 = objc_opt_new();
      id v10 = [v7 avOutputDevice];
      id v11 = [v10 deviceID];
      [v9 setDeviceId:v11];

      id v12 = [v7 avOutputDevice];
      char v13 = [v12 deviceName];
      [v9 setDeviceName:v13];
    }
    else
    {
      id v14 = [v7 rapportDevice];

      if (!v14)
      {
LABEL_7:

        id v5 = v19;
        goto LABEL_8;
      }
      id v9 = objc_opt_new();
      id v15 = [v7 rapportDevice];
      uint64_t v16 = [v15 name];
      [v9 setDeviceName:v16];

      id v12 = [v7 rapportDevice];
      char v13 = [v12 rapportEffectiveID];
      [v9 setDeviceId:v13];
    }

    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v9;

    goto LABEL_7;
  }
LABEL_8:
}

- (id)deviceAttributesSetFromCandidateIdentifier:(id)a3 withServiceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__12;
  uint64_t v21 = __Block_byref_object_dispose__12;
  id v22 = (id)objc_opt_new();
  id v8 = [[IRServiceStore alloc] initWithPersistenceManager:self->_persistanceManager serviceIdentifier:v7];
  id v9 = [(IRServiceStore *)v8 fetchCandidatesContainer];
  id v10 = [v9 candidates];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __92__IRReplayDatabaseHandler_deviceAttributesSetFromCandidateIdentifier_withServiceIdentifier___block_invoke;
  v14[3] = &unk_2653A0FD0;
  id v11 = v6;
  id v15 = v11;
  uint64_t v16 = &v17;
  [v10 enumerateObjectsUsingBlock:v14];

  id v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __92__IRReplayDatabaseHandler_deviceAttributesSetFromCandidateIdentifier_withServiceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 candidateIdentifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = [v3 nodes];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __92__IRReplayDatabaseHandler_deviceAttributesSetFromCandidateIdentifier_withServiceIdentifier___block_invoke_2;
    v7[3] = &unk_2653A0B38;
    v7[4] = *(void *)(a1 + 40);
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

void __92__IRReplayDatabaseHandler_deviceAttributesSetFromCandidateIdentifier_withServiceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = objc_opt_new();
  int v4 = [v12 avOutputDevice];

  if (v4)
  {
    int v5 = [v12 avOutputDevice];
    id v6 = [v5 deviceID];
    [v3 setDeviceId:v6];

    id v7 = [v12 avOutputDevice];
    id v8 = [v7 deviceName];
    [v3 setDeviceName:v8];
  }
  else
  {
    id v9 = [v12 rapportDevice];

    if (!v9) {
      goto LABEL_6;
    }
    id v10 = [v12 rapportDevice];
    id v11 = [v10 name];
    [v3 setDeviceName:v11];

    id v7 = [v12 rapportDevice];
    id v8 = [v7 rapportEffectiveID];
    [v3 setDeviceId:v8];
  }

LABEL_6:
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
}

- (void).cxx_destruct
{
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#appDBHandler, [ErrorId - Export DB missing URLs] export didn't give any urls", v2, v3, v4, v5, v6);
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 path];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_25418E000, v3, OS_LOG_TYPE_ERROR, "#appDBHandler, [ErrorId - Export DB non existing file] got a non-existing file from exportDatabase! This should never happen. path: %@", (uint8_t *)&v5, 0xCu);
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#appDBHandler, [ErrorId - Export DB directory non empty path] Export data destination path not empty, inconsistency might occur", v2, v3, v4, v5, v6);
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25418E000, a2, OS_LOG_TYPE_ERROR, "#appDBHandler, [ErrorId - Export DB directory create error] failed to create directory, error: %@", (uint8_t *)&v2, 0xCu);
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#appDBHandler, [ErrorId - Export DB timeout] export timed out", v2, v3, v4, v5, v6);
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_6(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25418E000, a2, OS_LOG_TYPE_ERROR, "#appDBHandler, [ErrorId - Export DB exception] get exception %@", (uint8_t *)&v2, 0xCu);
}

- (void)getAllServices
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#appDBHandler, [ErrorId - Replay / Get services error] error in fetchManagedObjectsWithEntityName", v2, v3, v4, v5, v6);
}

- (void)getSortedHistoryEventsForServiceIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#appDBHandler, [ErrorId - Replay / Get History Container error] error fetching HistoryEventsContainer", v2, v3, v4, v5, v6);
}

- (void)inspectEventByDate:andServiceIdentifier:historyEvents:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#appDBHandler, [ErrorId - Replay / Get Replay Container error] error in fetchReplayEventsContainer", v2, v3, v4, v5, v6);
}

- (void)inspectEventByDate:andServiceIdentifier:historyEvents:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#appDBHandler, [ErrorId - Replay / Get services error during inspect] error in fetchService", v2, v3, v4, v5, v6);
}

@end