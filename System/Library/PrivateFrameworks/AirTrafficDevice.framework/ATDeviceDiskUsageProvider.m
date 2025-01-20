@interface ATDeviceDiskUsageProvider
+ (id)sharedInstance;
- (ATDeviceDiskUsageProvider)init;
- (id)_cacheDeletePurgeableStorageData;
- (id)_diskUsageForDataClass:(id)a3;
- (id)getCurrentUsage;
- (void)getCurrentUsageWithUpdatedDataClasses:(id)a3 withCompletion:(id)a4;
- (void)getUpdatedUsageWithCompletion:(id)a3;
@end

@implementation ATDeviceDiskUsageProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_clientController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_diskUsageInfo, 0);
}

- (id)_cacheDeletePurgeableStorageData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering purgeable metrics from CacheDelete", (uint8_t *)&v10, 0xCu);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  [MEMORY[0x1E4F79AF8] setAutoFilledTracksArePurgeable:0];
  v6 = (void *)CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
  [MEMORY[0x1E4F79AF8] setAutoFilledTracksArePurgeable:1];
  v7 = _ATLogCategoryFramework_Oversize();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    int v10 = 138543874;
    v11 = self;
    __int16 v12 = 2048;
    double v13 = v8 - v5;
    __int16 v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded purgeable metrics from CacheDelete in %.2fs: %{public}@", (uint8_t *)&v10, 0x20u);
  }

  return v6;
}

- (id)_diskUsageForDataClass:(id)a3
{
  v3 = [(ATClientController *)self->_clientController clientForDataclass:a3];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 installedAssetMetrics];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)getCurrentUsageWithUpdatedDataClasses:(id)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering updated usage metrics for data classes %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke;
  block[3] = &unk_1E6B88AC8;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, block);
}

void __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  v23 = [*(id *)(a1 + 32) _cacheDeletePurgeableStorageData];
  double v4 = dispatch_group_create();
  double v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("com.apple.amp.AirTrafficDevice.ATDeviceDiskUsageProvider.usageUpdateQueue", v5);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = a1;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        dispatch_group_enter(v4);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke_2;
        block[3] = &unk_1E6B88BB8;
        block[4] = *(void *)(v6 + 32);
        void block[5] = v12;
        v28 = v4;
        dispatch_async(queue, block);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v9);
  }

  dispatch_group_enter(v4);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke_13;
  v25[3] = &unk_1E6B88B68;
  uint64_t v13 = v6;
  v25[4] = *(void *)(v6 + 32);
  id v14 = v4;
  v26 = v14;
  dispatch_async(queue, v25);
  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  id v15 = [v23 valueForKey:@"CACHE_DELETE_TOTAL_AVAILABLE"];
  uint64_t v16 = [v15 unsignedLongLongValue];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(v6 + 32) + 32));
  v17 = *(void **)(*(void *)(v6 + 32) + 8);
  __int16 v18 = [NSNumber numberWithUnsignedLongLong:v16];
  [v17 setObject:v18 forKey:@"_PurgeableSize"];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v6 + 32) + 32));
  v19 = (void *)[*(id *)(*(void *)(v6 + 32) + 8) copy];
  [*(id *)(*(void *)(v6 + 32) + 16) setDiskUsageInfo:v19];
  uint64_t v20 = _ATLogCategoryFramework_Oversize();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(v6 + 32);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v21;
    __int16 v35 = 2048;
    double v36 = v22 - v3;
    __int16 v37 = 2114;
    v38 = v19;
    _os_log_impl(&dword_1D9A2D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished gathering storage usage metrics in %.2fs. diskUsageInfo=%{public}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(v13 + 48) + 16))();
}

