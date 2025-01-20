@interface USBCameraKitHubMonitor
+ (id)sharedMonitor;
- (BOOL)ioUSBCameraKitHubCurrentNeedUpdate;
- (BOOL)ioUSBCameraKitHubOverCurrentDetected;
- (BOOL)overcurrentState:(id)a3;
- (BOOL)supportsUSB20CameraKitHub:(id)a3;
- (BOOL)supportsUSB30CameraKitHub:(id)a3;
- (IONotificationPort)ioUSB20CameraKitHubNotifyPort;
- (IONotificationPort)ioUSB20CameraKitHubPortNotifyPort;
- (IONotificationPort)ioUSB30CameraKitHubNotifyPort;
- (IONotificationPort)ioUSB30CameraKitHubPortNotifyPort;
- (OS_dispatch_queue)queue;
- (USBCameraKitHubMonitor)init;
- (int64_t)once;
- (unsigned)getUSBHubSiphoningCurrentActualRequirementInmA:(id)a3;
- (unsigned)getUSBHubSiphoningCurrentRequirementInmA:(id)a3;
- (unsigned)getUSBHubUnitLoadInmA:(id)a3;
- (unsigned)ioUSB20CameraKitHubCurrentNeeded;
- (unsigned)ioUSB20CameraKitHubExtraRequestedPower;
- (unsigned)ioUSB20CameraKitHubMatchIterator;
- (unsigned)ioUSB20CameraKitHubNotification;
- (unsigned)ioUSB20CameraKitHubPortCurrentAllocation;
- (unsigned)ioUSB20CameraKitHubPortFailedRequestedPower;
- (unsigned)ioUSB20CameraKitHubPortMatchIterator;
- (unsigned)ioUSB20CameraKitHubPortNotification;
- (unsigned)ioUSB20CameraKitHubPortService;
- (unsigned)ioUSB20CameraKitHubPortTerminateIterator;
- (unsigned)ioUSB20CameraKitHubService;
- (unsigned)ioUSB20CameraKitHubTerminateIterator;
- (unsigned)ioUSB30CameraKitHubCurrentNeeded;
- (unsigned)ioUSB30CameraKitHubMatchIterator;
- (unsigned)ioUSB30CameraKitHubNotification;
- (unsigned)ioUSB30CameraKitHubPortCurrentAllocation;
- (unsigned)ioUSB30CameraKitHubPortFailedRequestedPower;
- (unsigned)ioUSB30CameraKitHubPortMatchIterator;
- (unsigned)ioUSB30CameraKitHubPortNotification;
- (unsigned)ioUSB30CameraKitHubPortService;
- (unsigned)ioUSB30CameraKitHubPortTerminateIterator;
- (unsigned)ioUSB30CameraKitHubService;
- (unsigned)ioUSB30CameraKitHubTerminateIterator;
- (unsigned)ioUSBCameraKitHubTotalCurrent;
- (void)_powerPostCCKHubChangeNotification;
- (void)_setOvercurrentSiphoning:(BOOL)a3 forUUID:(id)a4;
- (void)_updateSiphoningValuesFromDrivers:(id)a3;
- (void)dealloc;
- (void)initUSBCameraKitHubNotifications:(id)a3;
- (void)resetOvercurrentSiphoning:(id)a3;
- (void)setIoUSB20CameraKitHubCurrentNeeded:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubExtraRequestedPower:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubMatchIterator:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubNotification:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubNotifyPort:(IONotificationPort *)a3;
- (void)setIoUSB20CameraKitHubPortCurrentAllocation:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubPortFailedRequestedPower:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubPortMatchIterator:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubPortNotification:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubPortNotifyPort:(IONotificationPort *)a3;
- (void)setIoUSB20CameraKitHubPortService:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubPortTerminateIterator:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubService:(unsigned int)a3;
- (void)setIoUSB20CameraKitHubTerminateIterator:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubCurrentNeeded:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubMatchIterator:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubNotification:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubNotifyPort:(IONotificationPort *)a3;
- (void)setIoUSB30CameraKitHubPortCurrentAllocation:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubPortFailedRequestedPower:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubPortMatchIterator:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubPortNotification:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubPortNotifyPort:(IONotificationPort *)a3;
- (void)setIoUSB30CameraKitHubPortService:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubPortTerminateIterator:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubService:(unsigned int)a3;
- (void)setIoUSB30CameraKitHubTerminateIterator:(unsigned int)a3;
- (void)setIoUSBCameraKitHubCurrentNeedUpdate:(BOOL)a3;
- (void)setIoUSBCameraKitHubOverCurrentDetected:(BOOL)a3;
- (void)setIoUSBCameraKitHubTotalCurrent:(unsigned int)a3;
- (void)setOnce:(int64_t)a3;
- (void)setOvercurrentSiphoning:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation USBCameraKitHubMonitor

