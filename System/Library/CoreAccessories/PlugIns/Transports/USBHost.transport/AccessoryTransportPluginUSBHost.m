@interface AccessoryTransportPluginUSBHost
+ (__CFDictionary)_createVIDPIDMatchingDictionary;
- (BOOL)clearUSBHostHIDInterfacesForConnectionUUID:(id)a3;
- (BOOL)configureUSBHostNCMInterface:(unsigned __int8)a3 asCarPlay:(BOOL)a4 forConnectionUUID:(id)a5;
- (BOOL)isRunning;
- (BOOL)lockUSBHostInterfacesForConnectionUUID:(id)a3;
- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (BOOL)setNeedOutZLP:(BOOL)a3 maxOutLength:(unsigned int)a4 forConnectionUUID:(id)a5;
- (BOOL)setUSBHostHIDInterface:(unsigned __int8)a3 withHIDFunction:(unsigned int)a4 forConnectionUUID:(id)a5;
- (BOOL)startDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4;
- (BOOL)stopDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4;
- (BOOL)unlockUSBHostInterfacesForConnectionUUID:(id)a3;
- (NSMutableDictionary)accessoryConnections;
- (NSMutableDictionary)accessoryNativeUSBEndpoints;
- (NSMutableDictionary)accessoryiAPIntefaceTrafficWaitList;
- (NSMutableDictionary)activeEAInterfaces;
- (NSMutableDictionary)activeUSBCDCInterfaces;
- (NSString)pluginName;
- (OS_dispatch_queue)accessoryConnectionsLock;
- (OS_dispatch_queue)accessoryNativeUSBEndpointsLock;
- (OS_dispatch_queue)activeEAInterfacesLock;
- (OS_dispatch_source)accessoryiAPIntefaceTrafficTimer;
- (int64_t)accessoryiAPIntefaceTrafficWaitListCount;
- (void)VIDPIDServiceAdded:(unsigned int)a3;
- (void)VIDPIDServiceRemoved:(unsigned int)a3;
- (void)_handleCloseEASessionNotificationForEndpoint:(id)a3 connection:(id)a4;
- (void)_handleOpenEASessionNotificationForEndpoint:(id)a3 connection:(id)a4;
- (void)_handleOpenSocketFromAccessoryToAppNotification:(id)a3;
- (void)_handleOpenSocketFromAppToAccessoryNotification:(id)a3;
- (void)configureIOKit;
- (void)configureIOKitVIDPID;
- (void)initPlugin;
- (void)serviceAdded:(unsigned int)a3;
- (void)serviceRemoved:(unsigned int)a3;
- (void)setAccessoryConnections:(id)a3;
- (void)setAccessoryConnectionsLock:(id)a3;
- (void)setAccessoryNativeUSBEndpoints:(id)a3;
- (void)setAccessoryNativeUSBEndpointsLock:(id)a3;
- (void)setAccessoryiAPIntefaceTrafficTimer:(id)a3;
- (void)setAccessoryiAPIntefaceTrafficWaitList:(id)a3;
- (void)setAccessoryiAPIntefaceTrafficWaitListCount:(int64_t)a3;
- (void)setActiveEAInterfaces:(id)a3;
- (void)setActiveEAInterfacesLock:(id)a3;
- (void)setActiveUSBCDCInterfaces:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)startConfiguringIOKit;
- (void)startPlugin;
- (void)stopPlugin;
- (void)tearDownIOKit;
- (void)tearDownIOKitVIDPID;
@end

@implementation AccessoryTransportPluginUSBHost

+ (__CFDictionary)_createVIDPIDMatchingDictionary
{
  int v7 = 10;
  int valuePtr = 7563;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(Mutable, @"idVendor", v4);
  CFRelease(v4);
  CFNumberRef v5 = CFNumberCreate(v3, kCFNumberSInt32Type, &v7);
  CFDictionarySetValue(Mutable, @"bInterfaceClass", v5);
  CFRelease(v5);
  return Mutable;
}

- (NSString)pluginName
{
  return (NSString *)@"USB Host Transport PlugIn";
}

- (void)initPlugin
{
  init_logging();
  v3.receiver = self;
  v3.super_class = (Class)AccessoryTransportPluginUSBHost;
  [(ACCTransportPlugin *)&v3 initPlugin];
}

- (void)startPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    CFNumberRef v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    CFNumberRef v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_DEFAULT, "Starting USB Host transport plugin...", buf, 2u);
  }

  v33.receiver = self;
  v33.super_class = (Class)AccessoryTransportPluginUSBHost;
  [(ACCTransportPlugin *)&v33 startPlugin];
  +[AccessoryEAInterface initializeSessionClose];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(AccessoryTransportPluginUSBHost *)self setAccessoryConnections:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(AccessoryTransportPluginUSBHost *)self setAccessoryNativeUSBEndpoints:v7];

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(AccessoryTransportPluginUSBHost *)self setActiveEAInterfaces:v8];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(AccessoryTransportPluginUSBHost *)self setActiveUSBCDCInterfaces:v9];

  dispatch_queue_t v10 = dispatch_queue_create("USBHostTransportPluginConnectionsLock", 0);
  [(AccessoryTransportPluginUSBHost *)self setAccessoryConnectionsLock:v10];

  dispatch_queue_t v11 = dispatch_queue_create("USBHostTransportPluginActiveEAInterfacesLock", 0);
  [(AccessoryTransportPluginUSBHost *)self setActiveEAInterfacesLock:v11];

  dispatch_queue_t v12 = dispatch_queue_create("USBHostTransportPluginNativeUSBEndpointsLock", 0);
  [(AccessoryTransportPluginUSBHost *)self setAccessoryNativeUSBEndpointsLock:v12];

  dispatch_queue_t v13 = dispatch_queue_create("com.apple.accessoryd.usbhost.notificationQueue", 0);
  v14 = (void *)usbHostNotificationQ;
  usbHostNotificationQ = (uint64_t)v13;

  [(AccessoryTransportPluginUSBHost *)self setAccessoryiAPIntefaceTrafficWaitListCount:0];
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(AccessoryTransportPluginUSBHost *)self setAccessoryiAPIntefaceTrafficWaitList:v15];

  v16 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
  dispatch_source_t v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v16);
  [(AccessoryTransportPluginUSBHost *)self setAccessoryiAPIntefaceTrafficTimer:v17];

  v18 = [(AccessoryTransportPluginUSBHost *)self accessoryiAPIntefaceTrafficTimer];
  dispatch_source_set_timer(v18, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v19 = [(AccessoryTransportPluginUSBHost *)self accessoryiAPIntefaceTrafficTimer];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __46__AccessoryTransportPluginUSBHost_startPlugin__block_invoke;
  handler[3] = &unk_264667240;
  handler[4] = self;
  objc_copyWeak(&v31, (id *)buf);
  dispatch_source_set_event_handler(v19, handler);

  v20 = [(AccessoryTransportPluginUSBHost *)self accessoryiAPIntefaceTrafficTimer];
  dispatch_activate(v20);

  v21 = [MEMORY[0x263F08A00] defaultCenter];
  [v21 addObserver:self selector:sel__handleOpenSocketFromAccessoryToAppNotification_ name:*MEMORY[0x263F340B0] object:0];

  v22 = [MEMORY[0x263F08A00] defaultCenter];
  [v22 addObserver:self selector:sel__handleOpenSocketFromAppToAccessoryNotification_ name:*MEMORY[0x263F340B8] object:0];

  v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 addObserver:self selector:sel_startConfiguringIOKit name:@"ACCTransportIOAccessory_IOAccessoryManagerArrivedNotification" object:0];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v24 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v24 = MEMORY[0x263EF8438];
    id v25 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_222C74000, v24, OS_LOG_TYPE_DEFAULT, "Registered for USB Host notifications", v29, 2u);
  }

  [(AccessoryTransportPluginUSBHost *)self setIsRunning:1];
  v26 = [MEMORY[0x263F08A00] defaultCenter];
  [v26 postNotificationName:@"ACCTransportIOAccessory_USBHostPluginArrivedNotification" object:0];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __46__AccessoryTransportPluginUSBHost_startPlugin__block_invoke_24;
  v27[3] = &unk_264667268;
  objc_copyWeak(&v28, (id *)buf);
  [(ACCTransportPlugin *)self setHandler:v27 forEndpointProperty:*MEMORY[0x263F34180]];
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

