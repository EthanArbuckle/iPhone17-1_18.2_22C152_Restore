@interface HDDataCollectionManager
- (BOOL)sensorDataArrayReceived:(id)a3 deviceEntity:(id)a4 error:(id *)a5;
- (HDDataCollectionManager)init;
- (HDDataCollectionManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (OS_dispatch_queue)dataCollectionQueue;
- (OS_dispatch_queue)sharedDelayedAggregationQueue;
- (id)_dataAggregatorConfigurationForCollectorState:(void *)a1;
- (id)_dataCollectorBlacklist;
- (id)_queue_aggregatorForType:(uint64_t)a1;
- (id)_queue_observerMapForType:(uint64_t)a1;
- (id)aggregatorForType:(id)a3;
- (id)collectibleTypes;
- (id)diagnosticDescription;
- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 collectionIntervalsByType:(id)a4 observerState:(id)a5;
- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 sampleTypes:(id)a4 observer:(id)a5 observerState:(id)a6 collectionInterval:(double)a7;
- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 sampleTypes:(id)a4 observerState:(id)a5 collectionInterval:(double)a6;
- (id)unitTest_dataAggregatorConfigurationForType:(id)a3;
- (os_unfair_lock_s)_typeIsCollectible:(os_unfair_lock_s *)result;
- (void)_collectorLock_setupFakeCollector;
- (void)_queue_addDataCollector:(uint64_t)a1;
- (void)_queue_adjustDataCollectionForType:(void *)a3 block:;
- (void)_queue_collectionStateForType:(void *)a3;
- (void)_setAggregatorConfigurationChangeHandler:(id)a3;
- (void)addDataCollectionObserver:(id)a3 type:(id)a4 collectionInterval:(double)a5 state:(id)a6;
- (void)addDataCollector:(id)a3;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)dealloc;
- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)performSaveWithMaximumLatency:(double)a3 block:(id)a4 completion:(id)a5;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)periodicUpdate;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeDataCollectionObserver:(id)a3;
- (void)removeDataCollectionObserver:(id)a3 type:(id)a4;
- (void)requestAggregationThroughDate:(id)a3 types:(id)a4 mode:(int64_t)a5 options:(unint64_t)a6 completion:(id)a7;
- (void)startDataCollectionForType:(id)a3 observer:(id)a4 collectionInterval:(double)a5;
- (void)startFakingDataWithActivityType:(int64_t)a3 speed:(id)a4;
- (void)startFakingWithHKWorkoutActivityType:(unint64_t)a3;
- (void)stopDataCollectionForType:(id)a3 observer:(id)a4;
- (void)stopFakingData;
- (void)unitTest_addCollectibleType:(id)a3;
- (void)unitTest_setAggregator:(id)a3 forType:(id)a4;
- (void)unitTest_setPendingSaveCoalescingInterval:(double)a3;
@end

@implementation HDDataCollectionManager

- (void)startDataCollectionForType:(id)a3 observer:(id)a4 collectionInterval:(double)a5
{
  if (a3)
  {
    id v8 = a4;
    id v9 = a3;
    id v10 = +[HDDataCollectionObserverState dataCollectionObserverStateInForeground:1 hasRunningWorkout:0 hasBackgroundObserver:0];
    [(HDDataCollectionManager *)self addDataCollectionObserver:v8 type:v9 collectionInterval:v10 state:a5];
  }
}

- (void)addDataCollectionObserver:(id)a3 type:(id)a4 collectionInterval:(double)a5 state:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDDataCollectionManager.m", 325, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HDDataCollectionManager.m", 324, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"HDDataCollectionManager.m", 326, @"Invalid parameter not satisfying: %@", @"state != nil" object file lineNumber description];

LABEL_4:
  if (-[HDDataCollectionManager _typeIsCollectible:]((os_unfair_lock_s *)self, v12))
  {
    v14 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"AddObserver"];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__HDDataCollectionManager_addDataCollectionObserver_type_collectionInterval_state___block_invoke;
    block[3] = &unk_1E6306B88;
    id v21 = v11;
    double v26 = a5;
    id v22 = v13;
    v23 = self;
    id v24 = v12;
    id v25 = v14;
    id v16 = v14;
    dispatch_async(queue, block);
  }
}

void __83__HDDataCollectionManager_addDataCollectionObserver_type_collectionInterval_state___block_invoke(uint64_t a1)
{
  v2 = [_HDDataCollectionObserverWrapper alloc];
  v3 = *(void **)(a1 + 40);
  double v4 = *(double *)(a1 + 72);
  id v5 = *(id *)(a1 + 32);
  id v6 = v3;
  if (v2)
  {
    v17.receiver = v2;
    v17.super_class = (Class)_HDDataCollectionObserverWrapper;
    v7 = (_HDDataCollectionObserverWrapper *)objc_msgSendSuper2(&v17, sel_init);
    v2 = v7;
    if (v7)
    {
      objc_storeWeak(&v7->_observer, v5);
      v2->_collectionInterval = v4;
      objc_storeStrong((id *)&v2->_state, v3);
    }
  }

  id v8 = -[HDDataCollectionManager _queue_observerMapForType:](*(void *)(a1 + 48), *(void **)(a1 + 56));
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = *(void **)(a1 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__HDDataCollectionManager_addDataCollectionObserver_type_collectionInterval_state___block_invoke_2;
  v13[3] = &unk_1E62F30F8;
  id v14 = v8;
  v15 = v2;
  id v16 = *(id *)(a1 + 32);
  id v11 = v2;
  id v12 = v8;
  -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](v9, v10, v13);
  [*(id *)(a1 + 64) invalidate];
}

- (id)_queue_observerMapForType:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_11;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:sel__queue_observerMapForType_, a1, @"HDDataCollectionManager.m", 577, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];

LABEL_11:
    v7 = 0;
    goto LABEL_7;
  }
  double v4 = *(void **)(a1 + 128);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v5;

    double v4 = *(void **)(a1 + 128);
  }
  v7 = [v4 objectForKeyedSubscript:v3];
  if (!v7)
  {
    v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    [*(id *)(a1 + 128) setObject:v7 forKeyedSubscript:v3];
  }
LABEL_7:

  return v7;
}

