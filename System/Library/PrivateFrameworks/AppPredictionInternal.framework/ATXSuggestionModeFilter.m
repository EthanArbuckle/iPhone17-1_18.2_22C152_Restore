@interface ATXSuggestionModeFilter
+ (ATXSuggestionModeFilter)sharedInstance;
- (ATXSuggestionModeFilter)init;
- (BOOL)currentModeConfigurationAllowsBundleId:(id)a3;
- (BOOL)currentModeConfigurationAllowsSuggestion:(id)a3;
- (void)_updateConfigurationWithModeUUID:(id)a3 notifyingObservers:(BOOL)a4;
- (void)registerForModeChanges;
- (void)registerObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation ATXSuggestionModeFilter

+ (ATXSuggestionModeFilter)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_79);
  }
  v2 = (void *)sharedInstance_filter;
  return (ATXSuggestionModeFilter *)v2;
}

uint64_t __41__ATXSuggestionModeFilter_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_filter;
  sharedInstance_filter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXSuggestionModeFilter)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATXSuggestionModeFilter;
  v2 = [(ATXSuggestionModeFilter *)&v12 init];
  if (v2)
  {
    v3 = objc_opt_new();
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    v5 = (void *)v3[1];
    v3[1] = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v6;

    uint64_t v8 = [MEMORY[0x1E4F4AF78] sharedInstance];
    client = v2->_client;
    v2->_client = (ATXDNDModeConfigurationClient *)v8;

    v10 = [MEMORY[0x1E4F93650] currentModeUUID];
    [(ATXSuggestionModeFilter *)v2 _updateConfigurationWithModeUUID:v10 notifyingObservers:0];
  }
  return v2;
}

- (void)registerForModeChanges
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.proactive.ATXSuggestionModeFilter.events", v3);
  queue = self->_queue;
  self->_queue = v4;

  uint64_t v6 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"ATXSuggestionModeFilter" targetQueue:self->_queue];
  scheduler = self->_scheduler;
  self->_scheduler = v6;

  objc_initWeak(&location, self);
  uint64_t v8 = BiomeLibrary();
  v9 = [v8 UserFocus];
  v10 = [v9 ComputedMode];
  v11 = objc_msgSend(v10, "atx_DSLPublisher");

  objc_super v12 = [v11 subscribeOn:self->_scheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_31;
  v15[3] = &unk_1E68AE228;
  objc_copyWeak(&v16, &location);
  v13 = [v12 sinkWithCompletion:&__block_literal_global_30 receiveInput:v15];
  sink = self->_sink;
  self->_sink = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    uint64_t v4 = __atxlog_handle_blending();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_cold_1(v2);
    }
  }
}

void __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  int v5 = [v4 starting];

  if (!v5)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  v7 = [v3 eventBody];
  uint64_t v8 = [v7 mode];
  v9 = (void *)[v6 initWithUUIDString:v8];

  if (!v9)
  {
    v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_31_cold_1(v3);
    }

    goto LABEL_6;
  }
LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateConfigurationWithModeUUID:v9 notifyingObservers:1];
}

