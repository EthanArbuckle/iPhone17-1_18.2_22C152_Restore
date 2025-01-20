@interface HDWorkoutTrainingLoadQueryHelper
- (HDWorkoutTrainingLoadQueryHelper)initWithFilter:(id)a3 options:(int64_t)a4 anchorDate:(id)a5 intervalComponents:(id)a6 profile:(id)a7;
- (HDWorkoutTrainingLoadQueryHelper)initWithFilter:(id)a3 options:(int64_t)a4 profile:(id)a5;
- (id)_calculatorWithIntervalCollection:(id)a3;
- (id)_trainingLoadFromStatistics:(id)a3 count:(int64_t)a4;
- (void)fetchTrainingLoadCollectionWithCompletion:(id)a3;
- (void)fetchTrainingLoadWithCompletion:(id)a3;
@end

@implementation HDWorkoutTrainingLoadQueryHelper

- (HDWorkoutTrainingLoadQueryHelper)initWithFilter:(id)a3 options:(int64_t)a4 profile:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutTrainingLoadQueryHelper;
  v10 = [(HDWorkoutTrainingLoadQueryHelper *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_profile, v9);
    uint64_t v12 = [v8 copy];
    filter = v11->_filter;
    v11->_filter = (_HKFilter *)v12;

    v11->_options = a4;
  }

  return v11;
}

- (HDWorkoutTrainingLoadQueryHelper)initWithFilter:(id)a3 options:(int64_t)a4 anchorDate:(id)a5 intervalComponents:(id)a6 profile:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  objc_super v15 = (NSDate *)[a5 copy];
  anchorDate = self->_anchorDate;
  self->_anchorDate = v15;

  v17 = (NSDateComponents *)[v13 copy];
  intervalComponents = self->_intervalComponents;
  self->_intervalComponents = v17;

  v19 = [(HDWorkoutTrainingLoadQueryHelper *)self initWithFilter:v14 options:a4 profile:v12];
  return v19;
}

- (void)fetchTrainingLoadWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(HDWorkoutTrainingLoadQueryHelper *)self _calculatorWithIntervalCollection:0];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dataSource = self->_dataSource;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __68__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadWithCompletion___block_invoke;
  v38[3] = &unk_1E62FBF38;
  id v9 = v5;
  id v39 = v9;
  v40 = self;
  v10 = self;
  id v32 = v7;
  id v41 = v32;
  id v11 = v6;
  id v42 = v11;
  if ([(HDWorkoutTrainingLoadDataSource *)dataSource samplesForCalculatorWithHandler:v38])
  {
    id v30 = v9;
    v31 = v4;
    v28 = [v9 currentStatistics];
    id v29 = v11;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v18 = objc_msgSend(v12, "objectForKeyedSubscript:", v17, v28);
          v19 = [v18 currentStatistics];
          v20 = [v32 objectForKeyedSubscript:v17];
          v21 = -[HDWorkoutTrainingLoadQueryHelper _trainingLoadFromStatistics:count:](v10, "_trainingLoadFromStatistics:count:", v19, [v20 count]);

          v22 = [v33 objectForKeyedSubscript:v17];

          if (!v22) {
            [v33 setObject:v21 forKeyedSubscript:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v14);
    }

    if ([v28 dataCount])
    {
      id v23 = objc_alloc(MEMORY[0x1E4F2B7F8]);
      v24 = -[HDWorkoutTrainingLoadQueryHelper _trainingLoadFromStatistics:count:](v10, "_trainingLoadFromStatistics:count:", v28, [v28 dataCount]);
      v25 = (void *)[v23 initWithTotalTrainingLoad:v24 trainingloadByActivityType:v33];

      v4 = v31;
    }
    else
    {
      _HKInitializeLogging();
      v27 = *MEMORY[0x1E4F29FB8];
      v4 = v31;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v10;
        _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_INFO, "%{public}@: No training load to return", buf, 0xCu);
      }
      v25 = 0;
    }
    id v11 = v29;
    v4[2](v4, v25, 0);

    id v9 = v30;
  }
  else
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v45 = self;
      __int16 v46 = 2114;
      uint64_t v47 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed querying training load with error : %{public}@", buf, 0x16u);
    }
    v4[2](v4, 0, 0);
  }
}

