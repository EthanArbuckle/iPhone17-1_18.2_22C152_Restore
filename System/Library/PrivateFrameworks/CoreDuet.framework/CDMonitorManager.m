@interface CDMonitorManager
+ (id)monitorManagerForEventStreams:(id)a3 domain:(unint64_t)a4;
- (BOOL)_hasMonitorForStreamName:(id)a3;
- (BOOL)hasMonitor:(id)a3;
- (CDMonitorManager)initWithEventStreams:(id)a3 domain:(unint64_t)a4;
- (id)_allMonitors;
- (id)_allStreamNames;
- (id)_currentEventForStreamName:(id)a3;
- (id)_lastUpdateForStreamName:(id)a3;
- (id)_monitorForStreamName:(id)a3;
- (id)currentEvent;
- (id)currentEventForStream:(id)a3;
- (id)lastUpdate;
- (id)lastUpdateForStream:(id)a3;
- (void)_addMonitor:(id)a3 forStreamName:(id)a4;
- (void)_removeMonitorForStreamName:(id)a3;
- (void)_setHistoricalHandler:(id)a3 forStreamName:(id)a4;
- (void)_setInstantHandler:(id)a3 forStreamName:(id)a4;
- (void)_startMonitorForStreamName:(id)a3;
- (void)_stopMonitorForStreamName:(id)a3;
- (void)_updateForStreamName:(id)a3;
- (void)addMonitor:(id)a3;
- (void)deliverNotificationEvent:(id)a3;
- (void)handleShutdownNotification;
- (void)populateCurrentValueForStreamName:(id)a3;
- (void)removeMonitor:(id)a3;
- (void)setHistoricalDeletingHandler:(id)a3;
- (void)setHistoricalHandler:(id)a3;
- (void)setHistoricalHandler:(id)a3 forStream:(id)a4;
- (void)setInstantHandler:(id)a3;
- (void)setInstantHandler:(id)a3 forStream:(id)a4;
- (void)setShutdownHandler:(id)a3;
- (void)start;
- (void)startMonitorForStream:(id)a3;
- (void)stop;
- (void)stopMonitorForStream:(id)a3;
- (void)update;
- (void)updateForStream:(id)a3;
@end

@implementation CDMonitorManager

+ (id)monitorManagerForEventStreams:(id)a3 domain:(unint64_t)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CDMonitorManager_monitorManagerForEventStreams_domain___block_invoke;
  v10[3] = &unk_1E560EC00;
  id v11 = v5;
  unint64_t v12 = a4;
  uint64_t v6 = monitorManagerForEventStreams_domain__onceToken;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(&monitorManagerForEventStreams_domain__onceToken, v10);
  }
  id v8 = (id)monitorManagerForEventStreams_domain__sharedInstance;

  return v8;
}

- (void)populateCurrentValueForStreamName:(id)a3
{
  id v7 = a3;
  v4 = (void *)MEMORY[0x192FB2F20]();
  id v5 = [(CDMonitorManager *)self _monitorForStreamName:v7];
  uint64_t v6 = v5;
  if (v5 && [v5 conformsToProtocol:&unk_1EDE540B8]) {
    [v6 synchronouslyReflectCurrentValue];
  }
}

- (id)_monitorForStreamName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NSMutableDictionary *)v5->_monitors objectForKeyedSubscript:v4];
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)deliverNotificationEvent:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16 = (void *)os_transaction_create();
  id v5 = (void *)MEMORY[0x192FB2F20]();
  if (v4)
  {
    context = v5;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(CDMonitorManager *)self _allMonitors];
    uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v10 conformsToProtocol:&unk_1EDE541D8])
          {
            monitorWorkQueue = self->_monitorWorkQueue;
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __45__CDMonitorManager_deliverNotificationEvent___block_invoke;
            v18[3] = &unk_1E560D848;
            v18[4] = v10;
            id v19 = v4;
            id v12 = v16;
            v13 = v18;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __cd_dispatch_async_capture_tx_block_invoke_8;
            block[3] = &unk_1E560D978;
            id v25 = v12;
            id v26 = v13;
            id v14 = v12;
            dispatch_async(monitorWorkQueue, block);
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v7);
    }

    id v5 = context;
  }
}

