@interface ApplePCIeAnalytics
- (ApplePCIeAnalytics)init;
- (BOOL)_startEventMonitoring;
- (BOOL)analyticsEventsEnabled;
- (BOOL)monitoring;
- (BOOL)started;
- (IONotificationPort)ioNotificationPort;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (unsigned)ioServiceMatchingIterator;
- (void)_handleServiceMatched:(unsigned int)a3;
- (void)_stopEventMonitoring;
- (void)setAnalyticsEventsEnabled:(BOOL)a3;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIoServiceMatchingIterator:(unsigned int)a3;
- (void)setLog:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation ApplePCIeAnalytics

- (ApplePCIeAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)ApplePCIeAnalytics;
  v2 = [(ApplePCIeAnalytics *)&v12 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    os_log_t v9 = os_log_create("com.apple.accessories", (const char *)[v8 UTF8String]);
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;

    v2->_started = 0;
  }
  return v2;
}

- (void)start
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = log;
    dispatch_queue_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting %@...", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __27__ApplePCIeAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

void __27__ApplePCIeAnalytics_start__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    v3 = *(NSObject **)(v1 + 24);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __27__ApplePCIeAnalytics_start__block_invoke_cold_2((uint64_t)v2, v3);
    }
  }
  else
  {
    *(unsigned char *)(v1 + 8) = 1;
    if (([*v2 _startEventMonitoring] & 1) == 0)
    {
      id v4 = *((void *)*v2 + 3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __27__ApplePCIeAnalytics_start__block_invoke_cold_1((uint64_t)v2, v4);
      }
    }
  }
}

- (void)stop
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = log;
    dispatch_queue_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Stopping %@...", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __26__ApplePCIeAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

void __26__ApplePCIeAnalytics_stop__block_invoke(uint64_t a1)
{
  v2 = (void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 0;
    v3 = *v2;
    [v3 _stopEventMonitoring];
  }
  else
  {
    id v4 = *(NSObject **)(v1 + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __26__ApplePCIeAnalytics_stop__block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
}

- (BOOL)_startEventMonitoring
{
  kern_return_t v9;
  OS_os_log *v11;
  int v12;
  uint8_t buf[16];

  if (!self->_started) {
    return 0;
  }
  if (self->_monitoring) {
    return 1;
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Starting event monitoring...", buf, 2u);
  }
  self->_monitoring = 1;
  dispatch_queue_t v5 = IONotificationPortCreate(kIOMainPortDefault);
  self->_ioNotificationPort = v5;
  IONotificationPortSetDispatchQueue(v5, (dispatch_queue_t)self->_queue);
  CFMutableDictionaryRef v6 = IOServiceMatching("IOPCIDevice");
  ioNotificationPort = self->_ioNotificationPort;
  CFDictionaryRef v8 = v6;
  os_log_t v9 = IOServiceAddMatchingNotification(ioNotificationPort, "IOServiceFirstMatch", v8, (IOServiceMatchingCallback)_serviceMatched, self, &self->_ioServiceMatchingIterator);
  BOOL v3 = v9 == 0;
  if (v9)
  {
    objc_super v12 = v9;
    v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      [(AUVDMAnalytics *)v12 _startEventMonitoring];
    }
  }
  else
  {
    _serviceMatched(self, self->_ioServiceMatchingIterator);
  }

  return v3;
}

- (void)_stopEventMonitoring
{
  if (self->_monitoring)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFMutableDictionaryRef v6 = 0;
      _os_log_impl(&dword_0, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Stopping event monitoring...", v6, 2u);
    }
    self->_monitoring = 0;
    io_object_t ioServiceMatchingIterator = self->_ioServiceMatchingIterator;
    if (ioServiceMatchingIterator) {
      IOObjectRelease(ioServiceMatchingIterator);
    }
    ioNotificationPort = self->_ioNotificationPort;
    if (ioNotificationPort) {
      IONotificationPortDestroy(ioNotificationPort);
    }
  }
}

- (BOOL)analyticsEventsEnabled
{
  return AnalyticsIsEventUsed();
}

