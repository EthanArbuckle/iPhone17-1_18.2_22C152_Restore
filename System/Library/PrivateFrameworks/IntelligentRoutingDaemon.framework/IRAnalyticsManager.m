@interface IRAnalyticsManager
+ (BOOL)_isClientAllowedCA:(id)a3;
+ (BOOL)logUiEvent:(id)a3 withService:(id)a4 forCandidateIdentifier:(id)a5 systemStateManager:(id)a6 candidatesContainer:(id)a7 inspections:(id)a8 statisticsManager:(id)a9 historyEventsContainer:(id)a10;
+ (void)sendEventLazyForEventIdentifier:(id)a3 clientIdentifier:(id)a4 analytics:(id)a5;
- (IRAnalyticsManager)initWithBackgroundActivitiesManager:(id)a3;
- (IRBackgroundActivitiesManager)backgroundActivitiesManager;
- (void)_handleCoreAnalyticsXPCActivity;
- (void)setBackgroundActivitiesManager:(id)a3;
@end

@implementation IRAnalyticsManager

+ (BOOL)logUiEvent:(id)a3 withService:(id)a4 forCandidateIdentifier:(id)a5 systemStateManager:(id)a6 candidatesContainer:(id)a7 inspections:(id)a8 statisticsManager:(id)a9 historyEventsContainer:(id)a10
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v15 = a4;
  id v41 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = [v15 clientIdentifier];
  LOBYTE(a8) = +[IRAnalyticsManager _isClientAllowedCA:v21];

  if (a8)
  {
    v22 = IRCreateServicePackageAdapter([v15 servicePackage]);
    char v23 = objc_opt_respondsToSelector();
    if (v23)
    {
      v24 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        log = v24;
        v38 = [v15 serviceIdentifier];
        v37 = [v15 clientIdentifier];
        *(_DWORD *)buf = 138412546;
        v44 = v38;
        __int16 v45 = 2112;
        v46 = v37;
        _os_log_impl(&dword_25418E000, log, OS_LOG_TYPE_DEFAULT, "#analytics, Starting ui event analytics for service: %@, client: %@", buf, 0x16u);
      }
      v25 = [v22 uiAnalyticsWithEvent:v42 forCandidateIdentifier:v41 systemStateManager:v16 candidatesContainer:v17 inspections:v18 statisticsManager:v19 service:v15 historyEventsContainer:v20];
      [v15 clientIdentifier];
      os_log_t loga = v22;
      id v26 = v20;
      id v27 = v19;
      id v28 = v18;
      id v29 = v17;
      v31 = id v30 = v16;
      +[IRAnalyticsManager sendEventLazyForEventIdentifier:@"com.apple.com.apple.intelligentroutingd.CoreAnalyticsUiEvent" clientIdentifier:v31 analytics:v25];

      id v16 = v30;
      id v17 = v29;
      id v18 = v28;
      id v19 = v27;
      id v20 = v26;
      v22 = loga;
    }
  }
  else
  {
    v32 = (void *)*MEMORY[0x263F50090];
    char v23 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = [v15 serviceIdentifier];
      v35 = [v15 clientIdentifier];
      *(_DWORD *)buf = 138412546;
      v44 = v34;
      __int16 v45 = 2112;
      v46 = v35;
      _os_log_impl(&dword_25418E000, v33, OS_LOG_TYPE_DEFAULT, "#analytics, Skipping ui event analytics for service: %@, client: %@", buf, 0x16u);

      char v23 = 0;
    }
  }

  return v23 & 1;
}

+ (void)sendEventLazyForEventIdentifier:(id)a3 clientIdentifier:(id)a4 analytics:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_25418E000, v10, OS_LOG_TYPE_DEFAULT, "#analytics, [%@]:[%@]: Preparing to submit analytics: %@", buf, 0x20u);
  }
  v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  AnalyticsSendEventLazy();
}

id __81__IRAnalyticsManager_sendEventLazyForEventIdentifier_clientIdentifier_analytics___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v8 = 138412802;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_25418E000, v2, OS_LOG_TYPE_DEFAULT, "#analytics, [%@]:[%@]: Submitting analytics: %@", (uint8_t *)&v8, 0x20u);
  }
  v6 = (void *)a1[6];

  return v6;
}

+ (BOOL)_isClientAllowedCA:(id)a3
{
  id v3 = a3;
  if ([&unk_2703AF380 containsObject:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 containsString:@"com.apple.mediaremoted"];
  }

  return v4;
}

- (IRAnalyticsManager)initWithBackgroundActivitiesManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IRAnalyticsManager;
  uint64_t v5 = [(IRAnalyticsManager *)&v13 init];
  if (v5)
  {
    v6 = +[IRPreferences shared];
    id v7 = [v6 coreAnalyticsXPCActivityInterval];
    uint64_t v8 = [v7 longLongValue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__IRAnalyticsManager_initWithBackgroundActivitiesManager___block_invoke;
    v11[3] = &unk_26539FCE8;
    uint64_t v9 = v5;
    __int16 v12 = v9;
    [v4 registerForRepeatingBackgroundXPCActivityWithIdentifier:@"com.apple.intelligentroutingd.CoreAnalyticsXPCActivityIdentifier" interval:v8 isDiskIntensive:1 isMemoryIntensive:1 handler:v11];

    [(IRAnalyticsManager *)v9 setBackgroundActivitiesManager:v4];
  }

  return v5;
}

