@interface EDWidgetUpdateController
+ (OS_os_log)log;
- (CHSWidgetConfigurationReader)reader;
- (EDWidgetUpdateController)initWithWidgetBundleIdentifier:(id)a3 widgetKindIdentifiers:(id)a4 hookRegistry:(id)a5;
- (NSArray)timelineControllers;
- (NSDate)lastUpdate;
- (NSSet)identifiers;
- (int64_t)_activityDelay;
- (int64_t)numberOfUpdates;
- (void)_hasUserConfiguredMailWidget:(id)a3;
- (void)_refreshTimelinesWithReason:(id)a3;
- (void)_restoreFromUserDefaults;
- (void)_runActivity;
- (void)_scheduleActivityWithReason:(id)a3;
- (void)_updateLastUpdateInformation;
- (void)_writeUserDefaults;
- (void)dealloc;
- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4;
- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)setIdentifiers:(id)a3;
- (void)setLastUpdate:(id)a3;
- (void)setNumberOfUpdates:(int64_t)a3;
- (void)setReader:(id)a3;
- (void)setTimelineControllers:(id)a3;
@end

@implementation EDWidgetUpdateController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EDWidgetUpdateController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_103 != -1) {
    dispatch_once(&log_onceToken_103, block);
  }
  v2 = (void *)log_log_103;

  return (OS_os_log *)v2;
}

void __31__EDWidgetUpdateController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_103;
  log_log_103 = (uint64_t)v1;
}

- (EDWidgetUpdateController)initWithWidgetBundleIdentifier:(id)a3 widgetKindIdentifiers:(id)a4 hookRegistry:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)EDWidgetUpdateController;
  v11 = [(EDWidgetUpdateController *)&v23 init];
  if (v11)
  {
    v12 = +[EDWidgetUpdateController log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Waiting for updates", buf, 2u);
    }

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
    identifiers = v11->_identifiers;
    v11->_identifiers = (NSSet *)v13;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __94__EDWidgetUpdateController_initWithWidgetBundleIdentifier_widgetKindIdentifiers_hookRegistry___block_invoke;
    v20[3] = &unk_1E6C04CC8;
    id v21 = v8;
    uint64_t v15 = objc_msgSend(v9, "ef_map:", v20);
    timelineControllers = v11->_timelineControllers;
    v11->_timelineControllers = (NSArray *)v15;

    v17 = (CHSWidgetConfigurationReader *)objc_alloc_init(getCHSWidgetConfigurationReaderClass());
    reader = v11->_reader;
    v11->_reader = v17;

    [v10 registerMessageChangeHookResponder:v11];
    [(EDWidgetUpdateController *)v11 _restoreFromUserDefaults];
    [(EDWidgetUpdateController *)v11 _runActivity];
  }
  return v11;
}

id __94__EDWidgetUpdateController_initWithWidgetBundleIdentifier_widgetKindIdentifiers_hookRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[objc_alloc(getCHSTimelineControllerClass()) initWithExtensionBundleIdentifier:*(void *)(a1 + 32) kind:v3];

  return v4;
}

- (void)dealloc
{
  xpc_activity_unregister((const char *)EDWidgetUpdateActivityIdentifier);
  v3.receiver = self;
  v3.super_class = (Class)EDWidgetUpdateController;
  [(EDWidgetUpdateController *)&v3 dealloc];
}

- (void)_hasUserConfiguredMailWidget:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(EDWidgetUpdateController *)self reader];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke;
  v7[3] = &unk_1E6C07CD8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 allConfiguredWidgetsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2;
  v10[3] = &unk_1E6C07CB0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v7 = v5;
  id v11 = v7;
  id v13 = *(id *)(a1 + 32);
  id v8 = v6;
  id v12 = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v10[0], 3221225472, __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2, &unk_1E6C07CB0);
  [v9 performBlock:v10];

  objc_destroyWeak(&v14);
}

void __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_super v3 = *(void **)(a1 + 32);
    if (v3)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      obuint64_t j = v3;
      uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(obj);
            }
            id v4 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            long long v19 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            id v5 = objc_msgSend(v4, "widgetConfigurations", v15);
            uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
            if (v6)
            {
              uint64_t v7 = *(void *)v20;
              while (2)
              {
                for (uint64_t j = 0; j != v6; ++j)
                {
                  if (*(void *)v20 != v7) {
                    objc_enumerationMutation(v5);
                  }
                  id v9 = *(void **)(*((void *)&v19 + 1) + 8 * j);
                  id v10 = [WeakRetained identifiers];
                  id v11 = [v9 widget];
                  id v12 = [v11 kind];
                  int v13 = [v10 containsObject:v12];

                  if (v13)
                  {
                    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

                    goto LABEL_23;
                  }
                }
                uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
                if (v6) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
        }
        while (v15);
      }
    }
    else
    {
      obuint64_t j = +[EDWidgetUpdateController log];
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        id v14 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
        __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2_cold_1(v14, buf, obj);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_23:
}

- (void)_scheduleActivityWithReason:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke;
  v6[3] = &unk_1E6C07D20;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  [(EDWidgetUpdateController *)self _hasUserConfiguredMailWidget:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke(id *a1, char a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [a1[4] _activityDelay];
    id v4 = +[EDWidgetUpdateController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Schedule activity with %llds delay", buf, 0xCu);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_21;
    aBlock[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
    aBlock[4] = v3;
    id v5 = _Block_copy(aBlock);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_2;
    v7[3] = &unk_1E6C05C68;
    objc_copyWeak(&v9, a1 + 6);
    id v8 = a1[5];
    uint64_t v6 = _Block_copy(v7);
    ef_xpc_activity_register_withcriteria();

    objc_destroyWeak(&v9);
  }
  else
  {
    id v5 = +[EDWidgetUpdateController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Skip widget update - no Mail widgets are configured", buf, 2u);
    }
  }
}

void __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_21(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F14170], *(void *)(a1 + 32));
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F14200]);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
}

