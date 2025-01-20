@interface HDCoreMotionDataCollector
- (Class)coreMotionDatumClass;
- (Class)sensorDatumClassForAggregator:(id)a3;
- (HDCoreMotionDataCollector)initWithProfile:(id)a3;
- (HDProfile)profile;
- (OS_dispatch_queue)queue;
- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5;
- (id)_coreMotionDatumFromSensorDatum:(void *)a1;
- (id)collectedTypes;
- (id)diagnosticDescription;
- (id)identifierForDataAggregator:(id)a3;
- (id)persistentIdentifier;
- (id)queue_newDataSource;
- (id)sourceForDataAggregator:(id)a3;
- (unint64_t)queue_targetCollectionTypeForRequestedCollectionType:(unint64_t)a3;
- (void)_accessToFitnessDataDidChange:(id)a3;
- (void)_queue_updateCollectionType:(uint64_t)a1;
- (void)beginCollectionForDataAggregator:(id)a3 lastPersistedSensorDatum:(id)a4;
- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4;
- (void)dealloc;
- (void)queue_recomputeCurrentState;
- (void)registerWithAggregators;
@end

@implementation HDCoreMotionDataCollector

- (HDCoreMotionDataCollector)initWithProfile:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDCoreMotionDataCollector;
  v5 = [(HDCoreMotionDataCollector *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (HKDataCollectorState *)objc_alloc_init(MEMORY[0x1E4F2AEB0]);
    state = v6->_state;
    v6->_state = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastCMDatumByType = v6->_lastCMDatumByType;
    v6->_lastCMDatumByType = v11;

    v13 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v13 addObject:v6];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v6 selector:sel__accessToFitnessDataDidChange_ name:@"HDDataCollectionAccessToFitnessDataDidChangeNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDCoreMotionDataCollector;
  [(HDCoreMotionDataCollector *)&v4 dealloc];
}

- (void)registerWithAggregators
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDCoreMotionDataCollector_registerWithAggregators__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__HDCoreMotionDataCollector_registerWithAggregators__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) collectedTypes];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  v5 = [HDDataCollectorMultiplexer alloc];
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 persistentIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  uint64_t v9 = [(HDDataCollectorMultiplexer *)v5 initForCollector:v6 identifier:v7 profile:WeakRetained types:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 16);
  uint64_t v14 = *(void *)(v12 + 40);

  return [v13 registerForCollectionWithState:v14];
}

