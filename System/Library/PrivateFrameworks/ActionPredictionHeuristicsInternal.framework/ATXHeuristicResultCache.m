@interface ATXHeuristicResultCache
+ (ATXHeuristicResultCache)sharedInstance;
+ (id)sharedPassLibrary;
- (ATXHeuristicResultCache)init;
- (BOOL)isFocusModeActiveWithError:(id *)a3;
- (id)_internExpirerLocked:(id)a3;
- (id)firstExpirationDate;
- (id)heuristicsCached;
- (id)objectForKey:(id)a3 found:(BOOL *)a4;
- (unint64_t)count;
- (void)_expire:(id)a3 postNotification:(BOOL)a4;
- (void)_handleFocusStateUpdate:(id)a3;
- (void)_observeUserFocusChanges;
- (void)dealloc;
- (void)expire:(id)a3;
- (void)expireAll;
- (void)setObject:(id)a3 expirers:(id)a4 forKey:(id)a5;
@end

@implementation ATXHeuristicResultCache

- (id)heuristicsCached
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_cache allKeys];
  pthread_mutex_unlock(p_lock);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];

  return v5;
}

uint64_t __31__ATXHeuristicResultCache_init__block_invoke_188(uint64_t a1)
{
  v2 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31__ATXHeuristicResultCache_init__block_invoke_188_cold_1();
  }

  return [*(id *)(a1 + 32) expireAll];
}

- (void)expireAll
{
  v3 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0F43000, v3, OS_LOG_TYPE_DEFAULT, "Expiring all heuristics", v7, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  v4 = (NSMutableDictionary *)objc_opt_new();
  cache = self->_cache;
  self->_cache = v4;

  pthread_mutex_unlock(&self->_lock);
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"com.apple.duetexpertd.heuristic.cache-expired" object:self];
}

+ (ATXHeuristicResultCache)sharedInstance
{
  if (sharedInstance__pasOnceToken11 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken11, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_0;

  return (ATXHeuristicResultCache *)v2;
}

- (BOOL)isFocusModeActiveWithError:(id *)a3
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  cachedIsFocusActiveState = self->_cachedIsFocusActiveState;
  if (!cachedIsFocusActiveState)
  {
    [(ATXHeuristicResultCache *)self _observeUserFocusChanges];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    id v22 = 0;
    v7 = BiomeLibrary();
    v8 = [v7 UserFocus];
    v9 = [v8 ComputedMode];
    v10 = objc_msgSend(v9, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1F27274B8, &unk_1F27274B8, 0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke;
    v16[3] = &unk_1E68A51B0;
    v16[4] = &v17;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke_199;
    v15[3] = &unk_1E68A51D8;
    v15[4] = self;
    id v11 = (id)[v10 sinkWithCompletion:v16 receiveInput:v15];

    v12 = (void *)v18[5];
    if (v12 && *a3) {
      *a3 = v12;
    }
    _Block_object_dispose(&v17, 8);

    cachedIsFocusActiveState = self->_cachedIsFocusActiveState;
  }
  BOOL v13 = [(NSNumber *)cachedIsFocusActiveState BOOLValue];
  pthread_mutex_unlock(p_lock);
  return v13;
}

- (void)_observeUserFocusChanges
{
  if (!self->_focusSink)
  {
    objc_initWeak(&location, self);
    v3 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"ATXHeuristicResultCache.UserFocus" targetQueue:self->_notificationQueue];
    focusScheduler = self->_focusScheduler;
    self->_focusScheduler = v3;

    v5 = BiomeLibrary();
    v6 = [v5 UserFocus];
    v7 = [v6 ComputedMode];
    v8 = objc_msgSend(v7, "atx_DSLPublisher");
    v9 = [v8 subscribeOn:self->_focusScheduler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke_196;
    v12[3] = &unk_1E68A5128;
    objc_copyWeak(&v13, &location);
    v10 = [v9 sinkWithCompletion:&__block_literal_global_195 receiveInput:v12];
    focusSink = self->_focusSink;
    self->_focusSink = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    v5 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke_cold_1(v3);
    }

    uint64_t v6 = [v3 error];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __41__ATXHeuristicResultCache_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F43D0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;
}

- (ATXHeuristicResultCache)init
{
  v25.receiver = self;
  v25.super_class = (Class)ATXHeuristicResultCache;
  v2 = [(ATXHeuristicResultCache *)&v25 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
    expirerInternTable = v2->_expirerInternTable;
    v2->_expirerInternTable = (NSHashTable *)v5;

    pthread_mutex_init(&v2->_lock, 0);
    uint64_t v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(Name, v9);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v10;

    v12 = v2->_notificationQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __31__ATXHeuristicResultCache_init__block_invoke;
    handler[3] = &unk_1E68A5188;
    id v13 = v2;
    v24 = v13;
    notify_register_dispatch("com.apple.duet.expertcenter.appRefresh", &v2->_appRefreshToken, v12, handler);
    p_significantTimeToken = &v13->_significantTimeToken;
    v15 = v2->_notificationQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __31__ATXHeuristicResultCache_init__block_invoke_186;
    v21[3] = &unk_1E68A5188;
    v16 = v13;
    id v22 = v16;
    notify_register_dispatch("SignificantTimeChangeNotification", p_significantTimeToken, v15, v21);
    uint64_t v17 = v2->_notificationQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __31__ATXHeuristicResultCache_init__block_invoke_188;
    v19[3] = &unk_1E68A5188;
    v20 = v16;
    notify_register_dispatch("com.apple.suggestions.settingsChanged", v16 + 32, v17, v19);
  }
  return v2;
}

uint64_t __31__ATXHeuristicResultCache_init__block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31__ATXHeuristicResultCache_init__block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) expireAll];
}