- (void)_queue_adjustDataCollectionForType:(void *)a3 block:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v7 = [*(id *)(a1 + 72) objectForKeyedSubscript:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v8 = [*(id *)(a1 + 16) objectForKeyedSubscript:v5];
    uint64_t v9 = _Block_copy(*(const void **)(a1 + 96));
    id v10 = (void (**)(void, void, void))v9;
    if (v7 || v8 || v9)
    {
      v64 = v8;
      v62 = v7;
      long long v67 = 0u;
      long long v68 = 0u;
      [(HDDataCollectionManager *)(uint64_t)&v67 _queue_collectionStateForType:v5];
      v63 = v6;
      v6[2](v6);
      long long v65 = 0u;
      long long v66 = 0u;
      [(HDDataCollectionManager *)(uint64_t)&v65 _queue_collectionStateForType:v5];
      long long v14 = v67;
      uint64_t v15 = v68;
      int v16 = BYTE9(v68);
      int v17 = BYTE10(v68);
      int v18 = BYTE11(v68);
      long long v19 = v65;
      uint64_t v20 = v66;
      int v21 = BYTE9(v66);
      int v22 = BYTE10(v66);
      int v23 = BYTE11(v66);
      int v60 = BYTE8(v66);
      int v61 = BYTE8(v68);
      if (*(double *)&v67 == *(double *)&v65
        && *((double *)&v67 + 1) == *((double *)&v65 + 1)
        && *(double *)&v68 == *(double *)&v66
        && BYTE8(v68) == BYTE8(v66)
        && BYTE9(v68) == BYTE9(v66)
        && BYTE10(v68) == BYTE10(v66)
        && BYTE11(v68) == BYTE11(v66))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          _HKInitializeLogging();
          id v24 = (void *)*MEMORY[0x1E4F29F10];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
          {
            v55 = NSString;
            if (v61) {
              id v25 = @"ACTIVE";
            }
            else {
              id v25 = @"inactive";
            }
            if (v16) {
              double v26 = @"FOREGROUND";
            }
            else {
              double v26 = @"background";
            }
            if (v17) {
              v27 = @"WORKOUT";
            }
            else {
              v27 = &stru_1F1728D60;
            }
            if (v18) {
              v28 = @"BACKGROUND RUNNING";
            }
            else {
              v28 = &stru_1F1728D60;
            }
            log = v24;
            v54 = [v55 stringWithFormat:@"(%0.2lfs, latency %0.2lfs, series %0.2lfs, %@, %@, %@, %@)", v14, v15, v25, v26, v27, v28];
            id v29 = v5;
            v30 = (void *)[@"{\n" mutableCopy];
            v56 = v29;
            v31 = [*(id *)(a1 + 128) objectForKeyedSubscript:v29];
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            v32 = v31;
            v33 = [v31 objectEnumerator];
            uint64_t v34 = [v33 countByEnumeratingWithState:&v69 objects:buf count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v70;
              do
              {
                for (uint64_t i = 0; i != v35; ++i)
                {
                  if (*(void *)v70 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  [v30 appendFormat:@"\t%@\n", *(void *)(*((void *)&v69 + 1) + 8 * i)];
                }
                uint64_t v35 = [v33 countByEnumeratingWithState:&v69 objects:buf count:16];
              }
              while (v35);
            }

            [v30 appendString:@"}"];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v54;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v30;
            _os_log_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Collection state not changing %{public}@. Observers: %{public}@", buf, 0x20u);
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        v38 = (void *)*MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          if (v61) {
            v39 = @"ACTIVE";
          }
          else {
            v39 = @"inactive";
          }
          v57 = v39;
          os_log_t loga = (os_log_t)NSString;
          if (v16) {
            v40 = @"FOREGROUND";
          }
          else {
            v40 = @"background";
          }
          if (v17) {
            v41 = @"WORKOUT";
          }
          else {
            v41 = &stru_1F1728D60;
          }
          if (v18) {
            v42 = @"BACKGROUND RUNNING";
          }
          else {
            v42 = &stru_1F1728D60;
          }
          v43 = v38;
          v44 = [loga stringWithFormat:@"(%0.2lfs, latency %0.2lfs, series %0.2lfs, %@, %@, %@, %@)", v14, v15, v57, v40, v41, v42];
          v45 = @"inactive";
          if (v60) {
            v45 = @"ACTIVE";
          }
          v46 = @"background";
          if (v21) {
            v46 = @"FOREGROUND";
          }
          v47 = @"WORKOUT";
          if (!v22) {
            v47 = &stru_1F1728D60;
          }
          v48 = @"BACKGROUND RUNNING";
          if (!v23) {
            v48 = &stru_1F1728D60;
          }
          v49 = [NSString stringWithFormat:@"(%0.2lfs, latency %0.2lfs, series %0.2lfs, %@, %@, %@, %@)", v19, v20, v45, v46, v47, v48];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v44;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v49;
          _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: Collection state %{public}@ -> %{public}@", buf, 0x20u);
        }
      }
      v7 = v62;
      id v6 = v63;
      id v8 = v64;
      if (v62)
      {
        id v50 = v62;
        id v51 = v5;
        if (*(double *)&v14 != *(double *)&v19) {
          [v50 updateCollectionInterval:v51 forType:*(double *)&v19];
        }
        if (v61)
        {
          if (!v60) {
            [v50 collectionStoppedForType:v51];
          }
        }
        else if (v60)
        {
          [v50 collectionStartedForType:v51 collectionInterval:*(double *)&v19];
        }
      }
      if (v64)
      {
        *(_OWORD *)buf = v65;
        *(_OWORD *)&buf[16] = v66;
        v52 = -[HDDataCollectionManager _dataAggregatorConfigurationForCollectorState:]((void *)a1, (uint64_t)buf);
        [v64 setConfiguration:v52];
      }
      if (v10)
      {
        *(_OWORD *)buf = v65;
        *(_OWORD *)&buf[16] = v66;
        v53 = -[HDDataCollectionManager _dataAggregatorConfigurationForCollectorState:]((void *)a1, (uint64_t)buf);
        ((void (**)(void, id, void *))v10)[2](v10, v5, v53);
      }
    }
    else
    {
      v6[2](v6);
      _HKInitializeLogging();
      id v11 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v5;
        id v13 = *(id *)&buf[4];
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: No data collector and aggregrator for type : %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_queue_collectionStateForType:(void *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v45 = v5;
  if (a2)
  {
    id v6 = v5;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 136));
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    v7 = *(NSObject **)(a2 + 136);
    id v8 = v6;
    dispatch_assert_queue_V2(v7);
    [v8 code];
    HKDefaultAggregationIntervalForType();
    double v10 = v9;
    [v8 code];
    HKDefaultCollectionLatencyForType();
    double v12 = v11;
    [v8 code];

    HKDefaultMaximumSeriesDurationForType();
    double v14 = v13;
    *(void *)(a1 + 24) = 0;
    *(double *)a1 = v10;
    *(double *)(a1 + 8) = v12;
    *(double *)(a1 + 16) = v13;
    [v8 code];
    HKDefaultMaximumSeriesDurationForType();
    double v16 = v15;
    -[HDDataCollectionManager _queue_observerMapForType:](a2, v8);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v44 = long long v52 = 0u;
    id obj = [v44 objectEnumerator];
    uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v48)
    {
      LODWORD(v17) = 0;
      LODWORD(v18) = 0;
      LODWORD(v19) = 0;
      uint64_t v47 = *(void *)v50;
      double v20 = *MEMORY[0x1E4F29970];
      if (v16 <= 0.0) {
        double v16 = *MEMORY[0x1E4F29970];
      }
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v50 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * v21);
          if (v22)
          {
            double v23 = *(double *)(v22 + 24);
            id v24 = *(void **)(v22 + 16);
          }
          else
          {
            id v24 = 0;
            double v23 = 0.0;
          }
          id v25 = v24;
          int v26 = [v25 isInForeground];
          if (v22) {
            v27 = *(void **)(v22 + 16);
          }
          else {
            v27 = 0;
          }
          id v28 = v27;
          int v29 = [v28 hasRunningWorkout];
          if (v22) {
            v30 = *(void **)(v22 + 16);
          }
          else {
            v30 = 0;
          }
          int v31 = [v30 hasBackgroundObserver];

          if (v10 > 0.0) {
            double v32 = v10;
          }
          else {
            double v32 = v20;
          }
          if (v23 > 0.0) {
            double v33 = v23;
          }
          else {
            double v33 = v20;
          }
          if (v32 >= v33) {
            double v10 = v33;
          }
          else {
            double v10 = v32;
          }
          if (v12 > 0.0) {
            double v34 = v12;
          }
          else {
            double v34 = v20;
          }
          if (v34 >= v33) {
            double v12 = v33;
          }
          else {
            double v12 = v34;
          }
          if (v14 > 0.0) {
            double v35 = v14;
          }
          else {
            double v35 = v20;
          }
          if (v35 >= v16) {
            double v14 = v16;
          }
          else {
            double v14 = v35;
          }
          if (v19) {
            int v36 = 1;
          }
          else {
            int v36 = v26;
          }
          BOOL v37 = v36 == 0;
          unint64_t v38 = 257;
          if (v37) {
            unint64_t v38 = 1;
          }
          if (v18) {
            int v39 = 1;
          }
          else {
            int v39 = v29;
          }
          BOOL v37 = v39 == 0;
          unint64_t v40 = 0x10000;
          if (v37) {
            unint64_t v40 = 0;
          }
          if (v17) {
            int v41 = 1;
          }
          else {
            int v41 = v31;
          }
          BOOL v37 = v41 == 0;
          unint64_t v42 = 0x1000000;
          if (v37) {
            unint64_t v42 = 0;
          }
          *(double *)a1 = v10;
          *(double *)(a1 + 8) = v12;
          *(double *)(a1 + 16) = v14;
          *(void *)(a1 + 24) = v40 | v42 | v38;
          unint64_t v19 = v38 >> 8;
          ++v21;
          unint64_t v18 = v40 >> 16;
          unint64_t v17 = v42 >> 24;
        }
        while (v48 != v21);
        uint64_t v43 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
        uint64_t v48 = v43;
      }
      while (v43);
    }
  }
  else
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
}

uint64_t __83__HDDataCollectionManager_addDataCollectionObserver_type_collectionInterval_state___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)stopDataCollectionForType:(id)a3 observer:(id)a4
{
  if (a3) {
    [(HDDataCollectionManager *)self removeDataCollectionObserver:a4 type:a3];
  }
}

- (void)removeDataCollectionObserver:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDDataCollectionManager.m", 345, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDDataCollectionManager.m", 346, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  double v9 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"RemoveObserver"];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HDDataCollectionManager_removeDataCollectionObserver_type___block_invoke;
  block[3] = &unk_1E62F6A40;
  void block[4] = self;
  id v17 = v8;
  id v18 = v7;
  id v19 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(queue, block);
}

void __61__HDDataCollectionManager_removeDataCollectionObserver_type___block_invoke(uint64_t a1)
{
  v2 = -[HDDataCollectionManager _queue_observerMapForType:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(a1 + 40);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __61__HDDataCollectionManager_removeDataCollectionObserver_type___block_invoke_2;
  double v9 = &unk_1E62F31C0;
  id v10 = v2;
  id v11 = *(id *)(a1 + 48);
  id v5 = v2;
  -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](v3, v4, &v6);
  objc_msgSend(*(id *)(a1 + 56), "invalidate", v6, v7, v8, v9);
}

