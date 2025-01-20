@interface IRCleanupManager
- (IRBackgroundActivitiesManager)backgroundActivitiesManager;
- (IRCleanupManager)initWithBackgroundActivitiesManager:(id)a3;
- (id)_getDateIntervalOfBuildsToDiscard;
- (id)_getListOfBuildsToDiscard;
- (void)_handleCleanupXPCActivity;
- (void)setBackgroundActivitiesManager:(id)a3;
@end

@implementation IRCleanupManager

- (IRCleanupManager)initWithBackgroundActivitiesManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IRCleanupManager;
  v5 = [(IRCleanupManager *)&v13 init];
  if (v5)
  {
    v6 = +[IRPreferences shared];
    v7 = [v6 cleanupXPCActivityInterval];
    uint64_t v8 = [v7 longLongValue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__IRCleanupManager_initWithBackgroundActivitiesManager___block_invoke;
    v11[3] = &unk_26539FCE8;
    v9 = v5;
    v12 = v9;
    [v4 registerForRepeatingBackgroundXPCActivityWithIdentifier:@"com.apple.intelligentroutingd.DBCleanupXPCActivityIdentifier" interval:v8 isDiskIntensive:1 isMemoryIntensive:1 handler:v11];

    [(IRCleanupManager *)v9 setBackgroundActivitiesManager:v4];
  }

  return v5;
}

uint64_t __56__IRCleanupManager_initWithBackgroundActivitiesManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCleanupXPCActivity];
}

- (void)_handleCleanupXPCActivity
{
  v3 = [(IRCleanupManager *)self backgroundActivitiesManager];
  id v4 = [v3 server];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke;
  v5[3] = &unk_2653A0DE8;
  v5[4] = self;
  [v4 performXPCActivityUnderServerContext:v5];
}

void __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)os_transaction_create();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F50090];
  v9 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Handling IRD cleanup", buf, 2u);
  }
  if ([v5 connectToStore])
  {
    v10 = +[IRServiceStore fetchAllServicesWithPersistenceManager:v5];
    if (v10)
    {
      v11 = (os_log_t *)MEMORY[0x263F50098];
      v12 = (void *)*MEMORY[0x263F50098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50098], OS_LOG_TYPE_DEFAULT))
      {
        objc_super v13 = NSNumber;
        v14 = v12;
        v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v16 = NSNumber;
        v17 = [v6 allKeys];
        v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Number of services in DB: %@, number of active services: %@", buf, 0x16u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v37 = __Block_byref_object_copy__11;
      v38 = __Block_byref_object_dispose__11;
      id v39 = 0;
      if (+[IRPlatformInfo isInternalInstall])
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_6;
        block[3] = &unk_2653A0D78;
        block[4] = *(void *)(a1 + 32);
        block[5] = buf;
        if (cleanupXPCActivityIdentifier_block_invoke_onceToken != -1) {
          dispatch_once(&cleanupXPCActivityIdentifier_block_invoke_onceToken, block);
        }
      }
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_2;
      v29[3] = &unk_2653A0DA0;
      id v19 = v6;
      id v30 = v19;
      v32 = buf;
      id v20 = v5;
      id v31 = v20;
      [v10 enumerateObjectsUsingBlock:v29];
      BOOL v21 = +[IRSessionServer isGlobalLowLatencyMiLoWithPersistenceManager:v20];
      v22 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v23 = @"NO";
        if (v21) {
          v23 = @"YES";
        }
        *(_DWORD *)v34 = 138412290;
        v35 = v23;
        _os_log_impl(&dword_25418E000, v22, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Restarting isLowLatencyMiLo: %@", v34, 0xCu);
      }
      v24 = [v19 allValues];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_24;
      v27[3] = &__block_descriptor_33_e35_v32__0__IRServiceContainer_8Q16_B24l;
      BOOL v28 = v21;
      [v24 enumerateObjectsUsingBlock:v27];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v26 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25418E000, v26, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, 0 services found during DB cleanup", buf, 2u);
      }
    }
  }
  else
  {
    v25 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_cold_1(v25);
    }
  }
}

uint64_t __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_6(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _getDateIntervalOfBuildsToDiscard];

  return MEMORY[0x270F9A758]();
}

