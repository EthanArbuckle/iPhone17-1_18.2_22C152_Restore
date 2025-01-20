@interface FPDCacheDeleteServiceForTesting
+ (id)testingInstance;
- (void)registerCacheDeleteCallbacks;
@end

@implementation FPDCacheDeleteServiceForTesting

+ (id)testingInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FPDCacheDeleteServiceForTesting_testingInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (testingInstance_once != -1) {
    dispatch_once(&testingInstance_once, block);
  }
  v2 = *(void **)(testingInstance_testingInstance + 8);
  *(void *)(testingInstance_testingInstance + 8) = @"com.apple.FileProvider.cache-delete-testing";

  v3 = (void *)testingInstance_testingInstance;
  return v3;
}

uint64_t __50__FPDCacheDeleteServiceForTesting_testingInstance__block_invoke(uint64_t a1)
{
  testingInstance_testingInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (void)registerCacheDeleteCallbacks
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __63__FPDCacheDeleteServiceForTesting_registerCacheDeleteCallbacks__block_invoke;
  v8 = &unk_1E6A74C30;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1D9471EC0](&v5);
  v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"CACHE_DELETE_CACHE_ENABLED", 0, v5, v6, v7, v8);
  v11 = @"CACHE_DELETE_NOTIFICATIONS";
  v12[0] = v3;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  if (CacheDeleteRegisterForProcess())
  {
    v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FPDCacheDeleteService registerCacheDeleteCallbacks]();
    }
  }
  else
  {
    v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[FPDCacheDeleteService registerCacheDeleteCallbacks]();
    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__FPDCacheDeleteServiceForTesting_registerCacheDeleteCallbacks__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [a2 objectForKey:@"CACHE_DELETE_CACHE_ENABLED"];
    int v5 = [v4 BOOLValue];

    uint64_t v6 = (NSObject **)WeakRetained;
    objc_sync_enter(v6);
    if (*((unsigned __int8 *)v6 + 32) != v5)
    {
      *((unsigned char *)v6 + 32) = v5;
      v7 = v6[3];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__FPDCacheDeleteServiceForTesting_registerCacheDeleteCallbacks__block_invoke_2;
      block[3] = &unk_1E6A73FE8;
      id v9 = v6;
      dispatch_async(v7, block);
    }
    objc_sync_exit(v6);
  }
}

void __63__FPDCacheDeleteServiceForTesting_registerCacheDeleteCallbacks__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allValues", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

@end