- (id)_allMonitors
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_monitors allValues];
  objc_sync_exit(v2);

  return v3;
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_85(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  if (v4 || (id v4 = (void (**)(void, void, void))MEMORY[0x192FB31A0](*(void *)(a1[4] + 32))) != 0)
  {
    id v5 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_85_cold_1();
    }

    ((void (**)(void, void, id))v4)[2](v4, a1[6], v3);
  }
}

uint64_t __45__CDMonitorManager_deliverNotificationEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiveNotificationEvent:*(void *)(a1 + 40)];
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  if (v4 || (id v4 = (void (**)(void, void, void))MEMORY[0x192FB31A0](*(void *)(a1[4] + 24))) != 0)
  {
    id v5 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_cold_1();
    }

    ((void (**)(void, void, id))v4)[2](v4, a1[6], v3);
  }
}

- (CDMonitorManager)initWithEventStreams:(id)a3 domain:(unint64_t)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  v100.receiver = self;
  v100.super_class = (Class)CDMonitorManager;
  id observer = [(CDMonitorManager *)&v100 init];
  if (!observer) {
    goto LABEL_71;
  }
  context = (void *)MEMORY[0x192FB2F20]();
  if (!KnowledgeMonitorLibraryCore())
  {
    uint64_t v8 = +[_CDLogging contextChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDMonitorManager initWithEventStreams:domain:].cold.4();
    }
    goto LABEL_17;
  }
  *(void *)location = 0;
  if (!KnowledgeMonitorLibraryCore()) {
    goto LABEL_72;
  }
  if (*(void *)location) {
    free(*(void **)location);
  }
  if (!UsageTrackingLibraryCore())
  {
    uint64_t v7 = +[_CDLogging contextChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CDMonitorManager initWithEventStreams:domain:].cold.6();
    }
    goto LABEL_15;
  }
  *(void *)location = 0;
  uint64_t v5 = UsageTrackingLibraryCore();
  uint64_t v6 = *(void **)location;
  if (v5)
  {
    self = (CDMonitorManager *)0x1E560C000;
    if (!*(void *)location) {
      goto LABEL_9;
    }
  }
  else
  {
LABEL_72:
    uint64_t v63 = *(void *)location;
    uint64_t v6 = (void *)abort_report_np();
    __break(1u);
  }
  free(v6);
LABEL_9:
  uint64_t v7 = [(OS_dispatch_queue *)self[23]._monitorWorkQueue contextChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDMonitorManager initWithEventStreams:domain:].cold.7();
  }
LABEL_15:

  uint64_t v8 = +[_CDLogging contextChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDMonitorManager initWithEventStreams:domain:].cold.5();
  }
