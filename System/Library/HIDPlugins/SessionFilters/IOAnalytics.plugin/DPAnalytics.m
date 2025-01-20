@interface DPAnalytics
- (BOOL)_startEventMonitoring;
- (BOOL)analyticsEventsEnabled;
- (BOOL)monitoring;
- (BOOL)started;
- (DPAnalytics)init;
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

@implementation DPAnalytics

- (DPAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)DPAnalytics;
  v2 = [(DPAnalytics *)&v12 init];
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
  v3 = [(DPAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting %@...", buf, 0xCu);
  }
  v6 = [(DPAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __20__DPAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __20__DPAnalytics_start__block_invoke(uint64_t a1)
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
  v3 = [(DPAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping %@...", buf, 0xCu);
  }
  v6 = [(DPAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __19__DPAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __19__DPAnalytics_stop__block_invoke(uint64_t a1)
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

  if (![(DPAnalytics *)self monitoring] && [(DPAnalytics *)self started])
  {
    v3 = [(DPAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting matching notifications...", buf, 2u);
    }

    id v4 = [(DPAnalytics *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting event monitoring...", v15, 2u);
    }

    [(DPAnalytics *)self setMonitoring:1];
    [(DPAnalytics *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
    dispatch_queue_t v5 = [(DPAnalytics *)self ioNotificationPort];
    v6 = [(DPAnalytics *)self queue];
    IONotificationPortSetDispatchQueue(v5, v6);

    CFMutableDictionaryRef v7 = IOServiceMatching("IOPortTransportStateDisplayPort");
    CFMutableDictionaryRef v8 = v7;
    if (v7)
    {
      [(__CFDictionary *)v7 setObject:&off_24100 forKey:@"IOPropertyExistsMatch"];
      [(__CFDictionary *)v8 setObject:&off_24168 forKey:@"IOPropertyMatch"];
      os_log_t v9 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[AUVDMAnalytics _startEventMonitoring]();
      }

      v10 = IOServiceAddMatchingNotification([(DPAnalytics *)self ioNotificationPort], "IOServiceMatched", v8, (IOServiceMatchingCallback)_servicesMatched_4, self, &self->_ioServiceMatchingIterator);
      if (!v10)
      {
        _servicesMatched_4(self, self->_ioServiceMatchingIterator);
        v11 = 1;
LABEL_12:

        return v11;
      }
      v14 = v10;
      v13 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(AUVDMAnalytics *)v14 _startEventMonitoring];
      }
    }
    else
    {
      v13 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _startEventMonitoring]();
      }
    }

    v11 = 0;
    goto LABEL_12;
  }

  return [(DPAnalytics *)self monitoring];
}

- (void)_stopEventMonitoring
{
  if ([(DPAnalytics *)self monitoring])
  {
    v3 = [(DPAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping event monitoring...", v5, 2u);
    }

    [(DPAnalytics *)self setMonitoring:0];
    io_object_t ioServiceMatchingIterator = self->_ioServiceMatchingIterator;
    if (ioServiceMatchingIterator) {
      IOObjectRelease(ioServiceMatchingIterator);
    }
    if ([(DPAnalytics *)self ioNotificationPort]) {
      IONotificationPortDestroy([(DPAnalytics *)self ioNotificationPort]);
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
    dispatch_queue_t v5 = [(DPAnalytics *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = name;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Service matched! (serviceName: %s)", buf, 0xCu);
    }

    if (![(DPAnalytics *)self analyticsEventsEnabled])
    {
      os_log_t v9 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.DP.published";
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Analytics disabled for this event - ignoring... (eventName: %@)", buf, 0xCu);
      }
      goto LABEL_156;
    }
    if (!IOObjectConformsTo(a3, "IOPortTransportStateDisplayPort"))
    {
      os_log_t v9 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:](v9);
      }
      goto LABEL_156;
    }
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"ParentPortType", kCFAllocatorDefault, 0);
    objc_opt_class();
    CFMutableDictionaryRef v8 = castNSObjectToType(CFProperty);

    if (v8)
    {
      [v6 setObject:v8 forKey:@"PortType"];
    }
    else
    {
      v10 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:]1();
      }
    }
    v11 = (void *)IORegistryEntryCreateCFProperty(a3, @"ParentPortNumber", kCFAllocatorDefault, 0);
    objc_opt_class();
    objc_super v12 = castNSObjectToType(v11);

    if (v12)
    {
      [v6 setObject:v12 forKey:@"PortNumber"];
      if (v8)
      {
        CFMutableDictionaryRef v13 = IOServiceMatching("IOPort");
        v112[0] = @"PortType";
        v112[1] = @"PortNumber";
        v113[0] = v8;
        v113[1] = v12;
        v14 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:2];
        [(__CFDictionary *)v13 setObject:v14 forKey:@"IOPropertyMatch"];

        v15 = [(DPAnalytics *)self log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[AUVDMAnalytics _startEventMonitoring]();
        }

        v16 = v13;
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v16);
        if (MatchingService)
        {
          io_registry_entry_t v18 = MatchingService;
          v107 = v8;
          v19 = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"BuiltIn", kCFAllocatorDefault, 0);
          objc_opt_class();
          v20 = castNSObjectToType(v19);

          if (v20)
          {
            v21 = v12;
            [v6 setObject:v20 forKey:@"PortBuiltIn"];
          }
          else
          {
            id v33 = &_os_log_default;
            BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v34) {
              -[AUVDMAnalytics _handleServiceMatched:].cold.9(v34, v35, v36, v37, v38, v39, v40, v41);
            }
            v21 = v12;
          }
          v42 = (void *)IORegistryEntryCreateCFProperty(v18, @"ConnectionUUID", kCFAllocatorDefault, 0);
          objc_opt_class();
          v43 = castNSObjectToType(v42);

          if (v43)
          {
            [v6 setObject:v43 forKey:@"ConnectionUUID"];
          }
          else
          {
            id v44 = &_os_log_default;
            BOOL v45 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v45) {
              -[AUVDMAnalytics _handleServiceMatched:].cold.8(v45, v46, v47, v48, v49, v50, v51, v52);
            }
          }
          objc_super v12 = v21;
          IOObjectRelease(v18);

          CFMutableDictionaryRef v8 = v107;
        }
        else
        {
          v20 = &_os_log_default;
          id v24 = &_os_log_default;
          BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v25) {
            -[AUVDMAnalytics _handleServiceMatched:].cold.7(v25, v26, v27, v28, v29, v30, v31, v32);
          }
        }

        goto LABEL_41;
      }
    }
    else
    {
      v22 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:].cold.6();
      }
    }
    *(void *)buf = 0;
    IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0);
    v23 = [(DPAnalytics *)self log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[AUVDMAnalytics _handleServiceMatched:].cold.5((uint64_t *)buf, v23);
    }

    if (*(void *)buf) {
      CFRelease(*(CFTypeRef *)buf);
    }
