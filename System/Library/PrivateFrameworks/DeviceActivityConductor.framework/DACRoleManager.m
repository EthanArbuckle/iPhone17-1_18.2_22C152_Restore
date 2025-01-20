@interface DACRoleManager
- (DACRoleManager)initWithDelegate:(id)a3 lastLeaderAt:(id)a4 queue:(id)a5;
- (void)_notifyDelegate;
- (void)_roleChanged:(uint64_t)a1;
- (void)dealloc;
- (void)requestSpeakerGroupLeaderRole;
- (void)roleChanged:(id)a3;
@end

@implementation DACRoleManager

- (DACRoleManager)initWithDelegate:(id)a3 lastLeaderAt:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)DACRoleManager;
  v11 = [(DACRoleManager *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("com.apple.DeviceActivityConductor.DACRoleManager.delegate", v13, v10);
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.DeviceActivityConductor.DACRoleManager", v16);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v12->_lastLeaderAt, a4);
    uint64_t v19 = +[DACDeviceRole unknownRole];
    role = v12->_role;
    v12->_role = (DACDeviceRole *)v19;

    fallbackTimer = v12->_fallbackTimer;
    v12->_fallbackTimer = 0;

    *(_WORD *)&v12->_shouldAttemptReconnect = 0;
    v12->_resetNotifyToken = -1;
    v22 = v12->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__DACRoleManager_initWithDelegate_lastLeaderAt_queue___block_invoke;
    block[3] = &unk_264BDCC08;
    v25 = v12;
    dispatch_async(v22, block);
  }
  return v12;
}

void __54__DACRoleManager_initWithDelegate_lastLeaderAt_queue___block_invoke(uint64_t a1)
{
  -[DACRoleManager _notifyDelegate](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 56));
  }
  else {
    id WeakRetained = 0;
  }
}

- (void)_notifyDelegate
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v3 = *(id *)(a1 + 48);
    v4 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__DACRoleManager__notifyDelegate__block_invoke;
    block[3] = &unk_264BDCB68;
    id v8 = WeakRetained;
    uint64_t v9 = a1;
    id v10 = v3;
    id v5 = v3;
    id v6 = WeakRetained;
    dispatch_async(v4, block);
  }
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_resetNotifyToken)) {
    notify_cancel(self->_resetNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)DACRoleManager;
  [(DACRoleManager *)&v3 dealloc];
}

- (void)requestSpeakerGroupLeaderRole
{
  objc_super v3 = [MEMORY[0x263EFF910] now];
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DACRoleManager_requestSpeakerGroupLeaderRole__block_invoke;
  v6[3] = &unk_264BDC9E0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

void __47__DACRoleManager_requestSpeakerGroupLeaderRole__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (objc_storeStrong((id *)(v2 + 40), *(id *)(a1 + 40)), (uint64_t v3 = *(void *)(a1 + 32)) != 0))
  {
    if (*(unsigned char *)(v3 + 9) || *(unsigned char *)(v3 + 8))
    {
      objc_initWeak(&location, (id)v3);
      v4 = *(id **)(a1 + 32);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __47__DACRoleManager_requestSpeakerGroupLeaderRole__block_invoke_2;
      v9[3] = &unk_264BDCC30;
      objc_copyWeak(&v10, &location);
      if (v4)
      {
        id v5 = v9;
        id WeakRetained = objc_loadWeakRetained(v4 + 7);
        v4 = [WeakRetained remoteObjectProxyWithErrorHandler:v5];
      }
      [v4 requestLeaderRole:*(void *)(a1 + 40)];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      return;
    }
    id v7 = *(void **)(v3 + 48);
  }
  else
  {
    id v7 = 0;
  }
  id v8 = -[DACDeviceRole _initWithRoleFlags:]([DACDeviceRole alloc], "_initWithRoleFlags:", [v7 flags] & 0xFFFFFFFFFFFFFFFCLL | 1);
  -[DACRoleManager _roleChanged:](*(void *)(a1 + 32), v8);
}

- (void)_roleChanged:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id v5 = *(id *)(a1 + 48);
    objc_storeStrong((id *)(a1 + 48), a2);
    if (([v4 isEqual:v5] & 1) == 0)
    {
      id v6 = DACLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134218498;
        uint64_t v8 = a1;
        __int16 v9 = 2114;
        id v10 = v4;
        __int16 v11 = 2114;
        id v12 = v5;
        _os_log_impl(&dword_2330F4000, v6, OS_LOG_TYPE_DEFAULT, "%p role changing to %{public}@ from %{public}@", (uint8_t *)&v7, 0x20u);
      }

      -[DACRoleManager _notifyDelegate](a1);
    }
  }
}

void __47__DACRoleManager_requestSpeakerGroupLeaderRole__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = DACLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218242;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_2330F4000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACRoleManager remote proxy for leader request: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)roleChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (OS_dispatch_source *)a3;
  if (self && self->_fallbackTimer)
  {
    id v5 = DACLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_2330F4000, v5, OS_LOG_TYPE_DEFAULT, "%p will cancel fallback due to role %@ from daemon", (uint8_t *)&v9, 0x16u);
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v6 = self->_fallbackTimer;
    int v7 = DACLogForCategory(5);
    fallbackTimer = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134218240;
        id v10 = self;
        __int16 v11 = 2048;
        id v12 = v6;
        _os_log_impl(&dword_2330F4000, fallbackTimer, OS_LOG_TYPE_DEFAULT, "%p removing fallback timer %p", (uint8_t *)&v9, 0x16u);
      }

      dispatch_source_cancel((dispatch_source_t)v6);
      fallbackTimer = self->_fallbackTimer;
      self->_fallbackTimer = 0;
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_error_impl(&dword_2330F4000, fallbackTimer, OS_LOG_TYPE_ERROR, "%p no fallback timer to cancel", (uint8_t *)&v9, 0xCu);
    }
  }
  -[DACRoleManager _roleChanged:]((uint64_t)self, v4);
}

uint64_t __33__DACRoleManager__notifyDelegate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) roleManager:*(void *)(a1 + 40) roleChanged:*(void *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTimer, 0);
  objc_destroyWeak((id *)&self->_currentConnection);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_lastLeaderAt, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end