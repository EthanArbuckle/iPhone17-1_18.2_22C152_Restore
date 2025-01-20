@interface HDActiveDataAggregator
- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6;
- (Class)sensorDatumClass;
- (HDActiveDataAggregator)initWithDataCollectionManager:(id)a3;
- (double)aggregationInterval;
- (double)aggregationIntervalForCollector:(id)a3;
- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9;
- (id)configurationForCollector:(id)a3;
- (id)initialAggregationState;
- (void)_aggregateForAllDevicesForCollector:(void *)a3 date:(uint64_t)a4 mode:(uint64_t)a5 options:;
- (void)_aggregateForCollector:(void *)a3 device:(void *)a4 requestedAggregationDate:(uint64_t)a5 mode:(uint64_t)a6 options:;
- (void)_requestAggregationThroughDate:(uint64_t)a3 mode:(uint64_t)a4 options:(void *)a5 completion:;
- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6;
- (void)recomputeCollectorConfiguration;
- (void)registerDataCollector:(id)a3 state:(id)a4;
- (void)requestAggregationThroughDate:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)unregisterDataCollector:(id)a3;
@end

@implementation HDActiveDataAggregator

- (HDActiveDataAggregator)initWithDataCollectionManager:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDActiveDataAggregator;
  v5 = [(HDDataAggregator *)&v21 initWithDataCollectionManager:v4];
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    aggregationLock = v5->_aggregationLock;
    v5->_aggregationLock = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    currentAggregationStates = v5->_currentAggregationStates;
    v5->_currentAggregationStates = v8;

    objc_initWeak(&location, v5);
    id v10 = objc_alloc(MEMORY[0x1E4F2B8C8]);
    v11 = [(HDDataAggregator *)v5 dataCollectionManager];
    v12 = [v11 sharedDelayedAggregationQueue];
    [(HDActiveDataAggregator *)v5 aggregationInterval];
    double v14 = v13;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__HDActiveDataAggregator_initWithDataCollectionManager___block_invoke;
    v18[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v19, &location);
    uint64_t v15 = [v10 initWithMode:1 queue:v12 delay:v18 block:v14];
    delayedAggregationOperation = v5->_delayedAggregationOperation;
    v5->_delayedAggregationOperation = (_HKDelayedOperation *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __56__HDActiveDataAggregator_initWithDataCollectionManager___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = WeakRetained;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Reconsidering aggregation for old data.", (uint8_t *)&buf, 0xCu);
    }
    v3 = objc_msgSend(WeakRetained, "dataCollectionManager", WeakRetained);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__HDActiveDataAggregator__reconsiderDelayedAggregation__block_invoke;
    v5[3] = &unk_1E62FDA98;
    v5[4] = WeakRetained;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v7 = __55__HDActiveDataAggregator__reconsiderDelayedAggregation__block_invoke_3;
    v8 = &unk_1E62FDAC0;
    id v9 = WeakRetained;
    CFAbsoluteTime v10 = Current;
    [v3 performSaveWithMaximumLatency:v5 block:&buf completion:60.0];
  }
}