uint64_t __68__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7, double a8)
{
  id v15 = a4;
  v16 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadWithCompletion___block_invoke_2;
  v23[3] = &unk_1E62FBF10;
  id v17 = v16;
  double v29 = a6;
  double v30 = a7;
  double v31 = a8;
  uint64_t v32 = a2;
  uint64_t v18 = *(void *)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  id v24 = v17;
  uint64_t v25 = v18;
  uint64_t v33 = a3;
  id v26 = v19;
  id v27 = v15;
  id v28 = *(id *)(a1 + 56);
  id v20 = v15;
  uint64_t v21 = [v17 performAddSampleTransaction:v23 error:a5];

  return v21;
}

uint64_t __68__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadWithCompletion___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) addSampleValue:*(void *)(a1 + 96) startTime:a2 endTime:*(double *)(a1 + 72) sourceID:*(double *)(a1 + 80) error:*(double *)(a1 + 88)];
  if (*(void *)(*(void *)(a1 + 40) + 24) == 1)
  {
    v5 = *(void **)(a1 + 48);
    id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 104)];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v9 = *(void **)(a1 + 48);
      v10 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 104)];
      [v9 setObject:v8 forKeyedSubscript:v10];
    }
    id v11 = *(void **)(a1 + 48);
    id v12 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 104)];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    [v13 addObject:*(void *)(a1 + 56)];

    uint64_t v14 = *(void **)(a1 + 64);
    id v15 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 104)];
    v16 = [v14 objectForKeyedSubscript:v15];

    if (!v16)
    {
      v16 = [*(id *)(a1 + 40) _calculatorWithIntervalCollection:0];
      id v17 = *(void **)(a1 + 64);
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 104)];
      [v17 setObject:v16 forKeyedSubscript:v18];
    }
    if (([v16 addSampleValue:*(void *)(a1 + 96) startTime:a2 endTime:*(double *)(a1 + 72) sourceID:*(double *)(a1 + 80) error:*(double *)(a1 + 88)] & 1) == 0)
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 80);
        uint64_t v22 = *(void *)(a1 + 88);
        id v23 = NSNumber;
        uint64_t v24 = *(void *)(a1 + 104);
        uint64_t v25 = v19;
        id v26 = [v23 numberWithUnsignedInteger:v24];
        uint64_t v27 = *a2;
        int v29 = 138544386;
        uint64_t v30 = v20;
        __int16 v31 = 2048;
        uint64_t v32 = v21;
        __int16 v33 = 2048;
        uint64_t v34 = v22;
        __int16 v35 = 2114;
        long long v36 = v26;
        __int16 v37 = 2114;
        uint64_t v38 = v27;
        _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_INFO, "%{public}@: Failed adding sample to load activity calculator with start date %f, end date %f and activityType %{public}@, error:%{public}@", (uint8_t *)&v29, 0x34u);
      }
    }
  }
  return v4;
}

- (void)fetchTrainingLoadCollectionWithCompletion:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *, void))a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F2B8A8]) initWithAnchorDate:self->_anchorDate intervalComponents:self->_intervalComponents];
  id v6 = [(HDWorkoutTrainingLoadQueryHelper *)self _calculatorWithIntervalCollection:v5];
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x3032000000;
  __int16 v33 = __Block_byref_object_copy__64;
  uint64_t v34 = __Block_byref_object_dispose__64;
  id v35 = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke;
  v29[3] = &unk_1E62FBF60;
  v29[4] = self;
  v29[5] = &v30;
  [v6 setStatisticsHandler:v29];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dataSource = self->_dataSource;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_2;
  uint64_t v22 = &unk_1E62FBFD8;
  id v11 = v6;
  id v23 = v11;
  uint64_t v24 = self;
  id v12 = v7;
  id v25 = v12;
  id v13 = v8;
  id v26 = v13;
  id v14 = v5;
  id v27 = v14;
  id v15 = v9;
  id v28 = v15;
  if (![(HDWorkoutTrainingLoadDataSource *)dataSource samplesForCalculatorWithHandler:&v19])
  {
    _HKInitializeLogging();
    uint64_t v18 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v37 = self;
      __int16 v38 = 2114;
      uint64_t v39 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed querying training load with error : %{public}@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if (!v31[5])
  {
LABEL_6:
    id v17 = 0;
    goto LABEL_7;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F2B7E8]);
  id v17 = objc_msgSend(v16, "initWithTotalTrainingLoadCollection:collectionByActivityType:", v31[5], v15, v19, v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_7:
  v4[2](v4, v17, 0);

  _Block_object_dispose(&v30, 8);
}