uint64_t __61__HDDataCollectionManager_removeDataCollectionObserver_type___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)periodicUpdate
{
  uint64_t v3 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"Periodic"];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HDDataCollectionManager_periodicUpdate__block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_sync(queue, block);
  [v3 invalidate];
}

void __41__HDDataCollectionManager_periodicUpdate__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  id v5 = [*(id *)(*(void *)(a1 + 32) + 72) allValues];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "updateHistoricalData", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)removeDataCollectionObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDDataCollectionManager.m", 360, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];
  }
  id v6 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"RemoveObserver"];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HDDataCollectionManager_removeDataCollectionObserver___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(queue, block);
}

uint64_t __56__HDDataCollectionManager_removeDataCollectionObserver___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 128);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKeyedSubscript:v7];
        id v9 = [v8 objectForKey:*(void *)(a1 + 40)];

        if (v9)
        {
          uint64_t v10 = *(void *)(a1 + 32);
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __56__HDDataCollectionManager_removeDataCollectionObserver___block_invoke_2;
          v12[3] = &unk_1E62F31C0;
          id v13 = v8;
          id v14 = *(id *)(a1 + 40);
          -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](v10, v7, v12);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 48) invalidate];
}

uint64_t __56__HDDataCollectionManager_removeDataCollectionObserver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)aggregatorForType:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__189;
    long long v17 = __Block_byref_object_dispose__189;
    id v18 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HDDataCollectionManager_aggregatorForType___block_invoke;
    block[3] = &unk_1E62FEE30;
    id v12 = &v13;
    void block[4] = self;
    id v11 = v5;
    dispatch_sync(queue, block);
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDDataCollectionManager.m", 263, @"Invalid parameter not satisfying: %@", @"objectType != nil" object file lineNumber description];

    id v7 = 0;
  }

  return v7;
}

- (void)_queue_addDataCollector:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    _HKInitializeLogging();
    uint64_t v4 = (os_log_t *)MEMORY[0x1E4F29F10];
    id v5 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_INFO))
    {
      LODWORD(v11) = 138412290;
      *(void *)((char *)&v11 + 4) = v3;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_INFO, "Adding data collector: %@", (uint8_t *)&v11, 0xCu);
    }
    id v6 = [(id)objc_opt_class() observedType];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v7 = [*(id *)(a1 + 72) objectForKeyedSubscript:v6];

    if (v7)
    {
      _HKInitializeLogging();
      id v8 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v11) = 138543362;
        *(void *)((char *)&v11 + 4) = v6;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Data collector already exists for type %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v9 = *(void **)(a1 + 72);
      uint64_t v10 = [(id)objc_opt_class() observedType];
      [v9 setObject:v3 forKey:v10];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    long long v11 = 0u;
    long long v12 = 0u;
    [(HDDataCollectionManager *)(uint64_t)&v11 _queue_collectionStateForType:v6];
    if (BYTE8(v12)) {
      [v3 collectionStartedForType:v6 collectionInterval:*(double *)&v11];
    }
  }
}

void __45__HDDataCollectionManager_aggregatorForType___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[HDDataCollectionManager _queue_aggregatorForType:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_aggregatorForType:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__queue_aggregatorForType_, a1, @"HDDataCollectionManager.m", 278, @"Invalid parameter not satisfying: %@", @"objectType != nil" object file lineNumber description];
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    if (-[HDDataCollectionManager _typeIsCollectible:]((os_unfair_lock_s *)a1, v4))
    {
      id v5 = [*(id *)(a1 + 16) objectForKeyedSubscript:v4];
      if (v5) {
        goto LABEL_11;
      }
      uint64_t v6 = HDCreateDataAggregatorForType((void *)a1, v4);
      if (v6)
      {
        id v5 = (void *)v6;
        [*(id *)(a1 + 16) setObject:v6 forKeyedSubscript:v4];
        [v5 resume];
        -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](a1, v4, &__block_literal_global_226);
        goto LABEL_11;
      }
      _HKInitializeLogging();
      id v7 = *MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        long long v11 = v4;
        _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "Aggregator couldn't be found for type %{private}@", buf, 0xCu);
      }
    }
  }
  id v5 = 0;
LABEL_11:

  return v5;
}

- (HDDataCollectionManager)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDataCollectionManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)HDDataCollectionManager;
  id v5 = [(HDDataCollectionManager *)&v46 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_collectorLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = HKCreateSerialDispatchQueue();
    dataCollectionQueue = v6->_dataCollectionQueue;
    v6->_dataCollectionQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = HKCreateSerialDispatchQueue();
    sharedDelayedAggregationQueue = v6->_sharedDelayedAggregationQueue;
    v6->_sharedDelayedAggregationQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = HKCreateSerialDispatchQueue();
    assertionQueue = v6->_assertionQueue;
    v6->_assertionQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    collectorLock_dataCollectorsByType = v6->_collectorLock_dataCollectorsByType;
    v6->_collectorLock_dataCollectorsByType = v15;

    long long v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dataAggregatorsByType = v6->_dataAggregatorsByType;
    v6->_dataAggregatorsByType = v17;

    _HKInitializeLogging();
    id v19 = [HDDatabaseCoalescedWritePool alloc];
    uint64_t v20 = (void *)MEMORY[0x1E4F29F10];
    uint64_t v21 = [(HDDatabaseCoalescedWritePool *)v19 initWithProfile:v4 name:@"data-collection-coalescing" loggingCategory:*MEMORY[0x1E4F29F10]];
    pendingSavePool = v6->_pendingSavePool;
    v6->_pendingSavePool = (HDDatabaseCoalescedWritePool *)v21;

    double v23 = [[HDCoalescedTaskPoolQuota alloc] initWithAvailableQuota:5 maximumQuota:5 refillInterval:1.0 minimumInterval:0.1 lastTrigger:CFAbsoluteTimeGetCurrent()];
    [(HDDatabaseCoalescedWritePool *)v6->_pendingSavePool setQuota:v23];

    v6->unitTest_hasSetPendingSaveCoalescingInterval = 0;
    v6->_privacyPreferencesNotificationToken = -1;
    id v24 = [v4 daemon];
    id v25 = [v24 behavior];
    int v26 = [v25 shouldRegisterPeriodicActivities];

    if (v26)
    {
      v27 = [v4 daemon];
      id v28 = [v27 behavior];
      int v29 = [v28 isAppleWatch];

      if (v29)
      {
        v30 = [[HDPeriodicActivity alloc] initWithProfile:v4 name:@"com.apple.healthd.periodic-data-collection" interval:v6 delegate:*v20 loggingCategory:900.0];
        periodicUpdateActivity = v6->_periodicUpdateActivity;
        v6->_periodicUpdateActivity = v30;
      }
      else
      {
        double v32 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__HDDataCollectionManager_initWithProfile___block_invoke;
        block[3] = &unk_1E62F31C0;
        v44 = v6;
        id v45 = v4;
        dispatch_async(v32, block);

        periodicUpdateActivity = (HDPeriodicActivity *)v44;
      }
    }
    double v33 = [v4 sessionAssertionManager];
    [v33 addObserver:v6 forAssertionIdentifier:@"HDDataCollectionAssertionIdentifier" queue:v6->_assertionQueue];

    double v34 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v34 addObject:v6];

    [v4 registerProfileReadyObserver:v6 queue:0];
    double v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastFlushDateByType = v6->_lastFlushDateByType;
    v6->_lastFlushDateByType = v35;

    BOOL v37 = [[HDSeriesQuantityEventObserver alloc] initWithProfile:v4];
    seriesQuantityEventObserver = v6->_seriesQuantityEventObserver;
    v6->_seriesQuantityEventObserver = v37;

    int v39 = v6->_queue;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __43__HDDataCollectionManager_initWithProfile___block_invoke_2;
    v41[3] = &unk_1E62F3208;
    unint64_t v42 = v6;
    dispatch_async(v39, v41);
  }
  return v6;
}

void __43__HDDataCollectionManager_initWithProfile___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F22258] isStepCountingAvailable])
  {
    uint64_t v2 = [HDPeriodicActivity alloc];
    uint64_t v3 = [(HDPeriodicActivity *)v2 initWithProfile:*(void *)(a1 + 40) name:@"com.apple.healthd.periodic-data-collection" interval:*(void *)(a1 + 32) delegate:*MEMORY[0x1E4F29F10] loggingCategory:3600.0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;
  }
}

void __43__HDDataCollectionManager_initWithProfile___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  -[HDDataCollectionManager _queue_aggregatorForType:](*(void *)(a1 + 32), v2);
}

