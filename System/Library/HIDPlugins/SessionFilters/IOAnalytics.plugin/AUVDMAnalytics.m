@interface AUVDMAnalytics
- (AUVDMAnalytics)init;
- (BOOL)_startEventMonitoring;
- (BOOL)analyticsEventsEnabled;
- (BOOL)monitoring;
- (BOOL)started;
- (IONotificationPort)ioNotificationPort;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (unsigned)ioServiceMatchingIterator;
- (void)_handleServiceMatched:(unsigned int)a3;
- (void)_startEventMonitoring;
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

@implementation AUVDMAnalytics

- (AUVDMAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)AUVDMAnalytics;
  v2 = [(AUVDMAnalytics *)&v12 init];
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
  v3 = [(AUVDMAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting %@...", buf, 0xCu);
  }
  v6 = [(AUVDMAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __23__AUVDMAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __23__AUVDMAnalytics_start__block_invoke(uint64_t a1)
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
  v3 = [(AUVDMAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping %@...", buf, 0xCu);
  }
  v6 = [(AUVDMAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __22__AUVDMAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __22__AUVDMAnalytics_stop__block_invoke(uint64_t a1)
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
  BOOL v11;
  int v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];
  uint64_t vars8;

  if (![(AUVDMAnalytics *)self monitoring] && [(AUVDMAnalytics *)self started])
  {
    v3 = [(AUVDMAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting matching notifications...", buf, 2u);
    }

    id v4 = [(AUVDMAnalytics *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting event monitoring...", v15, 2u);
    }

    [(AUVDMAnalytics *)self setMonitoring:1];
    [(AUVDMAnalytics *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
    dispatch_queue_t v5 = [(AUVDMAnalytics *)self ioNotificationPort];
    v6 = [(AUVDMAnalytics *)self queue];
    IONotificationPortSetDispatchQueue(v5, v6);

    CFMutableDictionaryRef v7 = IOServiceMatching("IOPortTransportProtocolAppleUVDM");
    id v8 = [(AUVDMAnalytics *)self log];
    os_log_t v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[AUVDMAnalytics _startEventMonitoring]();
      }

      v10 = IOServiceAddMatchingNotification([(AUVDMAnalytics *)self ioNotificationPort], "IOServiceMatched", v7, (IOServiceMatchingCallback)_servicesMatched, self, &self->_ioServiceMatchingIterator);
      if (!v10)
      {
        _servicesMatched(self, self->_ioServiceMatchingIterator);
        v11 = 1;
LABEL_12:

        return v11;
      }
      v13 = v10;
      v14 = [(AUVDMAnalytics *)self log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(AUVDMAnalytics *)v13 _startEventMonitoring];
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _startEventMonitoring]();
      }
    }
    v11 = 0;
    goto LABEL_12;
  }

  return [(AUVDMAnalytics *)self monitoring];
}

- (void)_stopEventMonitoring
{
  if ([(AUVDMAnalytics *)self monitoring])
  {
    v3 = [(AUVDMAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping event monitoring...", v5, 2u);
    }

    [(AUVDMAnalytics *)self setMonitoring:0];
    io_object_t ioServiceMatchingIterator = self->_ioServiceMatchingIterator;
    if (ioServiceMatchingIterator) {
      IOObjectRelease(ioServiceMatchingIterator);
    }
    if ([(AUVDMAnalytics *)self ioNotificationPort]) {
      IONotificationPortDestroy([(AUVDMAnalytics *)self ioNotificationPort]);
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
    memset(name, 0, 128);
    IORegistryEntryGetName(a3, name);
    dispatch_queue_t v5 = [(AUVDMAnalytics *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = name;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Service matched! (serviceName: %s)", buf, 0xCu);
    }

    if (![(AUVDMAnalytics *)self analyticsEventsEnabled])
    {
      os_log_t v9 = [(AUVDMAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.protocol.AppleUVDM.published";
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Analytics disabled for this event - ignoring... (eventName: %@)", buf, 0xCu);
      }
      goto LABEL_101;
    }
    if (!IOObjectConformsTo(a3, "IOPortTransportProtocolAppleUVDM"))
    {
      os_log_t v9 = [(AUVDMAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:](v9);
      }
      goto LABEL_101;
    }
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"ParentPortType", kCFAllocatorDefault, 0);
    objc_opt_class();
    uint64_t v8 = castNSObjectToType(CFProperty);

    if (v8)
    {
      [v6 setObject:v8 forKey:@"PortType"];
    }
    else
    {
      v10 = [(AUVDMAnalytics *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:]1();
      }
    }
    v11 = (void *)IORegistryEntryCreateCFProperty(a3, @"ParentPortNumber", kCFAllocatorDefault, 0);
    objc_opt_class();
    uint64_t v12 = castNSObjectToType(v11);

    v89 = (void *)v12;
    v90 = (void *)v8;
    if (v12)
    {
      [v6 setObject:v12 forKey:@"PortNumber"];
      if (v8)
      {
        CFMutableDictionaryRef v13 = IOServiceMatching("IOPort");
        v92[0] = @"PortType";
        v92[1] = @"PortNumber";
        v93[0] = v8;
        v93[1] = v12;
        v14 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
        [(__CFDictionary *)v13 setObject:v14 forKey:@"IOPropertyMatch"];

        v15 = [(AUVDMAnalytics *)self log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[AUVDMAnalytics _startEventMonitoring]();
        }

        CFDictionaryRef v16 = v13;
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v16);
        if (MatchingService)
        {
          io_registry_entry_t v18 = MatchingService;
          v19 = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"BuiltIn", kCFAllocatorDefault, 0);
          objc_opt_class();
          v20 = castNSObjectToType(v19);

          if (v20)
          {
            [v6 setObject:v20 forKey:@"PortBuiltIn"];
          }
          else
          {
            BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v31) {
              -[AUVDMAnalytics _handleServiceMatched:].cold.9(v31, v32, v33, v34, v35, v36, v37, v38);
            }
          }
          v39 = (void *)IORegistryEntryCreateCFProperty(v18, @"ConnectionUUID", kCFAllocatorDefault, 0);
          objc_opt_class();
          v40 = castNSObjectToType(v39);

          if (v40)
          {
            [v6 setObject:v40 forKey:@"ConnectionUUID"];
          }
          else
          {
            BOOL v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v41) {
              -[AUVDMAnalytics _handleServiceMatched:].cold.8(v41, v42, v43, v44, v45, v46, v47, v48);
            }
          }
          IOObjectRelease(v18);
        }
        else
        {
          BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v23) {
            -[AUVDMAnalytics _handleServiceMatched:].cold.7(v23, v24, v25, v26, v27, v28, v29, v30);
          }
        }

LABEL_39:
        v49 = (void *)IORegistryEntryCreateCFProperty(a3, @"Vendor", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v50 = castNSObjectToType(v49);

        if (v50)
        {
          [v6 setObject:v50 forKey:@"AUVDM_Vendor"];
        }
        else
        {
          v51 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "Could not find AUVDM Vendor!", buf, 2u);
          }
        }
        v52 = (void *)IORegistryEntryCreateCFProperty(a3, @"Product", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v53 = castNSObjectToType(v52);

        if (v53)
        {
          [v6 setObject:v53 forKey:@"AUVDM_Product"];
        }
        else
        {
          v54 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "Could not find AUVDM Product!", buf, 2u);
          }
        }
        v55 = (void *)IORegistryEntryCreateCFProperty(a3, @"Manufacturer", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v56 = castNSObjectToType(v55);

        v86 = (void *)v56;
        if (v56)
        {
          [v6 setObject:v56 forKey:@"AUVDM_Manufacturer"];
        }
        else
        {
          v57 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v57, OS_LOG_TYPE_DEFAULT, "Could not find AUVDM Manufacturer!", buf, 2u);
          }
        }
        v58 = (void *)IORegistryEntryCreateCFProperty(a3, @"Model", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v59 = castNSObjectToType(v58);

        v88 = (void *)v50;
        v85 = (void *)v59;
        if (v59)
        {
          [v6 setObject:v59 forKey:@"AUVDM_Model"];
        }
        else
        {
          v60 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v60, OS_LOG_TYPE_DEFAULT, "Could not find AUVDM Model!", buf, 2u);
          }
        }
        v61 = (void *)IORegistryEntryCreateCFProperty(a3, @"Firmware Version", kCFAllocatorDefault, 0);
        objc_opt_class();
        v62 = castNSObjectToType(v61);

        v87 = (void *)v53;
        if (v62)
        {
          [v6 setObject:v62 forKey:@"AUVDM_FirmwareVersion"];
        }
        else
        {
          v63 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v63, OS_LOG_TYPE_DEFAULT, "Could not find AUVDM FirmwareVersion!", buf, 2u);
          }
        }
        v64 = (void *)IORegistryEntryCreateCFProperty(a3, @"Hardware Version", kCFAllocatorDefault, 0);
        objc_opt_class();
        v65 = castNSObjectToType(v64);

        if (v65)
        {
          [v6 setObject:v65 forKey:@"AUVDM_HardwareVersion"];
        }
        else
        {
          v66 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v66, OS_LOG_TYPE_DEFAULT, "Could not find AUVDM HardwareVersion!", buf, 2u);
          }
        }
        v67 = (void *)IORegistryEntryCreateCFProperty(a3, @"User String", kCFAllocatorDefault, 0);
        objc_opt_class();
        v68 = castNSObjectToType(v67);

        if (v68)
        {
          [v6 setObject:v68 forKey:@"AUVDM_UserString"];
        }
        else
        {
          v69 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v69, OS_LOG_TYPE_DEFAULT, "Could not find AUVDM UserString!", buf, 2u);
          }
        }
        v70 = [v6 objectForKeyedSubscript:@"AUVDM_Manufacturer"];
        v71 = v70;
        if (v70 && [v70 length])
        {
          v72 = +[NSScanner scannerWithString:v71];
          *(_DWORD *)buf = 0;
          if ([v72 scanHexInt:buf])
          {
            v73 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
            [v6 setObject:v73 forKey:@"VendorID"];

            v74 = [(AUVDMAnalytics *)self log];
            if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v91 = 0;
              _os_log_impl(&dword_0, v74, OS_LOG_TYPE_INFO, "Converted AUVDM Manufacturer to VID!", v91, 2u);
            }
          }
        }
        v75 = [v6 objectForKeyedSubscript:@"AUVDM_Model"];
        v76 = v75;
        if (v75 && [v75 length])
        {
          v77 = +[NSScanner scannerWithString:v76];
          *(_DWORD *)buf = 0;
          if ([v77 scanHexInt:buf])
          {
            v78 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
            [v6 setObject:v78 forKey:@"ProductID"];

            v79 = [(AUVDMAnalytics *)self log];
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v91 = 0;
              _os_log_impl(&dword_0, v79, OS_LOG_TYPE_INFO, "Converted AUVDM Model to PID!", v91, 2u);
            }
          }
        }
        v80 = [v6 objectForKeyedSubscript:@"AUVDM_UserString"];

        if (v80)
        {
          v81 = [v6 objectForKeyedSubscript:@"AUVDM_UserString"];
          [v6 setObject:v81 forKey:@"AccessoryName"];
        }
        else
        {
          v81 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
            -[AUVDMAnalytics _handleServiceMatched:].cold.4();
          }
        }

        v82 = [(AUVDMAnalytics *)self log];
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.protocol.AppleUVDM.published";
          _os_log_impl(&dword_0, v82, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", buf, 0xCu);
        }

        v83 = [(AUVDMAnalytics *)self log];
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
          -[AUVDMAnalytics _handleServiceMatched:]();
        }

        os_log_t v9 = v6;
        if ((AnalyticsSendEventLazy() & 1) == 0)
        {
          v84 = [(AUVDMAnalytics *)self log];
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            -[AUVDMAnalytics _handleServiceMatched:]();
          }
        }
