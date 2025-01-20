@interface ATXScoreInterpreterCache
+ (id)sharedInstance;
- (ATXScoreInterpreterCache)init;
- (id)_assetNamesToSkipCaching;
- (id)scoreInterpreterForConsumerSubType:(unsigned __int8)a3;
- (void)dealloc;
- (void)handleMemoryPressureOfType:(unint64_t)a3;
- (void)resetCache;
@end

@implementation ATXScoreInterpreterCache

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_40 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_40, &__block_literal_global_218);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_51;
  return v2;
}

void __42__ATXScoreInterpreterCache_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = objc_alloc_init(ATXScoreInterpreterCache);
  v2 = (void *)sharedInstance__pasExprOnceResult_51;
  sharedInstance__pasExprOnceResult_51 = (uint64_t)v1;
}

- (ATXScoreInterpreterCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXScoreInterpreterCache;
  v2 = [(ATXScoreInterpreterCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cachedInterpreters = v2->_cachedInterpreters;
    v2->_cachedInterpreters = (NSMutableDictionary *)v3;

    v2->_memoryPressureAllowsCaching = 1;
    uint64_t v5 = [MEMORY[0x1E4F4B640] sharedInstance];
    memoryPressureMonitor = v2->_memoryPressureMonitor;
    v2->_memoryPressureMonitor = (ATXMemoryPressureMonitor *)v5;

    [(ATXMemoryPressureMonitor *)v2->_memoryPressureMonitor registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(ATXMemoryPressureMonitor *)self->_memoryPressureMonitor unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)ATXScoreInterpreterCache;
  [(ATXScoreInterpreterCache *)&v3 dealloc];
}

- (id)_assetNamesToSkipCaching
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F27F3960];
  return v2;
}

- (id)scoreInterpreterForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->_cachedInterpreters;
  objc_sync_enter(v5);
  v6 = +[ATXScoreInterpreterFromAssetBuilder assetFilenameForSubType:v3];
  v7 = [(NSMutableDictionary *)self->_cachedInterpreters objectForKeyedSubscript:v6];
  if (v7)
  {
    objc_super v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v18 = 138412546;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%@ - using cached score interpreter with filename: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    v7 = +[ATXScoreInterpreterFromAssetBuilder interpreterFromAssetFilename:v6];
    v11 = [(ATXScoreInterpreterCache *)self _assetNamesToSkipCaching];
    char v12 = [v11 containsObject:v6];

    if ((v12 & 1) != 0 || !self->_memoryPressureAllowsCaching)
    {
      objc_super v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v18 = 138412546;
        v19 = v16;
        __int16 v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%@ - skipping caching of score interpreter with filename: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_cachedInterpreters setObject:v7 forKeyedSubscript:v6];
      objc_super v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        int v18 = 138412546;
        v19 = v14;
        __int16 v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%@ - caching new score interpreter with filename: %@", (uint8_t *)&v18, 0x16u);
      }
    }
  }

  objc_sync_exit(v5);
  return v7;
}

- (void)handleMemoryPressureOfType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->_cachedInterpreters;
  objc_sync_enter(v5);
  if (a3)
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = ATXMemoryPressureTypeToString();
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - received memory pressure notification of type %@, forbidding caching and evicting caches", (uint8_t *)&v14, 0x16u);
    }
    self->_memoryPressureAllowsCaching = 0;
    [(ATXScoreInterpreterCache *)self resetCache];
  }
  else
  {
    v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = ATXMemoryPressureTypeToString();
      int v14 = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%@ - received memory pressure notification of type %@, allowing caching", (uint8_t *)&v14, 0x16u);
    }
    self->_memoryPressureAllowsCaching = 1;
  }
  objc_sync_exit(v5);
}

- (void)resetCache
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_cachedInterpreters;
  objc_sync_enter(v3);
  [(NSMutableDictionary *)self->_cachedInterpreters removeAllObjects];
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - removed all cached interpreters", (uint8_t *)&v7, 0xCu);
  }
  objc_sync_exit(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_cachedInterpreters, 0);
}

@end