void __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  uint64_t v4 = [v11 sumQuantity];
  [v4 _value];
  double v6 = v5;

  if (v6 != 0.0)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F2B7D8]) _init];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    v10 = objc_msgSend(*(id *)(a1 + 32), "_trainingLoadFromStatistics:count:", v11, objc_msgSend(v11, "dataCount"));
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addTrainingLoad:v10];
  }
}

uint64_t __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7, double a8)
{
  id v15 = a4;
  id v16 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_3;
  v23[3] = &unk_1E62FBFB0;
  id v17 = v16;
  double v31 = a6;
  double v32 = a7;
  double v33 = a8;
  uint64_t v34 = a2;
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void **)(a1 + 48);
  id v24 = v17;
  uint64_t v25 = v18;
  uint64_t v35 = a3;
  id v26 = v19;
  id v27 = v15;
  id v28 = *(id *)(a1 + 56);
  id v29 = *(id *)(a1 + 64);
  id v30 = *(id *)(a1 + 72);
  id v20 = v15;
  uint64_t v21 = [v17 performAddSampleTransaction:v23 error:a5];

  return v21;
}

uint64_t __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) addSampleValue:*(void *)(a1 + 112) startTime:a2 endTime:*(double *)(a1 + 88) sourceID:*(double *)(a1 + 96) error:*(double *)(a1 + 104)];
  if (*(void *)(*(void *)(a1 + 40) + 24) == 1)
  {
    uint64_t v4 = *(void **)(a1 + 48);
    double v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 120)];
    double v6 = [v4 objectForKeyedSubscript:v5];

    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v8 = *(void **)(a1 + 48);
      id v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 120)];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
    v10 = *(void **)(a1 + 48);
    id v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 120)];
    id v12 = [v10 objectForKeyedSubscript:v11];
    [v12 addObject:*(void *)(a1 + 56)];

    id v13 = *(void **)(a1 + 64);
    id v14 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 120)];
    id v15 = [v13 objectForKeyedSubscript:v14];

    if (!v15)
    {
      id v15 = [*(id *)(a1 + 40) _calculatorWithIntervalCollection:*(void *)(a1 + 72)];
      id v16 = *(void **)(a1 + 64);
      id v17 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 120)];
      [v16 setObject:v15 forKeyedSubscript:v17];
    }
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_4;
    v46[3] = &unk_1E62FBF88;
    uint64_t v18 = *(void **)(a1 + 48);
    v46[4] = *(void *)(a1 + 40);
    id v19 = v18;
    uint64_t v20 = *(void *)(a1 + 120);
    id v47 = v19;
    uint64_t v49 = v20;
    id v48 = *(id *)(a1 + 80);
    [v15 setStatisticsHandler:v46];
    _HKInitializeLogging();
    uint64_t v21 = (os_log_t *)MEMORY[0x1E4F29FB8];
    uint64_t v22 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 96);
      uint64_t v24 = *(void *)(a1 + 104);
      id v26 = NSNumber;
      uint64_t v27 = *(void *)(a1 + 120);
      id v28 = v22;
      id v29 = [v26 numberWithUnsignedInteger:v27];
      *(_DWORD *)buf = 138544130;
      uint64_t v51 = v23;
      __int16 v52 = 2048;
      uint64_t v53 = v25;
      __int16 v54 = 2048;
      uint64_t v55 = v24;
      uint64_t v21 = (os_log_t *)MEMORY[0x1E4F29FB8];
      __int16 v56 = 2114;
      v57 = v29;
      _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_INFO, "%{public}@: Adding sample to activity calculator with start %f, end date %f and activityType : %{public}@", buf, 0x2Au);
    }
    double v30 = *(double *)(a1 + 88);
    double v31 = *(double *)(a1 + 96);
    double v32 = *(double *)(a1 + 104);
    uint64_t v33 = *(void *)(a1 + 112);
    id v45 = 0;
    char v34 = [v15 addSampleValue:v33 startTime:&v45 endTime:v30 sourceID:v31 error:v32];
    id v35 = v45;
    if ((v34 & 1) == 0)
    {
      _HKInitializeLogging();
      os_log_t v36 = *v21;
      if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = *(void *)(a1 + 40);
        uint64_t v39 = *(void *)(a1 + 96);
        uint64_t v40 = *(void *)(a1 + 104);
        id v41 = NSNumber;
        uint64_t v42 = *(void *)(a1 + 120);
        v43 = v36;
        v44 = [v41 numberWithUnsignedInteger:v42];
        *(_DWORD *)buf = 138544386;
        uint64_t v51 = v38;
        __int16 v52 = 2048;
        uint64_t v53 = v39;
        __int16 v54 = 2048;
        uint64_t v55 = v40;
        __int16 v56 = 2114;
        v57 = v44;
        __int16 v58 = 2114;
        id v59 = v35;
        _os_log_error_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Failed adding sample to activity calculator with start date %f, end date %f, activityType %{public}@ and error: %{public}@", buf, 0x34u);
      }
    }
  }
  return v3;
}