+ (id)sharedMonitor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__USBCameraKitHubMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_once_0 != -1) {
    dispatch_once(&sharedMonitor_once_0, block);
  }
  v2 = (void *)sharedMonitor_sharedInstance_0;
  return v2;
}

uint64_t __39__USBCameraKitHubMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  sharedMonitor_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (USBCameraKitHubMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)USBCameraKitHubMonitor;
  v2 = [(USBCameraKitHubMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessoryd.cameraKitHubQ", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  queue = self->_queue;
  self->_queue = 0;

  v4.receiver = self;
  v4.super_class = (Class)USBCameraKitHubMonitor;
  [(USBCameraKitHubMonitor *)&v4 dealloc];
}

- (void)initUSBCameraKitHubNotifications:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
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
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[USBCameraKitHubMonitor initUSBCameraKitHubNotifications:]((uint64_t)self, v7);
  }

  if (!self->_ioUSB20CameraKitHubNotifyPort)
  {
    v8 = +[USBCameraKitHubMonitor sharedMonitor];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(v16) = 138412290;
      *(void *)((char *)&v16 + 4) = v8;
      _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_INFO, "_InitUSB20CameraKitHubNotifications: monitor=%@", (uint8_t *)&v16, 0xCu);
    }

    v11 = [v8 queue];
    *(void *)&long long v16 = MEMORY[0x263EF8330];
    *((void *)&v16 + 1) = 3221225472;
    v17 = ___InitUSB20CameraKitHubNotifications_block_invoke;
    v18 = &unk_2646682E8;
    id v19 = v8;
    id v12 = v8;
    dispatch_async(v11, &v16);
  }
  if (!self->_ioUSB30CameraKitHubNotifyPort)
  {
    v13 = +[USBCameraKitHubMonitor sharedMonitor];
    v14 = [v13 queue];
    *(void *)&long long v16 = MEMORY[0x263EF8330];
    *((void *)&v16 + 1) = 3221225472;
    v17 = ___InitUSB30CameraKitHubNotifications_block_invoke;
    v18 = &unk_2646682E8;
    id v19 = v13;
    id v15 = v13;
    dispatch_async(v14, &v16);
  }
}

- (BOOL)supportsUSB20CameraKitHub:(id)a3
{
  return self->_ioUSB20CameraKitHubService != 0;
}

- (BOOL)supportsUSB30CameraKitHub:(id)a3
{
  return self->_ioUSB30CameraKitHubService != 0;
}

- (BOOL)overcurrentState:(id)a3
{
  return self->_ioUSBCameraKitHubOverCurrentDetected;
}

- (void)resetOvercurrentSiphoning:(id)a3
{
}

- (void)setOvercurrentSiphoning:(id)a3
{
}

