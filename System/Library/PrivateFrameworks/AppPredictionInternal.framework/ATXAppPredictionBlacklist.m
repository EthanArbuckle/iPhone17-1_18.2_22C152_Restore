@interface ATXAppPredictionBlacklist
+ (ATXAppPredictionBlacklist)sharedInstance;
- (ATXAppPredictionBlacklist)init;
- (ATXAppPredictionBlacklist)initWithUserDefaults:(id)a3 globals:(id)a4;
- (id)disabledBundleIds;
- (int)registerPrefsChangeHandler:(id)a3;
- (void)_createBlacklistFromPreferencesDisabledApps;
- (void)_listenForUpdates;
- (void)_performMigrationsIfNeeded;
- (void)_resetBlacklistWithSet:(id)a3;
- (void)_updateBlacklist;
- (void)_updateBlacklistFromGlobalsBlacklistedApps;
- (void)dealloc;
- (void)deregisterPrefsChangeHandlerWithToken:(int)a3;
@end

@implementation ATXAppPredictionBlacklist

- (ATXAppPredictionBlacklist)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v5 = +[_ATXGlobals sharedInstance];
  v6 = [(ATXAppPredictionBlacklist *)self initWithUserDefaults:v4 globals:v5];

  return v6;
}

- (ATXAppPredictionBlacklist)initWithUserDefaults:(id)a3 globals:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ATXAppPredictionBlacklist;
  v9 = [(ATXAppPredictionBlacklist *)&v19 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v16 = dispatch_queue_create("ATXAppPredictionBlacklist-notifications", v15);
    notificationQueue = v9->_notificationQueue;
    v9->_notificationQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v9->_globals, a4);
    [(ATXAppPredictionBlacklist *)v9 _performMigrationsIfNeeded];
    [(ATXAppPredictionBlacklist *)v9 _updateBlacklist];
    [(ATXAppPredictionBlacklist *)v9 _listenForUpdates];
  }
  return v9;
}

+ (ATXAppPredictionBlacklist)sharedInstance
{
  if (sharedInstance__pasOnceToken6_14 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_14, &__block_literal_global_96);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_18;
  return (ATXAppPredictionBlacklist *)v2;
}

void __43__ATXAppPredictionBlacklist_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_18;
  sharedInstance__pasExprOnceResult_18 = v1;
}

- (void)dealloc
{
  if (self->_blacklistNotificationToken)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_blacklistNotificationToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXAppPredictionBlacklist;
  [(ATXAppPredictionBlacklist *)&v4 dealloc];
}

- (id)disabledBundleIds
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__46;
  id v10 = __Block_byref_object_dispose__46;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__ATXAppPredictionBlacklist_disabledBundleIds__block_invoke;
  v5[3] = &unk_1E68B0870;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __46__ATXAppPredictionBlacklist_disabledBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 8) copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (int)registerPrefsChangeHandler:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ATXAppPredictionBlacklist_registerPrefsChangeHandler___block_invoke;
  v8[3] = &unk_1E68B0898;
  id v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LODWORD(lock) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)lock;
}

void __56__ATXAppPredictionBlacklist_registerPrefsChangeHandler___block_invoke(uint64_t a1, _DWORD *a2)
{
  int v3 = a2[6];
  a2[6] = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  id v4 = *(const void **)(a1 + 32);
  uint64_t v5 = a2;
  id v8 = _Block_copy(v4);
  id v6 = (void *)v5[2];
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (void)deregisterPrefsChangeHandlerWithToken:(int)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__ATXAppPredictionBlacklist_deregisterPrefsChangeHandlerWithToken___block_invoke;
  v4[3] = &__block_descriptor_36_e32_v16__0__ATXGuardedAppBlacklist_8l;
  int v5 = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

void __67__ATXAppPredictionBlacklist_deregisterPrefsChangeHandlerWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 16);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  [v2 setObject:0 forKeyedSubscript:v3];
}

- (void)_listenForUpdates
{
  objc_initWeak(&location, self);
  if (!self->_blacklistNotificationToken)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke;
    v6[3] = &unk_1E68B08E0;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    id v4 = [v3 addObserverForName:@"com.apple.spotlightui.prefschanged" object:0 queue:0 usingBlock:v6];
    id blacklistNotificationToken = self->_blacklistNotificationToken;
    self->_id blacklistNotificationToken = v4;

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[2];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_2;
    v5[3] = &unk_1E68AB870;
    v5[4] = *(void *)(a1 + 32);
    void v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

void __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 40) _updateBlacklist];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  dispatch_queue_t v16 = __Block_byref_object_copy__46;
  v17 = __Block_byref_object_dispose__46;
  id v18 = 0;
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_35;
  v12[3] = &unk_1E68B0870;
  v12[4] = &v13;
  [v3 runWithLockAcquired:v12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  ATXUpdatePredictionsImmediatelyWithReason(13);
  _Block_object_dispose(&v13, 8);
}