- (BOOL)currentModeConfigurationAllowsBundleId:(id)a3
{
  uint64_t v4 = ATXBundleIdReplacementForBundleId();
  if (ATXBundleIdIsFakeContainerBundleId())
  {
    int v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ATXSuggestionModeFilter currentModeConfigurationAllowsBundleId:]();
    }

    BOOL v6 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__ATXSuggestionModeFilter_currentModeConfigurationAllowsBundleId___block_invoke;
    v9[3] = &unk_1E68AFC30;
    id v10 = v4;
    v11 = &v12;
    [(_PASLock *)lock runWithLockAcquired:v9];
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __66__ATXSuggestionModeFilter_currentModeConfigurationAllowsBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)v3[2];
  if (v4)
  {
    if ([v4 exceptionForApplication:*(void *)(a1 + 32)])
    {
      int v5 = __atxlog_handle_blending();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v14 = 138412290;
        uint64_t v15 = v6;
        _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: filtering out disallowed bundleId %@", (uint8_t *)&v14, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __66__ATXSuggestionModeFilter_currentModeConfigurationAllowsBundleId___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (BOOL)currentModeConfigurationAllowsSuggestion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[ATXSuggestionPreprocessor bundleIdAssociatedWithSuggestion:v4];
  if (!v5)
  {
    uint64_t v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ATXSuggestionModeFilter currentModeConfigurationAllowsSuggestion:]();
    }
    goto LABEL_27;
  }
  uint64_t v6 = ATXBundleIdReplacementForBundleId();

  id v7 = v4;
  uint64_t v8 = v6;
  if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
  {
    uint64_t v9 = [MEMORY[0x1E4F938F0] infoSuggestionFromProactiveSuggestion:v7];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 widgetBundleIdentifier];
      if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
      {
        LOBYTE(keyExistsAndHasValidFormat) = 0;
        if (CFPreferencesGetAppBooleanValue(@"ATXWidgetKitDeveloperModeSkipEntitlementCheck", (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)&keyExistsAndHasValidFormat))
        {

          goto LABEL_11;
        }
        int v12 = [MEMORY[0x1E4F4AEF8] isDebuggingAllowedForExtensionBundleId:v11];

        if (v12)
        {
LABEL_11:
          uint64_t v13 = __atxlog_handle_blending();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(keyExistsAndHasValidFormat) = 138412290;
            *(void *)((char *)&keyExistsAndHasValidFormat + 4) = v7;
            _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: WidgetKit Developer Mode is enabled and debugging is allowed for widget, allowing suggestion: %@", (uint8_t *)&keyExistsAndHasValidFormat, 0xCu);
          }
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
  }
  if (ATXBundleIdIsFakeContainerBundleId())
  {
LABEL_23:

LABEL_24:
    v27 = __atxlog_handle_blending();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[ATXSuggestionModeFilter currentModeConfigurationAllowsSuggestion:]();
    }

LABEL_27:
    BOOL v26 = 1;
    goto LABEL_28;
  }
  id v10 = v7;
  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v15 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:3];
  *(void *)&long long keyExistsAndHasValidFormat = v15;
  uint64_t v16 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:4];
  *((void *)&keyExistsAndHasValidFormat + 1) = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&keyExistsAndHasValidFormat count:2];
  v18 = (void *)[v14 initWithArray:v17];

  v19 = [v10 clientModelSpecification];
  v20 = [v19 clientModelId];
  LOBYTE(v16) = [v18 containsObject:v20];

  if (v16)
  {
    v21 = [v10 atxActionExecutableObject];
    uint64_t v13 = [v21 intent];

    v22 = [v13 extensionBundleId];
    if (![v22 isEqualToString:@"com.apple.DoNotDisturb.Intents"])
    {

LABEL_22:
      goto LABEL_23;
    }
    v23 = [v13 _className];
    char v24 = [v23 isEqualToString:@"DNDToggleDoNotDisturbIntent"];

    if ((v24 & 1) == 0) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  *(void *)&long long keyExistsAndHasValidFormat = 0;
  *((void *)&keyExistsAndHasValidFormat + 1) = &keyExistsAndHasValidFormat;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  lock = self->_lock;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__ATXSuggestionModeFilter_currentModeConfigurationAllowsSuggestion___block_invoke;
  v29[3] = &unk_1E68AFC58;
  id v30 = v10;
  uint64_t v8 = v8;
  v31 = v8;
  p_long long keyExistsAndHasValidFormat = &keyExistsAndHasValidFormat;
  [(_PASLock *)lock runWithLockAcquired:v29];
  BOOL v26 = *(unsigned char *)(*((void *)&keyExistsAndHasValidFormat + 1) + 24) != 0;

  _Block_object_dispose(&keyExistsAndHasValidFormat, 8);
LABEL_28:

  return v26;
}