LABEL_41:
    v53 = (void *)IORegistryEntryCreateCFProperty(a3, @"Tunneled", kCFAllocatorDefault, 0);
    objc_opt_class();
    uint64_t v54 = castNSObjectToType(v53);

    v111 = (void *)v54;
    if (v54)
    {
      [v6 setObject:v54 forKey:@"TransportTunneled"];
    }
    else
    {
      v55 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]3();
      }
    }
    v56 = (void *)IORegistryEntryCreateCFProperty(a3, @"Role", kCFAllocatorDefault, 0);
    objc_opt_class();
    uint64_t v57 = castNSObjectToType(v56);

    if (v57)
    {
      [v6 setObject:v57 forKey:@"Role"];
    }
    else
    {
      v58 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]2();
      }
    }
    v59 = (void *)IORegistryEntryCreateCFProperty(a3, @"MaxLaneCount", kCFAllocatorDefault, 0);
    objc_opt_class();
    uint64_t v60 = castNSObjectToType(v59);

    if (v60)
    {
      [v6 setObject:v60 forKey:@"MaxLaneCount"];
    }
    else
    {
      v61 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]1();
      }
    }
    v62 = (void *)IORegistryEntryCreateCFProperty(a3, @"LaneCount", kCFAllocatorDefault, 0);
    objc_opt_class();
    uint64_t v63 = castNSObjectToType(v62);

    v108 = (void *)v63;
    if (v63)
    {
      [v6 setObject:v63 forKey:@"LaneCount"];
    }
    else
    {
      v64 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]0();
      }
    }
    v65 = (void *)IORegistryEntryCreateCFProperty(a3, @"SinkCount", kCFAllocatorDefault, 0);
    objc_opt_class();
    v66 = castNSObjectToType(v65);

    v109 = (void *)v60;
    v110 = (void *)v57;
    if (v66)
    {
      [v6 setObject:v66 forKey:@"SinkCount"];
    }
    else
    {
      v67 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]9();
      }
    }
    v68 = (void *)IORegistryEntryCreateCFProperty(a3, @"LinkRate", kCFAllocatorDefault, 0);
    objc_opt_class();
    v69 = castNSObjectToType(v68);

    if (v69)
    {
      [v6 setObject:v69 forKey:@"LinkRate"];
    }
    else
    {
      v70 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]8();
      }
    }
    v71 = (void *)IORegistryEntryCreateCFProperty(a3, @"Index", kCFAllocatorDefault, 0);
    objc_opt_class();
    v72 = castNSObjectToType(v71);

    if (v72)
    {
      [v6 setObject:v72 forKey:@"TransportIndex"];
    }
    else
    {
      v73 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]7();
      }
    }
    v74 = (void *)IORegistryEntryCreateCFProperty(a3, @"Metadata", kCFAllocatorDefault, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_147;
    }
    v75 = [v74 objectForKeyedSubscript:@"ManufacturerName"];
    if (v75)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v75 length] == (char *)&dword_0 + 3)
        {
          id v76 = v75;
          uint64_t v104 = *(unsigned __int8 *)[v76 bytes];
          id v77 = v76;
          v78 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%02X-%02X-%02X", v104, *((unsigned __int8 *)[v77 bytes] + 1), *((unsigned __int8 *)objc_msgSend(v77, "bytes") + 2));
          [v6 setObject:v78 forKey:@"ManufacturerID"];
        }
        else
        {
          v78 = [(DPAnalytics *)self log];
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
            -[DPAnalytics _handleServiceMatched:]5(v75);
          }
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 setObject:v75 forKey:@"ManufacturerID"];
          goto LABEL_90;
        }
        v78 = [(DPAnalytics *)self log];
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          -[DPAnalytics _handleServiceMatched:]6((uint64_t)v75, v78);
        }
      }
    }
    else
    {
      v78 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]4();
      }
    }

