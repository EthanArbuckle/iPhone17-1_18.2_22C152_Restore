@interface LACDTOSensorRepairStateProviderTaskDecorator
- (LACDTOSensorRepairStateProviderTaskDecorator)initWithProvider:(id)a3 replyQueue:(id)a4;
- (id)_repairStateBackgroundTask;
- (void)dealloc;
- (void)fetchRepairStateWithCompletion:(id)a3;
@end

@implementation LACDTOSensorRepairStateProviderTaskDecorator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundTask);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_254F14000, a2, OS_LOG_TYPE_DEBUG, "%@ will dealloc", (uint8_t *)&v2, 0xCu);
}

- (LACDTOSensorRepairStateProviderTaskDecorator)initWithProvider:(id)a3 replyQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOSensorRepairStateProviderTaskDecorator;
  v9 = [(LACDTOSensorRepairStateProviderTaskDecorator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_replyQueue, a4);
  }

  return v10;
}

- (void)fetchRepairStateWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundTask);

  if (WeakRetained)
  {
    id v6 = [NSString stringWithFormat:@"%@ is busy", self->_provider];
    id v7 = +[LACError errorWithCode:-1000 debugDescription:v6];
    id v8 = LACLogDTOSensor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(LACDTOSensorRepairStateProviderCRAdapter *)(uint64_t)self _fetchRepairStateWithCompletion:v8];
    }

    v4[2](v4, 0, v7);
  }
  else
  {
    v9 = [(LACDTOSensorRepairStateProviderTaskDecorator *)self _repairStateBackgroundTask];
    objc_initWeak(&location, self);
    replyQueue = self->_replyQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__LACDTOSensorRepairStateProviderTaskDecorator_fetchRepairStateWithCompletion___block_invoke;
    v11[3] = &unk_2653B5700;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    id v6 = v9;
    id v12 = v6;
    [v6 runWithTimeout:replyQueue queue:v11 completion:1.0];
    objc_storeWeak((id *)&self->_backgroundTask, v6);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __79__LACDTOSensorRepairStateProviderTaskDecorator_fetchRepairStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 3, 0);
    id v6 = [v3 error];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 domain];
      int v9 = [v8 isEqualToString:@"LACBackgroundTaskErrorDomain"];

      if (!v9)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_10;
      }
      v10 = LACLogDTOSensor();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        v15 = v5;
        __int16 v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_254F14000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ failed with background task error %{public}@. Resolving to unknown repair state.", (uint8_t *)&v14, 0x16u);
      }

      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [[LACDTOMutableSensorRepairState alloc] initWithFlag:0];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [v3 value];
    }
    v13 = v12;
    (*(void (**)(uint64_t, LACDTOMutableSensorRepairState *, void))(v11 + 16))(v11, v12, 0);

LABEL_10:
  }
}

- (id)_repairStateBackgroundTask
{
  objc_initWeak(&location, self);
  int v2 = [LACBackgroundTask alloc];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__LACDTOSensorRepairStateProviderTaskDecorator__repairStateBackgroundTask__block_invoke;
  v5[3] = &unk_2653B5A38;
  objc_copyWeak(&v6, &location);
  id v3 = [(LACBackgroundTask *)v2 initWithIdentifier:@"RepairStateQuery" worker:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __74__LACDTOSensorRepairStateProviderTaskDecorator__repairStateBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 1);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__LACDTOSensorRepairStateProviderTaskDecorator__repairStateBackgroundTask__block_invoke_2;
    v7[3] = &unk_2653B7130;
    id v8 = v3;
    [v6 fetchRepairStateWithCompletion:v7];
  }
}

void __74__LACDTOSensorRepairStateProviderTaskDecorator__repairStateBackgroundTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [LACBackgroundTaskResult alloc];
  if (v5) {
    uint64_t v8 = [(LACBackgroundTaskResult *)v7 initWithError:v5];
  }
  else {
    uint64_t v8 = [(LACBackgroundTaskResult *)v7 initWithValue:v10];
  }
  int v9 = (void *)v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v8);
}

@end