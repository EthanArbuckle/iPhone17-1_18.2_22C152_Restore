@interface PowerInAnalytics
- (BOOL)_getMutualPowerSourceProperties:(unsigned int)a3 dict:(id)a4;
- (BOOL)_startEventMonitoring;
- (BOOL)analyticsEventsEnabled;
- (BOOL)monitoring;
- (BOOL)started;
- (IONotificationPort)ioNotificationPort;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerInAnalytics)init;
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

@implementation PowerInAnalytics

- (PowerInAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)PowerInAnalytics;
  v2 = [(PowerInAnalytics *)&v12 init];
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
  v3 = [(PowerInAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting %@...", buf, 0xCu);
  }
  v6 = [(PowerInAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __25__PowerInAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __25__PowerInAnalytics_start__block_invoke(uint64_t a1)
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
  v3 = [(PowerInAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping %@...", buf, 0xCu);
  }
  v6 = [(PowerInAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __24__PowerInAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __24__PowerInAnalytics_stop__block_invoke(uint64_t a1)
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
  NSObject *v13;
  int v14;
  uint8_t v15[16];
  uint8_t buf[16];
  uint64_t vars8;

  if (![(PowerInAnalytics *)self monitoring] && [(PowerInAnalytics *)self started])
  {
    v3 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting matching notifications...", buf, 2u);
    }

    id v4 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting event monitoring...", v15, 2u);
    }

    [(PowerInAnalytics *)self setMonitoring:1];
    [(PowerInAnalytics *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
    dispatch_queue_t v5 = [(PowerInAnalytics *)self ioNotificationPort];
    v6 = [(PowerInAnalytics *)self queue];
    IONotificationPortSetDispatchQueue(v5, v6);

    CFMutableDictionaryRef v7 = IOServiceMatching("IOPortFeaturePowerSource");
    CFMutableDictionaryRef v8 = v7;
    if (v7)
    {
      [(__CFDictionary *)v7 setObject:&off_240B8 forKey:@"IOPropertyExistsMatch"];
      os_log_t v9 = [(PowerInAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[AUVDMAnalytics _startEventMonitoring]();
      }

      v10 = IOServiceAddMatchingNotification([(PowerInAnalytics *)self ioNotificationPort], "IOServiceMatched", v8, (IOServiceMatchingCallback)_servicesMatched_1, self, &self->_ioServiceMatchingIterator);
      if (!v10)
      {
        _servicesMatched_1(self, self->_ioServiceMatchingIterator);
        v11 = 1;
LABEL_12:

        return v11;
      }
      v14 = v10;
      v13 = [(PowerInAnalytics *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(AUVDMAnalytics *)v14 _startEventMonitoring];
      }
    }
    else
    {
      v13 = [(PowerInAnalytics *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _startEventMonitoring]();
      }
    }

    v11 = 0;
    goto LABEL_12;
  }

  return [(PowerInAnalytics *)self monitoring];
}

- (void)_stopEventMonitoring
{
  if ([(PowerInAnalytics *)self monitoring])
  {
    v3 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping event monitoring...", v5, 2u);
    }

    [(PowerInAnalytics *)self setMonitoring:0];
    io_object_t ioServiceMatchingIterator = self->_ioServiceMatchingIterator;
    if (ioServiceMatchingIterator) {
      IOObjectRelease(ioServiceMatchingIterator);
    }
    if ([(PowerInAnalytics *)self ioNotificationPort]) {
      IONotificationPortDestroy([(PowerInAnalytics *)self ioNotificationPort]);
    }
  }
}

- (BOOL)analyticsEventsEnabled
{
  return AnalyticsIsEventUsed();
}

- (BOOL)_getMutualPowerSourceProperties:(unsigned int)a3 dict:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"ParentPortType", kCFAllocatorDefault, 0);
    objc_opt_class();
    CFMutableDictionaryRef v8 = castNSObjectToType(CFProperty);

    if (v8)
    {
      [v6 setObject:v8 forKey:@"PortType"];
      os_log_t v9 = (void *)IORegistryEntryCreateCFProperty(a3, @"ParentPortNumber", kCFAllocatorDefault, 0);
      objc_opt_class();
      v10 = castNSObjectToType(v9);

      char v11 = v10 != 0;
      if (v10)
      {
        [v6 setObject:v10 forKey:@"PortNumber"];
        CFMutableDictionaryRef v12 = IOServiceMatching("IOPort");
        v97[0] = @"PortType";
        v97[1] = @"PortNumber";
        v98[0] = v8;
        v98[1] = v10;
        v13 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];
        [(__CFDictionary *)v12 setObject:v13 forKey:@"IOPropertyMatch"];

        v14 = [(PowerInAnalytics *)self log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[AUVDMAnalytics _startEventMonitoring]();
        }

        CFDictionaryRef v15 = v12;
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v15);
        if (MatchingService)
        {
          io_registry_entry_t v17 = MatchingService;
          v18 = v6;
          v19 = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"BuiltIn", kCFAllocatorDefault, 0);
          objc_opt_class();
          v20 = castNSObjectToType(v19);

          if (v20)
          {
            [v18 setObject:v20 forKey:@"PortBuiltIn"];
          }
          else
          {
            v30 = [(PowerInAnalytics *)self log];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              -[PowerInAnalytics _getMutualPowerSourceProperties:dict:].cold.8();
            }
          }
          v31 = (void *)IORegistryEntryCreateCFProperty(v17, @"ConnectionUUID", kCFAllocatorDefault, 0);
          objc_opt_class();
          v32 = castNSObjectToType(v31);

          if (v32)
          {
            [v18 setObject:v32 forKey:@"ConnectionUUID"];
          }
          else
          {
            v33 = [(PowerInAnalytics *)self log];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[PowerInAnalytics _getMutualPowerSourceProperties:dict:].cold.7();
            }
          }
          IOObjectRelease(v17);

          id v6 = v18;
        }
        else
        {
          BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v22) {
            -[AUVDMAnalytics _handleServiceMatched:].cold.7(v22, v23, v24, v25, v26, v27, v28, v29);
          }
        }

        v34 = (void *)IORegistryEntryCreateCFProperty(a3, @"PowerSourceName", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v35 = castNSObjectToType(v34);

        v89 = v35;
        if (v35)
        {
          [v6 setObject:v35 forKey:@"PowerSourceName"];
        }
        else
        {
          v36 = [(PowerInAnalytics *)self log];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[PowerInAnalytics _getMutualPowerSourceProperties:dict:].cold.5();
          }
        }
        v37 = (void *)IORegistryEntryCreateCFProperty(a3, @"PowerSourceType", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v38 = castNSObjectToType(v37);

        if (v38)
        {
          [v6 setObject:v38 forKey:@"PowerSourceType"];
        }
        else
        {
          v39 = [(PowerInAnalytics *)self log];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[PowerInAnalytics _getMutualPowerSourceProperties:dict:].cold.4();
          }
        }
        v40 = (void *)IORegistryEntryCreateCFProperty(a3, @"PowerSourceOptions", kCFAllocatorDefault, 0);
        v87 = v40;
        v88 = (void *)v38;
        if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v83 = self;
          v84 = v10;
          v85 = v8;
          v86 = v6;
          id v41 = v40;
          *(_OWORD *)v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v42 = [v41 countByEnumeratingWithState:v91 objects:buf count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v90 = 0;
            unsigned int v44 = 0;
            uint64_t v45 = *(void *)v92;
            do
            {
              for (i = 0; i != v43; i = (char *)i + 1)
              {
                if (*(void *)v92 != v45) {
                  objc_enumerationMutation(v41);
                }
                v47 = *(void **)(*(void *)&v91[8] + 8 * i);
                if (v47)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v48 = [v47 objectForKeyedSubscript:@"Max Current (mA)"];
                    v49 = [v47 objectForKeyedSubscript:@"Voltage (mV)"];
                    v50 = [v47 objectForKeyedSubscript:@"Max Power (mW)"];
                    v51 = v50;
                    if (v48) {
                      BOOL v52 = v49 == 0;
                    }
                    else {
                      BOOL v52 = 1;
                    }
                    BOOL v53 = v52 || v50 == 0;
                    if (!v53
                      && ((unint64_t)[v50 unsignedIntegerValue] > v44
                       || [v51 unsignedIntegerValue] == (id)v44
                       && (unint64_t)[v49 unsignedIntegerValue] > HIDWORD(v90)))
                    {
                      LODWORD(v90) = [v48 unsignedIntValue];
                      HIDWORD(v90) = [v49 unsignedIntValue];
                      unsigned int v44 = [v51 unsignedIntValue];
                    }
                  }
                }
              }
              id v43 = [v41 countByEnumeratingWithState:v91 objects:buf count:16];
            }
            while (v43);
          }
          else
          {
            uint64_t v90 = 0;
            unsigned int v44 = 0;
          }

          v55 = +[NSNumber numberWithUnsignedInteger:v90];
          id v6 = v86;
          [v86 setObject:v55 forKey:@"MaxPowerSourceOptionVoltageMV"];

          v56 = +[NSNumber numberWithUnsignedInteger:HIDWORD(v90)];
          [v86 setObject:v56 forKey:@"MaxPowerSourceOptionMaxCurrentMA"];

          v54 = +[NSNumber numberWithUnsignedInteger:v44];
          [v86 setObject:v54 forKey:@"MaxPowerSourceOptionMaxPowerMW"];
          v10 = v84;
          CFMutableDictionaryRef v8 = v85;
          self = v83;
        }
        else
        {
          v54 = [(PowerInAnalytics *)self log];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            -[PowerInAnalytics _getMutualPowerSourceProperties:dict:](v40 == 0, (uint64_t)v40, v54);
          }
        }

        CFMutableDictionaryRef v57 = IOServiceMatching("IOPortTransportProtocolAppleUVDM");
        v95[0] = @"ParentPortType";
        v95[1] = @"ParentPortNumber";
        v58 = v8;
        v96[0] = v8;
        v96[1] = v10;
        v59 = v10;
        v95[2] = @"ParentComponentName";
        v96[2] = @"SOP";
        v60 = +[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:3];
        [(__CFDictionary *)v57 setObject:v60 forKey:@"IOPropertyMatch"];

        v61 = [(PowerInAnalytics *)self log];
        v62 = self;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
          -[PowerInAnalytics _getMutualPowerSourceProperties:dict:]();
        }

        CFDictionaryRef v63 = v57;
        io_service_t v64 = IOServiceGetMatchingService(kIOMainPortDefault, v63);
        v65 = v62;
        v66 = [(PowerInAnalytics *)v62 log];
        BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_INFO);
        if (v64)
        {
          if (v67)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "Found AUVDM service!", buf, 2u);
          }

          CFAllocatorRef v68 = kCFAllocatorDefault;
          v69 = (void *)IORegistryEntryCreateCFProperty(v64, @"Manufacturer", kCFAllocatorDefault, 0);
          objc_opt_class();
          v66 = castNSObjectToType(v69);

          if (v66 && [v66 length])
          {
            v70 = +[NSScanner scannerWithString:v66];
            *(_DWORD *)buf = 0;
            if ([v70 scanHexInt:buf])
            {
              v71 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
              [v6 setObject:v71 forKey:@"AUVDM_VendorID"];

              v72 = [(PowerInAnalytics *)v65 log];
              if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v91 = 0;
                _os_log_impl(&dword_0, v72, OS_LOG_TYPE_INFO, "Converted AUVDM Manufacturer to VID!", v91, 2u);
              }
            }
          }
          v73 = (void *)IORegistryEntryCreateCFProperty(v64, @"Model", kCFAllocatorDefault, 0);
          objc_opt_class();
          v74 = castNSObjectToType(v73);

          if (v74 && [v74 length])
          {
            v75 = +[NSScanner scannerWithString:v74];
            *(_DWORD *)buf = 0;
            if ([v75 scanHexInt:buf])
            {
              v76 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
              [v6 setObject:v76 forKey:@"AUVDM_ProductID"];

              v77 = [(PowerInAnalytics *)v65 log];
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v91 = 0;
                _os_log_impl(&dword_0, v77, OS_LOG_TYPE_INFO, "Converted AUVDM Model to PID!", v91, 2u);
              }

              CFAllocatorRef v68 = kCFAllocatorDefault;
            }
          }
          v78 = (void *)IORegistryEntryCreateCFProperty(v64, @"User String", v68, 0);
          objc_opt_class();
          v79 = castNSObjectToType(v78);

          if (v79 && [v79 length])
          {
            [v6 setObject:v79 forKey:@"AUVDM_AccessoryName"];
            v80 = [(PowerInAnalytics *)v65 log];
            if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v80, OS_LOG_TYPE_INFO, "Converted AUVDM User String to Accessory Name!", buf, 2u);
            }
          }
          char v11 = 1;
          v81 = v88;
          v21 = v89;
        }
        else
        {
          char v11 = 1;
          v81 = v88;
          v21 = v89;
          if (v67)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "Could not find AUVDM service!", buf, 2u);
          }
        }

        CFMutableDictionaryRef v8 = v58;
        v10 = v59;
      }
      else
      {
        v21 = [(PowerInAnalytics *)self log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[AUVDMAnalytics _handleServiceMatched:].cold.6();
        }
      }
    }
    else
    {
      v10 = [(PowerInAnalytics *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:]1();
      }
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_handleServiceMatched:(unsigned int)a3
{
  if (!a3) {
    return;
  }
  uint64_t v3 = *(void *)&a3;
  memset(name, 0, 128);
  IORegistryEntryGetName(a3, name);
  dispatch_queue_t v5 = [(PowerInAnalytics *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v47 = name;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Service matched! (serviceName: %s)", buf, 0xCu);
  }

  if (![(PowerInAnalytics *)self analyticsEventsEnabled])
  {
    char v11 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v47 = @"com.apple.ioport.feature.PowerIn.WinningPowerSourceOption";
      CFMutableDictionaryRef v12 = "Analytics disabled for this event - ignoring... (eventName: %@)";
LABEL_15:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
    }
LABEL_16:

    return;
  }
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(v3, "IOPort", &parent) || !parent)
  {
    char v11 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "IOPort";
      CFMutableDictionaryRef v12 = "Could not find parent entry in %s plane!";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (IOObjectConformsTo(parent, "IOPortFeaturePowerIn"))
  {
    id v6 = (id *)&AnalyticsIsEventUsed_ptr;
    CFMutableDictionaryRef v7 = objc_alloc_init((Class)NSMutableDictionary);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, @"WinningPowerSourceOption", kCFAllocatorDefault, 0);
    objc_opt_class();
    os_log_t v9 = castNSObjectToType(CFProperty);

    if (v9)
    {
      v10 = [v9 objectForKeyedSubscript:@"Max Current (mA)"];
      if (v10)
      {
        [v7 setObject:v10 forKey:@"WinningPowerSourceOptionMaxCurrentMA"];
      }
      else
      {
        v13 = [(PowerInAnalytics *)self log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[PowerInAnalytics _handleServiceMatched:]0();
        }
      }
      v14 = [v9 objectForKeyedSubscript:@"Voltage (mV)"];
      if (v14)
      {
        [v7 setObject:v14 forKey:@"WinningPowerSourceOptionVoltageMV"];
      }
      else
      {
        CFDictionaryRef v15 = [(PowerInAnalytics *)self log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[PowerInAnalytics _handleServiceMatched:].cold.9();
        }
      }
      v16 = [v9 objectForKeyedSubscript:@"Max Power (mW)"];
      if (v16)
      {
        [v7 setObject:v16 forKey:@"WinningPowerSourceOptionMaxPowerMW"];
      }
      else
      {
        io_registry_entry_t v17 = [(PowerInAnalytics *)self log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[PowerInAnalytics _handleServiceMatched:].cold.8();
        }
      }
    }
    else
    {
      v10 = [(PowerInAnalytics *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PowerInAnalytics _handleServiceMatched:].cold.7();
      }
    }

    v18 = +[NSUUID UUID];
    v19 = v18;
    if (v18)
    {
      v20 = [v18 UUIDString];
      [v7 setObject:v20 forKey:@"EventUUID"];

      v21 = [(PowerInAnalytics *)self log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        BOOL v22 = [v19 UUIDString];
        *(_DWORD *)buf = 138412290;
        v47 = v22;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "uuidString: %@", buf, 0xCu);
      }
    }
    else
    {
      v21 = [(PowerInAnalytics *)self log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[PowerInAnalytics _handleServiceMatched:].cold.6();
      }
    }

    unsigned int v23 = [(PowerInAnalytics *)self _getMutualPowerSourceProperties:v3 dict:v7];
    if ((v23 & 1) == 0)
    {
      uint64_t v24 = [(PowerInAnalytics *)self log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PowerInAnalytics _handleServiceMatched:].cold.5(v3, v24);
      }
    }
    io_iterator_t existing = 0;
    CFDictionaryRef v25 = IOServiceMatching("IOPortFeaturePowerSource");
    if (!IOServiceGetMatchingServices(kIOMainPortDefault, v25, &existing))
    {
      unsigned int v38 = v23;
      v39 = v7;
      uint64_t v26 = IOIteratorNext(existing);
      if (v26)
      {
        uint64_t v27 = v26;
        id v6 = (id *)&v41;
        do
        {
          if (IOObjectConformsTo(v27, "IOPortFeaturePowerSource"))
          {
            uint64_t v28 = (__CFString *)objc_alloc_init((Class)NSMutableDictionary);
            if (v19)
            {
              uint64_t v29 = [v19 UUIDString];
              [(__CFString *)v28 setObject:v29 forKey:@"EventUUID"];
            }
            unsigned int v30 = [(PowerInAnalytics *)self _getMutualPowerSourceProperties:v27 dict:v28];
            if ((v30 & 1) == 0)
            {
              v31 = [(PowerInAnalytics *)self log];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                -[PowerInAnalytics _handleServiceMatched:].cold.4(buf, v27, &v47, v31);
              }
            }
            v32 = [(PowerInAnalytics *)self log];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)unsigned int v44 = 138412290;
              CFStringRef v45 = @"com.apple.ioport.feature.PowerIn.MaxPowerSourceOption";
              _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", v44, 0xCu);
            }

            v33 = [(PowerInAnalytics *)self log];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)unsigned int v44 = 138412290;
              CFStringRef v45 = v28;
              _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "eventDict: %@", v44, 0xCu);
            }

            if (v30)
            {
              v40[1] = _NSConcreteStackBlock;
              v40[2] = 3221225472;
              v40[3] = __42__PowerInAnalytics__handleServiceMatched___block_invoke;
              v40[4] = &unk_20430;
              id v41 = v28;
              if (AnalyticsSendEventLazy()) {
                goto LABEL_63;
              }
            }
            v34 = [(PowerInAnalytics *)self log];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)unsigned int v44 = 138412290;
              CFStringRef v45 = @"com.apple.ioport.feature.PowerIn.MaxPowerSourceOption";
              _os_log_error_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "Failed to send analytics event! (eventName: %@)", v44, 0xCu);
            }

            if (v30) {
LABEL_63:
            }
          }
          IOObjectRelease(v27);
          uint64_t v27 = IOIteratorNext(existing);
        }
        while (v27);
      }
      CFMutableDictionaryRef v7 = v39;
      unsigned int v23 = v38;
      if (existing) {
        IOObjectRelease(existing);
      }
    }
    uint64_t v35 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unsigned int v44 = 138412290;
      CFStringRef v45 = @"com.apple.ioport.feature.PowerIn.WinningPowerSourceOption";
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", v44, 0xCu);
    }

    v36 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[AUVDMAnalytics _handleServiceMatched:]();
    }

    if (v23)
    {
      id v6 = (id *)v40;
      v40[0] = v7;
      if (AnalyticsSendEventLazy()) {
        goto LABEL_77;
      }
    }
    v37 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[PowerInAnalytics _handleServiceMatched:](v37);
    }

    if (v23) {
LABEL_77:
    }
  }
  else
  {
    CFMutableDictionaryRef v7 = [(PowerInAnalytics *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PowerInAnalytics _handleServiceMatched:](v7);
    }
  }

  IOObjectRelease(parent);
}