- (void)_aggregateForCollector:(void *)a3 device:(void *)a4 requestedAggregationDate:(uint64_t)a5 mode:(uint64_t)a6 options:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke;
    aBlock[3] = &unk_1E62FCE10;
    aBlock[4] = a1;
    id v34 = v11;
    id v14 = v11;
    id v41 = v14;
    id v33 = v12;
    id v15 = v12;
    id v42 = v15;
    id v16 = v13;
    id v43 = v16;
    uint64_t v44 = a5;
    uint64_t v45 = a6;
    v17 = _Block_copy(aBlock);
    v18 = (os_log_t *)MEMORY[0x1E4F29F10];
    os_signpost_id_t v19 = _HKLogSignpostIDGenerate();
    _HKInitializeLogging();
    os_log_t v20 = *v18;
    if (os_signpost_enabled(*v18))
    {
      objc_super v21 = v20;
      v22 = v21;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)long long buf = 138544130;
        id v47 = v14;
        __int16 v48 = 2114;
        id v49 = v15;
        __int16 v50 = 2114;
        id v51 = v16;
        __int16 v52 = 2048;
        uint64_t v53 = a5;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v19, "active-aggregation-for-collector", "collector=%{public}@, device=%{public}@, aggregationDate=%{public}@, mode=%ld", buf, 0x2Au);
      }
    }
    v23 = [a1 dataCollectionManager];
    v24 = [v23 profile];
    v25 = [v24 database];
    id v39 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_285;
    v37[3] = &unk_1E62FA3D0;
    id v38 = v17;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_2_287;
    v35[3] = &unk_1E62F8610;
    id v26 = v38;
    id v36 = v26;
    BOOL v27 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v25 error:&v39 block:v37 inaccessibilityHandler:v35];
    id v28 = v39;

    _HKInitializeLogging();
    os_log_t v29 = *v18;
    if (os_signpost_enabled(*v18))
    {
      v30 = v29;
      v31 = v30;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v31, OS_SIGNPOST_INTERVAL_END, v19, "active-aggregation-for-collector", "", buf, 2u);
      }
    }
    if (!v27 && (HKIsUnitTesting() & 1) == 0)
    {
      _HKInitializeLogging();
      v32 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        id v47 = a1;
        __int16 v48 = 2114;
        id v49 = v28;
        _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform outer write transaction for aggregation and persistence: %{public}@", buf, 0x16u);
      }
    }

    id v12 = v33;
    id v11 = v34;
  }
}

void __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_2;
  v5[3] = &unk_1E62FCE10;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = *(id *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v2, "hk_withLock:", v5);
}

