@interface IRProxcontrolBridge
- (IRProxcontrolBridge)initWithDelegate:(id)a3 name:(id)a4;
- (IRProximityBridgeDelegateProtocol)delegate;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (PCLockscreenControlsObserver)pclControlsObserver;
- (void)_createProxControlObserver;
- (void)_runProxControlObserver;
- (void)invalidate;
- (void)run;
- (void)setDelegate:(id)a3;
- (void)setName:(id)a3;
- (void)setPclControlsObserver:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IRProxcontrolBridge

- (IRProxcontrolBridge)initWithDelegate:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IRProxcontrolBridge;
  v8 = [(IRProxcontrolBridge *)&v12 self];

  if (v8)
  {
    [(IRProxcontrolBridge *)v8 setName:v7];
    [(IRProxcontrolBridge *)v8 setDelegate:v6];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.intelligentroutingd.proxcontrol-bridge", v9);
    [(IRProxcontrolBridge *)v8 setQueue:v10];
  }
  return v8;
}

- (void)_createProxControlObserver
{
  v3 = (void *)[(NSString *)self->_name copy];
  v4 = [(IRProxcontrolBridge *)self pclControlsObserver];

  if (!v4)
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc_init(MEMORY[0x263F62568]);
    [(IRProxcontrolBridge *)self setPclControlsObserver:v5];

    queue = self->_queue;
    id v7 = [(IRProxcontrolBridge *)self pclControlsObserver];
    [v7 setDispatchQueue:queue];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __49__IRProxcontrolBridge__createProxControlObserver__block_invoke;
    v19[3] = &unk_2653A1148;
    objc_copyWeak(&v21, &location);
    id v8 = v3;
    id v20 = v8;
    v9 = [(IRProxcontrolBridge *)self pclControlsObserver];
    [v9 setDeviceLost:v19];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_17;
    v16[3] = &unk_2653A1148;
    objc_copyWeak(&v18, &location);
    id v10 = v8;
    id v17 = v10;
    v11 = [(IRProxcontrolBridge *)self pclControlsObserver];
    [v11 setDeviceUpdated:v16];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_18;
    v13[3] = &unk_2653A1170;
    objc_copyWeak(&v15, &location);
    id v14 = v10;
    objc_super v12 = [(IRProxcontrolBridge *)self pclControlsObserver];
    [v12 setInvalidationHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    dispatch_assert_queue_V2(v6);

    id v7 = [IRNearbyDeviceDO alloc];
    id v8 = [v3 mediaRouteID];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x263EFF910] now];
    v11 = [(IRNearbyDeviceDO *)v7 initWithRange:0 idsIdentifier:v8 mediaRemoteIdentifier:v9 proximityType:v10 measurementDate:1000.0];

    objc_super v12 = [v5 delegate];
    v13 = [v5 name];
    [v12 didRemoveDevice:v11 withName:v13];

    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
      __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_cold_1();
    }
  }
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    dispatch_assert_queue_V2(v6);

    id v7 = [v3 distance];

    if (v7)
    {
      id v8 = [IRNearbyDeviceDO alloc];
      uint64_t v9 = [v3 distance];
      [v9 doubleValue];
      double v11 = v10;
      objc_super v12 = [v3 mediaRouteID];
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = [MEMORY[0x263EFF910] now];
      id v15 = [(IRNearbyDeviceDO *)v8 initWithRange:0 idsIdentifier:v12 mediaRemoteIdentifier:v13 proximityType:v14 measurementDate:v11];

      v16 = [v5 delegate];
      [v16 didUpdateNearbyDevice:v15 withName:*(void *)(a1 + 32)];
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
      __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_17_cold_1();
    }
  }
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    dispatch_assert_queue_V2(v6);

    id v7 = [v5 delegate];
    [v7 didBridgeFail:*(void *)(a1 + 32)];

    id v8 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_18_cold_1(v8, v3);
    }
  }
}

- (void)_runProxControlObserver
{
  objc_initWeak(&location, self);
  id v3 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25418E000, v3, OS_LOG_TYPE_INFO, "#proxcontrol-bridge, Starting proximity control session", buf, 2u);
  }
  v4 = [(IRProxcontrolBridge *)self pclControlsObserver];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__IRProxcontrolBridge__runProxControlObserver__block_invoke;
  v5[3] = &unk_2653A0440;
  objc_copyWeak(&v6, &location);
  [v4 activateWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__IRProxcontrolBridge__runProxControlObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained delegate];
    if (v6)
    {
      id v7 = [v5 queue];
      dispatch_assert_queue_V2(v7);

      id v8 = [v5 name];
      if (v3)
      {
        [v6 didBridgeFail:v8];

        uint64_t v9 = (void *)*MEMORY[0x263F50090];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
          __46__IRProxcontrolBridge__runProxControlObserver__block_invoke_cold_1(v9, v3);
        }
      }
      else
      {
        [v6 didBridgeRunSuccesfully:v8];

        double v10 = *MEMORY[0x263F50090];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v11 = 0;
          _os_log_impl(&dword_25418E000, v10, OS_LOG_TYPE_INFO, "#proxcontrol-bridge, Activated PCLockscreenControlsObserver", v11, 2u);
        }
      }
    }
  }
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  id v3 = [(IRProxcontrolBridge *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__IRProxcontrolBridge_invalidate__block_invoke;
  v4[3] = &unk_26539FA70;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __33__IRProxcontrolBridge_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained pclControlsObserver];
    [v2 invalidate];

    [v3 setPclControlsObserver:0];
    id WeakRetained = v3;
  }
}

- (void)run
{
  objc_initWeak(&location, self);
  id v3 = [(IRProxcontrolBridge *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__IRProxcontrolBridge_run__block_invoke;
  v4[3] = &unk_26539FA70;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __26__IRProxcontrolBridge_run__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained pclControlsObserver];

    id WeakRetained = v3;
    if (!v2)
    {
      [v3 _createProxControlObserver];
      [v3 _runProxControlObserver];
      id WeakRetained = v3;
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (IRProximityBridgeDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IRProximityBridgeDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (PCLockscreenControlsObserver)pclControlsObserver
{
  return self->_pclControlsObserver;
}

- (void)setPclControlsObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pclControlsObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_name, 0);
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEBUG, "#proxcontrol-bridge, PCLockscreenControlsObserver:deviceLost: %@", v1, 0xCu);
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_17_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_25418E000, v0, OS_LOG_TYPE_DEBUG, "#proxcontrol-bridge, PCLockscreenControlsObserver:deviceUpdated: %@", v1, 0xCu);
}

void __49__IRProxcontrolBridge__createProxControlObserver__block_invoke_18_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_25418E000, v5, v6, "#proxcontrol-bridge, [ErrorId - Prox control invalidated] PCLockscreenControlsObserver:invalidationHandler: %@", v7, v8, v9, v10, v11);
}

void __46__IRProxcontrolBridge__runProxControlObserver__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_25418E000, v5, v6, "#proxcontrol-bridge, [ErrorId - Prox Control activation error] PCLockscreenControlsObserver:activateWithCompletion: %@", v7, v8, v9, v10, v11);
}

@end