void __46__AccessoryTransportPluginUSBHost_startPlugin__block_invoke(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  unint64_t v2 = 0x26ABFC000uLL;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    CFNumberRef v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    CFNumberRef v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_DEFAULT, "Wait for iAP timer fired!", buf, 2u);
  }

  if (platform_systemInfo_supportsUSBC())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
      *(_DWORD *)buf = 136315650;
      v72 = "-[AccessoryTransportPluginUSBHost startPlugin]_block_invoke";
      __int16 v73 = 1024;
      int v74 = 186;
      __int16 v75 = 2112;
      v76 = v8;
      _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d trafficWaitList %@", buf, 0x1Cu);
    }
    v61 = [MEMORY[0x263EFF910] date];
    id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v57 = a1;
    id v9 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    dispatch_queue_t v11 = [WeakRetained accessoryiAPIntefaceTrafficWaitList];
    dispatch_queue_t v12 = [v11 allKeys];

    obuint64_t j = v12;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v66 objects:v81 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v60 = *(void *)v67;
      id v15 = MEMORY[0x263EF8438];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v67 != v60) {
            objc_enumerationMutation(obj);
          }
          dispatch_source_t v17 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          id v18 = objc_loadWeakRetained(v9);
          v19 = [v18 accessoryiAPIntefaceTrafficWaitList];
          v20 = [v19 objectForKey:v17];

          [v61 timeIntervalSince1970];
          double v22 = v21;
          [v20 creationTime];
          double v24 = v23;
          id v25 = *(id **)(v2 + 528);
          int v26 = gNumLogObjects;
          if (v25 && gNumLogObjects >= 1)
          {
            v27 = *v25;
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v72 = (const char *)v25;
              __int16 v73 = 1024;
              int v74 = v26;
              _os_log_error_impl(&dword_222C74000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v28 = v15;
            v27 = v15;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v72 = "-[AccessoryTransportPluginUSBHost startPlugin]_block_invoke";
            __int16 v73 = 1024;
            int v74 = 198;
            __int16 v75 = 2112;
            v76 = v17;
            __int16 v77 = 2112;
            v78 = v20;
            __int16 v79 = 2048;
            unint64_t v80 = (unint64_t)((v22 - v24) * 1000.0);
            _os_log_impl(&dword_222C74000, v27, OS_LOG_TYPE_DEFAULT, "%s:%d connectionUUID %@, iapInterface %@, timeSinceCreationMs %llu", buf, 0x30u);
          }

          uint64_t v29 = acc_userDefaults_copyIntegerForKey(@"WaitForiAPTrafficDelayMS");
          unint64_t v30 = 1500;
          if (v29) {
            unint64_t v30 = v29;
          }
          if (v30 < (unint64_t)((v22 - v24) * 1000.0))
          {
            id v31 = *(id **)(v2 + 528);
            int v32 = gNumLogObjects;
            if (v31 && gNumLogObjects >= 1)
            {
              objc_super v33 = *v31;
            }
            else
            {
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v72 = (const char *)v31;
                __int16 v73 = 1024;
                int v74 = v32;
                _os_log_error_impl(&dword_222C74000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v34 = v15;
              objc_super v33 = v15;
            }
            unint64_t v2 = 0x26ABFC000;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v72 = (const char *)((v22 - v24) * 1000.0);
              _os_log_impl(&dword_222C74000, v33, OS_LOG_TYPE_DEFAULT, "No iAP traffic for %llu msec!!!", buf, 0xCu);
            }

            [v20 unlockOtherInterfaces];
            [v58 addObject:v17];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
      }
      while (v14);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v35 = v58;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v63 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v62 + 1) + 8 * j);
          id v41 = objc_loadWeakRetained(v9);
          v42 = [v41 accessoryiAPIntefaceTrafficWaitList];
          [v42 removeObjectForKey:v40];

          id v43 = objc_loadWeakRetained(v9);
          v44 = [v43 accessoryiAPIntefaceTrafficWaitList];
          uint64_t v45 = [v44 count];
          id v46 = objc_loadWeakRetained(v9);
          [v46 setAccessoryiAPIntefaceTrafficWaitListCount:v45];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v37);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v47 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v47 = MEMORY[0x263EF8438];
      id v48 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      id v49 = objc_loadWeakRetained(v9);
      v50 = [v49 accessoryiAPIntefaceTrafficWaitList];
      uint64_t v51 = [v50 count];
      *(_DWORD *)buf = 134217984;
      v72 = (const char *)v51;
      _os_log_impl(&dword_222C74000, v47, OS_LOG_TYPE_DEFAULT, "%lu more pending iAPInterfaceTrafficWait!!!", buf, 0xCu);
    }
    id v52 = objc_loadWeakRetained(v9);
    v53 = [v52 accessoryiAPIntefaceTrafficWaitList];
    uint64_t v54 = [v53 count];

    if (v54)
    {
      v55 = [*(id *)(v57 + 32) accessoryiAPIntefaceTrafficTimer];
      dispatch_time_t v56 = dispatch_time(0, 50000000);
      dispatch_source_set_timer(v55, v56, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
}

void __46__AccessoryTransportPluginUSBHost_startPlugin__block_invoke_24(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v9 = a6;
  id v10 = a2;
  LODWORD(a4) = [a4 BOOLValue];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v12 = WeakRetained;
  if (a4) {
    [WeakRetained _handleOpenEASessionNotificationForEndpoint:v10 connection:v9];
  }
  else {
    [WeakRetained _handleCloseEASessionNotificationForEndpoint:v10 connection:v9];
  }
}

- (void)stopPlugin
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F340B0] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F340B8] object:0];

  [(AccessoryTransportPluginUSBHost *)self tearDownIOKit];
  v8.receiver = self;
  v8.super_class = (Class)AccessoryTransportPluginUSBHost;
  [(ACCTransportPlugin *)&v8 stopPlugin];
  [(AccessoryTransportPluginUSBHost *)self setIsRunning:0];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    CFNumberRef v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    CFNumberRef v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_DEFAULT, "Stopped USB Host transport plugin!", v7, 2u);
  }
}

- (void)startConfiguringIOKit
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__AccessoryTransportPluginUSBHost_startConfiguringIOKit__block_invoke;
  block[3] = &unk_264667290;
  block[4] = self;
  if (startConfiguringIOKit_onceToken != -1) {
    dispatch_once(&startConfiguringIOKit_onceToken, block);
  }
}

void __56__AccessoryTransportPluginUSBHost_startConfiguringIOKit__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222C74000, v4, OS_LOG_TYPE_DEFAULT, "Start configuring IOKit", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__AccessoryTransportPluginUSBHost_startConfiguringIOKit__block_invoke_28;
  block[3] = &unk_264667290;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__AccessoryTransportPluginUSBHost_startConfiguringIOKit__block_invoke_28(uint64_t a1)
{
  [*(id *)(a1 + 32) configureIOKit];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 configureIOKitVIDPID];
}

- (void)configureIOKit
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_222C74000, v0, v1, "_attachiAPInterfaceUSBDevices: IOServiceMatching() failed", v2);
}

- (void)tearDownIOKit
{
  iokitNotifyPort = self->_iokitNotifyPort;
  if (iokitNotifyPort)
  {
    IONotificationPortDestroy(iokitNotifyPort);
    self->_iokitNotifyPort = 0;
  }
  IOObjectRelease(self->_iokitAddedIterator);
  io_object_t iokitRemovedIterator = self->_iokitRemovedIterator;
  IOObjectRelease(iokitRemovedIterator);
}

