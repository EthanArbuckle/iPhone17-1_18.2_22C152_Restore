@interface DIDeviceManager
- (DIDevice)currentDevice;
- (DIDeviceManager)initWithConnectionManager:(id)a3;
- (DIDeviceManagerDelegate)delegate;
- (DIXPCConnectionManager)connectionManager;
- (NSArray)devices;
- (void)didAddDevice:(id)a3;
- (void)didLoadDevices:(id)a3;
- (void)didRemoveDevice:(id)a3;
- (void)didUpdateDevice:(id)a3;
- (void)setCurrentDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3;
@end

@implementation DIDeviceManager

- (DIDeviceManager)initWithConnectionManager:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DIDeviceManager;
  v5 = [(DIDeviceManager *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    devices = v5->_devices;
    v5->_devices = (NSArray *)v6;

    id v8 = objc_storeWeak((id *)&v5->_connectionManager, v4);
    v9 = [v4 dispatcher];
    [v9 setDeviceListDelegate:v5];

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_connectionManager);
    v11 = [WeakRetained dispatcher];
    [v11 setDeviceStatusDelegate:v5];

    id v12 = objc_loadWeakRetained((id *)&v5->_connectionManager);
    v13 = [v12 manager];
    [v13 addCheckInObserver:v5];
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  v5 = DILogHandleDeviceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v15 = &stru_26FF62CC0;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", buf, 0x16u);
  }

  if (v4)
  {
    uint64_t v6 = [(DIDeviceManager *)self connectionManager];
    v7 = [v6 manager];
    id v8 = [v7 connection];
    v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_5];
    v10 = [(DIDeviceManager *)self connectionManager];
    v11 = [v10 manager];
    id v12 = [v11 clientContext];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __31__DIDeviceManager_setDelegate___block_invoke_2;
    v13[3] = &unk_2652FCC48;
    v13[4] = self;
    [v9 loadDevicesWithContext:v12 completionHandler:v13];
  }
}

void __31__DIDeviceManager_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = DILogHandleDeviceManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = [v2 localizedDescription];
    int v5 = 138412546;
    uint64_t v6 = &stru_26FF62CC0;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_ERROR, "%@Set delegate proxy error: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __31__DIDeviceManager_setDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v7 = DILogHandleDeviceManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 localizedDescription];
      int v9 = 138412546;
      v10 = &stru_26FF62CC0;
      __int16 v11 = 2112;
      id v12 = v8;
      _os_log_impl(&dword_24D00D000, v7, OS_LOG_TYPE_ERROR, "%@Set delegate load devices error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (v5)
    {
      [*(id *)(a1 + 32) didLoadDevices:v5];
      goto LABEL_7;
    }
    __int16 v7 = DILogHandleDeviceManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      v10 = &stru_26FF62CC0;
      _os_log_impl(&dword_24D00D000, v7, OS_LOG_TYPE_ERROR, "%@Set delegate load devices. Devices are nil", (uint8_t *)&v9, 0xCu);
    }
  }

LABEL_7:
}

- (void)setCurrentDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (DIDevice *)a3;
  id v5 = DILogHandleDeviceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = &stru_26FF62CC0;
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Setting Current Device: %@", (uint8_t *)&v7, 0x16u);
  }

  currentDevice = self->_currentDevice;
  self->_currentDevice = v4;
}

- (NSArray)devices
{
  v3 = self->_devices;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSArray *)self->_devices copy];
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (void)didAddDevice:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DILogHandleDeviceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = &stru_26FF62CC0;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Did add device %@", buf, 0x16u);
  }

  id v6 = [(DIDeviceManager *)self devices];
  objc_sync_enter(v6);
  int v7 = [(DIDeviceManager *)self connectionManager];
  [v4 setConnectionManager:v7];

  id v8 = [(DIDeviceManager *)self devices];
  __int16 v9 = [v8 arrayByAddingObject:v4];
  [(DIDeviceManager *)self setDevices:v9];

  if ([v4 isCurrentDevice]) {
    [(DIDeviceManager *)self setCurrentDevice:v4];
  }
  objc_sync_exit(v6);

  v10 = [(DIDeviceManager *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(DIDeviceManager *)self connectionManager];
    uint64_t v13 = [v12 manager];
    v14 = [v13 clientQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __32__DIDeviceManager_didAddDevice___block_invoke;
    v15[3] = &unk_2652FC928;
    v15[4] = self;
    id v16 = v4;
    +[DIUtilities onQueue:v14 block:v15];
  }
}

void __32__DIDeviceManager_didAddDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 manager:*(void *)(a1 + 32) didAddDevice:*(void *)(a1 + 40)];
}