LABEL_90:
    v79 = [v74 objectForKeyedSubscript:@"ProductID"];

    if (v79)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 setObject:v79 forKey:@"ProductID"];
        goto LABEL_98;
      }
      v80 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]3();
      }
    }
    else
    {
      v80 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:]2();
      }
    }

LABEL_98:
    v81 = [v74 objectForKeyedSubscript:@"ProductName"];

    if (v81)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 setObject:v81 forKey:@"ProductName"];
      }
      else
      {
        v82 = [(DPAnalytics *)self log];
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
          -[DPAnalytics _handleServiceMatched:]1();
        }
      }
    }
    v83 = [v74 objectForKeyedSubscript:@"Model Year"];

    if (v83)
    {
      v84 = kACCCoreAnalytics_IOPort_Transport_DP_Field_ModelYear;
    }
    else
    {
      v85 = [v74 objectForKeyedSubscript:@"Week of Manufacture"];
      v86 = v85;
      if (v85 && [v85 unsignedIntegerValue])
      {
        [v6 setObject:v86 forKey:@"WeekOfManufacture"];
      }
      else
      {
        v87 = [(DPAnalytics *)self log];
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
          -[DPAnalytics _handleServiceMatched:]0();
        }
      }
      v83 = [v74 objectForKeyedSubscript:@"Year of Manufacture"];

      if (!v83 || ![v83 unsignedIntegerValue])
      {
        v88 = [(DPAnalytics *)self log];
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
          -[DPAnalytics _handleServiceMatched:].cold.9();
        }

        goto LABEL_119;
      }
      v84 = kACCCoreAnalytics_IOPort_Transport_DP_Field_YearOfManufacture;
    }
    [v6 setObject:v83 forKey:*v84];