- (void)serviceAdded:(unsigned int)a3
{
  kern_return_t RegistryEntryID;
  id *v31;
  int v32;
  BOOL v33;
  int v34;
  kern_return_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  kern_return_t v39;
  kern_return_t v40;
  id *v41;
  int v42;
  BOOL v43;
  int v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  CFNumberRef CFProperty;
  CFNumberRef v49;
  id *v50;
  int v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  __int16 v55;
  uint64_t v56;
  int v57;
  CFDictionaryRef v58;
  CFDictionaryRef v59;
  CFDataRef Value;
  void *v61;
  uint64_t v62;
  id *v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  id *v67;
  int v68;
  NSObject *v69;
  NSObject *v70;
  id *v71;
  int v72;
  NSObject *v73;
  NSObject *v74;
  CFTypeID v75;
  id *v76;
  int v77;
  NSObject *v78;
  id *v79;
  int v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  id *v87;
  int v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  io_object_t ParentOfClass;
  io_object_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  int v97;
  id *v98;
  int v99;
  NSObject *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  AccessoryIAPInterface *v110;
  AccessoryTransportPluginUSBHost *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  id v115;
  AccessoryIAPInterface *v116;
  NSObject *v117;
  uint64_t v118;
  int v119;
  NSObject *v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  unsigned int v124;
  UInt8 v125;
  id *v126;
  int v127;
  int v128;
  NSObject *v129;
  NSObject *v130;
  int v131;
  unsigned int v132;
  id *v133;
  int v134;
  NSObject *v135;
  NSObject *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  AccessoryTransportPluginUSBHost *v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  void *v147;
  CFDictionaryRef cf;
  CFAllocatorRef allocator;
  char v150;
  char v151[15];
  void block[5];
  AccessoryIAPInterface *v153;
  id v154;
  id v155;
  __int16 v156;
  __int16 v157;
  void v158[4];
  id v159;
  AccessoryTransportPluginUSBHost *v160;
  id v161;
  __int16 v162;
  __int16 v163;
  UInt8 buffer[4];
  __int16 v165;
  int valuePtr;
  CFMutableDictionaryRef properties;
  uint64_t entryID;
  char v169;
  char v170[15];
  void v171[2];
  void v172[2];
  uint64_t v173;
  void *v174;
  uint8_t buf[96];
  long long v176;
  long long v177;
  void v178[2];
  void v179[2];
  uint8_t v180[32];
  long long v181;
  long long v182;
  long long v183;
  long long v184;
  long long v185;
  long long v186;
  uint64_t v187;
  CFRange v188;

  v187 = *MEMORY[0x263EF8340];
  unint64_t v4 = 0x26ABFC000uLL;
  unint64_t v5 = 0x26ABFC000uLL;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    objc_super v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    objc_super v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AccessoryTransportPluginUSBHost serviceAdded:]();
  }

  uint64_t v9 = IOIteratorNext(a3);
  if (v9)
  {
    uint64_t v10 = v9;
    dispatch_queue_t v11 = MEMORY[0x263EF8438];
    allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v139 = *MEMORY[0x263F34148];
    v138 = *MEMORY[0x263F34140];
    v137 = *MEMORY[0x263F34170];
    v141 = *MEMORY[0x263F34138];
    v140 = *MEMORY[0x263F34120];
    v143 = self;
    do
    {
      id v12 = *(id **)(v4 + 528);
      int v13 = *(_DWORD *)(v5 + 536);
      if (v12) {
        BOOL v14 = v13 < 1;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v180 = 134218240;
          *(void *)&v180[4] = v12;
          *(_WORD *)&v180[12] = 1024;
          *(_DWORD *)&v180[14] = v13;
          _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v180, 0x12u);
        }
        id v15 = v11;
        v16 = v11;
      }
      else
      {
        v16 = *v12;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[AccessoryTransportPluginUSBHost serviceAdded:](&v169, v170);
      }

      dispatch_source_t v17 = *(id **)(v4 + 528);
      int v18 = *(_DWORD *)(v5 + 536);
      if (v17 && v18 >= 1)
      {
        v19 = *v17;
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v180 = 134218240;
          *(void *)&v180[4] = v17;
          *(_WORD *)&v180[12] = 1024;
          *(_DWORD *)&v180[14] = v18;
          _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v180, 0x12u);
        }
        v20 = v11;
        v19 = v11;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v180 = 67109120;
        *(_DWORD *)&v180[4] = v10;
        _os_log_debug_impl(&dword_222C74000, v19, OS_LOG_TYPE_DEBUG, "io_service_t: %u", v180, 8u);
      }

      v185 = 0u;
      v186 = 0u;
      v183 = 0u;
      v184 = 0u;
      v181 = 0u;
      v182 = 0u;
      memset(v180, 0, sizeof(v180));
      properties = 0;
      entryID = 0;
      int v21 = MEMORY[0x223CA5600](v10, v180);
      double v22 = *(id **)(v4 + 528);
      int v23 = *(_DWORD *)(v5 + 536);
      if (v22) {
        BOOL v24 = v23 <= 0;
      }
      else {
        BOOL v24 = 1;
      }
      int v25 = !v24;
      if (v21)
      {
        int v26 = v21;
        if (v25)
        {
          v27 = *v22;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v22;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v23;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v28 = v11;
          v27 = v11;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v26;
          _os_log_error_impl(&dword_222C74000, v27, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v25)
        {
          v27 = *v22;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v22;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v23;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v29 = v11;
          v27 = v11;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = v180;
          _os_log_debug_impl(&dword_222C74000, v27, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", buf, 0xCu);
        }
      }

      RegistryEntryID = IORegistryEntryGetRegistryEntryID(v10, &entryID);
      id v31 = *(id **)(v4 + 528);
      int v32 = *(_DWORD *)(v5 + 536);
      if (v31) {
        objc_super v33 = v32 <= 0;
      }
      else {
        objc_super v33 = 1;
      }
      v34 = !v33;
      if (RegistryEntryID)
      {
        id v35 = RegistryEntryID;
        if (v34)
        {
          uint64_t v36 = *v31;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v31;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v32;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v37 = v11;
          uint64_t v36 = v11;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v35;
          _os_log_error_impl(&dword_222C74000, v36, OS_LOG_TYPE_ERROR, "IORegistryEntryGetRegistryEntryID failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v34)
        {
          uint64_t v36 = *v31;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v31;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v32;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v38 = v11;
          uint64_t v36 = v11;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = entryID;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = entryID;
          _os_log_debug_impl(&dword_222C74000, v36, OS_LOG_TYPE_DEBUG, "Registry entry ID: %llu 0x%llX", buf, 0x16u);
        }
      }

      v39 = IORegistryEntryCreateCFProperties(v10, &properties, allocator, 0);
      uint64_t v40 = v39;
      id v41 = *(id **)(v4 + 528);
      v42 = *(_DWORD *)(v5 + 536);
      if (v41) {
        id v43 = v42 <= 0;
      }
      else {
        id v43 = 1;
      }
      v44 = !v43;
      if (v39 || !properties)
      {
        if (v44)
        {
          uint64_t v45 = *v41;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v41;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v42;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v46 = v11;
          uint64_t v45 = v11;
        }
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v40;
          _os_log_error_impl(&dword_222C74000, v45, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateCFProperties failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v44)
        {
          uint64_t v45 = *v41;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v41;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v42;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v47 = v11;
          uint64_t v45 = v11;
        }
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = properties;
          _os_log_debug_impl(&dword_222C74000, v45, OS_LOG_TYPE_DEBUG, "serviceProperties: %@", buf, 0xCu);
        }
      }

      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v10, @"idVendor", allocator, 0);
      id v49 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v10, @"idProduct", allocator, 0);
      int valuePtr = 0;
      if (CFProperty) {
        CFNumberGetValue(CFProperty, kCFNumberSInt16Type, (char *)&valuePtr + 2);
      }
      if (v49) {
        CFNumberGetValue(v49, kCFNumberSInt16Type, &valuePtr);
      }
      v50 = *(id **)(v4 + 528);
      uint64_t v51 = *(_DWORD *)(v5 + 536);
      if (v50 && v51 >= 1)
      {
        id v52 = *v50;
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v50;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v51;
          _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v53 = v11;
        id v52 = v11;
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317442;
        *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 387;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v10;
        *(_WORD *)&buf[24] = 2080;
        *(void *)&buf[26] = v180;
        *(_WORD *)&buf[34] = 2048;
        *(void *)&buf[36] = entryID;
        *(_WORD *)&buf[44] = 2112;
        *(void *)&buf[46] = CFProperty;
        *(_WORD *)&buf[54] = 2112;
        *(void *)&buf[56] = v49;
        *(_WORD *)&buf[64] = 1024;
        *(_DWORD *)&buf[66] = HIWORD(valuePtr);
        *(_WORD *)&buf[70] = 1024;
        *(_DWORD *)&buf[72] = (unsigned __int16)valuePtr;
        *(_WORD *)&buf[76] = 2112;
        *(void *)&buf[78] = properties;
        _os_log_impl(&dword_222C74000, v52, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', regEntryID %llu, vid / pid = %@ / %@ (0x%x / 0x%x), serviceProperties: %@", buf, 0x56u);
      }

      if (properties)
      {
        CFRelease(properties);
        properties = 0;
      }
      if (CFProperty) {
        CFRelease(CFProperty);
      }
      if (v49) {
        CFRelease(v49);
      }
      uint64_t v54 = HIWORD(valuePtr);
      v55 = valuePtr;
      if (MGGetBoolAnswer()) {
        dispatch_time_t v56 = 1;
      }
      else {
        dispatch_time_t v56 = 6;
      }
      uint64_t v57 = v55 & 0xFFFE | (v54 << 16);
      if (v57 == 95164176)
      {
        id v58 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v10, "IOService", @"AID Info", allocator, 3u);
        v59 = v58;
        cf = v58;
        if (v58)
        {
          Value = (const __CFData *)CFDictionaryGetValue(v58, @"Digital ID");
          CFDictionaryGetValue(v59, @"Accessory Name");
          CFDictionaryGetValue(v59, @"Accessory Manufacturer");
          CFDictionaryGetValue(v59, @"Accessory Model");
          v59 = (const __CFDictionary *)CFDictionaryGetValue(v59, @"MikeyBus Info");
        }
        else
        {
          Value = 0;
        }
        long long v63 = *(id **)(v4 + 528);
        long long v64 = *(_DWORD *)(v5 + 536);
        if (v63 && v64 >= 1)
        {
          long long v65 = *v63;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v63;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v64;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          long long v66 = v11;
          long long v65 = v11;
        }
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 437;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v10;
          *(_WORD *)&buf[24] = 2080;
          *(void *)&buf[26] = v180;
          *(_WORD *)&buf[34] = 2112;
          *(void *)&buf[36] = Value;
          _os_log_impl(&dword_222C74000, v65, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', digitalID %@", buf, 0x2Cu);
        }

        long long v67 = *(id **)(v4 + 528);
        long long v68 = *(_DWORD *)(v5 + 536);
        if (v67 && v68 >= 1)
        {
          long long v69 = *v67;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v67;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v68;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v70 = v11;
          long long v69 = v11;
        }
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 438;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v10;
          *(_WORD *)&buf[24] = 2112;
          *(void *)&buf[26] = cf;
          _os_log_impl(&dword_222C74000, v69, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, aidInfo %@", buf, 0x22u);
        }

        v71 = *(id **)(v4 + 528);
        v72 = *(_DWORD *)(v5 + 536);
        if (v71 && v72 >= 1)
        {
          __int16 v73 = *v71;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v71;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v72;
            _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          int v74 = v11;
          __int16 v73 = v11;
        }
        self = v143;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 439;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v10;
          *(_WORD *)&buf[24] = 2112;
          *(void *)&buf[26] = v59;
          _os_log_impl(&dword_222C74000, v73, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, mikeyBusInfo %@", buf, 0x22u);
        }

        if (Value && (__int16 v75 = CFGetTypeID(Value), v75 == CFDataGetTypeID()) && CFDataGetLength(Value) == 6)
        {
          v165 = 0;
          *(_DWORD *)buffer = 0;
          v188.location = 0;
          v188.length = 6;
          CFDataGetBytes(Value, v188, buffer);
          v76 = *(id **)(v4 + 528);
          __int16 v77 = *(_DWORD *)(v5 + 536);
          if (v76 && v77 >= 1)
          {
            v78 = *v76;
          }
          else
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)&uint8_t buf[4] = v76;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v77;
              _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v123 = v11;
            v78 = v11;
          }
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136317186;
            *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 452;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v10;
            *(_WORD *)&buf[24] = 2080;
            *(void *)&buf[26] = v180;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = HIWORD(valuePtr);
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)&buf[48] = (buffer[0] >> 2) & 1;
            *(_WORD *)&buf[52] = 1024;
            *(_DWORD *)&buf[54] = buffer[0] & 3;
            *(_WORD *)&buf[58] = 1024;
            *(_DWORD *)&buf[60] = buffer[2] & 1;
            _os_log_debug_impl(&dword_222C74000, v78, OS_LOG_TYPE_DEBUG, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, _mb %x, _uart %x, _bd %x", buf, 0x40u);
          }

          v124 = buffer[0];
          v125 = buffer[2];
          v126 = *(id **)(v4 + 528);
          v127 = *(_DWORD *)(v5 + 536);
          if (v126 && v127 >= 1)
          {
            v128 = v10;
            v129 = *v126;
          }
          else
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)&uint8_t buf[4] = v126;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v127;
              _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v129 = v11;
            v128 = v10;
            v130 = v129;
          }
          v131 = v125 & 1;
          if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136317186;
            *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 460;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v128;
            *(_WORD *)&buf[24] = 2080;
            *(void *)&buf[26] = v180;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = HIWORD(valuePtr);
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)&buf[48] = (v124 >> 2) & 1;
            *(_WORD *)&buf[52] = 1024;
            *(_DWORD *)&buf[54] = (v124 & 3) != 0;
            *(_WORD *)&buf[58] = 1024;
            *(_DWORD *)&buf[60] = v125 & 1;
            _os_log_impl(&dword_222C74000, v129, OS_LOG_TYPE_INFO, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, _mb %d, _uart %d, _bd %d", buf, 0x40u);
          }

          if ((v124 & 3) != 0) {
            v132 = 6;
          }
          else {
            v132 = 1;
          }
          if ((v124 & 7) != 0) {
            long long v62 = v132;
          }
          else {
            long long v62 = 7;
          }
          if (v124 & 7 | v131)
          {
            v133 = *(id **)(v4 + 528);
            v134 = *(_DWORD *)(v5 + 536);
            self = v143;
            LODWORD(v10) = v128;
            if (v133 && v134 >= 1)
            {
              v135 = *v133;
              dispatch_queue_t v11 = MEMORY[0x263EF8438];
            }
            else
            {
              dispatch_queue_t v11 = MEMORY[0x263EF8438];
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v133;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v134;
                _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v136 = v11;
              v135 = v11;
            }
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316930;
              *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 483;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v10;
              *(_WORD *)&buf[24] = 2080;
              *(void *)&buf[26] = v180;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = HIWORD(valuePtr);
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
              *(_WORD *)&buf[46] = 1024;
              *(_DWORD *)&buf[48] = 8;
              *(_WORD *)&buf[52] = 1024;
              *(_DWORD *)&buf[54] = v62;
              _os_log_impl(&dword_222C74000, v135, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, override transportType %{coreacc:ACCEndpoint_TransportType_t}d -> %{coreacc:ACCEndpoint_TransportType_t}d", buf, 0x3Au);
            }

            v61 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x,0x%x", HIWORD(valuePtr), (unsigned __int16)valuePtr);
          }
          else
          {
            v61 = 0;
            long long v62 = 8;
            self = v143;
            LODWORD(v10) = v128;
            dispatch_queue_t v11 = MEMORY[0x263EF8438];
          }
        }
        else
        {
          v61 = 0;
          long long v62 = 8;
          if (HIWORD(valuePtr) == 1452 && (unsigned __int16)valuePtr == 5905)
          {
            __int16 v79 = *(id **)(v4 + 528);
            unint64_t v80 = *(_DWORD *)(v5 + 536);
            if (v79 && v80 >= 1)
            {
              v81 = *v79;
            }
            else
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v79;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v80;
                _os_log_error_impl(&dword_222C74000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              uint64_t v82 = v11;
              v81 = v11;
            }
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316930;
              *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 496;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v10;
              *(_WORD *)&buf[24] = 2080;
              *(void *)&buf[26] = v180;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = HIWORD(valuePtr);
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
              *(_WORD *)&buf[46] = 1024;
              *(_DWORD *)&buf[48] = 8;
              *(_WORD *)&buf[52] = 1024;
              *(_DWORD *)&buf[54] = 7;
              _os_log_impl(&dword_222C74000, v81, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, override transportType %{coreacc:ACCEndpoint_TransportType_t}d -> %{coreacc:ACCEndpoint_TransportType_t}d", buf, 0x3Au);
            }

            v61 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x,0x%x", HIWORD(valuePtr), (unsigned __int16)valuePtr);
            long long v62 = 7;
          }
        }
      }
      else
      {
        v61 = 0;
        cf = 0;
        long long v62 = 8;
      }
      v83 = [(ACCTransportPlugin *)self createConnectionWithType:v56 andIdentifier:0];
      v147 = v61;
      if (v57 == 95164176)
      {
        v144 = v62;
        v84 = v10;
        v85 = [NSNumber numberWithUnsignedInt:HIWORD(valuePtr)];
        v86 = [NSNumber numberWithUnsignedInt:(unsigned __int16)valuePtr];
        v178[0] = v139;
        v178[1] = v138;
        v179[0] = v85;
        v179[1] = v86;
        uint64_t v10 = [NSDictionary dictionaryWithObjects:v179 forKeys:v178 count:2];
        v87 = *(id **)(v4 + 528);
        v88 = *(_DWORD *)(v5 + 536);
        if (v87 && v88 >= 1)
        {
          v89 = *v87;
        }
        else
        {
          v89 = MEMORY[0x263EF8438];
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v87;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v88;
            _os_log_error_impl(&dword_222C74000, v89, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v90 = v89;
        }
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 530;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v84;
          *(_WORD *)&buf[24] = 2080;
          *(void *)&buf[26] = v180;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = HIWORD(valuePtr);
          *(_WORD *)&buf[40] = 1024;
          *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
          *(_WORD *)&buf[46] = 2112;
          *(void *)&buf[48] = v10;
          _os_log_impl(&dword_222C74000, v89, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, override adapterVID/PID, newProperties = %@", buf, 0x38u);
        }

        v91 = (void *)[(id)v10 copy];
        [(ACCTransportPlugin *)v143 setProperties:v91 forConnectionWithUUID:v83];

        LODWORD(v10) = v84;
        self = v143;
        dispatch_queue_t v11 = MEMORY[0x263EF8438];
        v61 = v147;
        long long v62 = v144;
      }
      ParentOfClass = usbUtil_findParentOfClass(v10, "IOUSBHostDevice", "IOService");
      if (ParentOfClass)
      {
        v93 = ParentOfClass;
        v94 = usbUtil_findParentOfClass(ParentOfClass, "IOAccessoryManager", "IOPort");
        if (v94)
        {
          v95 = v94;
          v96 = (void *)IORegistryEntryCreateCFProperty(v94, @"Description", allocator, 0);
          if (v96
            || (v176 = 0u, v177 = 0u, memset(buf, 0, sizeof(buf)), !MEMORY[0x223CA5600](v95, buf))
            && (v96 = (void *)CFStringCreateWithCString(allocator, (const char *)buf, 0x8000100u)) != 0)
          {
            v145 = v62;
            v97 = v10;
            v173 = v137;
            v174 = v96;
            uint64_t v10 = [NSDictionary dictionaryWithObjects:&v174 forKeys:&v173 count:1];

            v98 = *(id **)(v4 + 528);
            v99 = *(_DWORD *)(v5 + 536);
            if (v98 && v99 >= 1)
            {
              v100 = *v98;
            }
            else
            {
              v100 = MEMORY[0x263EF8438];
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v98;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v99;
                _os_log_error_impl(&dword_222C74000, v100, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v101 = v100;
            }
            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              *(void *)&uint8_t buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 553;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v97;
              *(_WORD *)&buf[24] = 2080;
              *(void *)&buf[26] = v180;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = HIWORD(valuePtr);
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
              *(_WORD *)&buf[46] = 2112;
              *(void *)&buf[48] = v10;
              _os_log_impl(&dword_222C74000, v100, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, override managerParent, newProperties = %@", buf, 0x38u);
            }

            v102 = (void *)[(id)v10 copy];
            [(ACCTransportPlugin *)v143 setProperties:v102 forConnectionWithUUID:v83];

            LODWORD(v10) = v97;
            self = v143;
            long long v62 = v145;
          }
          IOObjectRelease(v93);
          v61 = v147;
        }
        else
        {
          LODWORD(v95) = v93;
        }
        IOObjectRelease(v95);
        dispatch_queue_t v11 = MEMORY[0x263EF8438];
      }
      v103 = [(ACCTransportPlugin *)self createEndpointWithTransportType:v62 andProtocol:0 andIdentifier:v61 forConnectionWithUUID:v83 publishConnection:0];
      if (v103)
      {
        v146 = v10;
        v171[0] = v141;
        v104 = [NSNumber numberWithUnsignedInt:HIWORD(valuePtr)];
        v172[0] = v104;
        v171[1] = v140;
        v105 = [NSNumber numberWithUnsignedInt:(unsigned __int16)valuePtr];
        v172[1] = v105;
        v106 = [NSDictionary dictionaryWithObjects:v172 forKeys:v171 count:2];

        [(ACCTransportPlugin *)self setAccessoryInfo:v106 forEndpointWithUUID:v103];
        if (cf)
        {
          v107 = objc_alloc(NSDictionary);
          v108 = [NSString stringWithCString:"AID Info" encoding:4];
          v109 = objc_msgSend(v107, "initWithObjectsAndKeys:", cf, v108, 0);

          [(ACCTransportPlugin *)self setProperties:v109 forConnectionWithUUID:v83];
        }
        [(ACCTransportPlugin *)self publishConnectionWithUUID:v83];
        v110 = [AccessoryIAPInterface alloc];
        v111 = self;
        v112 = HIWORD(valuePtr);
        v113 = (unsigned __int16)valuePtr;
        v158[0] = MEMORY[0x263EF8330];
        v158[1] = 3221225472;
        v158[2] = __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke;
        v158[3] = &unk_2646672E0;
        v114 = v103;
        v159 = v114;
        v160 = v111;
        v115 = v83;
        v161 = v115;
        v162 = HIWORD(valuePtr);
        v163 = valuePtr;
        v116 = [(AccessoryIAPInterface *)v110 initWithInterface:v146 vid:v112 pid:v113 aidInfo:cf andDataInHandler:v158];
        if (v116)
        {
          v117 = [(AccessoryTransportPluginUSBHost *)v111 accessoryConnectionsLock];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_84;
          block[3] = &unk_2646672B8;
          block[4] = v111;
          v153 = v116;
          v154 = v115;
          v156 = HIWORD(valuePtr);
          v157 = valuePtr;
          v155 = v114;
          dispatch_sync(v117, block);

          self = v111;
          unint64_t v4 = 0x26ABFC000;
          unint64_t v5 = 0x26ABFC000;
        }
        else
        {
          v118 = gLogObjects;
          v119 = gNumLogObjects;
          self = v111;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v120 = *(id *)gLogObjects;
          }
          else
          {
            v121 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)&uint8_t buf[4] = v118;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v119;
              _os_log_error_impl(&dword_222C74000, v121, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v122 = v121;
            v120 = v121;
            self = v111;
          }
          unint64_t v4 = 0x26ABFC000;
          unint64_t v5 = 0x26ABFC000;
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginUSBHost serviceAdded:](&v150, v151);
          }

          [(ACCTransportPlugin *)self destroyConnectionWithUUID:v115];
        }

        LODWORD(v10) = v146;
        dispatch_queue_t v11 = MEMORY[0x263EF8438];
        v61 = v147;
      }
      IOObjectRelease(v10);
      if (cf) {
        CFRelease(cf);
      }

      uint64_t v10 = IOIteratorNext(a3);
    }
    while (v10);
  }
}

