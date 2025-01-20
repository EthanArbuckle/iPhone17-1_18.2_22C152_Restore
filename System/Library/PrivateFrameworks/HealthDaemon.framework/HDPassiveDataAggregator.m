@interface HDPassiveDataAggregator
- (Class)sensorDatumClass;
- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4;
- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6;
@end

@implementation HDPassiveDataAggregator

- (Class)sensorDatumClass
{
  return 0;
}

- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v10 = (HDPassiveDataAggregator *)a3;
  id v11 = a4;
  id v12 = a5;
  v50.receiver = self;
  v50.super_class = (Class)HDPassiveDataAggregator;
  [(HDDataAggregator *)&v50 dataCollector:v10 didCollectSensorData:v11 device:v12 options:a6];
  if ((a6 & 1) == 0)
  {
    uint64_t v13 = [(HDPassiveDataAggregator *)v10 sourceForDataAggregator:self];
    v14 = (void *)v13;
    if (v13)
    {
      v39 = (void *)v13;
      id v40 = v12;
      v42 = v10;
      [(HDPassiveDataAggregator *)self sensorDatumClass];
      v43 = (HDPassiveDataAggregator *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v41 = v11;
      id v15 = v11;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v59 count:16];
      v17 = (os_log_t *)MEMORY[0x1E4F29F10];
      if (v16)
      {
        uint64_t v18 = v16;
        uint64_t v19 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v47 != v19) {
              objc_enumerationMutation(v15);
            }
            v21 = *(HDPassiveDataAggregator **)(*((void *)&v46 + 1) + 8 * i);
            if (objc_opt_isKindOfClass())
            {
              if ([(HDDataAggregator *)self doesDatumPredateDatabaseObliteration:v21])
              {
                _HKInitializeLogging();
                v22 = *v17;
                if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v52 = self;
                  _os_log_debug_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting sensor datum from pre-obliteration", buf, 0xCu);
                }
              }
              else
              {
                id v45 = 0;
                v29 = [(HDPassiveDataAggregator *)self dataObjectsFromSensorDatum:v21 error:&v45];
                v30 = (HDPassiveDataAggregator *)v45;
                if (v29)
                {
                  [(HDPassiveDataAggregator *)v43 addObjectsFromArray:v29];
                }
                else
                {
                  _HKInitializeLogging();
                  v31 = *v17;
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    v32 = v31;
                    v33 = (objc_class *)objc_opt_class();
                    *(_DWORD *)buf = 138412802;
                    v52 = v21;
                    __int16 v53 = 2114;
                    v54 = v33;
                    __int16 v55 = 2114;
                    v56 = v30;
                    v34 = v33;
                    _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "Failed to produce objects from sensor datum %@ (%{public}@): %{public}@", buf, 0x20u);
                  }
                }

                v17 = (os_log_t *)MEMORY[0x1E4F29F10];
              }
            }
            else
            {
              _HKInitializeLogging();
              os_log_t v23 = *v17;
              if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
              {
                v24 = v23;
                v25 = (HDPassiveDataAggregator *)objc_opt_class();
                v26 = v25;
                v27 = [(HDPassiveDataAggregator *)self sensorDatumClass];
                *(_DWORD *)buf = 138543618;
                v52 = v25;
                __int16 v53 = 2114;
                v54 = v27;
                v28 = v27;
                _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Rejecting sensor datum of unexpected class %{public}@ (expected %{public}@)", buf, 0x16u);
              }
            }
          }
          uint64_t v18 = [v15 countByEnumeratingWithState:&v46 objects:v59 count:16];
        }
        while (v18);
      }

      id v44 = 0;
      v10 = v42;
      v14 = v39;
      id v12 = v40;
      BOOL v35 = [(HDDataAggregator *)self persistObjects:v43 usedDatums:v15 collector:v42 source:v39 device:v40 resolveAssociations:0 error:&v44];
      id v36 = v44;
      if (!v35)
      {
        _HKInitializeLogging();
        v37 = *MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v52 = v43;
          __int16 v53 = 2114;
          v54 = (objc_class *)v15;
          __int16 v55 = 2114;
          v56 = v42;
          __int16 v57 = 2114;
          id v58 = v36;
          _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "Failed to persist %@ through %{public}@ from %{public}@: %{public}@", buf, 0x2Au);
        }
      }

      id v11 = v41;
    }
    else
    {
      _HKInitializeLogging();
      v38 = *MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "Collector %{public}@ failed to provide a source", buf, 0xCu);
      }
    }
  }
}

@end