- (unsigned)getUSBHubSiphoningCurrentRequirementInmA:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_ioUSBCameraKitHubCurrentNeedUpdate)
  {
    queue = self->_queue;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __67__USBCameraKitHubMonitor_getUSBHubSiphoningCurrentRequirementInmA___block_invoke;
    v27[3] = &unk_264668310;
    v27[4] = self;
    id v28 = v4;
    dispatch_sync(queue, v27);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned int ioUSB20CameraKitHubPortCurrentAllocation = self->_ioUSB20CameraKitHubPortCurrentAllocation;
      unsigned int ioUSB20CameraKitHubPortFailedRequestedPower = self->_ioUSB20CameraKitHubPortFailedRequestedPower;
      unsigned int ioUSB30CameraKitHubPortCurrentAllocation = self->_ioUSB30CameraKitHubPortCurrentAllocation;
      unsigned int ioUSB30CameraKitHubPortFailedRequestedPower = self->_ioUSB30CameraKitHubPortFailedRequestedPower;
      unsigned int ioUSB20CameraKitHubExtraRequestedPower = self->_ioUSB20CameraKitHubExtraRequestedPower;
      *(_DWORD *)buf = 67110144;
      unsigned int v30 = ioUSB20CameraKitHubPortCurrentAllocation;
      __int16 v31 = 1024;
      unsigned int v32 = ioUSB30CameraKitHubPortCurrentAllocation;
      __int16 v33 = 1024;
      unsigned int v34 = ioUSB20CameraKitHubPortFailedRequestedPower;
      __int16 v35 = 1024;
      unsigned int v36 = ioUSB30CameraKitHubPortFailedRequestedPower;
      __int16 v37 = 1024;
      unsigned int v38 = ioUSB20CameraKitHubExtraRequestedPower;
      _os_log_impl(&dword_222C9E000, v7, OS_LOG_TYPE_INFO, "getUSBHubSiphoningCurrentRequirement: CameraKitHubPortCurrentAllocation=%d/%d CameraKitHubPortFailedRequestedPower=%d/%d CameraKitHubExtraRequestedPower=%d", buf, 0x20u);
    }

    unsigned int v14 = self->_ioUSB30CameraKitHubPortCurrentAllocation;
    if (v14 <= self->_ioUSB30CameraKitHubPortFailedRequestedPower) {
      unsigned int v14 = self->_ioUSB30CameraKitHubPortFailedRequestedPower;
    }
    self->_unsigned int ioUSB30CameraKitHubCurrentNeeded = v14;
    unsigned int v15 = self->_ioUSB20CameraKitHubPortCurrentAllocation;
    unsigned int v16 = self->_ioUSB20CameraKitHubPortFailedRequestedPower;
    if (v15 > v16) {
      unsigned int v16 = self->_ioUSB20CameraKitHubPortCurrentAllocation;
    }
    if (v15 >= self->_ioUSB20CameraKitHubExtraRequestedPower) {
      unsigned int v17 = v16;
    }
    else {
      unsigned int v17 = self->_ioUSB20CameraKitHubExtraRequestedPower;
    }
    self->_unsigned int ioUSB20CameraKitHubCurrentNeeded = v17;
  }
  if (self->_ioUSB20CameraKitHubCurrentNeeded >= 0x65 && self->_ioUSB30CameraKitHubCurrentNeeded >= 0x97)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int ioUSB20CameraKitHubCurrentNeeded = self->_ioUSB20CameraKitHubCurrentNeeded;
      unsigned int ioUSB30CameraKitHubCurrentNeeded = self->_ioUSB30CameraKitHubCurrentNeeded;
      *(_DWORD *)buf = 67109376;
      unsigned int v30 = ioUSB20CameraKitHubCurrentNeeded;
      __int16 v31 = 1024;
      unsigned int v32 = ioUSB30CameraKitHubCurrentNeeded;
      _os_log_impl(&dword_222C9E000, v18, OS_LOG_TYPE_DEFAULT, "getUSBHubSiphoningCurrentRequirementInmA: ERROR: Unexpected extra power request on both CameraKitHub %d %d", buf, 0xEu);
    }
  }
  unsigned int v22 = self->_ioUSB30CameraKitHubCurrentNeeded;
  if (v22)
  {
    if (v22 <= 0x384) {
      unsigned int v23 = 900;
    }
    else {
      unsigned int v23 = self->_ioUSB30CameraKitHubCurrentNeeded;
    }
  }
  else
  {
    unsigned int v24 = self->_ioUSB20CameraKitHubCurrentNeeded;
    if (v24 <= 0x226) {
      unsigned int v25 = 550;
    }
    else {
      unsigned int v25 = self->_ioUSB20CameraKitHubCurrentNeeded;
    }
    if (v24) {
      unsigned int v23 = v25;
    }
    else {
      unsigned int v23 = 0;
    }
  }

  return v23;
}