uint64_t __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (gLogSignpostObjects) {
    BOOL v7 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v9 = *(id *)(gLogSignpostObjects + 24);
  }
  uint64_t v10 = [*(id *)(a1 + 32) hash];
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      id v12 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      objc_super v33 = v12;
      __int16 v34 = 2048;
      uint64_t v35 = [v6 length];
      _os_signpost_emit_with_name_impl(&dword_222C74000, v9, OS_SIGNPOST_EVENT, v11, "Endpoint RECV", "Received incoming data! %@, %lu bytes", buf, 0x16u);
    }
  }

  if (platform_systemInfo_supportsUSBC()
    && [*(id *)(a1 + 40) accessoryiAPIntefaceTrafficWaitListCount])
  {
    int v13 = [*(id *)(a1 + 40) accessoryConnectionsLock];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_80;
    block[3] = &unk_2646672B8;
    block[4] = *(void *)(a1 + 40);
    id v28 = v5;
    id v29 = *(id *)(a1 + 48);
    id v30 = *(id *)(a1 + 32);
    int v31 = *(_DWORD *)(a1 + 56);
    dispatch_sync(v13, block);
  }
  uint64_t v14 = [*(id *)(a1 + 32) hash];
  os_signpost_id_t v15 = [v6 hash] ^ v14;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v16 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    }
    v16 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v18 = *(const char **)(a1 + 32);
    uint64_t v19 = [v6 length];
    *(_DWORD *)buf = 138412546;
    objc_super v33 = v18;
    __int16 v34 = 2048;
    uint64_t v35 = v19;
    _os_signpost_emit_with_name_impl(&dword_222C74000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Endpoint RECV", "Received incoming data! %@, %lu bytes", buf, 0x16u);
  }

  uint64_t v20 = [*(id *)(a1 + 40) processIncomingData:v6 forEndpointWithUUID:*(void *)(a1 + 32)];
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    int v21 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    }
    int v21 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    if (v20) {
      int v23 = "SUCCESS";
    }
    else {
      int v23 = "ERROR";
    }
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = [v6 length];
    *(_DWORD *)buf = 136315650;
    objc_super v33 = v23;
    __int16 v34 = 2112;
    uint64_t v35 = v24;
    __int16 v36 = 2048;
    uint64_t v37 = v25;
    _os_signpost_emit_with_name_impl(&dword_222C74000, v21, OS_SIGNPOST_INTERVAL_END, v15, "Endpoint RECV", "%s handling Received incoming data! %@, %lu bytes", buf, 0x20u);
  }

  return v20;
}

