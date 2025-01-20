@interface AMSMediaInvokeAuthenticationCoordinator
+ (AMSMediaInvokeAuthenticationCoordinator)sharedInstance;
- (AMSMediaInvokeAuthenticationCoordinator)init;
- (AMSPromise)inflightAuthPromise;
- (NSMutableArray)invokeAuthQueue;
- (id)addToQueueAndPerformAuthFromResponseIfNeeded:(id)a3 taskInfo:(id)a4;
- (os_unfair_lock_s)queueLock;
- (void)_finishQueueWithAuthResult:(id)a3 queuedObjects:(id)a4;
- (void)setInflightAuthPromise:(id)a3;
- (void)updateQueueIfNeeded;
@end

@implementation AMSMediaInvokeAuthenticationCoordinator

- (AMSMediaInvokeAuthenticationCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSMediaInvokeAuthenticationCoordinator;
  v2 = [(AMSMediaInvokeAuthenticationCoordinator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    invokeAuthQueue = v2->_invokeAuthQueue;
    v2->_invokeAuthQueue = v3;

    v2->_queueLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (AMSMediaInvokeAuthenticationCoordinator)sharedInstance
{
  if (_MergedGlobals_120 != -1) {
    dispatch_once(&_MergedGlobals_120, &__block_literal_global_75);
  }
  v2 = (void *)qword_1EB38DC98;
  return (AMSMediaInvokeAuthenticationCoordinator *)v2;
}

uint64_t __57__AMSMediaInvokeAuthenticationCoordinator_sharedInstance__block_invoke()
{
  qword_1EB38DC98 = objc_alloc_init(AMSMediaInvokeAuthenticationCoordinator);
  return MEMORY[0x1F41817F8]();
}

- (id)addToQueueAndPerformAuthFromResponseIfNeeded:(id)a3 taskInfo:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  v9 = objc_alloc_init(AMSMediaInvokeAuthenticationQueuedObject);
  [(AMSMediaInvokeAuthenticationQueuedObject *)v9 setResponse:v6];
  [(AMSMediaInvokeAuthenticationQueuedObject *)v9 setTaskInfo:v7];

  [(AMSMediaInvokeAuthenticationQueuedObject *)v9 setPendingPromise:v8];
  BOOL v10 = objc_msgSend(v6, "ams_statusCode") >= 200 && objc_msgSend(v6, "ams_statusCode") < 400;
  [(AMSMediaInvokeAuthenticationQueuedObject *)v9 setIgnoringResult:v10];
  os_unfair_lock_lock(&self->_queueLock);
  v11 = [(AMSMediaInvokeAuthenticationCoordinator *)self invokeAuthQueue];
  [v11 addObject:v9];

  v12 = +[AMSLogConfig sharedAccountsConfig];
  if (!v12)
  {
    v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    id v25 = v14;
    id v26 = v6;
    v15 = AMSSetLogKeyIfNeeded();
    v16 = [(AMSMediaInvokeAuthenticationCoordinator *)self invokeAuthQueue];
    *(_DWORD *)buf = 138544130;
    v28 = v14;
    __int16 v29 = 2114;
    v30 = v15;
    __int16 v31 = 2048;
    uint64_t v32 = [v16 count];
    __int16 v33 = 1024;
    BOOL v34 = [(AMSMediaInvokeAuthenticationQueuedObject *)v9 ignoringResult];
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Queued up Invoke Media API Authentication. Current queue count: %lu. Will ignore result: %d", buf, 0x26u);

    id v6 = v26;
  }

  os_unfair_lock_unlock(&self->_queueLock);
  [(AMSMediaInvokeAuthenticationCoordinator *)self updateQueueIfNeeded];
  if ([(AMSMediaInvokeAuthenticationQueuedObject *)v9 ignoringResult])
  {
    v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = objc_msgSend(v17, "OSLogObject", v25);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_opt_class();
      id v20 = v19;
      v21 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      __int16 v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Successful response, returned empty promise for Invoke Media API Authentication allowing handling of original response to continue while we deal with the authentication separately.", buf, 0x16u);
    }
    v22 = +[AMSOptional optionalWithNil];
    v23 = +[AMSPromise promiseWithResult:v22];
  }
  else
  {
    v23 = [(AMSMediaInvokeAuthenticationQueuedObject *)v9 pendingPromise];
  }

  return v23;
}

- (void)updateQueueIfNeeded
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v4 = [(AMSMediaInvokeAuthenticationCoordinator *)self inflightAuthPromise];
  if (v4)
  {

LABEL_3:
    os_unfair_lock_unlock(p_queueLock);
    id v5 = 0;
    id v6 = 0;
    goto LABEL_4;
  }
  id v7 = [(AMSMediaInvokeAuthenticationCoordinator *)self invokeAuthQueue];
  uint64_t v8 = [v7 count];

  if (!v8) {
    goto LABEL_3;
  }
  v9 = [(AMSMediaInvokeAuthenticationCoordinator *)self invokeAuthQueue];
  id v5 = [v9 firstObject];

  id v6 = objc_opt_new();
  [(AMSMediaInvokeAuthenticationCoordinator *)self setInflightAuthPromise:v6];
  os_unfair_lock_unlock(p_queueLock);
  if (v6)
  {
    BOOL v10 = [v5 response];
    v11 = [v5 taskInfo];
    v12 = +[AMSMediaInvokeAuthenticationHandler performAuthFromResponse:v10 taskInfo:v11];
    [v6 finishWithPromise:v12];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__AMSMediaInvokeAuthenticationCoordinator_updateQueueIfNeeded__block_invoke;
    v13[3] = &unk_1E55A3AB0;
    v13[4] = self;
    id v5 = v5;
    id v14 = v5;
    [v6 addFinishBlock:v13];
  }
LABEL_4:
}

