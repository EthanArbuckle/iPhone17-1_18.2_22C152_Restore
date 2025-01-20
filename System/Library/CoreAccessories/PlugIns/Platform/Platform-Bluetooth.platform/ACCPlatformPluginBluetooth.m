@interface ACCPlatformPluginBluetooth
- (BOOL)btUpdatesStarted;
- (BOOL)isRunning;
- (BTSessionImpl)btSession;
- (NSMutableDictionary)accessoryList;
- (NSString)pluginName;
- (OS_dispatch_queue)btEventQueue;
- (id)accessoryAttached:(id)a3;
- (id)getAccessoryList;
- (id)nameForMacAddress:(id)a3;
- (int)updateBTComponent:(id)a3 forAccessory:(id)a4 withEnabledState:(BOOL)a5;
- (void)accessoryDetached:(id)a3;
- (void)initPlugin;
- (void)iterateRegisteredComponentsForKnownAddresses:(id)a3 allOFF:(BOOL)a4;
- (void)performInit;
- (void)pluginBTDevice:(id)a3 btAccessoryManager:(BTAccessoryManagerImpl *)a4 btDevice:(BTDeviceImpl *)a5;
- (void)setAccessoryList:(id)a3;
- (void)setBtEventQueue:(id)a3;
- (void)setBtSession:(BTSessionImpl *)a3;
- (void)setBtUpdatesStarted:(BOOL)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)startCheckingForUpdates:(id)a3 forAccessory:(id)a4;
- (void)startPlugin;
- (void)stopCheckingForUpdates:(id)a3 forAccessory:(id)a4;
- (void)stopPlugin;
- (void)unplugBTDevice:(id)a3 btAccessoryManager:(BTAccessoryManagerImpl *)a4 btDevice:(BTDeviceImpl *)a5;
@end

@implementation ACCPlatformPluginBluetooth

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)initPlugin
{
  init_logging();
  [(ACCPlatformPluginBluetooth *)self setIsRunning:0];
  [(ACCPlatformPluginBluetooth *)self setBtUpdatesStarted:0];
}

- (void)startPlugin
{
}

- (void)stopPlugin
{
}

- (void)performInit
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ACCPlatformPluginBluetooth_performInit__block_invoke;
  block[3] = &unk_264604780;
  block[4] = self;
  if (performInit_onceToken != -1) {
    dispatch_once(&performInit_onceToken, block);
  }
}

uint64_t __41__ACCPlatformPluginBluetooth_performInit__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.plugin.platform.bluetooth", 0);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  *(void *)(*(void *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

- (id)getAccessoryList
{
  [(ACCPlatformPluginBluetooth *)self performInit];
  accessoryList = self->_accessoryList;
  return accessoryList;
}

- (id)accessoryAttached:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_22223C000, v7, OS_LOG_TYPE_INFO, "accessoryUID=%@", buf, 0xCu);
  }

  if (v4)
  {
    v8 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
    v9 = [v8 objectForKey:v4];

    if (!v9)
    {
      v9 = [[ACCPlatformBluetoothStatusAccessory alloc] initWithUID:v4];
      v10 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
      [v10 setObject:v9 forKey:v4];

      v11 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
      uint64_t v12 = [v11 count];

      if (v12 == 1)
      {
        btEventQueue = self->_btEventQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __48__ACCPlatformPluginBluetooth_accessoryAttached___block_invoke;
        block[3] = &unk_264604780;
        block[4] = self;
        dispatch_sync(btEventQueue, block);
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginBluetooth accessoryAttached:]();
        }
        v14 = MEMORY[0x263EF8438];
        id v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
        *(_DWORD *)buf = 138412290;
        id v20 = v16;
        _os_log_impl(&dword_22223C000, v14, OS_LOG_TYPE_INFO, "Added new accessory to list, accessoryList=%@", buf, 0xCu);
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __48__ACCPlatformPluginBluetooth_accessoryAttached___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (!v1[2]) {
    _AttachToBTServer(v1);
  }
}

