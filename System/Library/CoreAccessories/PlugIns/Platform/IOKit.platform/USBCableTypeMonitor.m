@interface USBCableTypeMonitor
+ (id)sharedMonitor;
+ (int)usbCableType;
+ (void)usbCableType;
- (USBCableTypeMonitor)init;
- (void)cleanupUSB30XHCIRemovablePortNotifications;
- (void)dealloc;
- (void)initUSB30XHCIRemovablePortNotifications;
- (void)sendUSBCableTypeChangedNotification;
- (void)startCableTypeMonitoringForUUID:(id)a3;
- (void)stopCableTypeMonitoringForUUID:(id)a3;
@end

@implementation USBCableTypeMonitor

+ (id)sharedMonitor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__USBCableTypeMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_once_1 != -1) {
    dispatch_once(&sharedMonitor_once_1, block);
  }
  v2 = (void *)sharedMonitor_sharedInstance_1;
  return v2;
}

uint64_t __36__USBCableTypeMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  sharedMonitor_sharedInstance_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (USBCableTypeMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)USBCableTypeMonitor;
  v2 = [(USBCableTypeMonitor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    registeredUUIDs = v2->_registeredUUIDs;
    v2->_uid = 0;
    v2->_registeredUUIDs = 0;

    v3->_ioUSB30XHCIRemovablePortNotifyPort = 0;
    *(void *)&v3->_ioUSB30XHCIRemovablePortNotification = 0;
    *(void *)&v3->_ioUSB30XHCIRemovablePortMatchIterator = 0;
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)USBCableTypeMonitor;
  [(USBCableTypeMonitor *)&v2 dealloc];
}

- (void)startCableTypeMonitoringForUUID:(id)a3
{
  id v4 = a3;
  registeredUUIDs = self->_registeredUUIDs;
  id v8 = v4;
  if (!registeredUUIDs)
  {
    objc_super v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_registeredUUIDs;
    self->_registeredUUIDs = v6;

    id v4 = v8;
    registeredUUIDs = self->_registeredUUIDs;
  }
  [(NSMutableArray *)registeredUUIDs addObject:v4];
  if ([(NSMutableArray *)self->_registeredUUIDs count]) {
    [(USBCableTypeMonitor *)self initUSB30XHCIRemovablePortNotifications];
  }
}

- (void)stopCableTypeMonitoringForUUID:(id)a3
{
  [(NSMutableArray *)self->_registeredUUIDs removeObject:a3];
  if (![(NSMutableArray *)self->_registeredUUIDs count])
  {
    [(USBCableTypeMonitor *)self cleanupUSB30XHCIRemovablePortNotifications];
  }
}

+ (int)usbCableType
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  mach_port_t mainPort = -1431655766;
  if (IOMasterPort(0, &mainPort))
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
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v8 = MEMORY[0x263EF8438];
      id v3 = MEMORY[0x263EF8438];
    }
    else
    {
      id v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[USBCableTypeMonitor usbCableType].cold.6();
    }
LABEL_17:

    id v6 = 0;
    goto LABEL_18;
  }
  io_registry_entry_t RootEntry = IORegistryGetRootEntry(mainPort);
  if (!RootEntry)
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 1;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v8 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      id v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[USBCableTypeMonitor usbCableType]();
    }
    goto LABEL_17;
  }
  v5 = (void *)IORegistryEntrySearchCFProperty(RootEntry, "IOService", @"AppleUSBCableType", 0, 1u);
  if (!v5)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v8 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[USBCableTypeMonitor usbCableType].cold.4();
    }
    goto LABEL_17;
  }
  id v6 = v5;
  if ([v6 isEqualToString:@"Detached"])
  {
LABEL_18:
    int v7 = 0;
    goto LABEL_19;
  }
  if ([v6 isEqualToString:@"USBHost"])
  {
    int v7 = 1;
  }
  else if ([v6 isEqualToString:@"USBHostAltConfig"])
  {
    int v7 = 2;
  }
  else if ([v6 isEqualToString:@"USBDevice"])
  {
    int v7 = 3;
  }
  else if ([v6 isEqualToString:@"USBDeviceNeedsAuthentication"])
  {
    int v7 = 4;
  }
  else if ([v6 isEqualToString:@"USB3Host"])
  {
    int v7 = 5;
  }
  else if ([v6 isEqualToString:@"USB3HostAltConfig"])
  {
    int v7 = 6;
  }
  else if ([v6 isEqualToString:@"USB3Device"])
  {
    int v7 = 7;
  }
  else if ([v6 isEqualToString:@"USB3DeviceNeedsAuthentication"])
  {
    int v7 = 8;
  }
  else
  {
    int v7 = 0;
  }
LABEL_19:
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
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_INFO, "prop='%@' __usbCableType=%d", buf, 0x12u);
  }

  if (v6) {
    CFRelease(v6);
  }
  mach_port_deallocate(*MEMORY[0x263EF8960], mainPort);

  return v7;
}