void __62__AMSMediaInvokeAuthenticationCoordinator_updateQueueIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = AMSSetLogKeyIfNeeded();
    int v20 = 138543874;
    v21 = v9;
    __int16 v22 = 2114;
    v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v6;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoke Media API Authentication finished with error: %@", (uint8_t *)&v20, 0x20u);
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  v12 = [v5 value];

  if (v12)
  {
    id v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v13 = objc_opt_class();
    id v10 = v13;
    v11 = AMSSetLogKeyIfNeeded();
    id v14 = [v5 value];
    int v20 = 138543874;
    v21 = v13;
    __int16 v22 = 2114;
    v23 = v11;
    __int16 v24 = 2048;
    uint64_t v25 = [v14 actionType];
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoke Media API Authentication finished with result: %ld", (uint8_t *)&v20, 0x20u);

    goto LABEL_11;
  }
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(a1 + 32) setInflightAuthPromise:0];
  v15 = [*(id *)(a1 + 32) invokeAuthQueue];
  [v15 removeObjectAtIndex:0];

  v16 = [*(id *)(a1 + 32) invokeAuthQueue];
  v17 = (void *)[v16 copy];

  v18 = [*(id *)(a1 + 32) invokeAuthQueue];
  [v18 removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(a1 + 32) _finishQueueWithAuthResult:v5 queuedObjects:v17];
  v19 = [*(id *)(a1 + 40) pendingPromise];
  [v19 finishWithResult:v5];

  [*(id *)(a1 + 32) updateQueueIfNeeded];
}

- (void)_finishQueueWithAuthResult:(id)a3 queuedObjects:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v41;
    *(void *)&long long v8 = 138543618;
    long long v36 = v8;
    uint64_t v37 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      uint64_t v39 = v9;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "ignoringResult", v36) & 1) == 0)
        {
          uint64_t v13 = [v5 value];
          if (v13
            && (id v14 = (void *)v13,
                [v5 value],
                v15 = objc_claimAutoreleasedReturnValue(),
                uint64_t v16 = [v15 actionType],
                v15,
                v14,
                v16 == 3))
          {
            v17 = +[AMSLogConfig sharedAccountsConfig];
            if (!v17)
            {
              v17 = +[AMSLogConfig sharedConfig];
            }
            v18 = [v17 OSLogObject];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = objc_opt_class();
              id v20 = v19;
              v21 = AMSSetLogKeyIfNeeded();
              *(_DWORD *)buf = v36;
              v45 = v19;
              __int16 v46 = 2114;
              v47 = v21;
              _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoke Media API Previous authentication finished with cancel, ignoring remaining queued up authentication requests.", buf, 0x16u);

              uint64_t v10 = v37;
            }

            __int16 v22 = [v12 pendingPromise];
            [v22 finishWithResult:v5];
          }
          else
          {
            v23 = +[AMSLogConfig sharedAccountsConfig];
            if (!v23)
            {
              v23 = +[AMSLogConfig sharedConfig];
            }
            __int16 v24 = [v23 OSLogObject];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = objc_opt_class();
              id v38 = v25;
              uint64_t v26 = AMSSetLogKeyIfNeeded();
              [v12 response];
              id v27 = v5;
              __int16 v29 = v28 = v6;
              v30 = [v29 URL];
              *(_DWORD *)buf = 138543874;
              v45 = v25;
              __int16 v46 = 2114;
              v47 = v26;
              __int16 v48 = 2112;
              v49 = v30;
              _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrying queued up request with Invoke Media API Authentication for URL: %@", buf, 0x20u);

              id v6 = v28;
              id v5 = v27;

              uint64_t v10 = v37;
            }

            __int16 v22 = +[AMSURLAction retryAction];
            [v22 setRetryIdentifier:0x1EDCAA288];
            [v22 setReason:@"authentication"];
            __int16 v31 = [v5 value];

            if (v31)
            {
              uint64_t v32 = [v5 value];
              __int16 v33 = [v32 authenticateResult];
              [v22 setAuthenticateResult:v33];
            }
            BOOL v34 = [v12 pendingPromise];
            uint64_t v35 = +[AMSOptional optionalWithValue:v22];
            [v34 finishWithResult:v35];

            uint64_t v9 = v39;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v9);
  }
}

- (os_unfair_lock_s)queueLock
{
  return self->_queueLock;
}

- (NSMutableArray)invokeAuthQueue
{
  return self->_invokeAuthQueue;
}

- (AMSPromise)inflightAuthPromise
{
  return self->_inflightAuthPromise;
}

- (void)setInflightAuthPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inflightAuthPromise, 0);
  objc_storeStrong((id *)&self->_invokeAuthQueue, 0);
}

@end