uint64_t __67__USBCameraKitHubMonitor_getUSBHubSiphoningCurrentRequirementInmA___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSiphoningValuesFromDrivers:*(void *)(a1 + 40)];
}

- (unsigned)getUSBHubSiphoningCurrentActualRequirementInmA:(id)a3
{
  [(USBCameraKitHubMonitor *)self getUSBHubSiphoningCurrentRequirementInmA:a3];
  unsigned int result = self->_ioUSB30CameraKitHubCurrentNeeded;
  if (!result) {
    return self->_ioUSB20CameraKitHubCurrentNeeded;
  }
  return result;
}

- (unsigned)getUSBHubUnitLoadInmA:(id)a3
{
  if (self->_ioUSB30CameraKitHubCurrentNeeded) {
    return 150;
  }
  if (self->_ioUSB20CameraKitHubCurrentNeeded) {
    return 100;
  }
  return 0;
}

- (void)_powerPostCCKHubChangeNotification
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"ACCPlatformUSBCameraKitHubPlugin_HubChange" object:0 userInfo:0];
}

- (void)_setOvercurrentSiphoning:(BOOL)a3 forUUID:(id)a4
{
  self->_ioUSBCameraKitHubOverCurrentDetected = a3;
  self->_ioUSBCameraKitHubCurrentNeedUpdate = 1;
  [(USBCameraKitHubMonitor *)self _powerPostCCKHubChangeNotification];
}