- (void)_handleServiceMatched:(unsigned int)a3
{
  if (a3)
  {
    id v4 = self;
    if ([(ApplePCIeAnalytics *)self analyticsEventsEnabled])
    {
      IOObjectRetain(a3);
      dispatch_queue_t v5 = objc_opt_new();
      CFMutableDictionaryRef v6 = getPropFromReg(kApplePCIeAnalytics_IOPCIDevice_Property_VendorID, a3);
      v7 = convertNSDataToHexString(v6);
      [v5 setValue:v7 forKey:@"PCIe_VID"];

      CFDictionaryRef v8 = getPropFromReg(kApplePCIeAnalytics_IOPCIDevice_Property_DeviceID, a3);
      os_log_t v9 = convertNSDataToHexString(v8);
      [v5 setValue:v9 forKey:@"PCIe_DID"];

      v10 = getPropFromReg(kApplePCIeAnalytics_IOPCIDevice_Property_SubsystemVendorID, a3);
      v11 = convertNSDataToHexString(v10);
      [v5 setValue:v11 forKey:@"PCIe_Subsystem_VID"];

      objc_super v12 = getPropFromReg(kApplePCIeAnalytics_IOPCIDevice_Property_SubsystemID, a3);
      v13 = convertNSDataToHexString(v12);
      [v5 setValue:v13 forKey:@"PCIe_Subsystem_ID"];

      v14 = getPropFromReg(kApplePCIeAnalytics_IOPCIDevice_Property_ClassCode, a3);
      v15 = convertNSDataToHexString(v14);
      [v5 setValue:v15 forKey:@"PCIe_ClassCode"];

      v16 = getPropFromReg(@"IOPCIExpressCapabilities", a3);
      v17 = +[NSNumber numberWithBool:v16 != 0];
      [v5 setObject:v17 forKey:@"isPCIe"];

      if (v16)
      {
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%X", [v16 unsignedIntValue]);
        [v5 setObject:v18 forKey:@"PCIe_Capabilities"];
      }
      v19 = getPropFromReg(@"IOPCIExpressLinkCapabilities", a3);

      if (v19)
      {
        id v20 = [v19 unsignedIntValue];
        v21 = +[NSString stringWithFormat:@"0x%X", v20];
        [v5 setObject:v21 forKey:@"PCIe_LinkCapabilities"];

        if ((v20 & 0xFu) > 6)
        {
          v22 = &off_23B98;
        }
        else
        {
          +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
          v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        }
        [v5 setObject:v22 forKey:@"linkSpeed"];

        unsigned int v24 = (v20 >> 4) & 0x3F;
        v25 = &off_23BB0;
        switch(v24)
        {
          case 0u:
            break;
          case 1u:
            v25 = &off_23BC8;
            break;
          case 2u:
            v25 = &off_23BE0;
            break;
          case 3u:
          case 5u:
          case 6u:
          case 7u:
          case 9u:
          case 0xAu:
          case 0xBu:
          case 0xDu:
          case 0xEu:
          case 0xFu:
            goto LABEL_15;
          case 4u:
            v25 = &off_23BF8;
            break;
          case 8u:
            v25 = &off_23C10;
            break;
          case 0xCu:
            v25 = &off_23C28;
            break;
          case 0x10u:
            v25 = &off_23C40;
            break;
          default:
            if (v24 == 32) {
              v25 = &off_23C58;
            }
            else {
LABEL_15:
            }
              v25 = &off_23C70;
            break;
        }
        [v5 setObject:v25 forKey:@"linkWidth"];
      }
      io_registry_entry_t parent = 0;
      IOObjectRetain(a3);
      IORegistryEntryGetParentEntry(a3, "IOService", &parent);
      io_object_t v26 = parent;
      v42 = v19;
      if (parent)
      {
        v41 = v4;
        v27 = 0;
        v28 = 0;
        io_object_t v29 = a3;
        do
        {
          if (!IOObjectConformsTo(v26, "IOPCIDevice") && !IOObjectConformsTo(parent, "IOPCI2PCIBridge")) {
            break;
          }
          IOObjectRelease(v29);
          io_object_t v29 = parent;
          if (IOObjectConformsTo(parent, "IOPCIDevice"))
          {
            v30 = getPropFromReg(kApplePCIeAnalytics_IOPCIDevice_Property_SlotName, v29);
            v31 = v30;
            if (v30)
            {
              uint64_t v32 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", strtol((const char *)[v30 bytes] + 5, 0, 10));

              v28 = (void *)v32;
            }
            v33 = getPropFromReg(kApplePCIeAnalytics_IOPCIDevice_Property_ThunderboltEntryID, v29);
            v34 = v33;
            if (v33)
            {
              id v35 = v33;

              v27 = v35;
            }
          }
          IORegistryEntryGetParentEntry(v29, "IOService", &parent);
          io_object_t v26 = parent;
        }
        while (parent);
        id v4 = v41;
        if (v27)
        {
          CFDictionaryRef v36 = IORegistryEntryIDMatching((uint64_t)[v27 unsignedLongLongValue]);
          io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v36);
          v38 = (void *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", kApplePCIeAnalytics_IOPCIDevice_Property_RouterID, kCFAllocatorDefault, 3u);
          [v5 setObject:v38 forKey:@"atcPort"];
        }
        else
        {
          if (v28) {
            [v5 setObject:v28 forKey:@"slot"];
          }
          v27 = 0;
        }
      }
      else
      {
        v27 = 0;
        v28 = 0;
        io_object_t v29 = a3;
      }
      IOObjectRelease(v29);
      IOObjectRelease(parent);
      IOObjectRelease(a3);
      log = v4->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v45 = @"com.apple.accessories.IOPCIDevice.FirstMatch";
        _os_log_impl(&dword_0, log, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", buf, 0xCu);
      }
      if (os_log_type_enabled((os_log_t)v4->_log, OS_LOG_TYPE_DEBUG)) {
        -[ApplePCIeAnalytics _handleServiceMatched:]();
      }
      id v40 = v5;
      if ((AnalyticsSendEventLazy() & 1) == 0 && os_log_type_enabled((os_log_t)v4->_log, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:]();
      }
    }
    else
    {
      v23 = v4->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v45 = @"com.apple.accessories.IOPCIDevice.FirstMatch";
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Analytics events are disabled for this event - ignoring... (eventName: %@)", buf, 0xCu);
      }
    }
  }
}

id __44__ApplePCIeAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void)setAnalyticsEventsEnabled:(BOOL)a3
{
  self->_analyticsEventsEnabled = a3;
}

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIoNotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (unsigned)ioServiceMatchingIterator
{
  return self->_ioServiceMatchingIterator;
}

- (void)setIoServiceMatchingIterator:(unsigned int)a3
{
  self->_io_object_t ioServiceMatchingIterator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __27__ApplePCIeAnalytics_start__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_0, v5, v6, "%@ failed to start!", v7, v8, v9, v10, v11);
}

void __27__ApplePCIeAnalytics_start__block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_0, v5, v6, "%@ already started... ignoring!", v7, v8, v9, v10, v11);
}

void __26__ApplePCIeAnalytics_stop__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_0, v5, v6, "%@ already stopped... ignoring!", v7, v8, v9, v10, v11);
}

- (void)_handleServiceMatched:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "eventDictionary: %@", v1, 0xCu);
}

@end