- (void)didLoadDevices:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DILogHandleDeviceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = &stru_26FF62CC0;
    __int16 v40 = 2048;
    uint64_t v41 = [v4 count];
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Did Load Devices %lu", buf, 0x16u);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v33;
    *(void *)&long long v8 = 138412546;
    long long v26 = v8;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * v10);
        id v12 = DILogHandleDeviceManager();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v39 = &stru_26FF62CC0;
          __int16 v40 = 2112;
          uint64_t v41 = v11;
          _os_log_impl(&dword_24D00D000, v12, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);
        }

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [(DIDeviceManager *)self devices];
  objc_sync_enter(v13);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
        __int16 v19 = [(DIDeviceManager *)self connectionManager];
        [v18 setConnectionManager:v19];

        id v20 = [v18 stateExpiration];
        [v18 setStateExpiration:v20];

        if ([v18 isCurrentDevice]) {
          [(DIDeviceManager *)self setCurrentDevice:v18];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v15);
  }

  [(DIDeviceManager *)self setDevices:v14];
  objc_sync_exit(v13);

  uint64_t v21 = [(DIDeviceManager *)self delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    v23 = [(DIDeviceManager *)self connectionManager];
    v24 = [v23 manager];
    v25 = [v24 clientQueue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __34__DIDeviceManager_didLoadDevices___block_invoke;
    v27[3] = &unk_2652FCA58;
    v27[4] = self;
    +[DIUtilities onQueue:v25 block:v27];
  }
}

void __34__DIDeviceManager_didLoadDevices___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 managerDidUpdateDevices:*(void *)(a1 + 32)];
}

- (void)didRemoveDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DILogHandleDeviceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v19 = &stru_26FF62CC0;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Did remove device %@", buf, 0x16u);
  }

  id v6 = [(DIDeviceManager *)self devices];
  objc_sync_enter(v6);
  uint64_t v7 = (void *)MEMORY[0x263EFF980];
  long long v8 = [(DIDeviceManager *)self devices];
  uint64_t v9 = [v7 arrayWithArray:v8];

  [v9 removeObject:v4];
  uint64_t v10 = (void *)[v9 copy];
  [(DIDeviceManager *)self setDevices:v10];

  if ([v4 isCurrentDevice]) {
    [(DIDeviceManager *)self setCurrentDevice:0];
  }

  objc_sync_exit(v6);
  uint64_t v11 = [(DIDeviceManager *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(DIDeviceManager *)self connectionManager];
    id v14 = [v13 manager];
    uint64_t v15 = [v14 clientQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __35__DIDeviceManager_didRemoveDevice___block_invoke;
    v16[3] = &unk_2652FC928;
    v16[4] = self;
    id v17 = v4;
    +[DIUtilities onQueue:v15 block:v16];
  }
}

void __35__DIDeviceManager_didRemoveDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 manager:*(void *)(a1 + 32) didRemoveDevice:*(void *)(a1 + 40)];
}

- (void)didUpdateDevice:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = DILogHandleDeviceManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v33 = &stru_26FF62CC0;
    __int16 v34 = 2112;
    uint64_t v35 = (uint64_t)v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_DEFAULT, "%@Did update device %@", buf, 0x16u);
  }

  obuint64_t j = [(DIDeviceManager *)self devices];
  objc_sync_enter(obj);
  id v5 = DILogHandleDeviceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(DIDeviceManager *)self devices];
      uint64_t v8 = [v7 count];
      *(_DWORD *)buf = 138412546;
      long long v33 = &stru_26FF62CC0;
      __int16 v34 = 2048;
      uint64_t v35 = v8;
      _os_log_impl(&dword_24D00D000, v6, OS_LOG_TYPE_DEFAULT, "%@Devices %lu", buf, 0x16u);
    }
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [(DIDeviceManager *)self devices];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v14 = DILogHandleDeviceManager();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          long long v33 = &stru_26FF62CC0;
          __int16 v34 = 2112;
          uint64_t v35 = v13;
          _os_log_impl(&dword_24D00D000, v14, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = [(DIDeviceManager *)self devices];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        __int16 v19 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if (objc_msgSend(v19, "isEqual:", v3, obj)) {
          [v19 updateWithDevice:v3 updateState:1];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  objc_sync_exit(obj);
}

- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(DIDeviceManager *)self setDelegate:WeakRetained];
}

- (DIDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setDevices:(id)a3
{
}

- (DIDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DIDeviceManagerDelegate *)WeakRetained;
}

- (DIXPCConnectionManager)connectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionManager);
  return (DIXPCConnectionManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
}

@end