void __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_2(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = [v3 serviceIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = (void *)a1[4];
    uint64_t v8 = [v3 serviceIdentifier];
    v9 = [v7 objectForKeyedSubscript:v8];
    [v9 dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
  else
  {
    v10 = [MEMORY[0x263EFF910] date];
    v11 = [v3 lastSeenDate];
    v12 = +[IRPreferences shared];
    objc_super v13 = [v12 dbCleanupXPCActivityDeleteServiceThreshold];
    [v13 doubleValue];
    v14 = objc_msgSend(v11, "dateByAddingTimeInterval:");
    int v15 = [v14 isEarlierThan:v10];

    if (v15)
    {
      v16 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v3;
        _os_log_impl(&dword_25418E000, v16, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Deleting service: %@", (uint8_t *)&v32, 0xCu);
      }
      id v17 = objc_alloc(MEMORY[0x263F50100]);
      v18 = [v3 serviceIdentifier];
      id v19 = (IRServiceStore *)objc_msgSend(v17, "initWithServiceIdentifier:servicePackage:", v18, objc_msgSend(v3, "servicePackage"));

      +[IRServiceContainer deleteServiceWithToken:v19 persistenceManager:a1[5]];
    }
    else
    {
      id v20 = [IRServiceStore alloc];
      uint64_t v21 = a1[5];
      v22 = [v3 serviceIdentifier];
      id v19 = [(IRServiceStore *)v20 initWithPersistenceManager:v21 serviceIdentifier:v22];

      BOOL v23 = [(IRServiceStore *)v19 cleanupWithDate:v10 dateIntervalOfMiLoPredictionsToDiscard:*(void *)(*(void *)(a1[6] + 8) + 40)];
      v24 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = [v3 clientIdentifier];
        v27 = NSNumber;
        BOOL v28 = [MEMORY[0x263EFF910] date];
        [v28 timeIntervalSinceDate:v10];
        uint64_t v29 = objc_msgSend(v27, "numberWithDouble:");
        id v30 = (void *)v29;
        id v31 = @"Fail";
        int v32 = 138412802;
        id v33 = v26;
        __int16 v34 = 2112;
        if (v23) {
          id v31 = @"Ok";
        }
        uint64_t v35 = v29;
        __int16 v36 = 2112;
        v37 = v31;
        _os_log_impl(&dword_25418E000, v25, OS_LOG_TYPE_DEFAULT, "#db-cleanup-manager, Finished DB cleanup for non active service: %@, in %@ seconds with status: %@", (uint8_t *)&v32, 0x20u);
      }
    }
  }
}

uint64_t __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_24(uint64_t a1, void *a2)
{
  return [a2 restartLowLatencyMiLo:*(unsigned __int8 *)(a1 + 32)];
}

- (id)_getDateIntervalOfBuildsToDiscard
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = [(IRCleanupManager *)self _getListOfBuildsToDiscard];
  id v4 = (id *)MEMORY[0x263F50090];
  id v5 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_INFO, "#db-cleanup-manager, Getting date range of events to discard from builds metadata", buf, 2u);
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  v7 = [(IRCleanupManager *)self backgroundActivitiesManager];
  uint64_t v8 = [v7 server];
  v9 = [v8 biomeProvider];
  v10 = [v9 fetchLatestEventsOfEventType:3 numEvents:0];

  *(void *)buf = 0;
  uint64_t v40 = buf;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __53__IRCleanupManager__getDateIntervalOfBuildsToDiscard__block_invoke;
  v35[3] = &unk_2653A0E10;
  id v11 = v3;
  id v36 = v11;
  id v12 = v6;
  id v37 = v12;
  uint64_t v38 = buf;
  [v10 enumerateObjectsUsingBlock:v35];
  if ([v12 count])
  {
    unint64_t v13 = *((void *)v40 + 3);
    if (v13 < [v10 count] - 1)
    {
      v14 = NSNumber;
      int v15 = [v10 objectAtIndex:*((void *)v40 + 3) + 1];
      [v15 timestamp];
      v16 = objc_msgSend(v14, "numberWithDouble:");
      [v12 addObject:v16];
    }
    id v17 = (void *)MEMORY[0x263EFF980];
    v18 = [v12 sortedArrayUsingSelector:sel_compare_];
    id v19 = [v17 arrayWithArray:v18];

    id v20 = (void *)MEMORY[0x263EFF910];
    uint64_t v21 = [v19 firstObject];
    [v21 doubleValue];
    v22 = objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");

    BOOL v23 = (void *)MEMORY[0x263EFF910];
    v24 = [v19 lastObject];
    [v24 doubleValue];
    v25 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");

    v26 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v22 endDate:v25];
    v27 = *v4;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      BOOL v28 = [v19 firstObject];
      [v28 doubleValue];
      uint64_t v30 = v29;
      id v31 = [v19 lastObject];
      [v31 doubleValue];
      *(_DWORD *)v43 = 134218240;
      uint64_t v44 = v30;
      __int16 v45 = 2048;
      uint64_t v46 = v32;
      _os_log_impl(&dword_25418E000, v27, OS_LOG_TYPE_INFO, "#db-cleanup-manager, Found matching builds for discarding events with date range: (%f, %f)", v43, 0x16u);
    }
  }
  else
  {
    id v33 = *v4;
    if (os_log_type_enabled((os_log_t)*v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_25418E000, v33, OS_LOG_TYPE_INFO, "#db-cleanup-manager, Found no matching builds for which to discard events", v43, 2u);
    }
    v26 = 0;
    id v19 = v12;
  }

  _Block_object_dispose(buf, 8);

  return v26;
}

void __53__IRCleanupManager__getDateIntervalOfBuildsToDiscard__block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id v5 = [v11 eventBody];
  id v6 = (void *)a1[4];
  v7 = [v5 build];
  LODWORD(v6) = [v6 containsObject:v7];

  if (v6)
  {
    uint64_t v8 = (void *)a1[5];
    v9 = NSNumber;
    [v11 timestamp];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    [v8 addObject:v10];

    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  }
}

- (id)_getListOfBuildsToDiscard
{
  return &unk_2703AF398;
}

- (IRBackgroundActivitiesManager)backgroundActivitiesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundActivitiesManager);

  return (IRBackgroundActivitiesManager *)WeakRetained;
}

- (void)setBackgroundActivitiesManager:(id)a3
{
}

- (void).cxx_destruct
{
}

void __45__IRCleanupManager__handleCleanupXPCActivity__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#db-cleanup-manager, [ErrorId - DB access during cleanup] Could not connect to DB during DB cleanup", v1, 2u);
}

@end