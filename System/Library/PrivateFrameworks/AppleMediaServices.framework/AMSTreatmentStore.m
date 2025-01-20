@interface AMSTreatmentStore
+ (BOOL)attemptConnectionInTests;
+ (id)defaultTreatmentStore;
+ (void)setAttemptConnectionInTests:(BOOL)a3;
- (AMSEngagement)engagement;
- (AMSTreatmentStore)init;
- (AMSTreatmentStore)initWithCachePolicy:(int64_t)a3;
- (id)_encodeExperimentData:(id)a3;
- (id)_treatmentOverridesForAreas:(id)a3;
- (id)_treatmentStoreService;
- (id)activeTreatmentsForAreas:(id)a3;
- (id)areasForNamespaces:(id)a3;
- (id)areasForTopics:(id)a3;
- (id)areasWithIDs:(id)a3;
- (id)encodeExperimentDataForTopic:(id)a3;
- (id)experimentDataForAreas:(id)a3;
- (id)synchronizeTreatments;
- (id)treatmentsForAreas:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)treatmentsPayloadForAreas:(id)a3;
- (id)treatmentsPayloadForTreatments:(id)a3;
- (int64_t)cachePolicy;
- (void)setEngagement:(id)a3;
@end

@implementation AMSTreatmentStore

uint64_t __50__AMSTreatmentStore_encodeExperimentDataForTopic___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _encodeExperimentData:a2];
}

- (id)_encodeExperimentData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    v17 = +[AMSPromise promiseWithResult:&stru_1EDCA7308];
    goto LABEL_22;
  }
  v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v6;
    __int16 v27 = 2114;
    v28 = v7;
    __int16 v29 = 2114;
    id v30 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Serializing experiment data: %{public}@", buf, 0x20u);
  }
  id v24 = 0;
  v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v24];
  id v9 = v24;
  uint64_t v10 = +[AMSLogConfig sharedTreatmentsConfig];
  v11 = (void *)v10;
  if (v8)
  {
    if (!v10)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v13;
      __int16 v27 = 2114;
      v28 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Serialized experiment data successfully", buf, 0x16u);
    }
    v15 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    if (![v15 length])
    {
      v22 = AMSError(0, @"Treatment Store Failure", @"Failed to encode experiment data", 0);
      v17 = +[AMSPromise promiseWithError:v22];

      goto LABEL_21;
    }
    uint64_t v16 = +[AMSPromise promiseWithResult:v15];
  }
  else
  {
    if (!v10)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v11 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      v20 = AMSLogKey();
      v21 = AMSLogableError(v9);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v19;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2114;
      id v30 = v21;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Experiment data serialization error: %{public}@", buf, 0x20u);
    }
    v15 = AMSError(3, @"Treatment Store Failure", @"Failed to encode experiment data due to a JSON serialization error", v9);
    uint64_t v16 = +[AMSPromise promiseWithError:v15];
  }
  v17 = (void *)v16;
LABEL_21:

LABEL_22:
  return v17;
}

void __36__AMSTreatmentStore_areasForTopics___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = AMSLogableError(v3);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch area identifiers (error: %{public}@)", (uint8_t *)&v9, 0x20u);
  }
}

id __50__AMSTreatmentStore_encodeExperimentDataForTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  v4 = [*(id *)(a1 + 40) experimentDataForAreas:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AMSTreatmentStore_encodeExperimentDataForTopic___block_invoke_2;
  v7[3] = &unk_1E559E528;
  v7[4] = *(void *)(a1 + 40);
  v5 = [v4 thenWithBlock:v7];

  return v5;
}

- (id)experimentDataForAreas:(id)a3
{
  id v4 = a3;
  v5 = [(AMSTreatmentStore *)self activeTreatmentsForAreas:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__AMSTreatmentStore_experimentDataForAreas___block_invoke;
  v9[3] = &unk_1E55A0FA0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 thenWithBlock:v9];

  return v7;
}

id __44__AMSTreatmentStore_experimentDataForAreas___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        __int16 v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v17);
        v22[0] = v10;
        v21[0] = @"areaId";
        v21[1] = @"bucket";
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v11, "participationType"));
        v22[1] = v12;
        v21[2] = @"treatmentId";
        __int16 v13 = [v11 identifier];
        v22[2] = v13;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  uint64_t v15 = +[AMSPromise promiseWithResult:v4];

  return v15;
}

uint64_t __47__AMSTreatmentStore_treatmentsPayloadForAreas___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) treatmentsPayloadForTreatments:a2];
}

