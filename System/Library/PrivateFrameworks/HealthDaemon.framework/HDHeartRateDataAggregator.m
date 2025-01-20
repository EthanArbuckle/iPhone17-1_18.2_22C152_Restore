@interface HDHeartRateDataAggregator
- (HDHeartRateDataAggregator)initWithDataCollectionManager:(id)a3;
- (id)configurationForCollector:(id)a3;
- (id)objectType;
- (uint64_t)_shouldRequestActiveCollectionForConfiguration:(uint64_t)a1;
- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
@end

@implementation HDHeartRateDataAggregator

- (id)objectType
{
  return (id)[MEMORY[0x1E4F2B448] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
}

- (HDHeartRateDataAggregator)initWithDataCollectionManager:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HDHeartRateDataAggregator;
  v3 = [(HDDataAggregator *)&v8 initWithDataCollectionManager:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_workoutManagerStateChanged_ name:@"HDWorkoutManagerStateDidChange" object:0];

    v5 = objc_alloc_init(HDHeartRateDataCollectionForwarder);
    dataForwarder = v3->_dataForwarder;
    v3->_dataForwarder = (HDDataCollectionForwarder *)v5;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDHeartRateDataAggregator;
  [(HDHeartRateDataAggregator *)&v4 dealloc];
}

- (id)configurationForCollector:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HDDataAggregator *)self allCollectors];
  v6 = [(HDDataAggregator *)self configuration];
  if ((-[HDHeartRateDataAggregator _shouldRequestActiveCollectionForConfiguration:]((uint64_t)self, v6) & 1) == 0)
  {
    v17 = +[HDDataCollectorConfiguration configurationWithType:1 aggregatorConfiguration:v6];
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E4F29F10];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = 2;
    v20 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [v13 collector];

        if (v14 == v4) {
          goto LABEL_16;
        }
        v15 = [v13 state];
        uint64_t v16 = [v15 collectionType];

        if (v16 == 2)
        {
          uint64_t v11 = 1;
LABEL_16:
          v5 = v20;
          goto LABEL_17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v5 = v20;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 2;
  }
LABEL_17:

  v17 = +[HDDataCollectorConfiguration configurationWithType:v11 aggregatorConfiguration:v6];
  _HKInitializeLogging();
  v18 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
LABEL_18:
    *(_DWORD *)buf = 138543874;
    v27 = self;
    __int16 v28 = 2114;
    id v29 = v4;
    __int16 v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Configuration for collector %{public}@: %{public}@", buf, 0x20u);
  }
LABEL_19:

  return v17;
}

- (uint64_t)_shouldRequestActiveCollectionForConfiguration:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [(id)a1 dataCollectionManager];
    v5 = [v4 profile];
    v6 = [v5 workoutManager];
    char v7 = [v6 isInHeartRateRecovery];

    if (v7)
    {
LABEL_3:
      a1 = 1;
      goto LABEL_13;
    }
    uint64_t v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
    if ([v8 isRealityDevice])
    {
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F2B860] sharedBehavior];
      int v10 = [v9 isiPad];

      if (!v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
        if (![v11 isAppleWatch])
        {

          goto LABEL_15;
        }
        char v12 = [v3 hasBackgroundObserver];

        if ((v12 & 1) == 0)
        {
LABEL_15:
          if (([v3 hasForegroundObserver] & 1) == 0 && (objc_msgSend(v3, "hasActiveWorkout") & 1) == 0)
          {
            a1 = [v3 hasBackgroundObserver];
            goto LABEL_13;
          }
          goto LABEL_3;
        }
LABEL_12:
        a1 = 0;
        goto LABEL_13;
      }
    }
    if (([v3 hasBackgroundObserver] & 1) == 0 && (objc_msgSend(v3, "hasForegroundObserver") & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  v93[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v88.receiver = self;
  v88.super_class = (Class)HDHeartRateDataAggregator;
  id v66 = a5;
  -[HDDataAggregator dataCollector:didCollectSensorData:device:options:](&v88, sel_dataCollector_didCollectSensorData_device_options_, v10, v11);
  if ((v6 & 1) == 0)
  {
    v65 = self;
    uint64_t v12 = [v10 sourceForDataAggregator:self];
    v13 = (void *)v12;
    if (v12)
    {
      v58 = (void *)v12;
      v60 = v10;
      v64 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
      id v14 = [v64 canonicalUnit];
      id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v59 = v11;
      id v15 = v11;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v84 objects:v92 count:16];
      if (!v16)
      {
        LOBYTE(v18) = 0;
        v20 = v65;
        goto LABEL_42;
      }
      uint64_t v17 = v16;
      int v18 = 0;
      uint64_t v19 = *(void *)v85;
      uint64_t v61 = *MEMORY[0x1E4F2BB28];
      v20 = v65;
      id v67 = v15;
      v62 = v14;
      while (1)
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v85 != v19) {
            objc_enumerationMutation(v15);
          }
          long long v22 = *(void **)(*((void *)&v84 + 1) + 8 * v21);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _HKInitializeLogging();
            long long v24 = (void *)*MEMORY[0x1E4F29F10];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR)) {
              goto LABEL_34;
            }
            v25 = v24;
            v26 = objc_opt_class();
            id v27 = v26;
            id v15 = v67;
            __int16 v28 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v26;
            __int16 v90 = 2114;
            double v91 = *(double *)&v28;
            id v29 = v28;
            _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "Rejecting heart rate sensor datum of unexpected class %{public}@ (expected %{public}@)", buf, 0x16u);

            goto LABEL_33;
          }
          if (![(HDDataAggregator *)v20 doesDatumPredateDatabaseObliteration:v22])
          {
            v25 = [v22 quantity];
            if ([v25 isCompatibleWithUnit:v14])
            {
              [v25 doubleValueForUnit:v14];
              if (v30 >= 0.0)
              {
                int v74 = v18;
                BOOL v73 = [v22 heartRateContext] == 10;
                v68 = (void *)MEMORY[0x1E4F2B388];
                v72 = [v22 quantity];
                v71 = [v22 dateInterval];
                v70 = [v71 startDate];
                v69 = [v22 dateInterval];
                v36 = [v69 endDate];
                if (v20)
                {
                  uint64_t v37 = [v22 heartRateContext];
                  v38 = [(HDDataAggregator *)v20 dataCollectionManager];
                  v39 = [v38 profile];
                  v40 = [v39 workoutManager];

                  v41 = [v40 currentWorkoutConfiguration];

                  if (v37 == 9 || v41 == 0) {
                    uint64_t v43 = v37;
                  }
                  else {
                    uint64_t v43 = 6;
                  }
                  v93[0] = v61;
                  v44 = [NSNumber numberWithInteger:v43];
                  *(void *)buf = v44;
                  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v93 count:1];
                }
                else
                {
                  v45 = 0;
                }
                v46 = [v68 _quantitySamplesEnforcingDurationWithType:v64 quantity:v72 startDate:v70 endDate:v36 device:v66 metadata:v45];

                uint64_t v47 = [v22 datumIdentifier];
                if (v47)
                {
                  v48 = (void *)v47;
                  uint64_t v49 = [v46 count];

                  if (v49)
                  {
                    v50 = [v46 objectAtIndexedSubscript:0];
                    v51 = [v22 datumIdentifier];
                    [v50 _setUUID:v51];
                  }
                }
                int v18 = v73 | v74;
                [v63 addObjectsFromArray:v46];

                id v14 = v62;
                v20 = v65;
                id v15 = v67;
              }
              else
              {
                double v31 = v30;
                _HKInitializeLogging();
                uint64_t v32 = *MEMORY[0x1E4F29F10];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v25;
                  __int16 v90 = 2048;
                  double v91 = v31;
                  v33 = v32;
                  v34 = "Rejecting heart rate quantity %@ because it's value (%f) is less than 0.0";
                  goto LABEL_20;
                }
              }
            }
            else
            {
              _HKInitializeLogging();
              v35 = *MEMORY[0x1E4F29F10];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v25;
                __int16 v90 = 2114;
                double v91 = *(double *)&v14;
                v33 = v35;
                v34 = "Rejecting heart rate quantity %@ because it is not compatible with canonical unit %{public}@";
LABEL_20:
                _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);
              }
            }
