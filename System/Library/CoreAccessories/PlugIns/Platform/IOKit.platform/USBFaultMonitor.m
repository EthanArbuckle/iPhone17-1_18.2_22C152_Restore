@interface USBFaultMonitor
+ (id)sharedMonitor;
- (BOOL)getFaultState:(int)a3;
- (USBFaultMonitor)init;
- (void)checkUSBCardReaderProperty:(unsigned int)a3;
- (void)dealloc;
- (void)initFaultConditionNotifications;
- (void)registerFaultInterest:(int)a3;
- (void)sendUSBFaultNotification;
- (void)setFaultState:(int)a3 flag:(BOOL)a4;
- (void)startFaultMonitoringForUUID:(id)a3;
- (void)stopFaultMonitoringForUUID:(id)a3;
@end

@implementation USBFaultMonitor

+ (id)sharedMonitor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__USBFaultMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_once != -1) {
    dispatch_once(&sharedMonitor_once, block);
  }
  v2 = (void *)sharedMonitor_sharedInstance;
  return v2;
}

uint64_t __32__USBFaultMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  sharedMonitor_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (USBFaultMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)USBFaultMonitor;
  v2 = [(USBFaultMonitor *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_uid = 0;
    usbFaultStates = v2->_usbFaultStates;
    v2->_usbFaultStates = 0;

    usbFaultStatesSent = v3->_usbFaultStatesSent;
    v3->_usbFaultStatesSent = 0;

    requestedUSBFaultNotifications = v3->_requestedUSBFaultNotifications;
    v3->_requestedUSBFaultNotifications = 0;

    registeredUUIDs = v3->_registeredUUIDs;
    v3->_registeredUUIDs = 0;
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)USBFaultMonitor;
  [(USBFaultMonitor *)&v2 dealloc];
}

- (void)startFaultMonitoringForUUID:(id)a3
{
  id v4 = a3;
  registeredUUIDs = self->_registeredUUIDs;
  id v15 = v4;
  if (!registeredUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_registeredUUIDs;
    self->_registeredUUIDs = v6;

    id v4 = v15;
    registeredUUIDs = self->_registeredUUIDs;
  }
  [(NSMutableArray *)registeredUUIDs addObject:v4];
  if ([(NSMutableArray *)self->_registeredUUIDs count])
  {
    v8 = +[IAPUIDManager sharedIAPUIDManager];
    self->_uid = [v8 iapUID:self];

    objc_super v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    usbFaultStates = self->_usbFaultStates;
    self->_usbFaultStates = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    usbFaultStatesSent = self->_usbFaultStatesSent;
    self->_usbFaultStatesSent = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requestedUSBFaultNotifications = self->_requestedUSBFaultNotifications;
    self->_requestedUSBFaultNotifications = v13;

    [(USBFaultMonitor *)self registerFaultInterest:2];
    [(USBFaultMonitor *)self initFaultConditionNotifications];
  }
}

- (void)stopFaultMonitoringForUUID:(id)a3
{
  [(NSMutableArray *)self->_registeredUUIDs removeObject:a3];
  id v4 = +[IAPUIDManager sharedIAPUIDManager];
  [v4 removeIAPUID:self->_uid];

  self->_uid = 0;
  if (![(NSMutableArray *)self->_registeredUUIDs count])
  {
    if (self->_ioUSBCardReaderNotifyPort)
    {
      Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource(self->_ioUSBCardReaderNotifyPort);
      CFRunLoopRemoveSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      IONotificationPortDestroy(self->_ioUSBCardReaderNotifyPort);
      self->_ioUSBCardReaderNotifyPort = 0;
    }
    io_object_t ioUSBCardReaderNotification = self->_ioUSBCardReaderNotification;
    if (ioUSBCardReaderNotification)
    {
      IOObjectRelease(ioUSBCardReaderNotification);
      self->_io_object_t ioUSBCardReaderNotification = 0;
    }
    io_object_t ioUSBCardReaderService = self->_ioUSBCardReaderService;
    if (ioUSBCardReaderService)
    {
      IOObjectRelease(ioUSBCardReaderService);
      self->_io_object_t ioUSBCardReaderService = 0;
    }
    io_object_t ioUSBCardReaderMatchIterator = self->_ioUSBCardReaderMatchIterator;
    if (ioUSBCardReaderMatchIterator)
    {
      IOObjectRelease(ioUSBCardReaderMatchIterator);
      self->_io_object_t ioUSBCardReaderMatchIterator = 0;
    }
    io_object_t ioUSBCardReaderTerminateIterator = self->_ioUSBCardReaderTerminateIterator;
    if (ioUSBCardReaderTerminateIterator)
    {
      IOObjectRelease(ioUSBCardReaderTerminateIterator);
      self->_io_object_t ioUSBCardReaderTerminateIterator = 0;
    }
    usbFaultStates = self->_usbFaultStates;
    if (usbFaultStates)
    {
      self->_usbFaultStates = 0;
    }
    usbFaultStatesSent = self->_usbFaultStatesSent;
    if (usbFaultStatesSent)
    {
      self->_usbFaultStatesSent = 0;
    }
    requestedUSBFaultNotifications = self->_requestedUSBFaultNotifications;
    if (requestedUSBFaultNotifications)
    {
      self->_requestedUSBFaultNotifications = 0;
    }
  }
}

