@interface ATXGlobalAppModeAffinityModel
+ (ATXGlobalAppModeAffinityModel)modelWithAllInstalledAppsKnownToSpringBoard;
+ (id)supportedModeTypes;
- (ATXGlobalAppModeAffinityModel)initWithBundleIds:(id)a3;
- (NSSet)bundleIds;
- (double)_priorForMode:(unint64_t)a3 bundleIdIndex:(int)a4 priors:(id)a5;
- (double)scoreForMode:(unint64_t)a3 bundleId:(id)a4 scalingFactor:(double)a5;
- (id)_computePriors;
- (id)loadGlobalPriorsAsset;
- (int)indexForBundleId:(id)a3;
- (unint64_t)modeIndexForMode:(unint64_t)a3;
- (void)_normalizePriors:(id)a3 maximumPrior:(double)a4;
- (void)dealloc;
- (void)loadGlobalPriorsAsset;
- (void)unloadGlobalPriorsAsset;
@end

@implementation ATXGlobalAppModeAffinityModel

+ (ATXGlobalAppModeAffinityModel)modelWithAllInstalledAppsKnownToSpringBoard
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v3 = +[_ATXAppIconState sharedInstance];
  v4 = [v3 allInstalledAppsKnownToSpringBoard];
  v5 = (void *)[v2 initWithArray:v4];

  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBundleIds:v5];
  return (ATXGlobalAppModeAffinityModel *)v6;
}

- (ATXGlobalAppModeAffinityModel)initWithBundleIds:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXGlobalAppModeAffinityModel;
  v5 = [(ATXGlobalAppModeAffinityModel *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSSet *)v6;

    uint64_t v8 = +[ATXGlobalAppScoresUtil initializeTrieAtPath:@"ATXGlobalAppSignalsIndex"];
    index = v5->_index;
    v5->_index = (_PASCFBurstTrie *)v8;

    uint64_t v10 = [(ATXGlobalAppModeAffinityModel *)v5 _computePriors];
    normalizedPriors = v5->_normalizedPriors;
    v5->_normalizedPriors = (NSDictionary *)v10;

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
  v4.super_class = (Class)ATXGlobalAppModeAffinityModel;
  [(ATXGlobalAppModeAffinityModel *)&v4 dealloc];
}

- (id)loadGlobalPriorsAsset
{
  id v2 = [MEMORY[0x1E4F4AF08] pathForResource:@"ATXGlobalAppModeAffinity_v0" ofType:@"dat" isDirectory:0];
  if (v2)
  {
    id v8 = 0;
    v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v2 options:1 error:&v8];
    objc_super v4 = v8;
    if (v4)
    {
      v5 = __atxlog_handle_modes();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(ATXGlobalAppModeAffinityModel *)(uint64_t)v4 loadGlobalPriorsAsset];
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
        -[ATXGlobalAppModeAffinityModel loadGlobalPriorsAsset](v5);
      }
    }

    id v6 = 0;
LABEL_11:

    goto LABEL_12;
  }
  objc_super v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[ATXGlobalAppModeAffinityModel loadGlobalPriorsAsset](v4);
  }
  id v6 = 0;
LABEL_12:

  return v6;
}

- (id)_computePriors
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_modes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_INFO, "ATXGlobalAppModeAffinityModel: _computePriors", buf, 2u);
  }

  v30 = [(ATXGlobalAppModeAffinityModel *)self loadGlobalPriorsAsset];
  if (v30)
  {
    v29 = objc_opt_new();
    v24 = [(id)objc_opt_class() supportedModeTypes];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = self->_bundleIds;
    uint64_t v26 = [(NSSet *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v36;
      double v4 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v7 = [(ATXGlobalAppModeAffinityModel *)self indexForBundleId:v6];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v27 = i;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v28 = v24;
            uint64_t v9 = [v28 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v10; ++j)
                {
                  if (*(void *)v32 != v11) {
                    objc_enumerationMutation(v28);
                  }
                  v13 = *(void **)(*((void *)&v31 + 1) + 8 * j);
                  uint64_t v14 = [v13 integerValue];
                  [(ATXGlobalAppModeAffinityModel *)self _priorForMode:v14 bundleIdIndex:v8 priors:v30];
                  double v16 = v15;
                  v17 = [[ATXGlobalAppModeAffinityPrior alloc] initWithMode:v14 prior:v6 bundleId:v15];
                  v18 = (void *)MEMORY[0x1E4F93BB8];
                  v19 = [NSNumber numberWithInt:v8];
                  v20 = [v18 tupleWithFirst:v19 second:v13];

                  [v29 setObject:v17 forKeyedSubscript:v20];
                  if (v4 < v16) {
                    double v4 = v16;
                  }
                }
                uint64_t v10 = [v28 countByEnumeratingWithState:&v31 objects:v40 count:16];
              }
              while (v10);
            }

            uint64_t i = v27;
          }
        }
        uint64_t v26 = [(NSSet *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v26);
    }
    else
    {
      double v4 = 0.0;
    }

    [(ATXGlobalAppModeAffinityModel *)self _normalizePriors:v29 maximumPrior:v4];
    v21 = (void *)[v29 copy];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)unloadGlobalPriorsAsset
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  normalizedPriors = obj->_normalizedPriors;
  obj->_normalizedPriors = 0;

  obj->_assetOffloadedDueToMemoryPressure = 1;
  objc_sync_exit(obj);
}

