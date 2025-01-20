@interface LASecret
- (LASecret)initWithGenericPassword:(id)a3;
- (id)description;
- (id)identifier;
- (id)right;
- (void)dealloc;
- (void)loadDataWithCompletion:(void *)handler;
- (void)setRight:(id)a3;
@end

@implementation LASecret

- (LASecret)initWithGenericPassword:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LASecret;
  v6 = [(LASecret *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_genp, a3);
    uint64_t v8 = [MEMORY[0x1E4F72F38] createDefaultSerialQueueWithIdentifier:@"LASecret"];
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    v10 = [MEMORY[0x1E4F30B98] sharedInstance];
    v7->_instanceID = [v10 nextInstanceIDInDomain:@"LASecret"];

    v11 = LA_LOG_2();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(LARightStore *)(uint64_t)v7 init];
    }
  }
  return v7;
}

- (void)dealloc
{
  v3 = LA_LOG_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(LARightStore *)(uint64_t)self dealloc];
  }

  v4.receiver = self;
  v4.super_class = (Class)LASecret;
  [(LASecret *)&v4 dealloc];
}

- (id)identifier
{
  return (id)[(LAKeyStoreGenericPassword *)self->_genp identifier];
}

- (id)right
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_right);

  return WeakRetained;
}

- (void)setRight:(id)a3
{
}

- (void)loadDataWithCompletion:(void *)handler
{
  objc_super v4 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__LASecret_loadDataWithCompletion___block_invoke;
  v7[3] = &unk_1E63C40A0;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__LASecret_loadDataWithCompletion___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.fetchData", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__LASecret_loadDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E63C40A0;
  block[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  os_activity_apply(v2, block);

  objc_destroyWeak(&v5);
}

void __35__LASecret_loadDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_INFO, "%{public}@ fetchData", buf, 0xCu);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 1);
    BOOL v7 = v6 == 0;

    if (v7)
    {
      v15 = LA_LOG_2();
      os_log_type_t v16 = LALogTypeForInternalError();
      if (os_log_type_enabled(v15, v16))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BED06000, v15, v16, "The right associated with this secret was deallocated", buf, 2u);
      }

      uint64_t v17 = *(void *)(a1 + 40);
      v18 = +[LAAuthorizationError genericErrorWithMessage:@"The right associated with this secret was deallocated"];
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
    }
    else
    {
      id v8 = v5[2];
      id v9 = objc_loadWeakRetained(v5 + 1);
      v10 = [v9 context];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __35__LASecret_loadDataWithCompletion___block_invoke_11;
      v19[3] = &unk_1E63C47A0;
      objc_copyWeak(&v21, (id *)(a1 + 48));
      id v20 = *(id *)(a1 + 40);
      [v8 fetchDataWithContext:v10 completion:v19];

      objc_destroyWeak(&v21);
    }
  }
  else
  {
    v11 = LA_LOG_2();
    os_log_type_t v12 = LALogTypeForInternalError();
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v11, v12, "Operation interrupted", buf, 2u);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    v14 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
  }
}

void __35__LASecret_loadDataWithCompletion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = LA_LOG_2();
  id v8 = v7;
  if (v5)
  {
    os_log_type_t v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [NSString stringWithFormat:@"(err=%@)", v5];
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = &stru_1F19E1C60;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  *(_DWORD *)buf = 138543618;
  id v13 = WeakRetained;
  __int16 v14 = 2114;
  v15 = v11;
  _os_log_impl(&dword_1BED06000, v8, v9, "%{public}@ fetchData finished %{public}@", buf, 0x16u);
  if (v5) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"LASecret[%u]", self->_instanceID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_genp, 0);

  objc_destroyWeak((id *)&self->_right);
}

@end