- (void)dealloc
{
  int privacyPreferencesNotificationToken = self->_privacyPreferencesNotificationToken;
  if (privacyPreferencesNotificationToken != -1) {
    notify_cancel(privacyPreferencesNotificationToken);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained sessionAssertionManager];
  [v5 removeObserver:self];

  uint64_t v6 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v6 removeObject:self];

  v7.receiver = self;
  v7.super_class = (Class)HDDataCollectionManager;
  [(HDDataCollectionManager *)&v7 dealloc];
}

- (os_unfair_lock_s)_typeIsCollectible:(os_unfair_lock_s *)result
{
  if (result)
  {
    id v2 = result;
    id v3 = a2;
    uint64_t v4 = -[HDDataCollectionManager collectibleTypes](v2);
    uint64_t v5 = [v4 containsObject:v3];

    return (os_unfair_lock_s *)v5;
  }
  return result;
}

- (void)performSaveWithMaximumLatency:(double)a3 block:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  double v10 = fmin(a3, 60.0);
  if (v10 >= 0.1) {
    double unitTest_pendingSaveCoalescingInterval = v10;
  }
  else {
    double unitTest_pendingSaveCoalescingInterval = 0.1;
  }
  if (self->unitTest_hasSetPendingSaveCoalescingInterval) {
    double unitTest_pendingSaveCoalescingInterval = self->unitTest_pendingSaveCoalescingInterval;
  }
  _HKInitializeLogging();
  uint64_t v12 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    id v14 = self;
    __int16 v15 = 2048;
    double v16 = unitTest_pendingSaveCoalescingInterval;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "%{public}@: perform delayed write with maximum latency %0.2f", (uint8_t *)&v13, 0x16u);
  }
  [(HDDatabaseCoalescedWritePool *)self->_pendingSavePool performWriteWithMaximumLatency:v8 block:v9 completion:unitTest_pendingSaveCoalescingInterval];
}

uint64_t __66__HDDataCollectionManager__dataCollectionObserver_didChangeState___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 128);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_super v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKeyedSubscript:v7];
        id v9 = [v8 objectForKey:*(void *)(a1 + 40)];
        double v10 = v9;
        if (v9)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __66__HDDataCollectionManager__dataCollectionObserver_didChangeState___block_invoke_2;
          v13[3] = &unk_1E62F31C0;
          id v14 = v9;
          id v15 = *(id *)(a1 + 48);
          -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](v11, v7, v13);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 56) invalidate];
}

void __66__HDDataCollectionManager__dataCollectionObserver_didChangeState___block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 16);
  }
}

- (void)requestAggregationThroughDate:(id)a3 types:(id)a4 mode:(int64_t)a5 options:(unint64_t)a6 completion:(id)a7
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v10 = a4;
  id v11 = a7;
  unint64_t v42 = v10;
  if ([v10 count])
  {
    id v49 = v43;
    id v41 = v10;
    id v39 = v11;
    id v12 = v11;
    if (self)
    {
      int v13 = (NSObject **)MEMORY[0x1E4F29F10];
      os_signpost_id_t v14 = _HKLogSignpostIDGenerate();
      _HKInitializeLogging();
      id v15 = *v13;
      if (os_signpost_enabled(v15))
      {
        long long v16 = v15;
        long long v17 = v16;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          *(_DWORD *)buf = 138543874;
          id v103 = v49;
          __int16 v104 = 2048;
          uint64_t v105 = [v41 count];
          __int16 v106 = 2048;
          int64_t v107 = a5;
          _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "aggregation-request", "date=%{public}@, types=%ld, mode=%ld", buf, 0x20u);
        }
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke;
      aBlock[3] = &unk_1E630C380;
      id v66 = v12;
      os_signpost_id_t v67 = v14;
      unint64_t v40 = _Block_copy(aBlock);
      dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x2020000000;
      char v64 = 1;
      v61[0] = 0;
      v61[1] = v61;
      v61[2] = 0x3032000000;
      v61[3] = __Block_byref_object_copy__189;
      v61[4] = __Block_byref_object_dispose__189;
      id v62 = 0;
      long long v18 = dispatch_group_create();
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id obj = v41;
      uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:buf count:16];
      if (v19)
      {
        uint64_t v45 = *(void *)v58;
        do
        {
          uint64_t v47 = v19;
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v58 != v45) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            dispatch_group_enter(v18);
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            long long v51 = __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_356;
            long long v52 = &unk_1E630C3D0;
            v53 = self;
            v55 = v63;
            v56 = v61;
            uint64_t v54 = v18;
            id v22 = v49;
            id v23 = v21;
            id v24 = v50;
            dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            uint64_t v96 = 0;
            v97 = &v96;
            uint64_t v98 = 0x3032000000;
            v99 = __Block_byref_object_copy__189;
            v100 = __Block_byref_object_dispose__189;
            id v101 = 0;
            uint64_t v90 = 0;
            v91 = &v90;
            uint64_t v92 = 0x3032000000;
            v93 = __Block_byref_object_copy__189;
            v94 = __Block_byref_object_dispose__189;
            id v95 = 0;
            uint64_t v86 = 0;
            v87 = &v86;
            uint64_t v88 = 0x2020000000;
            char v89 = 0;
            queue = self->_queue;
            uint64_t block = MEMORY[0x1E4F143A8];
            uint64_t v76 = 3221225472;
            v77 = __87__HDDataCollectionManager__requestAggregationThroughDate_type_mode_options_completion___block_invoke;
            v78 = &unk_1E630C420;
            v79 = self;
            v81 = &v96;
            id v27 = v23;
            id v80 = v27;
            v82 = &v90;
            CFAbsoluteTime v85 = Current;
            unint64_t v84 = a6;
            v83 = &v86;
            dispatch_sync(queue, &block);
            if (*((unsigned char *)v87 + 24))
            {
              os_signpost_id_t v28 = _HKLogSignpostIDGenerate();
              _HKInitializeLogging();
              int v29 = (void *)*MEMORY[0x1E4F29F10];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_INFO))
              {
                v30 = v29;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  int v31 = HDDataAggregationRequestModeToString(a5);
                  *(_DWORD *)v108 = 138543874;
                  id v109 = v31;
                  __int16 v110 = 2114;
                  id v111 = v27;
                  __int16 v112 = 2114;
                  int64_t v113 = (int64_t)v49;
                  _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_INFO, "Requesting %{public}@ aggregation of type %{public}@ through %{public}@", v108, 0x20u);
                }
              }
              _HKInitializeLogging();
              double v32 = (void *)*MEMORY[0x1E4F29F10];
              if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F10]))
              {
                double v33 = v32;
                double v34 = v33;
                if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
                {
                  *(_DWORD *)v108 = 138543874;
                  id v109 = v49;
                  __int16 v110 = 2114;
                  id v111 = v27;
                  __int16 v112 = 2048;
                  int64_t v113 = a5;
                  _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v28, "aggregation-request-single", "date=%{public}@, type=%{public}@, mode=%ld", v108, 0x20u);
                }
              }
              v68[0] = MEMORY[0x1E4F143A8];
              v68[1] = 3221225472;
              v68[2] = __87__HDDataCollectionManager__requestAggregationThroughDate_type_mode_options_completion___block_invoke_357;
              v68[3] = &unk_1E630C448;
              os_signpost_id_t v72 = v28;
              CFAbsoluteTime v73 = Current;
              int64_t v74 = a5;
              id v69 = v27;
              id v35 = v22;
              id v70 = v35;
              id v71 = v24;
              id v24 = _Block_copy(v68);
              int v36 = (void *)v97[5];
              if (v36)
              {
                [v36 updateHistoricalDataForcedUpdate:1 completion:v24];
              }
              else
              {
                BOOL v37 = (void *)v91[5];
                if (v37) {
                  [v37 requestAggregationThroughDate:v35 mode:a5 options:a6 completion:v24];
                }
                else {
                  ((void (*)(void *, uint64_t, void))v24[2])(v24, 1, 0);
                }
              }
            }
            else
            {
              v51((uint64_t)v24, 1, 0);
            }

            _Block_object_dispose(&v86, 8);
            _Block_object_dispose(&v90, 8);

            _Block_object_dispose(&v96, 8);
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:buf count:16];
        }
        while (v19);
      }

      unint64_t v38 = self->_queue;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v76 = 3221225472;
      v77 = __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_3;
      v78 = &unk_1E630C3F8;
      v81 = v63;
      v79 = self;
      id v12 = v40;
      id v80 = v12;
      v82 = v61;
      dispatch_group_notify(v18, v38, &block);

      _Block_object_dispose(v61, 8);
      _Block_object_dispose(v63, 8);
    }
    id v11 = v39;
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
  }
}