void __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_80(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    unint64_t v4 = [MEMORY[0x263EFF910] date];
    [v4 timeIntervalSince1970];
    double v6 = v5;
    [*(id *)(a1 + 40) creationTime];
    double v8 = v7;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      int v13 = *(unsigned __int16 *)(a1 + 64);
      int v14 = *(unsigned __int16 *)(a1 + 66);
      os_signpost_id_t v15 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
      int v21 = 136316930;
      id v22 = "-[AccessoryTransportPluginUSBHost serviceAdded:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 640;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      __int16 v29 = 2048;
      unint64_t v30 = (unint64_t)((v6 - v8) * 1000.0);
      __int16 v31 = 1024;
      int v32 = v13;
      __int16 v33 = 1024;
      int v34 = v14;
      __int16 v35 = 2112;
      __int16 v36 = v15;
      _os_log_impl(&dword_222C74000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d received data for %@ - %@, timeSinceCreation %llu, vid / pid = 0x%x / 0x%x, trafficWaitList %@", (uint8_t *)&v21, 0x46u);
    }
    v16 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
    [v16 removeObjectForKey:*(void *)(a1 + 48)];

    id v17 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
    objc_msgSend(*(id *)(a1 + 32), "setAccessoryiAPIntefaceTrafficWaitListCount:", objc_msgSend(v17, "count"));
  }
  int v18 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
  uint64_t v19 = [v18 count];

  if (!v19)
  {
    uint64_t v20 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficTimer];
    dispatch_source_set_timer(v20, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_84(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) accessoryConnections];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    double v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    double v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 40) registryEntryID];
    int v7 = *(unsigned __int16 *)(a1 + 64);
    int v8 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v9 = *(void *)(a1 + 40);
    int v21 = 136316418;
    id v22 = "-[AccessoryTransportPluginUSBHost serviceAdded:]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 682;
    __int16 v25 = 2048;
    uint64_t v26 = v6;
    __int16 v27 = 1024;
    *(_DWORD *)uint64_t v28 = v7;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = v8;
    *(_WORD *)__int16 v29 = 2112;
    *(void *)&v29[2] = v9;
    _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d registryEntryID %llu, vid / pid = 0x%x / 0x%x, iapInterface %@", (uint8_t *)&v21, 0x32u);
  }

  if (platform_systemInfo_supportsUSBC())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      int v14 = *(unsigned __int16 *)(a1 + 64);
      int v15 = *(unsigned __int16 *)(a1 + 66);
      v16 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
      int v21 = 136316674;
      id v22 = "-[AccessoryTransportPluginUSBHost serviceAdded:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 687;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      *(void *)uint64_t v28 = v13;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)__int16 v29 = v14;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v15;
      __int16 v30 = 2112;
      __int16 v31 = v16;
      _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d add to trafficWaitList for %@ - %@, vid / pid = 0x%x / 0x%x, trafficWaitList %@", (uint8_t *)&v21, 0x3Cu);
    }
    id v17 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
    [v17 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

    int v18 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficWaitList];
    objc_msgSend(*(id *)(a1 + 32), "setAccessoryiAPIntefaceTrafficWaitListCount:", objc_msgSend(v18, "count"));

    uint64_t v19 = [*(id *)(a1 + 32) accessoryiAPIntefaceTrafficTimer];
    dispatch_time_t v20 = dispatch_time(0, 50000000);
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)serviceRemoved:(unsigned int)a3
{
  kern_return_t v22;
  void v23[5];
  void v24[5];
  void block[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t entryID;
  uint8_t buf[4];
  _OWORD *v34;
  __int16 v35;
  uint64_t v36;
  _OWORD v37[8];
  uint64_t v38;

  uint64_t v38 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    int v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    int v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AccessoryTransportPluginUSBHost serviceRemoved:]();
  }

  for (uint64_t i = IOIteratorNext(a3); i; uint64_t i = IOIteratorNext(a3))
  {
    memset(v37, 0, sizeof(v37));
    __int16 v31 = 0;
    entryID = 0;
    uint64_t v26 = 0;
    __int16 v27 = &v26;
    uint64_t v28 = 0x3032000000;
    __int16 v29 = __Block_byref_object_copy_;
    __int16 v30 = __Block_byref_object_dispose_;
    if (!MEMORY[0x223CA5600](i, v37))
    {
      uint64_t v9 = gLogObjects;
      int v10 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v11 = *(id *)gLogObjects;
      }
      else
      {
        uint64_t v12 = MEMORY[0x263EF8438];
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          int v34 = (_OWORD *)v9;
          __int16 v35 = 1024;
          LODWORD(v36) = v10;
          _os_log_error_impl(&dword_222C74000, v12, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        uint64_t v13 = v12;
        id v11 = v12;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        int v34 = v37;
        _os_log_debug_impl(&dword_222C74000, v11, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", buf, 0xCu);
      }
    }
    if (!IORegistryEntryGetRegistryEntryID(i, &entryID))
    {
      uint64_t v14 = gLogObjects;
      int v15 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        id v17 = MEMORY[0x263EF8438];
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          int v34 = (_OWORD *)v14;
          __int16 v35 = 1024;
          LODWORD(v36) = v15;
          _os_log_error_impl(&dword_222C74000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        int v18 = v17;
        v16 = v17;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        int v34 = (_OWORD *)entryID;
        __int16 v35 = 2048;
        __int16 v36 = entryID;
        _os_log_debug_impl(&dword_222C74000, v16, OS_LOG_TYPE_DEBUG, "Registry entry ID: %llu 0x%llX", buf, 0x16u);
      }
    }
    uint64_t v19 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke;
    block[3] = &unk_264667308;
    block[4] = self;
    void block[5] = &v26;
    block[6] = entryID;
    dispatch_sync(v19, block);

    if (v27[5])
    {
      -[ACCTransportPlugin destroyConnectionWithUUID:](self, "destroyConnectionWithUUID:");
      dispatch_time_t v20 = [(AccessoryTransportPluginUSBHost *)self accessoryNativeUSBEndpointsLock];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke_2;
      v24[3] = &unk_264667290;
      v24[4] = self;
      dispatch_sync(v20, v24);

      int v21 = [(AccessoryTransportPluginUSBHost *)self activeEAInterfacesLock];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke_3;
      v23[3] = &unk_264667290;
      v23[4] = self;
      dispatch_sync(v21, v23);
    }
    id v22 = IOObjectRelease(i);
    if (v22) {
      printf("Couldn’t release raw device object: %08x\n", v22);
    }
    _Block_object_dispose(&v26, 8);
  }
}

void __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v2 = objc_msgSend(*(id *)(a1 + 32), "accessoryConnections", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    int v8 = v5;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v2);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*((void *)&v13 + 1) + 8 * v7));
      uint64_t v9 = [*(id *)(a1 + 32) accessoryConnections];
      BOOL v5 = [v9 objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

      if (v5)
      {
        if ([v5 registryEntryID] == *(void *)(a1 + 48)) {
          break;
        }
      }
      ++v7;
      int v8 = v5;
      if (v4 == v7)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
LABEL_12:
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v12 = [*(id *)(a1 + 32) accessoryConnections];
    [v12 removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

void __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) accessoryNativeUSBEndpoints];
  [v1 removeAllObjects];
}

void __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v2 = objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        int v8 = [*(id *)(a1 + 32) activeEAInterfaces];
        uint64_t v9 = [v8 objectForKey:v7];

        [v9 shuttingDownSession];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [*(id *)(a1 + 32) activeEAInterfaces];
  [v10 removeAllObjects];
}

- (void)_handleOpenEASessionNotificationForEndpoint:(id)a3 connection:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
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
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_DEFAULT, "Opening EA USB Session Notification for endpoint %@", buf, 0xCu);
  }

  long long v11 = [(ACCTransportPlugin *)self identifierForEndpointWithUUID:v6];
  long long v12 = [(ACCTransportPlugin *)self propertiesForEndpointWithUUID:v6];
  long long v13 = [v12 objectForKey:*MEMORY[0x263F34188]];
  if (gLogObjects && gNumLogObjects >= 1)
  {
    long long v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    long long v14 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v13;
    _os_log_impl(&dword_222C74000, v14, OS_LOG_TYPE_DEFAULT, "EA sessionUUID is %@", buf, 0xCu);
  }

  uint64_t v16 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke;
  block[3] = &unk_264667358;
  block[4] = self;
  id v22 = v7;
  id v23 = v11;
  id v24 = v6;
  id v25 = v13;
  id v17 = v13;
  id v18 = v6;
  id v19 = v11;
  id v20 = v7;
  dispatch_sync(v16, block);
}

void __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) accessoryConnections];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 activeEAInterfacesLock];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke_2;
    block[3] = &unk_264667358;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v16 = v3;
    id v6 = *(id *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 32);
    id v17 = v6;
    uint64_t v18 = v7;
    dispatch_sync(v5, block);

    BOOL v8 = v14;
  }
  else
  {
    id v9 = [v4 activeUSBCDCInterfaces];
    BOOL v8 = [v9 objectForKey:*(void *)(a1 + 40)];

    if (v8)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        uint64_t v10 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_DEFAULT, "Opening EA USB CDC Session", v12, 2u);
      }

      [v8 openCDCInterface];
    }
  }
}

void __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke_2(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222C74000, v4, OS_LOG_TYPE_DEFAULT, "Creating EA Native USB Session", buf, 2u);
  }

  uint64_t v5 = -[AccessoryEAInterface initWithProtocol:endpointUUID:vid:pid:eaSessionUUID:USBDeviceID:]([AccessoryEAInterface alloc], "initWithProtocol:endpointUUID:vid:pid:eaSessionUUID:USBDeviceID:", *(void *)(a1 + 32), *(void *)(a1 + 40), [*(id *)(a1 + 48) vid], objc_msgSend(*(id *)(a1 + 48), "pid"), *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 48), "parentDeviceRegistryEntryID"));
  if (v5)
  {
    id v6 = [*(id *)(a1 + 64) activeEAInterfaces];
    [v6 setObject:v5 forKey:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 48) vidpid] == 95164176)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke_86;
    v9[3] = &unk_264667330;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 64);
    id v10 = v7;
    uint64_t v11 = v8;
    [(AccessoryEAInterface *)v5 setDataInHandler:v9];
  }
}

uint64_t __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 138412802;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    uint64_t v16 = [v6 length];
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_222C74000, v9, OS_LOG_TYPE_INFO, "EAInterface: endpointUUID %@, received %lu bytes, %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v11 = [*(id *)(a1 + 40) processIncomingData:v6 forEndpointWithUUID:*(void *)(a1 + 32)];
  return v11;
}

- (void)_handleCloseEASessionNotificationForEndpoint:(id)a3 connection:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
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
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_DEFAULT, "Closing EA USB Session Notification for endpoint %@", buf, 0xCu);
  }

  uint64_t v11 = [(AccessoryTransportPluginUSBHost *)self activeEAInterfacesLock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__AccessoryTransportPluginUSBHost__handleCloseEASessionNotificationForEndpoint_connection___block_invoke;
  block[3] = &unk_264667380;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(v11, block);
}

void __91__AccessoryTransportPluginUSBHost__handleCloseEASessionNotificationForEndpoint_connection___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) activeEAInterfaces];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 shuttingDownSession];
    uint64_t v4 = [*(id *)(a1 + 32) activeEAInterfaces];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) activeUSBCDCInterfaces];
    id v6 = [v5 objectForKey:*(void *)(a1 + 48)];

    if (v6)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        id v7 = MEMORY[0x263EF8438];
        id v8 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_222C74000, v7, OS_LOG_TYPE_DEFAULT, "Closing EA USB CDC Session", v9, 2u);
      }

      [v6 closeCDCInterface];
    }
  }
}

- (void)_handleOpenSocketFromAccessoryToAppNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 userInfo];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v4;
    _os_log_impl(&dword_222C74000, v7, OS_LOG_TYPE_DEFAULT, "OpenSocket From Accessory To App Native EA USB Session Notification, userInfo %@", buf, 0xCu);
  }

  id v8 = [v4 objectForKey:*MEMORY[0x263F340A8]];
  id v9 = [(AccessoryTransportPluginUSBHost *)self activeEAInterfacesLock];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__AccessoryTransportPluginUSBHost__handleOpenSocketFromAccessoryToAppNotification___block_invoke;
  v11[3] = &unk_2646673A8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync(v9, v11);
}