void __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_2(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v2 = +[_HDAggregationStateKey keyForCollector:device:aggregator:]((uint64_t)_HDAggregationStateKey, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  id v3 = [*(id *)(*(void *)(a1 + 48) + 72) objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  id v73 = 0;
  long long v10 = [v6 aggregateForState:v3 collector:v4 device:v5 requestedAggregationDate:v7 mode:v8 options:v9 error:&v73];
  id v11 = (char *)v73;
  id v12 = v11;
  if (v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  id v14 = (os_log_t *)MEMORY[0x1E4F29F10];
  if (!v13)
  {
    _HKInitializeLogging();
    id v15 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_FAULT))
    {
      uint64_t v66 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v75 = v66;
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v3;
      __int16 v78 = 2114;
      v79 = v12;
      _os_log_fault_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_FAULT, "%{public}@: (rdar://63497174) Failed to aggregate with state %@: %{public}@", buf, 0x20u);
    }
  }
  id v16 = [v10 persistenceHandler];

  if (v16)
  {
    v17 = [*(id *)(a1 + 32) sourceForDataAggregator:*(void *)(a1 + 48)];
    if (v17)
    {
      v70 = v2;
      v18 = *(void **)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 32);
      os_log_t v20 = [v10 consumedSensorData];
      uint64_t v21 = *(void *)(a1 + 40);
      id v72 = 0;
      v22 = [v10 persistenceHandler];
      LODWORD(v21) = [v18 persistForCollector:v19 usedDatums:v20 source:v17 device:v21 error:&v72 persistenceHandler:v22];
      id v23 = v72;

      id v14 = (os_log_t *)MEMORY[0x1E4F29F10];
      _HKInitializeLogging();
      v24 = *v14;
      v25 = *v14;
      if (v21)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v68 = *(void *)(a1 + 48);
          id v26 = v24;
          v69 = [v10 consumedSensorData];
          uint64_t v27 = [v69 count];
          id v28 = [v10 consumedSensorData];
          os_log_t v29 = [v28 lastObject];
          *(_DWORD *)long long buf = 138543874;
          uint64_t v75 = v68;
          __int16 v76 = 2048;
          uint64_t v77 = v27;
          __int16 v78 = 2112;
          v79 = v29;
          _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Persisted, consuming %ld datums with last datum: %@.", buf, 0x20u);

          id v14 = (os_log_t *)MEMORY[0x1E4F29F10];
        }
        uint64_t v30 = [v10 aggregationState];

        v2 = v70;
        [*(id *)(*(void *)(a1 + 48) + 72) setObject:v30 forKeyedSubscript:v70];
        id v3 = (void *)v30;
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          uint64_t v67 = *(void *)(a1 + 48);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v75 = v67;
          __int16 v76 = 2114;
          uint64_t v77 = (uint64_t)v12;
          _os_log_fault_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_FAULT, "%{public}@: (rdar://63497174) Failed to persist aggregated objects: %{public}@", buf, 0x16u);
        }
        v2 = v70;
      }
    }
    else
    {
      _HKInitializeLogging();
      v31 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_FAULT))
      {
        uint64_t v32 = *(void *)(a1 + 32);
        uint64_t v33 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v75 = v32;
        __int16 v76 = 2114;
        uint64_t v77 = v33;
        _os_log_fault_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_FAULT, "Collector %{public}@ failed to return source for aggregator %{public}@", buf, 0x16u);
      }
    }
  }
  id v34 = [v3 unaggregatedSensorData];
  if ([v34 count])
  {
  }
  else
  {
    v35 = [v3 openSeries];

    if (!v35) {
      goto LABEL_34;
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 48) aggregationInterval];
  double v38 = v37;
  id v39 = [v3 unaggregatedSensorData];
  uint64_t v40 = [v39 count];

  if (v40)
  {
    id v41 = [v3 unaggregatedSensorData];
    id v42 = [v41 firstObject];
    id v43 = [v42 dateInterval];
    uint64_t v44 = [v43 endDate];
    [v44 timeIntervalSinceReferenceDate];
    double v46 = v45;
    [*(id *)(a1 + 48) aggregationInterval];
    double v48 = v46 + v47 - Current;

    if (v48 < v38) {
      double v38 = v48;
    }
  }
  id v49 = [v3 openSeries];

  if (v49)
  {
    __int16 v50 = [v3 openSeries];
    id v51 = [v50 startDate];
    [v51 timeIntervalSinceReferenceDate];
    double v53 = v52;
    uint64_t v54 = [*(id *)(a1 + 48) configuration];
    [v54 maximumSeriesDuration];
    double v56 = v53 + v55 - Current;

    if (v56 < v38) {
      double v38 = v56;
    }
  }
  _HKInitializeLogging();
  os_log_t v57 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v58 = *(void *)(a1 + 48);
    v59 = v57;
    v60 = [v3 unaggregatedSensorData];
    uint64_t v61 = [v60 count];
    v62 = [v3 openSeries];
    v63 = "has";
    *(_DWORD *)long long buf = 138544130;
    uint64_t v75 = v58;
    __int16 v76 = 2048;
    if (!v62) {
      v63 = "no";
    }
    uint64_t v77 = v61;
    __int16 v78 = 2080;
    v79 = v63;
    __int16 v80 = 2048;
    double v81 = v38;
    _os_log_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_INFO, "%{public}@: Incomplete aggregation (%ld remaining datums, %s open series); accumulating and will reconsider in %0.2lfs",
      buf,
      0x2Au);
  }
  v64 = [*(id *)(a1 + 48) dataCollectionManager];
  v65 = [v64 sharedDelayedAggregationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_283;
  block[3] = &unk_1E62F3198;
  block[4] = *(void *)(a1 + 48);
  *(double *)&block[5] = v38;
  dispatch_async(v65, block);

LABEL_34:
}

uint64_t __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_283(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) executeWithDelay:*(double *)(a1 + 40)];
}

uint64_t __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_285(uint64_t a1)
{
  return 1;
}

uint64_t __94__HDActiveDataAggregator__aggregateForCollector_device_requestedAggregationDate_mode_options___block_invoke_2_287(uint64_t a1)
{
  return 1;
}