- (void)accessoryDetached:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl(&dword_22223C000, v7, OS_LOG_TYPE_INFO, "accessory=%@", buf, 0xCu);
  }

  if (v4)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      v8 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
      *(_DWORD *)buf = 138412290;
      id v32 = v10;
      _os_log_impl(&dword_22223C000, v8, OS_LOG_TYPE_INFO, "Remove accessory from list, accessoryList=%@", buf, 0xCu);
    }
    v11 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
    uint64_t v12 = [v4 accessoryUID];
    [v11 removeObjectForKey:v12];

    unint64_t v13 = _BTGetAccessoryManager((uint64_t)self->_btSession);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v14 = [v4 componentList];
    id v15 = [v14 allValues];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v20 needToUnplugBTDevice]
            && !_BTGetDevice((uint64_t)self->_btSession, v13, v20, &v29))
          {
            [(ACCPlatformPluginBluetooth *)self unplugBTDevice:v20 btAccessoryManager:v13 btDevice:v29];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    uint64_t v21 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
    uint64_t v22 = [v21 count];

    if (!v22)
    {
      btEventQueue = self->_btEventQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__ACCPlatformPluginBluetooth_accessoryDetached___block_invoke;
      block[3] = &unk_264604780;
      block[4] = self;
      dispatch_async(btEventQueue, block);
    }
  }
}

void __48__ACCPlatformPluginBluetooth_accessoryDetached___block_invoke(uint64_t a1)
{
  buf[3] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 9) = 0;
    id v2 = *(id *)(a1 + 32);
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 1;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      BOOL v5 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v2;
      _os_log_impl(&dword_22223C000, v5, OS_LOG_TYPE_INFO, "_DetachFromBTServer object=%@", (uint8_t *)buf, 0xCu);
    }

    buf[0] = [v2 btSession];
    if (buf[0])
    {
      int v6 = BTSessionDetachWithQueue();
      if (!v6)
      {
LABEL_25:
        [v2 setBtSession:0];

        return;
      }
    }
    else
    {
      int v6 = 1;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl(&dword_22223C000, v7, OS_LOG_TYPE_DEFAULT, "ERROR - failed detaching from BT server, result=%d", (uint8_t *)v9, 8u);
    }

    goto LABEL_25;
  }
}

- (void)pluginBTDevice:(id)a3 btAccessoryManager:(BTAccessoryManagerImpl *)a4 btDevice:(BTDeviceImpl *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v7;
    _os_log_impl(&dword_22223C000, v10, OS_LOG_TYPE_INFO, "component=%@", (uint8_t *)&v18, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v7;
    _os_log_impl(&dword_22223C000, v11, OS_LOG_TYPE_INFO, "call BTAccessoryManagerPlugInDevice, component=%@", (uint8_t *)&v18, 0xCu);
  }

  int v13 = BTAccessoryManagerPlugInDevice();
  if (v13 && (int v14 = v13, v13 != 603))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      id v15 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [v7 name];
      int v18 = 138412546;
      id v19 = v17;
      __int16 v20 = 1024;
      int v21 = v14;
      _os_log_impl(&dword_22223C000, v15, OS_LOG_TYPE_INFO, "ERROR - BTAccessoryManagerPlugInDevice (%@) failed (with %d result)!", (uint8_t *)&v18, 0x12u);
    }
  }
  else
  {
    [v7 setBtAccessoryManager:a4];
    [v7 setBtDevice:a5];
    [v7 setNeedToUnplugBTDevice:1];
  }
}

- (void)unplugBTDevice:(id)a3 btAccessoryManager:(BTAccessoryManagerImpl *)a4 btDevice:(BTDeviceImpl *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    BOOL v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_22223C000, v8, OS_LOG_TYPE_INFO, "component=%@", (uint8_t *)&v16, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_22223C000, v9, OS_LOG_TYPE_INFO, "call BTAccessoryManagerUnplugDevice, component=%@", (uint8_t *)&v16, 0xCu);
  }

  int v11 = BTAccessoryManagerUnplugDevice();
  if (v11 && (int v12 = v11, v11 != 604))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      int v13 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v15 = [v5 name];
      int v16 = 138412546;
      id v17 = v15;
      __int16 v18 = 1024;
      int v19 = v12;
      _os_log_impl(&dword_22223C000, v13, OS_LOG_TYPE_INFO, "ERROR - BTAccessoryManagerUnplugDevice (%@) failed (with %d result)!", (uint8_t *)&v16, 0x12u);
    }
  }
  else
  {
    [v5 setNeedToUnplugBTDevice:0];
  }
}