LABEL_17:

  v69 = _CDDomainAvailabilityDescription(a4);
  v9 = +[_CDLogging contextChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CDMonitorManager initWithEventStreams:domain:]();
  }

  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  id v11 = (void *)*((void *)observer + 9);
  *((void *)observer + 9) = v10;

  id v68 = [MEMORY[0x1E4F1CA60] dictionary];
  id v67 = [MEMORY[0x1E4F1CA80] set];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v12 = [v65 allEventStreams];
  id obj = [v12 allValues];

  uint64_t v13 = [obj countByEnumeratingWithState:&v96 objects:v108 count:16];
  if (v13)
  {
    uint64_t v74 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v97 != v74) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        v16 = [v15 eventStreamProperties];
        v17 = [v16 name];

        if (!v17)
        {
          id v25 = +[_CDLogging contextChannel];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            [(CDMonitorManager *)v106 initWithEventStreams:&v107 domain:v25];
          }
          goto LABEL_63;
        }
        v18 = [v17 lowercaseString];
        int v19 = [v18 containsString:@"(internal)"];

        if (!v19 || +[_CDDeviceInfo isRunningOnInternalBuild])
        {
          long long v20 = [v15 eventStreamProperties];
          char v21 = [v20 isAvailable];

          if (v21)
          {
            long long v22 = [v15 eventStreamProperties];
            BOOL v23 = ([v22 domainAvailability] & a4) == 0;

            if (!v23)
            {
              v24 = [v15 eventStreamProperties];
              id v25 = [v24 monitorClass];

              if (v25)
              {
                id v26 = NSClassFromString((NSString *)&v25->isa);
                v27 = v26;
                if (v26)
                {
                  uint64_t v28 = objc_alloc_init(v26);
                  if (v28)
                  {
                    v29 = [v15 eventStreamProperties];
                    int v30 = [v29 isInstant];

                    v31 = [v15 eventStreamProperties];
                    int v32 = [v31 isHistorical];

                    v33 = [v15 eventStreamProperties];
                    int v71 = [v33 setupOnDemand];

                    v34 = [v15 eventStreamProperties];
                    uint64_t v35 = [v34 pollingPeriod];

                    v36 = +[_CDLogging knowledgeChannel];
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)location = 138544130;
                      *(void *)&location[4] = v17;
                      __int16 v102 = 1024;
                      *(_DWORD *)v103 = v30;
                      *(_WORD *)&v103[4] = 1024;
                      *(_DWORD *)&v103[6] = v32;
                      __int16 v104 = 2048;
                      uint64_t v105 = v35;
                      _os_log_debug_impl(&dword_18ECEB000, v36, OS_LOG_TYPE_DEBUG, "Monitor %{public}@ IsInstant=%d, IsHistorical=%d, PollingPeriod=%ld", location, 0x22u);
                    }

                    if (v30
                      && [v28 conformsToProtocol:&unk_1EDE540B8])
                    {
                      v92[0] = MEMORY[0x1E4F143A8];
                      v92[1] = 3221225472;
                      v92[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke;
                      v92[3] = &unk_1E560FF80;
                      id v93 = observer;
                      id v94 = v17;
                      v95 = v15;
                      [v28 setInstantHandler:v92];
                    }
                    if (v32)
                    {
                      if ([v28 conformsToProtocol:&unk_1EDE54118])
                      {
                        v88[0] = MEMORY[0x1E4F143A8];
                        v88[1] = 3221225472;
                        v88[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_85;
                        v88[3] = &unk_1E560FFA8;
                        id v66 = observer;
                        id v89 = v66;
                        id v37 = v17;
                        id v90 = v37;
                        v91 = v15;
                        [v28 setHistoricalHandler:v88];
                        if ((unint64_t)(v35 - 1) <= 6)
                        {
                          v38 = [NSString stringWithFormat:@"com.apple.coreduetd.monitor.%@", v37];
                          objc_initWeak((id *)location, v28);
                          v86[0] = MEMORY[0x1E4F143A8];
                          v86[1] = 3221225472;
                          v86[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_92;
                          v86[3] = &unk_1E560D358;
                          objc_copyWeak(&v87, (id *)location);
                          v39 = +[_CDPeriodicSchedulerJob jobWithPeriod:v35 schedulerJobName:v38 handler:v86];
                          v40 = +[_CDPeriodicScheduler sharedInstance];
                          [v40 registerJob:v39];

                          objc_destroyWeak(&v87);
                          objc_destroyWeak((id *)location);
                        }
                        v41 = [v15 eventStreamProperties];
                        int v42 = [v41 shouldSaveCurrentEventOnShutdown];

                        if (v42)
                        {
                          v43 = v28;
                          [*((id *)observer + 9) addObject:v43];
                          v81[0] = MEMORY[0x1E4F143A8];
                          v81[1] = 3221225472;
                          v81[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_2;
                          v81[3] = &unk_1E560EBB0;
                          id v82 = v66;
                          id v83 = v37;
                          v84 = v15;
                          v85 = v43;
                          v44 = v43;
                          [v44 setShutdownHandler:v81];
                        }
                      }
                      if ([v28 conformsToProtocol:&unk_1EDE54178])
                      {
                        v77[0] = MEMORY[0x1E4F143A8];
                        v77[1] = 3221225472;
                        v77[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_101;
                        v77[3] = &unk_1E560FFD0;
                        id v78 = observer;
                        id v79 = v17;
                        v80 = v15;
                        [v28 setHistoricalDeletingHandler:v77];
                      }
                    }
                    [v68 setObject:v28 forKey:v17];
                    if (v71) {
                      [v67 addObject:v17];
                    }
                  }
                  else
                  {
                    v48 = +[_CDLogging contextChannel];
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    {
                      v49 = NSStringFromClass(v27);
                      *(_DWORD *)location = 138543618;
                      *(void *)&location[4] = v49;
                      __int16 v102 = 2114;
                      *(void *)v103 = v17;
                      _os_log_error_impl(&dword_18ECEB000, v48, OS_LOG_TYPE_ERROR, "Unable to initialize monitor %{public}@ for streamName %{public}@", location, 0x16u);
                    }
                  }
                }
                else
                {
                  uint64_t v28 = +[_CDLogging contextChannel];
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)location = 138543618;
                    *(void *)&location[4] = v25;
                    __int16 v102 = 2114;
                    *(void *)v103 = v17;
                    _os_log_error_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_ERROR, "Unable to find monitor class %{public}@ for streamName %{public}@", location, 0x16u);
                  }
                }
              }
              else
              {
                uint64_t v28 = +[_CDLogging contextChannel];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)location = 138543362;
                  *(void *)&location[4] = v17;
                  _os_log_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_INFO, "No monitor for %{public}@", location, 0xCu);
                }
              }

              goto LABEL_63;
            }
            id v25 = +[_CDLogging contextChannel];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)location = 138412546;
              *(void *)&location[4] = v69;
              __int16 v102 = 2112;
              *(void *)v103 = v17;
              v45 = v25;
              v46 = "Monitor is not supported in the %@ domain: %@ ";
              uint32_t v47 = 22;
