@interface WFBluetoothSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (BluetoothManager)manager;
- (NSMutableDictionary)observeBlocksPerDeviceType;
- (WFBluetoothSettingsClient)initWithBluetoothManager:(id)a3;
- (id)availabilityCompletion;
- (void)availabilityChanged:(id)a3;
- (void)dealloc;
- (void)devicesChanged:(id)a3;
- (void)getPairedDevicesMatchingType:(unint64_t)a3 completion:(id)a4;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)observePairedDevicesMatchingType:(unint64_t)a3 update:(id)a4;
- (void)registerForNotifications;
- (void)setAvailabilityCompletion:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
- (void)waitForAvailabilityWithCompletionHandler:(id)a3;
@end

@implementation WFBluetoothSettingsClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observeBlocksPerDeviceType, 0);
  objc_storeStrong(&self->_availabilityCompletion, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (NSMutableDictionary)observeBlocksPerDeviceType
{
  return self->_observeBlocksPerDeviceType;
}

- (void)setAvailabilityCompletion:(id)a3
{
}

- (id)availabilityCompletion
{
  return self->_availabilityCompletion;
}

- (BluetoothManager)manager
{
  return self->_manager;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WFBluetoothSettingsClient_setState_completionHandler___block_invoke;
  block[3] = &unk_264E5CD30;
  BOOL v10 = a3;
  block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__WFBluetoothSettingsClient_setState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) manager];
  [v2 setEnabled:*(unsigned __int8 *)(a1 + 48)];

  v3 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v6 = 136315394;
    id v7 = "-[WFBluetoothSettingsClient setState:completionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_23C364000, v3, OS_LOG_TYPE_INFO, "%s Set Bluetooth state to %d", (uint8_t *)&v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__WFBluetoothSettingsClient_getStateWithCompletionHandler___block_invoke;
  v6[3] = &unk_264E5EE18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __59__WFBluetoothSettingsClient_getStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) manager];
  int v3 = [v2 enabled];

  id v4 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[WFBluetoothSettingsClient getStateWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_INFO, "%s Retrieved Bluetooth state: %d", (uint8_t *)&v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerForNotifications
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v4 = getBluetoothAvailabilityChangedNotification();
  [v3 addObserver:self selector:sel_availabilityChanged_ name:v4 object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  int v6 = getBluetoothDeviceUpdatedNotification();
  [v5 addObserver:self selector:sel_devicesChanged_ name:v6 object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  __int16 v8 = getBluetoothDeviceRemovedNotification();
  [v7 addObserver:self selector:sel_devicesChanged_ name:v8 object:0];

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  int v9 = getBluetoothDeviceChangedNotification();
  [v10 addObserver:self selector:sel_devicesChanged_ name:v9 object:0];
}

- (void)availabilityChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_availabilityCompletion && [(BluetoothManager *)self->_manager available])
  {
    id v5 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      int v8 = 136315394;
      int v9 = "-[WFBluetoothSettingsClient availabilityChanged:]";
      __int16 v10 = 2112;
      v11 = manager;
      _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_DEBUG, "%s BluetoothManager has become available: %@", (uint8_t *)&v8, 0x16u);
    }

    (*((void (**)(void))self->_availabilityCompletion + 2))();
    id availabilityCompletion = self->_availabilityCompletion;
    self->_id availabilityCompletion = 0;
  }
}

- (void)devicesChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WFBluetoothSettingsClient_devicesChanged___block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__WFBluetoothSettingsClient_devicesChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) manager];
  int v3 = [v2 available];

  if (v3)
  {
    id v4 = [*(id *)(v1 + 32) manager];
    uint64_t v5 = [v4 pairedDevices];
    int v6 = (void *)v5;
    id v7 = (void *)MEMORY[0x263EFFA68];
    if (v5) {
      id v7 = (void *)v5;
    }
    id v8 = v7;

    int v9 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[WFBluetoothSettingsClient devicesChanged:]_block_invoke";
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s BluetoothManager has updated device list: %@", buf, 0x16u);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    __int16 v10 = [*(id *)(v1 + 32) observeBlocksPerDeviceType];
    v11 = [v10 keyEnumerator];

    obuint64_t j = v11;
    uint64_t v26 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v14 = [v13 integerValue];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v15 = v1;
          v16 = [*(id *)(v1 + 32) observeBlocksPerDeviceType];
          v17 = [v16 objectForKeyedSubscript:v13];

          uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v28 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * j);
                v23 = WFBluetoothDeviceFilterDevicesMatchingType(v8, v14);
                (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v19);
          }

          uint64_t v1 = v15;
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v26);
    }
  }
}

