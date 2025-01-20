@interface AMSSharedStoreReview
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)_isGroupedLogicSupported;
+ (BOOL)_isRepeatedPromptsSupported;
+ (BOOL)_shouldLogNewSessionWithLastLoggedTimeStamp:(id)a3 currentTime:(id)a4 sessionInterval:(int64_t)a5;
+ (BOOL)_shouldPromptReviewForStoreReviewMetrics:(id)a3 currentTime:(id)a4 sessionCount:(int64_t)a5 promptInterval:(int64_t)a6;
+ (BOOL)_shouldPromptReviewForStoreReviewMetrics:(id)a3 sessionCount:(int64_t)a4;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_storeReviewMetrics;
+ (id)createBagForSubProfile;
+ (void)_applicationDidForegroundWithCurrentTime:(id)a3 storeReviewMetrics:(id)a4 sessionInterval:(int64_t)a5;
+ (void)_logDidAttemptPromptReviewWithStoreReviewMetrics:(id)a3 currentTime:(id)a4;
+ (void)_logNewSessionWithStoreReviewMetrics:(id)a3 currentTime:(id)a4;
+ (void)_persistStoreReviewMetrics:(id)a3;
- (AMSBagProtocol)bag;
- (AMSSharedStoreReview)initWithBag:(id)a3;
- (AMSStoreReviewGatingController)storeReviewGatingController;
- (BOOL)isEnabled;
- (BOOL)shouldAttemptPromptReview;
- (OS_dispatch_queue)sharedStoreReviewQueue;
- (id)isReviewEnabled;
- (id)shouldAttemptReview;
- (void)applicationDidForeground;
- (void)didAttemptPromptReview;
- (void)setBag:(id)a3;
- (void)setStoreReviewGatingController:(id)a3;
@end

@implementation AMSSharedStoreReview

- (AMSSharedStoreReview)initWithBag:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSSharedStoreReview;
  v6 = [(AMSSharedStoreReview *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    if (+[AMSSharedStoreReview _isGroupedLogicSupported])
    {
      v8 = [[AMSStoreReviewGatingController alloc] initWithBag:v5];
      p_super = &v7->_storeReviewGatingController->super;
      v7->_storeReviewGatingController = v8;
    }
    else
    {
      p_super = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.AppleMediaServices.sharedstorereview", p_super);
      sharedStoreReviewQueue = v7->_sharedStoreReviewQueue;
      v7->_sharedStoreReviewQueue = (OS_dispatch_queue *)v10;
    }
  }

  return v7;
}

- (void)applicationDidForeground
{
  if (+[AMSSharedStoreReview _isGroupedLogicSupported])
  {
    storeReviewGatingController = self->_storeReviewGatingController;
    [(AMSStoreReviewGatingController *)storeReviewGatingController didEnterForegroundWithCompletionHandler:&__block_literal_global_118];
  }
  else
  {
    v4 = [(AMSSharedStoreReview *)self sharedStoreReviewQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AMSSharedStoreReview_applicationDidForeground__block_invoke_2;
    block[3] = &unk_1E559EA90;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

+ (BOOL)_isGroupedLogicSupported
{
  return _os_feature_enabled_impl();
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagKeySet];
  v3 = [(id)objc_opt_class() bagSubProfile];
  v4 = [(id)objc_opt_class() bagSubProfileVersion];
  +[AMSBagKeySet registerBagKeySet:v2 forProfile:v3 profileVersion:v4];

  id v5 = [(id)objc_opt_class() bagSubProfile];
  v6 = [(id)objc_opt_class() bagSubProfileVersion];
  v7 = +[AMSBag bagForProfile:v5 profileVersion:v6];

  return v7;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSSharedStoreReview";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (BOOL)isEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(AMSSharedStoreReview *)self bag];
  v3 = [v2 BOOLForKey:@"shared-store-review-enabled"];
  id v13 = 0;
  v4 = [v3 valueWithError:&v13];
  id v5 = v13;
  char v6 = [v4 BOOLValue];

  if (v5)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      dispatch_queue_t v10 = AMSSetLogKeyIfNeeded();
      v11 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = v10;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetching enabled bag value error: %{public}@", buf, 0x20u);
    }
    char v6 = 0;
  }

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_storeReviewGatingController, 0);
  objc_storeStrong((id *)&self->_sharedStoreReviewQueue, 0);
}

