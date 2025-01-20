@interface AMSODISession
+ (BOOL)isTDMEnhancementAvailable;
+ (BOOL)provideFeedbackOnPayloadOutcome:(unint64_t)a3 cacheIdentifier:(id)a4 bag:(id)a5;
+ (BOOL)shouldUseODIWithBag:(id)a3;
- (AMSBagProtocol)bag;
- (AMSODISession)initWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bag:(id)a5;
- (AMSODISession)initWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bundleIdentifier:(id)a5 bag:(id)a6;
- (BOOL)isTDMEnhancementAvailable;
- (BOOL)updateWithAttributes:(id)a3;
- (NSLock)lock;
- (NSString)bundleIdentifier;
- (NSString)cacheIdentifier;
- (NSString)sessionIdentifier;
- (id)_createODISession;
- (id)getAssessment;
- (unint64_t)accountType;
- (void)setBag:(id)a3;
- (void)setCacheIdentifier:(id)a3;
- (void)setLock:(id)a3;
@end

@implementation AMSODISession

- (AMSODISession)initWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bag:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = AMSLogKey();
    int v15 = 138412290;
    v16 = v12;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "AMSODISession: [%@] **WARNING** Calling a deprecated constructor", (uint8_t *)&v15, 0xCu);
  }
  v13 = [(AMSODISession *)self initWithSessionIdentifier:v9 accountType:a4 bundleIdentifier:0 bag:v8];

  return v13;
}

- (AMSODISession)initWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bundleIdentifier:(id)a5 bag:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)AMSODISession;
  v13 = [(AMSODISession *)&v29 init];
  v14 = v13;
  if (v13)
  {
    v13->_accountType = a4;
    objc_storeStrong((id *)&v13->_bag, a6);
    uint64_t v15 = [v11 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    sessionIdentifier = v14->_sessionIdentifier;
    v14->_sessionIdentifier = (NSString *)v17;

    [(NSLock *)v14->_lock lock];
    v19 = [(AMSODISession *)v14 _createODISession];
    id v28 = 0;
    uint64_t v20 = [v19 resultWithError:&v28];
    id v21 = v28;
    cacheIdentifier = v14->_cacheIdentifier;
    v14->_cacheIdentifier = (NSString *)v20;

    if (v21)
    {
      v23 = +[AMSLogConfig sharedConfig];
      if (!v23)
      {
        v23 = +[AMSLogConfig sharedConfig];
      }
      v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = objc_opt_class();
        v26 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v25;
        __int16 v32 = 2114;
        v33 = v26;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create remote session instance", buf, 0x16u);
      }
    }
    [(NSLock *)v14->_lock unlock];
  }
  return v14;
}

- (NSString)cacheIdentifier
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[(NSString *)self->_cacheIdentifier copy];
  [(NSLock *)self->_lock unlock];
  return (NSString *)v3;
}

- (void)setCacheIdentifier:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  v6 = (NSString *)[v5 copy];

  cacheIdentifier = self->_cacheIdentifier;
  self->_cacheIdentifier = v6;

  id v8 = self->_lock;
  [(NSLock *)v8 unlock];
}

- (id)getAssessment
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = AMSSetLogKeyIfNeeded();
  uint64_t v4 = objc_opt_class();
  id v5 = [(AMSODISession *)self bag];
  LOBYTE(v4) = [(id)v4 shouldUseODIWithBag:v5];

  if (v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v16 = __Block_byref_object_copy__53;
    uint64_t v17 = __Block_byref_object_dispose__53;
    v18 = objc_alloc_init(AMSDaemonConnection);
    v6 = [*(id *)(*(void *)&buf[8] + 40) purchaseServiceProxy];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __30__AMSODISession_getAssessment__block_invoke;
    v12[3] = &unk_1E55A29B0;
    v12[4] = self;
    id v13 = v3;
    v14 = buf;
    v7 = [v6 thenWithBlock:v12];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v3;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping assessment for no bag key", buf, 0x16u);
    }

    id v10 = AMSError(204, @"ODI Error", @"Bag Value Missing", 0);
    v7 = objc_alloc_init(AMSMutablePromise);
    [(AMSMutablePromise *)v7 finishWithError:v10];
  }
  return v7;
}

AMSMutablePromise *__30__AMSODISession_getAssessment__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = [*(id *)(a1 + 32) cacheIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __30__AMSODISession_getAssessment__block_invoke_2;
  v14[3] = &unk_1E55A4F38;
  v6 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v15 = v6;
  uint64_t v16 = v7;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 48);
  id v17 = v9;
  uint64_t v18 = v10;
  [v3 getODIAssessmentForSessionIdentifier:v5 clearCache:0 completion:v14];

  id v11 = v17;
  id v12 = v6;

  return v12;
}