- (void)queue_recomputeCurrentState
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v67 = [(HDDataCollectorMultiplexer *)self->_multiplexer mergedConfiguration];
  unint64_t v3 = -[HDCoreMotionDataCollector queue_targetCollectionTypeForRequestedCollectionType:](self, "queue_targetCollectionTypeForRequestedCollectionType:", [v67 collectionType]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained dataCollectionManager];
  int v6 = [v5 hasAccessToFitnessData];

  if (!v6) {
    unint64_t v3 = 0;
  }
  if (v3 != [(HKDataCollectorState *)self->_state collectionType])
  {
    uint64_t v65 = v3;
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
    {
      v57 = v7;
      v58 = [(HDCoreMotionDataCollector *)self diagnosticDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v58;
      _os_log_debug_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@", buf, 0x16u);
    }
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
    {
      multiplexer = self->_multiplexer;
      v60 = v8;
      v61 = [(HDDataCollectorMultiplexer *)multiplexer diagnosticDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = multiplexer;
      *(_WORD *)&buf[22] = 2114;
      v85 = v61;
      _os_log_debug_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ %{public}@", buf, 0x20u);
    }
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      v11 = v9;
      [(HKDataCollectorState *)state collectionType];
      uint64_t v12 = HKDataCollectionTypeToString();
      v13 = HKDataCollectionTypeToString();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2114;
      v85 = v13;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Transitioning collection type from %{public}@ -> %{public}@", buf, 0x20u);
    }
    if (v65)
    {
      if (self->_errorCount < 3)
      {
        if (self->_dataSource
          || ([(HDCoreMotionDataCollector *)self queue_newDataSource],
              objc_super v16 = (HDCoreMotionDataSource *)objc_claimAutoreleasedReturnValue(),
              v17 = self->_dataSource,
              self->_dataSource = v16,
              v17,
              self->_dataSource))
        {
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          obj = self->_quantityTypes;
          uint64_t v18 = [(NSSet *)obj countByEnumeratingWithState:&v73 objects:buf count:16];
          if (v18)
          {
            uint64_t v72 = *(void *)v74;
            uint64_t v70 = *MEMORY[0x1E4F2A600];
            uint64_t v69 = *MEMORY[0x1E4F2A5C0];
            uint64_t v68 = *MEMORY[0x1E4F2A8F0];
            uint64_t v66 = *MEMORY[0x1E4F2A890];
            uint64_t v63 = *MEMORY[0x1E4F2A808];
            uint64_t v64 = *MEMORY[0x1E4F2A7E0];
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v74 != v72) {
                  objc_enumerationMutation(obj);
                }
                v20 = *(void **)(*((void *)&v73 + 1) + 8 * v19);
                id v21 = [(NSMutableDictionary *)self->_lastCMDatumByType objectForKeyedSubscript:v20];
                if (!v21)
                {
                  id v22 = v20;
                  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
                  v23 = [(HDDataCollectorMultiplexer *)self->_multiplexer lastDatumForType:v22];
                  v24 = -[HDCoreMotionDataCollector _coreMotionDatumFromSensorDatum:](self, v23);

                  if (v24)
                  {
                    id v21 = v24;
                  }
                  else
                  {
                    id v77 = 0;
                    id v25 = v22;
                    v26 = [v25 identifier];
                    char v27 = [v26 isEqualToString:v70];

                    v28 = @"BASAL_ENERGY_INGESTION";
                    if (v27) {
                      goto LABEL_32;
                    }
                    v29 = [v25 identifier];
                    char v30 = [v29 isEqualToString:v69];

                    v28 = @"ACTIVE_ENERGY_INGESTION";
                    if (v30) {
                      goto LABEL_32;
                    }
                    v31 = [v25 identifier];
                    char v32 = [v31 isEqualToString:v68];

                    v28 = @"STEP_INGESTION";
                    if (v32) {
                      goto LABEL_32;
                    }
                    v33 = [v25 identifier];
                    char v34 = [v33 isEqualToString:v66];

                    v28 = @"VULCAN_INGESTION";
                    if (v34) {
                      goto LABEL_32;
                    }
                    v35 = [v25 identifier];
                    char v36 = [v35 isEqualToString:v64];

                    v28 = @"DISTANCE_INGESTION";
                    if ((v36 & 1) != 0
                      || ([v25 identifier],
                          v37 = objc_claimAutoreleasedReturnValue(),
                          char v38 = [v37 isEqualToString:v63],
                          v37,
                          v28 = @"FLIGHTS_INGESTION",
                          (v38 & 1) != 0))
                    {
LABEL_32:

                      v39 = [v25 canonicalUnit];
                      uint64_t v78 = 0;
                      v79 = &v78;
                      uint64_t v80 = 0x3032000000;
                      v81 = __Block_byref_object_copy__96;
                      v82 = __Block_byref_object_dispose__96;
                      id v83 = 0;
                      id v40 = objc_loadWeakRetained((id *)&self->_profile);
                      v41 = [v40 database];
                      *(void *)v88 = MEMORY[0x1E4F143A8];
                      *(void *)&v88[8] = 3221225472;
                      *(void *)&v88[16] = __72__HDCoreMotionDataCollector__migrateDataCollectionContextForType_error___block_invoke;
                      v89 = &unk_1E6300650;
                      v90 = v28;
                      v91 = self;
                      id v42 = v39;
                      id v92 = v42;
                      v94 = &v78;
                      id v93 = v25;
                      BOOL v43 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v41 error:&v77 block:v88];

                      if (v43) {
                        v44 = (void *)v79[5];
                      }
                      else {
                        v44 = 0;
                      }
                      id v45 = v44;

                      _Block_object_dispose(&v78, 8);
                    }
                    else
                    {

                      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v77, 3, @"Unable to migrate %@: unknown domain for migration.", v25);
                      id v45 = 0;
                    }

                    id v46 = v77;
                    v47 = -[HDCoreMotionDataCollector _coreMotionDatumFromSensorDatum:](self, v45);

                    if (v47)
                    {
                      _HKInitializeLogging();
                      v48 = *MEMORY[0x1E4F29F10];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v88 = 138543618;
                        *(void *)&v88[4] = self;
                        *(_WORD *)&v88[12] = 2114;
                        *(void *)&v88[14] = v25;
                        _os_log_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully migrated data collection context for %{public}@", v88, 0x16u);
                      }
                    }
                    else if (v46)
                    {
                      _HKInitializeLogging();
                      v49 = *MEMORY[0x1E4F29F10];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v88 = 138543874;
                        *(void *)&v88[4] = self;
                        *(_WORD *)&v88[12] = 2114;
                        *(void *)&v88[14] = v25;
                        *(_WORD *)&v88[22] = 2114;
                        v89 = v46;
                        _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Failed to migrate data collection context for %{public}@: %{public}@", v88, 0x20u);
                      }
                    }
                    id v21 = v47;
                  }
                  if (v21) {
                    [(NSMutableDictionary *)self->_lastCMDatumByType setObject:v21 forKeyedSubscript:v22];
                  }
                }

                ++v19;
              }
              while (v18 != v19);
              uint64_t v50 = [(NSSet *)obj countByEnumeratingWithState:&v73 objects:buf count:16];
              uint64_t v18 = v50;
            }
            while (v50);
          }

          v51 = [(NSMutableDictionary *)self->_lastCMDatumByType allValues];
          v52 = objc_msgSend(v51, "hk_firstSortedObjectWithComparison:", &__block_literal_global_299);

          _HKInitializeLogging();
          v53 = *MEMORY[0x1E4F29F10];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
          {
            int64_t errorCount = self->_errorCount;
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2048;
            v85 = (void *)errorCount;
            _os_log_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning CM streaming with last datum %@ (current error count: %ld).", buf, 0x20u);
          }
          objc_initWeak((id *)v88, self);
          -[HDCoreMotionDataCollector _queue_updateCollectionType:]((uint64_t)self, v65);
          dataSource = self->_dataSource;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __73__HDCoreMotionDataCollector__queue_beginUpdatesWithTargetCollectionType___block_invoke_300;
          v85 = &unk_1E6300628;
          objc_copyWeak(v87, (id *)v88);
          id v56 = v52;
          id v86 = v56;
          [(HDCoreMotionDataSource *)dataSource hd_beginStreamingFromDatum:v56 handler:buf];

          objc_destroyWeak(v87);
          objc_destroyWeak((id *)v88);
        }
        else
        {
          _HKInitializeLogging();
          v62 = *MEMORY[0x1E4F29F10];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = self;
            _os_log_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to create a new data source; will not begin updates.",
              buf,
              0xCu);
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v14 = *MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          int64_t v15 = self->_errorCount;
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v15;
          _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Reached retry limit of %ld while attempting to begin streaming; will try again on next configuration change.",
            buf,
            0x16u);
        }
        [(HDCoreMotionDataCollector *)self unitTest_retriesExhausted];
      }
    }
    else
    {
      [(HDCoreMotionDataSource *)self->_dataSource hd_stopStreaming];
      -[HDCoreMotionDataCollector _queue_updateCollectionType:]((uint64_t)self, 0);
    }
  }
}