- (id)isReviewEnabled
{
  v2 = [(AMSSharedStoreReview *)self bag];
  v3 = [v2 BOOLForKey:@"shared-store-review-enabled"];
  v4 = [v3 valuePromise];

  return v4;
}

void __48__AMSSharedStoreReview_applicationDidForeground__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isEnabled])
  {
    v2 = [*(id *)(a1 + 32) bag];
    v3 = [v2 integerForKey:@"shared-store-review-session-interval"];
    id v12 = 0;
    v4 = [v3 valueWithError:&v12];
    id v5 = v12;

    if (v5)
    {
      char v6 = +[AMSLogConfig sharedConfig];
      if (!v6)
      {
        char v6 = +[AMSLogConfig sharedConfig];
      }
      v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = AMSSetLogKeyIfNeeded();
        dispatch_queue_t v10 = AMSLogableError(v5);
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = v8;
        __int16 v15 = 2114;
        __int16 v16 = v9;
        __int16 v17 = 2114;
        __int16 v18 = v10;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Session interval bag value error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      char v6 = +[AMSSharedStoreReview _storeReviewMetrics];
      v7 = [MEMORY[0x1E4F1C9C8] date];
      +[AMSSharedStoreReview _applicationDidForegroundWithCurrentTime:v7 storeReviewMetrics:v6 sessionInterval:[v4 integerValue]];
    }

    goto LABEL_13;
  }
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v5 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    char v6 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    __int16 v16 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping tracking for foreground as shared store review is disabled.", buf, 0x16u);
LABEL_13:
  }
}

- (void)didAttemptPromptReview
{
  if (+[AMSSharedStoreReview _isGroupedLogicSupported])
  {
    storeReviewGatingController = self->_storeReviewGatingController;
    [(AMSStoreReviewGatingController *)storeReviewGatingController didPromptWithCompletionHandler:&__block_literal_global_19_2];
  }
  else
  {
    v4 = [(AMSSharedStoreReview *)self sharedStoreReviewQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AMSSharedStoreReview_didAttemptPromptReview__block_invoke_2;
    block[3] = &unk_1E559EA90;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

void __46__AMSSharedStoreReview_didAttemptPromptReview__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isEnabled])
  {
    id v6 = +[AMSSharedStoreReview _storeReviewMetrics];
    v1 = [MEMORY[0x1E4F1C9C8] date];
    +[AMSSharedStoreReview _logDidAttemptPromptReviewWithStoreReviewMetrics:v6 currentTime:v1];
  }
  else
  {
    v2 = +[AMSLogConfig sharedConfig];
    if (!v2)
    {
      v2 = +[AMSLogConfig sharedConfig];
    }
    v3 = [v2 OSLogObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_opt_class();
      id v5 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      uint64_t v8 = v4;
      __int16 v9 = 2114;
      dispatch_queue_t v10 = v5;
      _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping tracking for did attempt review as shared store review is disabled.", buf, 0x16u);
    }
  }
}

- (id)shouldAttemptReview
{
  if (+[AMSSharedStoreReview _isGroupedLogicSupported])
  {
    v3 = objc_alloc_init(AMSMutablePromise);
    storeReviewGatingController = self->_storeReviewGatingController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke;
    v9[3] = &unk_1E55A6450;
    id v5 = v3;
    dispatch_queue_t v10 = v5;
    [(AMSStoreReviewGatingController *)storeReviewGatingController canPromptWithCompletionHandler:v9];
    id v6 = v10;
  }
  else
  {
    id v6 = [(AMSSharedStoreReview *)self isReviewEnabled];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_2;
    v8[3] = &unk_1E55A6478;
    v8[4] = self;
    id v5 = [v6 continueWithBlock:v8];
  }

  return v5;
}

void __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
  [v2 finishWithResult:v3];
}