void __30__AMSODISession_getAssessment__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) finishWithResult:v5];
  }
  else
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 48);
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ODI assessment failed for unknown reasons", (uint8_t *)&v14, 0x16u);
    }

    id v11 = AMSError(0, @"ODI Error", @"Unknown error", 0);
    [*(id *)(a1 + 32) finishWithError:v11];
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

+ (BOOL)isTDMEnhancementAvailable
{
  return _os_feature_enabled_impl();
}

+ (BOOL)provideFeedbackOnPayloadOutcome:(unint64_t)a3 cacheIdentifier:(id)a4 bag:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v22 = AMSSetLogKeyIfNeeded();
  if ([(id)objc_opt_class() shouldUseODIWithBag:v9])
  {
    *(void *)v36 = 0;
    *(void *)&v36[8] = v36;
    *(void *)&v36[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__53;
    v38 = __Block_byref_object_dispose__53;
    v39 = objc_alloc_init(AMSDaemonConnection);
    uint64_t v10 = objc_msgSend(*(id *)(*(void *)&v36[8] + 40), "purchaseServiceProxy", v22);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__AMSODISession_provideFeedbackOnPayloadOutcome_cacheIdentifier_bag___block_invoke;
    v25[3] = &unk_1E55A4F88;
    unint64_t v28 = a3;
    id v29 = a1;
    id v26 = v8;
    v27 = v36;
    id v11 = [v10 thenWithBlock:v25];
    uint64_t v12 = [v11 binaryPromiseAdapter];
    id v24 = 0;
    char v13 = [v12 resultWithError:&v24];
    id v14 = v24;

    if (v14)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
      if (!v15)
      {
        uint64_t v15 = +[AMSLogConfig sharedConfig];
      }
      __int16 v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v17;
        __int16 v32 = 2114;
        v33 = v18;
        __int16 v34 = 2114;
        id v35 = v14;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to provide ODI feedback for connection error: %{public}@", buf, 0x20u);
      }
    }

    _Block_object_dispose(v36, 8);
  }
  else
  {
    uint64_t v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      uint64_t v19 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v20 = objc_msgSend(v19, "OSLogObject", v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v36 = 138543618;
      *(void *)&v36[4] = objc_opt_class();
      *(_WORD *)&v36[12] = 2114;
      *(void *)&v36[14] = v23;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping feedback for no bag key", v36, 0x16u);
    }

    char v13 = 0;
  }

  return v13;
}

AMSMutablePromise *__69__AMSODISession_provideFeedbackOnPayloadOutcome_cacheIdentifier_bag___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = a1[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__AMSODISession_provideFeedbackOnPayloadOutcome_cacheIdentifier_bag___block_invoke_2;
  v10[3] = &unk_1E55A4F60;
  uint64_t v6 = a1[6];
  uint64_t v13 = a1[7];
  uint64_t v7 = v4;
  uint64_t v8 = a1[5];
  id v11 = v7;
  uint64_t v12 = v8;
  [v3 provideFeedbackOnPayloadOutcome:v6 sessionIdentifier:v5 clearCache:1 completion:v10];

  return v7;
}

void __69__AMSODISession_provideFeedbackOnPayloadOutcome_cacheIdentifier_bag___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      uint64_t v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = AMSLogKey();
      int v12 = 138543874;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to provide ODI feedback for error: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = &unk_1EDD015B8;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = &unk_1EDD015D0;
  }
  [v8 finishWithResult:v9];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

+ (BOOL)shouldUseODIWithBag:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = AMSSetLogKeyIfNeeded();
  uint64_t v5 = [v3 BOOLForKey:@"afds-enabled-odi"];
  id v18 = 0;
  uint64_t v6 = [v5 valueWithError:&v18];
  id v7 = v18;
  if (objc_opt_respondsToSelector())
  {
    [v3 BOOLForKey:@"afds-enabled-odi"];
    uint64_t v8 = v17 = v7;
    id v9 = [v8 valueWithError:&v17];
    id v10 = v17;

    char v11 = [v9 BOOLValue];
    id v7 = v10;
  }
  else
  {
    char v11 = 0;
  }

  if (v7)
  {
    int v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      int v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSHashIfNeeded(@"afds-enabled-odi");
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v4;
      __int16 v23 = 2114;
      id v24 = v15;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] No bag key found: %{public}@", buf, 0x20u);
    }
    char v11 = 0;
  }

  return v11;
}