- (id)encodeExperimentDataForTopic:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
    uint64_t v7 = [(AMSTreatmentStore *)self areasForTopics:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__AMSTreatmentStore_encodeExperimentDataForTopic___block_invoke;
    v10[3] = &unk_1E559F320;
    id v11 = v5;
    uint64_t v12 = self;
    uint64_t v8 = [v7 thenWithBlock:v10];
  }
  else
  {
    uint64_t v6 = AMSError(2, @"Failed to find treatment", @"No topic", 0);
    uint64_t v8 = +[AMSPromise promiseWithError:v6];
  }

  return v8;
}

void __36__AMSTreatmentStore_areasForTopics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 cachePolicy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke_3;
  v7[3] = &unk_1E55A0F78;
  id v8 = *(id *)(a1 + 48);
  [v5 areasForTopics:v3 cachePolicy:v6 completion:v7];
}

- (int64_t)cachePolicy
{
  return self->_cachePolicy;
}

void __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 cachePolicy];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_3;
  v9[3] = &unk_1E55A0D28;
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  [v5 treatmentsForAreas:v3 cachePolicy:v6 startDate:v7 endDate:v8 completion:v9];
}

- (id)treatmentsForAreas:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v38 = a4;
  id v37 = a5;
  uint64_t v9 = AMSSetLogKeyIfNeeded();
  id v10 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v55 = objc_opt_class();
    __int16 v56 = 2114;
    uint64_t v57 = v9;
    __int16 v58 = 2114;
    id v59 = v8;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching treatments (areas: %{public}@)", buf, 0x20u);
  }

  uint64_t v12 = [(AMSTreatmentStore *)self _treatmentOverridesForAreas:v8];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke;
  v52[3] = &unk_1E559E2C0;
  id v13 = v12;
  id v53 = v13;
  v14 = objc_msgSend(v8, "ams_filterUsingTest:", v52);
  uint64_t v15 = [v14 count];
  uint64_t v16 = +[AMSLogConfig sharedTreatmentsConfig];
  long long v17 = (void *)v16;
  v36 = v8;
  if (v15)
  {
    if (!v16)
    {
      long long v17 = +[AMSLogConfig sharedConfig];
    }
    long long v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v55 = v19;
      __int16 v56 = 2114;
      uint64_t v57 = v9;
      __int16 v58 = 2114;
      id v59 = v13;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Overridden treatments: %{public}@", buf, 0x20u);
    }

    long long v20 = +[AMSLogConfig sharedTreatmentsConfig];
    if (!v20)
    {
      long long v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v55 = v22;
      __int16 v56 = 2114;
      uint64_t v57 = v9;
      __int16 v58 = 2114;
      id v59 = v14;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching treatments (missing areas: %{public}@)", buf, 0x20u);
    }

    v23 = [[AMSMutablePromise alloc] initWithTimeout:3.0];
    uint64_t v24 = [(AMSTreatmentStore *)self _treatmentStoreService];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_70;
    v50[3] = &unk_1E559F028;
    v25 = v23;
    v51 = v25;
    [v24 addErrorBlock:v50];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_2;
    v43[3] = &unk_1E55A7300;
    id v44 = v14;
    v45 = self;
    uint64_t v26 = (void *)v9;
    __int16 v27 = v38;
    id v46 = v38;
    v28 = v37;
    id v47 = v37;
    __int16 v29 = v25;
    v48 = v29;
    id v49 = v13;
    [v24 addSuccessBlock:v43];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_4;
    v41[3] = &unk_1E559E7E8;
    v41[4] = self;
    id v30 = v26;
    id v42 = v30;
    [(AMSPromise *)v29 addErrorBlock:v41];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_71;
    v39[3] = &unk_1E55A72B0;
    v39[4] = self;
    id v40 = v30;
    [(AMSPromise *)v29 addSuccessBlock:v39];
    uint64_t v31 = v40;
    v32 = v29;
  }
  else
  {
    if (!v16)
    {
      long long v17 = +[AMSLogConfig sharedConfig];
    }
    v33 = [v17 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v55 = v34;
      __int16 v56 = 2114;
      uint64_t v57 = v9;
      __int16 v58 = 2114;
      id v59 = v13;
      _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] All treatments were overridden: %{public}@", buf, 0x20u);
    }

    v32 = +[AMSPromise promiseWithResult:v13];
    uint64_t v26 = (void *)v9;
    v28 = v37;
    __int16 v27 = v38;
  }

  return v32;
}

