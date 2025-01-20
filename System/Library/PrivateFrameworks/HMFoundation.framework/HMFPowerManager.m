@interface HMFPowerManager
+ (id)sharedManager;
- (BOOL)hasBattery;
- (BOOL)isRunning;
- (HMFPowerManager)init;
- (IONotificationPort)notificationPort;
- (OS_dispatch_queue)clientQueue;
- (float)batteryLevel;
- (int64_t)batteryState;
- (unsigned)interestNotification;
- (void)_deregisterForPowerSourceNotifications:(BOOL)a3;
- (void)_registerForPowerSourceNotifications;
- (void)dealloc;
- (void)setRunning:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)updateBatteryState:(unsigned int)a3;
@end

@implementation HMFPowerManager

+ (id)sharedManager
{
  if (qword_1EB4EEE68 != -1) {
    dispatch_once(&qword_1EB4EEE68, &__block_literal_global_24);
  }
  v2 = (void *)_MergedGlobals_1;
  return v2;
}

uint64_t __32__HMFPowerManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(HMFPowerManager);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_1;
  return [v2 start];
}

- (HMFPowerManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)HMFPowerManager;
  v2 = [(HMFPowerManager *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMFDispatchQueueName(v2, 0);
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v6;

    v3->_batteryState = 0;
    v3->_batteryLevel = -1.0;
    LODWORD(v4) = *MEMORY[0x1E4F2EEF0];
    CFDictionaryRef v8 = IOServiceMatching("IOPMPowerSource");
    io_service_t MatchingService = IOServiceGetMatchingService((mach_port_t)v4, v8);
    if (MatchingService)
    {
      io_object_t v10 = MatchingService;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"BatteryInstalled", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      CFTypeID TypeID = CFBooleanGetTypeID();
      objc_opt_class();
      if (CFProperty && CFGetTypeID(CFProperty) != TypeID)
      {
        CFRelease(CFProperty);
        CFProperty = 0;
      }
      if (objc_opt_isKindOfClass()) {
        v13 = CFProperty;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      char v15 = [v14 BOOLValue];
      IOObjectRelease(v10);
    }
    else
    {
      char v15 = 0;
    }
    v3->_hasBattery = v15;
  }
  return v3;
}

- (void)dealloc
{
  [(HMFPowerManager *)self _deregisterForPowerSourceNotifications:0];
  v3.receiver = self;
  v3.super_class = (Class)HMFPowerManager;
  [(HMFPowerManager *)&v3 dealloc];
}

- (void)start
{
  objc_super v3 = [(HMFPowerManager *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__HMFPowerManager_start__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __24__HMFPowerManager_start__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRunning];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setRunning:1];
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 _registerForPowerSourceNotifications];
  }
  return result;
}

- (void)stop
{
  objc_super v3 = [(HMFPowerManager *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__HMFPowerManager_stop__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v3, block);
}

void __23__HMFPowerManager_stop__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = +[HMFPowerManager sharedManager];

  if (v2 != v3 && [*(id *)(a1 + 32) isRunning])
  {
    [*(id *)(a1 + 32) setRunning:0];
    v4 = *(void **)(a1 + 32);
    [v4 _deregisterForPowerSourceNotifications:1];
  }
}

- (int64_t)batteryState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t batteryState = self->_batteryState;
  os_unfair_lock_unlock(p_lock);
  return batteryState;
}

- (float)batteryLevel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  float batteryLevel = self->_batteryLevel;
  os_unfair_lock_unlock(p_lock);
  return batteryLevel;
}

