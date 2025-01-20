@interface LACSharedModeDataSourceTaskDecorator
- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4;
- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 runtime:(id)a4 replyQueue:(id)a5;
- (double)_timeoutForRequestWithOptions:(id)a3;
- (id)_sharedModeBackgroundTaskWithOptions:(id)a3;
- (id)_sharedModeFromBackgroundTaskResult:(id)a3;
- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModeDataSourceTaskDecorator

void __78__LACSharedModeDataSourceTaskDecorator_fetchSharedModeWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained _sharedModeFromBackgroundTaskResult:v3];
    v7 = LACLogSharedMode();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 48));
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %{public}@", (uint8_t *)&v9, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_sharedModeFromBackgroundTaskResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 value];
  if (v5
    && (v6 = (void *)v5,
        [v4 value],
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    [(LACSharedModeDataSourceTaskDecoratorRuntime *)self->_runtime resetMaxValue];
    uint64_t v9 = [v4 value];
  }
  else
  {
    id v10 = [v4 error];

    if (v10)
    {
      __int16 v11 = [v4 error];
      v12 = [v11 domain];
      if ([v12 isEqualToString:@"LACBackgroundTaskErrorDomain"])
      {
        uint64_t v13 = [v4 error];
        uint64_t v14 = [v13 code];

        if (v14 == 2) {
          [(LACSharedModeDataSourceTaskDecoratorRuntime *)self->_runtime halveMaxValue];
        }
      }
      else
      {
      }
      v15 = LACLogSharedMode();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(LACSharedModeDataSourceTaskDecorator *)(uint64_t)self _sharedModeFromBackgroundTaskResult:v15];
      }
    }
    uint64_t v9 = +[LACSharedMode defaultSharedMode];
  }
  v16 = (void *)v9;

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_runtime, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [[LACBackgroundTaskResult alloc] initWithValue:v3];

  (*(void (**)(uint64_t, LACBackgroundTaskResult *))(v2 + 16))(v2, v4);
}

- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 runtime:(id)a4 replyQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACSharedModeDataSourceTaskDecorator;
  v12 = [(LACSharedModeDataSourceTaskDecorator *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_runtime, a4);
    objc_storeStrong((id *)&v13->_replyQueue, a5);
  }

  return v13;
}

void __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((void *)WeakRetained + 1);
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke_2;
    v8[3] = &unk_2653B5728;
    id v9 = v3;
    [v6 fetchSharedModeWithOptions:v7 completion:v8];
  }
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = LACLogSharedMode();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  id v9 = [(LACSharedModeDataSourceTaskDecorator *)self _sharedModeBackgroundTaskWithOptions:v6];
  [(LACSharedModeDataSourceTaskDecorator *)self _timeoutForRequestWithOptions:v6];
  double v11 = v10;
  replyQueue = self->_replyQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__LACSharedModeDataSourceTaskDecorator_fetchSharedModeWithOptions_completion___block_invoke;
  v15[3] = &unk_2653B5700;
  objc_copyWeak(&v18, &location);
  id v13 = v7;
  id v17 = v13;
  id v14 = v9;
  id v16 = v14;
  [v14 runWithTimeout:replyQueue queue:v15 completion:v11];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (double)_timeoutForRequestWithOptions:(id)a3
{
  int v4 = [a3 isPreflight];
  runtime = self->_runtime;
  if (v4)
  {
    [(LACSharedModeDataSourceTaskDecoratorRuntime *)runtime minValue];
  }
  else
  {
    [(LACSharedModeDataSourceTaskDecoratorRuntime *)runtime maxValue];
  }
  return result;
}

- (id)_sharedModeBackgroundTaskWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [LACBackgroundTask alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke;
  v9[3] = &unk_2653B5750;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = [(LACBackgroundTask *)v5 initWithIdentifier:@"SharedModeStateQuery" worker:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(LACSharedModeDataSourceTaskDecoratorRuntime);
  id v9 = [(LACSharedModeDataSourceTaskDecorator *)self initWithDataSource:v7 runtime:v8 replyQueue:v6];

  return v9;
}

- (void)_sharedModeFromBackgroundTaskResult:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 error];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_254F14000, a3, OS_LOG_TYPE_ERROR, "%{public}@ query finished with error %{public}@", (uint8_t *)&v6, 0x16u);
}

@end