id __42__PowerInAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __42__PowerInAnalytics__handleServiceMatched___block_invoke_76(uint64_t a1)
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

- (void)_getMutualPowerSourceProperties:dict:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_0, v0, v1, "uvdmMatchingDict: %@", v2, v3, v4, v5, v6);
}

- (void)_getMutualPowerSourceProperties:(NSObject *)a3 dict:.cold.3(char a1, uint64_t a2, NSObject *a3)
{
  if (a1)
  {
    uint64_t v5 = @"None";
  }
  else
  {
    uint8_t v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  CFMutableDictionaryRef v7 = (objc_class *)objc_opt_class();
  CFMutableDictionaryRef v8 = NSStringFromClass(v7);
  int v9 = 136315650;
  v10 = "PowerSourceOptions";
  __int16 v11 = 2112;
  CFMutableDictionaryRef v12 = v5;
  __int16 v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Incorrect data type for '%s' key! (class: %@, expecting: %@", (uint8_t *)&v9, 0x20u);
  if ((a1 & 1) == 0) {
}
  }

- (void)_getMutualPowerSourceProperties:dict:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find powerSourceType!", v2, v3, v4, v5, v6);
}

- (void)_getMutualPowerSourceProperties:dict:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find powerSourceName!", v2, v3, v4, v5, v6);
}