- (void)observePairedDevicesMatchingType:(unint64_t)a3 update:(id)a4
{
  id v6 = a4;
  id v7 = [(WFBluetoothSettingsClient *)self observeBlocksPerDeviceType];
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v13 = [v7 objectForKeyedSubscript:v8];

  if (!v13)
  {
    int v9 = [(WFBluetoothSettingsClient *)self observeBlocksPerDeviceType];
    __int16 v10 = [NSNumber numberWithUnsignedInteger:a3];
    id v13 = (id)objc_opt_new();
    objc_msgSend(v9, "setObject:forKeyedSubscript:");
  }
  v11 = (void *)[v6 copy];
  uint64_t v12 = _Block_copy(v11);
  [v13 addObject:v12];

  [(WFBluetoothSettingsClient *)self getPairedDevicesMatchingType:a3 completion:v6];
}

- (void)getPairedDevicesMatchingType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__WFBluetoothSettingsClient_getPairedDevicesMatchingType_completion___block_invoke;
  block[3] = &unk_264E5CB08;
  block[4] = self;
  id v9 = v6;
  unint64_t v10 = a3;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__WFBluetoothSettingsClient_getPairedDevicesMatchingType_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) manager];
  char v3 = [v2 available];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) manager];
    uint64_t v5 = [v4 pairedDevices];
    id v6 = (void *)v5;
    id v7 = (void *)MEMORY[0x263EFFA68];
    if (v5) {
      id v7 = (void *)v5;
    }
    id v8 = v7;

    WFBluetoothDeviceFilterDevicesMatchingType(v8, *(void *)(a1 + 48));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v9();
  }
}

- (void)waitForAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  manager = self->_manager;
  id availabilityCompletion = (void (**)(void))a3;
  int v6 = [(BluetoothManager *)manager available];
  id v7 = getWFBundledIntentsLogObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      id v9 = self->_manager;
      int v12 = 136315394;
      id v13 = "-[WFBluetoothSettingsClient waitForAvailabilityWithCompletionHandler:]";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEBUG, "%s BluetoothManager is available: %@", (uint8_t *)&v12, 0x16u);
    }

    availabilityCompletion[2](availabilityCompletion);
  }
  else
  {
    if (v8)
    {
      id v10 = self->_manager;
      int v12 = 136315394;
      id v13 = "-[WFBluetoothSettingsClient waitForAvailabilityWithCompletionHandler:]";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEBUG, "%s Waiting for BluetoothManager to become available: %@", (uint8_t *)&v12, 0x16u);
    }

    v11 = (void *)[availabilityCompletion copy];
    id availabilityCompletion = (void (**)(void))self->_availabilityCompletion;
    self->_id availabilityCompletion = v11;
  }
}

- (void)dealloc
{
  char v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v4 = getBluetoothAvailabilityChangedNotification();
  [v3 removeObserver:self name:v4 object:0];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  int v6 = getBluetoothDeviceUpdatedNotification();
  [v5 removeObserver:self name:v6 object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v8 = getBluetoothDeviceRemovedNotification();
  [v7 removeObserver:self name:v8 object:0];

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  id v10 = getBluetoothDeviceChangedNotification();
  [v9 removeObserver:self name:v10 object:0];

  v11.receiver = self;
  v11.super_class = (Class)WFBluetoothSettingsClient;
  [(WFBluetoothSettingsClient *)&v11 dealloc];
}

- (WFBluetoothSettingsClient)initWithBluetoothManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFBluetoothSettingsClient;
  int v6 = [(WFBluetoothSettingsClient *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    uint64_t v8 = objc_opt_new();
    observeBlocksPerDeviceType = v7->_observeBlocksPerDeviceType;
    v7->_observeBlocksPerDeviceType = (NSMutableDictionary *)v8;

    [(WFBluetoothSettingsClient *)v7 registerForNotifications];
    id v10 = v7;
  }

  return v7;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__WFBluetoothSettingsClient_createClientWithCompletionHandler___block_invoke;
  v6[3] = &unk_264E5CAE0;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __63__WFBluetoothSettingsClient_createClientWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v2 = (void *)getBluetoothManagerClass_softClass;
  uint64_t v16 = getBluetoothManagerClass_softClass;
  if (!getBluetoothManagerClass_softClass)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getBluetoothManagerClass_block_invoke;
    v12[3] = &unk_264E5EC88;
    v12[4] = &v13;
    __getBluetoothManagerClass_block_invoke((uint64_t)v12);
    v2 = (void *)v14[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v13, 8);
  id v4 = [v3 sharedInstance];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithBluetoothManager:v4];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__WFBluetoothSettingsClient_createClientWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_264E5EE18;
    id v6 = *(id *)(a1 + 32);
    id v10 = v5;
    id v11 = v6;
    id v7 = v5;
    [v7 waitForAvailabilityWithCompletionHandler:v9];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    WFSettingsClientError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v7);
  }
}

uint64_t __63__WFBluetoothSettingsClient_createClientWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

@end