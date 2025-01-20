@interface HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager
- (HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager)initWithKeyValueDomain:(id)a3 dateGenerator:(id)a4 queue:(id)a5;
- (HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager)initWithProfile:(id)a3;
- (id)_dateKeyForBreadcrumb:(int64_t)a3;
- (id)fetchBreadcrumbsWithError:(id *)a3;
- (void)_queue_dropAnalysisResultBreadcrumbWithContext:(id)a3 date:(id)a4;
- (void)_queue_dropBreadcrumb:(int64_t)a3 date:(id)a4;
- (void)dropAnalysisResultBreadcrumbWithContext:(id)a3;
- (void)dropBreadcrumb:(int64_t)a3;
@end

@implementation HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager

- (HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager)initWithProfile:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F65B28], "hdhr_aFibBurdenProtectedSyncedDomainForProfile:", a3);
  v5 = HKCreateSerialDispatchQueue();
  v6 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self initWithKeyValueDomain:v4 dateGenerator:&__block_literal_global_11 queue:v5];

  return v6;
}

uint64_t __67__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_initWithProfile___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager)initWithKeyValueDomain:(id)a3 dateGenerator:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager;
  v12 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyValueDomain, a3);
    uint64_t v14 = MEMORY[0x1D943B130](v10);
    id dateGenerator = v13->_dateGenerator;
    v13->_id dateGenerator = (id)v14;

    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)dropBreadcrumb:(int64_t)a3
{
  v5 = (*((void (**)(void))self->_dateGenerator + 2))();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_dropBreadcrumb___block_invoke;
  block[3] = &unk_1E69B4BD8;
  id v9 = v5;
  int64_t v10 = a3;
  block[4] = self;
  id v7 = v5;
  dispatch_async(queue, block);
}

uint64_t __66__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_dropBreadcrumb___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_dropBreadcrumb:date:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)dropAnalysisResultBreadcrumbWithContext:(id)a3
{
  id v4 = a3;
  v5 = (*((void (**)(void))self->_dateGenerator + 2))();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_dropAnalysisResultBreadcrumbWithContext___block_invoke;
  block[3] = &unk_1E69B4528;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

uint64_t __91__HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager_dropAnalysisResultBreadcrumbWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_dropAnalysisResultBreadcrumbWithContext:date:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)fetchBreadcrumbsWithError:(id *)a3
{
  keyValueDomain = self->_keyValueDomain;
  v6 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self _dateKeyForBreadcrumb:0];
  id v7 = [(HDKeyValueDomain *)keyValueDomain dateForKey:v6 error:a3];

  id v8 = 0;
  if (!*a3)
  {
    id v9 = self->_keyValueDomain;
    id v10 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self _dateKeyForBreadcrumb:1];
    id v11 = [(HDKeyValueDomain *)v9 dateForKey:v10 error:a3];

    if (*a3)
    {
      id v8 = 0;
    }
    else
    {
      v12 = self->_keyValueDomain;
      v13 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self _dateKeyForBreadcrumb:2];
      uint64_t v14 = [(HDKeyValueDomain *)v12 dateForKey:v13 error:a3];

      if (*a3)
      {
        id v8 = 0;
      }
      else
      {
        v15 = self->_keyValueDomain;
        v16 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self _dateKeyForBreadcrumb:3];
        objc_super v17 = [(HDKeyValueDomain *)v15 dateForKey:v16 error:a3];

        if (*a3)
        {
          id v8 = 0;
        }
        else
        {
          v18 = self->_keyValueDomain;
          v19 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self _dateKeyForBreadcrumb:4];
          v20 = [(HDKeyValueDomain *)v18 dateForKey:v19 error:a3];

          if (*a3)
          {
            id v8 = 0;
          }
          else
          {
            v21 = self->_keyValueDomain;
            v22 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self _dateKeyForBreadcrumb:5];
            v23 = [(HDKeyValueDomain *)v21 dateForKey:v22 error:a3];

            if (*a3)
            {
              id v8 = 0;
            }
            else
            {
              v24 = self->_keyValueDomain;
              v25 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self _dateKeyForBreadcrumb:6];
              v26 = [(HDKeyValueDomain *)v24 dateForKey:v25 error:a3];

              if (*a3)
              {
                id v8 = 0;
              }
              else
              {
                v27 = [(HDKeyValueDomain *)self->_keyValueDomain dateForKey:@"SevenDayAnalysisBreadcrumbAnalysisResultGiven" error:a3];
                if (*a3)
                {
                  id v8 = 0;
                }
                else
                {
                  id v30 = v27;
                  v28 = [(HDKeyValueDomain *)self->_keyValueDomain stringForKey:@"SevenDayAnalysisBreadcrumbAnalysisResultContext" error:a3];
                  if (*a3) {
                    id v8 = 0;
                  }
                  else {
                    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F67DB8]) initWithAlarmFiredDate:v7 xpcActivityFiredDate:v11 maintenanceOperationRunDate:v14 analysisStartedDate:v17 tachogramsClassifiedDate:v20 analysisEndedDate:v23 analysisRetryLaterRequestedDate:v26 lastAnalysisResultDate:v30 lastAnalysisResultContext:v28];
                  }

                  v27 = v30;
                }
              }
            }
          }
        }
      }
    }
  }

  return v8;
}

- (void)_queue_dropBreadcrumb:(int64_t)a3 date:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2(queue);
  id v8 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)self _dateKeyForBreadcrumb:a3];
  keyValueDomain = self->_keyValueDomain;
  id v12 = 0;
  [(HDKeyValueDomain *)keyValueDomain setDate:v7 forKey:v8 error:&v12];

  id v10 = v12;
  if (v10)
  {
    _HKInitializeLogging();
    id v11 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _queue_dropBreadcrumb:date:]();
    }
  }
}

- (void)_queue_dropAnalysisResultBreadcrumbWithContext:(id)a3 date:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  keyValueDomain = self->_keyValueDomain;
  id v16 = 0;
  [(HDKeyValueDomain *)keyValueDomain setDate:v7 forKey:@"SevenDayAnalysisBreadcrumbAnalysisResultGiven" error:&v16];

  id v10 = v16;
  if (v10)
  {
    _HKInitializeLogging();
    id v11 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _queue_dropBreadcrumb:date:]();
    }
  }
  id v12 = self->_keyValueDomain;
  id v15 = 0;
  [(HDKeyValueDomain *)v12 setString:v8 forKey:@"SevenDayAnalysisBreadcrumbAnalysisResultContext" error:&v15];

  id v13 = v15;
  if (v13)
  {
    _HKInitializeLogging();
    uint64_t v14 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager _queue_dropAnalysisResultBreadcrumbWithContext:date:]();
    }
  }
}

- (id)_dateKeyForBreadcrumb:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"SevenDayAnalysisBreadcrumbAlarmFired";
  }
  else {
    return off_1E69B4BF8[a3 - 1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_dateGenerator, 0);

  objc_storeStrong((id *)&self->_keyValueDomain, 0);
}

- (void)_queue_dropBreadcrumb:date:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error when saving date: %{public}@");
}

- (void)_queue_dropAnalysisResultBreadcrumbWithContext:date:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Error when saving context: %{public}@");
}

@end