- (BOOL)updateWithAttributes:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AMSSetLogKeyIfNeeded();
  uint64_t v6 = objc_opt_class();
  id v7 = [(AMSODISession *)self bag];
  LOBYTE(v6) = [(id)v6 shouldUseODIWithBag:v7];

  if (v6)
  {
    *(void *)uint64_t v31 = 0;
    *(void *)&v31[8] = v31;
    *(void *)&v31[16] = 0x3032000000;
    __int16 v32 = __Block_byref_object_copy__53;
    v33 = __Block_byref_object_dispose__53;
    __int16 v34 = objc_alloc_init(AMSDaemonConnection);
    uint64_t v8 = [*(id *)(*(void *)&v31[8] + 40) purchaseServiceProxy];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __38__AMSODISession_updateWithAttributes___block_invoke;
    v21[3] = &unk_1E55A29B0;
    id v22 = v4;
    __int16 v23 = self;
    id v24 = v31;
    id v9 = [v8 thenWithBlock:v21];
    id v10 = [v9 binaryPromiseAdapter];
    id v20 = 0;
    char v11 = [v10 resultWithError:&v20];
    id v12 = v20;

    if (v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        __int16 v16 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v26 = v15;
        __int16 v27 = 2114;
        unint64_t v28 = v16;
        __int16 v29 = 2114;
        id v30 = v12;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update ODI attributes for connection error: %{public}@", buf, 0x20u);
      }
    }

    _Block_object_dispose(v31, 8);
  }
  else
  {
    id v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    id v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v31 = 138543618;
      *(void *)&v31[4] = objc_opt_class();
      *(_WORD *)&v31[12] = 2114;
      *(void *)&v31[14] = v5;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping update for no bag key", v31, 0x16u);
    }

    char v11 = 0;
  }

  return v11;
}

AMSMutablePromise *__38__AMSODISession_updateWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) cacheIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__AMSODISession_updateWithAttributes___block_invoke_2;
  v12[3] = &unk_1E55A4FB0;
  v12[4] = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v13 = v7;
  uint64_t v14 = v8;
  [v3 updateODIWithAttributes:v5 forSessionIdentifier:v6 completion:v12];

  id v9 = v13;
  id v10 = v7;

  return v10;
}

void __38__AMSODISession_updateWithAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      id v7 = AMSLogKey();
      int v12 = 138543874;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update ODI attributes for error: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = &unk_1EDD015B8;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = &unk_1EDD015D0;
  }
  [v8 finishWithResult:v9];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  char v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (id)_createODISession
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = AMSSetLogKeyIfNeeded();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(AMSODISession *)self bag];
  LOBYTE(v4) = [(id)v4 shouldUseODIWithBag:v5];

  if (v4)
  {
    uint64_t v6 = [AMSMutableLazyPromise alloc];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__AMSODISession__createODISession__block_invoke;
    v12[3] = &unk_1E55A0A90;
    v12[4] = self;
    id v7 = [(AMSMutableLazyPromise *)v6 initWithBlock:v12];
  }
  else
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2114;
      __int16 v16 = v3;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping create session for no bag key", buf, 0x16u);
    }

    id v7 = objc_alloc_init(AMSMutablePromise);
    uint64_t v10 = AMSError(204, @"ODI Error", @"Bag Value Missing", 0);
    [(AMSMutablePromise *)v7 finishWithError:v10];
  }
  return v7;
}

void __34__AMSODISession__createODISession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AMSSetLogKeyIfNeeded();
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__53;
  __int16 v15 = __Block_byref_object_dispose__53;
  __int16 v16 = objc_alloc_init(AMSDaemonConnection);
  uint64_t v5 = [(id)v12[5] purchaseServiceProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__AMSODISession__createODISession__block_invoke_2;
  v8[3] = &unk_1E55A29B0;
  v8[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  id v7 = [v5 thenWithBlock:v8];
  [v3 finishWithPromise:v7];

  _Block_object_dispose(&v11, 8);
}

AMSMutablePromise *__34__AMSODISession__createODISession__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = [*(id *)(a1 + 32) sessionIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) accountType];
  id v7 = [*(id *)(a1 + 32) bundleIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__AMSODISession__createODISession__block_invoke_3;
  v16[3] = &unk_1E55A4FD8;
  uint64_t v8 = v4;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v17 = v8;
  uint64_t v18 = v9;
  id v11 = v10;
  uint64_t v12 = *(void *)(a1 + 48);
  id v19 = v11;
  uint64_t v20 = v12;
  [v3 createODISessionWithSessionIdentifier:v5 accountType:v6 bundleIdentifier:v7 completion:v16];

  uint64_t v13 = v19;
  uint64_t v14 = v8;

  return v14;
}

void __34__AMSODISession__createODISession__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) finishWithResult:v5];
  }
  else
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 48);
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ODI session failed for unknown reasons", (uint8_t *)&v14, 0x16u);
    }

    id v11 = AMSError(0, @"ODI Error", @"Unknown error", 0);
    [*(id *)(a1 + 32) finishWithError:v11];
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isTDMEnhancementAvailable
{
  return self->_TDMEnhancementAvailable;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

@end