LABEL_33:

            goto LABEL_34;
          }
          _HKInitializeLogging();
          long long v23 = *MEMORY[0x1E4F29F10];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v20;
            _os_log_debug_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting sensor datum from pre-obliteration", buf, 0xCu);
          }
LABEL_34:
          ++v21;
        }
        while (v17 != v21);
        uint64_t v52 = [v15 countByEnumeratingWithState:&v84 objects:v92 count:16];
        uint64_t v17 = v52;
        if (!v52)
        {
LABEL_42:

          dataForwarder = v20->_dataForwarder;
          v55 = v20;
          v13 = v58;
          [(HDDataCollectionForwarder *)dataForwarder insertSamples:v63 device:v66 source:v58];
          v56 = [(HDDataAggregator *)v55 dataCollectionManager];
          v77[0] = MEMORY[0x1E4F143A8];
          v77[1] = 3221225472;
          v77[2] = __79__HDHeartRateDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke;
          v77[3] = &unk_1E630EF80;
          v77[4] = v55;
          id v78 = v63;
          id v79 = v15;
          id v10 = v60;
          id v80 = v60;
          id v81 = v58;
          id v82 = v66;
          char v83 = v18 & 1;
          v75[0] = MEMORY[0x1E4F143A8];
          v75[1] = 3221225472;
          v75[2] = __79__HDHeartRateDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_2;
          v75[3] = &unk_1E62F2978;
          id v76 = v78;
          id v57 = v78;
          [v56 performSaveWithMaximumLatency:v77 block:v75 completion:1.0];

          id v11 = v59;
          goto LABEL_43;
        }
      }
    }
    _HKInitializeLogging();
    v53 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_error_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_ERROR, "Collector %{public}@ failed to provide a source", buf, 0xCu);
    }
LABEL_43:
  }
}

uint64_t __79__HDHeartRateDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) persistObjects:*(void *)(a1 + 40) usedDatums:*(void *)(a1 + 48) collector:*(void *)(a1 + 56) source:*(void *)(a1 + 64) device:*(void *)(a1 + 72) resolveAssociations:*(unsigned __int8 *)(a1 + 80) error:a4];
}

void __79__HDHeartRateDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    char v6 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to persist heart rate samples '%@': %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)setConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting configuration update to %{public}@", buf, 0x16u);
  }
  if (-[HDHeartRateDataAggregator _shouldRequestActiveCollectionForConfiguration:]((uint64_t)self, v4))
  {
    char v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    int v8 = [v6 setWithObject:v7];
    +[HDActiveDataCollectionObserverServer launchObservingProcessesForTypes:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)HDHeartRateDataAggregator;
  [(HDDataAggregator *)&v9 setConfiguration:v4];
}

- (void).cxx_destruct
{
}

@end