@interface LACSharedModeDataSourceDefaultsDecorator
- (BOOL)_shouldUseMockedResponse;
- (LACSharedModeDataSourceDefaultsDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4;
- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModeDataSourceDefaultsDecorator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(LACSharedModeDataSourceDefaultsDecorator *)self _shouldUseMockedResponse])
  {
    v8 = LACLogSharedMode();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
    }

    v9 = +[LACGlobalDomain isSharedModeActive];
    uint64_t v10 = [v9 BOOLValue];

    v11 = [[LACSharedMode alloc] initWithActive:v10 confirmed:0];
    v12 = +[LACGlobalDomain sharedModeLatency];
    [v12 doubleValue];
    double v14 = v13;

    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__LACSharedModeDataSourceDefaultsDecorator_fetchSharedModeWithOptions_completion___block_invoke;
    block[3] = &unk_2653B5568;
    block[4] = self;
    v19 = v11;
    id v20 = v7;
    v17 = v11;
    dispatch_after(v15, replyQueue, block);
  }
  else
  {
    [(LACSharedModeDataSource *)self->_dataSource fetchSharedModeWithOptions:v6 completion:v7];
  }
}

- (BOOL)_shouldUseMockedResponse
{
  if (!+[LACGlobalDomain osVariantAllowsDomainOverrides])return 0; {
  v2 = +[LACGlobalDomain isSharedModeActive];
  }
  BOOL v3 = v2 != 0;

  return v3;
}

- (LACSharedModeDataSourceDefaultsDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACSharedModeDataSourceDefaultsDecorator;
  v9 = [(LACSharedModeDataSourceDefaultsDecorator *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_replyQueue, a4);
  }

  return v10;
}

uint64_t __82__LACSharedModeDataSourceDefaultsDecorator_fetchSharedModeWithOptions_completion___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = LACLogSharedMode();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_254F14000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

@end