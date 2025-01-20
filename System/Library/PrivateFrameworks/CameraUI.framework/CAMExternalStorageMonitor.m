@interface CAMExternalStorageMonitor
+ (id)_stringFromMonitoringState:(unint64_t)a3;
- (AVExternalStorageDeviceDiscoverySession)_externalStorageDiscoverySession;
- (BOOL)_hasPendingChangesSinceLastDelegateCall;
- (BOOL)_isObservingKVO;
- (BOOL)hasExternalStorageNotRecommendedForCapture;
- (CAMExternalStorageMonitor)init;
- (CAMExternalStorageMonitorDelegate)delegate;
- (NSArray)connectedStorageDevices;
- (OS_dispatch_queue)_authorizationQueue;
- (id)_monitoringContext;
- (unint64_t)monitoringState;
- (void)_beginMonitoring;
- (void)_endMonitoring;
- (void)_logMonitoringChangeFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)_resumeMonitoring;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setMonitoringState:(unint64_t)a3;
- (void)set_externalStorageDiscoverySession:(id)a3;
- (void)set_hasPendingChangesSinceLastDelegateCall:(BOOL)a3;
- (void)set_isObservingKVO:(BOOL)a3;
- (void)set_monitoringContext:(id)a3;
@end

@implementation CAMExternalStorageMonitor

- (CAMExternalStorageMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)CAMExternalStorageMonitor;
  v2 = [(CAMExternalStorageMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.external-storage-auth-queue", v3);
    authorizationQueue = v2->__authorizationQueue;
    v2->__authorizationQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setMonitoringState:(unint64_t)a3
{
  unint64_t monitoringState = self->_monitoringState;
  if (monitoringState != a3)
  {
    self->_unint64_t monitoringState = a3;
    [(CAMExternalStorageMonitor *)self _logMonitoringChangeFromState:monitoringState toState:a3];
    if (a3 == 1)
    {
      if ([(CAMExternalStorageMonitor *)self _isObservingKVO])
      {
        [(CAMExternalStorageMonitor *)self _resumeMonitoring];
      }
      else
      {
        [(CAMExternalStorageMonitor *)self _beginMonitoring];
      }
    }
    else if (!a3)
    {
      [(CAMExternalStorageMonitor *)self _endMonitoring];
    }
  }
}

- (void)_endMonitoring
{
  if ([(CAMExternalStorageMonitor *)self _isObservingKVO])
  {
    v3 = [(CAMExternalStorageMonitor *)self _externalStorageDiscoverySession];
    [v3 removeObserver:self forKeyPath:@"externalStorageDevices"];

    [(CAMExternalStorageMonitor *)self set_isObservingKVO:0];
  }
  dispatch_queue_t v4 = [(CAMExternalStorageMonitor *)self delegate];
  id v5 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  [v4 externalStorageMonitor:self didChangeConnectedStorageDevices:v5];

  [(CAMExternalStorageMonitor *)self set_externalStorageDiscoverySession:0];
}

- (void)_beginMonitoring
{
  v3 = [MEMORY[0x263EFA708] sharedSession];
  [(CAMExternalStorageMonitor *)self set_externalStorageDiscoverySession:v3];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke;
  aBlock[3] = &unk_263FA0208;
  aBlock[4] = self;
  dispatch_queue_t v4 = _Block_copy(aBlock);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke_4;
  v11 = &unk_263FA3140;
  id v12 = v4;
  id v5 = v4;
  v6 = _Block_copy(&v8);
  objc_super v7 = [(CAMExternalStorageMonitor *)self _authorizationQueue];
  dispatch_async(v7, v6);
}

void __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) monitoringState] == 1)
  {
    if ([*(id *)(a1 + 32) _isObservingKVO])
    {
      v2 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "External Storage: skipping setting up KVO since we're already observing", (uint8_t *)&v7, 2u);
      }
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) _externalStorageDiscoverySession];
      [v5 addObserver:*(void *)(a1 + 32) forKeyPath:@"externalStorageDevices" options:5 context:0];

      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "set_isObservingKVO:", 1);
    }
  }
  else
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v4 = objc_msgSend((id)objc_opt_class(), "_stringFromMonitoringState:", objc_msgSend(*(id *)(a1 + 32), "monitoringState"));
      int v7 = 138543362;
      uint64_t v8 = v4;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "External Storage: skipping setting up KVO since we're not in a monitoring state (%{public}@)", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFA700] authorizationStatus];
  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = v2;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "External Storage: current authorization status %ld monitoring for updates", buf, 0xCu);
  }

  if (v2 == 3)
  {
    dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 32));
  }
  else if (!v2)
  {
    dispatch_queue_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "External Storage: requesting access", buf, 2u);
    }

    id v5 = (void *)MEMORY[0x263EFA700];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke_6;
    v6[3] = &unk_263FA1EE0;
    id v7 = *(id *)(a1 + 32);
    [v5 requestAccessWithCompletionHandler:v6];
  }
}

void __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke_6(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_queue_t v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"denied";
    if (a2) {
      id v5 = @"granted";
    }
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "External Storage: access %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (a2) {
    dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 32));
  }
}