id __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      __int16 v18 = v8;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping checking for should attempt review as shared store review is disabled.", buf, 0x16u);
    }
    __int16 v9 = +[AMSPromise promiseWithError:v4];
  }
  else
  {
    dispatch_queue_t v10 = [*(id *)(a1 + 32) bag];
    uint64_t v11 = [v10 integerForKey:@"shared-store-review-session-count"];
    id v12 = [v11 valuePromise];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_24;
    v14[3] = &unk_1E55A6478;
    v14[4] = *(void *)(a1 + 32);
    __int16 v9 = [v12 continueWithBlock:v14];
  }
  return v9;
}

id __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      dispatch_queue_t v10 = AMSSetLogKeyIfNeeded();
      uint64_t v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      v25 = v10;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Session count bag value error: %{public}@", buf, 0x20u);
    }
    id v12 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    id v13 = +[AMSSharedStoreReview _storeReviewMetrics];
    if (+[AMSSharedStoreReview _isRepeatedPromptsSupported])
    {
      uint64_t v14 = [*(id *)(a1 + 32) bag];
      __int16 v15 = [v14 integerForKey:@"shared-store-review-prompt-interval"];
      uint64_t v16 = [v15 valuePromise];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_25;
      v19[3] = &unk_1E55A2D40;
      v19[4] = *(void *)(a1 + 32);
      id v20 = v13;
      id v21 = v5;
      id v12 = [v16 continueWithBlock:v19];
    }
    else
    {
      BOOL v17 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:sessionCount:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:sessionCount:", v13, [v5 integerValue]);
      uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithBool:v17];
      id v12 = +[AMSPromise promiseWithResult:v16];
    }
  }
  return v12;
}

id __43__AMSSharedStoreReview_shouldAttemptReview__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      dispatch_queue_t v10 = AMSSetLogKeyIfNeeded();
      uint64_t v11 = AMSLogableError(v6);
      int v20 = 138543874;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Prompt interval bag value fetch failed: %{public}@, falling back to behaviour without repeated prompt support", (uint8_t *)&v20, 0x20u);
    }
    BOOL v12 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:sessionCount:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:sessionCount:", *(void *)(a1 + 40), [*(id *)(a1 + 48) integerValue]);
    id v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v12];
    uint64_t v14 = +[AMSPromise promiseWithResult:v13];
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v17 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:currentTime:sessionCount:promptInterval:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:currentTime:sessionCount:promptInterval:", v15, v16, [*(id *)(a1 + 48) integerValue], objc_msgSend(v5, "integerValue"));

    __int16 v18 = [MEMORY[0x1E4F28ED0] numberWithBool:v17];
    uint64_t v14 = +[AMSPromise promiseWithResult:v18];
  }
  return v14;
}