- (id)areasForTopics:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  uint64_t v6 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = objc_opt_class();
    __int16 v30 = 2114;
    uint64_t v31 = v5;
    __int16 v32 = 2114;
    id v33 = v4;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching area identifiers (topics: %{public}@)", buf, 0x20u);
  }

  id v8 = [[AMSMutablePromise alloc] initWithTimeout:3.0];
  uint64_t v9 = [(AMSTreatmentStore *)self _treatmentStoreService];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke;
  v26[3] = &unk_1E559F028;
  id v10 = v8;
  __int16 v27 = v10;
  [v9 addErrorBlock:v26];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke_2;
  void v22[3] = &unk_1E55A7288;
  id v23 = v4;
  uint64_t v24 = self;
  id v11 = v10;
  v25 = v11;
  id v12 = v4;
  [v9 addSuccessBlock:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke_4;
  v20[3] = &unk_1E559E7E8;
  v20[4] = self;
  id v13 = v5;
  id v21 = v13;
  [(AMSPromise *)v11 addErrorBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__AMSTreatmentStore_areasForTopics___block_invoke_61;
  v18[3] = &unk_1E55A72B0;
  v18[4] = self;
  id v19 = v13;
  id v14 = v13;
  [(AMSPromise *)v11 addSuccessBlock:v18];
  uint64_t v15 = v19;
  uint64_t v16 = v11;

  return v16;
}

- (id)_treatmentStoreService
{
  v2 = [(AMSTreatmentStore *)self engagement];
  uint64_t v3 = [v2 treatmentStoreService];

  return v3;
}

- (AMSEngagement)engagement
{
  return self->_engagement;
}

- (void).cxx_destruct
{
}

- (AMSTreatmentStore)initWithCachePolicy:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AMSTreatmentStore;
  id v4 = [(AMSTreatmentStore *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_cachePolicy = a3;
    uint64_t v6 = objc_alloc_init(AMSEngagement);
    engagement = v5->_engagement;
    v5->_engagement = v6;
  }
  return v5;
}

+ (id)defaultTreatmentStore
{
  if (_MergedGlobals_148 != -1) {
    dispatch_once(&_MergedGlobals_148, &__block_literal_global_130);
  }
  v2 = (void *)qword_1EB38DFE8;
  return v2;
}

- (id)areasForNamespaces:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  uint64_t v6 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = objc_opt_class();
    __int16 v30 = 2114;
    uint64_t v31 = v5;
    __int16 v32 = 2114;
    id v33 = v4;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching area identifiers (namespaces: %{public}@)", buf, 0x20u);
  }

  id v8 = [[AMSMutablePromise alloc] initWithTimeout:3.0];
  objc_super v9 = [(AMSTreatmentStore *)self _treatmentStoreService];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke;
  v26[3] = &unk_1E559F028;
  id v10 = v8;
  __int16 v27 = v10;
  [v9 addErrorBlock:v26];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke_2;
  void v22[3] = &unk_1E55A7288;
  id v23 = v4;
  uint64_t v24 = self;
  id v11 = v10;
  v25 = v11;
  id v12 = v4;
  [v9 addSuccessBlock:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke_4;
  v20[3] = &unk_1E559E7E8;
  v20[4] = self;
  id v13 = v5;
  id v21 = v13;
  [(AMSPromise *)v11 addErrorBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke_59;
  v18[3] = &unk_1E55A72B0;
  v18[4] = self;
  id v19 = v13;
  id v14 = v13;
  [(AMSPromise *)v11 addSuccessBlock:v18];
  uint64_t v15 = v19;
  uint64_t v16 = v11;

  return v16;
}

void __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = objc_msgSend(v10, "ams_dictionaryByAddingEntriesFromDictionary:", *(void *)(a1 + 40));
    [v6 finishWithResult:v7];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (v5)
    {
      [v8 finishWithError:v5];
    }
    else
    {
      objc_super v9 = AMSError(7, @"Treatment Store Failure", @"Areas not found", 0);
      [v8 finishWithError:v9];
    }
  }
}

void __36__AMSTreatmentStore_areasForTopics___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v9)
  {
    [*(id *)(a1 + 32) finishWithResult:v9];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = AMSError(7, @"Treatment Store Failure", @"Areas not found", 0);
      [v7 finishWithError:v8];
    }
  }
}