void __83__AccessoryTransportPluginUSBHost__handleOpenSocketFromAccessoryToAppNotification___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) activeEAInterfaces];
  id v4 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v3 = v4;
  if (v4)
  {
    [v4 openPipeToApp];
    id v3 = v4;
  }
}

- (void)_handleOpenSocketFromAppToAccessoryNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v4;
    _os_log_impl(&dword_222C74000, v7, OS_LOG_TYPE_DEFAULT, "OpenSocket From App To Accessory Native EA USB Session Notification, userInfo %@", buf, 0xCu);
  }

  id v8 = [v4 objectForKey:*MEMORY[0x263F340A8]];
  id v9 = [(AccessoryTransportPluginUSBHost *)self activeEAInterfacesLock];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__AccessoryTransportPluginUSBHost__handleOpenSocketFromAppToAccessoryNotification___block_invoke;
  v11[3] = &unk_2646673A8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync(v9, v11);
}

void __83__AccessoryTransportPluginUSBHost__handleOpenSocketFromAppToAccessoryNotification___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) activeEAInterfaces];
  id v4 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v3 = v4;
  if (v4)
  {
    [v4 openPipeFromApp];
    id v3 = v4;
  }
}

- (BOOL)unlockUSBHostInterfacesForConnectionUUID:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v65 = 0;
  long long v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v61 = 0;
  long long v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x2020000000;
  __int16 v60 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000;
  __int16 v56 = 0;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    BOOL v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v72 = (uint64_t)v4;
    _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_INFO, "Unlocking USB interfaces for connection %@...", buf, 0xCu);
  }

  id v7 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__AccessoryTransportPluginUSBHost_unlockUSBHostInterfacesForConnectionUUID___block_invoke;
  block[3] = &unk_2646673D0;
  void block[4] = self;
  id v39 = v4;
  id v48 = v39;
  id v49 = &v65;
  v50 = &v61;
  uint64_t v51 = &v57;
  id v52 = &v53;
  dispatch_sync(v7, block);

  id v8 = +[AccessoryEAInterface findNativeEAInterfacesForRegistryID:v62[3]];
  id v9 = v8;
  if (v8 && [v8 count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v9;
    id v10 = 0;
    uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v83 count:16];
    if (v11)
    {
      uint64_t v38 = *(void *)v44;
      uint64_t v37 = self;
      do
      {
        uint64_t v12 = 0;
        uint64_t v40 = v11;
        do
        {
          if (*(void *)v44 != v38) {
            objc_enumerationMutation(obj);
          }
          id v13 = v9;
          if (*((_WORD *)v54 + 12) == 5904)
          {
            BOOL v14 = *((unsigned __int16 *)v58 + 12) == 1452;
            if (*((_WORD *)v58 + 12) == 1452) {
              uint64_t v15 = 5;
            }
            else {
              uint64_t v15 = 6;
            }
            if (*((_WORD *)v58 + 12) == 1452) {
              uint64_t v16 = 5;
            }
            else {
              uint64_t v16 = 8;
            }
          }
          else
          {
            BOOL v14 = 0;
            uint64_t v16 = 8;
            uint64_t v15 = 6;
          }
          __int16 v17 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
          uint64_t v18 = gLogObjects;
          int v19 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v20 = gNumLogObjects < 1;
          }
          else {
            BOOL v20 = 1;
          }
          if (v20)
          {
            id v21 = v10;
            id v22 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v72 = v18;
              __int16 v73 = 1024;
              int v74 = v19;
              _os_log_error_impl(&dword_222C74000, v22, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v23 = v22;
            id v24 = v22;
            id v10 = v21;
          }
          else
          {
            id v24 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = *((unsigned __int16 *)v58 + 12);
            int v26 = *((unsigned __int16 *)v54 + 12);
            *(_DWORD *)buf = 138413570;
            uint64_t v72 = (uint64_t)v17;
            __int16 v73 = 1024;
            int v74 = v25;
            __int16 v75 = 1024;
            int v76 = v26;
            __int16 v77 = 1024;
            BOOL v78 = v14;
            __int16 v79 = 1024;
            int v80 = v15;
            __int16 v81 = 1024;
            int v82 = v16;
            _os_log_impl(&dword_222C74000, v24, OS_LOG_TYPE_DEFAULT, "unlockOtherInterfaces nativeEAProtocolString '%@', vid / pid = (0x%x / 0x%x), useEAService %d, protocol %{coreacc:ACCEndpoint_Protocol_t}d, transportType %{coreacc:ACCEndpoint_TransportType_t}d", buf, 0x2Au);
          }

          id v9 = v13;
          self = v37;
          id v27 = [(ACCTransportPlugin *)v37 createEndpointWithTransportType:v16 andProtocol:v15 andIdentifier:v17 forConnectionWithUUID:v39 publishConnection:0];

          uint64_t v28 = [(AccessoryTransportPluginUSBHost *)v37 accessoryNativeUSBEndpointsLock];
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __76__AccessoryTransportPluginUSBHost_unlockUSBHostInterfacesForConnectionUUID___block_invoke_94;
          v41[3] = &unk_264667380;
          v41[4] = v37;
          v41[5] = v17;
          id v10 = v27;
          id v42 = v10;
          dispatch_sync(v28, v41);

          ++v12;
        }
        while (v40 != v12);
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v83 count:16];
      }
      while (v11);
    }
    __int16 v29 = v9;

    v69[0] = *MEMORY[0x263F34138];
    __int16 v30 = [NSNumber numberWithUnsignedInt:*((unsigned __int16 *)v58 + 12)];
    v69[1] = *MEMORY[0x263F34120];
    v70[0] = v30;
    __int16 v31 = [NSNumber numberWithUnsignedInt:*((unsigned __int16 *)v54 + 12)];
    v70[1] = v31;
    uint64_t v32 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];

    [(ACCTransportPlugin *)self setAccessoryInfo:v32 forEndpointWithUUID:v10];
    BOOL v33 = [(ACCTransportPlugin *)self publishConnectionWithUUID:v39];
    *((unsigned char *)v66 + 24) = v33;
  }
  else
  {
    __int16 v29 = v9;
    id v10 = 0;
  }
  BOOL v34 = *((unsigned char *)v66 + 24) != 0;

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  return v34;
}

void __76__AccessoryTransportPluginUSBHost_unlockUSBHostInterfacesForConnectionUUID___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) accessoryConnections];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 unlockOtherInterfaces];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      id v7 = @"yes";
    }
    else {
      id v7 = @"no";
    }
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEFAULT, "unlockOtherInterfaces succeeded? %@. Ignoring result anyways", (uint8_t *)&v8, 0xCu);
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 parentDeviceRegistryEntryID];
  *(_WORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 vid];
  *(_WORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 pid];
}

void __76__AccessoryTransportPluginUSBHost_unlockUSBHostInterfacesForConnectionUUID___block_invoke_94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryNativeUSBEndpoints];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (BOOL)lockUSBHostInterfacesForConnectionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__AccessoryTransportPluginUSBHost_lockUSBHostInterfacesForConnectionUUID___block_invoke;
  block[3] = &unk_2646673F8;
  void block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __74__AccessoryTransportPluginUSBHost_lockUSBHostInterfacesForConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryConnections];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 lockOtherInterfaces];
}

- (void)configureIOKitVIDPID
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_222C74000, v0, v1, "configureIOKitVIDPID: IOServiceMatching() failed", v2);
}

- (void)tearDownIOKitVIDPID
{
  iokitVIDPIDNotifyPort = self->_iokitVIDPIDNotifyPort;
  if (iokitVIDPIDNotifyPort)
  {
    IONotificationPortDestroy(iokitVIDPIDNotifyPort);
    self->_iokitVIDPIDNotifyPort = 0;
  }
  IOObjectRelease(self->_iokitVIDPIDAddedIterator);
  io_object_t iokitVIDPIDRemovedIterator = self->_iokitVIDPIDRemovedIterator;
  IOObjectRelease(iokitVIDPIDRemovedIterator);
}