void __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x1E4F29F10];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F10]))
  {
    objc_super v7 = v6;
    id v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 40);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      id v10 = "no";
      if (a2) {
        id v10 = "YES";
      }
      int v11 = 136446210;
      id v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "aggregation-request", "success=%{public}s", (uint8_t *)&v11, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_356(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_2;
  block[3] = &unk_1E630C3A8;
  char v14 = a2;
  uint64_t v13 = *(void *)(a1 + 56);
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  char v3 = *(unsigned char *)(v2 + 24);
  if (v3) {
    char v3 = *(unsigned char *)(a1 + 64) != 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  uint64_t v6 = v7;
  if (!v7) {
    uint64_t v6 = *(void **)(a1 + 32);
  }
  objc_storeStrong(v5, v6);
  id v8 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v8);
}

uint64_t __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_3(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    return [*(id *)(a1[4] + 32) flushPendingWriteQueueWithCompletion:a1[5]];
  }
  else {
    return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], 0, *(void *)(*(void *)(a1[7] + 8) + 40));
  }
}

void __87__HDDataCollectionManager__requestAggregationThroughDate_type_mode_options_completion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(a1 + 72);
  double v9 = *(double *)(a1 + 80);
  id v10 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  if ((v8 & 1) != 0 || v9 - v12 > 5.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 80)];
    [*(id *)(*(void *)(a1 + 32) + 88) setObject:v13 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void __87__HDDataCollectionManager__requestAggregationThroughDate_type_mode_options_completion___block_invoke_357(uint64_t a1, int a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void **)MEMORY[0x1E4F29F10];
  id v7 = (void *)*MEMORY[0x1E4F29F10];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F10]))
  {
    uint64_t v8 = v7;
    double v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 56);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      double v11 = "no";
      if (a2) {
        double v11 = "YES";
      }
      int v23 = 136446210;
      id v24 = v11;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v9, OS_SIGNPOST_INTERVAL_END, v10, "aggregation-request-single", "success=%{public}s", (uint8_t *)&v23, 0xCu);
    }
  }
  double v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
  _HKInitializeLogging();
  id v13 = *v6;
  char v14 = *v6;
  if (!a2)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v20 = *(void *)(a1 + 72);
    long long v16 = v13;
    HDDataAggregationRequestModeToString(v20);
    long long v17 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    int v23 = 138544386;
    id v24 = v17;
    __int16 v25 = 2114;
    uint64_t v26 = v21;
    __int16 v27 = 2114;
    uint64_t v28 = v22;
    __int16 v29 = 2048;
    double v30 = v12;
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Failed to complete %{public}@ aggregation of type %{public}@ through %{public}@ in %0.2lfs: %{public}@", (uint8_t *)&v23, 0x34u);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 72);
    long long v16 = v13;
    HDDataAggregationRequestModeToString(v15);
    long long v17 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    int v23 = 138544130;
    id v24 = v17;
    __int16 v25 = 2114;
    uint64_t v26 = v18;
    __int16 v27 = 2114;
    uint64_t v28 = v19;
    __int16 v29 = 2048;
    double v30 = v12;
    _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "Finished %{public}@ aggregation of type %{public}@ through %{public}@ in %0.2lfs", (uint8_t *)&v23, 0x2Au);
LABEL_11:
  }
LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 sampleTypes:(id)a4 observerState:(id)a5 collectionInterval:(double)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = [NSNumber numberWithDouble:a6];
        [v12 setObject:v19 forKeyedSubscript:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  uint64_t v20 = [(HDDataCollectionManager *)self takeCollectionAssertionWithOwnerIdentifier:v9 collectionIntervalsByType:v12 observerState:v11];

  return v20;
}

- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 collectionIntervalsByType:(id)a4 observerState:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  double v12 = [v9 allKeys];
  id v13 = [v11 setWithArray:v12];

  uint64_t v14 = -[HDDataCollectionManager collectibleTypes]((os_unfair_lock_s *)self);
  int v15 = [v13 intersectsSet:v14];

  if (v15)
  {
    uint64_t v16 = [HDDataCollectionAssertion alloc];
    id v17 = v13;
    id v18 = v10;
    uint64_t v19 = self;
    id v45 = v8;
    if (v16)
    {
      *(void *)long long v50 = v16;
      *(void *)&v50[8] = HDDataCollectionAssertion;
      id v20 = objc_msgSendSuper2((objc_super *)v50, sel_initWithAssertionIdentifier_ownerIdentifier_, @"HDDataCollectionAssertionIdentifier", v8);
      if (v20)
      {
        uint64_t v21 = [v17 copy];
        uint64_t v22 = (void *)*((void *)v20 + 12);
        *((void *)v20 + 12) = v21;

        uint64_t v23 = [v18 copy];
        long long v24 = (void *)*((void *)v20 + 11);
        *((void *)v20 + 11) = v23;

        objc_storeWeak((id *)v20 + 14, v19);
        *((_DWORD *)v20 + 20) = 0;
      }
    }
    else
    {
      id v20 = 0;
    }

    v44 = v17;
    id WeakRetained = objc_loadWeakRetained((id *)&v19->_profile);
    long long v26 = [WeakRetained sessionAssertionManager];
    char v27 = [v26 takeAssertion:v20];

    if (v27)
    {
      id v42 = v10;
      id v43 = v9;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v28 = v9;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v47 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            double v34 = objc_msgSend(v28, "objectForKeyedSubscript:", v33, v42, v43);
            [v34 doubleValue];
            -[HDDataCollectionManager addDataCollectionObserver:type:collectionInterval:state:](v19, "addDataCollectionObserver:type:collectionInterval:state:", v20, v33, v18);
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
        }
        while (v30);
      }

      _HKInitializeLogging();
      id v35 = (void *)*MEMORY[0x1E4F29F10];
      id v8 = v45;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        int v36 = v35;
        BOOL v37 = [v44 allObjects];
        unint64_t v38 = [v37 componentsJoinedByString:@", "];
        *(_DWORD *)long long v50 = 138544130;
        *(void *)&v50[4] = v19;
        *(_WORD *)&v50[12] = 2114;
        *(void *)&v50[14] = v45;
        __int16 v51 = 2114;
        id v52 = v18;
        __int16 v53 = 2114;
        uint64_t v54 = v38;
        _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: Taking collection assertion for %{public}@ with state %{public}@ for (%{public}@)", v50, 0x2Au);
      }
      id v39 = v20;
      id v10 = v42;
      id v9 = v43;
    }
    else
    {
      _HKInitializeLogging();
      unint64_t v40 = *MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v50 = 138543618;
        *(void *)&v50[4] = v8;
        *(_WORD *)&v50[12] = 2114;
        *(void *)&v50[14] = v44;
        _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "Failed to take collection assertion for %{public}@ for %{public}@", v50, 0x16u);
      }
      id v39 = 0;
    }
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

- (id)collectibleTypes
{
  v1 = (id *)a1;
  v18[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a1 + 14;
    os_unfair_lock_lock(a1 + 14);
    id v3 = v1[13];
    if (!v3)
    {
      id WeakRetained = objc_loadWeakRetained(v1 + 15);
      id v5 = [WeakRetained daemon];
      uint64_t v6 = [v5 behavior];
      [v6 isRunningStoreDemoMode];
      uint64_t v7 = HKAllCollectibleTypesWithStoreDemoModeEnabled();
      id v8 = v1[13];
      v1[13] = (id)v7;

      id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v10 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D8]];
      id v11 = objc_msgSend(MEMORY[0x1E4F2B3B8], "quantityTypeForIdentifier:", *MEMORY[0x1E4F2A8F8], v10);
      v18[1] = v11;
      double v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
      v18[2] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
      uint64_t v14 = (void *)[v9 initWithArray:v13];

      uint64_t v15 = [v1[13] setByAddingObjectsFromSet:v14];
      id v16 = v1[13];
      v1[13] = (id)v15;

      id v3 = v1[13];
    }
    v1 = (id *)v3;
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assertionQueue);
  _HKInitializeLogging();
  uint64_t v6 = (id)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 ownerIdentifier];
    if (v5) {
      id v8 = (void *)v5[12];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    id v10 = [v9 allObjects];
    id v11 = [v10 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating collection assertion for %{public}@ for (%{public}@)", buf, 0x20u);
  }
  double v12 = [MEMORY[0x1E4F1C9C8] date];
  if (v5) {
    uint64_t v13 = v5[12];
  }
  else {
    uint64_t v13 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__HDDataCollectionManager_assertionManager_assertionInvalidated___block_invoke;
  v15[3] = &unk_1E62F5D48;
  id v16 = v5;
  id v17 = self;
  uint64_t v14 = v5;
  [(HDDataCollectionManager *)self requestAggregationThroughDate:v12 types:v13 mode:0 options:0 completion:v15];
}

void __65__HDDataCollectionManager_assertionManager_assertionInvalidated___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x1E4F29F10];
  uint64_t v7 = *MEMORY[0x1E4F29F10];
  if (a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      uint64_t v8 = *(void *)(v8 + 96);
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v8;
    id v9 = v6;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "Completed aggregation of types %{public}@ after assertion invalidation.", buf, 0xCu);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v16 = *(void *)(v16 + 96);
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v16;
    __int16 v24 = 2114;
    id v25 = v5;
    id v9 = v6;
    _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Failed to aggregate to current time for types %{public}@ after assertion invalidation: %{public}@", buf, 0x16u);