LABEL_119:
    v89 = [v74 objectForKeyedSubscript:@"SinkDeviceOUI"];

    if (v89)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v89 length] == (char *)&dword_0 + 3)
        {
          id v90 = v89;
          uint64_t v105 = *(unsigned __int8 *)[v90 bytes];
          id v91 = v90;
          v92 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%02X-%02X-%02X", v105, *((unsigned __int8 *)[v91 bytes] + 1), *((unsigned __int8 *)objc_msgSend(v91, "bytes") + 2));
          [v6 setObject:v92 forKey:@"SinkDeviceOUI"];
        }
        else
        {
          v92 = [(DPAnalytics *)self log];
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
            -[DPAnalytics _handleServiceMatched:].cold.7(v89);
          }
        }
      }
      else
      {
        v92 = [(DPAnalytics *)self log];
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
          -[DPAnalytics _handleServiceMatched:].cold.8();
        }
      }
    }
    v93 = [v74 objectForKeyedSubscript:@"SinkDeviceID"];

    if (v93) {
      [v6 setObject:v93 forKey:@"SinkDeviceID"];
    }
    v94 = [v74 objectForKeyedSubscript:@"BranchDeviceOUI"];

    if (v94)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v94 length] == (char *)&dword_0 + 3)
        {
          id v95 = v94;
          uint64_t v106 = *(unsigned __int8 *)[v95 bytes];
          id v96 = v95;
          v97 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%02X-%02X-%02X", v106, *((unsigned __int8 *)[v96 bytes] + 1), *((unsigned __int8 *)objc_msgSend(v96, "bytes") + 2));
          [v6 setObject:v97 forKey:@"BranchDeviceOUI"];
        }
        else
        {
          v97 = [(DPAnalytics *)self log];
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
            -[DPAnalytics _handleServiceMatched:].cold.5(v94);
          }
        }
      }
      else
      {
        v97 = [(DPAnalytics *)self log];
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          -[DPAnalytics _handleServiceMatched:].cold.6();
        }
      }
    }
    v98 = [v74 objectForKeyedSubscript:@"BranchDeviceID"];

    if (v98) {
      [v6 setObject:v98 forKey:@"BranchDeviceID"];
    }
    v99 = [v74 objectForKeyedSubscript:@"DFP Type"];

    if (v99)
    {
      [v6 setObject:v99 forKey:@"DFPType"];
    }
    else
    {
      v100 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
        -[DPAnalytics _handleServiceMatched:].cold.4();
      }
    }
LABEL_147:
    v101 = [(DPAnalytics *)self log];
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.DP.published";
      _os_log_impl(&dword_0, v101, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", buf, 0xCu);
    }

    v102 = [(DPAnalytics *)self log];
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG)) {
      -[AUVDMAnalytics _handleServiceMatched:]();
    }

    os_log_t v9 = v6;
    if ((AnalyticsSendEventLazy() & 1) == 0)
    {
      v103 = [(DPAnalytics *)self log];
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:]();
      }
    }
LABEL_156:
  }
}

id __37__DPAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
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
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not find DP transport in %s plane!", (uint8_t *)&v1, 0xCu);
}

- (void)_handleServiceMatched:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find DFPType!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:(void *)a1 .cold.5(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_0, v1, v2, "Incorrect data length for '%s' key! (length: %lu, expecting: %d", v3, v4, v5, v6, 2u);
}

- (void)_handleServiceMatched:.cold.6()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v4, v5, "Incorrect data type for '%s' key! (class: %@, expecting: %@)", v6, v7, v8, v9, 2u);
}

- (void)_handleServiceMatched:(void *)a1 .cold.7(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_0, v1, v2, "Incorrect data length for '%s' key! (length: %lu, expecting: %d", v3, v4, v5, v6, 2u);
}

- (void)_handleServiceMatched:.cold.8()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v4, v5, "Incorrect data type for '%s' key! (class: %@, expecting: %@)", v6, v7, v8, v9, 2u);
}

- (void)_handleServiceMatched:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find YearOfManufacture!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find WeekOfManufacture!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.11()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v4, v5, "Incorrect data type for '%s' key! (class: %@, expecting: %@)", v6, v7, v8, v9, 2u);
}

- (void)_handleServiceMatched:.cold.12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find ProductID!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.13()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_0, v4, v5, "Incorrect data type for '%s' key! (class: %@, expecting: %@)", v6, v7, v8, v9, 2u);
}

- (void)_handleServiceMatched:.cold.14()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find ManufacturerID!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:(void *)a1 .cold.15(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_0, v1, v2, "Incorrect data length for '%@' key! (length: %lu, expecting: %d", v3, v4, v5, v6, 2u);
}

- (void)_handleServiceMatched:(uint64_t)a1 .cold.16(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  int v9 = 138413058;
  CFStringRef v10 = @"ManufacturerID";
  __int16 v11 = 2112;
  id v12 = v4;
  __int16 v13 = 2112;
  id v14 = v6;
  __int16 v15 = 2112;
  id v16 = v8;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Incorrect data type for '%@' key! (class: %@, expecting: %@ or %@)", (uint8_t *)&v9, 0x2Au);
}

- (void)_handleServiceMatched:.cold.17()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find transportIndex!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.18()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find link rate!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.19()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find sinkCount!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.20()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find laneCount!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.21()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find maxLaneCount!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.22()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find role!", v2, v3, v4, v5, v6);
}

- (void)_handleServiceMatched:.cold.23()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Could not find if transport is tunneled!", v2, v3, v4, v5, v6);
}

@end