- (void)VIDPIDServiceAdded:(unsigned int)a3
{
  kern_return_t RegistryEntryID;
  uint64_t v21;
  int v22;
  BOOL v23;
  int v24;
  kern_return_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  kern_return_t v29;
  kern_return_t v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  AccessoryUSBCDCInterface *v40;
  id v41;
  AccessoryUSBCDCInterface *v42;
  NSObject *v43;
  AccessoryUSBCDCInterface *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _OWORD *v51;
  uint64_t v52;
  int v53;
  NSObject *v54;
  uint64_t v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  AccessoryUSBCDCInterface *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  AccessoryTransportPluginUSBHost *v67;
  unsigned int v68;
  id v69;
  AccessoryUSBCDCInterface *v70;
  void *v71;
  int v72;
  CFAllocatorRef allocator;
  char v74;
  char v75[7];
  void block[5];
  AccessoryUSBCDCInterface *v77;
  id v78;
  void v79[4];
  id v80;
  AccessoryTransportPluginUSBHost *v81;
  CFMutableDictionaryRef properties;
  uint64_t entryID;
  void v84[6];
  void v85[6];
  uint8_t buf[4];
  _OWORD *v87;
  __int16 v88;
  uint64_t v89;
  _OWORD v90[8];
  uint64_t v91;

  v91 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AccessoryTransportPluginUSBHost VIDPIDServiceAdded:]();
  }

  uint64_t v8 = IOIteratorNext(a3);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = MEMORY[0x263EF8438];
    allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    long long v66 = *MEMORY[0x263F34110];
    uint64_t v65 = *MEMORY[0x263F34100];
    uint64_t v64 = *MEMORY[0x263F34130];
    long long v62 = *MEMORY[0x263F340F0];
    uint64_t v63 = *MEMORY[0x263F34108];
    uint64_t v61 = *MEMORY[0x263F340F8];
    char v68 = a3;
    uint64_t v67 = self;
    do
    {
      memset(v90, 0, sizeof(v90));
      properties = 0;
      entryID = 0;
      int v11 = MEMORY[0x223CA5600](v9, v90);
      uint64_t v12 = gLogObjects;
      int v13 = gNumLogObjects;
      if (gLogObjects) {
        BOOL v14 = gNumLogObjects <= 0;
      }
      else {
        BOOL v14 = 1;
      }
      int v15 = !v14;
      if (v11)
      {
        int v16 = v11;
        if (v15)
        {
          __int16 v17 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v87 = (_OWORD *)v12;
            v88 = 1024;
            LODWORD(v89) = v13;
            _os_log_error_impl(&dword_222C74000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v18 = v10;
          __int16 v17 = v10;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v87) = v16;
          _os_log_error_impl(&dword_222C74000, v17, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v15)
        {
          __int16 v17 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v87 = (_OWORD *)v12;
            v88 = 1024;
            LODWORD(v89) = v13;
            _os_log_error_impl(&dword_222C74000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          int v19 = v10;
          __int16 v17 = v10;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v87 = v90;
          _os_log_debug_impl(&dword_222C74000, v17, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", buf, 0xCu);
        }
      }

      RegistryEntryID = IORegistryEntryGetRegistryEntryID(v9, &entryID);
      id v21 = gLogObjects;
      id v22 = gNumLogObjects;
      if (gLogObjects) {
        id v23 = gNumLogObjects <= 0;
      }
      else {
        id v23 = 1;
      }
      id v24 = !v23;
      if (RegistryEntryID)
      {
        int v25 = RegistryEntryID;
        if (v24)
        {
          int v26 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v87 = (_OWORD *)v21;
            v88 = 1024;
            LODWORD(v89) = v22;
            _os_log_error_impl(&dword_222C74000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v27 = v10;
          int v26 = v10;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v87) = v25;
          _os_log_error_impl(&dword_222C74000, v26, OS_LOG_TYPE_ERROR, "IORegistryEntryGetRegistryEntryID failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v24)
        {
          int v26 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v87 = (_OWORD *)v21;
            v88 = 1024;
            LODWORD(v89) = v22;
            _os_log_error_impl(&dword_222C74000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v28 = v10;
          int v26 = v10;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v87 = (_OWORD *)entryID;
          v88 = 2048;
          v89 = entryID;
          _os_log_debug_impl(&dword_222C74000, v26, OS_LOG_TYPE_DEBUG, "Registry entry ID: %llu 0x%llX", buf, 0x16u);
        }
      }

      __int16 v29 = IORegistryEntryCreateCFProperties(v9, &properties, allocator, 0);
      __int16 v30 = v29;
      __int16 v31 = gLogObjects;
      uint64_t v32 = gNumLogObjects;
      if (gLogObjects) {
        BOOL v33 = gNumLogObjects <= 0;
      }
      else {
        BOOL v33 = 1;
      }
      BOOL v34 = !v33;
      if (v29 || !properties)
      {
        if (v34)
        {
          __int16 v35 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v87 = (_OWORD *)v31;
            v88 = 1024;
            LODWORD(v89) = v32;
            _os_log_error_impl(&dword_222C74000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          __int16 v36 = v10;
          __int16 v35 = v10;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v87) = v30;
          _os_log_error_impl(&dword_222C74000, v35, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateCFProperties failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v34)
        {
          __int16 v35 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v87 = (_OWORD *)v31;
            v88 = 1024;
            LODWORD(v89) = v32;
            _os_log_error_impl(&dword_222C74000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v37 = v10;
          __int16 v35 = v10;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v87 = properties;
          _os_log_debug_impl(&dword_222C74000, v35, OS_LOG_TYPE_DEBUG, "serviceProperties: %@", buf, 0xCu);
        }
      }

      if (properties)
      {
        CFRelease(properties);
        properties = 0;
      }
      uint64_t v38 = [(ACCTransportPlugin *)self createConnectionWithType:6 andIdentifier:0];
      id v39 = [(ACCTransportPlugin *)self createEndpointWithTransportType:8 andProtocol:5 andIdentifier:@"com.medtronic.cdc.protocol" forConnectionWithUUID:v38 publishConnection:0];
      if (v39)
      {
        uint64_t v40 = [AccessoryUSBCDCInterface alloc];
        v79[0] = MEMORY[0x263EF8330];
        v79[1] = 3221225472;
        v79[2] = __54__AccessoryTransportPluginUSBHost_VIDPIDServiceAdded___block_invoke;
        v79[3] = &unk_264667420;
        id v41 = v39;
        int v80 = v41;
        __int16 v81 = self;
        id v42 = [(AccessoryUSBCDCInterface *)v40 initWithInterface:v9 protocol:@"com.medtronic.cdc.protocol" endpointUUID:v41 andDataInHandler:v79];
        if (v42)
        {
          uint64_t v72 = v9;
          long long v43 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __54__AccessoryTransportPluginUSBHost_VIDPIDServiceAdded___block_invoke_101;
          block[3] = &unk_264667380;
          void block[4] = self;
          v70 = v42;
          long long v44 = v42;
          __int16 v77 = v44;
          v71 = v38;
          long long v69 = v38;
          BOOL v78 = v69;
          dispatch_sync(v43, block);

          v84[0] = v66;
          long long v45 = [(AccessoryUSBCDCInterface *)v44 ioregProperties];
          long long v46 = [v45 objectForKey:@"USB Product Name"];
          v85[0] = v46;
          v84[1] = v65;
          v47 = [(AccessoryUSBCDCInterface *)v44 ioregProperties];
          id v48 = [v47 objectForKey:@"USB Vendor Name"];
          v85[1] = v48;
          v84[2] = v64;
          id v49 = [(AccessoryUSBCDCInterface *)v44 ioregProperties];
          v50 = [v49 objectForKey:@"USB Serial Number"];
          v85[2] = v50;
          v85[3] = @"Unknown";
          v84[3] = v63;
          v84[4] = v62;
          v84[5] = v61;
          v85[4] = @"Unknown";
          v85[5] = @"Unknown";
          uint64_t v51 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:6];

          id v52 = gLogObjects;
          uint64_t v53 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v54 = *(id *)gLogObjects;
          }
          else
          {
            uint64_t v54 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v87 = (_OWORD *)v52;
              v88 = 1024;
              LODWORD(v89) = v53;
              _os_log_error_impl(&dword_222C74000, v54, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v58 = v54;
          }
          self = v67;
          LODWORD(v9) = v72;
          uint64_t v59 = v70;
          uint64_t v38 = v71;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v87 = v51;
            _os_log_impl(&dword_222C74000, v54, OS_LOG_TYPE_INFO, "accInfoDictionary = %@", buf, 0xCu);
          }

          [(ACCTransportPlugin *)v67 setAccessoryInfo:v51 forEndpointWithUUID:v41];
          [(ACCTransportPlugin *)v67 publishConnectionWithUUID:v69];

          a3 = v68;
          uint64_t v10 = MEMORY[0x263EF8438];
        }
        else
        {
          uint64_t v55 = gLogObjects;
          __int16 v56 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v57 = *(id *)gLogObjects;
            uint64_t v10 = MEMORY[0x263EF8438];
          }
          else
          {
            uint64_t v10 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v87 = (_OWORD *)v55;
              v88 = 1024;
              LODWORD(v89) = v56;
              _os_log_error_impl(&dword_222C74000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            __int16 v60 = v10;
            uint64_t v57 = v10;
          }
          uint64_t v59 = 0;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            -[AccessoryTransportPluginUSBHost VIDPIDServiceAdded:](&v74, v75);
          }

          [(ACCTransportPlugin *)self destroyConnectionWithUUID:v38];
        }
      }
      IOObjectRelease(v9);

      uint64_t v9 = IOIteratorNext(a3);
    }
    while (v9);
  }
}

uint64_t __54__AccessoryTransportPluginUSBHost_VIDPIDServiceAdded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (gLogSignpostObjects) {
    BOOL v7 = gNumLogSignpostObjects < 4;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v9 = *(id *)(gLogSignpostObjects + 24);
  }
  uint64_t v10 = [*(id *)(a1 + 32) hash];
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      uint64_t v12 = *(const char **)(a1 + 32);
      int v26 = 138412546;
      id v27 = v12;
      __int16 v28 = 2048;
      uint64_t v29 = [v6 length];
      _os_signpost_emit_with_name_impl(&dword_222C74000, v9, OS_SIGNPOST_EVENT, v11, "Endpoint RECV", "Received incoming data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
    }
  }

  uint64_t v13 = [*(id *)(a1 + 32) hash];
  os_signpost_id_t v14 = [v6 hash] ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    int v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    }
    int v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    __int16 v17 = *(const char **)(a1 + 32);
    uint64_t v18 = [v6 length];
    int v26 = 138412546;
    id v27 = v17;
    __int16 v28 = 2048;
    uint64_t v29 = v18;
    _os_signpost_emit_with_name_impl(&dword_222C74000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
  }

  uint64_t v19 = [*(id *)(a1 + 40) processIncomingData:v6 forEndpointWithUUID:*(void *)(a1 + 32)];
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    BOOL v20 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    }
    BOOL v20 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    if (v19) {
      id v22 = "SUCCESS";
    }
    else {
      id v22 = "ERROR";
    }
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = [v6 length];
    int v26 = 136315650;
    id v27 = v22;
    __int16 v28 = 2112;
    uint64_t v29 = v23;
    __int16 v30 = 2048;
    uint64_t v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_222C74000, v20, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming data! %@, %lu bytes", (uint8_t *)&v26, 0x20u);
  }

  return v19;
}

void __54__AccessoryTransportPluginUSBHost_VIDPIDServiceAdded___block_invoke_101(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeUSBCDCInterfaces];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)VIDPIDServiceRemoved:(unsigned int)a3
{
  kern_return_t v20;
  unsigned int v21;
  void block[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t entryID;
  uint8_t buf[4];
  unsigned char *v31;
  __int16 v32;
  uint64_t v33;
  unsigned char v34[136];
  uint64_t v35;

  __int16 v35 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AccessoryTransportPluginUSBHost VIDPIDServiceRemoved:]();
  }

  uint64_t v8 = IOIteratorNext(a3);
  if (v8)
  {
    id v21 = a3;
    do
    {
      memset(v34, 0, 128);
      __int16 v28 = 0;
      entryID = 0;
      uint64_t v23 = 0;
      uint64_t v24 = &v23;
      int v25 = 0x3032000000;
      int v26 = __Block_byref_object_copy_;
      id v27 = __Block_byref_object_dispose_;
      if (!MEMORY[0x223CA5600](v8, v34))
      {
        uint64_t v9 = gLogObjects;
        int v10 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          os_signpost_id_t v11 = *(id *)gLogObjects;
        }
        else
        {
          uint64_t v12 = MEMORY[0x263EF8438];
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v31 = (unsigned char *)v9;
            uint64_t v32 = 1024;
            LODWORD(v33) = v10;
            _os_log_error_impl(&dword_222C74000, v12, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v13 = v12;
          os_signpost_id_t v11 = v12;
          a3 = v21;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v31 = v34;
          _os_log_debug_impl(&dword_222C74000, v11, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", buf, 0xCu);
        }
      }
      if (!IORegistryEntryGetRegistryEntryID(v8, &entryID))
      {
        uint64_t v14 = gLogObjects;
        int v15 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          id v16 = *(id *)gLogObjects;
        }
        else
        {
          __int16 v17 = MEMORY[0x263EF8438];
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v31 = (unsigned char *)v14;
            uint64_t v32 = 1024;
            LODWORD(v33) = v15;
            _os_log_error_impl(&dword_222C74000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v18 = v17;
          id v16 = v17;
          a3 = v21;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v31 = (unsigned char *)entryID;
          uint64_t v32 = 2048;
          BOOL v33 = entryID;
          _os_log_debug_impl(&dword_222C74000, v16, OS_LOG_TYPE_DEBUG, "Registry entry ID: %llu 0x%llX", buf, 0x16u);
        }
      }
      uint64_t v19 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__AccessoryTransportPluginUSBHost_VIDPIDServiceRemoved___block_invoke;
      block[3] = &unk_264667448;
      void block[4] = self;
      void block[5] = &v23;
      dispatch_sync(v19, block);

      if (v24[5]) {
        -[ACCTransportPlugin destroyConnectionWithUUID:](self, "destroyConnectionWithUUID:");
      }
      BOOL v20 = IOObjectRelease(v8);
      if (v20) {
        printf("Couldn’t release raw device object: %08x\n", v20);
      }
      _Block_object_dispose(&v23, 8);

      uint64_t v8 = IOIteratorNext(a3);
    }
    while (v8);
  }
}

