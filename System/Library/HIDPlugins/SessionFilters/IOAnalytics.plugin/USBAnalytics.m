@interface USBAnalytics
- (BOOL)_startEventMonitoring;
- (BOOL)analyticsEventsEnabled;
- (BOOL)monitoring;
- (BOOL)started;
- (IONotificationPort)ioNotificationPort;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (USBAnalytics)init;
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

@implementation USBAnalytics

- (USBAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)USBAnalytics;
  v2 = [(USBAnalytics *)&v12 init];
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
  v3 = [(USBAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting %@...", buf, 0xCu);
  }
  v6 = [(USBAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __21__USBAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __21__USBAnalytics_start__block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) started];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __23__AUVDMAnalytics_start__block_invoke_cold_1();
    }
  }
  else
  {
    [v3 setStarted:1];
    dispatch_queue_t v5 = *(void **)(a1 + 32);
    [v5 _startEventMonitoring];
  }
}

- (void)stop
{
  v3 = [(USBAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping %@...", buf, 0xCu);
  }
  v6 = [(USBAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __20__USBAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __20__USBAnalytics_stop__block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) started];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setStarted:0];
    id v4 = *(void **)(a1 + 32);
    [v4 _stopEventMonitoring];
  }
  else
  {
    dispatch_queue_t v5 = [v3 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __22__AUVDMAnalytics_stop__block_invoke_cold_1();
    }
  }
}