- (void)_queue_updateCollectionType:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if ([*(id *)(a1 + 40) collectionType] != a2)
    {
      uint64_t v4 = [*(id *)(a1 + 40) cloneWithNewType:a2];
      v5 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v4;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = *(id *)(a1 + 8);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = objc_msgSend(*(id *)(a1 + 16), "aggregatorForType:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
            [v11 dataCollector:a1 didChangeState:*(void *)(a1 + 40)];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

- (id)_coreMotionDatumFromSensorDatum:(void *)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a2 resumeContext];
  if (v3)
  {
    id v8 = 0;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClass:fromData:error:", objc_msgSend(a1, "coreMotionDatumClass"), v3, &v8);
    id v5 = v8;
    if (!v4)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v10 = a1;
        __int16 v11 = 2114;
        id v12 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode datum resume context: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hd_sourceID");
  id v5 = v4;
  id v6 = *(void **)(a1 + 32);
  if (v4 == v6)
  {

    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v7 = objc_msgSend(v3, "hd_sourceID");
    int v8 = [v7 isEqual:*(void *)(a1 + 32)];

    if (!v8) {
      goto LABEL_8;
    }
LABEL_6:
    BOOL v9 = objc_msgSend(v3, "hd_compare:", *(void *)(a1 + 40)) == 1;
    goto LABEL_11;
  }

LABEL_8:
  _HKInitializeLogging();
  uint64_t v10 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = a1 + 40;
    __int16 v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(v13 + 8);
    long long v14 = v10;
    long long v15 = objc_msgSend(v11, "hd_sourceID");
    objc_super v16 = objc_msgSend(v3, "hd_sourceID");
    int v18 = 138543874;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    id v21 = v15;
    __int16 v22 = 2114;
    v23 = v16;
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: CM database reset detected (Source ID %{public}@ -> %{public}@", (uint8_t *)&v18, 0x20u);
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

double __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke_289(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue_differenceFromDatum:toDatum:type:", v5, v6, *(void *)(a1 + 40));
  double v8 = v7;
  BOOL v9 = objc_msgSend(v6, "hd_datestamp");
  uint64_t v10 = objc_msgSend(v5, "hd_datestamp");
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 <= 14400.0)
  {
    double v14 = v8;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = (void *)*MEMORY[0x1E4F29F10];
    double v14 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      objc_super v16 = v13;
      uint64_t v17 = objc_msgSend(v5, "hd_datestamp");
      int v18 = objc_msgSend(v6, "hd_datestamp");
      int v20 = 138544386;
      uint64_t v21 = v15;
      __int16 v22 = 2048;
      double v23 = v8;
      __int16 v24 = 2048;
      double v25 = v12;
      __int16 v26 = 2114;
      char v27 = v17;
      __int16 v28 = 2114;
      v29 = v18;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Dropping value %lf covering unexpectedly long gap (%lfs from %{public}@ to %{public}@)", (uint8_t *)&v20, 0x34u);
    }
  }

  return v14;
}

id __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke_291(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "hd_datestamp");
  double v7 = objc_msgSend(v5, "hd_datestamp");
  int v8 = objc_msgSend(v6, "hk_isBeforeOrEqualToDate:", v7);

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v10 = v4;
  }
  else
  {
    _HKInitializeLogging();
    double v11 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Received out-of-date-order samples %@, %@; creating instantaneous datum to account for adjustment.",
        (uint8_t *)&v16,
        0x16u);
    }
    id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v10 = v5;
  }
  double v12 = objc_msgSend(v10, "hd_datestamp");
  uint64_t v13 = objc_msgSend(v5, "hd_datestamp");
  double v14 = (void *)[v9 initWithStartDate:v12 endDate:v13];

  return v14;
}