- (void)_updateSiphoningValuesFromDrivers:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_ioUSBCameraKitHubCurrentNeedUpdate)
  {
    self->_ioUSBCameraKitHubCurrentNeedUpdate = 0;
    self->_unsigned int ioUSB20CameraKitHubPortCurrentAllocation = __USBCameraKitHubGetPortCurAllocation(self->_ioUSB20CameraKitHubService);
    self->_unsigned int ioUSB20CameraKitHubPortFailedRequestedPower = __USBCameraKitHubGetPortFailedRequestedPower(self->_ioUSB20CameraKitHubService);
    self->_unsigned int ioUSB30CameraKitHubPortCurrentAllocation = __USBCameraKitHubGetPortCurAllocation(self->_ioUSB30CameraKitHubService);
    self->_unsigned int ioUSB30CameraKitHubPortFailedRequestedPower = __USBCameraKitHubGetPortFailedRequestedPower(self->_ioUSB30CameraKitHubService);
    io_registry_entry_t ioUSB20CameraKitHubService = self->_ioUSB20CameraKitHubService;
    if (ioUSB20CameraKitHubService)
    {
      io_registry_entry_t child = -1431655766;
      if (IORegistryEntryGetChildEntry(ioUSB20CameraKitHubService, "IOService", &child))
      {
        io_registry_entry_t ioUSB20CameraKitHubService = 0;
      }
      else
      {
        id v6 = +[USBCameraKitHubMonitor sharedMonitor];
        io_registry_entry_t object = -1431655766;
        if (IORegistryEntryGetChildEntry(child, "IOService", &object))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v7 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              __29__SleepAssertionManager_init__block_invoke_cold_1();
            }
            v7 = MEMORY[0x263EF8438];
            id v10 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = [v6 ioUSB30CameraKitHubService];
            int valuePtr = 67109888;
            if (v11 == ioUSB20CameraKitHubService) {
              int v12 = 2;
            }
            else {
              int v12 = 3;
            }
            *(_DWORD *)uint64_t v39 = ioUSB20CameraKitHubService;
            *(_WORD *)&v39[4] = 1024;
            *(_DWORD *)&v39[6] = v12;
            *(_WORD *)v40 = 1024;
            *(_DWORD *)&v40[2] = child;
            *(_WORD *)v41 = 1024;
            *(_DWORD *)&v41[2] = 0;
            _os_log_impl(&dword_222C9E000, v7, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortExtraRequestedPower: failed to get child kIOUSBPlane, service=%d(%d) child=%d, result=%d", (uint8_t *)&valuePtr, 0x1Au);
          }

          io_registry_entry_t ioUSB20CameraKitHubService = 0;
        }
        else
        {
          CFNumberRef v8 = (const __CFNumber *)IORegistryEntrySearchCFProperty(child, "IOService", @"kUSBDesiredChargingCurrent", (CFAllocatorRef)*MEMORY[0x263EFFB08], 1u);
          if (v8)
          {
            CFNumberRef v9 = v8;
            int valuePtr = -1431655766;
            CFNumberGetValue(v8, kCFNumberIntType, &valuePtr);
            io_registry_entry_t ioUSB20CameraKitHubService = valuePtr;
            CFRelease(v9);
          }
          else
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v13 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                __29__SleepAssertionManager_init__block_invoke_cold_1();
              }
              v13 = MEMORY[0x263EF8438];
              id v14 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              if ([v6 ioUSB30CameraKitHubService] == ioUSB20CameraKitHubService) {
                int v15 = 2;
              }
              else {
                int v15 = 3;
              }
              int valuePtr = 136316162;
              *(void *)uint64_t v39 = "kUSBDesiredChargingCurrent";
              *(_WORD *)&v39[8] = 1024;
              *(_DWORD *)v40 = ioUSB20CameraKitHubService;
              *(_WORD *)&v40[4] = 1024;
              *(_DWORD *)v41 = v15;
              *(_WORD *)&v41[4] = 1024;
              *(_DWORD *)v42 = child;
              *(_WORD *)&v42[4] = 1024;
              *(_DWORD *)v43 = 0;
              _os_log_impl(&dword_222C9E000, v13, OS_LOG_TYPE_DEFAULT, "__USBCameraKitHubGetPortExtraRequestedPower: failed to get %s, service=%d(%d) child=%d usbExtraRequestedPowerRef=%x, expected for normal condition", (uint8_t *)&valuePtr, 0x24u);
            }

            io_registry_entry_t ioUSB20CameraKitHubService = 0;
          }
          IOObjectRelease(object);
        }
        IOObjectRelease(child);
      }
    }
    self->_unsigned int ioUSB20CameraKitHubExtraRequestedPower = ioUSB20CameraKitHubService;
    if ([(USBCameraKitHubMonitor *)self overcurrentState:v4]
      && (self->_ioUSB20CameraKitHubPortCurrentAllocation || self->_ioUSB30CameraKitHubPortCurrentAllocation))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        unsigned int v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        unsigned int v16 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        unsigned int ioUSB20CameraKitHubPortCurrentAllocation = self->_ioUSB20CameraKitHubPortCurrentAllocation;
        unsigned int ioUSB20CameraKitHubPortFailedRequestedPower = self->_ioUSB20CameraKitHubPortFailedRequestedPower;
        unsigned int ioUSB30CameraKitHubPortCurrentAllocation = self->_ioUSB30CameraKitHubPortCurrentAllocation;
        unsigned int ioUSB30CameraKitHubPortFailedRequestedPower = self->_ioUSB30CameraKitHubPortFailedRequestedPower;
        unsigned int ioUSB20CameraKitHubExtraRequestedPower = self->_ioUSB20CameraKitHubExtraRequestedPower;
        BOOL ioUSBCameraKitHubOverCurrentDetected = self->_ioUSBCameraKitHubOverCurrentDetected;
        int valuePtr = 67110400;
        *(_DWORD *)uint64_t v39 = ioUSB20CameraKitHubPortCurrentAllocation;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = ioUSB30CameraKitHubPortCurrentAllocation;
        *(_WORD *)v40 = 1024;
        *(_DWORD *)&v40[2] = ioUSB20CameraKitHubPortFailedRequestedPower;
        *(_WORD *)v41 = 1024;
        *(_DWORD *)&v41[2] = ioUSB30CameraKitHubPortFailedRequestedPower;
        *(_WORD *)v42 = 1024;
        *(_DWORD *)&v42[2] = ioUSB20CameraKitHubExtraRequestedPower;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = ioUSBCameraKitHubOverCurrentDetected;
        _os_log_impl(&dword_222C9E000, v16, OS_LOG_TYPE_INFO, "_updateSiphoningValuesFromDrivers: ResetOvercurrentSiphoning(), PortCurrentAllocation=%d/%d PortFailedRequestedPower=%d/%d ExtraRequestedPower=%d OverCurrentDetected=%d", (uint8_t *)&valuePtr, 0x26u);
      }

      [(USBCameraKitHubMonitor *)self resetOvercurrentSiphoning:v4];
    }
    if (self->_ioUSBCameraKitHubOverCurrentDetected)
    {
      *(void *)&self->_unsigned int ioUSB20CameraKitHubPortCurrentAllocation = 0x1F400000064;
      if ([(USBCameraKitHubMonitor *)self supportsUSB30CameraKitHub:v4])
      {
        self->_unsigned int ioUSB20CameraKitHubPortFailedRequestedPower = 100;
        uint64_t v24 = 0x38400000096;
      }
      else
      {
        uint64_t v24 = 0;
      }
      *(void *)&self->_unsigned int ioUSB30CameraKitHubPortCurrentAllocation = v24;
      self->_unsigned int ioUSB20CameraKitHubExtraRequestedPower = 0;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      unsigned int v25 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      unsigned int v25 = MEMORY[0x263EF8438];
      id v26 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v27 = [MEMORY[0x263EFF910] date];
      [v27 timeIntervalSince1970];
      unsigned int ioUSBCameraKitHubTotalCurrent = self->_ioUSBCameraKitHubTotalCurrent;
      unsigned int v29 = self->_ioUSB20CameraKitHubPortCurrentAllocation;
      unsigned int v30 = self->_ioUSB20CameraKitHubPortFailedRequestedPower;
      unsigned int v31 = self->_ioUSB30CameraKitHubPortCurrentAllocation;
      unsigned int v32 = self->_ioUSB30CameraKitHubPortFailedRequestedPower;
      unsigned int v33 = self->_ioUSB20CameraKitHubExtraRequestedPower;
      BOOL v34 = self->_ioUSBCameraKitHubOverCurrentDetected;
      int valuePtr = 134219776;
      *(void *)uint64_t v39 = v35;
      *(_WORD *)&v39[8] = 1024;
      *(_DWORD *)v40 = ioUSBCameraKitHubTotalCurrent;
      *(_WORD *)&v40[4] = 1024;
      *(_DWORD *)v41 = v29;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)v42 = v31;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)v43 = v30;
      *(_WORD *)&v43[4] = 1024;
      unsigned int v44 = v32;
      __int16 v45 = 1024;
      unsigned int v46 = v33;
      __int16 v47 = 1024;
      BOOL v48 = v34;
      _os_log_impl(&dword_222C9E000, v25, OS_LOG_TYPE_INFO, "_updateSiphoningValuesFromDrivers: %f TotalCurrent=%d PortCurrentAllocation=%d/%d PortFailedRequestedPower=%d/%d ExtraRequestedPower=%d OverCurrentDetected=%d", (uint8_t *)&valuePtr, 0x36u);
    }
  }
}