uint64_t __55__HDActiveDataAggregator__reconsiderDelayedAggregation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = [v1 configuration];
  [v3 collectionLatency];
  uint64_t v5 = [v2 dateWithTimeIntervalSinceNow:-v4];
  -[HDActiveDataAggregator _requestAggregationThroughDate:mode:options:completion:](v1, v5, 0, 0, &__block_literal_global_81);

  return 1;
}

- (void)_requestAggregationThroughDate:(uint64_t)a3 mode:(uint64_t)a4 options:(void *)a5 completion:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  long long v10 = a5;
  if (a1)
  {
    id v11 = [a1 allCollectors];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v17 + 1) + 8 * v15) collector];
          -[HDActiveDataAggregator _aggregateForAllDevicesForCollector:date:mode:options:]((id *)a1, v16, v9, a3, a4);

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
    v10[2](v10, 1, 0);
  }
}

void __55__HDActiveDataAggregator__reconsiderDelayedAggregation__block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F10];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = v6;
      CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
      int v16 = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      CFAbsoluteTime v19 = v10;
      id v11 = "%{public}@: Finished reconsidering with latency %0.2lfs.";
      uint64_t v12 = v9;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }
  else if (v7)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id v9 = v6;
    CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
    int v16 = 138543874;
    uint64_t v17 = v14;
    __int16 v18 = 2048;
    CFAbsoluteTime v19 = v15;
    __int16 v20 = 2114;
    id v21 = v5;
    id v11 = "%{public}@: Failed aggregation reconsideration after %0.2lfs: %{public}@";
    uint64_t v12 = v9;
    uint32_t v13 = 32;
    goto LABEL_6;
  }
}

- (void)registerDataCollector:(id)a3 state:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v18 = a4;
  CFAbsoluteTime v19 = v6;
  BOOL v7 = [v6 identifierForDataAggregator:self];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [(HDDataAggregator *)self allCollectors];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint32_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = [v13 collector];
        CFAbsoluteTime v15 = [v14 identifierForDataAggregator:self];

        if ([v15 isEqualToString:v7])
        {
          int v16 = [v13 collector];
          uint64_t v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
          -[HDActiveDataAggregator _aggregateForAllDevicesForCollector:date:mode:options:]((id *)&self->super.super.isa, v16, v17, 0, 3);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v20.receiver = self;
  v20.super_class = (Class)HDActiveDataAggregator;
  [(HDDataAggregator *)&v20 registerDataCollector:v19 state:v18];
}

- (void)_aggregateForAllDevicesForCollector:(void *)a3 date:(uint64_t)a4 mode:(uint64_t)a5 options:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    [a1[8] lock];
    uint64_t v11 = [a1[9] allKeys];
    uint64_t v12 = objc_msgSend(v11, "hk_map:", &__block_literal_global_310);

    [a1[8] unlock];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          -[HDActiveDataAggregator _aggregateForCollector:device:requestedAggregationDate:mode:options:](a1, v9, *(void **)(*((void *)&v18 + 1) + 8 * v17++), v10, a4, a5);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }
  }
}