void __75__HDCoreMotionDataCollector__didReceiveCoreMotionData_startingDatum_error___block_invoke(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    char v34 = [*(id *)(a1 + 48) domain];
    if ([v34 isEqualToString:*MEMORY[0x1E4F22140]])
    {
      uint64_t v35 = [*(id *)(a1 + 48) code];

      if (v35 == 107)
      {
        _HKInitializeLogging();
        char v36 = *MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          uint64_t v80 = v37;
          _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: Received invalid parameter error", buf, 0xCu);
        }
        *(void *)(*(void *)(a1 + 40) + 48) = 0;
        char v38 = *(void **)(*(void *)(a1 + 40) + 24);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __75__HDCoreMotionDataCollector__didReceiveCoreMotionData_startingDatum_error___block_invoke_295;
        v63[3] = &unk_1E63005E0;
        id v64 = *(id *)(a1 + 56);
        v39 = [v38 keysOfEntriesPassingTest:v63];
        id v40 = *(void **)(*(void *)(a1 + 40) + 24);
        v41 = [v39 allObjects];
        [v40 removeObjectsForKeys:v41];

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v42 = v39;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v59 objects:v78 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v60 != v45) {
                objc_enumerationMutation(v42);
              }
              v47 = *(void **)(*(void *)(a1 + 40) + 16);
              v48 = [v47 aggregatorForType:*(void *)(*((void *)&v59 + 1) + 8 * i)];
              [v47 setLastSensorDatum:0 forAggregator:v48];
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v59 objects:v78 count:16];
          }
          while (v44);
        }