uint64_t __58__IRAnalyticsManager_initWithBackgroundActivitiesManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCoreAnalyticsXPCActivity];
}

- (void)_handleCoreAnalyticsXPCActivity
{
  id v3 = [(IRAnalyticsManager *)self backgroundActivitiesManager];
  v2 = [v3 server];
  [v2 performXPCActivityUnderServerContext:&__block_literal_global_22];
}

void __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  v6 = +[IRPreferences shared];
  id v7 = [v6 coreAnalyticsEnable];
  char v8 = [v7 BOOLValue];

  if (v8)
  {
    uint64_t v9 = (void *)os_transaction_create();
    __int16 v10 = (os_log_t *)MEMORY[0x263F50090];
    uint64_t v11 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_DEFAULT, "#analytics, Handling weekly analytics", buf, 2u);
    }
    if ([v4 connectToStore])
    {
      __int16 v12 = +[IRServiceStore fetchAllServicesWithPersistenceManager:v4];
      if (v12)
      {
        objc_super v13 = +[IRPreferences shared];
        uint64_t v14 = [v13 coreAnalyticsWeeklyMobileAssetVersion];

        id v15 = +[IRPreferences shared];
        id v16 = [v15 mobileAssetVersion];

        if (v14 == v16 || ([v14 isEqual:v16] & 1) != 0)
        {
          char v17 = 1;
        }
        else
        {
          __int16 v21 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v28 = v14;
            __int16 v29 = 2112;
            id v30 = v16;
            _os_log_impl(&dword_25418E000, v21, OS_LOG_TYPE_DEFAULT, "#analytics, Skipping weekly analytics due to mobile asset versioning missmatch: prev: %@, new: %@", buf, 0x16u);
          }
          id v22 = +[IRPreferences shared];
          [v22 updateAndNotifyKey:@"coreAnalyticsWeeklyMobileAssetVersion" withObject:v16];

          char v17 = 0;
        }
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke_33;
        v23[3] = &unk_2653A0D50;
        id v24 = v4;
        id v25 = v5;
        char v26 = v17;
        [v12 enumerateObjectsUsingBlock:v23];
      }
      else
      {
        id v20 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_25418E000, v20, OS_LOG_TYPE_DEFAULT, "#analytics, 0 services found during weekly analytics", buf, 2u);
        }
      }
    }
    else
    {
      __int16 v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
        __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke_cold_1(v19);
      }
    }
  }
  else
  {
    id v18 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25418E000, v18, OS_LOG_TYPE_DEFAULT, "#analytics, Weekly analytics disabled", buf, 2u);
    }
  }
}

void __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = IRCreateServicePackageAdapter([v3 servicePackage]);
  id v5 = [v3 clientIdentifier];
  if (+[IRAnalyticsManager _isClientAllowedCA:v5])
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        char v8 = v7;
        uint64_t v9 = [v3 serviceIdentifier];
        __int16 v10 = [v3 clientIdentifier];
        *(_DWORD *)buf = 138412546;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v10;
        _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_DEFAULT, "#analytics, Starting weekly analytics for service: %@, client: %@", buf, 0x16u);
      }
      uint64_t v11 = [IRServiceStore alloc];
      uint64_t v12 = *(void *)(a1 + 32);
      objc_super v13 = [v3 serviceIdentifier];
      uint64_t v14 = [(IRServiceStore *)v11 initWithPersistenceManager:v12 serviceIdentifier:v13];

      id v15 = *(void **)(a1 + 40);
      id v16 = [v3 serviceIdentifier];
      char v17 = [v15 objectForKeyedSubscript:v16];

      if (v17)
      {
        id v18 = [v17 getStatistics];
        [v17 clearStatistics];
      }
      else
      {
        id v18 = [(IRServiceStore *)v14 fetchStatistics];
        uint64_t v23 = [MEMORY[0x263EFF910] date];
        id v24 = +[IRStatisticsDO statisticsDOWithNumberOfContextChanges:0 numberOfMiLoPredictions:0 numberOfMiLoPredictionsInUpdatesMode:0 lastMiLoLSLItems:0 lastMiLoQualityReasonBitmap:0 lastMiLoQuality:0 lastMiLoModels:0 timeInUpdatesModeInSeconds:0 numberOfPickerChoiceEvents:0 numberOfCorrectPickerChoiceEvents:0 lastClearDate:v23];
        [(IRServiceStore *)v14 updateStatistics:v24];
      }
      if (*(unsigned char *)(a1 + 48))
      {
        id v25 = [v4 weeklyAnalyticsWithServiceStore:v14 statistics:v18 service:v3];
        char v26 = [v3 clientIdentifier];
        +[IRAnalyticsManager sendEventLazyForEventIdentifier:@"com.apple.intelligentroutingd.CoreAnalyticsWeekly" clientIdentifier:v26 analytics:v25];
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  __int16 v19 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v19;
    __int16 v21 = [v3 serviceIdentifier];
    id v22 = [v3 clientIdentifier];
    *(_DWORD *)buf = 138412546;
    id v28 = v21;
    __int16 v29 = 2112;
    id v30 = v22;
    _os_log_impl(&dword_25418E000, v20, OS_LOG_TYPE_DEFAULT, "#analytics, Skipping weekly analytics for service: %@, client: %@", buf, 0x16u);
  }
LABEL_14:
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

void __53__IRAnalyticsManager__handleCoreAnalyticsXPCActivity__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#analytics, [ErrorId - DB access on analytics] Could not connect to DB during weekly analytics", v1, 2u);
}

@end