- (void)unregisterDataCollector:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 distantFuture];
  -[HDActiveDataAggregator _aggregateForAllDevicesForCollector:date:mode:options:]((id *)&self->super.super.isa, v5, v6, 0, 3);

  v7.receiver = self;
  v7.super_class = (Class)HDActiveDataAggregator;
  [(HDDataAggregator *)&v7 unregisterDataCollector:v5];
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v49.receiver = self;
  v49.super_class = (Class)HDActiveDataAggregator;
  [(HDDataAggregator *)&v49 dataCollector:v10 didCollectSensorData:v11 device:v12 options:a6];
  if ((a6 & 1) == 0)
  {
    id v13 = [(HDActiveDataAggregator *)self sensorDatumClass];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke;
    aBlock[3] = &unk_1E62FDAE8;
    aBlock[4] = self;
    void aBlock[5] = v13;
    uint64_t v14 = _Block_copy(aBlock);
    uint64_t v44 = 0;
    double v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 1;
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__74;
    id v42 = __Block_byref_object_dispose__74;
    id v43 = 0;
    aggregationLock = self->_aggregationLock;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_299;
    v30[3] = &unk_1E62FDB30;
    id v16 = v10;
    id v31 = v16;
    id v17 = v12;
    id v32 = v17;
    uint64_t v33 = self;
    id v34 = v11;
    id v18 = v14;
    id v35 = v18;
    id v36 = &v38;
    double v37 = &v44;
    [(NSLock *)aggregationLock hk_withLock:v30];
    if (*((unsigned char *)v45 + 24))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      long long v20 = [(HDDataAggregator *)self dataCollectionManager];
      long long v21 = [(HDDataAggregator *)self configuration];
      [v21 collectionLatency];
      double v23 = v22;
      [(id)v39[5] timeIntervalSinceNow];
      double v25 = v23 + v24;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_3;
      v27[3] = &unk_1E62FDB58;
      v27[4] = self;
      id v28 = v16;
      id v29 = v17;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_4;
      v26[3] = &unk_1E62FDAC0;
      v26[4] = self;
      *(CFAbsoluteTime *)&v26[5] = Current;
      [v20 performSaveWithMaximumLatency:v27 block:v26 completion:v25];
    }
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
  }
}

uint64_t __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_isKindOfClass())
  {
    int v4 = [*(id *)(a1 + 32) doesDatumPredateDatabaseObliteration:v3];
    if (v4)
    {
      _HKInitializeLogging();
      id v5 = *MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = *(void **)(a1 + 32);
        int v15 = 138543362;
        id v16 = v14;
        _os_log_debug_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting sensor datum from pre-obliteration", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t v6 = v4 ^ 1u;
  }
  else
  {
    _HKInitializeLogging();
    objc_super v7 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      id v9 = v7;
      id v10 = objc_opt_class();
      id v11 = *(void **)(a1 + 32);
      id v12 = v10;
      int v15 = 138543618;
      id v16 = v10;
      __int16 v17 = 2114;
      id v18 = (id)[v11 sensorDatumClass];
      id v13 = v18;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Rejecting sensor datum of unexpected class %{public}@ (expected %{public}@)", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

void __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_299(uint64_t a1)
{
  +[_HDAggregationStateKey keyForCollector:device:aggregator:]((uint64_t)_HDAggregationStateKey, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 72), "objectForKeyedSubscript:");
  if (!v2)
  {
    v2 = [*(id *)(a1 + 48) initialAggregationState];
    [*(id *)(*(void *)(a1 + 48) + 72) setObject:v2 forKeyedSubscript:v12];
  }
  id v3 = [v2 unaggregatedSensorData];
  int v4 = [v3 firstObject];
  id v5 = [v4 dateInterval];
  uint64_t v6 = [v5 endDate];

  objc_msgSend(v3, "hk_addObjectsFromArray:passingTest:", *(void *)(a1 + 56), *(void *)(a1 + 64));
  [v3 sortUsingComparator:&__block_literal_global_302_2];
  objc_super v7 = [v3 firstObject];
  uint64_t v8 = [v7 dateInterval];
  uint64_t v9 = [v8 endDate];
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if ([v6 isEqualToDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
}

uint64_t __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 dateInterval];
  objc_super v7 = [v6 endDate];
  uint64_t v8 = [v5 dateInterval];
  uint64_t v9 = [v8 endDate];
  uint64_t v10 = [v7 compare:v9];

  if (!v10)
  {
    id v11 = [v4 dateInterval];
    id v12 = [v11 startDate];
    id v13 = [v5 dateInterval];
    uint64_t v14 = [v13 startDate];
    uint64_t v10 = [v12 compare:v14];
  }
  return v10;
}

uint64_t __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_3(void **a1)
{
  return 1;
}

void __76__HDActiveDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x1E4F29F10];
  objc_super v7 = *MEMORY[0x1E4F29F10];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v9 = v6;
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
    int v13 = 138543874;
    uint64_t v14 = v11;
    __int16 v15 = 2048;
    CFAbsoluteTime v16 = v12;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Save failed after %0.2lfs: %{public}@", (uint8_t *)&v13, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = v6;
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2048;
    CFAbsoluteTime v16 = v10;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished save with latency %0.2lfs.", (uint8_t *)&v13, 0x16u);