LABEL_50:
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "hd_stopStreaming");
        uint64_t v50 = *(void *)(a1 + 40);
        v51 = *(void **)(v50 + 32);
        *(void *)(v50 + 32) = 0;

        -[HDCoreMotionDataCollector _queue_updateCollectionType:](*(void *)(a1 + 40), 0);
        objc_msgSend(*(id *)(a1 + 40), "queue_recomputeCurrentState");
        return;
      }
    }
    else
    {
    }
    _HKInitializeLogging();
    v49 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = *(void *)(a1 + 40);
      uint64_t v53 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v80 = v52;
      __int16 v81 = 2114;
      uint64_t v82 = v53;
      _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Received error: %{public}@", buf, 0x16u);
    }
    ++*(void *)(*(void *)(a1 + 40) + 48);
    goto LABEL_50;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = v2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    if ([v4 count])
    {
      v55 = v4;
      _HKInitializeLogging();
      id v5 = (os_log_t *)MEMORY[0x1E4F29F10];
      id v6 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        double v7 = v6;
        *(_DWORD *)buf = 138543618;
        uint64_t v80 = v3;
        __int16 v81 = 2048;
        uint64_t v82 = [v55 count];
        _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Received %ld core motion datums", buf, 0x16u);
      }
      os_signpost_id_t v8 = _HKLogSignpostIDGenerate();
      _HKInitializeLogging();
      os_log_t v9 = *v5;
      if (os_signpost_enabled(*v5))
      {
        uint64_t v10 = v9;
        double v11 = v10;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          uint64_t v12 = [v55 count];
          uint64_t v13 = *(void *)(v3 + 8);
          *(_DWORD *)buf = 134218242;
          uint64_t v80 = v12;
          __int16 v81 = 2114;
          uint64_t v82 = v13;
          _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "core-motion-data-unpack", "count=%ld, types=%{public}@", buf, 0x16u);
        }
      }
      os_signpost_id_t v54 = v8;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      obuint64_t j = *(id *)(v3 + 8);
      double v14 = v55;
      uint64_t v58 = [obj countByEnumeratingWithState:&v65 objects:buf count:16];
      if (v58)
      {
        uint64_t v57 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v58; ++j)
          {
            if (*(void *)v66 != v57) {
              objc_enumerationMutation(obj);
            }
            int v16 = *(void **)(*((void *)&v65 + 1) + 8 * j);
            id v17 = v14;
            id v18 = v16;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
            if ([v17 count])
            {
              id v19 = [*(id *)(v3 + 24) objectForKeyedSubscript:v18];
              if (!v19)
              {
                uint64_t v20 = [*(id *)(v3 + 16) lastDatumForType:v18];
                id v19 = -[HDCoreMotionDataCollector _coreMotionDatumFromSensorDatum:]((void *)v3, v20);
              }
              uint64_t v21 = [v17 firstObject];
              __int16 v22 = objc_msgSend(v21, "hd_unitForType:", v18);

              if (v19)
              {
                double v23 = objc_msgSend(v19, "hd_sourceID");
                *(void *)v71 = MEMORY[0x1E4F143A8];
                uint64_t v72 = 3221225472;
                long long v73 = __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke;
                long long v74 = &unk_1E6300570;
                id v75 = v23;
                id v76 = v19;
                uint64_t v77 = v3;
                id v24 = v23;
                uint64_t v25 = objc_msgSend(v17, "hk_filter:", v71);

                id v17 = (id)v25;
              }
              if ([v17 count])
              {
                v69[0] = MEMORY[0x1E4F143A8];
                v69[1] = 3221225472;
                v69[2] = __66__HDCoreMotionDataCollector__queue_forwardCoreMotionData_forType___block_invoke_289;
                v69[3] = &unk_1E6300598;
                v69[4] = v3;
                id v26 = v18;
                id v70 = v26;
                char v27 = +[HDQuantityDatum quantityDataForDifferencesInData:v17 baseDatum:v19 unit:v22 differenceHandler:v69 intervalHandler:&__block_literal_global_102];
                if ([v27 count])
                {
                  __int16 v28 = [*(id *)(v3 + 16) aggregatorForType:v26];
                  v29 = [MEMORY[0x1E4F2AEF8] localDevice];
                  [v28 dataCollector:v3 didCollectSensorData:v27 device:v29 options:0];

                  double v14 = v55;
                }
                uint64_t v30 = [v17 lastObject];
                [*(id *)(v3 + 24) setObject:v30 forKeyedSubscript:v26];
              }
            }
          }
          uint64_t v58 = [obj countByEnumeratingWithState:&v65 objects:buf count:16];
        }
        while (v58);
      }

      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E4F29F10];
      id v4 = v14;
      if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29F10]))
      {
        char v32 = v31;
        v33 = v32;
        if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)v71 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v33, OS_SIGNPOST_INTERVAL_END, v54, "core-motion-data-unpack", "", v71, 2u);
        }

        id v4 = v55;
      }
    }
  }
}

