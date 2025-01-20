@interface ATXGlobalWidgetPopularityModel
+ (ATXGlobalWidgetPopularityModel)modelWithAllAvailableWidgets;
- (ATXGlobalWidgetPopularityModel)initWithBundleIdAndKinds:(id)a3;
- (double)scoreForBundleIdAndKind:(id)a3 scalingFactor:(double)a4;
- (id)_computePriors;
- (void)dealloc;
- (void)unloadGlobalPriorsAsset;
@end

@implementation ATXGlobalWidgetPopularityModel

+ (ATXGlobalWidgetPopularityModel)modelWithAllAvailableWidgets
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v3 = +[ATXWidgetModeModel fetchAvailableWidgets];
  v4 = [v3 allValues];
  v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_34);
  v6 = (void *)[v2 initWithArray:v5];

  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBundleIdAndKinds:v6];
  return (ATXGlobalWidgetPopularityModel *)v7;
}

id __62__ATXGlobalWidgetPopularityModel_modelWithAllAvailableWidgets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 extensionBundleIdentifier];
  v6 = [v3 kind];

  v7 = (void *)[v4 initWithFormat:@"%@:%@", v5, v6];
  return v7;
}

- (ATXGlobalWidgetPopularityModel)initWithBundleIdAndKinds:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXGlobalWidgetPopularityModel;
  v5 = [(ATXGlobalWidgetPopularityModel *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdAndKinds = v5->_bundleIdAndKinds;
    v5->_bundleIdAndKinds = (NSSet *)v6;

    uint64_t v8 = +[ATXGlobalAppScoresUtil initializeTrieAtPath:@"ATXGlobalWidgetPopularity_v0"];
    priorsTrie = v5->_priorsTrie;
    v5->_priorsTrie = (_PASCFBurstTrie *)v8;

    uint64_t v10 = [(ATXGlobalWidgetPopularityModel *)v5 _computePriors];
    priors = v5->_priors;
    v5->_priors = (NSDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F4B640] sharedInstance];
    memoryPressureMonitor = v5->_memoryPressureMonitor;
    v5->_memoryPressureMonitor = (ATXMemoryPressureMonitor *)v12;

    [(ATXMemoryPressureMonitor *)v5->_memoryPressureMonitor registerObserver:v5];
  }

  return v5;
}

- (void)dealloc
{
  [(ATXMemoryPressureMonitor *)self->_memoryPressureMonitor unregisterObserver:self];
  memoryPressureMonitor = self->_memoryPressureMonitor;
  self->_memoryPressureMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)ATXGlobalWidgetPopularityModel;
  [(ATXGlobalWidgetPopularityModel *)&v4 dealloc];
}

- (id)_computePriors
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_modes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_INFO, "ATXGlobalWidgetPopularityModel: _computePriors", buf, 2u);
  }

  objc_super v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_bundleIdAndKinds;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        int v11 = -[_PASCFBurstTrie payloadForString:](self->_priorsTrie, "payloadForString:", v10, (void)v15);
        if (v11)
        {
          uint64_t v12 = [NSNumber numberWithDouble:(double)(v11 - 1) / 4294967300.0];
          [v4 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];
  return v13;
}

- (void)unloadGlobalPriorsAsset
{
  obj = self;
  objc_sync_enter(obj);
  priors = obj->_priors;
  obj->_priors = 0;

  obj->_assetOffloadedDueToMemoryPressure = 1;
  objc_sync_exit(obj);
}

- (double)scoreForBundleIdAndKind:(id)a3 scalingFactor:(double)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  priors = v7->_priors;
  if (!priors)
  {
    if (v7->_assetOffloadedDueToMemoryPressure)
    {
      v9 = __atxlog_handle_modes();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v16 = 0;
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "ATXGlobalWidgetPopularityModel: loading global priors after it was previously offloaded due to memory pressure.", v16, 2u);
      }

      uint64_t v10 = [(ATXGlobalWidgetPopularityModel *)v7 _computePriors];
      int v11 = v7->_priors;
      v7->_priors = (NSDictionary *)v10;

      v7->_assetOffloadedDueToMemoryPressure = 0;
      priors = v7->_priors;
    }
    else
    {
      priors = 0;
    }
  }
  uint64_t v12 = [(NSDictionary *)priors objectForKeyedSubscript:v6];
  [v12 doubleValue];
  double v14 = v13 * a4;

  objc_sync_exit(v7);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priors, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_priorsTrie, 0);
  objc_storeStrong((id *)&self->_bundleIdAndKinds, 0);
}

@end