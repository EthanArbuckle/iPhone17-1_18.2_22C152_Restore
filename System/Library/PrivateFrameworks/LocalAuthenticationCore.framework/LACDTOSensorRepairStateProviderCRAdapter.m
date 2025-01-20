@interface LACDTOSensorRepairStateProviderCRAdapter
- (LACDTOSensorRepairStateProviderCRAdapter)initWithReplyQueue:(id)a3;
- (void)_fetchRepairStateWithCompletion:(id)a3;
- (void)dealloc;
- (void)fetchRepairStateWithCompletion:(id)a3;
@end

@implementation LACDTOSensorRepairStateProviderCRAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_254F14000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ will dealloc", (uint8_t *)&v2, 0xCu);
}

- (LACDTOSensorRepairStateProviderCRAdapter)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LACDTOSensorRepairStateProviderCRAdapter;
  v6 = [(LACDTOSensorRepairStateProviderCRAdapter *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:v9];
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)fetchRepairStateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke;
  block[3] = &unk_2653B66E8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke(uint64_t a1)
{
  int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke_2;
    v4[3] = &unk_2653B66C0;
    objc_copyWeak(&v6, v2);
    id v5 = *(id *)(a1 + 32);
    [WeakRetained _fetchRepairStateWithCompletion:v4];

    objc_destroyWeak(&v6);
  }
}

void __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[2];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke_3;
    v10[3] = &unk_2653B6698;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v14);
  }
}

void __75__LACDTOSensorRepairStateProviderCRAdapter_fetchRepairStateWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_fetchRepairStateWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, LACDTOMutableSensorRepairState *, void))a3;
  if (CoreRepairCoreLibraryCore() && CoreRepairCoreLibraryCore() && getCRIsSelfRepairedComponentSymbolLoc())
  {
    id v5 = LACLogDTOSensor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start self-repair query", (uint8_t *)&v14, 0xCu);
    }

    id v6 = +[LACDTOSignpostEvent repairStatusQueryWillStart];
    [v6 send];

    uint64_t v7 = __76__LACDTOSensorRepairStateProviderCRAdapter__fetchRepairStateWithCompletion___block_invoke();
    id v8 = +[LACDTOSignpostEvent repairStatusQueryDidFinish];
    [v8 send];

    id v9 = LACLogDTOSensor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [NSNumber numberWithBool:v7];
      int v14 = 138543618;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish self-repair query with result %@", (uint8_t *)&v14, 0x16u);
    }
    if (v7) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = [[LACDTOMutableSensorRepairState alloc] initWithFlag:v11];
    v4[2](v4, v12, 0);
  }
  else
  {
    id v12 = +[LACError errorWithCode:-1020 debugDescription:@"Required Core Repair dependency was not found"];
    id v13 = LACLogDTOSensor();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(LACDTOSensorRepairStateProviderCRAdapter *)(uint64_t)self _fetchRepairStateWithCompletion:v13];
    }

    ((void (**)(id, LACDTOMutableSensorRepairState *, LACDTOMutableSensorRepairState *))v4)[2](v4, 0, v12);
  }
}

uint64_t __76__LACDTOSensorRepairStateProviderCRAdapter__fetchRepairStateWithCompletion___block_invoke()
{
  if (+[LACMobileGestalt deviceHasFaceID])
  {
    uint64_t v0 = 1027;
  }
  else
  {
    uint64_t result = +[LACMobileGestalt deviceHasTouchID];
    if (!result) {
      return result;
    }
    uint64_t v0 = 1028;
  }
  return soft_CRIsSelfRepairedComponent(v0);
}

- (void)_fetchRepairStateWithCompletion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed %{public}@", (uint8_t *)&v3, 0x16u);
}

@end