void __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)a1[4];
  double v5 = (void *)a1[5];
  double v6 = NSNumber;
  uint64_t v7 = a1[7];
  id v8 = a3;
  id v9 = [v6 numberWithUnsignedInteger:v7];
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_msgSend(v4, "_trainingLoadFromStatistics:count:", v8, objc_msgSend(v10, "count"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = (void *)a1[6];
  id v12 = [NSNumber numberWithUnsignedInteger:a1[7]];
  id v13 = [v11 objectForKeyedSubscript:v12];

  if (!v13) {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F2B7D8]) _init];
  }
  [v13 addTrainingLoad:v16];
  id v14 = (void *)a1[6];
  id v15 = [NSNumber numberWithUnsignedInteger:a1[7]];
  [v14 setObject:v13 forKeyedSubscript:v15];
}

- (id)_trainingLoadFromStatistics:(id)a3 count:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 sumQuantity];
  [v7 _value];
  double v9 = v8;

  if (v9 == 0.0)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      int v19 = 138543362;
      uint64_t v20 = self;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: No training load. Returning 0 value ", (uint8_t *)&v19, 0xCu);
    }
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v12 = [v6 startDate];
  id v13 = [v6 endDate];
  id v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F2B7D0]);
  id v16 = [v6 sumQuantity];

  id v17 = (void *)[v15 initWithQuantity:v16 dateInterval:v14 count:a4];

  return v17;
}

- (id)_calculatorWithIntervalCollection:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F2B3B8];
  uint64_t v5 = *MEMORY[0x1E4F2A950];
  id v6 = a3;
  uint64_t v7 = [v4 quantityTypeForIdentifier:v5];
  double v8 = [MEMORY[0x1E4F2B618] appleEffortScoreUnit];
  double v9 = [MEMORY[0x1E4F2B618] secondUnit];
  v10 = [v8 unitMultipliedByUnit:v9];
  id v11 = +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:v7 aggregationStyle:0 canonicalUnit:v10 shouldUseUnderlyingTypeForStatistics:0];

  id v12 = +[HDStatisticsCollectionCalculator calculatorForQuantityType:v11 intervalCollection:v6 options:16 mergeStrategy:0 computationMethod:0];

  id v13 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v15 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)v13 initWithProfile:WeakRetained quantityType:v11];
  sourceOrderProvider = self->_sourceOrderProvider;
  self->_sourceOrderProvider = v15;

  if (!self->_dataSource)
  {
    id v17 = [HDWorkoutTrainingLoadDataSource alloc];
    id v18 = objc_loadWeakRetained((id *)&self->_profile);
    int v19 = [(HDWorkoutTrainingLoadDataSource *)v17 initWithProfile:v18 quantityType:v11 filter:self->_filter];
    dataSource = self->_dataSource;
    self->_dataSource = v19;
  }
  [v12 setSourceOrderProvider:self->_sourceOrderProvider];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sourceOrderProvider, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_filter, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end