- (void)updateBatteryState:(unsigned int)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (void *)MEMORY[0x19F3A87A0](self, a2);
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"CurrentCapacity", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    CFTypeID TypeID = CFNumberGetTypeID();
    objc_opt_class();
    if (CFProperty && CFGetTypeID(CFProperty) != TypeID)
    {
      CFRelease(CFProperty);
      CFProperty = 0;
    }
    if (objc_opt_isKindOfClass()) {
      v9 = CFProperty;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    v11 = (void *)IORegistryEntryCreateCFProperty(a3, @"MaxCapacity", v6, 0);
    CFTypeID v12 = CFNumberGetTypeID();
    objc_opt_class();
    if (v11 && CFGetTypeID(v11) != v12)
    {
      CFRelease(v11);
      v11 = 0;
    }
    if (objc_opt_isKindOfClass()) {
      v13 = v11;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (v10 && v14 && [v14 integerValue] >= 1)
    {
      float v15 = (float)[v10 integerValue];
      float v16 = v15 / (float)[v14 integerValue];
    }
    else
    {
      objc_super v17 = (void *)MEMORY[0x19F3A87A0]();
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier(0);
        int v33 = 138543362;
        v34 = v19;
        _os_log_impl(&dword_19D57B000, v18, OS_LOG_TYPE_INFO, "%{public}@Unable to determine the current battery level", (uint8_t *)&v33, 0xCu);
      }
      float v16 = -1.0;
    }
    __updateBatteryLevel(self, v16);
    v20 = (void *)IORegistryEntryCreateCFProperty(a3, @"ExternalChargeCapable", v6, 0);
    CFTypeID v21 = CFBooleanGetTypeID();
    objc_opt_class();
    if (v20 && CFGetTypeID(v20) != v21)
    {
      CFRelease(v20);
      v20 = 0;
    }
    if (objc_opt_isKindOfClass()) {
      v22 = v20;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    if (v23)
    {
      if ([v23 BOOLValue])
      {
        v24 = (void *)IORegistryEntryCreateCFProperty(a3, @"FullyCharged", v6, 0);
        CFTypeID v25 = CFBooleanGetTypeID();
        objc_opt_class();
        if (v24 && CFGetTypeID(v24) != v25)
        {
          CFRelease(v24);
          v24 = 0;
        }
        if (objc_opt_isKindOfClass()) {
          v26 = v24;
        }
        else {
          v26 = 0;
        }
        id v27 = v26;

        int v28 = [v27 BOOLValue];
        if (v28) {
          uint64_t v29 = 3;
        }
        else {
          uint64_t v29 = 2;
        }
      }
      else
      {
        uint64_t v29 = 1;
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x19F3A87A0]();
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier(0);
        int v33 = 138543362;
        v34 = v32;
        _os_log_impl(&dword_19D57B000, v31, OS_LOG_TYPE_INFO, "%{public}@Unable to determine the current battery state", (uint8_t *)&v33, 0xCu);
      }
      uint64_t v29 = 0;
    }
    __updateBatteryState(self, v29);
  }
}

- (void)_registerForPowerSourceNotifications
{
  self->_notificationPort = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  if ([(HMFPowerManager *)self notificationPort])
  {
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource([(HMFPowerManager *)self notificationPort]);
    if (RunLoopSource)
    {
      v4 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v4, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      io_iterator_t notification = 0;
      CFAllocatorRef v6 = [(HMFPowerManager *)self notificationPort];
      CFDictionaryRef v7 = IOServiceMatching("IOPMPowerSource");
      if (!IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", v7, (IOServiceMatchingCallback)_matchedBatteryMatchingCallback, self, &notification))_matchedBatteryMatchingCallback(self, notification); {
      IOObjectRelease(notification);
      }
    }
    else
    {
      IONotificationPortDestroy([(HMFPowerManager *)self notificationPort]);
      self->_notificationPort = 0;
    }
  }
}

- (void)_deregisterForPowerSourceNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HMFPowerManager *)self interestNotification])
  {
    IOObjectRelease([(HMFPowerManager *)self interestNotification]);
    self->_interestNotification = 0;
  }
  if ([(HMFPowerManager *)self notificationPort])
  {
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource([(HMFPowerManager *)self notificationPort]);
    if (RunLoopSource)
    {
      CFAllocatorRef v6 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopRemoveSource(Main, v6, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    }
    IONotificationPortDestroy([(HMFPowerManager *)self notificationPort]);
    self->_notificationPort = 0;
  }
  if (v3)
  {
    __updateBatteryState(self, 0);
    __updateBatteryLevel(self, -1.0);
  }
}

- (unsigned)interestNotification
{
  return self->_interestNotification;
}

- (BOOL)hasBattery
{
  return self->_hasBattery;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void).cxx_destruct
{
}

@end