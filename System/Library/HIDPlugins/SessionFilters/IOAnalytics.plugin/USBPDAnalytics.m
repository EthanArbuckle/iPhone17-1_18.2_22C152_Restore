@interface USBPDAnalytics
- (BOOL)_startEventMonitoring;
- (BOOL)analyticsEventsEnabled;
- (BOOL)monitoring;
- (BOOL)started;
- (IONotificationPort)ioNotificationPort;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (USBPDAnalytics)init;
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

@implementation USBPDAnalytics

- (USBPDAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)USBPDAnalytics;
  v2 = [(USBPDAnalytics *)&v12 init];
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
  v3 = [(USBPDAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting %@...", buf, 0xCu);
  }
  v6 = [(USBPDAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __23__USBPDAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __23__USBPDAnalytics_start__block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) started];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __23__USBPDAnalytics_start__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    [v3 setStarted:1];
    objc_super v12 = *(void **)(a1 + 32);
    [v12 _startEventMonitoring];
  }
}

- (void)stop
{
  v3 = [(USBPDAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping %@...", buf, 0xCu);
  }
  uint64_t v6 = [(USBPDAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __22__USBPDAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __22__USBPDAnalytics_stop__block_invoke(uint64_t a1)
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
    uint64_t v5 = [v3 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __22__USBPDAnalytics_stop__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (BOOL)_startEventMonitoring
{
  kern_return_t v10;
  BOOL v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint8_t v22[16];
  uint8_t buf[16];
  uint64_t vars8;

  if (![(USBPDAnalytics *)self monitoring] && [(USBPDAnalytics *)self started])
  {
    v3 = [(USBPDAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting matching notifications...", buf, 2u);
    }

    id v4 = [(USBPDAnalytics *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting event monitoring...", v22, 2u);
    }

    [(USBPDAnalytics *)self setMonitoring:1];
    [(USBPDAnalytics *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
    uint64_t v5 = [(USBPDAnalytics *)self ioNotificationPort];
    uint64_t v6 = [(USBPDAnalytics *)self queue];
    IONotificationPortSetDispatchQueue(v5, v6);

    CFMutableDictionaryRef v7 = IOServiceMatching("IOPortTransportComponentCCUSBPD");
    CFMutableDictionaryRef v8 = v7;
    if (v7)
    {
      [(__CFDictionary *)v7 setObject:&off_240E8 forKey:@"IOPropertyExistsMatch"];
      uint64_t v9 = [(USBPDAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[AUVDMAnalytics _startEventMonitoring]();
      }

      uint64_t v10 = IOServiceAddMatchingNotification([(USBPDAnalytics *)self ioNotificationPort], "IOServiceMatched", v8, (IOServiceMatchingCallback)_servicesMatched_3, self, &self->_ioServiceMatchingIterator);
      if (!v10)
      {
        _servicesMatched_3(self, self->_ioServiceMatchingIterator);
        uint64_t v11 = 1;
LABEL_12:

        return v11;
      }
      v21 = v10;
      v13 = [(USBPDAnalytics *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(AUVDMAnalytics *)v21 _startEventMonitoring];
      }
    }
    else
    {
      v13 = [(USBPDAnalytics *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(USBPDAnalytics *)v13 _startEventMonitoring];
      }
    }

    uint64_t v11 = 0;
    goto LABEL_12;
  }

  return [(USBPDAnalytics *)self monitoring];
}

- (void)_stopEventMonitoring
{
  if ([(USBPDAnalytics *)self monitoring])
  {
    v3 = [(USBPDAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping event monitoring...", v5, 2u);
    }

    [(USBPDAnalytics *)self setMonitoring:0];
    io_object_t ioServiceMatchingIterator = self->_ioServiceMatchingIterator;
    if (ioServiceMatchingIterator) {
      IOObjectRelease(ioServiceMatchingIterator);
    }
    if ([(USBPDAnalytics *)self ioNotificationPort]) {
      IONotificationPortDestroy([(USBPDAnalytics *)self ioNotificationPort]);
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
    uint64_t v5 = [(USBPDAnalytics *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = name;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Service matched! (serviceName: %s)", buf, 0xCu);
    }

    if (![(USBPDAnalytics *)self analyticsEventsEnabled])
    {
      uint64_t v9 = [(USBPDAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.component.USBPD.published";
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Analytics disabled for this event - ignoring... (eventName: %@)", buf, 0xCu);
      }
      goto LABEL_83;
    }
    if (!IOObjectConformsTo(a3, "IOPortTransportComponentCCUSBPD"))
    {
      uint64_t v9 = [(USBPDAnalytics *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AUVDMAnalytics _handleServiceMatched:](v9);
      }
      goto LABEL_83;
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
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v10) {
        -[USBPDAnalytics _handleServiceMatched:]2(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    v18 = (void *)IORegistryEntryCreateCFProperty(a3, @"ParentPortNumber", kCFAllocatorDefault, 0);
    objc_opt_class();
    v19 = castNSObjectToType(v18);

    if (v19)
    {
      [v6 setObject:v19 forKey:@"PortNumber"];
      if (v8)
      {
        CFMutableDictionaryRef v20 = IOServiceMatching("IOPort");
        v121[0] = @"PortType";
        v121[1] = @"PortNumber";
        v122[0] = v8;
        v122[1] = v19;
        v21 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:2];
        [(__CFDictionary *)v20 setObject:v21 forKey:@"IOPropertyMatch"];

        v22 = [(USBPDAnalytics *)self log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[AUVDMAnalytics _startEventMonitoring]();
        }

        CFDictionaryRef v23 = v20;
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v23);
        if (MatchingService)
        {
          io_registry_entry_t v25 = MatchingService;
          v119 = v8;
          v26 = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"BuiltIn", kCFAllocatorDefault, 0);
          objc_opt_class();
          v27 = castNSObjectToType(v26);

          v28 = v19;
          if (v27)
          {
            [v6 setObject:v27 forKey:@"PortBuiltIn"];
          }
          else
          {
            BOOL v46 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v46) {
              -[AUVDMAnalytics _handleServiceMatched:].cold.9(v46, v47, v48, v49, v50, v51, v52, v53);
            }
          }
          v54 = (void *)IORegistryEntryCreateCFProperty(v25, @"ConnectionUUID", kCFAllocatorDefault, 0);
          objc_opt_class();
          v55 = castNSObjectToType(v54);

          if (v55)
          {
            [v6 setObject:v55 forKey:@"ConnectionUUID"];
            v19 = v28;
          }
          else
          {
            BOOL v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            v19 = v28;
            if (v56) {
              -[AUVDMAnalytics _handleServiceMatched:].cold.8(v56, v57, v58, v59, v60, v61, v62, v63);
            }
          }
          IOObjectRelease(v25);

          CFMutableDictionaryRef v8 = v119;
        }
        else
        {
          BOOL v38 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v38) {
            -[AUVDMAnalytics _handleServiceMatched:].cold.7(v38, v39, v40, v41, v42, v43, v44, v45);
          }
        }

LABEL_37:
        v64 = (void *)IORegistryEntryCreateCFProperty(a3, @"Address", kCFAllocatorDefault, 0);
        objc_opt_class();
        castNSObjectToType(v64);
        v65 = (char *)objc_claimAutoreleasedReturnValue();

        if (v65)
        {
          [v6 setObject:v65 forKey:@"USBPD_ComponentAddress"];
        }
        else
        {
          BOOL v66 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v66) {
            -[USBPDAnalytics _handleServiceMatched:].cold.5(v66, v67, v68, v69, v70, v71, v72, v73);
          }
        }
        v74 = (void *)IORegistryEntryCreateCFProperty(a3, @"Specification Revision", kCFAllocatorDefault, 0);
        objc_opt_class();
        uint64_t v75 = castNSObjectToType(v74);

        v120 = (void *)v75;
        if (v75)
        {
          [v6 setObject:v75 forKey:@"USBPD_SpecificationRevision"];
        }
        else
        {
          BOOL v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v76) {
            -[USBPDAnalytics _handleServiceMatched:].cold.4(v76, v77, v78, v79, v80, v81, v82, v83);
          }
        }
        v84 = (void *)IORegistryEntryCreateCFProperty(a3, @"Metadata", kCFAllocatorDefault, 0);
        objc_opt_class();
        v85 = castNSObjectToType(v84);

        if (v85)
        {
          v86 = [v85 objectForKeyedSubscript:@"Vendor ID"];
          objc_opt_class();
          v87 = castNSObjectToType(v86);

          if (v87)
          {
            v88 = [v85 objectForKeyedSubscript:@"Vendor ID"];
            [v6 setObject:v88 forKey:@"VendorID"];
          }
          v89 = [v85 objectForKeyedSubscript:@"Product ID"];
          objc_opt_class();
          v90 = castNSObjectToType(v89);

          if (v90)
          {
            v91 = [v85 objectForKeyedSubscript:@"Product ID"];
            [v6 setObject:v91 forKey:@"USBPD_ProductID"];
          }
          v92 = [v85 objectForKeyedSubscript:@"bcdDevice"];
          objc_opt_class();
          v93 = castNSObjectToType(v92);

          if (v93)
          {
            v94 = [v85 objectForKeyedSubscript:@"bcdDevice"];
            [v6 setObject:v94 forKey:@"USBPD_bcdDevice"];
          }
          v118 = v19;
          v117 = v65;
          if (v65 == (unsigned char *)&dword_0 + 2)
          {
            v95 = [v85 objectForKeyedSubscript:@"Product Type"];
            objc_opt_class();
            v96 = castNSObjectToType(v95);

            if (v96)
            {
              v97 = [v85 objectForKeyedSubscript:@"Product Type"];
              [v6 setObject:v97 forKey:@"USBPD_SOPp_ProductType"];
            }
          }
          v98 = [v85 objectForKeyedSubscript:@"VDOs"];
          objc_opt_class();
          v99 = castNSObjectToType(v98);

          if (v99)
          {
            id v100 = [v99 count];
            uint64_t v101 = 6;
            if ((unint64_t)v100 < 6) {
              uint64_t v101 = (uint64_t)v100;
            }
            if (v101)
            {
              for (unint64_t i = 0; i < v113; ++i)
              {
                v103 = [v99 objectAtIndexedSubscript:i];
                objc_opt_class();
                v104 = castNSObjectToType(v103);

                if (v104)
                {
                  id v105 = [v99 objectAtIndexedSubscript:i];
                  unsigned int v106 = *(_DWORD *)[v105 bytes];

                  uint64_t v107 = bswap32(v106);
                  switch((int)i)
                  {
                    case 0:
                      v108 = +[NSNumber numberWithUnsignedInt:v107];
                      v109 = v6;
                      v110 = v108;
                      CFStringRef v111 = @"USBPD_VDO_DiscoverIdentity_IDHeader";
                      goto LABEL_68;
                    case 1:
                      v108 = +[NSNumber numberWithUnsignedInt:v107];
                      v109 = v6;
                      v110 = v108;
                      CFStringRef v111 = @"USBPD_VDO_DiscoverIdentity_CertStat";
                      goto LABEL_68;
                    case 2:
                      v108 = +[NSNumber numberWithUnsignedInt:v107];
                      v109 = v6;
                      v110 = v108;
                      CFStringRef v111 = @"USBPD_VDO_DiscoverIdentity_Product";
                      goto LABEL_68;
                    case 3:
                      v108 = +[NSNumber numberWithUnsignedInt:v107];
                      v109 = v6;
                      v110 = v108;
                      CFStringRef v111 = @"USBPD_VDO_DiscoverIdentity_4";
                      goto LABEL_68;
                    case 4:
                      v108 = +[NSNumber numberWithUnsignedInt:v107];
                      v109 = v6;
                      v110 = v108;
                      CFStringRef v111 = @"USBPD_VDO_DiscoverIdentity_5";
                      goto LABEL_68;
                    case 5:
                      v108 = +[NSNumber numberWithUnsignedInt:v107];
                      v109 = v6;
                      v110 = v108;
                      CFStringRef v111 = @"USBPD_VDO_DiscoverIdentity_6";
LABEL_68:
                      [v109 setObject:v110 forKey:v111];

                      break;
                    default:
                      break;
                  }
                }
                id v112 = [v99 count];
                if ((unint64_t)v112 >= 6) {
                  unint64_t v113 = 6;
                }
                else {
                  unint64_t v113 = (unint64_t)v112;
                }
              }
            }
          }

          v19 = v118;
          v65 = v117;
        }
        v114 = [(USBPDAnalytics *)self log];
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"com.apple.ioport.transport.component.USBPD.published";
          _os_log_impl(&dword_0, v114, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", buf, 0xCu);
        }

        v115 = [(USBPDAnalytics *)self log];
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG)) {
          -[AUVDMAnalytics _handleServiceMatched:]();
        }

        uint64_t v9 = v6;
        if ((AnalyticsSendEventLazy() & 1) == 0)
        {
          v116 = [(USBPDAnalytics *)self log];
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
            -[AUVDMAnalytics _handleServiceMatched:]();
          }
        }
LABEL_83:

        return;
      }
    }
    else
    {
      BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v29) {
        -[USBPDAnalytics _handleServiceMatched:].cold.7(v29, v30, v31, v32, v33, v34, v35, v36);
      }
    }
    *(void *)buf = 0;
    IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0);
    v37 = [(USBPDAnalytics *)self log];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[AUVDMAnalytics _handleServiceMatched:].cold.5((uint64_t *)buf, v37);
    }

    if (*(void *)buf) {
      CFRelease(*(CFTypeRef *)buf);
    }
    goto LABEL_37;
  }
}

id __40__USBPDAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
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

void __23__USBPDAnalytics_start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __22__USBPDAnalytics_stop__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_startEventMonitoring
{
}

- (void)_handleServiceMatched:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleServiceMatched:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleServiceMatched:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleServiceMatched:(uint64_t)a3 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end