void __56__AccessoryTransportPluginUSBHost_VIDPIDServiceRemoved___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "activeUSBCDCInterfaces", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*((void *)&v12 + 1) + 8 * v6));
      BOOL v7 = [*(id *)(a1 + 32) activeUSBCDCInterfaces];
      uint64_t v8 = [v7 objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

      if (v8) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    uint64_t v8 = 0;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    [v8 closeCDCInterface];
    os_signpost_id_t v11 = [*(id *)(a1 + 32) activeUSBCDCInterfaces];
    [v11 removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (BOOL)setUSBHostHIDInterface:(unsigned __int8)a3 withHIDFunction:(unsigned int)a4 forConnectionUUID:(id)a5
{
  id v8 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v9 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __92__AccessoryTransportPluginUSBHost_setUSBHostHIDInterface_withHIDFunction_forConnectionUUID___block_invoke;
  v13[3] = &unk_264667470;
  v13[4] = self;
  id v14 = v8;
  long long v15 = &v18;
  unsigned __int8 v17 = a3;
  unsigned int v16 = a4;
  id v10 = v8;
  dispatch_sync(v9, v13);

  char v11 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __92__AccessoryTransportPluginUSBHost_setUSBHostHIDInterface_withHIDFunction_forConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryConnections];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 setUSBHostHIDInterface:*(unsigned __int8 *)(a1 + 60) withHIDFunction:*(unsigned int *)(a1 + 56)];
}

- (BOOL)clearUSBHostHIDInterfacesForConnectionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__AccessoryTransportPluginUSBHost_clearUSBHostHIDInterfacesForConnectionUUID___block_invoke;
  block[3] = &unk_2646673F8;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __78__AccessoryTransportPluginUSBHost_clearUSBHostHIDInterfacesForConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryConnections];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 clearUSBHostHIDInterfaces];
}

- (BOOL)configureUSBHostNCMInterface:(unsigned __int8)a3 asCarPlay:(BOOL)a4 forConnectionUUID:(id)a5
{
  id v8 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v9 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __92__AccessoryTransportPluginUSBHost_configureUSBHostNCMInterface_asCarPlay_forConnectionUUID___block_invoke;
  v13[3] = &unk_264667498;
  v13[4] = self;
  id v14 = v8;
  long long v15 = &v18;
  unsigned __int8 v16 = a3;
  BOOL v17 = a4;
  id v10 = v8;
  dispatch_sync(v9, v13);

  char v11 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __92__AccessoryTransportPluginUSBHost_configureUSBHostNCMInterface_asCarPlay_forConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryConnections];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 configureNCMInterface:*(unsigned __int8 *)(a1 + 56) asCarPlay:*(unsigned __int8 *)(a1 + 57)];
}

- (BOOL)setNeedOutZLP:(BOOL)a3 maxOutLength:(unsigned int)a4 forConnectionUUID:(id)a5
{
  id v8 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v9 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__AccessoryTransportPluginUSBHost_setNeedOutZLP_maxOutLength_forConnectionUUID___block_invoke;
  v13[3] = &unk_264667470;
  v13[4] = self;
  id v14 = v8;
  BOOL v17 = a3;
  unsigned int v16 = a4;
  long long v15 = &v18;
  id v10 = v8;
  dispatch_sync(v9, v13);

  char v11 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __80__AccessoryTransportPluginUSBHost_setNeedOutZLP_maxOutLength_forConnectionUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryConnections];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 setNeedOutZLP:*(unsigned __int8 *)(a1 + 60)];
    [v3 setMaxOutLength:*(unsigned int *)(a1 + 56)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  if (acc_userDefaultsLogging_BOOLForKey(@"TransportSignpost"))
  {
    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      char v11 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
      }
      char v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    os_signpost_id_t v13 = [v9 hash];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      uint64_t v14 = [v8 length];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v14;
      _os_signpost_emit_with_name_impl(&dword_222C74000, v11, OS_SIGNPOST_EVENT, v13, "Endpoint SEND", "Send outgoing data! %@, %lu bytes", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v35 = 0;
  long long v15 = [(AccessoryTransportPluginUSBHost *)self activeEAInterfacesLock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__AccessoryTransportPluginUSBHost_sendOutgoingData_forEndpointWithUUID_connectionUUID___block_invoke;
  block[3] = &unk_2646674C0;
  void block[4] = self;
  id v16 = v9;
  id v26 = v16;
  __int16 v28 = &v30;
  id v17 = v8;
  id v27 = v17;
  uint64_t v29 = buf;
  dispatch_sync(v15, block);

  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    uint64_t v18 = [(AccessoryTransportPluginUSBHost *)self accessoryConnectionsLock];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __87__AccessoryTransportPluginUSBHost_sendOutgoingData_forEndpointWithUUID_connectionUUID___block_invoke_2;
    v21[3] = &unk_2646674E8;
    v21[4] = self;
    id v22 = v10;
    uint64_t v24 = &v30;
    id v23 = v17;
    dispatch_sync(v18, v21);
  }
  BOOL v19 = *((unsigned char *)v31 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __87__AccessoryTransportPluginUSBHost_sendOutgoingData_forEndpointWithUUID_connectionUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeEAInterfaces];
  id v4 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v3 = v4;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 writeData:*(void *)(a1 + 48)];
    id v3 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

void __87__AccessoryTransportPluginUSBHost_sendOutgoingData_forEndpointWithUUID_connectionUUID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryConnections];
  id v5 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 writeData:*(void *)(a1 + 48)];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) activeUSBCDCInterfaces];
    id v4 = [v3 objectForKey:*(void *)(a1 + 40)];

    if (v4) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 writeData:*(void *)(a1 + 48)] != 0;
    }
  }
}

- (BOOL)startDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v6 = +[AccessoryUSBBillboardDeviceManager sharedManager];
  LOBYTE(v4) = [v6 startDetectUSBBillboardDeviceWithVID:v5 PID:v4];

  return v4;
}

- (BOOL)stopDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v6 = +[AccessoryUSBBillboardDeviceManager sharedManager];
  LOBYTE(v4) = [v6 stopDetectUSBBillboardDeviceWithVID:v5 PID:v4];

  return v4;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (NSMutableDictionary)accessoryConnections
{
  return self->_accessoryConnections;
}

- (void)setAccessoryConnections:(id)a3
{
}

- (NSMutableDictionary)accessoryNativeUSBEndpoints
{
  return self->_accessoryNativeUSBEndpoints;
}

- (void)setAccessoryNativeUSBEndpoints:(id)a3
{
}

- (NSMutableDictionary)activeEAInterfaces
{
  return self->_activeEAInterfaces;
}

- (void)setActiveEAInterfaces:(id)a3
{
}

- (NSMutableDictionary)activeUSBCDCInterfaces
{
  return self->_activeUSBCDCInterfaces;
}

- (void)setActiveUSBCDCInterfaces:(id)a3
{
}

- (OS_dispatch_queue)accessoryConnectionsLock
{
  return self->_accessoryConnectionsLock;
}

- (void)setAccessoryConnectionsLock:(id)a3
{
}

- (OS_dispatch_queue)activeEAInterfacesLock
{
  return self->_activeEAInterfacesLock;
}

- (void)setActiveEAInterfacesLock:(id)a3
{
}

- (OS_dispatch_queue)accessoryNativeUSBEndpointsLock
{
  return self->_accessoryNativeUSBEndpointsLock;
}

- (void)setAccessoryNativeUSBEndpointsLock:(id)a3
{
}

- (int64_t)accessoryiAPIntefaceTrafficWaitListCount
{
  return self->_accessoryiAPIntefaceTrafficWaitListCount;
}

- (void)setAccessoryiAPIntefaceTrafficWaitListCount:(int64_t)a3
{
  self->_accessoryiAPIntefaceTrafficWaitListCount = a3;
}

- (NSMutableDictionary)accessoryiAPIntefaceTrafficWaitList
{
  return self->_accessoryiAPIntefaceTrafficWaitList;
}

- (void)setAccessoryiAPIntefaceTrafficWaitList:(id)a3
{
}

- (OS_dispatch_source)accessoryiAPIntefaceTrafficTimer
{
  return self->_accessoryiAPIntefaceTrafficTimer;
}

- (void)setAccessoryiAPIntefaceTrafficTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryiAPIntefaceTrafficTimer, 0);
  objc_storeStrong((id *)&self->_accessoryiAPIntefaceTrafficWaitList, 0);
  objc_storeStrong((id *)&self->_accessoryNativeUSBEndpointsLock, 0);
  objc_storeStrong((id *)&self->_activeEAInterfacesLock, 0);
  objc_storeStrong((id *)&self->_accessoryConnectionsLock, 0);
  objc_storeStrong((id *)&self->_activeUSBCDCInterfaces, 0);
  objc_storeStrong((id *)&self->_activeEAInterfaces, 0);
  objc_storeStrong((id *)&self->_accessoryNativeUSBEndpoints, 0);
  objc_storeStrong((id *)&self->_accessoryConnections, 0);
}

- (void)serviceAdded:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_7(&dword_222C74000, v2, (uint64_t)v2, "Unable to create iapInterface, destroying USB Host connection", v3);
}

- (void)serviceAdded:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  _os_log_debug_impl(&dword_222C74000, v2, OS_LOG_TYPE_DEBUG, "Found matching service!", v3, 2u);
}

- (void)serviceAdded:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_222C74000, v0, v1, "IOService Added Callback!", v2, v3, v4, v5, v6);
}

void __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_222C74000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", v1, v2, v3, v4, v5);
}

- (void)serviceRemoved:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_222C74000, v0, v1, "IOService Removed Callback!", v2, v3, v4, v5, v6);
}

- (void)VIDPIDServiceAdded:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_7(&dword_222C74000, v2, (uint64_t)v2, "Unable to create cdc Interface, destroying USB Host connection", v3);
}

- (void)VIDPIDServiceAdded:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_222C74000, v0, v1, "VIDPIDServiceAdded Callback!", v2, v3, v4, v5, v6);
}

- (void)VIDPIDServiceRemoved:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_222C74000, v0, v1, "VIDPIDServiceRemoved Callback!", v2, v3, v4, v5, v6);
}

@end