uint64_t __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_35(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 16) allValues];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (void)_createBlacklistFromPreferencesDisabledApps
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__ATXAppPredictionBlacklist__createBlacklistFromPreferencesDisabledApps__block_invoke;
  v3[3] = &unk_1E68B0908;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __72__ATXAppPredictionBlacklist__createBlacklistFromPreferencesDisabledApps__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  uint64_t v6 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  long long v9 = v8;

  uint64_t v10 = [v3 initWithArray:v9];
  long long v11 = (void *)v2[1];
  v2[1] = v10;

  uint64_t v12 = __atxlog_handle_default();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (objc_class *)objc_opt_class();
    int v14 = NSStringFromClass(v13);
    uint64_t v15 = (void *)v2[1];
    int v25 = 138412546;
    v26 = v14;
    __int16 v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%@ - apps that cannot be suggested: %@", (uint8_t *)&v25, 0x16u);
  }
  dispatch_queue_t v16 = __atxlog_handle_default();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __72__ATXAppPredictionBlacklist__createBlacklistFromPreferencesDisabledApps__block_invoke_cold_1();
  }

  v17 = __atxlog_handle_default();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = (objc_class *)objc_opt_class();
    objc_super v19 = NSStringFromClass(v18);
    uint64_t v20 = (void *)CFPreferencesCopyValue(@"SBSearchDisabledApps", @"com.apple.spotlightui", v4, v5);
    v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v22 = [MEMORY[0x1E4F1C978] array];
    }
    v23 = v22;

    v24 = [MEMORY[0x1E4F1CA80] setWithArray:v23];

    int v25 = 138412546;
    v26 = v19;
    __int16 v27 = 2112;
    v28 = v24;
    _os_log_debug_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEBUG, "%@ - apps that cannot show in search: %@", (uint8_t *)&v25, 0x16u);
  }
}

- (void)_updateBlacklistFromGlobalsBlacklistedApps
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__ATXAppPredictionBlacklist__updateBlacklistFromGlobalsBlacklistedApps__block_invoke;
  v3[3] = &unk_1E68B0908;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __71__ATXAppPredictionBlacklist__updateBlacklistFromGlobalsBlacklistedApps__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = a1 + 32;
  uint64_t v6 = objc_msgSend(*(id *)(v5 + 40), "blacklistedAppsForAppPredictions", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        [v3[1] addObject:*(void *)(*((void *)&v16 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }

  long long v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    id v14 = v3[1];
    *(_DWORD *)buf = 138412546;
    v21 = v13;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "%@ - updated suggest app blacklist: %@", buf, 0x16u);
  }
  uint64_t v15 = __atxlog_handle_default();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __71__ATXAppPredictionBlacklist__updateBlacklistFromGlobalsBlacklistedApps__block_invoke_cold_1(v4);
  }
}

- (void)_updateBlacklist
{
  [(ATXAppPredictionBlacklist *)self _createBlacklistFromPreferencesDisabledApps];
  [(ATXAppPredictionBlacklist *)self _updateBlacklistFromGlobalsBlacklistedApps];
}

- (void)_performMigrationsIfNeeded
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "%@ - ShowInSearchToSuggestOnHomeScreenMigration was previously performed", v4, v5, v6, v7, 2u);
}

- (void)_resetBlacklistWithSet:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ATXAppPredictionBlacklist__resetBlacklistWithSet___block_invoke;
  v7[3] = &unk_1E68B0908;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __52__ATXAppPredictionBlacklist__resetBlacklistWithSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  uint64_t v4 = [v2 mutableCopy];
  id v5 = (id)v3[1];
  v3[1] = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globals, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong(&self->_blacklistNotificationToken, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __46__ATXAppPredictionBlacklist__listenForUpdates__block_invoke_2_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "%@ - received Spotlight blacklist update notification", v4, v5, v6, v7, 2u);
}

void __72__ATXAppPredictionBlacklist__createBlacklistFromPreferencesDisabledApps__block_invoke_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  id v8 = ATXAppsThatCannotShowContentInSearch();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - apps that cannot show content in search: %@", v4, v5, v6, v7, 2u);
}

void __71__ATXAppPredictionBlacklist__updateBlacklistFromGlobalsBlacklistedApps__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v10 = [*(id *)(*(void *)a1 + 40) blacklistedAppsForAppPredictions];
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v4, v5, "%@ - global blacklisted apps: %@", v6, v7, v8, v9, 2u);
}

@end