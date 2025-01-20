@interface HKHRAFibBurdenTachogramClassificationsBuilder
- (HKHRAFibBurdenTachogramClassificationsBuilder)initWithProfile:(id)a3 classifier:(id)a4;
- (id)buildClassifications;
- (id)buildClassificationsAndWaitForNewClassificationSaves:(BOOL)a3;
- (id)classificationForSample:(id)a3;
- (void)_saveNewClassification:(id)a3;
- (void)addSampleToClassify:(id)a3 dayIndex:(int64_t)a4;
@end

@implementation HKHRAFibBurdenTachogramClassificationsBuilder

- (HKHRAFibBurdenTachogramClassificationsBuilder)initWithProfile:(id)a3 classifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKHRAFibBurdenTachogramClassificationsBuilder;
  v8 = [(HKHRAFibBurdenTachogramClassificationsBuilder *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_classifier, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    julianDayToClassifications = v9->_julianDayToClassifications;
    v9->_julianDayToClassifications = v10;

    dispatch_group_t v12 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v12;

    uint64_t v14 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;
  }
  return v9;
}

- (void)addSampleToClassify:(id)a3 dayIndex:(int64_t)a4
{
  id v6 = [(HKHRAFibBurdenTachogramClassificationsBuilder *)self classificationForSample:a3];
  if (v6)
  {
    id v15 = v6;
    julianDayToClassifications = self->_julianDayToClassifications;
    v8 = [NSNumber numberWithInteger:a4];
    v9 = [(NSMutableDictionary *)julianDayToClassifications objectForKey:v8];
    v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    dispatch_group_t v12 = v11;

    [v12 addObject:v15];
    v13 = self->_julianDayToClassifications;
    uint64_t v14 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v13 setObject:v12 forKey:v14];

    id v6 = v15;
  }
}

- (id)buildClassifications
{
  return [(HKHRAFibBurdenTachogramClassificationsBuilder *)self buildClassificationsAndWaitForNewClassificationSaves:0];
}

- (id)buildClassificationsAndWaitForNewClassificationSaves:(BOOL)a3
{
  if (a3)
  {
    group = self->_group;
    dispatch_time_t v5 = dispatch_time(0, 60000000000);
    if (dispatch_group_wait(group, v5))
    {
      _HKInitializeLogging();
      id v6 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[HKHRAFibBurdenTachogramClassificationsBuilder buildClassificationsAndWaitForNewClassificationSaves:]((uint64_t)self, v6);
      }
    }
  }
  id v7 = [(NSMutableDictionary *)self->_julianDayToClassifications hk_allValuesBySortedKeys];

  return v7;
}

- (id)classificationForSample:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  id v30 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__HKHRAFibBurdenTachogramClassificationsBuilder_classificationForSample___block_invoke;
  v21[3] = &unk_1E69B4C30;
  v23 = &v25;
  id v24 = 0;
  id v7 = v4;
  id v22 = v7;
  BOOL v8 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v6 error:&v24 block:v21];
  id v9 = v24;

  if (v9) {
    char v10 = v8;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    id v11 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = [v7 UUID];
      *(_DWORD *)buf = 138412802;
      v32 = self;
      __int16 v33 = 2112;
      v34 = v20;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_log_error_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_ERROR, "[%@] Error when retrieving cached tachogram classification for sample UUID %@: %@", buf, 0x20u);
    }
  }
  if (v8 && v26[5])
  {
    dispatch_group_t v12 = [HKHRAFibBurdenTachogramClassificationProvider alloc];
    v13 = [(HKHRAFibBurdenTachogramClassificationProvider *)v12 initWithSampleClassification:v26[5]];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = HKHRAFibBurdenLogForCategory();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v15)
    {
      v16 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_super v17 = [v7 UUID];
        *(_DWORD *)buf = 138412546;
        v32 = self;
        __int16 v33 = 2112;
        v34 = v17;
        _os_log_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_INFO, "[%@] Classifying tachogram sample with UUID %@", buf, 0x16u);
      }
    }
    v13 = [(HKHRAFibBurdenTachogramClassifier *)self->_classifier classifyHeartbeatSeries:v7];
    v18 = [(HKHRAFibBurdenTachogramClassificationProvider *)v13 sampleClassification];
    [(HKHRAFibBurdenTachogramClassificationsBuilder *)self _saveNewClassification:v18];
  }
  _Block_object_dispose(&v25, 8);

  return v13;
}

uint64_t __73__HKHRAFibBurdenTachogramClassificationsBuilder_classificationForSample___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  dispatch_time_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 UUID];
  uint64_t v8 = +[HDHRSampleClassificationEntity sampleClassificationWithSampleUUID:v7 transaction:v6 error:a3];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 1;
}

- (void)_saveNewClassification:(id)a3
{
  id v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HKHRAFibBurdenTachogramClassificationsBuilder__saveNewClassification___block_invoke;
  v7[3] = &unk_1E69B4578;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __72__HKHRAFibBurdenTachogramClassificationsBuilder__saveNewClassification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained database];
  id v12 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HKHRAFibBurdenTachogramClassificationsBuilder__saveNewClassification___block_invoke_2;
  v10[3] = &unk_1E69B4C58;
  id v4 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v4;
  BOOL v5 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v3 error:&v12 block:v10];
  id v6 = v12;

  if (!v5)
  {
    _HKInitializeLogging();
    id v7 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = [*(id *)(a1 + 40) sampleUUID];
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_ERROR, "[%@] Error while saving tachogram classification for sample with UUID %@: %@", buf, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 32));
}

BOOL __72__HKHRAFibBurdenTachogramClassificationsBuilder__saveNewClassification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  _HKInitializeLogging();
  id v6 = HKHRAFibBurdenLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

  if (v7)
  {
    uint64_t v8 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      char v10 = [*(id *)(a1 + 40) sampleUUID];
      int v14 = 138412546;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_INFO, "[%@] Caching classification with UUID %@", (uint8_t *)&v14, 0x16u);
    }
  }
  id v11 = +[HDHRSampleClassificationEntity insertSampleClassification:*(void *)(a1 + 40) transaction:v5 error:a3];
  BOOL v12 = v11 != 0;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_julianDayToClassifications, 0);
  objc_storeStrong((id *)&self->_classifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)buildClassificationsAndWaitForNewClassificationSaves:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_FAULT, "[%@] Took longer than 1 minute to save all tachogram classifications, no longer waiting.", (uint8_t *)&v2, 0xCu);
}

@end