- (BOOL)shouldAttemptPromptReview
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (+[AMSSharedStoreReview _isGroupedLogicSupported])
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    storeReviewGatingController = self->_storeReviewGatingController;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __49__AMSSharedStoreReview_shouldAttemptPromptReview__block_invoke;
    v30[3] = &unk_1E55A64A0;
    v32 = buf;
    id v5 = v3;
    v31 = v5;
    [(AMSStoreReviewGatingController *)storeReviewGatingController canPromptWithCompletionHandler:v30];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v6 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else if ([(AMSSharedStoreReview *)self isEnabled])
  {
    uint64_t v7 = [(AMSSharedStoreReview *)self bag];
    uint64_t v8 = [v7 integerForKey:@"shared-store-review-session-count"];
    id v29 = 0;
    uint64_t v9 = [v8 valueWithError:&v29];
    id v5 = v29;

    if (v5)
    {
      dispatch_queue_t v10 = +[AMSLogConfig sharedConfig];
      if (!v10)
      {
        dispatch_queue_t v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class();
        id v13 = AMSSetLogKeyIfNeeded();
        uint64_t v14 = AMSLogableError(v5);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2114;
        v34 = v14;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Session count bag value error: %{public}@", buf, 0x20u);
      }
      BOOL v6 = 0;
    }
    else
    {
      dispatch_queue_t v10 = +[AMSSharedStoreReview _storeReviewMetrics];
      if (+[AMSSharedStoreReview _isRepeatedPromptsSupported])
      {
        __int16 v18 = [(AMSSharedStoreReview *)self bag];
        uint64_t v19 = [v18 integerForKey:@"shared-store-review-prompt-interval"];
        id v28 = 0;
        int v20 = [v19 valueWithError:&v28];
        id v5 = v28;

        if (v5)
        {
          uint64_t v21 = +[AMSLogConfig sharedConfig];
          if (!v21)
          {
            uint64_t v21 = +[AMSLogConfig sharedConfig];
          }
          __int16 v22 = [v21 OSLogObject];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = objc_opt_class();
            __int16 v24 = AMSSetLogKeyIfNeeded();
            v25 = AMSLogableError(v5);
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v23;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2114;
            v34 = v25;
            _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Prompt interval bag value fetch failed: %{public}@, falling back to behaviour without repeated prompt support", buf, 0x20u);
          }
          BOOL v6 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:sessionCount:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:sessionCount:", v10, [v9 integerValue]);
        }
        else
        {
          uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
          BOOL v6 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:currentTime:sessionCount:promptInterval:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:currentTime:sessionCount:promptInterval:", v10, v26, [v9 integerValue], objc_msgSend(v20, "integerValue"));
        }
      }
      else
      {
        BOOL v6 = +[AMSSharedStoreReview _shouldPromptReviewForStoreReviewMetrics:sessionCount:](AMSSharedStoreReview, "_shouldPromptReviewForStoreReviewMetrics:sessionCount:", v10, [v9 integerValue]);
        id v5 = 0;
      }
    }
  }
  else
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v5 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      BOOL v17 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping checking for should attempt review as shared store review is disabled.", buf, 0x16u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

intptr_t __49__AMSSharedStoreReview_shouldAttemptPromptReview__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_applicationDidForegroundWithCurrentTime:(id)a3 storeReviewMetrics:(id)a4 sessionInterval:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 objectForKeyedSubscript:@"last-session-timestamp"];
  if (+[AMSSharedStoreReview _shouldLogNewSessionWithLastLoggedTimeStamp:v9 currentTime:v7 sessionInterval:a5])
  {
    +[AMSSharedStoreReview _logNewSessionWithStoreReviewMetrics:v8 currentTime:v7];
  }
  else
  {
    dispatch_queue_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      dispatch_queue_t v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSSetLogKeyIfNeeded();
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      BOOL v17 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping tracking for foreground as last logged time stamp is within session interval.", (uint8_t *)&v14, 0x16u);
    }
  }
}

+ (BOOL)_shouldLogNewSessionWithLastLoggedTimeStamp:(id)a3 currentTime:(id)a4 sessionInterval:(int64_t)a5
{
  if (!a3) {
    return 1;
  }
  objc_msgSend(a4, "timeIntervalSinceDate:");
  return v6 >= (double)a5;
}

+ (id)_storeReviewMetrics
{
  v2 = +[AMSProcessInfo currentProcess];
  dispatch_semaphore_t v3 = [v2 bundleIdentifier];

  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal])
  {
    id v4 = AMSDefaults;
  }
  else
  {
    id v4 = AMSStorage;
  }
  id v5 = [(__objc2_class *)v4 sharedStoreReviewMetricsForProcess:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6)
    {
      id v7 = v6;
      id v8 = v7;
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  id v7 = 0;
LABEL_9:

  return v8;
}

+ (void)_logNewSessionWithStoreReviewMetrics:(id)a3 currentTime:(id)a4
{
  id v6 = a4;
  id v13 = (id)[a3 mutableCopy];
  [v13 setObject:v6 forKeyedSubscript:@"last-session-timestamp"];

  uint64_t v7 = [v13 objectForKeyedSubscript:@"session-count"];
  id v8 = (void *)v7;
  uint64_t v9 = &unk_1EDD01750;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  id v10 = v9;

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v10, "integerValue") + 1);

  [v13 setObject:v11 forKeyedSubscript:@"session-count"];
  uint64_t v12 = (void *)[v13 copy];
  [a1 _persistStoreReviewMetrics:v12];
}

