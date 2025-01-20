@interface LACDTOLostModeController
- (LACBackgroundTask)lostModeBackgroundTask;
- (LACDTOLostModeController)initWithLostModeProvider:(id)a3 store:(id)a4 workQueue:(id)a5;
- (NSString)description;
- (id)_lostModeStateFromBackgroundTaskResult:(id)a3;
- (void)_runLostModeBackgroundTaskWithStrategy:(int64_t)a3 completion:(id)a4;
- (void)_runLostModeBackgroundTaskWithTimeout:(double)a3 completion:(id)a4;
- (void)_storeLostModeState:(id)a3 completion:(id)a4;
- (void)fetchLostMode:(id)a3 completion:(id)a4;
- (void)setLostModeBackgroundTask:(id)a3;
@end

@implementation LACDTOLostModeController

- (LACDTOLostModeController)initWithLostModeProvider:(id)a3 store:(id)a4 workQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOLostModeController;
  v12 = [(LACDTOLostModeController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lostModeProvider, a3);
    objc_storeStrong((id *)&v13->_store, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
  }

  return v13;
}

- (void)fetchLostMode:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t StrategyFromRequest = LACDTOLostModeFetchStrategyFromRequest(v6);
  id v9 = LACLogDTOLostMode();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromLACDTOLostModeFetchStrategy(StrategyFromRequest);
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query with '%@' strategy", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__LACDTOLostModeController_fetchLostMode_completion___block_invoke;
  v12[3] = &unk_2653B6520;
  objc_copyWeak(&v14, (id *)buf);
  id v11 = v7;
  id v13 = v11;
  [(LACDTOLostModeController *)self _runLostModeBackgroundTaskWithStrategy:StrategyFromRequest completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __53__LACDTOLostModeController_fetchLostMode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = LACLogDTOLostMode();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %@", buf, 0x16u);
    }

    dispatch_assert_queue_V2(WeakRetained[3]);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__LACDTOLostModeController_fetchLostMode_completion___block_invoke_1;
    v6[3] = &unk_2653B64F8;
    v6[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    id v7 = v3;
    [(dispatch_queue_t *)WeakRetained _storeLostModeState:v7 completion:v6];
  }
}

void __53__LACDTOLostModeController_fetchLostMode_completion___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 24));
    if (v3)
    {
      v5 = LACLogDTOLostMode();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v9 = 138543618;
        uint64_t v10 = v6;
        __int16 v11 = 2114;
        id v12 = v3;
        _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query with error %{public}@", (uint8_t *)&v9, 0x16u);
      }

      uint64_t v7 = *(void *)(a1 + 48);
      id v8 = +[LACDTOLostModeState nullInstance];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (LACBackgroundTask)lostModeBackgroundTask
{
  lostModeBackgroundTask = self->_lostModeBackgroundTask;
  if (!lostModeBackgroundTask)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = [LACBackgroundTask alloc];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__LACDTOLostModeController_lostModeBackgroundTask__block_invoke;
    v8[3] = &unk_2653B5A38;
    objc_copyWeak(&v9, &location);
    v5 = [(LACBackgroundTask *)v4 initWithIdentifier:@"LostModeStateQuery" worker:v8];
    uint64_t v6 = self->_lostModeBackgroundTask;
    self->_lostModeBackgroundTask = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    lostModeBackgroundTask = self->_lostModeBackgroundTask;
  }
  return lostModeBackgroundTask;
}

void __50__LACDTOLostModeController_lostModeBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = +[LACDTOSignpostEvent lostModeQueryWillStart];
    [v5 send];

    uint64_t v6 = (void *)WeakRetained[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__LACDTOLostModeController_lostModeBackgroundTask__block_invoke_2;
    v7[3] = &unk_2653B6548;
    id v8 = v3;
    [v6 lostModeStateWithCompletion:v7];
  }
}

void __50__LACDTOLostModeController_lostModeBackgroundTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[LACDTOSignpostEvent lostModeQueryDidFinish];
  [v4 send];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [[LACBackgroundTaskResult alloc] initWithValue:v3];

  (*(void (**)(uint64_t, LACBackgroundTaskResult *))(v5 + 16))(v5, v6);
}

- (void)_runLostModeBackgroundTaskWithStrategy:(int64_t)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (a3 == 1)
  {
    uint64_t v7 = LACLogDTOLostMode();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = self;
      _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will skip query because current ratchet state allows it", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = +[LACDTOLostModeState nullInstance];
    v6[2](v6, v8);

    uint64_t v6 = (void (**)(id, uint64_t))v8;
  }
  else
  {
    [(LACDTOLostModeController *)self _runLostModeBackgroundTaskWithTimeout:v6 completion:1.35];
  }
}

- (void)_runLostModeBackgroundTaskWithTimeout:(double)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_initWeak(&location, self);
  uint64_t v7 = LACLogDTOLostMode();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2048;
    double v18 = a3;
    _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform query with %.2f sec timeout", buf, 0x16u);
  }

  uint64_t v8 = [(LACDTOLostModeController *)self lostModeBackgroundTask];
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__LACDTOLostModeController__runLostModeBackgroundTaskWithTimeout_completion___block_invoke;
  v11[3] = &unk_2653B5A60;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [v8 runWithTimeout:workQueue queue:v11 completion:a3];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__LACDTOLostModeController__runLostModeBackgroundTaskWithTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [WeakRetained _lostModeStateFromBackgroundTaskResult:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (id)_lostModeStateFromBackgroundTaskResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 value];
  if (v5
    && (id v6 = (void *)v5,
        [v4 value],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v9 = [v4 value];
  }
  else
  {
    id v10 = [v4 error];

    if (v10)
    {
      uint64_t v11 = LACLogDTOLostMode();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v4 error];
        int v15 = 138543618;
        v16 = self;
        __int16 v17 = 2114;
        double v18 = v12;
        _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ query finished with error %{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
    uint64_t v9 = +[LACDTOLostModeState nullInstance];
  }
  id v13 = (void *)v9;

  return v13;
}

- (void)_storeLostModeState:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [LACDTOKVStoreValue alloc];
  uint64_t v9 = [v7 isInLostMode];

  id v10 = [(LACDTOKVStoreValue *)v8 initWithBoolValue:v9];
  [(LACDTOKVStore *)self->_store setValue:v10 forKey:2 completion:v6];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void)setLostModeBackgroundTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeBackgroundTask, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lostModeProvider, 0);
}

@end