- (void)_resumeMonitoring
{
  if ([(CAMExternalStorageMonitor *)self _hasPendingChangesSinceLastDelegateCall])
  {
    [(CAMExternalStorageMonitor *)self set_hasPendingChangesSinceLastDelegateCall:0];
    id v4 = [(CAMExternalStorageMonitor *)self delegate];
    v3 = [(CAMExternalStorageMonitor *)self connectedStorageDevices];
    [v4 externalStorageMonitor:self didChangeConnectedStorageDevices:v3];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a3, "isEqualToString:", @"externalStorageDevices", a4, a5, a6))
  {
    id v7 = [(CAMExternalStorageMonitor *)self _externalStorageDiscoverySession];
    uint64_t v8 = [v7 externalStorageDevices];

    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = [v8 count];
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "External Storage: list of devices updated, %ld connected devices", buf, 0xCu);
    }
    v24 = self;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v16, "isConnected", v24))
          {
            if ([v16 isNotRecommendedForCaptureUse])
            {
              v17 = (CAMExternalStorage *)os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
              {
                v18 = [v16 displayName];
                v19 = [v16 baseURL];
                *(_DWORD *)buf = 138543618;
                uint64_t v33 = (uint64_t)v18;
                __int16 v34 = 2114;
                v35 = v19;
                _os_log_impl(&dword_2099F8000, &v17->super, OS_LOG_TYPE_DEFAULT, "External Storage: ignoring not recommended storage device (%{public}@) on mount point %{public}@", buf, 0x16u);
              }
              char v13 = 1;
            }
            else
            {
              v17 = [[CAMExternalStorage alloc] initWithStorageDevice:v16];
              [v25 addObject:v17];
            }
          }
          else
          {
            v17 = (CAMExternalStorage *)os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
            {
              v20 = [v16 displayName];
              v21 = [v16 baseURL];
              *(_DWORD *)buf = 138543618;
              uint64_t v33 = (uint64_t)v20;
              __int16 v34 = 2114;
              v35 = v21;
              _os_log_impl(&dword_2099F8000, &v17->super, OS_LOG_TYPE_DEFAULT, "External Storage: ignoring disconnected storage device (%{public}@) on mount point %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v12);
    }
    else
    {
      char v13 = 0;
    }

    objc_storeStrong((id *)&v24->_connectedStorageDevices, v25);
    v24->_hasExternalStorageNotRecommendedForCapture = v13 & 1;
    uint64_t v22 = [(CAMExternalStorageMonitor *)v24 monitoringState];
    switch(v22)
    {
      case 2:
        goto LABEL_24;
      case 1:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __76__CAMExternalStorageMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_263FA0408;
        block[4] = v24;
        id v27 = v25;
        dispatch_async(MEMORY[0x263EF83A0], block);

        break;
      case 0:
LABEL_24:
        v23 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "External storage: devices where update while monitoring was paused", buf, 2u);
        }

        [(CAMExternalStorageMonitor *)v24 set_hasPendingChangesSinceLastDelegateCall:1];
        break;
    }
  }
}

void __76__CAMExternalStorageMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_hasPendingChangesSinceLastDelegateCall:", 0);
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 externalStorageMonitor:*(void *)(a1 + 32) didChangeConnectedStorageDevices:*(void *)(a1 + 40)];
}

- (void)_logMonitoringChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(id)objc_opt_class() _stringFromMonitoringState:a3];
    uint64_t v9 = [(id)objc_opt_class() _stringFromMonitoringState:a4];
    id v10 = [(CAMExternalStorageMonitor *)self _externalStorageDiscoverySession];
    uint64_t v11 = [v10 externalStorageDevices];
    int v12 = 138543874;
    char v13 = v8;
    __int16 v14 = 2114;
    v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = [v11 count];
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "External storage: monitoring state changed from (%{public}@) to (%{public}@), %ld connected devices", (uint8_t *)&v12, 0x20u);
  }
}

+ (id)_stringFromMonitoringState:(unint64_t)a3
{
  v3 = @"None";
  if (a3 == 2) {
    v3 = @"Paused";
  }
  if (a3 == 1) {
    return @"Monitoring";
  }
  else {
    return v3;
  }
}

- (CAMExternalStorageMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMExternalStorageMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)monitoringState
{
  return self->_monitoringState;
}

- (NSArray)connectedStorageDevices
{
  return self->_connectedStorageDevices;
}

- (BOOL)hasExternalStorageNotRecommendedForCapture
{
  return self->_hasExternalStorageNotRecommendedForCapture;
}

- (AVExternalStorageDeviceDiscoverySession)_externalStorageDiscoverySession
{
  return self->__externalStorageDiscoverySession;
}

- (void)set_externalStorageDiscoverySession:(id)a3
{
}

- (id)_monitoringContext
{
  return self->__monitoringContext;
}

- (void)set_monitoringContext:(id)a3
{
}

- (OS_dispatch_queue)_authorizationQueue
{
  return self->__authorizationQueue;
}

- (BOOL)_isObservingKVO
{
  return self->__isObservingKVO;
}

- (void)set_isObservingKVO:(BOOL)a3
{
  self->__isObservingKVO = a3;
}

- (BOOL)_hasPendingChangesSinceLastDelegateCall
{
  return self->__hasPendingChangesSinceLastDelegateCall;
}

- (void)set_hasPendingChangesSinceLastDelegateCall:(BOOL)a3
{
  self->__hasPendingChangesSinceLastDelegateCall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__authorizationQueue, 0);
  objc_storeStrong(&self->__monitoringContext, 0);
  objc_storeStrong((id *)&self->__externalStorageDiscoverySession, 0);
  objc_storeStrong((id *)&self->_connectedStorageDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end