- (void)startCheckingForUpdates:(id)a3 forAccessory:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_22223C000, v10, OS_LOG_TYPE_INFO, "accessoryUID=%@ componentDict=%@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    int v11 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
    int v12 = [v11 objectForKey:v7];

    if (!v12)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginBluetooth accessoryAttached:]();
        }
        int v16 = MEMORY[0x263EF8438];
        id v19 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v7;
        _os_log_impl(&dword_22223C000, v16, OS_LOG_TYPE_INFO, "Unable to find accessory for %@", buf, 0xCu);
      }

      id v15 = 0;
      goto LABEL_28;
    }
    int v13 = [v6 objectForKey:@"ACCBluetoothStatusComponentInfoUID"];
    id v14 = [v12 componentList];
    id v15 = [v14 objectForKey:v13];

    if (v15)
    {
    }
    else
    {
      id v15 = +[_ACCBluetoothStatusComponent createComponentFromDict:v6];
      id v17 = [v12 componentList];
      [v17 setObject:v15 forKey:v13];

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    if ([(ACCPlatformPluginBluetooth *)self btUpdatesStarted])
    {
      btEventQueue = self->_btEventQueue;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __67__ACCPlatformPluginBluetooth_startCheckingForUpdates_forAccessory___block_invoke;
      v20[3] = &unk_2646047A8;
      v20[4] = self;
      id v15 = v15;
      id v21 = v15;
      dispatch_async(btEventQueue, v20);
    }
    goto LABEL_28;
  }
LABEL_29:
}

void __67__ACCPlatformPluginBluetooth_startCheckingForUpdates_forAccessory___block_invoke(uint64_t a1)
{
}

- (void)stopCheckingForUpdates:(id)a3 forAccessory:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22223C000, v10, OS_LOG_TYPE_INFO, "accessoryUID=%@ componentDict=%@", (uint8_t *)&v17, 0x16u);
  }

  if (v6 && v7)
  {
    int v11 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
    int v12 = [v11 objectForKey:v7];

    if (v12)
    {
      int v13 = [v6 objectForKey:@"ACCBluetoothStatusComponentInfoUID"];
      id v14 = [v12 componentList];
      id v15 = [v14 objectForKey:v13];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginBluetooth accessoryAttached:]();
        }
        id v15 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v7;
        _os_log_impl(&dword_22223C000, v15, OS_LOG_TYPE_INFO, "Unable to find accessory for %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
}

- (int)updateBTComponent:(id)a3 forAccessory:(id)a4 withEnabledState:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    int v12 = MEMORY[0x263EF8438];
    id v11 = MEMORY[0x263EF8438];
  }
  else
  {
    int v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v8;
    __int16 v30 = 1024;
    BOOL v31 = v5;
    _os_log_impl(&dword_22223C000, v12, OS_LOG_TYPE_INFO, "updateBTComponent: componentDict=%@ enabled=%d", buf, 0x12u);
  }

  if (v8)
  {
    if (!v9)
    {
      id v9 = [v8 objectForKey:@"ACCBluetoothStatusComponentInfoAccessoryUID"];
    }
    int v13 = [v8 objectForKey:@"ACCBluetoothStatusComponentInfoUID"];
    id v14 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
    id v15 = [v14 objectForKey:v9];

    if (v15)
    {
      id v16 = [v15 componentList];
      int v17 = [v16 objectForKey:v13];

      if (!v17)
      {
        int v17 = +[_ACCBluetoothStatusComponent createComponentFromDict:v8];
        id v18 = [v15 componentList];
        [v18 setObject:v17 forKey:v13];
      }
      uint64_t v27 = 0;
      unint64_t v19 = _BTGetAccessoryManager((uint64_t)self->_btSession);
      if (v19)
      {
        unint64_t v20 = v19;
        if (!_BTGetDevice((uint64_t)self->_btSession, v19, v17, &v27))
        {
          if (v27)
          {
            if (v5)
            {
              -[ACCPlatformPluginBluetooth pluginBTDevice:btAccessoryManager:btDevice:](self, "pluginBTDevice:btAccessoryManager:btDevice:", v17, v20);
              if (BTDeviceConnect())
              {
                uint64_t v21 = logObjectForModule();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  uint64_t v22 = [v17 name];
                  *(_DWORD *)buf = 138412290;
                  id v29 = v22;
                  id v23 = "ERROR - BTDeviceConnect (%@) failed!";
LABEL_39:
                  _os_log_impl(&dword_22223C000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);

                  goto LABEL_40;
                }
                goto LABEL_40;
              }
            }
            else
            {
              -[ACCPlatformPluginBluetooth unplugBTDevice:btAccessoryManager:btDevice:](self, "unplugBTDevice:btAccessoryManager:btDevice:", v17, v20);
              if (BTDeviceDisconnect())
              {
                uint64_t v21 = logObjectForModule();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  uint64_t v22 = [v17 name];
                  *(_DWORD *)buf = 138412290;
                  id v29 = v22;
                  id v23 = "ERROR - BTDeviceDisconnect (%@) failed!";
                  goto LABEL_39;
                }
LABEL_40:
              }
            }
          }
          int v24 = 0;
          goto LABEL_34;
        }
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginBluetooth accessoryAttached:]();
        }
        int v17 = MEMORY[0x263EF8438];
        id v25 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v9;
        _os_log_impl(&dword_22223C000, v17, OS_LOG_TYPE_INFO, "ERROR - no accessory registered for accessoryUID %@", buf, 0xCu);
      }
    }
    int v24 = -1;