- (IONotificationPort)ioUSB20CameraKitHubNotifyPort
{
  return self->_ioUSB20CameraKitHubNotifyPort;
}

- (void)setIoUSB20CameraKitHubNotifyPort:(IONotificationPort *)a3
{
  self->_ioUSB20CameraKitHubNotifyPort = a3;
}

- (unsigned)ioUSB20CameraKitHubNotification
{
  return self->_ioUSB20CameraKitHubNotification;
}

- (void)setIoUSB20CameraKitHubNotification:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubNotification = a3;
}

- (unsigned)ioUSB20CameraKitHubService
{
  return self->_ioUSB20CameraKitHubService;
}

- (void)setIoUSB20CameraKitHubService:(unsigned int)a3
{
  self->_io_registry_entry_t ioUSB20CameraKitHubService = a3;
}

- (unsigned)ioUSB20CameraKitHubMatchIterator
{
  return self->_ioUSB20CameraKitHubMatchIterator;
}

- (void)setIoUSB20CameraKitHubMatchIterator:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubMatchIterator = a3;
}

- (unsigned)ioUSB20CameraKitHubTerminateIterator
{
  return self->_ioUSB20CameraKitHubTerminateIterator;
}

- (void)setIoUSB20CameraKitHubTerminateIterator:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubTerminateIterator = a3;
}