LABEL_54:
              _os_log_impl(&dword_18ECEB000, v45, OS_LOG_TYPE_INFO, v46, location, v47);
            }
          }
          else
          {
            id v25 = +[_CDLogging contextChannel];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)location = 138412290;
              *(void *)&location[4] = v17;
              v45 = v25;
              v46 = "Monitor is not supported on this platform: %@";
              uint32_t v47 = 12;
              goto LABEL_54;
            }
          }
LABEL_63:
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v96 objects:v108 count:16];
    }
    while (v13);
  }

  objc_storeStrong((id *)observer + 1, v68);
  objc_storeStrong((id *)observer + 2, v67);
  v50 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    -[CDMonitorManager initWithEventStreams:domain:]();
  }

  uint64_t v51 = [MEMORY[0x1E4F1CA60] dictionary];
  v52 = (void *)*((void *)observer + 7);
  *((void *)observer + 7) = v51;

  uint64_t v53 = [MEMORY[0x1E4F1CA60] dictionary];
  v54 = (void *)*((void *)observer + 8);
  *((void *)observer + 8) = v53;

  dispatch_queue_t v55 = dispatch_queue_create("com.apple.CDMonitorManager.workQueue", MEMORY[0x1E4F14430]);
  v56 = (void *)*((void *)observer + 10);
  *((void *)observer + 10) = v55;

  v57 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)location = 0;
    _os_log_impl(&dword_18ECEB000, v57, OS_LOG_TYPE_INFO, "Registering for device shutdown notification", location, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, observer, (CFNotificationCallback)_handleShutdownNotification, @"com.apple.springboard.deviceWillShutDown", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v59 = dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, MEMORY[0x1E4F14428]);
  v60 = (void *)*((void *)observer + 11);
  *((void *)observer + 11) = v59;

  v61 = *((void *)observer + 11);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_107;
  handler[3] = &unk_1E560D578;
  id v76 = observer;
  dispatch_source_set_event_handler(v61, handler);
  dispatch_resume(*((dispatch_object_t *)observer + 11));

LABEL_71:

  return (CDMonitorManager *)observer;
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_92(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FB2F20]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained update];
}

uint64_t __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 48))
  {
    uint64_t v1 = result;
    v2 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_2_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(*(void *)(v1 + 32) + 48) + 16))();
  }
  return result;
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_101(uint64_t a1, void *a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    id v3 = a2;
    id v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_101_cold_1();
    }

    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
  }
}