void __68__ATXSuggestionModeFilter_currentModeConfigurationAllowsSuggestion___block_invoke(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[2];
  if (!v4)
  {
    uint64_t v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __68__ATXSuggestionModeFilter_currentModeConfigurationAllowsSuggestion___block_invoke_cold_1((uint64_t)a1, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_21:

    goto LABEL_22;
  }
  if (![v4 exceptionForApplication:a1[5]])
  {
    +[ATXSuggestionPreprocessor contactIdsAssociatedWithSuggestion:a1[4]];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v8);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v20 = objc_opt_new();
          objc_msgSend(v20, "setContactIdentifier:", v19, (void)v23);
          if ([v3[2] exceptionForContactHandle:v20])
          {
            v21 = __atxlog_handle_blending();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = a1[4];
              *(_DWORD *)buf = 138412546;
              uint64_t v29 = v19;
              __int16 v30 = 2112;
              uint64_t v31 = v22;
              _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: filtering out disallowed contactId %@ in suggestion: %@", buf, 0x16u);
            }

            *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
            goto LABEL_20;
          }
        }
        uint64_t v16 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  int v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    uint64_t v6 = a1[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v29 = v6;
    __int16 v30 = 2112;
    uint64_t v31 = v7;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: filtering out disallowed bundleId %@ in suggestion: %@", buf, 0x16u);
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
LABEL_22:
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ATXSuggestionModeFilter_registerObserver___block_invoke;
  v7[3] = &unk_1E68AFC80;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __44__ATXSuggestionModeFilter_registerObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ATXSuggestionModeFilter_removeObserver___block_invoke;
  v7[3] = &unk_1E68AFC80;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __42__ATXSuggestionModeFilter_removeObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 8) removeObject:*(void *)(a1 + 32)];
}

- (void)_updateConfigurationWithModeUUID:(id)a3 notifyingObservers:(BOOL)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__ATXSuggestionModeFilter__updateConfigurationWithModeUUID_notifyingObservers___block_invoke;
  v9[3] = &unk_1E68AFCA8;
  id v10 = v6;
  uint64_t v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

void __79__ATXSuggestionModeFilter__updateConfigurationWithModeUUID_notifyingObservers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    uint64_t v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: no current mode", buf, 2u);
    }
    goto LABEL_9;
  }
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "modeConfigurationForDNDModeWithUUID:");
  int v5 = [v4 configuration];

  id v6 = __atxlog_handle_blending();
  uint64_t v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __79__ATXSuggestionModeFilter__updateConfigurationWithModeUUID_notifyingObservers___block_invoke_cold_1((uint64_t *)(a1 + 32), v7);
    }
LABEL_9:
    int v5 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v8;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXSuggestionModeFilter: fetched configuration for mode: %@", buf, 0xCu);
  }
LABEL_10:

  objc_storeStrong(v3 + 2, v5);
  if (*(unsigned char *)(a1 + 48))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v3[1];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "configurationDidChangeForFilter:", *(void *)(a1 + 40), (void)v14);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXSuggestionModeFilter: unable to subscribe to computed mode stream: %@", v4, v5, v6, v7, v8);
}

void __49__ATXSuggestionModeFilter_registerForModeChanges__block_invoke_31_cold_1(void *a1)
{
  uint64_t v1 = [a1 eventBody];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXSuggestionModeFilter: could not create NSUUID from latest mode: %@", v4, v5, v6, v7, v8);
}

- (void)currentModeConfigurationAllowsBundleId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "ATXSuggestionModeFilter: allowing filter exception bundleId: %@", v2, v3, v4, v5, v6);
}

void __66__ATXSuggestionModeFilter_currentModeConfigurationAllowsBundleId___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)currentModeConfigurationAllowsSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "ATXSuggestionModeFilter: allowing suggestion since we are unable to get its bundleId: %@", v2, v3, v4, v5, v6);
}

- (void)currentModeConfigurationAllowsSuggestion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "ATXSuggestionModeFilter: bypassing filter for suggestion: %@", v2, v3, v4, v5, v6);
}

void __68__ATXSuggestionModeFilter_currentModeConfigurationAllowsSuggestion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__ATXSuggestionModeFilter__updateConfigurationWithModeUUID_notifyingObservers___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestionModeFilter: could not fetch configuration for mode: %@", (uint8_t *)&v3, 0xCu);
}

@end