void __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _refreshTimelinesWithReason:*(void *)(a1 + 32)];
    if (!xpc_activity_set_state(v3, 5))
    {
      uint64_t v6 = +[EDWidgetUpdateController log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_2_cold_1(v6);
      }
    }
  }
}

- (void)_runActivity
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  ef_xpc_activity_run_if_necessary();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __40__EDWidgetUpdateController__runActivity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshTimelinesWithReason:@"daemonLaunched"];
}

- (int64_t)_activityDelay
{
  int64_t v2 = *MEMORY[0x1E4F14200];
  uint64_t v3 = [(EDWidgetUpdateController *)self lastUpdate];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v5 = [v4 dateByAddingUnit:64 value:10 toDate:v3 options:0];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:600.0];
    }
    id v8 = v7;

    id v9 = [MEMORY[0x1E4F1C9C8] date];
    int v10 = objc_msgSend(v9, "ef_isEarlierThanDate:", v8);

    if (v10) {
      int64_t v2 = *MEMORY[0x1E4F14220];
    }
  }
  return v2;
}

- (void)_refreshTimelinesWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(EDWidgetUpdateController *)self timelineControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) reloadTimelineWithReason:v4];
        objc_msgSend(v5, "ef_addOptionalObject:", v10);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  [(EDWidgetUpdateController *)self _updateLastUpdateInformation];
  if ([v5 count])
  {
    id v11 = +[EDWidgetUpdateController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[EDWidgetUpdateController _refreshTimelinesWithReason:]((uint64_t)v5, v11);
    }
  }
  else
  {
    id v11 = +[EDWidgetUpdateController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v12 = [(EDWidgetUpdateController *)self numberOfUpdates];
      *(_DWORD *)buf = 134217984;
      int64_t v18 = v12;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Successfully updated widget (%ld)", buf, 0xCu);
    }
  }
}

- (void)_updateLastUpdateInformation
{
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [(EDWidgetUpdateController *)self lastUpdate];
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if ([v4 isDateInToday:v3] && objc_msgSend(v4, "isDateInToday:", v6)) {
    int64_t v5 = [(EDWidgetUpdateController *)self numberOfUpdates] + 1;
  }
  else {
    int64_t v5 = 1;
  }
  [(EDWidgetUpdateController *)self setNumberOfUpdates:v5];
  [(EDWidgetUpdateController *)self setLastUpdate:v6];
  [(EDWidgetUpdateController *)self _writeUserDefaults];
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  int64_t v5 = +[EDWidgetUpdateController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Persistence did add messages", v6, 2u);
  }

  [(EDWidgetUpdateController *)self _scheduleActivityWithReason:@"messageAdded"];
}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 hasChanges]
    && (([v6 readChanged] & 1) != 0 || objc_msgSend(v6, "deletedChanged")))
  {
    uint64_t v7 = +[EDWidgetUpdateController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_msgSend(v6, "ef_publicDescription");
      int v11 = 138543362;
      int64_t v12 = v8;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Persistence did change flags: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    [(EDWidgetUpdateController *)self _scheduleActivityWithReason:@"flagChanged"];
  }
  else
  {
    id v9 = +[EDWidgetUpdateController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = objc_msgSend(v6, "ef_publicDescription");
      -[EDWidgetUpdateController persistenceDidChangeFlags:messages:generationWindow:](v10, (uint8_t *)&v11, v9);
    }
  }
}

- (void)_restoreFromUserDefaults
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v9 objectForKey:@"kLastWidgetUpdateDefaultsKey"];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  [(EDWidgetUpdateController *)self setLastUpdate:v4];
  if (!v3) {

  }
  int64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [(EDWidgetUpdateController *)self lastUpdate];
  int v7 = [v5 isDateInToday:v6];

  if (v7)
  {
    uint64_t v8 = [v9 objectForKey:@"kNumberOfWidgetUpdatesDefaultsKey"];
    -[EDWidgetUpdateController setNumberOfUpdates:](self, "setNumberOfUpdates:", [v8 integerValue]);
  }
  else
  {
    [(EDWidgetUpdateController *)self setNumberOfUpdates:0];
  }
}

- (void)_writeUserDefaults
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(EDWidgetUpdateController *)self lastUpdate];
  [v5 setObject:v3 forKey:@"kLastWidgetUpdateDefaultsKey"];

  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[EDWidgetUpdateController numberOfUpdates](self, "numberOfUpdates"));
  [v5 setObject:v4 forKey:@"kNumberOfWidgetUpdatesDefaultsKey"];
}

- (NSArray)timelineControllers
{
  return self->_timelineControllers;
}

- (void)setTimelineControllers:(id)a3
{
}

- (CHSWidgetConfigurationReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
}

- (int64_t)numberOfUpdates
{
  return self->_numberOfUpdates;
}

- (void)setNumberOfUpdates:(int64_t)a3
{
  self->_numberOfUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_reader, 0);

  objc_storeStrong((id *)&self->_timelineControllers, 0);
}

void __57__EDWidgetUpdateController__hasUserConfiguredMailWidget___block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to get widget configuration: %{public}@", buf, 0xCu);
}

void __56__EDWidgetUpdateController__scheduleActivityWithReason___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to set activity to done", v1, 2u);
}

- (void)_refreshTimelinesWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Update timelines failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)persistenceDidChangeFlags:(void *)a1 messages:(uint8_t *)buf generationWindow:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Persistence did change flag which is not relevant: %{public}@", buf, 0xCu);
}

@end