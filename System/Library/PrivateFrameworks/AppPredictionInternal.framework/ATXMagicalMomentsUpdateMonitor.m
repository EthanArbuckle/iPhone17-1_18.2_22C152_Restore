@interface ATXMagicalMomentsUpdateMonitor
- (ATXMagicalMomentsUpdateMonitor)init;
- (ATXMagicalMomentsUpdateMonitor)initWithLimit:(unint64_t)a3;
- (id)predictionsForBundleId:(id)a3;
- (unint64_t)limit;
- (unint64_t)mmPredictionCount;
- (void)_setPredictions:(id)a3 expiration:(id)a4 totalPredictionCount:(unint64_t)a5;
- (void)dropCacheIfExpired;
- (void)setupUpdateListener;
- (void)updatePredictionsWith:(id)a3 consumer:(unint64_t)a4;
@end

@implementation ATXMagicalMomentsUpdateMonitor

- (ATXMagicalMomentsUpdateMonitor)init
{
  v3 = +[_ATXGlobals sharedInstance];
  int v4 = [v3 maxMagicalMomentsPredictions];

  return [(ATXMagicalMomentsUpdateMonitor *)self initWithLimit:v4];
}

- (ATXMagicalMomentsUpdateMonitor)initWithLimit:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)ATXMagicalMomentsUpdateMonitor;
  int v4 = [(ATXMagicalMomentsUpdateMonitor *)&v22 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ATXMagicalMomentsUpdateMonitor.queue", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    v4->_limit = a3;
    id v8 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v9 = [v8 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    defaults = v4->_defaults;
    v4->_defaults = (NSUserDefaults *)v9;

    v11 = [(NSUserDefaults *)v4->_defaults objectForKey:@"com.apple.duetexpertd.MMUpdateMonitor.ExpirationDate"];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1.0];
    }
    expiration = v4->_expiration;
    v4->_expiration = v13;

    v4->_unint64_t mmPredictionCount = [(NSUserDefaults *)v4->_defaults integerForKey:@"com.apple.duetexpertd.MMUpdateMonitor.PredictionCount"];
    v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v4->_expiration;
      unint64_t mmPredictionCount = v4->_mmPredictionCount;
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      __int16 v25 = 2048;
      unint64_t v26 = mmPredictionCount;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "ATXMM: Recovered expiration date of predictions: %@. MM prediction count: %ld", buf, 0x16u);
    }

    [(ATXMagicalMomentsUpdateMonitor *)v4 setupUpdateListener];
    v18 = v4->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__ATXMagicalMomentsUpdateMonitor_initWithLimit___block_invoke;
    block[3] = &unk_1E68AB818;
    v21 = v4;
    dispatch_async(v18, block);
  }
  return v4;
}

uint64_t __48__ATXMagicalMomentsUpdateMonitor_initWithLimit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dropCacheIfExpired];
}

- (void)dropCacheIfExpired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_expiration)
  {
    if (self->_mmPredictionCount)
    {
      v3 = [MEMORY[0x1E4F1C9C8] date];
      int v4 = [v3 earlierDate:self->_expiration];
      int v5 = [v4 isEqualToDate:self->_expiration];

      if (v5)
      {
        dispatch_queue_t v6 = objc_opt_new();
        +[ATXMagicalMomentsBlendingUpdater updateBlendingLayerWithMagicalMomentsMap:v6];

        predictionMap = self->_predictionMap;
        self->_predictionMap = 0;

        self->_unint64_t mmPredictionCount = 0;
        id v8 = objc_opt_new();
        uint64_t v9 = objc_opt_new();
        [(ATXMagicalMomentsUpdateMonitor *)self _setPredictions:v8 expiration:v9 totalPredictionCount:0];

        v10 = __atxlog_handle_default();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXMM: Dropped the cache because the predictions have expired.", v11, 2u);
        }
      }
    }
  }
}

