@interface HKAnalyticsEventSubmissionManager
- (BOOL)submitEvent:(id)a3 error:(id *)a4;
- (HKAnalyticsEventSubmissionManager)initWithDataSource:(id)a3 eventUsedProvider:(id)a4 analyticsEventConsumer:(id)a5 loggingCategory:(id)a6;
- (HKAnalyticsEventSubmissionManager)initWithLoggingCategory:(id)a3 healthDataSource:(id)a4;
- (id)queue;
- (void)submitEvent:(id)a3 completion:(id)a4;
@end

@implementation HKAnalyticsEventSubmissionManager

- (HKAnalyticsEventSubmissionManager)initWithLoggingCategory:(id)a3 healthDataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HKAnalyticsDataSource alloc] initWithHealthDataSource:v6];

  v9 = [(HKAnalyticsEventSubmissionManager *)self initWithDataSource:v8 eventUsedProvider:&__block_literal_global_27 analyticsEventConsumer:&__block_literal_global_7 loggingCategory:v7];
  return v9;
}

uint64_t __78__HKAnalyticsEventSubmissionManager_initWithLoggingCategory_healthDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4113888](a2);
}

uint64_t __78__HKAnalyticsEventSubmissionManager_initWithLoggingCategory_healthDataSource___block_invoke_2()
{
  return AnalyticsSendEvent();
}

- (HKAnalyticsEventSubmissionManager)initWithDataSource:(id)a3 eventUsedProvider:(id)a4 analyticsEventConsumer:(id)a5 loggingCategory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKAnalyticsEventSubmissionManager;
  v15 = [(HKAnalyticsEventSubmissionManager *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataSource, a3);
    v17 = _Block_copy(v12);
    id eventUsedProvider = v16->_eventUsedProvider;
    v16->_id eventUsedProvider = v17;

    v19 = _Block_copy(v13);
    id analyticsEventConsumer = v16->_analyticsEventConsumer;
    v16->_id analyticsEventConsumer = v19;

    objc_storeStrong((id *)&v16->_loggingCategory, a6);
  }

  return v16;
}

- (BOOL)submitEvent:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 eventName];
  if ((*((uint64_t (**)(void))self->_eventUsedProvider + 2))())
  {
    v8 = [(HKAnalyticsDataSource *)self->_dataSource environmentDataSource];
    int v9 = [v8 isImproveHealthAndActivityEnabled];

    if ([v6 isEventSubmissionIHAGated] && (v9 & 1) == 0)
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      BOOL v11 = 0;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v32 = self;
        __int16 v33 = 2114;
        v34 = v7;
        id v12 = "[%{public}@:%{public}@] Analytics event not sent as event requires IH&A but IH&A not enabled";
LABEL_8:
        _os_log_impl(&dword_19C023000, loggingCategory, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
        BOOL v11 = 0;
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dataSource = self->_dataSource;
    id v30 = 0;
    v15 = [v6 makeUnrestrictedEventPayloadWithDataSource:dataSource error:&v30];
    id v16 = v30;
    if (v16)
    {
      v17 = v16;
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError(v16);
      }
      _HKInitializeLogging();
      v19 = self->_loggingCategory;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v32 = self;
        __int16 v33 = 2114;
        v34 = v17;
        __int16 v35 = 2114;
        v36 = v7;
        _os_log_error_impl(&dword_19C023000, v19, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error when extracting unrestricted event payload: %{public}@", buf, 0x20u);
      }
LABEL_17:

      goto LABEL_18;
    }
    if (v15)
    {
      v18 = (void *)[v15 copy];
      [v13 addEntriesFromDictionary:v18];
    }
    else
    {
      _HKInitializeLogging();
      v21 = self->_loggingCategory;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v32 = self;
        __int16 v33 = 2114;
        v34 = v7;
        _os_log_impl(&dword_19C023000, v21, OS_LOG_TYPE_INFO, "[%{public}@:%{public}@] No unrestricted payload", buf, 0x16u);
      }
    }
    if (v9)
    {
      objc_super v22 = self->_dataSource;
      id v29 = 0;
      v23 = [v6 makeIHAGatedEventPayloadWithDataSource:v22 error:&v29];
      id v24 = v29;
      if (v24)
      {
        v17 = v24;
        if (a4) {
          *a4 = v24;
        }
        else {
          _HKLogDroppedError(v24);
        }
        _HKInitializeLogging();
        v26 = self->_loggingCategory;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v32 = self;
          __int16 v33 = 2114;
          v34 = v17;
          __int16 v35 = 2114;
          v36 = v7;
          _os_log_error_impl(&dword_19C023000, v26, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error when extracting IHA gated event payload: %{public}@", buf, 0x20u);
        }

        goto LABEL_17;
      }
      if (v23)
      {
        v25 = (void *)[v23 copy];
        [v13 addEntriesFromDictionary:v25];
      }
      else
      {
        _HKInitializeLogging();
        v27 = self->_loggingCategory;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v32 = self;
          __int16 v33 = 2114;
          v34 = v7;
          _os_log_impl(&dword_19C023000, v27, OS_LOG_TYPE_INFO, "[%{public}@:%{public}@] No IH&A gated payload", buf, 0x16u);
        }
      }
    }
    if ([v13 count])
    {
      (*((void (**)(void))self->_analyticsEventConsumer + 2))();
      BOOL v11 = 1;
      goto LABEL_19;
    }
    _HKInitializeLogging();
    v28 = self->_loggingCategory;
    BOOL v11 = 0;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138543618;
    v32 = self;
    __int16 v33 = 2114;
    v34 = v7;
    _os_log_impl(&dword_19C023000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Not sending payload as there were no contents", buf, 0x16u);
LABEL_18:
    BOOL v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  BOOL v11 = 0;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = self;
    __int16 v33 = 2114;
    v34 = v7;
    id v12 = "[%{public}@:%{public}@] Analytics event not sent as event treated as unused by CoreAnalytics";
    goto LABEL_8;
  }
LABEL_20:

  return v11;
}

- (id)queue
{
  queue = self->_queue;
  if (!queue)
  {
    HKCreateSerialDispatchQueue(self, @"HKAnalyticsEventSubmissionManager.queue");
    v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }

  return queue;
}

- (void)submitEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKAnalyticsEventSubmissionManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKAnalyticsEventSubmissionManager_submitEvent_completion___block_invoke;
  block[3] = &unk_1E58BBA78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__HKAnalyticsEventSubmissionManager_submitEvent_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v5 = 0;
  [v2 submitEvent:v3 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_analyticsEventConsumer, 0);
  objc_storeStrong(&self->_eventUsedProvider, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end