uint64_t __31__ATXHeuristicResultCache_init__block_invoke_186(uint64_t a1)
{
  v2 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31__ATXHeuristicResultCache_init__block_invoke_186_cold_1();
  }

  return [*(id *)(a1 + 32) expireAll];
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  notify_cancel(self->_appRefreshToken);
  notify_cancel(self->_significantTimeToken);
  notify_cancel(self->_learnRefreshToken);
  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicResultCache;
  [(ATXHeuristicResultCache *)&v3 dealloc];
}

void __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke_cold_1(v2);
    }
  }
}

void __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke_196(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_super v3 = [v6 eventBody];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v5 = [v6 eventBody];
    [WeakRetained _handleFocusStateUpdate:v5];
  }
}

- (void)_handleFocusStateUpdate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_INFO, "Biome user focus computed mode stream received an update: %@", (uint8_t *)&v9, 0xCu);
  }

  pthread_mutex_lock(&self->_lock);
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "starting"));
  id v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cachedIsFocusActiveState = self->_cachedIsFocusActiveState;
  self->_cachedIsFocusActiveState = v6;

  pthread_mutex_unlock(&self->_lock);
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"DNDStateChanged" object:self];
}

void __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke_199(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_super v3 = [v9 eventBody];

  if (v3)
  {
    id v4 = NSNumber;
    uint64_t v5 = [v9 eventBody];
    uint64_t v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "starting"));
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = v6;
  }
}

+ (id)sharedPassLibrary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPassLibrary_onceToken != -1) {
    dispatch_once(&sharedPassLibrary_onceToken, block);
  }
  id v2 = (void *)sharedPassLibrary_passLibrary;

  return v2;
}

void __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  objc_super v3 = (void *)sharedPassLibrary_passLibrary;
  sharedPassLibrary_passLibrary = v2;

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = *MEMORY[0x1E4F87558];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke_2;
  v8[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v8[4] = *(void *)(a1 + 32);
  id v6 = (id)[v4 addObserverForName:v5 object:sharedPassLibrary_passLibrary queue:0 usingBlock:v8];

  uint64_t v7 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke_cold_1();
  }
}

