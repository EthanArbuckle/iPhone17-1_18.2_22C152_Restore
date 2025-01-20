@interface ATXRecentActionEngagementCache
+ (id)sharedInstance;
- (ATXRecentActionEngagementCache)init;
- (ATXRecentActionEngagementCache)initWithCacheDirectory:(id)a3;
- (id)_getAllCachedActionsNoSync;
- (id)_recentActionsNoSyncForCacheAtPath:(id)a3;
- (id)exceptionsFoundInCacheAtPath:(id)a3 forCandidateExceptions:(id)a4;
- (id)recentActions;
- (void)_addEngagedActionNoSync:(id)a3 toCacheAtPath:(id)a4;
- (void)_addEngagedActionSetNoSync:(id)a3 toCacheAtPath:(id)a4;
- (void)_serializeAndWriteNoSyncActionSet:(id)a3 toCacheAtPath:(id)a4;
- (void)addEngagedAction:(id)a3;
- (void)clearRecentEngagements;
- (void)clearRecentEngagementsFromCacheAtPath:(id)a3 withExceptionActions:(id)a4;
- (void)clearRecentHeuristicEngagementsExceptForActions:(id)a3;
- (void)clearRecentMLEngagementsExceptForActions:(id)a3;
@end

@implementation ATXRecentActionEngagementCache

- (ATXRecentActionEngagementCache)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  v4 = [(ATXRecentActionEngagementCache *)self initWithCacheDirectory:v3];

  return v4;
}

- (ATXRecentActionEngagementCache)initWithCacheDirectory:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXRecentActionEngagementCache;
  v5 = [(ATXRecentActionEngagementCache *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByAppendingPathComponent:@"ATXRecentMLActions"];
    recentMLEngagementCachePath = v5->_recentMLEngagementCachePath;
    v5->_recentMLEngagementCachePath = (NSString *)v6;

    uint64_t v8 = [v4 stringByAppendingPathComponent:@"ATXRecentHeuristicActions"];
    recentHeuristicEngagementCachePath = v5->_recentHeuristicEngagementCachePath;
    v5->_recentHeuristicEngagementCachePath = (NSString *)v8;

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;
  }
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_4 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_4, &__block_literal_global_29);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_5;

  return v2;
}

void __48__ATXRecentActionEngagementCache_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5;
  sharedInstance__pasExprOnceResult_5 = v1;
}

- (id)recentActions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ATXRecentActionEngagementCache_recentActions__block_invoke;
  v5[3] = &unk_1E5D06DE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __47__ATXRecentActionEngagementCache_recentActions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getAllCachedActionsNoSync];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)addEngagedAction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ATXRecentActionEngagementCache_addEngagedAction___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __51__ATXRecentActionEngagementCache_addEngagedAction___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isHeuristic];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = 8;
  if (v2) {
    uint64_t v4 = 16;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + v4);
  id v6 = *(void **)(a1 + 40);

  return [v6 _addEngagedActionNoSync:v3 toCacheAtPath:v5];
}

- (void)clearRecentEngagements
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke;
  block[3] = &unk_1E5D05300;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = 0;
  [v2 removeItemAtPath:v3 error:&v11];
  id v4 = v11;

  if (v4)
  {
    uint64_t v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke_cold_2();
    }
  }
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
  id v10 = 0;
  [v6 removeItemAtPath:v7 error:&v10];
  id v8 = v10;

  if (v8)
  {
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke_cold_1();
    }
  }
}

- (void)clearRecentMLEngagementsExceptForActions:(id)a3
{
}

- (void)clearRecentHeuristicEngagementsExceptForActions:(id)a3
{
}