LABEL_6:
  }
LABEL_8:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *(void **)(a1 + 32);
  if (v10) {
    id v10 = (void *)v10[12];
  }
  id v11 = v10;
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
        objc_msgSend(*(id *)(a1 + 40), "removeDataCollectionObserver:type:", *(void *)(a1 + 32), *(void *)(*((void *)&v17 + 1) + 8 * v15++), (void)v17);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (id)_dataAggregatorConfigurationForCollectorState:(void *)a1
{
  if (a1)
  {
    a1 = +[HDDataAggregatorConfiguration configurationWithLatency:*(unsigned __int8 *)(a2 + 26) interval:*(unsigned __int8 *)(a2 + 25) seriesDuration:*(unsigned __int8 *)(a2 + 27) activeWorkout:*(double *)(a2 + 8) foregroundObserver:*(double *)a2 backgroundObserver:*(double *)(a2 + 16)];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_setAggregatorConfigurationChangeHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HDDataCollectionManager__setAggregatorConfigurationChangeHandler___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __68__HDDataCollectionManager__setAggregatorConfigurationChangeHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 128);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        long long v14 = 0u;
        long long v15 = 0u;
        [(HDDataCollectionManager *)(uint64_t)&v14 _queue_collectionStateForType:v10];
        id v11 = *(void **)(a1 + 32);
        v13[0] = v14;
        v13[1] = v15;
        uint64_t v12 = -[HDDataCollectionManager _dataAggregatorConfigurationForCollectorState:](v11, (uint64_t)v13);
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (id)_dataCollectorBlacklist
{
  if (qword_1EBA18E58 != -1) {
    dispatch_once(&qword_1EBA18E58, &__block_literal_global_392_0);
  }
  v0 = (void *)_MergedGlobals_6_0;

  return v0;
}

void __68__HDDataCollectionManager__queue_setupUnprotectedDataDependantState__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 17));
    int v1 = [WeakRetained hasAccessToFitnessData];
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = @"NOT ";
      if (v1) {
        uint64_t v3 = &stru_1F1728D60;
      }
      *(_DWORD *)buf = 138412290;
      long long v18 = v3;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "Access to fitness data %@granted.", buf, 0xCu);
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"HDDataCollectionAccessToFitnessDataDidChangeNotification" object:0];

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 14);
    id v5 = [*((id *)WeakRetained + 9) allValues];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 14);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:buf count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      uint64_t v10 = v1 ^ 1u;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) setDisabled:v10];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:buf count:16];
      }
      while (v8);
    }
  }
}

void __50__HDDataCollectionManager__dataCollectorBlacklist__block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"HDDataCollectionDisableExerciseTime"];

  if (v1)
  {
    _HKInitializeLogging();
    uint64_t v2 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F1CB18];
      id v4 = v2;
      id v5 = [v3 standardUserDefaults];
      id v6 = [v5 valueForKey:@"HDDataCollectionDisableExerciseTime"];
      int v13 = 138543618;
      long long v14 = @"HDDataCollectionDisableExerciseTime";
      __int16 v15 = 2114;
      long long v16 = v6;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "Exercise time data collection disabled because defaults key '%{public}@' is %{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v7 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:@"_NLAppleExerciseTimeDataCollector"];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v9 = [v8 stringArrayForKey:*MEMORY[0x1E4F299A0]];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(v9, "hk_filter:", &__block_literal_global_400);
    uint64_t v11 = [v7 arrayByAddingObjectsFromArray:v10];

    uint64_t v7 = (void *)v11;
  }
  uint64_t v12 = (void *)_MergedGlobals_6_0;
  _MergedGlobals_6_0 = (uint64_t)v7;
}

uint64_t __50__HDDataCollectionManager__dataCollectorBlacklist__block_invoke_397(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__HDDataCollectionManager__pluginDataCollectors__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  int v4 = [*(id *)(a1 + 32) containsObject:v3];
  if (v4)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "Dropping blacklisted data collector: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }

  return v4 ^ 1u;
}

- (BOOL)sensorDataArrayReceived:(id)a3 deviceEntity:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (v8)
  {
    id v9 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v11 = [WeakRetained dataProvenanceManager];
    uint64_t v12 = [v11 defaultLocalDataProvenanceWithDeviceEntity:v8];
  }
  else
  {
    id v13 = a3;
    _HKInitializeLogging();
    long long v14 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v24 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "sensorDataArrayReceived without device.", v24, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v11 = [WeakRetained dataProvenanceManager];
    uint64_t v12 = [v11 defaultLocalDataProvenance];
  }
  __int16 v15 = (void *)v12;

  id v16 = a3;
  id v17 = v15;
  if (self)
  {
    os_unfair_lock_assert_not_owner(&self->_collectorLock);
    os_unfair_lock_lock(&self->_collectorLock);
    long long v18 = [(HDFakeDataCollector *)self->_fakeCollector configuration];

    os_unfair_lock_unlock(&self->_collectorLock);
    uint64_t v19 = v16;
    if (v18
      && (objc_msgSend(v16, "hk_filter:", &__block_literal_global_456_0),
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          v16,
          ![v19 count]))
    {
      char v22 = 1;
    }
    else
    {
      id v20 = objc_loadWeakRetained((id *)&self->_profile);
      uint64_t v21 = [v20 dataManager];
      char v22 = [v21 insertDataObjects:v19 withProvenance:v17 creationDate:a5 error:CFAbsoluteTimeGetCurrent()];
    }
  }
  else
  {
    char v22 = 0;
    uint64_t v19 = v16;
  }

  return v22;
}

BOOL __69__HDDataCollectionManager__dataReceived_provenance_isDemoData_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"HKFakedData"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_collectorLock_setupFakeCollector
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 56));
    id v2 = (id *)(a1 + 80);
    if (!*(void *)(a1 + 80))
    {
      uint64_t v3 = [HDFakeDataCollector alloc];
      BOOL v4 = [(id)a1 profile];
      id v5 = [(HDFakeDataCollector *)v3 initWithProfile:v4];

      objc_storeStrong(v2, v5);
      id v6 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__HDDataCollectionManager__collectorLock_setupFakeCollector__block_invoke;
      block[3] = &unk_1E62F3208;
      id v9 = v5;
      int v7 = v5;
      dispatch_async(v6, block);
    }
  }
}

uint64_t __60__HDDataCollectionManager__collectorLock_setupFakeCollector__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerWithAggregators];
}

- (void)startFakingDataWithActivityType:(int64_t)a3 speed:(id)a4
{
  p_collectorLock = &self->_collectorLock;
  id v7 = a4;
  os_unfair_lock_lock(p_collectorLock);
  -[HDDataCollectionManager _collectorLock_setupFakeCollector]((uint64_t)self);
  id v8 = objc_alloc_init(HDFakeDataCollectorConfiguration);
  [(HDFakeDataCollectorConfiguration *)v8 setActivityType:a3];
  [(HDFakeDataCollectorConfiguration *)v8 setSpeed:v7];

  [(HDFakeDataCollector *)self->_fakeCollector setConfiguration:v8];
  os_unfair_lock_unlock(p_collectorLock);
}

- (void)startFakingWithHKWorkoutActivityType:(unint64_t)a3
{
  p_collectorLock = &self->_collectorLock;
  os_unfair_lock_lock(&self->_collectorLock);
  -[HDDataCollectionManager _collectorLock_setupFakeCollector]((uint64_t)self);
  id v6 = +[HDFakeDataCollectorConfiguration configurationForWorkoutActivityType:a3];
  [(HDFakeDataCollector *)self->_fakeCollector setConfiguration:v6];

  os_unfair_lock_unlock(p_collectorLock);
}

- (void)stopFakingData
{
  p_collectorLock = &self->_collectorLock;
  os_unfair_lock_lock(&self->_collectorLock);
  [(HDFakeDataCollector *)self->_fakeCollector setConfiguration:0];
  fakeCollector = self->_fakeCollector;
  self->_fakeCollector = 0;

  [(HDFakeDataCollector *)self->_fakeCollector unregisterFromAggregators];

  os_unfair_lock_unlock(p_collectorLock);
}

- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [HDFakeDataCollector alloc];
  uint64_t v10 = [(HDDataCollectionManager *)self profile];
  uint64_t v11 = [(HDFakeDataCollector *)v9 initWithProfile:v10];

  [(HDFakeDataCollector *)v11 registerWithAggregators];
  uint64_t v12 = +[HDDataCollectionObserverState dataCollectionObserverStateInForeground:1 hasRunningWorkout:1 hasBackgroundObserver:0];
  id v13 = +[HDFakeDataCollector collectedTypes];
  long long v14 = [(HDDataCollectionManager *)self takeCollectionAssertionWithOwnerIdentifier:@"Faking" sampleTypes:v13 observerState:v12 collectionInterval:1.0];

  _HKInitializeLogging();
  __int16 v15 = *MEMORY[0x1E4F29F28];
  double v16 = a4 * 60.0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v33 = a3;
    __int16 v34 = 2048;
    double v35 = v16;
    _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_INFO, "generating fake data for activity type %ld with duration: %lf", buf, 0x16u);
  }
  id v17 = objc_alloc_init(HDFakeDataCollectorConfiguration);
  [(HDFakeDataCollectorConfiguration *)v17 setActivityType:a3];
  long long v18 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v19 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
  id v20 = [v18 quantityWithUnit:v19 doubleValue:5.0];
  [(HDFakeDataCollectorConfiguration *)v17 setSpeed:v20];

  uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
  char v22 = [v21 dateByAddingTimeInterval:v16];
  uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
  [(HDFakeDataCollector *)v11 generateForConfiguration:v17 from:v23 to:v22];

  __int16 v24 = +[HDFakeDataCollector collectedTypes];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__HDDataCollectionManager_generateFakeDataForActivityType_minutes_completion___block_invoke;
  v28[3] = &unk_1E62FAA10;
  uint64_t v30 = v11;
  id v31 = v8;
  id v29 = v14;
  id v25 = v11;
  id v26 = v8;
  id v27 = v14;
  [(HDDataCollectionManager *)self requestAggregationThroughDate:v22 types:v24 mode:0 options:2 completion:v28];
}

void __78__HDDataCollectionManager_generateFakeDataForActivityType_minutes_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v5 = *(void *)(a1 + 48);
  if (a2)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "datumCount"));
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
  else
  {
    (*(void (**)(void, void, id))(v5 + 16))(*(void *)(a1 + 48), 0, v7);
  }
}

- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 sampleTypes:(id)a4 observer:(id)a5 observerState:(id)a6 collectionInterval:(double)a7
{
  return [(HDDataCollectionManager *)self takeCollectionAssertionWithOwnerIdentifier:a3 sampleTypes:a4 observerState:a6 collectionInterval:a7];
}

- (void)addDataCollector:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HDDataCollectionManager_addDataCollector___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__HDDataCollectionManager_addDataCollector___block_invoke(uint64_t a1)
{
}

- (void)unitTest_setAggregator:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HDDataCollectionManager *)self unitTest_addCollectibleType:v7];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HDDataCollectionManager_unitTest_setAggregator_forType___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

uint64_t __58__HDDataCollectionManager_unitTest_setAggregator_forType___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (id)unitTest_dataAggregatorConfigurationForType:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__189;
  double v16 = __Block_byref_object_dispose__189;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HDDataCollectionManager_unitTest_dataAggregatorConfigurationForType___block_invoke;
  block[3] = &unk_1E630C4B8;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __71__HDDataCollectionManager_unitTest_dataAggregatorConfigurationForType___block_invoke(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  [(HDDataCollectionManager *)(uint64_t)&v7 _queue_collectionStateForType:*(void **)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  v6[0] = v7;
  v6[1] = v8;
  uint64_t v3 = -[HDDataCollectionManager _dataAggregatorConfigurationForCollectorState:](v2, (uint64_t)v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)unitTest_setPendingSaveCoalescingInterval:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__HDDataCollectionManager_unitTest_setPendingSaveCoalescingInterval___block_invoke;
  v4[3] = &unk_1E62F3198;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __69__HDDataCollectionManager_unitTest_setPendingSaveCoalescingInterval___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 32) setQuota:0];
}

- (void)unitTest_addCollectibleType:(id)a3
{
  id v4 = a3;
  -[HDDataCollectionManager collectibleTypes]((os_unfair_lock_s *)self);

  os_unfair_lock_lock(&self->_collectorLock);
  uint64_t v5 = [(NSSet *)self->_collectibleTypes setByAddingObject:v4];

  collectibleTypes = self->_collectibleTypes;
  self->_collectibleTypes = v5;

  os_unfair_lock_unlock(&self->_collectorLock);
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  xpc_object_t xdict = a4;
  uint64_t v5 = [(HDDataCollectionManager *)self profile];
  id v6 = [v5 daemon];
  long long v7 = [v6 behavior];
  int v8 = [v7 isAppleWatch];

  if (v8)
  {
    xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14358], 1);
    id v9 = (const char **)MEMORY[0x1E4F142E0];
    double v10 = 120.0;
  }
  else
  {
    id v9 = (const char **)MEMORY[0x1E4F142D0];
    double v10 = 1200.0;
  }
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], *v9);
  xpc_dictionary_set_double(xdict, (const char *)*MEMORY[0x1E4F141A8], v10);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F142B8], 1);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  [(HDDataCollectionManager *)self periodicUpdate];
  (*((void (**)(id, void, void, double))v5 + 2))(v5, 0, 0, 0.0);
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained database];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HDDataCollectionManager_profileDidBecomeReady___block_invoke;
  v7[3] = &unk_1E62F3208;
  v7[4] = self;
  [v5 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v7];
}