- (unsigned)ioUSB20CameraKitHubCurrentNeeded
{
  return self->_ioUSB20CameraKitHubCurrentNeeded;
}

- (void)setIoUSB20CameraKitHubCurrentNeeded:(unsigned int)a3
{
  self->_unsigned int ioUSB20CameraKitHubCurrentNeeded = a3;
}

- (unsigned)ioUSB20CameraKitHubPortCurrentAllocation
{
  return self->_ioUSB20CameraKitHubPortCurrentAllocation;
}

- (void)setIoUSB20CameraKitHubPortCurrentAllocation:(unsigned int)a3
{
  self->_unsigned int ioUSB20CameraKitHubPortCurrentAllocation = a3;
}

- (unsigned)ioUSB20CameraKitHubPortFailedRequestedPower
{
  return self->_ioUSB20CameraKitHubPortFailedRequestedPower;
}

- (void)setIoUSB20CameraKitHubPortFailedRequestedPower:(unsigned int)a3
{
  self->_unsigned int ioUSB20CameraKitHubPortFailedRequestedPower = a3;
}

- (unsigned)ioUSB20CameraKitHubExtraRequestedPower
{
  return self->_ioUSB20CameraKitHubExtraRequestedPower;
}

- (void)setIoUSB20CameraKitHubExtraRequestedPower:(unsigned int)a3
{
  self->_unsigned int ioUSB20CameraKitHubExtraRequestedPower = a3;
}

- (IONotificationPort)ioUSB20CameraKitHubPortNotifyPort
{
  return self->_ioUSB20CameraKitHubPortNotifyPort;
}

- (void)setIoUSB20CameraKitHubPortNotifyPort:(IONotificationPort *)a3
{
  self->_ioUSB20CameraKitHubPortNotifyPort = a3;
}

- (unsigned)ioUSB20CameraKitHubPortNotification
{
  return self->_ioUSB20CameraKitHubPortNotification;
}

- (void)setIoUSB20CameraKitHubPortNotification:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortNotification = a3;
}

- (unsigned)ioUSB20CameraKitHubPortService
{
  return self->_ioUSB20CameraKitHubPortService;
}

- (void)setIoUSB20CameraKitHubPortService:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortService = a3;
}

- (unsigned)ioUSB20CameraKitHubPortMatchIterator
{
  return self->_ioUSB20CameraKitHubPortMatchIterator;
}

- (void)setIoUSB20CameraKitHubPortMatchIterator:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortMatchIterator = a3;
}

- (unsigned)ioUSB20CameraKitHubPortTerminateIterator
{
  return self->_ioUSB20CameraKitHubPortTerminateIterator;
}

- (void)setIoUSB20CameraKitHubPortTerminateIterator:(unsigned int)a3
{
  self->_ioUSB20CameraKitHubPortTerminateIterator = a3;
}

- (IONotificationPort)ioUSB30CameraKitHubNotifyPort
{
  return self->_ioUSB30CameraKitHubNotifyPort;
}

- (void)setIoUSB30CameraKitHubNotifyPort:(IONotificationPort *)a3
{
  self->_ioUSB30CameraKitHubNotifyPort = a3;
}

- (unsigned)ioUSB30CameraKitHubNotification
{
  return self->_ioUSB30CameraKitHubNotification;
}

- (void)setIoUSB30CameraKitHubNotification:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubNotification = a3;
}

- (unsigned)ioUSB30CameraKitHubService
{
  return self->_ioUSB30CameraKitHubService;
}

- (void)setIoUSB30CameraKitHubService:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubService = a3;
}

- (unsigned)ioUSB30CameraKitHubMatchIterator
{
  return self->_ioUSB30CameraKitHubMatchIterator;
}

- (void)setIoUSB30CameraKitHubMatchIterator:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubMatchIterator = a3;
}

- (unsigned)ioUSB30CameraKitHubTerminateIterator
{
  return self->_ioUSB30CameraKitHubTerminateIterator;
}