- (id)_getAllCachedActionsNoSync
{
  uint64_t v3 = [(ATXRecentActionEngagementCache *)self _recentActionsNoSyncForCacheAtPath:self->_recentMLEngagementCachePath];
  id v4 = [(ATXRecentActionEngagementCache *)self _recentActionsNoSyncForCacheAtPath:self->_recentHeuristicEngagementCachePath];
  uint64_t v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (id)_recentActionsNoSyncForCacheAtPath:(id)a3
{
  id v3 = a3;
  id v20 = 0;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:0 error:&v20];
  id v5 = v20;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = (void *)MEMORY[0x1AD0D3C30]();
    id v8 = (void *)MEMORY[0x1E4F28DC0];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    id v19 = v6;
    v12 = [v8 unarchivedObjectOfClasses:v11 fromData:v4 error:&v19];
    id v13 = v19;

    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      objc_super v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:]();
      }

      id v14 = (id)objc_opt_new();
    }
    v16 = v14;

    id v6 = v13;
  }
  else
  {
    if ([v5 code] != 260)
    {
      v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:]();
      }
    }
    v16 = objc_opt_new();
  }

  return v16;
}

- (void)_addEngagedActionSetNoSync:(id)a3 toCacheAtPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && [v8 count])
  {
    uint64_t v7 = [(ATXRecentActionEngagementCache *)self _recentActionsNoSyncForCacheAtPath:v6];
    [v7 unionSet:v8];
    [(ATXRecentActionEngagementCache *)self _serializeAndWriteNoSyncActionSet:v7 toCacheAtPath:v6];
  }
}

- (void)_addEngagedActionNoSync:(id)a3 toCacheAtPath:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(ATXRecentActionEngagementCache *)self _recentActionsNoSyncForCacheAtPath:v6];
    [v8 addObject:v7];

    [(ATXRecentActionEngagementCache *)self _serializeAndWriteNoSyncActionSet:v8 toCacheAtPath:v6];
  }
}

- (void)_serializeAndWriteNoSyncActionSet:(id)a3 toCacheAtPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1AD0D3C30]();
  id v8 = (void *)MEMORY[0x1AD0D3C30]();
  id v12 = 0;
  v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
  id v10 = v12;
  if (v9)
  {
    [v9 writeToFile:v6 atomically:1];
  }
  else
  {
    id v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXRecentActionEngagementCache _serializeAndWriteNoSyncActionSet:toCacheAtPath:]();
    }
  }
}

- (id)exceptionsFoundInCacheAtPath:(id)a3 forCandidateExceptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = [(ATXRecentActionEngagementCache *)self _recentActionsNoSyncForCacheAtPath:v6];
    [v8 intersectSet:v7];
  }
  else
  {
    id v8 = objc_opt_new();
  }

  return v8;
}

- (void)clearRecentEngagementsFromCacheAtPath:(id)a3 withExceptionActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__ATXRecentActionEngagementCache_clearRecentEngagementsFromCacheAtPath_withExceptionActions___block_invoke;
  block[3] = &unk_1E5D05D78;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __93__ATXRecentActionEngagementCache_clearRecentEngagementsFromCacheAtPath_withExceptionActions___block_invoke(id *a1)
{
  if ([a1[4] count])
  {
    id v3 = [a1[6] exceptionsFoundInCacheAtPath:a1[5] forCandidateExceptions:a1[4]];
    if ([v3 count]) {
      [a1[6] _serializeAndWriteNoSyncActionSet:v3 toCacheAtPath:a1[5]];
    }
    else {
      removeCacheFile(a1[5]);
    }
  }
  else
  {
    id v2 = a1[5];
    removeCacheFile(v2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recentHeuristicEngagementCachePath, 0);

  objc_storeStrong((id *)&self->_recentMLEngagementCachePath, 0);
}

void __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to remove heuristics recent engagement cache file. Error: %@", v2, v3, v4, v5, v6);
}

void __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to remove ML recent engagement cache file. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_recentActionsNoSyncForCacheAtPath:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A790D000, v1, OS_LOG_TYPE_ERROR, "Error reading %@: %@", v2, 0x16u);
}

- (void)_recentActionsNoSyncForCacheAtPath:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to get recent actions: %@", v2, v3, v4, v5, v6);
}

- (void)_serializeAndWriteNoSyncActionSet:toCacheAtPath:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to serialize recent engagements. Error: %@", v2, v3, v4, v5, v6);
}

@end