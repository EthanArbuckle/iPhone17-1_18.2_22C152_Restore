@interface CMContinuityCaptureBatteryStateMonitor
+ (id)sharedInstance;
+ (int64_t)resolveBatteryState:(BOOL)a3 isBatteryChargingThermallyLimited:(BOOL)a4 batteryCapacity:(id)a5;
+ (void)invalidate;
- (BOOL)invalidated;
- (BOOL)setupNotification;
- (CMContinuityCaptureBatteryStateMonitor)initWithQueue:(id)a3;
- (NSNumber)batteryLevel;
- (OS_dispatch_queue)queue;
- (int64_t)batteryState;
- (void)handleBatteryInfoChanged;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
- (void)setupNotification;
@end

@implementation CMContinuityCaptureBatteryStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_17);
  }
  v2 = (void *)_batteryStateMonitor;
  return v2;
}

void __56__CMContinuityCaptureBatteryStateMonitor_sharedInstance__block_invoke()
{
  v0 = [CMContinuityCaptureBatteryStateMonitor alloc];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.continuitycapture.batterymonitor", v4);
  uint64_t v2 = [(CMContinuityCaptureBatteryStateMonitor *)v0 initWithQueue:v1];
  v3 = (void *)_batteryStateMonitor;
  _batteryStateMonitor = v2;
}

- (CMContinuityCaptureBatteryStateMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CMContinuityCaptureBatteryStateMonitor;
  v6 = [(CMContinuityCaptureBatteryStateMonitor *)&v19 init];
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_queue, a3);
  batteryLevel = v7->_batteryLevel;
  v7->_batteryLevel = (NSNumber *)&unk_26E96A808;

  v7->_batteryState = 0;
  if (![(CMContinuityCaptureBatteryStateMonitor *)v7 setupNotification])
  {
    v11 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureBatteryStateMonitor initWithQueue:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    goto LABEL_8;
  }
  v9 = v7;
LABEL_4:

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)invalidated
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL invalidated = a3;
  objc_sync_exit(obj);
}

+ (void)invalidate
{
  if (([(id)_batteryStateMonitor invalidated] & 1) == 0)
  {
    [(id)_batteryStateMonitor invalidate];
    uint64_t v2 = (void *)_batteryStateMonitor;
    [v2 setInvalidated:1];
  }
}

- (void)invalidate
{
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  io_object_t serviceNotification = self->_serviceNotification;
  if (serviceNotification)
  {
    IOObjectRelease(serviceNotification);
    self->_io_object_t serviceNotification = 0;
  }
}

+ (int64_t)resolveBatteryState:(BOOL)a3 isBatteryChargingThermallyLimited:(BOOL)a4 batteryCapacity:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = a5;
  v8 = v7;
  if (v6)
  {
    if ((int)[v7 intValue] > 74 || v5)
    {
      if ((int)[v8 intValue] <= 74 && v5) {
        int64_t v9 = 4;
      }
      else {
        int64_t v9 = 4 * ((int)[v8 intValue] > 74);
      }
    }
    else
    {
      int64_t v9 = 2;
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (void)handleBatteryInfoChanged
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    io_registry_entry_t v6 = MatchingService;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"CurrentCapacity", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    int64_t v9 = (void *)IORegistryEntryCreateCFProperty(v6, @"ExternalConnected", v7, 0);
    v10 = (void *)IORegistryEntryCreateCFProperty(v6, @"ChargerData", v7, 0);
    v11 = [v10 objectForKeyedSubscript:@"TimeChargingThermallyLimited"];
    if ((int)[v11 intValue] < 1) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = [v9 BOOLValue];
    }

    if (CMContinityCaptureDebugLogEnabled())
    {
      uint64_t v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 138413058;
        v20 = self;
        __int16 v21 = 2112;
        v22 = CFProperty;
        __int16 v23 = 2112;
        v24 = v9;
        __int16 v25 = 2112;
        v26 = v10;
        _os_log_debug_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEBUG, "%@ currentBatteryCapacity %@ externalACConnected %@ chargerDataDict %@", (uint8_t *)&v19, 0x2Au);
      }
    }
    int64_t v14 = +[CMContinuityCaptureBatteryStateMonitor resolveBatteryState:isBatteryChargingThermallyLimited:batteryCapacity:](CMContinuityCaptureBatteryStateMonitor, "resolveBatteryState:isBatteryChargingThermallyLimited:batteryCapacity:", [v9 BOOLValue], v12, CFProperty);
    uint64_t v15 = NSNumber;
    [CFProperty floatValue];
    *(float *)&double v17 = v16 / 100.0;
    uint64_t v18 = [v15 numberWithFloat:v17];
    if (self->_batteryState != v14)
    {
      [(CMContinuityCaptureBatteryStateMonitor *)self willChangeValueForKey:@"batteryState"];
      self->_batteryState = v14;
      [(CMContinuityCaptureBatteryStateMonitor *)self didChangeValueForKey:@"batteryState"];
    }
    if (![(NSNumber *)self->_batteryLevel isEqualToNumber:v18])
    {
      [(CMContinuityCaptureBatteryStateMonitor *)self willChangeValueForKey:@"batteryLevel"];
      objc_storeStrong((id *)&self->_batteryLevel, v18);
      [(CMContinuityCaptureBatteryStateMonitor *)self didChangeValueForKey:@"batteryLevel"];
    }
    IOObjectRelease(v6);
  }
}

- (BOOL)setupNotification
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __59__CMContinuityCaptureBatteryStateMonitor_setupNotification__block_invoke;
  v33 = &unk_264C990F8;
  objc_copyWeak(&v34, &location);
  mach_port_t v3 = (void *)MEMORY[0x237DFB780](&v30);
  mach_port_t v4 = *MEMORY[0x263F0EC88];
  BOOL v5 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  self->_ioNotificationPort = v5;
  if (!v5)
  {
    uint64_t v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CMContinuityCaptureBatteryStateMonitor *)v13 setupNotification];
    }
    goto LABEL_11;
  }
  CFDictionaryRef v6 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v6);
  if (!MatchingService)
  {
    uint64_t v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CMContinuityCaptureBatteryStateMonitor *)v13 setupNotification];
    }
LABEL_11:

    BOOL v11 = 0;
    goto LABEL_6;
  }
  ioNotificationPort = self->_ioNotificationPort;
  id v9 = objc_loadWeakRetained(&location);
  uint64_t v10 = IOServiceAddInterestNotification(ioNotificationPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)handleBatteryInfoChanged, v9, &self->_serviceNotification);

  BOOL v11 = v10 == 0;
  if (v10)
  {
    v28 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSNumber, "numberWithInt:", v10, v30, v31, v32, v33);
      [(CMContinuityCaptureBatteryStateMonitor *)v29 setupNotification];
    }
  }
  else
  {
    IONotificationPortSetDispatchQueue(self->_ioNotificationPort, (dispatch_queue_t)self->_queue);
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    dispatch_async_and_wait((dispatch_queue_t)self->_queue, v3);
  }
  IOObjectRelease(MatchingService);
LABEL_6:

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
  return v11;
}

void __59__CMContinuityCaptureBatteryStateMonitor_setupNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained handleBatteryInfoChanged];
    id WeakRetained = v2;
  }
}

- (int64_t)batteryState
{
  return self->_batteryState;
}

- (NSNumber)batteryLevel
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueue:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupNotification
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "Failed to register notification at root domain service. error %@.", buf, 0xCu);
}

@end