void __40__AMSTreatmentStore_areasForNamespaces___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 cachePolicy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AMSTreatmentStore_areasForNamespaces___block_invoke_3;
  v7[3] = &unk_1E55A0F78;
  id v8 = *(id *)(a1 + 48);
  [v5 areasForNamespaces:v3 cachePolicy:v6 completion:v7];
}

uint64_t __42__AMSTreatmentStore_defaultTreatmentStore__block_invoke()
{
  qword_1EB38DFE8 = objc_alloc_init(AMSTreatmentStore);
  return MEMORY[0x1F41817F8]();
}

- (AMSTreatmentStore)init
{
  return [(AMSTreatmentStore *)self initWithCachePolicy:1];
}

void __40__AMSTreatmentStore_areasForNamespaces___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v9)
  {
    [*(id *)(a1 + 32) finishWithResult:v9];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = AMSError(7, @"Treatment Store Failure", @"Areas not found", 0);
      [v7 finishWithError:v8];
    }
  }
}

- (id)treatmentsPayloadForAreas:(id)a3
{
  id v4 = [(AMSTreatmentStore *)self activeTreatmentsForAreas:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AMSTreatmentStore_treatmentsPayloadForAreas___block_invoke;
  v7[3] = &unk_1E55A0FA0;
  void v7[4] = self;
  id v5 = [v4 thenWithBlock:v7];

  return v5;
}

- (id)_treatmentOverridesForAreas:(id)a3
{
  id v3 = a3;
  id v4 = +[AMSDefaults treatmentOverrides];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__AMSTreatmentStore__treatmentOverridesForAreas___block_invoke;
  v8[3] = &unk_1E55A7220;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "ams_mapWithTransform:", v8);

  return v6;
}

AMSPair *__49__AMSTreatmentStore__treatmentOverridesForAreas___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    uint64_t v7 = [AMSTreatment alloc];
    id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
    id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v10 = [(AMSTreatment *)v7 initWithEndDate:v8 identifier:v6 startDate:v9];

    [(AMSTreatment *)v10 setParticipationType:-1];
    id v11 = [AMSPair alloc];
    id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    id v13 = [(AMSPair *)v11 initWithFirst:v5 second:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)activeTreatmentsForAreas:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  uint64_t v7 = [(AMSTreatmentStore *)self treatmentsForAreas:v5 startDate:v6 endDate:v6];

  id v8 = [v7 thenWithBlock:&__block_literal_global_48];

  return v8;
}

id __46__AMSTreatmentStore_activeTreatmentsForAreas___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ams_compactMapValues:", &__block_literal_global_51_1);
  id v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

uint64_t __46__AMSTreatmentStore_activeTreatmentsForAreas___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 anyObject];
}

uint64_t __40__AMSTreatmentStore_areasForNamespaces___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __40__AMSTreatmentStore_areasForNamespaces___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = AMSLogableError(v3);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch area identifiers (error: %{public}@)", (uint8_t *)&v9, 0x20u);
  }
}

void __40__AMSTreatmentStore_areasForNamespaces___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetched area identifiers: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __36__AMSTreatmentStore_areasForTopics___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __36__AMSTreatmentStore_areasForTopics___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetched area identifiers: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)areasWithIDs:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  uint64_t v6 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = objc_opt_class();
    __int16 v30 = 2114;
    uint64_t v31 = v5;
    __int16 v32 = 2114;
    id v33 = v4;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching areas (identifiers: %{public}@)", buf, 0x20u);
  }

  int v8 = [[AMSMutablePromise alloc] initWithTimeout:3.0];
  uint64_t v9 = [(AMSTreatmentStore *)self _treatmentStoreService];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __34__AMSTreatmentStore_areasWithIDs___block_invoke;
  v26[3] = &unk_1E559F028;
  __int16 v10 = v8;
  __int16 v27 = v10;
  [v9 addErrorBlock:v26];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __34__AMSTreatmentStore_areasWithIDs___block_invoke_2;
  void v22[3] = &unk_1E55A7288;
  id v23 = v4;
  uint64_t v24 = self;
  uint64_t v11 = v10;
  v25 = v11;
  id v12 = v4;
  [v9 addSuccessBlock:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __34__AMSTreatmentStore_areasWithIDs___block_invoke_4;
  v20[3] = &unk_1E559E7E8;
  v20[4] = self;
  id v13 = v5;
  id v21 = v13;
  [(AMSPromise *)v11 addErrorBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __34__AMSTreatmentStore_areasWithIDs___block_invoke_62;
  v18[3] = &unk_1E55A72B0;
  v18[4] = self;
  id v19 = v13;
  id v14 = v13;
  [(AMSPromise *)v11 addSuccessBlock:v18];
  uint64_t v15 = v19;
  uint64_t v16 = v11;

  return v16;
}

uint64_t __34__AMSTreatmentStore_areasWithIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __34__AMSTreatmentStore_areasWithIDs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 cachePolicy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__AMSTreatmentStore_areasWithIDs___block_invoke_3;
  v7[3] = &unk_1E55A0F78;
  id v8 = *(id *)(a1 + 48);
  [v5 areasWithIDs:v3 cachePolicy:v6 completion:v7];
}