- (void)sendUSBFaultNotification
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obj = self->_registeredUUIDs;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        v16[0] = @"USBFaultNotification_FaultTypeKey";
        v8 = objc_msgSend(NSNumber, "numberWithBool:", -[USBFaultMonitor getFaultState:](self, "getFaultState:", 2));
        v16[1] = @"USBFaultNotification_ConnectionUUIDKey";
        v17[0] = v8;
        v17[1] = v7;
        objc_super v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

        v10 = [MEMORY[0x263F08A00] defaultCenter];
        [v10 postNotificationName:@"USBFaultNotification" object:0 userInfo:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v4);
  }

  [(NSMutableDictionary *)self->_usbFaultStatesSent setDictionary:self->_usbFaultStates];
}

- (void)setFaultState:(int)a3 flag:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    objc_super v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    objc_super v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109376;
    v13[1] = v5;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_INFO, "type=%d flag=%d", (uint8_t *)v13, 0xEu);
  }

  usbFaultStates = self->_usbFaultStates;
  v11 = [NSNumber numberWithBool:v4];
  long long v12 = [NSNumber numberWithInt:v5];
  [(NSMutableDictionary *)usbFaultStates setObject:v11 forKey:v12];
}

- (BOOL)getFaultState:(int)a3
{
  usbFaultStates = self->_usbFaultStates;
  BOOL v4 = [NSNumber numberWithInt:*(void *)&a3];
  uint64_t v5 = [(NSMutableDictionary *)usbFaultStates objectForKey:v4];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)registerFaultInterest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  requestedUSBFaultNotifications = self->_requestedUSBFaultNotifications;
  id v6 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithInt:v3];
  [(NSMutableDictionary *)requestedUSBFaultNotifications setObject:v6 forKey:v5];
}

- (void)initFaultConditionNotifications
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_222C9E000, v0, v1, "IOServiceAddMatchingNotification terminate fail status:%02X, ioIter:%04X\n", v2, v3);
}

- (void)checkUSBCardReaderProperty:(unsigned int)a3
{
  CFMutableDictionaryRef properties = 0;
  if (IORegistryEntryCreateCFProperties(a3, &properties, 0, 0) || !properties)
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v6 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      id v6 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[USBFaultMonitor checkUSBCardReaderProperty:](a3, v6);
    }
  }
  else
  {
    uint64_t v5 = properties;
    id v6 = [(__CFDictionary *)v5 objectForKey:@"NEEDS_ACCESSORY_RESET"];
    [(USBFaultMonitor *)self setFaultState:2 flag:[v6 BOOLValue]];
    BOOL v7 = [NSNumber numberWithInt:2];
    id v8 = [(NSMutableDictionary *)self->_usbFaultStatesSent objectForKey:v7];

    if (!v8 || (int v9 = -[NSObject BOOLValue](v6, "BOOLValue"), v9 != [v8 BOOLValue])) {
      [(USBFaultMonitor *)self sendUSBFaultNotification];
    }
  }
  if (properties) {
    CFRelease(properties);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredUUIDs, 0);
  objc_storeStrong((id *)&self->_requestedUSBFaultNotifications, 0);
  objc_storeStrong((id *)&self->_usbFaultStatesSent, 0);
  objc_storeStrong((id *)&self->_usbFaultStates, 0);
}

- (void)checkUSBCardReaderProperty:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_222C9E000, a2, OS_LOG_TYPE_ERROR, "Could not get property dictionary for service=%x", (uint8_t *)v2, 8u);
}

@end