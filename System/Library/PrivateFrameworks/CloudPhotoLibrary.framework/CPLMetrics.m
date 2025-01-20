@interface CPLMetrics
- (CPLMetrics)initWithClientLibraryBaseURL:(id)a3;
- (id)metricsDescription;
- (int64_t)countForKey:(id)a3;
- (void)_loadIfNecessary;
- (void)_save;
- (void)forceLoad;
- (void)incrementCountForKey:(id)a3;
- (void)resetMetrics;
@end

@implementation CPLMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_metricsFileURL, 0);
}

- (id)metricsDescription
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7762;
  v15 = __Block_byref_object_dispose__7763;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v7 = __32__CPLMetrics_metricsDescription__block_invoke;
  v8 = &unk_1E60AA7E0;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __32__CPLMetrics_metricsDescription__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadIfNecessary];
  if ([*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v3 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
    id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = [*(id *)(a1 + 32) countForKey:v9];
          if (v10 >= 1)
          {
            uint64_t v11 = [NSString stringWithFormat:@"%@ = %ld", v9, v10];
            [v2 addObject:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    uint64_t v12 = [v2 componentsJoinedByString:@"\n"];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (void)incrementCountForKey:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __35__CPLMetrics_incrementCountForKey___block_invoke;
  uint64_t v10 = &unk_1E60A6728;
  uint64_t v11 = self;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __35__CPLMetrics_incrementCountForKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 integerValue];

  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = [NSNumber numberWithInteger:v3 + 1];
  [v4 setValue:v5 forKey:*(void *)(a1 + 40)];

  id v6 = *(void **)(a1 + 32);
  return [v6 _save];
}

- (int64_t)countForKey:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  p_lock = &self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  uint64_t v11 = __26__CPLMetrics_countForKey___block_invoke;
  id v12 = &unk_1E60AA830;
  uint64_t v13 = self;
  long long v15 = &v16;
  id v6 = v4;
  id v14 = v6;
  uint64_t v7 = v10;
  os_unfair_lock_lock(p_lock);
  v11((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

  int64_t v8 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __26__CPLMetrics_countForKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNecessary];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 integerValue];
}

- (void)resetMetrics
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v6 = __26__CPLMetrics_resetMetrics__block_invoke;
  uint64_t v7 = &unk_1E60A5DD8;
  int64_t v8 = self;
  uint64_t v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"CPLMetricsDidChangeNotification" object:0];
}

uint64_t __26__CPLMetrics_resetMetrics__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 _save];
}

- (void)_save
{
  os_unfair_lock_assert_owner(&self->_lock);
  metricsFileURL = self->_metricsFileURL;
  metrics = self->_metrics;
  [(NSMutableDictionary *)metrics writeToURL:metricsFileURL atomically:1];
}

- (void)_loadIfNecessary
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_metrics)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:self->_metricsFileURL];
    id v6 = v3;
    if (v3) {
      id v4 = v3;
    }
    else {
      id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    metrics = self->_metrics;
    self->_metrics = v4;
  }
}

- (void)forceLoad
{
  p_lock = &self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  uint64_t v5 = __23__CPLMetrics_forceLoad__block_invoke;
  id v6 = &unk_1E60A5DD8;
  uint64_t v7 = self;
  uint64_t v3 = v4;
  os_unfair_lock_lock(p_lock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

void __23__CPLMetrics_forceLoad__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (CPLMetrics)initWithClientLibraryBaseURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLMetrics;
  uint64_t v5 = [(CPLMetrics *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"metrics.plist"];
    metricsFileURL = v5->_metricsFileURL;
    v5->_metricsFileURL = (NSURL *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

@end