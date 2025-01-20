@interface LACSharedModeDataSourceFTRCAdapter
+ (id)_callCenter;
+ (id)_workQueue;
- (LACSharedModeDataSourceFTRCAdapter)initWithReplyQueue:(id)a3;
- (void)_performFetchSharedModeWithCompletion:(id)a3;
- (void)dealloc;
- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModeDataSourceFTRCAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inCallService, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

uint64_t __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = LACLogSharedMode();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543618;
    id v7 = WeakRetained;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_254F14000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  __int16 v8 = +[LACFlags sharedInstance];
  char v9 = [v8 featureFlagEssoniteClickEnabled];

  if ((v9 & 1) == 0)
  {
    v12 = +[LACSharedMode defaultSharedMode];
    v13 = LACLogSharedMode();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[LACSharedModeDataSourceFTRCAdapter fetchSharedModeWithOptions:completion:]();
    }
    goto LABEL_12;
  }
  if (!getTUCallCenterClass() || !getTUUIXPCClientConnectionClass())
  {
    v12 = +[LACSharedMode defaultSharedMode];
    v13 = LACLogSharedMode();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[LACSharedModeDataSourceFTRCAdapter fetchSharedModeWithOptions:completion:]();
    }
LABEL_12:

    v7[2](v7, v12);
    goto LABEL_13;
  }
  uint64_t v10 = LACLogSharedMode();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl(&dword_254F14000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11 = [(id)objc_opt_class() _workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke;
  block[3] = &unk_2653B5CC0;
  block[4] = self;
  objc_copyWeak(&v16, (id *)buf);
  v15 = v7;
  dispatch_async(v11, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
LABEL_13:
}

- (LACSharedModeDataSourceFTRCAdapter)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACSharedModeDataSourceFTRCAdapter;
  id v6 = [(LACSharedModeDataSourceFTRCAdapter *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
  }

  return v7;
}

+ (id)_workQueue
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__LACSharedModeDataSourceFTRCAdapter__workQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_workQueue_onceToken != -1) {
    dispatch_once(&_workQueue_onceToken, block);
  }
  v2 = (void *)_workQueue__queue;
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_254F14000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ deallocated", (uint8_t *)&v2, 0xCu);
}

void __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke_2;
  v3[3] = &unk_2653B5C98;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 _performFetchSharedModeWithCompletion:v3];

  objc_destroyWeak(&v5);
}

- (void)_performFetchSharedModeWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _callCenter];
  uint64_t v6 = [v5 countOfCallsPassingTest:&__block_literal_global_3];

  if (v6)
  {
    objc_initWeak((id *)location, self);
    id v7 = [(id)objc_opt_class() _callCenter];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke_10;
    v10[3] = &unk_2653B5D30;
    objc_copyWeak(&v12, (id *)location);
    id v11 = v4;
    [v7 fetchAnonymousXPCEndpoint:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    __int16 v8 = [[LACSharedMode alloc] initWithActive:0 confirmed:1];
    objc_super v9 = LACLogSharedMode();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = self;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ falling back to %{public}@ because the TUCallCenter has no active calls", location, 0x16u);
    }

    (*((void (**)(id, LACSharedMode *))v4 + 2))(v4, v8);
  }
}

void __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke_3;
    block[3] = &unk_2653B5C70;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
  }
}

+ (id)_callCenter
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__LACSharedModeDataSourceFTRCAdapter__callCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_callCenter_onceToken != -1) {
    dispatch_once(&_callCenter_onceToken, block);
  }
  int v2 = (void *)_callCenter__center;
  return v2;
}

uint64_t __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 1) {
    uint64_t v3 = [v2 isConversation];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = +[LACSharedMode defaultSharedMode];
      id v9 = LACLogSharedMode();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v24 = WeakRetained;
        __int16 v25 = 2114;
        v26 = v6;
        __int16 v27 = 2114;
        v28 = v8;
        _os_log_error_impl(&dword_254F14000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Unable to determine current shared mode status %{public}@. Falling back to : %{public}@", buf, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else if (v5)
    {
      id v10 = LACLogSharedMode();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)(a1 + 40));
        *(_DWORD *)buf = 138543618;
        v24 = v11;
        __int16 v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_254F14000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Obtained TUCallCenter endpoint %@", buf, 0x16u);
      }
      id v12 = objc_alloc((Class)getTUUIXPCClientConnectionClass());
      v13 = [(id)objc_opt_class() _callCenter];
      uint64_t v14 = [v12 initWithListenerEndpoint:v5 callCenter:v13];
      v15 = (void *)WeakRetained[2];
      WeakRetained[2] = v14;

      uint64_t v16 = (void *)WeakRetained[2];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke_11;
      v20[3] = &unk_2653B5D08;
      objc_copyWeak(&v22, (id *)(a1 + 40));
      id v21 = *(id *)(a1 + 32);
      [v16 fetchRemoteControlStatus:v20];

      objc_destroyWeak(&v22);
    }
    else
    {
      v17 = [[LACSharedMode alloc] initWithActive:0 confirmed:1];
      v18 = LACLogSharedMode();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = objc_loadWeakRetained((id *)(a1 + 40));
        *(_DWORD *)buf = 138543618;
        v24 = v19;
        __int16 v25 = 2114;
        v26 = v17;
        _os_log_impl(&dword_254F14000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ falling back to %{public}@ because the TUCallCenter endpoint was nil", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = +[LACSharedMode defaultSharedMode];
      id v8 = LACLogSharedMode();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138543874;
        id v10 = WeakRetained;
        __int16 v11 = 2114;
        id v12 = v5;
        __int16 v13 = 2114;
        uint64_t v14 = v7;
        _os_log_error_impl(&dword_254F14000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Unable to determine current shared mode status %{public}@. Falling back to : %{public}@", (uint8_t *)&v9, 0x20u);
      }
    }
    else
    {
      id v7 = [[LACSharedMode alloc] initWithActive:a2 == 2 confirmed:1];
      id v8 = LACLogSharedMode();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543618;
        id v10 = WeakRetained;
        __int16 v11 = 2114;
        id v12 = v7;
        _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v9, 0x16u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __49__LACSharedModeDataSourceFTRCAdapter__callCenter__block_invoke(uint64_t a1)
{
  if (getTUCallCenterClass())
  {
    id v2 = objc_alloc((Class)getTUCallCenterClass());
    id v7 = [*(id *)(a1 + 32) _workQueue];
    uint64_t v3 = [v2 initWithQueue:v7];
    id v4 = (void *)_callCenter__center;
    _callCenter__center = v3;
  }
  else
  {
    id v5 = LACLogSharedMode();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__LACSharedModeDataSourceFTRCAdapter__callCenter__block_invoke_cold_1(a1, v5);
    }

    uint64_t v6 = (void *)_callCenter__center;
    _callCenter__center = 0;
  }
}

void __48__LACSharedModeDataSourceFTRCAdapter__workQueue__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:v3];
  id v2 = (void *)_workQueue__queue;
  _workQueue__queue = v1;
}

- (void)fetchSharedModeWithOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_254F14000, v0, v1, "%{public}@ Unable to determine shared mode status due to missing dependencies %{public}@");
}

- (void)fetchSharedModeWithOptions:completion:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_254F14000, v0, v1, "%{public}@ Required feature flags are not enabled %{public}@");
}

void __49__LACSharedModeDataSourceFTRCAdapter__callCenter__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Unable to determine shared mode status due to missing dependencies", (uint8_t *)&v3, 0xCu);
}

@end