LABEL_101:

        return;
      }
    }
    else
    {
      v21 = [(AUVDMAnalytics *)self log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:].cold.6();
      }
    }
    *(void *)buf = 0;
    IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0);
    v22 = [(AUVDMAnalytics *)self log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[AUVDMAnalytics _handleServiceMatched:].cold.5((uint64_t *)buf, v22);
    }

    if (*(void *)buf) {
      CFRelease(*(CFTypeRef *)buf);
    }
    goto LABEL_39;
  }
}

id __40__AUVDMAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
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

void __23__AUVDMAnalytics_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Already started... ignoring!", v2, v3, v4, v5, v6);
}

void __22__AUVDMAnalytics_stop__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Already stopped... ignoring!", v2, v3, v4, v5, v6);
}

- (void)_startEventMonitoring
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_0, v0, v1, "matchingDict: %@", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "IOPort";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not find AUVDM service in %s plane!", (uint8_t *)&v1, 0xCu);
}

- (void)_handleServiceMatched:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Failed to send analytics event! (eventName: %@)", v1, 0xCu);
}

- (void)_handleServiceMatched:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_0, v0, v1, "eventDict: %@", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find AUVDM AccessoryName!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:(uint64_t *)a1 .cold.5(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Could not find parent port type and number! (serviceProperties: %@)", (uint8_t *)&v3, 0xCu);
}

- (void)_handleServiceMatched:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find parent port number!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleServiceMatched:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleServiceMatched:(uint64_t)a3 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleServiceMatched:.cold.11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find parent port type!", v2, v3, v4, v5, v6);
}

@end