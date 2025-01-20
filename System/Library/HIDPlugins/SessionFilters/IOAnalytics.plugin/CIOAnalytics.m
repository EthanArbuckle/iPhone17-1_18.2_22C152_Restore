@interface CIOAnalytics
- (BOOL)_startEventMonitoring;
- (BOOL)analyticsEventsEnabled;
- (BOOL)monitoring;
- (BOOL)started;
- (CIOAnalytics)init;
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

@implementation CIOAnalytics

- (CIOAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)CIOAnalytics;
  v2 = [(CIOAnalytics *)&v12 init];
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
  v3 = [(CIOAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting %@...", buf, 0xCu);
  }
  v6 = [(CIOAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __21__CIOAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __21__CIOAnalytics_start__block_invoke(uint64_t a1)
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
  v3 = [(CIOAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping %@...", buf, 0xCu);
  }
  v6 = [(CIOAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __20__CIOAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __20__CIOAnalytics_stop__block_invoke(uint64_t a1)
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
  kern_return_t v11;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];
  uint64_t vars8;

  if ([(CIOAnalytics *)self monitoring] || ![(CIOAnalytics *)self started])
  {
    return [(CIOAnalytics *)self monitoring];
  }
  else
  {
    v3 = [(CIOAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting matching notifications...", buf, 2u);
    }

    id v4 = [(CIOAnalytics *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting event monitoring...", v14, 2u);
    }

    [(CIOAnalytics *)self setMonitoring:1];
    [(CIOAnalytics *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
    dispatch_queue_t v5 = [(CIOAnalytics *)self ioNotificationPort];
    v6 = [(CIOAnalytics *)self queue];
    IONotificationPortSetDispatchQueue(v5, v6);

    CFMutableDictionaryRef v7 = IOServiceMatching("IOThunderboltSwitch");
    id v8 = [(CIOAnalytics *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AUVDMAnalytics _startEventMonitoring]();
    }

    os_log_t v9 = [(CIOAnalytics *)self ioNotificationPort];
    CFDictionaryRef v10 = v7;
    v11 = IOServiceAddMatchingNotification(v9, "IOServiceFirstMatch", v10, (IOServiceMatchingCallback)_servicesMatched_0, self, &self->_ioServiceMatchingIterator);
    if (v11)
    {
      v13 = [(CIOAnalytics *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(AUVDMAnalytics *)v11 _startEventMonitoring];
      }
    }
    else
    {
      _servicesMatched_0(self, self->_ioServiceMatchingIterator);
    }

    return v11 == 0;
  }
}

- (void)_stopEventMonitoring
{
  if ([(CIOAnalytics *)self monitoring])
  {
    v3 = [(CIOAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping event monitoring...", v5, 2u);
    }

    [(CIOAnalytics *)self setMonitoring:0];
    io_object_t ioServiceMatchingIterator = self->_ioServiceMatchingIterator;
    if (ioServiceMatchingIterator) {
      IOObjectRelease(ioServiceMatchingIterator);
    }
    if ([(CIOAnalytics *)self ioNotificationPort]) {
      IONotificationPortDestroy([(CIOAnalytics *)self ioNotificationPort]);
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
    dispatch_queue_t v5 = [(CIOAnalytics *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = name;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Service matched! (serviceName: %s)", buf, 0xCu);
    }

    if ([(CIOAnalytics *)self analyticsEventsEnabled])
    {
      io_registry_entry_t parent = 0;
      if (!IORegistryEntryGetParentEntry(a3, "IOPort", &parent) && parent)
      {
        if (!IOObjectConformsTo(parent, "IOPortTransportStateCIO"))
        {
          v11 = [(CIOAnalytics *)self log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[CIOAnalytics _handleServiceMatched:](v11);
          }
          goto LABEL_101;
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
          objc_super v12 = [(CIOAnalytics *)self log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[AUVDMAnalytics _handleServiceMatched:]1();
          }
        }
        v13 = (void *)IORegistryEntryCreateCFProperty(parent, @"ParentPortNumber", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v14 = castNSObjectToType(v13);

        v82 = (void *)v14;
        if (v14)
        {
          [v6 setObject:v14 forKey:@"PortNumber"];
          if (v8)
          {
            CFMutableDictionaryRef v15 = IOServiceMatching("IOPort");
            v85[0] = @"PortType";
            v85[1] = @"PortNumber";
            v86[0] = v8;
            v86[1] = v14;
            v16 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];
            [(__CFDictionary *)v15 setObject:v16 forKey:@"IOPropertyMatch"];

            v17 = [(CIOAnalytics *)self log];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              -[AUVDMAnalytics _startEventMonitoring]();
            }

            CFDictionaryRef v18 = v15;
            io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v18);
            if (MatchingService)
            {
              io_registry_entry_t v20 = MatchingService;
              v21 = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"BuiltIn", kCFAllocatorDefault, 0);
              objc_opt_class();
              v22 = castNSObjectToType(v21);

              if (v22)
              {
                [v6 setObject:v22 forKey:@"PortBuiltIn"];
              }
              else
              {
                BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v33) {
                  -[AUVDMAnalytics _handleServiceMatched:].cold.9(v33, v34, v35, v36, v37, v38, v39, v40);
                }
              }
              v41 = (void *)IORegistryEntryCreateCFProperty(v20, @"ConnectionUUID", kCFAllocatorDefault, 0);
              objc_opt_class();
              v42 = castNSObjectToType(v41);

              if (v42)
              {
                [v6 setObject:v42 forKey:@"ConnectionUUID"];
              }
              else
              {
                BOOL v43 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v43) {
                  -[AUVDMAnalytics _handleServiceMatched:].cold.8(v43, v44, v45, v46, v47, v48, v49, v50);
                }
              }
              IOObjectRelease(v20);
            }
            else
            {
              BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v25) {
                -[AUVDMAnalytics _handleServiceMatched:].cold.7(v25, v26, v27, v28, v29, v30, v31, v32);
              }
            }

LABEL_45:
            v51 = (void *)IORegistryEntryCreateCFProperty(parent, @"Generation", kCFAllocatorDefault, 0);
            objc_opt_class();
            v52 = castNSObjectToType(v51);

            if (v52)
            {
              [v6 setObject:v52 forKey:@"Generation"];
            }
            else
            {
              v53 = [(CIOAnalytics *)self log];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                -[CIOAnalytics _handleServiceMatched:].cold.9();
              }
            }
            v54 = (void *)IORegistryEntryCreateCFProperty(parent, @"LegacyAdapter", kCFAllocatorDefault, 0);
            objc_opt_class();
            v55 = castNSObjectToType(v54);

            if (v55)
            {
              [v6 setObject:v55 forKey:@"LegacyAdapter"];
            }
            else
            {
              v56 = [(CIOAnalytics *)self log];
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                -[CIOAnalytics _handleServiceMatched:].cold.8();
              }
            }
            v57 = (void *)IORegistryEntryCreateCFProperty(parent, @"LinkTrainingMode", kCFAllocatorDefault, 0);
            objc_opt_class();
            uint64_t v58 = castNSObjectToType(v57);

            v83 = (void *)v8;
            if (v58)
            {
              [v6 setObject:v58 forKey:@"LinkTrainingMode"];
            }
            else
            {
              v59 = [(CIOAnalytics *)self log];
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
                -[CIOAnalytics _handleServiceMatched:].cold.7();
              }
            }
            v60 = (void *)IORegistryEntryCreateCFProperty(parent, @"CableSpeed", kCFAllocatorDefault, 0);
            objc_opt_class();
            v61 = castNSObjectToType(v60);

            if (v61)
            {
              [v6 setObject:v61 forKey:@"CableSpeed"];
            }
            else
            {
              v62 = [(CIOAnalytics *)self log];
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                -[CIOAnalytics _handleServiceMatched:].cold.6();
              }
            }
            v63 = (void *)IORegistryEntryCreateCFProperty(parent, @"CableGeneration", kCFAllocatorDefault, 0);
            objc_opt_class();
            v64 = castNSObjectToType(v63);

            if (v64)
            {
              [v6 setObject:v64 forKey:@"CableGeneration"];
            }
            else
            {
              v65 = [(CIOAnalytics *)self log];
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
                -[CIOAnalytics _handleServiceMatched:].cold.5();
              }
            }
            v66 = (void *)IORegistryEntryCreateCFProperty(parent, @"Metadata", kCFAllocatorDefault, 0);
            objc_opt_class();
            v81 = (void *)v58;
            if (objc_opt_isKindOfClass())
            {
              v67 = [v66 objectForKeyedSubscript:@"Device Vendor ID"];
              if (v67) {
                [v6 setObject:v67 forKey:@"DeviceVendorID"];
              }
              v68 = [v66 objectForKeyedSubscript:@"Device Vendor Name"];

              if (v68) {
                [v6 setObject:v68 forKey:@"DeviceVendorName"];
              }
              v69 = [v66 objectForKeyedSubscript:@"Device Model ID"];

              if (v69) {
                [v6 setObject:v69 forKey:@"DeviceModelID"];
              }
              v70 = [v66 objectForKeyedSubscript:@"Device Model Revision"];

              if (v70) {
                [v6 setObject:v70 forKey:@"DeviceModelRevision"];
              }
              v71 = [v66 objectForKeyedSubscript:@"Device Model Name"];

              if (v71) {
                [v6 setObject:v71 forKey:@"DeviceModelName"];
              }
              v72 = v55;
              v73 = [v66 objectForKeyedSubscript:@"Vendor ID"];

              if (v73) {
                [v6 setObject:v73 forKey:@"VID"];
              }
              v74 = v52;
              v75 = [v66 objectForKeyedSubscript:@"Device ID"];

              if (v75) {
                [v6 setObject:v75 forKey:@"DID"];
              }
              v76 = [v66 objectForKeyedSubscript:@"ROM Version"];

              if (v76) {
                [v6 setObject:v76 forKey:@"ROMVersion"];
              }
              v77 = [v66 objectForKeyedSubscript:@"EEPROM Version"];

              if (v77) {
                [v6 setObject:v77 forKey:@"EEPROMVersion"];
              }
              v52 = v74;
              v55 = v72;
            }
            else
            {
              v77 = [(CIOAnalytics *)self log];
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
                -[CIOAnalytics _handleServiceMatched:].cold.4();
              }
            }

            v78 = [(CIOAnalytics *)self log];
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.CIO.published";
              _os_log_impl(&dword_0, v78, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", buf, 0xCu);
            }

            v79 = [(CIOAnalytics *)self log];
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
              -[AUVDMAnalytics _handleServiceMatched:]();
            }

            v11 = v6;
            if ((AnalyticsSendEventLazy() & 1) == 0)
            {
              v80 = [(CIOAnalytics *)self log];
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                -[AUVDMAnalytics _handleServiceMatched:]();
              }
            }
LABEL_101:

            IOObjectRelease(parent);
            return;
          }
        }
        else
        {
          v23 = [(CIOAnalytics *)self log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[AUVDMAnalytics _handleServiceMatched:].cold.6();
          }
        }
        *(void *)buf = 0;
        IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0);
        v24 = [(CIOAnalytics *)self log];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          -[AUVDMAnalytics _handleServiceMatched:].cold.5((uint64_t *)buf, v24);
        }

        if (*(void *)buf) {
          CFRelease(*(CFTypeRef *)buf);
        }
        goto LABEL_45;
      }
      os_log_t v9 = [(CIOAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "IOPort";
        CFDictionaryRef v10 = "Could not find parent entry in %s plane!";
        goto LABEL_14;
      }
    }
    else
    {
      os_log_t v9 = [(CIOAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.CIO.published";
        CFDictionaryRef v10 = "Analytics disabled for this event - ignoring... (eventName: %@)";
LABEL_14:
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
      }
    }
  }
}

id __38__CIOAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
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
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not find CIO transport in %s plane!", (uint8_t *)&v1, 0xCu);
}

- (void)_handleServiceMatched:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find metadata!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find cable generation!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find cable speed!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find link training mode!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find Legacy Adapter!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find generation!", v2, v3, v4, v5, v6);
}

@end