uint64_t __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_107(uint64_t a1)
{
  v2 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "Got a SIGTERM.", v4, 2u);
  }

  return [*(id *)(a1 + 32) handleShutdownNotification];
}

uint64_t __57__CDMonitorManager_monitorManagerForEventStreams_domain___block_invoke(uint64_t a1)
{
  monitorManagerForEventStreams_domain__sharedInstance = [[CDMonitorManager alloc] initWithEventStreams:*(void *)(a1 + 32) domain:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)_allStreamNames
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_monitors allKeys];
  objc_sync_exit(v2);

  return v3;
}

- (void)_setInstantHandler:(id)a3 forStreamName:(id)a4
{
  id v6 = a4;
  id v7 = (id)MEMORY[0x192FB31A0](a3);
  [(NSMutableDictionary *)self->_instantHandlerMap setObject:v7 forKeyedSubscript:v6];
}

- (void)setInstantHandler:(id)a3 forStream:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v8 = [v6 eventStreamProperties];
  v9 = [v8 name];

  if (v9) {
    [(CDMonitorManager *)self _setInstantHandler:v10 forStreamName:v9];
  }
}

- (void)setInstantHandler:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v5 = (void *)MEMORY[0x192FB31A0](v7);
  id generalInstantHandler = self->_generalInstantHandler;
  self->_id generalInstantHandler = v5;
}

- (void)_setHistoricalHandler:(id)a3 forStreamName:(id)a4
{
  id v6 = a4;
  id v7 = (id)MEMORY[0x192FB31A0](a3);
  [(NSMutableDictionary *)self->_historicalHandlerMap setObject:v7 forKeyedSubscript:v6];
}

- (void)setHistoricalHandler:(id)a3 forStream:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v8 = [v6 eventStreamProperties];
  v9 = [v8 name];

  if (v9) {
    [(CDMonitorManager *)self _setHistoricalHandler:v10 forStreamName:v9];
  }
}

- (void)setHistoricalHandler:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v5 = (void *)MEMORY[0x192FB31A0](v7);
  id generalHistoricalHandler = self->_generalHistoricalHandler;
  self->_id generalHistoricalHandler = v5;
}

- (void)setHistoricalDeletingHandler:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v5 = (void *)MEMORY[0x192FB31A0](v7);
  id generalHistoricalDeletingHandler = self->_generalHistoricalDeletingHandler;
  self->_id generalHistoricalDeletingHandler = v5;
}

- (void)setShutdownHandler:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v5 = (void *)MEMORY[0x192FB31A0](v7);
  id generalShutdownHandler = self->_generalShutdownHandler;
  self->_id generalShutdownHandler = v5;
}

- (void)_startMonitorForStreamName:(id)a3
{
  id v4 = [(CDMonitorManager *)self _monitorForStreamName:a3];
  uint64_t v5 = (void *)os_transaction_create();
  if (v4 && [v4 conformsToProtocol:&unk_1EDE540B8])
  {
    monitorWorkQueue = self->_monitorWorkQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__CDMonitorManager__startMonitorForStreamName___block_invoke;
    v9[3] = &unk_1E560D578;
    id v10 = v4;
    id v7 = v5;
    uint64_t v8 = v9;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_8;
    block[3] = &unk_1E560D978;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(monitorWorkQueue, block);
  }
}