LABEL_4:
  }
LABEL_6:
}

- (id)configurationForCollector:(id)a3
{
  [(HDActiveDataAggregator *)self aggregationInterval];
  double v5 = v4;
  uint64_t v6 = [(HDDataAggregator *)self configuration];
  if ([v6 hasActiveWorkout]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = +[HDDataCollectorConfiguration configurationWithType:v7 interval:v5 latency:v5];

  return v8;
}

- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    _HKInitializeLogging();
    int v13 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v18 = self;
      _os_log_fault_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_FAULT, "%{public}@: Persisted objects with a nil last datum.", buf, 0xCu);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)HDActiveDataAggregator;
  BOOL v14 = [(HDDataAggregator *)&v16 didPersistObjects:v10 lastDatum:v11 collector:v12 error:a6];

  return v14;
}

- (double)aggregationIntervalForCollector:(id)a3
{
  id v4 = a3;
  [(HDActiveDataAggregator *)self aggregationInterval];
  double v6 = v5;
  if (objc_opt_respondsToSelector())
  {
    [v4 preferredAggregationIntervalForAggregator:self];
    if (v6 >= v7 && v7 >= 0.0) {
      double v6 = v7;
    }
  }

  return v6;
}

- (Class)sensorDatumClass
{
  return 0;
}

- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9
{
  return 0;
}

- (double)aggregationInterval
{
  id v3 = [(HDDataAggregator *)self configuration];
  id v4 = [(HDDataAggregator *)self objectType];
  [v4 code];
  HKDefaultAggregationIntervalForType();
  double v6 = v5;

  [v3 aggregationInterval];
  if (v7 > 0.0)
  {
    double v8 = v7;
    if ((([v3 hasForegroundObserver] & 1) != 0 || objc_msgSend(v3, "hasActiveWorkout"))
      && v8 < v6)
    {
      double v6 = v8;
    }
  }

  return v6;
}

id __80__HDActiveDataAggregator__aggregateForAllDevicesForCollector_date_mode_options___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 16);
  }
  else {
    return 0;
  }
}

- (void)requestAggregationThroughDate:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HDActiveDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke;
  v15[3] = &unk_1E62FDBA0;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  int64_t v18 = a4;
  unint64_t v19 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDActiveDataAggregator;
  id v12 = v10;
  id v13 = v11;
  [(HDDataAggregator *)&v14 requestAggregationThroughDate:v12 mode:a4 options:a5 completion:v15];
}

void __80__HDActiveDataAggregator_requestAggregationThroughDate_mode_options_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2) {
    -[HDActiveDataAggregator _requestAggregationThroughDate:mode:options:completion:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void **)(a1 + 48));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)recomputeCollectorConfiguration
{
  v6.receiver = self;
  v6.super_class = (Class)HDActiveDataAggregator;
  [(HDDataAggregator *)&v6 recomputeCollectorConfiguration];
  id v3 = [(HDDataAggregator *)self dataCollectionManager];
  id v4 = [v3 sharedDelayedAggregationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HDActiveDataAggregator_recomputeCollectorConfiguration__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __57__HDActiveDataAggregator_recomputeCollectorConfiguration__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[10];
  [v1 aggregationInterval];

  return objc_msgSend(v2, "executeWithDelay:");
}

- (id)initialAggregationState
{
  v2 = [HDDataAggregationState alloc];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(HDDataAggregationState *)v2 initWithRemainingSensorData:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedAggregationOperation, 0);
  objc_storeStrong((id *)&self->_currentAggregationStates, 0);

  objc_storeStrong((id *)&self->_aggregationLock, 0);
}

@end