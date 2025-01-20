@interface ATXPosterConfigurationCache
+ (ATXPosterConfigurationCache)sharedInstance;
- (ATXPosterConfigurationCache)init;
- (ATXPosterConfigurationCache)initWithPath:(id)a3;
- (NSArray)configurations;
- (id)_fetchConfigurationsReadingFromCacheIfNecessaryWithGuardedData:(id)a3;
- (void)_updateLastActiveDatesWithConfigurations:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateConfigurations:(id)a3 completion:(id)a4;
@end

@implementation ATXPosterConfigurationCache

+ (ATXPosterConfigurationCache)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_171);
  }
  v2 = (void *)sharedInstance_cache_0;
  return (ATXPosterConfigurationCache *)v2;
}

uint64_t __45__ATXPosterConfigurationCache_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_cache_0;
  sharedInstance_cache_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXPosterConfigurationCache)init
{
  v3 = [MEMORY[0x1E4F4B650] posterConfigurationCacheFilePath];
  v4 = [(ATXPosterConfigurationCache *)self initWithPath:v3];

  return v4;
}

- (ATXPosterConfigurationCache)initWithPath:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXPosterConfigurationCache;
  v5 = [(ATXPosterConfigurationCache *)&v18 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F4B638]);
      v7 = __atxlog_handle_lock_screen();
      uint64_t v8 = [v6 initWithCacheFilePath:v4 loggingHandle:v7 debugName:@"Poster configuration cache"];
      fileCache = v5->_fileCache;
      v5->_fileCache = (ATXGenericFileBasedCache *)v8;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.proactive.ATXPosterConfigurationCache.Output", v14);
    outputQueue = v5->_outputQueue;
    v5->_outputQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (NSArray)configurations
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__80;
  id v10 = __Block_byref_object_dispose__80;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ATXPosterConfigurationCache_configurations__block_invoke;
  v5[3] = &unk_1E68B3E08;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __45__ATXPosterConfigurationCache_configurations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _fetchConfigurationsReadingFromCacheIfNecessaryWithGuardedData:v4];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = (void *)v4[1];
  uint64_t v8 = [v7 copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void *)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  return MEMORY[0x1F41817F8](v8, v10);
}

- (void)updateConfigurations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__ATXPosterConfigurationCache_updateConfigurations_completion___block_invoke;
  v11[3] = &unk_1E68B3E58;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v11];
}

void __63__ATXPosterConfigurationCache_updateConfigurations_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] _fetchConfigurationsReadingFromCacheIfNecessaryWithGuardedData:v3];
  id v5 = a1[5];
  id v6 = (void *)*((void *)a1[4] + 1);
  id v22 = 0;
  [v6 storeSecureCodedObject:v5 error:&v22];
  id v7 = v22;
  objc_storeStrong(v3 + 1, a1[5]);
  if ([a1[5] count]) {
    [a1[4] _updateLastActiveDatesWithConfigurations:a1[5]];
  }
  uint64_t v8 = (void *)[v3[2] copy];
  id v9 = (void *)[a1[5] copy];
  id v10 = *((void *)a1[4] + 3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__ATXPosterConfigurationCache_updateConfigurations_completion___block_invoke_2;
  v16[3] = &unk_1E68B3E30;
  id v11 = a1[6];
  id v20 = v4;
  id v21 = v11;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v12 = v4;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v10, v16);
}

void __63__ATXPosterConfigurationCache_updateConfigurations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "configurationCacheDidUpdateWithNewConfigurations:oldConfigurations:", *(void *)(a1 + 48), *(void *)(a1 + 56), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_fetchConfigurationsReadingFromCacheIfNecessaryWithGuardedData:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = (void *)v4[1];
  if (v5)
  {
    uint64_t v6 = (void *)[v5 copy];
  }
  else
  {
    fileCache = self->_fileCache;
    long long v8 = (void *)MEMORY[0x1D25F6CC0]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    long long v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v6 = [(ATXGenericFileBasedCache *)fileCache readSecureCodedObjectWithMaxValidAge:v11 allowableClasses:0 error:2419200.0];
  }
  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ATXPosterConfigurationCache_registerObserver___block_invoke;
  v7[3] = &unk_1E68B3E80;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __48__ATXPosterConfigurationCache_registerObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) addObject:*(void *)(a1 + 32)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ATXPosterConfigurationCache_unregisterObserver___block_invoke;
  v7[3] = &unk_1E68B3E80;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __50__ATXPosterConfigurationCache_unregisterObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) removeObject:*(void *)(a1 + 32)];
}

- (void)_updateLastActiveDatesWithConfigurations:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v34 = v3;
  uint64_t v5 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_29_2);
  id v6 = (void *)[v4 initWithArray:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v8 = (void *)[v7 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v35 = *MEMORY[0x1E4F4B760];
  v36 = v8;
  id v9 = objc_msgSend(v8, "dictionaryForKey:");
  uint64_t v10 = (void *)[v9 mutableCopy];
  long long v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  uint64_t v13 = v12;

  id v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v15 = objc_opt_new();
  v16 = [v14 dateByAddingUnit:16 value:-7 toDate:v15 options:0];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v17 = [v13 allKeys];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v23 = [v13 objectForKeyedSubscript:v22];
        uint64_t v24 = [v16 compare:v23];
        if ([v6 containsObject:v22]) {
          BOOL v25 = v24 == -1;
        }
        else {
          BOOL v25 = 0;
        }
        if (!v25) {
          [v13 setObject:0 forKeyedSubscript:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v19);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v26 = v34;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        if ([v31 isActive])
        {
          v32 = objc_opt_new();
          v33 = [v31 posterUUID];
          [v13 setObject:v32 forKeyedSubscript:v33];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v28);
  }

  [v36 setObject:v13 forKey:v35];
}

uint64_t __72__ATXPosterConfigurationCache__updateLastActiveDatesWithConfigurations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 posterUUID];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_fileCache, 0);
}

@end