+ (void)_logDidAttemptPromptReviewWithStoreReviewMetrics:(id)a3 currentTime:(id)a4
{
  id v6 = a4;
  id v8 = (id)[a3 mutableCopy];
  [v8 setObject:v6 forKeyedSubscript:@"did-attempt-review-timestamp"];

  uint64_t v7 = (void *)[v8 copy];
  [a1 _persistStoreReviewMetrics:v7];
}

+ (void)_persistStoreReviewMetrics:(id)a3
{
  id v3 = a3;
  id v4 = +[AMSProcessInfo currentProcess];
  id v7 = [v4 bundleIdentifier];

  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal])
  {
    id v5 = AMSDefaults;
  }
  else
  {
    id v5 = AMSStorage;
  }
  id v6 = (void *)[v3 copy];

  [(__objc2_class *)v5 setSharedStoreReviewMetrics:v6 forProcess:v7];
}

+ (BOOL)_shouldPromptReviewForStoreReviewMetrics:(id)a3 sessionCount:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"session-count"];
  id v7 = (void *)v6;
  id v8 = &unk_1EDD01750;
  if (v6) {
    id v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = [v5 objectForKeyedSubscript:@"did-attempt-review-timestamp"];

  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = [v9 integerValue] >= a4;
  }
  uint64_t v12 = +[AMSLogConfig sharedConfig];
  if (!v12)
  {
    uint64_t v12 = +[AMSLogConfig sharedConfig];
  }
  id v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = AMSSetLogKeyIfNeeded();
    __int16 v16 = (void *)v15;
    int v19 = 138544386;
    BOOL v17 = @"Not prompted before.";
    uint64_t v20 = v14;
    if (v10) {
      BOOL v17 = v10;
    }
    __int16 v21 = 2114;
    uint64_t v22 = v15;
    __int16 v23 = 1024;
    BOOL v24 = v11;
    __int16 v25 = 2114;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v17;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Should prompt: %d, with session count: %{public}@, last attempt: %{public}@", (uint8_t *)&v19, 0x30u);
  }
  return v11;
}

+ (BOOL)_shouldPromptReviewForStoreReviewMetrics:(id)a3 currentTime:(id)a4 sessionCount:(int64_t)a5 promptInterval:(int64_t)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"session-count"];
  uint64_t v12 = (void *)v11;
  id v13 = &unk_1EDD01750;
  if (v11) {
    id v13 = (void *)v11;
  }
  id v14 = v13;

  uint64_t v15 = [v10 objectForKeyedSubscript:@"did-attempt-review-timestamp"];

  [v9 timeIntervalSinceDate:v15];
  double v17 = v16;

  BOOL v19 = (v17 >= (double)a6 || v15 == 0) && [v14 integerValue] >= a5;
  uint64_t v20 = +[AMSLogConfig sharedConfig];
  if (!v20)
  {
    uint64_t v20 = +[AMSLogConfig sharedConfig];
  }
  __int16 v21 = [v20 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = AMSSetLogKeyIfNeeded();
    BOOL v24 = (void *)v23;
    int v27 = 138544642;
    __int16 v25 = @"Not prompted before.";
    uint64_t v28 = v22;
    if (v15) {
      __int16 v25 = v15;
    }
    __int16 v29 = 2114;
    uint64_t v30 = v23;
    __int16 v31 = 1024;
    BOOL v32 = v19;
    __int16 v33 = 2114;
    id v34 = v14;
    __int16 v35 = 2114;
    v36 = v25;
    __int16 v37 = 2048;
    int64_t v38 = a6;
    _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Should prompt: %d, with session count: %{public}@, last attempt: %{public}@, prompt interval: %ld", (uint8_t *)&v27, 0x3Au);
  }
  return v19;
}

+ (BOOL)_isRepeatedPromptsSupported
{
  return _os_feature_enabled_impl();
}

- (OS_dispatch_queue)sharedStoreReviewQueue
{
  return self->_sharedStoreReviewQueue;
}

- (AMSStoreReviewGatingController)storeReviewGatingController
{
  return self->_storeReviewGatingController;
}

- (void)setStoreReviewGatingController:(id)a3
{
}

- (void)setBag:(id)a3
{
}

@end