uint64_t __47__CDMonitorManager__startMonitorForStreamName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)startMonitorForStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x192FB2F20]();
  id v6 = [v4 eventStreamProperties];
  id v7 = [v6 name];

  uint64_t v8 = +[_CDLogging knowledgeChannel];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      -[CDMonitorManager startMonitorForStream:]();
    }

    [(CDMonitorManager *)self _startMonitorForStreamName:v7];
  }
  else
  {
    if (v9) {
      -[CDMonitorManager startMonitorForStream:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x192FB2F20](self, a2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(CDMonitorManager *)self _allStreamNames];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_lazyMonitorNames containsObject:v8])
        {
          BOOL v9 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v16 = v8;
            _os_log_debug_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEBUG, "------> Skipping start for OnDemand monitor : %{public}@", buf, 0xCu);
          }
        }
        else
        {
          [(CDMonitorManager *)self _startMonitorForStreamName:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)_stopMonitorForStreamName:(id)a3
{
  uint64_t v4 = [(CDMonitorManager *)self _monitorForStreamName:a3];
  uint64_t v5 = v4;
  if (v4 && [v4 conformsToProtocol:&unk_1EDE540B8])
  {
    monitorWorkQueue = self->_monitorWorkQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__CDMonitorManager__stopMonitorForStreamName___block_invoke;
    v11[3] = &unk_1E560D578;
    id v12 = v5;
    id v7 = v11;
    uint64_t v8 = monitorWorkQueue;
    BOOL v9 = (void *)os_transaction_create();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_8;
    block[3] = &unk_1E560D978;
    id v14 = v9;
    id v15 = v7;
    id v10 = v9;
    dispatch_async(v8, block);
  }
}

uint64_t __46__CDMonitorManager__stopMonitorForStreamName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

- (void)stopMonitorForStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v6 = [v4 eventStreamProperties];
  id v7 = [v6 name];

  uint64_t v8 = +[_CDLogging knowledgeChannel];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      -[CDMonitorManager stopMonitorForStream:]();
    }

    [(CDMonitorManager *)self _stopMonitorForStreamName:v7];
  }
  else
  {
    if (v9) {
      -[CDMonitorManager stopMonitorForStream:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)stop
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x192FB2F20](self, a2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(CDMonitorManager *)self _allStreamNames];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_lazyMonitorNames containsObject:v8])
        {
          BOOL v9 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v16 = v8;
            _os_log_debug_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEBUG, "------> Skipping stop for OnDemand monitor : %{public}@", buf, 0xCu);
          }
        }
        else
        {
          [(CDMonitorManager *)self _stopMonitorForStreamName:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)_currentEventForStreamName:(id)a3
{
  id v3 = [(CDMonitorManager *)self _monitorForStreamName:a3];
  uint64_t v4 = v3;
  if (v3 && [v3 conformsToProtocol:&unk_1EDE540B8])
  {
    uint64_t v5 = [v4 currentEvent];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)currentEventForStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v6 = [v4 eventStreamProperties];
  id v7 = [v6 name];

  if (v7)
  {
    uint64_t v8 = [(CDMonitorManager *)self _currentEventForStreamName:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)currentEvent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x192FB2F20](self, a2);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(CDMonitorManager *)self _allStreamNames];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [(CDMonitorManager *)self _currentEventForStreamName:v10];
        if (v11) {
          [v4 setObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  return v12;
}

- (void)_updateForStreamName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDMonitorManager *)self _monitorForStreamName:v4];
  uint64_t v6 = v5;
  if (v5 && [v5 conformsToProtocol:&unk_1EDE54118])
  {
    uint64_t v7 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CDMonitorManager _updateForStreamName:]();
    }

    [v6 update];
  }
}

- (void)updateForStream:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v5 = [v7 eventStreamProperties];
  uint64_t v6 = [v5 name];

  if (v6) {
    [(CDMonitorManager *)self _updateForStreamName:v6];
  }
}

- (void)update
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x192FB2F20](self, a2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(CDMonitorManager *)self _allStreamNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CDMonitorManager *)self _updateForStreamName:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_lastUpdateForStreamName:(id)a3
{
  id v3 = [(CDMonitorManager *)self _monitorForStreamName:a3];
  id v4 = v3;
  if (v3 && [v3 conformsToProtocol:&unk_1EDE54118])
  {
    uint64_t v5 = [v4 lastUpdate];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)lastUpdateForStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v6 = [v4 eventStreamProperties];
  uint64_t v7 = [v6 name];

  if (v7)
  {
    uint64_t v8 = [(CDMonitorManager *)self _lastUpdateForStreamName:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)lastUpdate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x192FB2F20](self, a2);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(CDMonitorManager *)self _allStreamNames];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [(CDMonitorManager *)self _lastUpdateForStreamName:v10];
        if (v11) {
          [v4 setObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  return v12;
}

- (void)handleShutdownNotification
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_shutdownHandlingMonitors;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = MEMORY[0x1E4F14500];
    *(void *)&long long v4 = 138412290;
    long long v12 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "shutdownHandler", v12, (void)v13);
        long long v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = (objc_class *)objc_opt_class();
            long long v11 = NSStringFromClass(v10);
            *(_DWORD *)buf = v12;
            uint64_t v18 = v11;
            _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEFAULT, "Calling shutdown handler for monitor %@.", buf, 0xCu);
          }
          v9[2](v9);
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)_addMonitor:(id)a3 forStreamName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    [(NSMutableDictionary *)v7->_monitors setObject:v8 forKeyedSubscript:v6];
    objc_sync_exit(v7);
  }
}