LABEL_34:

    goto LABEL_35;
  }
  int v24 = -1;
LABEL_35:

  return v24;
}

- (void)iterateRegisteredComponentsForKnownAddresses:(id)a3 allOFF:(BOOL)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = [(ACCPlatformPluginBluetooth *)self getAccessoryList];
  id v8 = [v7 allValues];

  id obj = v8;
  uint64_t v22 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v9;
        BOOL v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v11 = [v10 componentList];
        int v12 = [v11 allValues];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              int v17 = *(void **)(*((void *)&v24 + 1) + 8 * v16);
              if (!v6
                || ([*(id *)(*((void *)&v24 + 1) + 8 * v16) macAddr],
                    id v18 = objc_claimAutoreleasedReturnValue(),
                    [v6 member:v18],
                    unint64_t v19 = objc_claimAutoreleasedReturnValue(),
                    v19,
                    v18,
                    v19))
              {
                __notifyComponentStatus(self, v17, a4);
              }
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }

        uint64_t v9 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
}

- (id)nameForMacAddress:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v24 = -21846;
  int v23 = -1431655766;
  void block[5] = 0xAAAAAAAAAAAAAAAALL;
  if (!v4)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      id v6 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "ERROR - NULL MAC Address.";
    goto LABEL_44;
  }
  [(ACCPlatformPluginBluetooth *)self performInit];
  btEventQueue = self->_btEventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ACCPlatformPluginBluetooth_nameForMacAddress___block_invoke;
  block[3] = &unk_264604780;
  block[4] = self;
  dispatch_sync(btEventQueue, block);
  if (!self->_btSession)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "ERROR - NULL BT Session.";
    goto LABEL_44;
  }
  [v4 UTF8String];
  if (BTDeviceAddressFromString())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "Failed to get device address from string.";
LABEL_44:
    _os_log_impl(&dword_22223C000, v6, OS_LOG_TYPE_INFO, v9, buf, 2u);
LABEL_45:

LABEL_46:
    id v18 = 0;
    goto LABEL_47;
  }
  if (BTDeviceFromAddress())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "Failed to get device from address.";
    goto LABEL_44;
  }
  int v12 = malloc_type_calloc(0xF9uLL, 1uLL, 0x100004077774924uLL);
  if (!v12)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "Failed to allocate memory for name.";
    goto LABEL_44;
  }
  uint64_t v13 = v12;
  int Name = BTDeviceGetName();
  if (Name)
  {
    int v15 = Name;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      uint64_t v16 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v26 = v15;
      _os_log_impl(&dword_22223C000, v16, OS_LOG_TYPE_INFO, "No Address. Result = %d.", buf, 8u);
    }

    free(v13);
    goto LABEL_46;
  }
  id v18 = [NSString stringWithUTF8String:v13];
  free(v13);
LABEL_47:

  return v18;
}

void __48__ACCPlatformPluginBluetooth_nameForMacAddress___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1[2]) {
    _AttachToBTServer(v1);
  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (BOOL)btUpdatesStarted
{
  return self->_btUpdatesStarted;
}

- (void)setBtUpdatesStarted:(BOOL)a3
{
  self->_btUpdatesStarted = a3;
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (OS_dispatch_queue)btEventQueue
{
  return self->_btEventQueue;
}

- (void)setBtEventQueue:(id)a3
{
}

- (NSMutableDictionary)accessoryList
{
  return self->_accessoryList;
}

- (void)setAccessoryList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryList, 0);
  objc_storeStrong((id *)&self->_btEventQueue, 0);
}

- (void)accessoryAttached:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22223C000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end