- (void)sendUSBCableTypeChangedNotification
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  obj = self->_registeredUUIDs;
  uint64_t v2 = [(NSMutableArray *)obj countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * v5);
        v15[0] = @"ACCPlatformCableTypePlugin_CableTypeKey";
        int v7 = [NSNumber numberWithInt:__usbCableType];
        v15[1] = @"ACCPlatformCableTypePlugin_ConnectionUUIDKey";
        v16[0] = v7;
        v16[1] = v6;
        id v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

        v9 = [MEMORY[0x263F08A00] defaultCenter];
        [v9 postNotificationName:@"ACCPlatformCableTypePlugin_USBCableTypeDidChange" object:0 userInfo:v8];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v3);
  }
}

- (void)initUSB30XHCIRemovablePortNotifications
{
  *(void *)&self->_ioUSB30XHCIRemovablePortMatchIterator = 0;
  p_ioUSB30XHCIRemovablePortMatchIterator = &self->_ioUSB30XHCIRemovablePortMatchIterator;
  *(void *)&self->_ioUSB30XHCIRemovablePortNotification = 0;
  IONotificationPortRef v4 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
  *((void *)p_ioUSB30XHCIRemovablePortMatchIterator - 2) = v4;
  if (v4)
  {
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioUSB30XHCIRemovablePortNotifyPort);
    CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    CFMutableDictionaryRef v7 = IOServiceMatching("AppleUSB30XHCIRemovablePort");
    CFRetain(v7);
    if (IOServiceAddMatchingNotification(self->_ioUSB30XHCIRemovablePortNotifyPort, "IOServicePublish", v7, (IOServiceMatchingCallback)__USB30XHCIRemovablePortClassMatch, (void *)self->_uid, p_ioUSB30XHCIRemovablePortMatchIterator)|| (uint64_t v10 = *p_ioUSB30XHCIRemovablePortMatchIterator, !v10))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v8 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[USBFaultMonitor initFaultConditionNotifications]();
      }

      CFRelease(v7);
    }
    else
    {
      long long v11 = p_ioUSB30XHCIRemovablePortMatchIterator + 1;
      __USB30XHCIRemovablePortClassMatch(self->_uid, v10);
      if (IOServiceAddMatchingNotification(self->_ioUSB30XHCIRemovablePortNotifyPort, "IOServiceTerminate", v7, (IOServiceMatchingCallback)__USB30XHCIRemovablePortClassTerminate, (void *)self->_uid, v11)|| (uint64_t v14 = *v11, !v14))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          long long v12 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          }
          long long v12 = MEMORY[0x263EF8438];
          id v13 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[USBFaultMonitor initFaultConditionNotifications]();
        }
      }
      else
      {
        uid = (void *)self->_uid;
        __USB30XHCIRemovablePortClassTerminate(uid, v14);
      }
    }
  }
}

- (void)cleanupUSB30XHCIRemovablePortNotifications
{
  io_object_t ioUSB30XHCIRemovablePortNotification = self->_ioUSB30XHCIRemovablePortNotification;
  if (ioUSB30XHCIRemovablePortNotification)
  {
    IOObjectRelease(ioUSB30XHCIRemovablePortNotification);
    self->_io_object_t ioUSB30XHCIRemovablePortNotification = 0;
  }
  io_object_t ioUSB30XHCIRemovablePortService = self->_ioUSB30XHCIRemovablePortService;
  if (ioUSB30XHCIRemovablePortService)
  {
    IOObjectRelease(ioUSB30XHCIRemovablePortService);
    self->_io_object_t ioUSB30XHCIRemovablePortService = 0;
  }
  io_object_t ioUSB30XHCIRemovablePortMatchIterator = self->_ioUSB30XHCIRemovablePortMatchIterator;
  if (ioUSB30XHCIRemovablePortMatchIterator)
  {
    IOObjectRelease(ioUSB30XHCIRemovablePortMatchIterator);
    self->_io_object_t ioUSB30XHCIRemovablePortMatchIterator = 0;
  }
  io_object_t ioUSB30XHCIRemovablePortTerminateIterator = self->_ioUSB30XHCIRemovablePortTerminateIterator;
  if (ioUSB30XHCIRemovablePortTerminateIterator)
  {
    IOObjectRelease(ioUSB30XHCIRemovablePortTerminateIterator);
    self->_io_object_t ioUSB30XHCIRemovablePortTerminateIterator = 0;
  }
  ioUSB30XHCIRemovablePortNotifyPort = self->_ioUSB30XHCIRemovablePortNotifyPort;
  if (ioUSB30XHCIRemovablePortNotifyPort)
  {
    IONotificationPortDestroy(ioUSB30XHCIRemovablePortNotifyPort);
    self->_ioUSB30XHCIRemovablePortNotifyPort = 0;
  }
}

- (void).cxx_destruct
{
}

+ (void)usbCableType
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR - IOMasterPort() failed", v2, v3, v4, v5, v6);
}

@end