- (void)_normalizePriors:(id)a3 maximumPrior:(double)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "ATXGlobalAppModeAffinityModel: _normalizePriors:maximumPrior", buf, 2u);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = self->_bundleIds;
  uint64_t v28 = [(NSSet *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v28)
  {
    double v7 = fmin(a4, 500.0);
    uint64_t v26 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v8;
        uint64_t v9 = [(ATXGlobalAppModeAffinityModel *)self indexForBundleId:*(void *)(*((void *)&v34 + 1) + 8 * v8)];
        uint64_t v10 = [(id)objc_opt_class() supportedModeTypes];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v31;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * v14);
              double v16 = (void *)MEMORY[0x1E4F93BB8];
              v17 = [NSNumber numberWithInt:v9];
              v18 = [v16 tupleWithFirst:v17 second:v15];

              v19 = [v5 objectForKeyedSubscript:v18];

              if (v19)
              {
                v20 = [v5 objectForKeyedSubscript:v18];
                [v20 prior];
                double v22 = fmin(v21, 500.0);
                if (v22 < -500.0) {
                  double v22 = -500.0;
                }
                double v23 = v22 / v7;
                v24 = [v5 objectForKeyedSubscript:v18];
                [v24 setPrior:v23];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [(NSSet *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v28);
  }
}

- (int)indexForBundleId:(id)a3
{
  return [(_PASCFBurstTrie *)self->_index payloadForString:a3];
}

- (double)scoreForMode:(unint64_t)a3 bundleId:(id)a4 scalingFactor:(double)a5
{
  id v8 = a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if (!v9->_normalizedPriors && v9->_assetOffloadedDueToMemoryPressure)
  {
    uint64_t v10 = __atxlog_handle_modes();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v22 = 0;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "ATXGlobalAppModeAffinityModel: loading global priors after it was previously offloaded due to memory pressure.", v22, 2u);
    }

    uint64_t v11 = [(ATXGlobalAppModeAffinityModel *)v9 _computePriors];
    normalizedPriors = v9->_normalizedPriors;
    v9->_normalizedPriors = (NSDictionary *)v11;

    v9->_assetOffloadedDueToMemoryPressure = 0;
  }
  uint64_t v13 = [(ATXGlobalAppModeAffinityModel *)v9 indexForBundleId:v8];
  uint64_t v14 = (void *)MEMORY[0x1E4F93BB8];
  uint64_t v15 = [NSNumber numberWithInt:v13];
  double v16 = [NSNumber numberWithUnsignedInteger:a3];
  v17 = [v14 tupleWithFirst:v15 second:v16];

  v18 = [(NSDictionary *)v9->_normalizedPriors objectForKeyedSubscript:v17];
  [v18 prior];
  double v20 = v19 * a5;

  objc_sync_exit(v9);
  return v20;
}

- (double)_priorForMode:(unint64_t)a3 bundleIdIndex:(int)a4 priors:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    int v15 = 0;
    unint64_t v9 = [(ATXGlobalAppModeAffinityModel *)self modeIndexForMode:a3];
    double v10 = 0.0;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v11 = v9;
      uint64_t v12 = [(id)objc_opt_class() supportedModeTypes];
      int v13 = 4 * (v11 + (a4 - 1) * [v12 count]);

      objc_msgSend(v8, "getBytes:range:", &v15, v13, 4);
      double v10 = (double)v15 / 10000.0;
    }
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

+ (id)supportedModeTypes
{
  return &unk_1F27F39A8;
}

- (unint64_t)modeIndexForMode:(unint64_t)a3
{
  double v4 = [(id)objc_opt_class() supportedModeTypes];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  unint64_t v6 = [v4 indexOfObject:v5];

  return v6;
}

- (NSSet)bundleIds
{
  return self->_bundleIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedPriors, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)loadGlobalPriorsAsset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXGlobalAppModeAffinityModel: Error encountered when attempting to load global priors: %@", (uint8_t *)&v2, 0xCu);
}

@end