uint64_t __75__HDCoreMotionDataCollector__didReceiveCoreMotionData_startingDatum_error___block_invoke_295(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqual:*(void *)(a1 + 32)];
}

uint64_t __73__HDCoreMotionDataCollector__queue_beginUpdatesWithTargetCollectionType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hd_compare:");
}

void __73__HDCoreMotionDataCollector__queue_beginUpdatesWithTargetCollectionType___block_invoke_300(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  os_signpost_id_t v8 = *(void **)(a1 + 32);
  id v9 = v7;
  id v10 = v8;
  id v11 = v6;
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained[7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HDCoreMotionDataCollector__didReceiveCoreMotionData_startingDatum_error___block_invoke;
    block[3] = &unk_1E62F6A40;
    id v15 = v9;
    int v16 = WeakRetained;
    id v17 = v11;
    id v18 = v10;
    dispatch_async(v12, block);
  }
}

- (void)_accessToFitnessDataDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HDCoreMotionDataCollector__accessToFitnessDataDidChange___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__HDCoreMotionDataCollector__accessToFitnessDataDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_recomputeCurrentState");
}

- (Class)coreMotionDatumClass
{
  return 0;
}

- (id)collectedTypes
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];

  return (id)[v2 set];
}

- (id)queue_newDataSource
{
  return 0;
}

- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5
{
  return 0.0;
}

- (id)persistentIdentifier
{
  return 0;
}

- (unint64_t)queue_targetCollectionTypeForRequestedCollectionType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_1BD32C3F0[a3];
  }
}

- (void)beginCollectionForDataAggregator:(id)a3 lastPersistedSensorDatum:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__HDCoreMotionDataCollector_beginCollectionForDataAggregator_lastPersistedSensorDatum___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __87__HDCoreMotionDataCollector_beginCollectionForDataAggregator_lastPersistedSensorDatum___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Received last sensor datum %@ from %{public}@", (uint8_t *)&v7, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setLastSensorDatum:*(void *)(a1 + 40) forAggregator:*(void *)(a1 + 48)];
  return objc_msgSend(*(id *)(a1 + 32), "queue_recomputeCurrentState");
}

- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HDCoreMotionDataCollector_dataAggregator_wantsCollectionWithConfiguration___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __77__HDCoreMotionDataCollector_dataAggregator_wantsCollectionWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (os_log_t *)MEMORY[0x1E4F29F10];
  if (*(uint64_t *)(*(void *)(a1 + 32) + 48) >= 1)
  {
    _HKInitializeLogging();
    uint64_t v3 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting error count on configuration change.", (uint8_t *)&v10, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 48) = 0;
  }
  _HKInitializeLogging();
  uint64_t v5 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    int v10 = 138543874;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received updated configuration %{public}@ from %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setConfiguration:*(void *)(a1 + 40) forAggregator:*(void *)(a1 + 48)];
  return objc_msgSend(*(id *)(a1 + 32), "queue_recomputeCurrentState");
}

- (id)sourceForDataAggregator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F2B560], "_localDeviceSource", a3);
}

- (id)identifierForDataAggregator:(id)a3
{
  return [(HDDataCollectorMultiplexer *)self->_multiplexer identifierForAggregator:a3];
}

- (Class)sensorDatumClassForAggregator:(id)a3
{
  return (Class)objc_opt_class();
}

- (id)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"Diagnostic Description:\n"];
  [v3 appendFormat:@"\tstate: %@\n", self->_state];
  objc_msgSend(v3, "appendFormat:", @"\terrorCount: %ld\n", self->_errorCount);
  [v3 appendFormat:@"\tdataSource: %@\n", self->_dataSource];
  [v3 appendFormat:@"\tquantityTypes: %@\n", self->_quantityTypes];
  [v3 appendFormat:@"\tlastCMDatumByType: %@\n", self->_lastCMDatumByType];

  return v3;
}

uint64_t __72__HDCoreMotionDataCollector__migrateDataCollectionContextForType_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [HDKeyValueDomain alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  uint64_t v8 = [(HDKeyValueDomain *)v5 initWithCategory:0 domainName:v6 profile:WeakRetained];

  id v35 = 0;
  id v9 = [(HDKeyValueDomain *)v8 dataForKey:@"context" error:&v35];
  id v10 = v35;
  uint64_t v11 = v10;
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v31 = 1;
      goto LABEL_10;
    }
    if (a3)
    {
      uint64_t v31 = 0;
      *a3 = v10;
      goto LABEL_10;
    }
    _HKLogDroppedError();
LABEL_9:
    uint64_t v31 = 0;
    goto LABEL_10;
  }
  if (![(HDKeyValueDomain *)v8 setData:0 forKey:@"context" error:a3]) {
    goto LABEL_9;
  }
  char v34 = [MEMORY[0x1E4F2B370] quantityWithUnit:*(void *)(a1 + 48) doubleValue:0.0];
  __int16 v12 = [HDQuantityDatum alloc];
  uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
  id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = (void *)[v14 initWithStartDate:v15 duration:0.0];
  uint64_t v17 = [(HDQuantityDatum *)v12 initWithIdentifier:v13 dateInterval:v16 resumeContext:v9 quantity:v34];
  uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initForWritingWithMutableData:v20];
  [v21 encodeObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:@"sensor_datum"];
  [v21 finishEncoding];
  __int16 v22 = [HDKeyValueDomain alloc];
  double v23 = NSString;
  [*(id *)(a1 + 56) identifier];
  id v24 = v33 = a3;
  uint64_t v25 = [v23 stringWithFormat:@"DATA_AGGREGATION-%@", v24];
  id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  char v27 = [(HDKeyValueDomain *)v22 initWithCategory:0 domainName:v25 profile:v26];

  __int16 v28 = *(id **)(a1 + 40);
  v29 = [v28[2] aggregatorForType:*(void *)(a1 + 56)];
  uint64_t v30 = [v28 identifierForDataAggregator:v29];

  uint64_t v31 = [(HDKeyValueDomain *)v27 setData:v20 forKey:v30 error:v33];
LABEL_10:

  return v31;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lastCMDatumByType, 0);
  objc_storeStrong((id *)&self->_multiplexer, 0);

  objc_storeStrong((id *)&self->_quantityTypes, 0);
}

@end