- (BOOL)_startEventMonitoring
{
  kern_return_t v10;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];
  uint64_t vars8;

  if ([(USBAnalytics *)self monitoring] || ![(USBAnalytics *)self started])
  {
    return [(USBAnalytics *)self monitoring];
  }
  else
  {
    v3 = [(USBAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting matching notifications...", buf, 2u);
    }

    id v4 = [(USBAnalytics *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting event monitoring...", v13, 2u);
    }

    [(USBAnalytics *)self setMonitoring:1];
    [(USBAnalytics *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
    dispatch_queue_t v5 = [(USBAnalytics *)self ioNotificationPort];
    v6 = [(USBAnalytics *)self queue];
    IONotificationPortSetDispatchQueue(v5, v6);

    CFMutableDictionaryRef v7 = IOServiceMatching("IOUSBHostDevice");
    id v8 = [(USBAnalytics *)self ioNotificationPort];
    CFDictionaryRef v9 = v7;
    v10 = IOServiceAddMatchingNotification(v8, "IOServiceFirstMatch", v9, (IOServiceMatchingCallback)_servicesMatched_2, self, &self->_ioServiceMatchingIterator);
    if (v10)
    {
      objc_super v12 = [(USBAnalytics *)self log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(AUVDMAnalytics *)v10 _startEventMonitoring];
      }
    }
    else
    {
      _servicesMatched_2(self, self->_ioServiceMatchingIterator);
    }

    return v10 == 0;
  }
}

- (void)_stopEventMonitoring
{
  if ([(USBAnalytics *)self monitoring])
  {
    v3 = [(USBAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping event monitoring...", v5, 2u);
    }

    [(USBAnalytics *)self setMonitoring:0];
    io_object_t ioServiceMatchingIterator = self->_ioServiceMatchingIterator;
    if (ioServiceMatchingIterator) {
      IOObjectRelease(ioServiceMatchingIterator);
    }
    if ([(USBAnalytics *)self ioNotificationPort]) {
      IONotificationPortDestroy([(USBAnalytics *)self ioNotificationPort]);
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
    memset(name, 0, sizeof(name));
    IORegistryEntryGetName(a3, name);
    dispatch_queue_t v5 = [(USBAnalytics *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = name;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Service matched! (serviceName: %s)", buf, 0xCu);
    }

    if ([(USBAnalytics *)self analyticsEventsEnabled])
    {
      io_registry_entry_t parent = 0;
      if (!IORegistryEntryGetParentEntry(a3, "IOPort", &parent) && parent)
      {
        if (!IOObjectConformsTo(parent, "IOPortTransportStateUSB"))
        {
          v11 = [(USBAnalytics *)self log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[USBAnalytics _handleServiceMatched:](v11);
          }
          goto LABEL_102;
        }
        id v6 = objc_alloc_init((Class)NSMutableDictionary);
        CFProperty = (void *)IORegistryEntryCreateCFProperty(parent, @"ParentPortType", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v8 = castNSObjectToType(CFProperty);

        if (v8)
        {
          [v6 setObject:v8 forKey:@"PortType"];
        }
        else
        {
          objc_super v12 = [(USBAnalytics *)self log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[AUVDMAnalytics _handleServiceMatched:]1();
          }
        }
        v13 = (void *)IORegistryEntryCreateCFProperty(parent, @"ParentPortNumber", kCFAllocatorDefault, 0);
        objc_opt_class();
        v14 = castNSObjectToType(v13);

        v58 = (void *)v8;
        if (v14)
        {
          [v6 setObject:v14 forKey:@"PortNumber"];
          if (v8)
          {
            CFMutableDictionaryRef v15 = IOServiceMatching("IOPort");
            v60[0] = @"PortType";
            v60[1] = @"PortNumber";
            v61[0] = v8;
            v61[1] = v14;
            v16 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
            [(__CFDictionary *)v15 setObject:v16 forKey:@"IOPropertyMatch"];

            CFDictionaryRef v17 = v15;
            io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v17);
            if (MatchingService)
            {
              io_registry_entry_t v19 = MatchingService;
              v20 = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"BuiltIn", kCFAllocatorDefault, 0);
              objc_opt_class();
              v21 = castNSObjectToType(v20);

              if (v21)
              {
                [v6 setObject:v21 forKey:@"PortBuiltIn"];
              }
              else
              {
                v24 = [(USBAnalytics *)self log];
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                  -[PowerInAnalytics _getMutualPowerSourceProperties:dict:].cold.8();
                }
              }
              v25 = (void *)IORegistryEntryCreateCFProperty(v19, @"ConnectionUUID", kCFAllocatorDefault, 0);
              objc_opt_class();
              v26 = castNSObjectToType(v25);

              if (v26)
              {
                [v6 setObject:v26 forKey:@"ConnectionUUID"];
              }
              else
              {
                v27 = [(USBAnalytics *)self log];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  -[PowerInAnalytics _getMutualPowerSourceProperties:dict:].cold.7();
                }
              }
              IOObjectRelease(v19);
            }
            else
            {
              v21 = [(USBAnalytics *)self log];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                -[USBAnalytics _handleServiceMatched:].cold.9();
              }
            }

            goto LABEL_45;
          }
        }
        else
        {
          v22 = [(USBAnalytics *)self log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[AUVDMAnalytics _handleServiceMatched:].cold.6();
          }
        }
        *(void *)buf = 0;
        IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0);
        v23 = [(USBAnalytics *)self log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[AUVDMAnalytics _handleServiceMatched:].cold.5((uint64_t *)buf, v23);
        }

        if (*(void *)buf) {
          CFRelease(*(CFTypeRef *)buf);
        }
LABEL_45:
        v28 = (void *)IORegistryEntryCreateCFProperty(parent, @"Tunneled", kCFAllocatorDefault, 0);
        objc_opt_class();
        v29 = castNSObjectToType(v28);

        if (v29)
        {
          [v6 setObject:v29 forKey:@"TransportTunneled"];
        }
        else
        {
          v30 = [(USBAnalytics *)self log];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[USBAnalytics _handleServiceMatched:].cold.6();
          }
        }
        v31 = (void *)IORegistryEntryCreateCFProperty(parent, @"DataRole", kCFAllocatorDefault, 0);
        objc_opt_class();
        v32 = castNSObjectToType(v31);

        if (v32)
        {
          [v6 setObject:v32 forKey:@"DataRole"];
        }
        else
        {
          v33 = [(USBAnalytics *)self log];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[USBAnalytics _handleServiceMatched:].cold.5();
          }
        }
        BOOLean_t v34 = IOObjectConformsTo(parent, "IOPortTransportStateUSB2");
        io_registry_entry_t v35 = parent;
        if (v34)
        {
          uint64_t v36 = 1;
        }
        else
        {
          if (!IOObjectConformsTo(parent, "IOPortTransportStateUSB3"))
          {
            v38 = 0;
            uint64_t v36 = 0;
            goto LABEL_60;
          }
          uint64_t v36 = 2;
          io_registry_entry_t v35 = parent;
        }
        v37 = (void *)IORegistryEntryCreateCFProperty(v35, @"DataRate", kCFAllocatorDefault, 0);
        objc_opt_class();
        v38 = castNSObjectToType(v37);

LABEL_60:
        v39 = +[NSNumber numberWithUnsignedInt:v36];
        [v6 setObject:v39 forKey:@"Generation"];

        if (v38)
        {
          unsigned int v40 = [v38 intValue];
          if (v40 - 1 >= 3) {
            unsigned int v41 = 0;
          }
          else {
            unsigned int v41 = v40 + 3;
          }
          if (v40 - 1 >= 3) {
            unsigned int v42 = 0;
          }
          else {
            unsigned int v42 = v40;
          }
          if (v36 != 1) {
            unsigned int v42 = 0;
          }
          if (v36 == 2) {
            uint64_t v43 = v41;
          }
          else {
            uint64_t v43 = v42;
          }
          v44 = +[NSNumber numberWithUnsignedInt:v43];
          [v6 setObject:v44 forKey:@"DataRate"];
        }
        else
        {
          v44 = [(USBAnalytics *)self log];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[USBAnalytics _handleServiceMatched:].cold.4();
          }
        }

        v45 = (void *)IORegistryEntryCreateCFProperty(parent, @"Metadata", kCFAllocatorDefault, 0);
        objc_opt_class();
        v46 = castNSObjectToType(v45);

        if (v46)
        {
          v47 = [v46 objectForKeyedSubscript:@"Vendor ID"];
          if (v47) {
            [v6 setObject:v47 forKey:@"VendorID"];
          }
          v48 = [v46 objectForKeyedSubscript:@"Product ID"];

          if (v48) {
            [v6 setObject:v48 forKey:@"ProductID"];
          }
          v49 = [v46 objectForKeyedSubscript:@"Manufacturer"];

          if (v49) {
            [v6 setObject:v49 forKey:@"Manufacturer"];
          }
          v50 = [v46 objectForKeyedSubscript:@"Product"];

          if (v50) {
            [v6 setObject:v50 forKey:@"Product"];
          }
          v51 = [v46 objectForKeyedSubscript:@"Device Class"];

          if (v51) {
            [v6 setObject:v51 forKey:@"DeviceClass"];
          }
          v52 = [v46 objectForKeyedSubscript:@"Device Subclass"];

          if (v52) {
            [v6 setObject:v52 forKey:@"DeviceSubclass"];
          }
          v53 = [v46 objectForKeyedSubscript:@"Device Protocol"];

          if (v53) {
            [v6 setObject:v53 forKey:@"DeviceProtocol"];
          }
          v54 = [v46 objectForKeyedSubscript:@"Device Function"];

          if (v54) {
            [v6 setObject:v54 forKey:@"DeviceFunction"];
          }
        }
        v55 = [(USBAnalytics *)self log];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.USB.published";
          _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", buf, 0xCu);
        }

        v56 = [(USBAnalytics *)self log];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
          -[USBAnalytics _handleServiceMatched:]((uint64_t)v6, v56);
        }

        v11 = v6;
        if ((AnalyticsSendEventLazy() & 1) == 0)
        {
          v57 = [(USBAnalytics *)self log];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            -[USBAnalytics _handleServiceMatched:](@"com.apple.ioport.transport.USB.published", v57);
          }
        }
LABEL_102:

        IOObjectRelease(parent);
        return;
      }
      CFDictionaryRef v9 = [(USBAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "IOPort";
        v10 = "Could not find parent entry in %s plane!";
        goto LABEL_14;
      }
    }
    else
    {
      CFDictionaryRef v9 = [(USBAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.USB.published";
        v10 = "Analytics disabled for this event - ignoring... (eventName: %@)";
LABEL_14:
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
      }
    }
  }
}

id __38__USBAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
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

- (void)setAnalyticsEventsEnabled:(BOOL)a3
{
  self->_analyticsEventsEnabled = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
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

- (void)_handleServiceMatched:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  unsigned int v2 = "IOPort";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not find USB transport in %s plane!", (uint8_t *)&v1, 0xCu);
}

- (void)_handleServiceMatched:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to send analytics event! (eventName: %@)", (uint8_t *)&v2, 0xCu);
}

- (void)_handleServiceMatched:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "eventDict: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleServiceMatched:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "USB data rate not found!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "USB data role not found!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find if transport is tunneled!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find parent port!", v2, v3, v4, v5, v6);
}

@end