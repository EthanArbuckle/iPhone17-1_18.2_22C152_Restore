@interface AMSURLMetricsLoadURLHandler
- (AMSURLMetricsLoadURLHandler)init;
- (AMSURLMetricsLoadURLHandler)initWithMetrics:(Class)a3;
- (Class)metricsClass;
- (id)_reportMetricsForContext:(id)a3;
- (void)_enqueueLoadURLEvent:(id)a3 forContext:(id)a4;
- (void)reportMetricsForContext:(id)a3;
@end

@implementation AMSURLMetricsLoadURLHandler

- (AMSURLMetricsLoadURLHandler)init
{
  uint64_t v3 = objc_opt_class();
  return [(AMSURLMetricsLoadURLHandler *)self initWithMetrics:v3];
}

- (void).cxx_destruct
{
}

id __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPreventSampling:1];
  v4 = [*(id *)(a1 + 32) properties];
  v5 = [v4 additionalMetrics];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke_2;
  v9[3] = &unk_1E559F9D8;
  id v10 = v3;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  [*(id *)(a1 + 40) _enqueueLoadURLEvent:v6 forContext:*(void *)(a1 + 32)];
  v7 = +[AMSPromise promiseWithResult:*(void *)(a1 + 48)];

  return v7;
}

id __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 BOOLValue];
  uint64_t v5 = +[AMSLogConfig sharedURLLoadingConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      v9 = *(void **)(a1 + 40);
      id v29 = v8;
      id v10 = [v9 properties];
      v11 = [v10 logUUID];
      v12 = [*(id *)(a1 + 40) task];
      v13 = [v12 originalRequest];
      v14 = AMSLogableURLRequest((uint64_t)v13);
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      __int16 v36 = 2114;
      v37 = v11;
      __int16 v38 = 2114;
      v39 = v14;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording LoadURL Metrics for URL request: %{public}@", buf, 0x20u);
    }
    v15 = +[AMSMetricsLoadURLEvent loadURLEventPromiseWithContext:*(void *)(a1 + 40)];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke_5;
    v30[3] = &unk_1E55A7528;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    id v31 = v16;
    uint64_t v32 = v17;
    id v33 = v3;
    v18 = [v15 thenWithBlock:v30];
  }
  else
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v6 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = objc_opt_class();
      v21 = *(void **)(a1 + 40);
      id v22 = v20;
      v23 = [v21 properties];
      v24 = [v23 logUUID];
      v25 = [*(id *)(a1 + 40) task];
      v26 = [v25 originalRequest];
      v27 = AMSLogableURLRequest((uint64_t)v26);
      *(_DWORD *)buf = 138543874;
      v35 = v20;
      __int16 v36 = 2114;
      v37 = v24;
      __int16 v38 = 2114;
      v39 = v27;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Skip LoadURL Metrics due to sampling for URL request: %{public}@.", buf, 0x20u);
    }
    v18 = +[AMSPromise promiseWithResult:v3];
  }

  return v18;
}

- (void)reportMetricsForContext:(id)a3
{
  id v3 = [(AMSURLMetricsLoadURLHandler *)self _reportMetricsForContext:a3];
}

- (id)_reportMetricsForContext:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 properties];
  int v6 = [v5 disableLoadURLMetrics];

  if (v6)
  {
    v7 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      v11 = [v4 properties];
      v12 = [v11 logUUID];
      v13 = [v4 task];
      v14 = [v13 originalRequest];
      v15 = AMSLogableURLRequest((uint64_t)v14);
      *(_DWORD *)buf = 138543874;
      v27 = v9;
      __int16 v28 = 2114;
      id v29 = v12;
      __int16 v30 = 2114;
      id v31 = v15;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skip LoadURL Metrics due to client disabling for URL request: %{public}@.", buf, 0x20u);
    }
    id v16 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    uint64_t v17 = +[AMSMetricsLoadURLEvent shouldCollectMetricsPromiseForContext:v4];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke;
    v23 = &unk_1E559E578;
    v24 = self;
    id v25 = v4;
    v18 = [v17 thenWithBlock:&v20];
    id v16 = objc_msgSend(v18, "binaryPromiseAdapter", v20, v21, v22, v23, v24);
  }
  return v16;
}

- (void)_enqueueLoadURLEvent:(id)a3 forContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(AMSURLMetricsLoadURLHandler *)self metricsClass];
  v9 = [v6 bag];

  id v10 = [(objc_class *)v8 internalInstanceUsingBag:v9];

  [v10 enqueueEvent:v7];
}

- (Class)metricsClass
{
  return self->_metricsClass;
}

- (AMSURLMetricsLoadURLHandler)initWithMetrics:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSURLMetricsLoadURLHandler;
  id v4 = [(AMSURLMetricsLoadURLHandler *)&v7 init];
  uint64_t v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_metricsClass, a3);
  }
  return v5;
}

uint64_t __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setProperty:a3 forBodyKey:a2];
}

@end