void __34__AMSTreatmentStore_areasWithIDs___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v9)
  {
    [*(id *)(a1 + 32) finishWithResult:v9];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 finishWithError:v5];
    }
    else
    {
      id v8 = AMSError(7, @"Treatment Store Failure", @"Areas not found", 0);
      [v7 finishWithError:v8];
    }
  }
}

void __34__AMSTreatmentStore_areasWithIDs___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = AMSLogableError(v3);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch areas (error: %{public}@)", (uint8_t *)&v9, 0x20u);
  }
}

void __34__AMSTreatmentStore_areasWithIDs___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [v3 allValues];
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetched areas: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)synchronizeTreatments
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = AMSSetLogKeyIfNeeded();
  id v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Synchronizing treatments", buf, 0x16u);
  }

  uint64_t v6 = [(AMSTreatmentStore *)self _treatmentStoreService];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__AMSTreatmentStore_synchronizeTreatments__block_invoke;
  v17[3] = &unk_1E55A72D8;
  v17[4] = self;
  uint64_t v7 = [v6 thenWithBlock:v17];
  id v8 = [v7 promiseWithTimeout:3.0];
  int v9 = [v8 binaryPromiseAdapter];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__AMSTreatmentStore_synchronizeTreatments__block_invoke_2;
  v15[3] = &unk_1E559E7E8;
  v15[4] = self;
  id v10 = v3;
  id v16 = v10;
  [v9 addErrorBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__AMSTreatmentStore_synchronizeTreatments__block_invoke_68;
  v13[3] = &unk_1E559F1E0;
  v13[4] = self;
  id v14 = v10;
  id v11 = v10;
  [v9 addSuccessBlock:v13];

  return v9;
}

id __42__AMSTreatmentStore_synchronizeTreatments__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSBinaryPromise);
  uint64_t v5 = [*(id *)(a1 + 32) cachePolicy];
  uint64_t v6 = [(AMSBinaryPromise *)v4 completionHandlerAdapter];
  [v3 synchronizeTreatmentsWithCachePolicy:v5 completion:v6];

  uint64_t v7 = [(AMSBinaryPromise *)v4 promiseAdapter];

  return v7;
}

void __42__AMSTreatmentStore_synchronizeTreatments__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = AMSLogableError(v3);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to synchronize treatments (error: %{public}@)", (uint8_t *)&v9, 0x20u);
  }
}

void __42__AMSTreatmentStore_synchronizeTreatments__block_invoke_68(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Synchronized treatments successfully", (uint8_t *)&v6, 0x16u);
  }
}

BOOL __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_70(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    __int16 v8 = AMSLogableError(v3);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch treatments (error: %{public}@)", (uint8_t *)&v9, 0x20u);
  }
}

void __58__AMSTreatmentStore_treatmentsForAreas_startDate_endDate___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedTreatmentsConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetched treatments: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)treatmentsPayloadForTreatments:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  __int16 v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count") + 1);
  [v20 addObject:@"1"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKey:v10];
        __int16 v12 = [v11 identifier];
        if (v12)
        {
          v26[0] = v10;
          id v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v11, "participationType"));
          uint64_t v14 = [v13 description];
          v26[1] = v14;
          v26[2] = v12;
          uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
          id v16 = [v15 componentsJoinedByString:@"+"];

          if (v16) {
            [v20 addObject:v16];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  if ([v20 count] == 1)
  {
    long long v17 = &stru_1EDCA7308;
  }
  else
  {
    long long v17 = [v20 componentsJoinedByString:@"#"];
  }
  long long v18 = +[AMSPromise promiseWithResult:v17];

  return v18;
}

+ (BOOL)attemptConnectionInTests
{
  return _attemptConnectionInTests;
}

+ (void)setAttemptConnectionInTests:(BOOL)a3
{
  _attemptConnectionInTests = a3;
}

- (void)setEngagement:(id)a3
{
}

@end