- (void)setIoUSB30CameraKitHubTerminateIterator:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubTerminateIterator = a3;
}

- (unsigned)ioUSB30CameraKitHubCurrentNeeded
{
  return self->_ioUSB30CameraKitHubCurrentNeeded;
}

- (void)setIoUSB30CameraKitHubCurrentNeeded:(unsigned int)a3
{
  self->_unsigned int ioUSB30CameraKitHubCurrentNeeded = a3;
}

- (unsigned)ioUSB30CameraKitHubPortCurrentAllocation
{
  return self->_ioUSB30CameraKitHubPortCurrentAllocation;
}

- (void)setIoUSB30CameraKitHubPortCurrentAllocation:(unsigned int)a3
{
  self->_unsigned int ioUSB30CameraKitHubPortCurrentAllocation = a3;
}

- (unsigned)ioUSB30CameraKitHubPortFailedRequestedPower
{
  return self->_ioUSB30CameraKitHubPortFailedRequestedPower;
}

- (void)setIoUSB30CameraKitHubPortFailedRequestedPower:(unsigned int)a3
{
  self->_unsigned int ioUSB30CameraKitHubPortFailedRequestedPower = a3;
}

- (IONotificationPort)ioUSB30CameraKitHubPortNotifyPort
{
  return self->_ioUSB30CameraKitHubPortNotifyPort;
}

- (void)setIoUSB30CameraKitHubPortNotifyPort:(IONotificationPort *)a3
{
  self->_ioUSB30CameraKitHubPortNotifyPort = a3;
}

- (unsigned)ioUSB30CameraKitHubPortNotification
{
  return self->_ioUSB30CameraKitHubPortNotification;
}

- (void)setIoUSB30CameraKitHubPortNotification:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortNotification = a3;
}

- (unsigned)ioUSB30CameraKitHubPortService
{
  return self->_ioUSB30CameraKitHubPortService;
}

- (void)setIoUSB30CameraKitHubPortService:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortService = a3;
}

- (unsigned)ioUSB30CameraKitHubPortMatchIterator
{
  return self->_ioUSB30CameraKitHubPortMatchIterator;
}

- (void)setIoUSB30CameraKitHubPortMatchIterator:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortMatchIterator = a3;
}

- (unsigned)ioUSB30CameraKitHubPortTerminateIterator
{
  return self->_ioUSB30CameraKitHubPortTerminateIterator;
}

- (void)setIoUSB30CameraKitHubPortTerminateIterator:(unsigned int)a3
{
  self->_ioUSB30CameraKitHubPortTerminateIterator = a3;
}

- (unsigned)ioUSBCameraKitHubTotalCurrent
{
  return self->_ioUSBCameraKitHubTotalCurrent;
}

- (void)setIoUSBCameraKitHubTotalCurrent:(unsigned int)a3
{
  self->_unsigned int ioUSBCameraKitHubTotalCurrent = a3;
}

- (BOOL)ioUSBCameraKitHubCurrentNeedUpdate
{
  return self->_ioUSBCameraKitHubCurrentNeedUpdate;
}

- (void)setIoUSBCameraKitHubCurrentNeedUpdate:(BOOL)a3
{
  self->_ioUSBCameraKitHubCurrentNeedUpdate = a3;
}

- (BOOL)ioUSBCameraKitHubOverCurrentDetected
{
  return self->_ioUSBCameraKitHubOverCurrentDetected;
}

- (void)setIoUSBCameraKitHubOverCurrentDetected:(BOOL)a3
{
  self->_BOOL ioUSBCameraKitHubOverCurrentDetected = a3;
}

- (int64_t)once
{
  return self->_once;
}

- (void)setOnce:(int64_t)a3
{
  self->_once = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initUSBCameraKitHubNotifications:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 112);
  int v3 = *(unsigned __int8 *)(a1 + 128);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl(&dword_222C9E000, a2, OS_LOG_TYPE_DEBUG, "initUSBCameraKitHubNotifications: _ioUSB20CameraKitHubNotifyPort=%d _ioUSB30CameraKitHubNotifyPort=%d", (uint8_t *)v4, 0xEu);
}

@end