- (void)addMonitor:(id)a3
{
  id v6 = a3;
  long long v4 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v5 = [(id)objc_opt_class() eventStream];
  [(CDMonitorManager *)self _addMonitor:v6 forStreamName:v5];
}

- (void)_removeMonitorForStreamName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    [(NSMutableDictionary *)v5->_monitors removeObjectForKey:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeMonitor:(id)a3
{
  id v6 = a3;
  id v4 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v5 = [(id)objc_opt_class() eventStream];
  [(CDMonitorManager *)self _removeMonitorForStreamName:v5];
}

- (BOOL)_hasMonitorForStreamName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)v5->_monitors objectForKeyedSubscript:v4];
    BOOL v7 = v6 != 0;

    objc_sync_exit(v5);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasMonitor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x192FB2F20]();
  id v6 = [(id)objc_opt_class() eventStream];
  LOBYTE(self) = [(CDMonitorManager *)self _hasMonitorForStreamName:v6];

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SIGTERMHandlerSource, 0);
  objc_storeStrong((id *)&self->_monitorWorkQueue, 0);
  objc_storeStrong((id *)&self->_shutdownHandlingMonitors, 0);
  objc_storeStrong((id *)&self->_historicalHandlerMap, 0);
  objc_storeStrong((id *)&self->_instantHandlerMap, 0);
  objc_storeStrong(&self->_generalShutdownHandler, 0);
  objc_storeStrong(&self->_generalHistoricalDeletingHandler, 0);
  objc_storeStrong(&self->_generalHistoricalHandler, 0);
  objc_storeStrong(&self->_generalInstantHandler, 0);
  objc_storeStrong((id *)&self->_lazyMonitorNames, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
}

- (void)initWithEventStreams:domain:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Lazily initialized Monitors = %{public}@", v2, v3, v4, v5, v6);
}

- (void)initWithEventStreams:(void *)a3 domain:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  BOOL v7 = [a2 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_18ECEB000, a4, OS_LOG_TYPE_ERROR, "Stream missing name: %@", a1, 0xCu);
}

- (void)initWithEventStreams:domain:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Initializing monitor manager for domain %@", v2, v3, v4, v5, v6);
}

- (void)initWithEventStreams:domain:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "KnowledgeMonitorLibrary is NOT available", v2, v3, v4, v5, v6);
}

- (void)initWithEventStreams:domain:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "KnowledgeMonitorLibrary is available", v2, v3, v4, v5, v6);
}

- (void)initWithEventStreams:domain:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "UsageTrackingLibrary is NOT available", v2, v3, v4, v5, v6);
}

- (void)initWithEventStreams:domain:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "UsageTrackingLibrary is available", v2, v3, v4, v5, v6);
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Calling instant handler for %@", v2, v3, v4, v5, v6);
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_85_cold_1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Calling historical handler for %@", v2, v3, v4, v5, v6);
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Calling shutdown handler for %@", v2, v3, v4, v5, v6);
}

void __48__CDMonitorManager_initWithEventStreams_domain___block_invoke_101_cold_1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Calling deletion handler for %@", v2, v3, v4, v5, v6);
}

- (void)startMonitorForStream:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startMonitorForStream:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "------> -startMonitorForStream: (OnDemand monitor) %{public}@", v2, v3, v4, v5, v6);
}

- (void)stopMonitorForStream:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stopMonitorForStream:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "------> -stopMonitorForStream: (OnDemand monitor) %{public}@", v2, v3, v4, v5, v6);
}

- (void)_updateForStreamName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Updating monitor %{public}@", v2, v3, v4, v5, v6);
}

@end