@interface DKNotificationKeybagLockMonitor
@end

@implementation DKNotificationKeybagLockMonitor

uint64_t __61___DKNotificationKeybagLockMonitor_receiveNotificationEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveNotificationEvent:*(void *)(a1 + 40)];
}

uint64_t __39___DKNotificationKeybagLockMonitor_log__block_invoke()
{
  log_log_0 = (uint64_t)os_log_create("com.apple.coreduet.monitors", "_DKNotificationKeybagLockMonitor");
  return MEMORY[0x270F9A758]();
}

id __41___DKNotificationKeybagLockMonitor_start__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)_DKNotificationKeybagLockMonitor;
  id result = objc_msgSendSuper2(&v3, sel__instantMonitorNeedsActivation);
  if (result) {
    return (id)[*(id *)(a1 + 32) _activate];
  }
  return result;
}

void __45___DKNotificationKeybagLockMonitor__activate__block_invoke(uint64_t a1)
{
  v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225002000, v2, OS_LOG_TYPE_DEFAULT, "Checking current state of Device.KeybagLocked stream", buf, 2u);
  }

  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F2A8B0]) initWithStartDate:0 endDate:0 maxEvents:1 lastN:1 reversed:0];
  v4 = BiomeLibrary();
  v5 = [v4 Device];
  v6 = [v5 KeybagLocked];
  v7 = [v6 publisherWithOptions:v3];

  uint64_t v25 = 0;
  v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  *(void *)buf = 0;
  v20 = buf;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45___DKNotificationKeybagLockMonitor__activate__block_invoke_2;
  v18[3] = &unk_2647149D8;
  v18[5] = buf;
  v18[6] = &v25;
  v18[4] = *(void *)(a1 + 32);
  id v8 = (id)[v7 sinkWithCompletion:&__block_literal_global_23 receiveInput:v18];
  double Current = CFAbsoluteTimeGetCurrent();
  v10 = [MEMORY[0x263F08AB0] processInfo];
  [v10 systemUptime];
  double v12 = Current - v11;

  v13 = (void *)*((void *)v20 + 5);
  if (!v13 || ([v13 starting] & 1) == 0 && v26[3] < v12)
  {
    id v14 = objc_alloc(MEMORY[0x263F2A088]);
    v15 = (void *)[v14 initWithStarting:MEMORY[0x263EFFA88]];
    [*(id *)(a1 + 32) _updateWithKeybagLocked:v15 timestamp:v12];
    v16 = (void *)*((void *)v20 + 5);
    *((void *)v20 + 5) = v15;
    id v17 = v15;

    v26[3] = v12;
  }
  if ([*((id *)v20 + 5) isEqual:*(void *)(a1 + 40)])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *((id *)v20 + 5));
    *(double *)(*(void *)(a1 + 32) + 160) = v26[3];
  }
  else
  {
    [*(id *)(a1 + 32) _updateWithKeybagLocked:*(void *)(a1 + 40) timestamp:*(double *)(a1 + 48)];
  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v25, 8);
}

void __45___DKNotificationKeybagLockMonitor__activate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [v3 timestamp];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  id v8 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v3 eventBody];
    [v3 timestamp];
    int v11 = 138543618;
    double v12 = v9;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    _os_log_impl(&dword_225002000, v8, OS_LOG_TYPE_DEFAULT, "Loaded last Device.KeybagLocked event %{public}@ at %f", (uint8_t *)&v11, 0x16u);
  }
}

id __40___DKNotificationKeybagLockMonitor_stop__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)_DKNotificationKeybagLockMonitor;
  id result = objc_msgSendSuper2(&v3, sel__instantMonitorNeedsDeactivation);
  if (result) {
    return (id)[*(id *)(a1 + 32) _deactivate];
  }
  return result;
}

void __47___DKNotificationKeybagLockMonitor__deactivate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 176);
  *(void *)(v2 + 176) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = 0;

  *(void *)(*(void *)(a1 + 32) + 160) = 0;
}

uint64_t __73___DKNotificationKeybagLockMonitor__enqueueKeybagLockedUpdate_timestamp___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(double *)(v1 + 160) <= *(double *)(result + 48))
  {
    uint64_t v2 = (double *)result;
    id result = [*(id *)(v1 + 168) isEqual:*(void *)(result + 40)];
    if ((result & 1) == 0)
    {
      objc_super v3 = (void *)*((void *)v2 + 4);
      uint64_t v4 = *((void *)v2 + 5);
      double v5 = v2[6];
      return [v3 _updateWithKeybagLocked:v4 timestamp:v5];
    }
  }
  return result;
}

@end