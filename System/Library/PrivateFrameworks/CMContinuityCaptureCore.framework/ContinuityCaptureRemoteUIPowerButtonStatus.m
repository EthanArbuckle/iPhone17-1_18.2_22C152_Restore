@interface ContinuityCaptureRemoteUIPowerButtonStatus
+ (id)sharedInstance;
+ (void)invalidate;
- (BOOL)invalidated;
- (BOOL)powerButtonPressed;
- (ContinuityCaptureRemoteUIPowerButtonStatus)initWithQueue:(id)a3;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
- (void)setupPowerButtonMonitor;
@end

@implementation ContinuityCaptureRemoteUIPowerButtonStatus

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_7);
  }
  v2 = (void *)_powerButtonStatus;
  return v2;
}

uint64_t __60__ContinuityCaptureRemoteUIPowerButtonStatus_sharedInstance__block_invoke()
{
  v0 = [ContinuityCaptureRemoteUIPowerButtonStatus alloc];
  _powerButtonStatus = [(ContinuityCaptureRemoteUIPowerButtonStatus *)v0 initWithQueue:MEMORY[0x263EF83A0]];
  return MEMORY[0x270F9A758]();
}

+ (void)invalidate
{
  if (([(id)_powerButtonStatus invalidated] & 1) == 0)
  {
    [(id)_powerButtonStatus invalidate];
    v2 = (void *)_powerButtonStatus;
    [v2 setInvalidated:1];
  }
}

- (void)invalidate
{
  hidEventSystemClient = self->_hidEventSystemClient;
  if (hidEventSystemClient) {
    [(HIDEventSystemClient *)hidEventSystemClient cancel];
  }
}

- (ContinuityCaptureRemoteUIPowerButtonStatus)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ContinuityCaptureRemoteUIPowerButtonStatus;
  v6 = [(ContinuityCaptureRemoteUIPowerButtonStatus *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_alloc_init(ContinuityCaptureButtonPressTracker);
    hidButtonTracker = v7->_hidButtonTracker;
    v7->_hidButtonTracker = v8;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    queue = v7->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__ContinuityCaptureRemoteUIPowerButtonStatus_initWithQueue___block_invoke;
    v12[3] = &unk_264C990F8;
    objc_copyWeak(&v13, &location);
    dispatch_async(queue, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __60__ContinuityCaptureRemoteUIPowerButtonStatus_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setupPowerButtonMonitor];
    id WeakRetained = v2;
  }
}

- (void)setupPowerButtonMonitor
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (!self->_hidEventSystemClient)
  {
    v3 = (HIDEventSystemClient *)[objc_alloc(MEMORY[0x263F41DD8]) initWithType:1];
    hidEventSystemClient = self->_hidEventSystemClient;
    self->_hidEventSystemClient = v3;

    if (self->_hidEventSystemClient)
    {
      id v5 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = self->_hidEventSystemClient;
        *(_DWORD *)buf = 138412546;
        v18 = self;
        __int16 v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ hidEventSystemClient: %@", buf, 0x16u);
      }

      [(HIDEventSystemClient *)self->_hidEventSystemClient setMatching:&unk_26E96A840];
      v7 = self->_hidEventSystemClient;
      v8 = dispatch_get_global_queue(0, 0);
      [(HIDEventSystemClient *)v7 setDispatchQueue:v8];

      v9 = self->_hidEventSystemClient;
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      id v13 = __69__ContinuityCaptureRemoteUIPowerButtonStatus_setupPowerButtonMonitor__block_invoke;
      v14 = &unk_264C99F08;
      objc_copyWeak(&v15, &location);
      [(HIDEventSystemClient *)v9 setEventHandler:&v11];
      [(HIDEventSystemClient *)self->_hidEventSystemClient activate];
      objc_destroyWeak(&v15);
    }
    else
    {
      v10 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = self;
        _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ hidEventSystemClient failure ", buf, 0xCu);
      }
    }
  }
  objc_destroyWeak(&location);
}

void __69__ContinuityCaptureRemoteUIPowerButtonStatus_setupPowerButtonMonitor__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 type] == 3)
  {
    uint64_t v5 = [v4 integerValueForField:196608];
    v6 = (void *)[v4 integerValueForField:196609];
    v7 = (void *)[v4 integerValueForField:196610];
    v8 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained(v8);
        *(_DWORD *)buf = 138413314;
        id v16 = v11;
        __int16 v17 = 1024;
        int v18 = [v4 type];
        __int16 v19 = 2048;
        uint64_t v20 = v5;
        __int16 v21 = 2048;
        v22 = v6;
        __int16 v23 = 2048;
        v24 = v7;
        _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ type: %d uP: %ld u: %ld down: %ld", buf, 0x30u);
      }
      if (v5 == 12)
      {
        uint64_t v12 = WeakRetained[1];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __69__ContinuityCaptureRemoteUIPowerButtonStatus_setupPowerButtonMonitor__block_invoke_40;
        block[3] = &unk_264C99EE0;
        objc_copyWeak(v14, v8);
        v14[1] = v6;
        v14[2] = v7;
        dispatch_async(v12, block);
        objc_destroyWeak(v14);
      }
    }
  }
}

void __69__ContinuityCaptureRemoteUIPowerButtonStatus_setupPowerButtonMonitor__block_invoke_40(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      uint64_t v6 = *((void *)WeakRetained + 3);
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ Processing consumer HID event, _hidPowerButtonTracker %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [*((id *)WeakRetained + 3) registerCordPress:*(void *)(a1 + 40) down:*(void *)(a1 + 48) != 0];
    BOOL v7 = !*(void *)(a1 + 48)
      && *(void *)(a1 + 40) == 48
      && ([*((id *)WeakRetained + 3) valid] & 1) != 0;
    [WeakRetained willChangeValueForKey:@"powerButtonPressed"];
    *((unsigned char *)WeakRetained + 32) = v7;
    [WeakRetained didChangeValueForKey:@"powerButtonPressed"];
    if (!*(void *)(a1 + 48) && *(void *)(a1 + 40) == 48) {
      [*((id *)WeakRetained + 3) clear];
    }
  }
}

- (BOOL)powerButtonPressed
{
  return self->_powerButtonPressed;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidButtonTracker, 0);
  objc_storeStrong((id *)&self->_hidEventSystemClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end