void __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v3;
    __int16 v14 = 2114;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering usage metrics for data class '%{public}@'", (uint8_t *)&v12, 0x16u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) _diskUsageForDataClass:*(void *)(a1 + 40)];
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKey:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  }
  uint64_t v8 = _ATLogCategoryFramework_Oversize();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    int v12 = 138544130;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    double v17 = v11 - v6;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished gathering usage metrics for data class '%{public}@' in %.2fs. usageInfo=%{public}@", (uint8_t *)&v12, 0x2Au);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke_13(uint64_t a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  double v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = MSVSystemRootDirectory();
  uint64_t v4 = [v2 fileURLWithPath:v3];
  uint64_t v5 = *MEMORY[0x1E4F1C948];
  uint64_t v6 = *MEMORY[0x1E4F1C810];
  v25[0] = *MEMORY[0x1E4F1C948];
  v25[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v18 = 0;
  uint64_t v8 = [v4 resourceValuesForKeys:v7 error:&v18];
  id v9 = v18;

  uint64_t v10 = _ATLogCategoryFramework();
  double v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = objc_msgSend(v9, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      double v22 = v8;
      __int16 v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Finished gathering volume diskUsage=%@ error=%{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    double v22 = v8;
    _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished gathering volume diskUsage=%@", buf, 0x16u);
  }

  uint64_t v15 = [v8 objectForKey:v5];
  uint64_t v16 = [v8 objectForKey:v6];
  double v17 = (void *)v16;
  if (v15 && v16)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v15 forKey:@"_PhysicalSize"];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v17 forKey:@"_FreeSize"];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)getUpdatedUsageWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(NSMutableSet *)self->_usageUpdateCompletionHandlers count];
  usageUpdateCompletionHandlers = self->_usageUpdateCompletionHandlers;
  id v7 = (void *)MEMORY[0x1E016B9C0](v4);
  [(NSMutableSet *)usageUpdateCompletionHandlers addObject:v7];

  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [(ATClientController *)self->_clientController allClients];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) supportedDataclasses];
          if (v14) {
            [v8 addObjectsFromArray:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__ATDeviceDiskUsageProvider_getUpdatedUsageWithCompletion___block_invoke;
    v15[3] = &unk_1E6B887F8;
    v15[4] = self;
    [(ATDeviceDiskUsageProvider *)self getCurrentUsageWithUpdatedDataClasses:v8 withCompletion:v15];
  }
}

void __59__ATDeviceDiskUsageProvider_getUpdatedUsageWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  uint64_t v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 count];
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ invoking %lu completion handlers", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ATDeviceDiskUsageProvider_getUpdatedUsageWithCompletion___block_invoke_7;
  v8[3] = &unk_1E6B88118;
  id v9 = v3;
  id v7 = v3;
  [v4 enumerateObjectsUsingBlock:v8];
}

uint64_t __59__ATDeviceDiskUsageProvider_getUpdatedUsageWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (id)getCurrentUsage
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_diskUsageInfo copy];
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = _ATLogCategoryFramework_Oversize();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ getCurrentUsage=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (ATDeviceDiskUsageProvider)init
{
  v18.receiver = self;
  v18.super_class = (Class)ATDeviceDiskUsageProvider;
  double v2 = [(ATDeviceDiskUsageProvider *)&v18 init];
  if (v2)
  {
    uint64_t v3 = +[ATUserDefaults sharedInstance];
    defaults = v2->_defaults;
    v2->_defaults = (ATUserDefaults *)v3;

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.amp.AirTrafficDevice.ATDeviceDiskUsageProvider.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[ATClientController sharedInstance];
    clientController = v2->_clientController;
    v2->_clientController = (ATClientController *)v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    usageUpdateCompletionHandlers = v2->_usageUpdateCompletionHandlers;
    v2->_usageUpdateCompletionHandlers = (NSMutableSet *)v10;

    __int16 v12 = [(ATUserDefaults *)v2->_defaults diskUsageInfo];
    uint64_t v13 = [v12 mutableCopy];
    diskUsageInfo = v2->_diskUsageInfo;
    v2->_diskUsageInfo = (NSMutableDictionary *)v13;

    if (!v2->_diskUsageInfo)
    {
      uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v16 = v2->_diskUsageInfo;
      v2->_diskUsageInfo = v15;
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2866 != -1) {
    dispatch_once(&sharedInstance_onceToken_2866, &__block_literal_global_2867);
  }
  double v2 = (void *)sharedInstance___sharedInstance_2868;

  return v2;
}

uint64_t __43__ATDeviceDiskUsageProvider_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_2868 = objc_alloc_init(ATDeviceDiskUsageProvider);

  return MEMORY[0x1F41817F8]();
}

@end