void __49__HDDataCollectionManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 136));
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 56));
    if (*(void *)(v1 + 64)
      && ([MEMORY[0x1E4F28B00] currentHandler],
          uint64_t v76 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_createBuiltinCollectors, v1, @"HDDataCollectionManager.m", 862, @"%s must only be called once.", "-[HDDataCollectionManager _queue_createBuiltinCollectors]"), v76, *(void *)(v1 + 64)))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 120));
      uint64_t v3 = [WeakRetained daemon];
      id v4 = [v3 behavior];
      char v5 = [v4 collectsData];

      if (v5)
      {
        id v6 = -[HDDataCollectionManager _dataCollectorBlacklist]();
        if ([v6 count])
        {
          _HKInitializeLogging();
          long long v7 = (void *)*MEMORY[0x1E4F29F10];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
          {
            int v8 = v7;
            id v9 = [v6 componentsJoinedByString:@", "];
            *(_DWORD *)buf = 138543362;
            v91 = v9;
            _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Filtering built-in data collector creation through blacklist: %{public}@", buf, 0xCu);
          }
        }
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v11 = *(void **)(v1 + 64);
        *(void *)(v1 + 64) = v10;

        uint64_t v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        char v14 = [v6 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          __int16 v15 = [HDPedometerDataCollector alloc];
          id v16 = objc_loadWeakRetained((id *)(v1 + 120));
          id v17 = [(HDPedometerDataCollector *)v15 initWithProfile:v16];

          if (v17) {
            [*(id *)(v1 + 64) addObject:v17];
          }
        }
        long long v18 = (objc_class *)objc_opt_class();
        uint64_t v19 = NSStringFromClass(v18);
        char v20 = [v6 containsObject:v19];

        if ((v20 & 1) == 0)
        {
          uint64_t v21 = [HDOdometerDataCollector alloc];
          id v22 = objc_loadWeakRetained((id *)(v1 + 120));
          uint64_t v23 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B0]];
          __int16 v24 = [(HDOdometerDataCollector *)v21 initWithProfile:v22 collectedDistanceType:v23];

          if (v24) {
            [*(id *)(v1 + 64) addObject:v24];
          }
          id v25 = [HDOdometerDataCollector alloc];
          id v26 = objc_loadWeakRetained((id *)(v1 + 120));
          id v27 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E8]];
          id v28 = [(HDOdometerDataCollector *)v25 initWithProfile:v26 collectedDistanceType:v27];

          if (v28) {
            [*(id *)(v1 + 64) addObject:v28];
          }
        }
        id v29 = (void *)[*(id *)(v1 + 64) copy];
        os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
        uint64_t v30 = (objc_class *)objc_opt_class();
        id v31 = NSStringFromClass(v30);
        char v32 = [v6 containsObject:v31];

        if ((v32 & 1) == 0)
        {
          int64_t v33 = [HDSkiingWorkoutDistanceCollector alloc];
          id v34 = objc_loadWeakRetained((id *)(v1 + 120));
          double v35 = [(HDSkiingWorkoutDistanceCollector *)v33 initWithProfile:v34];

          if (v35) {
            -[HDDataCollectionManager _queue_addDataCollector:](v1, v35);
          }
        }
        id v36 = v29;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v86 objects:buf count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v87;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v87 != v38) {
                objc_enumerationMutation(v36);
              }
              unint64_t v40 = *(void **)(*((void *)&v86 + 1) + 8 * i);
              if (objc_opt_respondsToSelector()) {
                [v40 registerWithAggregators];
              }
            }
            uint64_t v37 = [v36 countByEnumeratingWithState:&v86 objects:buf count:16];
          }
          while (v37);
        }
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
        _HKInitializeLogging();
        id v41 = *MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_DEFAULT, "Data collection disabled; not starting built-in collectors.",
            buf,
            2u);
        }
      }
    }
    objc_initWeak(&location, (id)v1);
    id v42 = *(NSObject **)(v1 + 136);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__HDDataCollectionManager__queue_setupUnprotectedDataDependantState__block_invoke;
    handler[3] = &unk_1E62F3490;
    objc_copyWeak(&v82, &location);
    notify_register_dispatch((const char *)*MEMORY[0x1E4F2BF70], (int *)(v1 + 52), v42, handler);
    int v43 = HKIsFitnessTrackingEnabled();
    if ((v43 & 1) == 0)
    {
      _HKInitializeLogging();
      v44 = *MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_DEFAULT, "Access to fitness data NOT granted.", buf, 2u);
      }
    }
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v46 = objc_loadWeakRetained((id *)(v1 + 120));
    long long v47 = [v46 daemon];
    long long v48 = [v47 pluginManager];
    long long v49 = [v48 pluginsConformingToProtocol:&unk_1F18A8A08];
    long long v50 = [v49 allValues];

    uint64_t v51 = [v50 countByEnumeratingWithState:&v86 objects:buf count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v87 != v52) {
            objc_enumerationMutation(v50);
          }
          uint64_t v54 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          v55 = [(id)v1 profile];
          uint64_t v56 = [v54 dataCollectorsForProfile:v55];

          if (v56) {
            [v45 addObjectsFromArray:v56];
          }
        }
        uint64_t v51 = [v50 countByEnumeratingWithState:&v86 objects:buf count:16];
      }
      while (v51);
    }

    long long v57 = -[HDDataCollectionManager _dataCollectorBlacklist]();
    if ([v57 count])
    {
      _HKInitializeLogging();
      long long v58 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        long long v59 = v58;
        long long v60 = [v57 componentsJoinedByString:@", "];
        *(_DWORD *)uint64_t v92 = 138543362;
        *(void *)&v92[4] = v60;
        _os_log_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_DEFAULT, "Filtering plugin data collectors via blacklist: %{public}@", v92, 0xCu);
      }
      *(void *)uint64_t v92 = MEMORY[0x1E4F143A8];
      *(void *)&v92[8] = 3221225472;
      *(void *)&long long v93 = __48__HDDataCollectionManager__pluginDataCollectors__block_invoke;
      *((void *)&v93 + 1) = &unk_1E630C470;
      *(void *)&long long v94 = v57;
      objc_msgSend(v45, "hk_filter:", v92);
      id v61 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v61 = v45;
    }

    _HKInitializeLogging();
    id v62 = (id)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = [v61 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543362;
      v91 = v63;
      _os_log_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_DEFAULT, "Received data collectors: [%{public}@]", buf, 0xCu);
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v64 = v61;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v77 objects:&v86 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v78;
      uint64_t v67 = v43 ^ 1u;
      do
      {
        for (uint64_t k = 0; k != v65; ++k)
        {
          if (*(void *)v78 != v66) {
            objc_enumerationMutation(v64);
          }
          id v69 = *(void **)(*((void *)&v77 + 1) + 8 * k);
          [v69 setDisabled:v67];
          -[HDDataCollectionManager _queue_addDataCollector:](v1, v69);
        }
        uint64_t v65 = [v64 countByEnumeratingWithState:&v77 objects:&v86 count:16];
      }
      while (v65);
    }

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 136));
    long long v94 = 0u;
    long long v95 = 0u;
    *(_OWORD *)uint64_t v92 = 0u;
    long long v93 = 0u;
    id v70 = *(id *)(v1 + 128);
    uint64_t v71 = [v70 countByEnumeratingWithState:v92 objects:buf count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v93;
      do
      {
        for (uint64_t m = 0; m != v71; ++m)
        {
          if (*(void *)v93 != v72) {
            objc_enumerationMutation(v70);
          }
          id v74 = *(id *)(*(void *)&v92[8] + 8 * m);
          os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v1 + 56));
          os_unfair_lock_lock((os_unfair_lock_t)(v1 + 56));
          v75 = [*(id *)(v1 + 72) objectForKeyedSubscript:v74];

          os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
          if (v75)
          {
            long long v84 = 0u;
            long long v85 = 0u;
            [(HDDataCollectionManager *)(uint64_t)&v84 _queue_collectionStateForType:v74];
            if (BYTE8(v85)) {
              [v75 collectionStartedForType:v74 collectionInterval:*(double *)&v84];
            }
          }
        }
        uint64_t v71 = [v70 countByEnumeratingWithState:v92 objects:buf count:16];
      }
      while (v71);
    }

    objc_destroyWeak(&v82);
    objc_destroyWeak(&location);
  }
}

void __48__HDDataCollectionManager__observersDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 count];
  if (v7)
  {
    [*(id *)(a1 + 32) appendFormat:@"\t%@ (%ld)\n", v5, v7];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v8 = [v6 objectEnumerator];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 32) appendFormat:@"\t\t%@: %@\n", v5, *(void *)(*((void *)&v13 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (id)diagnosticDescription
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_lastLaunchUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:self->_lastLaunchUpdate];
    double v5 = v4;

    if (v5 >= 120.0)
    {
      if (v5 >= 5400.0) {
        objc_msgSend(NSString, "stringWithFormat:", @"%.1f hrs ago", v5 / 3600.0);
      }
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"%.0f mins ago", v5 / 60.0);
      }
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%.0f secs ago", *(void *)&v5);
    }
    id v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v29 = @"NEVER";
  }
  id v28 = NSString;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"Active Observers (%ld type(s)):\n", -[NSMutableDictionary count](self->_observersByType, "count"));
  observersByType = self->_observersByType;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __48__HDDataCollectionManager__observersDescription__block_invoke;
  v34[3] = &unk_1E630C4E0;
  id v8 = v6;
  id v35 = v8;
  [(NSMutableDictionary *)observersByType enumerateKeysAndObjectsUsingBlock:v34];

  id v27 = [(HDFakeDataCollector *)self->_fakeCollector configuration];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v9 appendString:@"Data Collectors:\n"];
  os_unfair_lock_lock(&self->_collectorLock);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [(NSMutableDictionary *)self->_collectorLock_dataCollectorsByType allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dataCollectorDiagnosticDescription];
        [v9 appendFormat:@"\t%@\n", v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_collectorLock);
  id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v16 appendString:@"Data Aggregators:\n"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = [(NSMutableDictionary *)self->_dataAggregatorsByType allValues];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        [v16 appendFormat:@"\t%@\n", v22];
        uint64_t v23 = [v22 diagnosticDescription];
        [v16 appendFormat:@"%@\n", v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v19);
  }
  if (v27) {
    __int16 v24 = "\nData faking enabled";
  }
  else {
    __int16 v24 = "";
  }

  id v25 = [v28 stringWithFormat:@"\n%@%s\nLast launch update: %@\n%@\n%@", v8, v24, v29, v9, v16];

  return v25;
}

- (OS_dispatch_queue)dataCollectionQueue
{
  return self->_dataCollectionQueue;
}

- (OS_dispatch_queue)sharedDelayedAggregationQueue
{
  return self->_sharedDelayedAggregationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDelayedAggregationQueue, 0);
  objc_storeStrong((id *)&self->_dataCollectionQueue, 0);
  objc_storeStrong((id *)&self->_assertionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observersByType, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_seriesQuantityEventObserver, 0);
  objc_storeStrong((id *)&self->_collectibleTypes, 0);
  objc_storeStrong(&self->_unitTest_aggregatorConfigurationChangedHandler, 0);
  objc_storeStrong((id *)&self->_lastFlushDateByType, 0);
  objc_storeStrong((id *)&self->_fakeCollector, 0);
  objc_storeStrong((id *)&self->_collectorLock_dataCollectorsByType, 0);
  objc_storeStrong((id *)&self->_collectorLock_builtinCollectors, 0);
  objc_storeStrong((id *)&self->_pendingSavePool, 0);
  objc_storeStrong((id *)&self->_periodicUpdateActivity, 0);
  objc_storeStrong((id *)&self->_dataAggregatorsByType, 0);

  objc_storeStrong((id *)&self->_lastLaunchUpdate, 0);
}

@end