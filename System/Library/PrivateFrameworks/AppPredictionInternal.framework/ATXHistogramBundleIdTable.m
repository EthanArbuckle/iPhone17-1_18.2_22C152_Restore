@interface ATXHistogramBundleIdTable
+ (ATXHistogramBundleIdTable)sharedInstance;
+ (void)stopUsingTemporarySharedInstance;
+ (void)useTemporarySharedInstance:(id)a3;
- (ATXHistogramBundleIdTable)initWithDatastore:(id)a3;
- (id)permutationFrom:(id)a3;
- (void)removeBundleIds:(id)a3;
@end

@implementation ATXHistogramBundleIdTable

- (ATXHistogramBundleIdTable)initWithDatastore:(id)a3
{
  return [(ATXHistogramTable *)self initWithDatastore:a3 blobType:0];
}

+ (ATXHistogramBundleIdTable)sharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (ATXHistogramBundleIdTable *)(id)sharedInstance;
  if (!v2)
  {
    v3 = [ATXHistogramBundleIdTable alloc];
    v4 = +[_ATXDataStore sharedInstance];
    v2 = [(ATXHistogramTable *)v3 initWithDatastore:v4 blobType:0];
    objc_storeStrong((id *)&sharedInstance, v2);
  }
  pthread_mutex_unlock(&sharedInstanceLock);
  return v2;
}

+ (void)useTemporarySharedInstance:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&sharedInstanceLock);
  objc_storeStrong((id *)&swappedOutSharedInstance, (id)sharedInstance);
  objc_storeStrong((id *)&sharedInstance, a3);
  pthread_mutex_unlock(&sharedInstanceLock);
}

+ (void)stopUsingTemporarySharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock);
  objc_storeStrong((id *)&sharedInstance, (id)swappedOutSharedInstance);
  v2 = (void *)swappedOutSharedInstance;
  swappedOutSharedInstance = 0;

  pthread_mutex_unlock(&sharedInstanceLock);
}

- (id)permutationFrom:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  __int16 v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke;
  v10[3] = &unk_1E68B2700;
  v10[4] = &v11;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
  ++*((_WORD *)v12 + 12);
  id v5 = objc_alloc(MEMORY[0x1E4F1CA58]);
  id v6 = (id) [v5 initWithLength:2 * *((unsigned __int16 *)v12 + 12)];
  uint64_t v7 = [v6 mutableBytes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke_2;
  v9[3] = &unk_1E68B2728;
  v9[5] = &v11;
  v9[6] = v7;
  v9[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  unsigned int v4 = [v6 unsignedShortValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 > *(unsigned __int16 *)(v5 + 24)) {
    *(_WORD *)(v5 + 24) = v4;
  }
}

void __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = [v6 unsignedShortValue];
  uint64_t v8 = a1 + 40;
  if (v7 >= *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke_2_cold_1(v8, v7, v9);
    }
  }
  else
  {
    *(_WORD *)(*(void *)(a1 + 48) + 2 * v7) = [*(id *)(a1 + 32) intern:v5];
  }
}

- (void)removeBundleIds:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        -[ATXHistogramTable remove:](self, "remove:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke_2_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int16 *)(*(void *)(*(void *)a1 + 8) + 24);
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Event id %u greater than max %u", (uint8_t *)v4, 0xEu);
}

@end