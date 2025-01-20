@interface ATXGlobalInterruptingAppModel
+ (ATXGlobalInterruptingAppModel)modelWithAllInstalledAppsKnownToSpringBoard;
- (ATXGlobalInterruptingAppModel)initWithBundleIds:(id)a3;
- (NSSet)bundleIds;
- (double)scoreForBundleId:(id)a3 scalingFactor:(double)a4;
- (id)_computePriors;
- (id)loadGlobalPriorsAsset;
- (int)indexForBundleId:(id)a3;
- (void)dealloc;
- (void)loadGlobalPriorsAsset;
- (void)unloadGlobalPriorsAsset;
@end

@implementation ATXGlobalInterruptingAppModel

+ (ATXGlobalInterruptingAppModel)modelWithAllInstalledAppsKnownToSpringBoard
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v3 = +[_ATXAppIconState sharedInstance];
  v4 = [v3 allInstalledAppsKnownToSpringBoard];
  v5 = (void *)[v2 initWithArray:v4];

  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBundleIds:v5];
  return (ATXGlobalInterruptingAppModel *)v6;
}

- (ATXGlobalInterruptingAppModel)initWithBundleIds:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXGlobalInterruptingAppModel;
  v5 = [(ATXGlobalInterruptingAppModel *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSSet *)v6;

    uint64_t v8 = +[ATXGlobalAppScoresUtil initializeTrieAtPath:@"ATXGlobalAppSignalsIndex"];
    index = v5->_index;
    v5->_index = (_PASCFBurstTrie *)v8;

    uint64_t v10 = [(ATXGlobalInterruptingAppModel *)v5 _computePriors];
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
  v4.super_class = (Class)ATXGlobalInterruptingAppModel;
  [(ATXGlobalInterruptingAppModel *)&v4 dealloc];
}

- (id)loadGlobalPriorsAsset
{
  id v2 = [MEMORY[0x1E4F4AF08] pathForResource:@"ATXGlobalInterruptingApp_v0" ofType:@"dat" isDirectory:0];
  if (v2)
  {
    id v8 = 0;
    v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v2 options:1 error:&v8];
    objc_super v4 = v8;
    if (v4)
    {
      v5 = __atxlog_handle_modes();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(ATXGlobalInterruptingAppModel *)(uint64_t)v4 loadGlobalPriorsAsset];
      }
    }
    else
    {
      if (v3)
      {
        id v6 = v3;
        goto LABEL_11;
      }
      v5 = __atxlog_handle_modes();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ATXGlobalInterruptingAppModel loadGlobalPriorsAsset](v5);
      }
    }

    id v6 = 0;
LABEL_11:

    goto LABEL_12;
  }
  objc_super v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[ATXGlobalInterruptingAppModel loadGlobalPriorsAsset](v4);
  }
  id v6 = 0;
LABEL_12:

  return v6;
}

- (id)_computePriors
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_modes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_INFO, "ATXGlobalInterruptingAppModel: _computePriors", v18, 2u);
  }

  objc_super v4 = [(ATXGlobalInterruptingAppModel *)self loadGlobalPriorsAsset];
  if (v4)
  {
    v5 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_bundleIds;
    uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(ATXGlobalInterruptingAppModel *)self indexForBundleId:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          if (v11)
          {
            uint64_t v12 = v11;
            *(_DWORD *)v18 = 0;
            objc_msgSend(v4, "getBytes:range:", v18, (4 * v11 - 4), 4);
            LODWORD(v13) = *(_DWORD *)v18;
            v14 = [NSNumber numberWithDouble:(double)v13 / 4294967300.0];
            objc_super v15 = [NSNumber numberWithInt:v12];
            [v5 setObject:v14 forKeyedSubscript:v15];
          }
        }
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    v16 = (void *)[v5 copy];
  }
  else
  {
    v16 = 0;
  }

  return v16;
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

- (int)indexForBundleId:(id)a3
{
  return [(_PASCFBurstTrie *)self->_index payloadForString:a3];
}

- (double)scoreForBundleId:(id)a3 scalingFactor:(double)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (!v7->_priors && v7->_assetOffloadedDueToMemoryPressure)
  {
    uint64_t v8 = __atxlog_handle_modes();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "ATXGlobalInterruptingAppModel: loading global priors after it was previously offloaded due to memory pressure.", v18, 2u);
    }

    uint64_t v9 = [(ATXGlobalInterruptingAppModel *)v7 _computePriors];
    priors = v7->_priors;
    v7->_priors = (NSDictionary *)v9;

    v7->_assetOffloadedDueToMemoryPressure = 0;
  }
  uint64_t v11 = [(ATXGlobalInterruptingAppModel *)v7 indexForBundleId:v6];
  uint64_t v12 = v7->_priors;
  unint64_t v13 = [NSNumber numberWithInt:v11];
  v14 = [(NSDictionary *)v12 objectForKeyedSubscript:v13];
  [v14 doubleValue];
  double v16 = v15 * a4;

  objc_sync_exit(v7);
  return v16;
}

- (NSSet)bundleIds
{
  return self->_bundleIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priors, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)loadGlobalPriorsAsset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXGlobalInterruptingAppModel: Error encountered when attempting to load global priors: %@", (uint8_t *)&v2, 0xCu);
}

@end