- (void)_getMutualPowerSourceProperties:dict:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find parent port connection UUID!", v2, v3, v4, v5, v6);
}

- (void)_getMutualPowerSourceProperties:dict:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find if parent port is built-in!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "IOPort";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not find PowerIn feature in %s plane!", (uint8_t *)&v1, 0xCu);
}

- (void)_handleServiceMatched:(os_log_t)log .cold.2(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"com.apple.ioport.feature.PowerIn.WinningPowerSourceOption";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to send analytics event! (eventName: %@)", (uint8_t *)&v1, 0xCu);
}

- (void)_handleServiceMatched:(void *)a3 .cold.4(uint8_t *a1, io_registry_entry_t a2, void *a3, NSObject *a4)
{
  CFMutableDictionaryRef v7 = copyIORegistryEntryProperties(a2);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_0, a4, OS_LOG_TYPE_ERROR, "error getting PowerSourceProperties, full properties: %@", a1, 0xCu);
}

- (void)_handleServiceMatched:(io_registry_entry_t)a1 .cold.5(io_registry_entry_t a1, NSObject *a2)
{
  uint64_t v3 = copyIORegistryEntryProperties(a1);
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "error getting PowerSourceProperties, full properties: %@", v4, 0xCu);
}

- (void)_handleServiceMatched:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not generate uuid!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find winningPowerSourceOption!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find winningPowerSourceOption power!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find winningPowerSourceOption voltage!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find winningPowerSourceOption current!", v2, v3, v4, v5, v6);
}

@end