- (id)predictionsForBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__90;
  v16 = __Block_byref_object_dispose__90;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ATXMagicalMomentsUpdateMonitor_predictionsForBundleId___block_invoke;
  block[3] = &unk_1E68AFB40;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __57__ATXMagicalMomentsUpdateMonitor_predictionsForBundleId___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dropCacheIfExpired];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (unint64_t)mmPredictionCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ATXMagicalMomentsUpdateMonitor_mmPredictionCount__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__ATXMagicalMomentsUpdateMonitor_mmPredictionCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dropCacheIfExpired];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 24);
  return result;
}

- (void)setupUpdateListener
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F93878]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ATXMagicalMomentsUpdateMonitor_setupUpdateListener__block_invoke;
  v6[3] = &unk_1E68B4500;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = (PMMPredictionNotification *)[v3 initWithPredictionUpdateListener:v6];
  mmUpdateListener = self->_mmUpdateListener;
  self->_mmUpdateListener = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __53__ATXMagicalMomentsUpdateMonitor_setupUpdateListener__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained updatePredictionsWith:v5 consumer:a3];
}

- (void)updatePredictionsWith:(id)a3 consumer:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ATXMagicalMomentsUpdateMonitor_updatePredictionsWith_consumer___block_invoke;
  block[3] = &unk_1E68AE7A8;
  v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __65__ATXMagicalMomentsUpdateMonitor_updatePredictionsWith_consumer___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 1)
  {
    uint64_t v1 = a1;
    v20 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [*(id *)(v1 + 32) predictedItems];
    uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = 0;
      uint64_t v19 = *(void *)v22;
LABEL_4:
      uint64_t v5 = 0;
      while (1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        if ((unint64_t)(v4 + v5) >= *(void *)(*(void *)(v1 + 40) + 56)) {
          break;
        }
        uint64_t v6 = v1;
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        id v8 = [ATXMagicalMomentsSignals alloc];
        uint64_t v9 = [v7 predictionSource];
        uint64_t v10 = [v7 reason];
        v11 = [v7 reasonMetadata];
        [v7 confidence];
        v13 = -[ATXMagicalMomentsSignals initWithPredictionSource:pmmReason:reasonMetadata:confidence:anchorType:index:](v8, "initWithPredictionSource:pmmReason:reasonMetadata:confidence:anchorType:index:", v9, v10, v11, [v7 anchorType], v4 + v5, v12);
        uint64_t v14 = [v7 bundleId];
        [v20 setObject:v13 forKeyedSubscript:v14];

        uint64_t v1 = v6;
        if (v3 == ++v5)
        {
          uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
          v4 += v5;
          if (v3) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    +[ATXMagicalMomentsBlendingUpdater updateBlendingLayerWithMagicalMomentsMap:v20];
    v15 = *(void **)(v1 + 40);
    v16 = [*(id *)(v1 + 32) expirationDate];
    id v17 = [*(id *)(v1 + 32) predictedItems];
    objc_msgSend(v15, "_setPredictions:expiration:totalPredictionCount:", v20, v16, objc_msgSend(v17, "count"));
  }
}

- (void)_setPredictions:(id)a3 expiration:(id)a4 totalPredictionCount:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_predictionMap, a3);
  objc_storeStrong((id *)&self->_expiration, a4);
  self->_unint64_t mmPredictionCount = a5;
  [(NSUserDefaults *)self->_defaults setObject:self->_expiration forKey:@"com.apple.duetexpertd.MMUpdateMonitor.ExpirationDate"];
  [(NSUserDefaults *)self->_defaults setInteger:self->_mmPredictionCount forKey:@"com.apple.duetexpertd.MMUpdateMonitor.PredictionCount"];
  v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    expiration = self->_expiration;
    unint64_t mmPredictionCount = self->_mmPredictionCount;
    int v14 = 138412546;
    v15 = expiration;
    __int16 v16 = 2048;
    unint64_t v17 = mmPredictionCount;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXMM: Persisted expiration date of predictions: %@. MM prediction count: %ld to NSUserDefaults", (uint8_t *)&v14, 0x16u);
  }
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmUpdateListener, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_predictionMap, 0);
}

@end