void __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    uint64_t v7 = sharedPassLibrary_passLibrary;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D0F43000, v4, OS_LOG_TYPE_INFO, "PKPassLibrary: %@ received a change notification: %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"PassLibraryChanged" object:*(void *)(a1 + 32)];
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  unint64_t v4 = [(NSMutableDictionary *)self->_cache count];
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (void)setObject:(id)a3 expirers:(id)a4 forKey:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  pthread_mutex_lock(&self->_lock);
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = -[ATXHeuristicResultCache _internExpirerLocked:](self, "_internExpirerLocked:", *(void *)(*((void *)&v19 + 1) + 8 * v16), (void)v19);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  v18 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v10];
  if (!v18)
  {
    v18 = [[ATXHeuristicResultCacheEntry alloc] initWithHeuristic:v10 cache:self];
    [(NSMutableDictionary *)self->_cache setObject:v18 forKeyedSubscript:v10];
  }
  -[ATXHeuristicResultCacheEntry setActions:expirers:](v18, "setActions:expirers:", v8, v11, (void)v19);
  pthread_mutex_unlock(&self->_lock);
}

- (id)_internExpirerLocked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_expirerInternTable member:v4];
  int v6 = v5;
  if (!v5)
  {
    [(NSHashTable *)self->_expirerInternTable addObject:v4];
    int v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (id)objectForKey:(id)a3 found:(BOOL *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  pthread_mutex_lock(p_lock);
  id v8 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v7];

  if (v8) {
    id v9 = (void *)v8[3];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  pthread_mutex_unlock(p_lock);
  if (a4) {
    *a4 = v8 != 0;
  }

  return v10;
}

- (id)firstExpirationDate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_expirerInternTable;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_msgSend(v10, "fireDate", (void)v17);
          uint64_t v12 = [v7 earlierDate:v11];
          uint64_t v13 = (void *)v12;
          if (v12) {
            uint64_t v14 = (void *)v12;
          }
          else {
            uint64_t v14 = v11;
          }
          id v15 = v14;

          id v7 = v15;
        }
      }
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  pthread_mutex_unlock(p_lock);

  return v7;
}

- (void)expire:(id)a3
{
}

- (void)_expire:(id)a3 postNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "Expiring %@", (uint8_t *)&v9, 0xCu);
  }

  pthread_mutex_lock(&self->_lock);
  [(NSMutableDictionary *)self->_cache removeObjectForKey:v6];
  pthread_mutex_unlock(&self->_lock);
  if (v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"com.apple.duetexpertd.heuristic.cache-expired" object:self];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_focusSink, 0);
  objc_storeStrong((id *)&self->_focusScheduler, 0);
  objc_storeStrong((id *)&self->_cachedIsFocusActiveState, 0);
  objc_storeStrong((id *)&self->_expirerInternTable, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

void __31__ATXHeuristicResultCache_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Expiring all heuristics after Darwin notification 'com.apple.duet.expertcenter.appRefresh'", v2, v3, v4, v5, v6);
}

void __31__ATXHeuristicResultCache_init__block_invoke_186_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Expiring all heuristics after Darwin notification 'SignificantTimeChangeNotification'", v2, v3, v4, v5, v6);
}

void __31__ATXHeuristicResultCache_init__block_invoke_188_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Expiring all heuristics after Darwin notification com.apple.suggestions.settingsChanged", v2, v3, v4, v5, v6);
}

void __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_0_0(&dword_1D0F43000, v2, v3, "Unable to observe user focus for heuristics: %@", v4, v5, v6, v7, 2u);
}

void __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_0_0(&dword_1D0F43000, v2, v3, "Could not poll current computed mode event: %@", v4, v5, v6, v7, 2u);
}

void __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D0F43000, v0, v1, "Added observer to PKPassLibrary", v2, v3, v4, v5, v6);
}

@end