@interface AppleUSBCLightningAdapterAnalytics
- (AppleUSBCLightningAdapterAnalytics)init;
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

@implementation AppleUSBCLightningAdapterAnalytics

- (AppleUSBCLightningAdapterAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)AppleUSBCLightningAdapterAnalytics;
  v2 = [(AppleUSBCLightningAdapterAnalytics *)&v12 init];
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
  v3 = [(AppleUSBCLightningAdapterAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting %@...", buf, 0xCu);
  }
  v6 = [(AppleUSBCLightningAdapterAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__AppleUSBCLightningAdapterAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __43__AppleUSBCLightningAdapterAnalytics_start__block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) started];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__AppleUSBCLightningAdapterAnalytics_start__block_invoke_cold_1(v4);
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
  v3 = [(AppleUSBCLightningAdapterAnalytics *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    dispatch_queue_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    os_log_t v9 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping %@...", buf, 0xCu);
  }
  v6 = [(AppleUSBCLightningAdapterAnalytics *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__AppleUSBCLightningAdapterAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __42__AppleUSBCLightningAdapterAnalytics_stop__block_invoke(uint64_t a1)
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
      __42__AppleUSBCLightningAdapterAnalytics_stop__block_invoke_cold_1(v5);
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

  if ([(AppleUSBCLightningAdapterAnalytics *)self monitoring]
    || ![(AppleUSBCLightningAdapterAnalytics *)self started])
  {
    return [(AppleUSBCLightningAdapterAnalytics *)self monitoring];
  }
  else
  {
    v3 = [(AppleUSBCLightningAdapterAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting matching notifications...", buf, 2u);
    }

    id v4 = [(AppleUSBCLightningAdapterAnalytics *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting event monitoring...", v13, 2u);
    }

    [(AppleUSBCLightningAdapterAnalytics *)self setMonitoring:1];
    [(AppleUSBCLightningAdapterAnalytics *)self setIoNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
    dispatch_queue_t v5 = [(AppleUSBCLightningAdapterAnalytics *)self ioNotificationPort];
    v6 = [(AppleUSBCLightningAdapterAnalytics *)self queue];
    IONotificationPortSetDispatchQueue(v5, v6);

    CFMutableDictionaryRef v7 = IOServiceMatching("AppleUSBLightningAdapter");
    id v8 = [(AppleUSBCLightningAdapterAnalytics *)self ioNotificationPort];
    CFDictionaryRef v9 = v7;
    v10 = IOServiceAddMatchingNotification(v8, "IOServiceTerminate", v9, (IOServiceMatchingCallback)_serviceMatched_0, self, &self->_ioServiceMatchingIterator);
    if (v10)
    {
      objc_super v12 = [(AppleUSBCLightningAdapterAnalytics *)self log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(AUVDMAnalytics *)v10 _startEventMonitoring];
      }
    }
    else
    {
      _serviceMatched_0(self, self->_ioServiceMatchingIterator);
    }

    return v10 == 0;
  }
}

- (void)_stopEventMonitoring
{
  if ([(AppleUSBCLightningAdapterAnalytics *)self monitoring])
  {
    v3 = [(AppleUSBCLightningAdapterAnalytics *)self log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Stopping event monitoring...", v5, 2u);
    }

    [(AppleUSBCLightningAdapterAnalytics *)self setMonitoring:0];
    io_object_t ioServiceMatchingIterator = self->_ioServiceMatchingIterator;
    if (ioServiceMatchingIterator) {
      IOObjectRelease(ioServiceMatchingIterator);
    }
    if ([(AppleUSBCLightningAdapterAnalytics *)self ioNotificationPort]) {
      IONotificationPortDestroy([(AppleUSBCLightningAdapterAnalytics *)self ioNotificationPort]);
    }
  }
}

- (BOOL)analyticsEventsEnabled
{
  return AnalyticsIsEventUsed();
}

- (void)_handleServiceMatched:(unsigned int)a3
{
  dispatch_queue_t v5 = [(AppleUSBCLightningAdapterAnalytics *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Service matched!", buf, 2u);
  }

  if (!a3) {
    return;
  }
  if (![(AppleUSBCLightningAdapterAnalytics *)self analyticsEventsEnabled])
  {
    v11 = [(AppleUSBCLightningAdapterAnalytics *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v91 = @"com.apple.accessories.USBCLightningAdapter.Disconnected";
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Analytics disabled for this event - ignoring... (eventName: %@)", buf, 0xCu);
    }
    goto LABEL_89;
  }
  v87 = self;
  v88 = objc_opt_new();
  IOObjectRetain(a3);
  CFAllocatorRef v6 = kCFAllocatorDefault;
  unsigned int entry = a3;
  while (1)
  {
    BOOLean_t v7 = IOObjectConformsTo(a3, "IOPortTransportProtocolAppleUVDM");
    if (v7)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"Firmware Version", v6, 0);
      if (CFProperty) {
        [v88 setObject:CFProperty forKey:@"AUVDM_FirmwareVersion"];
      }
      CFAllocatorRef v9 = v6;
      v10 = (void *)IORegistryEntryCreateCFProperty(a3, @"Hardware Version", v6, 0);

      if (v10) {
        [v88 setObject:v10 forKey:@"AUVDM_HardwareVersion"];
      }

      CFAllocatorRef v6 = v9;
    }
    *(_DWORD *)buf = 0;
    IORegistryEntryGetParentEntry(a3, "IOService", (io_registry_entry_t *)buf);
    IOObjectRelease(a3);
    a3 = *(_DWORD *)buf;
    if (v7) {
      break;
    }
    if (!*(_DWORD *)buf) {
      goto LABEL_19;
    }
  }
  if (*(_DWORD *)buf) {
    IOObjectRelease(*(io_object_t *)buf);
  }
LABEL_19:
  objc_super v12 = (void *)IORegistryEntryCreateCFProperty(entry, @"USB Mode", v6, 0);
  if (v12) {
    [v88 setObject:v12 forKey:@"AUXP_USBMode"];
  }
  io_iterator_t iterator = 0;
  IORegistryEntryGetParentIterator(entry, "IOPort", &iterator);
  io_object_t v13 = IOIteratorNext(iterator);
  if (!v13) {
    goto LABEL_39;
  }
  io_object_t v14 = v13;
  while (!IOObjectConformsTo(v14, "IOPort"))
  {
LABEL_26:
    IOObjectRelease(v14);
    io_object_t v14 = IOIteratorNext(iterator);
    if (!v14) {
      goto LABEL_39;
    }
  }
  v15 = (void *)IORegistryEntryCreateCFProperty(v14, @"BuiltIn", v6, 0);
  if (![v15 BOOLValue])
  {

    goto LABEL_26;
  }
  v16 = (void *)IORegistryEntryCreateCFProperty(v14, @"ConnectionActiveDurationS", v6, 0);
  if (v16) {
    [v88 setObject:v16 forKey:@"ConnectionDuration_S"];
  }
  *(_DWORD *)buf = 0;
  IORegistryEntryGetChildIterator(v14, "IOPort", (io_iterator_t *)buf);
  io_object_t v17 = IOIteratorNext(*(io_iterator_t *)buf);
  if (v17)
  {
    io_object_t v18 = v17;
    while (!IOObjectConformsTo(v18, "IOPortTransportStateUSB2"))
    {
      IOObjectRelease(v18);
      io_object_t v18 = IOIteratorNext(*(io_iterator_t *)buf);
      if (!v18) {
        goto LABEL_38;
      }
    }
    v19 = (void *)IORegistryEntryCreateCFProperty(v18, @"DataRole", v6, 0);
    if (v19) {
      [v88 setObject:v19 forKey:@"USB2_DataRole"];
    }

    IOObjectRelease(v18);
  }
LABEL_38:
  IOObjectRelease(*(io_object_t *)buf);

  IOObjectRelease(v14);
LABEL_39:
  IOObjectRelease(iterator);
  io_iterator_t iterator = 0;
  v20 = (void *)IORegistryEntryCreateCFProperty(entry, @"AID Info", v6, 0);
  v21 = v20;
  if (v20)
  {
    uint64_t v22 = [v20 objectForKeyedSubscript:@"Accessory Firmware Version Major"];
    if (v22)
    {
      v23 = (void *)v22;
      uint64_t v24 = [v21 objectForKeyedSubscript:@"Accessory Firmware Version Minor"];
      if (!v24) {
        goto LABEL_44;
      }
      v25 = (void *)v24;
      v26 = [v21 objectForKeyedSubscript:@"Accessory Firmware Version Rev"];

      if (v26)
      {
        v23 = [v21 objectForKeyedSubscript:@"Accessory Firmware Version Major"];
        v27 = [v21 objectForKeyedSubscript:@"Accessory Firmware Version Minor"];
        v28 = [v21 objectForKeyedSubscript:@"Accessory Firmware Version Rev"];
        v29 = +[NSString stringWithFormat:@"%@.%@.%@", v23, v27, v28];
        [v88 setObject:v29 forKey:@"AUXP_AID_AccessoryFirmwareVersion"];

LABEL_44:
      }
    }
    uint64_t v30 = [v21 objectForKeyedSubscript:@"Accessory Hardware Version Major"];
    if (v30)
    {
      v31 = (void *)v30;
      uint64_t v32 = [v21 objectForKeyedSubscript:@"Accessory Hardware Version Minor"];
      if (!v32) {
        goto LABEL_49;
      }
      v33 = (void *)v32;
      v34 = [v21 objectForKeyedSubscript:@"Accessory Hardware Version Rev"];

      if (v34)
      {
        v31 = [v21 objectForKeyedSubscript:@"Accessory Hardware Version Major"];
        v35 = [v21 objectForKeyedSubscript:@"Accessory Hardware Version Minor"];
        v36 = [v21 objectForKeyedSubscript:@"Accessory Hardware Version Rev"];
        v37 = +[NSString stringWithFormat:@"%@.%@.%@", v31, v35, v36];
        [v88 setObject:v37 forKey:@"AUXP_AID_AccessoryHardwareVersion"];

LABEL_49:
      }
    }
    v38 = [v21 objectForKeyedSubscript:@"Accessory Manufacturer"];

    if (v38)
    {
      v39 = [v21 objectForKeyedSubscript:@"Accessory Manufacturer"];
      [v88 setObject:v39 forKey:@"AUXP_AID_AccessoryManufacturer"];
    }
    v40 = [v21 objectForKeyedSubscript:@"Accessory Model"];

    if (v40)
    {
      v41 = [v21 objectForKeyedSubscript:@"Accessory Model"];
      [v88 setObject:v41 forKey:@"AUXP_AID_AccessoryModel"];
    }
    v42 = [v21 objectForKeyedSubscript:@"Accessory Name"];

    if (v42)
    {
      v43 = [v21 objectForKeyedSubscript:@"Accessory Name"];
      [v88 setObject:v43 forKey:@"AUXP_AID_AccessoryName"];
    }
    v44 = [v21 objectForKeyedSubscript:@"Digital ID"];
    if (v44)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v44 length] == (char *)&dword_4 + 2)
      {
        id v45 = v44;
        v46 = (unsigned int *)[v45 bytes];
        v47 = +[NSNumber numberWithUnsignedLongLong:*v46 | ((unint64_t)*((unsigned __int16 *)v46 + 2) << 32)];
        [v88 setObject:v47 forKey:@"AUXP_AID_DigitalID"];
        id v48 = v45;
        v49 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *((unsigned char *)[v48 bytes] + 2) & 1);
        [v88 setObject:v49 forKey:@"AUXP_AID_DigitalID_BD"];

        id v50 = v48;
        v51 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", (*((unsigned __int8 *)[v50 bytes] + 2) >> 3) & 1);
        [v88 setObject:v51 forKey:@"AUXP_AID_DigitalID_CC"];

        id v52 = v50;
        v53 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", (*(unsigned __int8 *)[v52 bytes] >> 5) & 1);
        [v88 setObject:v53 forKey:@"AUXP_AID_DigitalID_DB"];

        id v54 = v52;
        v55 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", (*(unsigned __int8 *)[v54 bytes] >> 2) & 1);
        [v88 setObject:v55 forKey:@"AUXP_AID_DigitalID_MB"];

        id v56 = v54;
        v57 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *((unsigned __int8 *)[v56 bytes] + 2) >> 7);
        [v88 setObject:v57 forKey:@"AUXP_AID_DigitalID_PU"];

        id v58 = v56;
        v59 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *((unsigned __int8 *)[v58 bytes] + 1) >> 4);
        [v88 setObject:v59 forKey:@"AUXP_AID_DigitalID_PWR"];

        id v60 = v58;
        v61 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *(unsigned char *)[v60 bytes] & 3);
        [v88 setObject:v61 forKey:@"AUXP_AID_DigitalID_UART"];

        v62 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", (*(unsigned __int8 *)[v60 bytes] >> 3) & 3);
        [v88 setObject:v62 forKey:@"AUXP_AID_DigitalID_USB"];
      }
    }
    v63 = [v21 objectForKeyedSubscript:@"Accessory HID VID"];

    if (v63)
    {
      v64 = [v21 objectForKeyedSubscript:@"Accessory HID VID"];
      [v88 setObject:v64 forKey:@"AUXP_AID_HID_PID"];
    }
    v65 = [v21 objectForKeyedSubscript:@"Accessory HID PID"];

    if (v65)
    {
      v66 = [v21 objectForKeyedSubscript:@"Accessory HID PID"];
      [v88 setObject:v66 forKey:@"AUXP_AID_HID_VID"];
    }
  }
  v67 = (void *)IORegistryEntryCreateCFProperty(entry, @"MikeyBus Info", v6, 0);
  v68 = v67;
  if (v67)
  {
    v69 = [v67 objectForKeyedSubscript:@"Product Firmware Revision"];

    if (v69)
    {
      v70 = [v68 objectForKeyedSubscript:@"Product Firmware Revision"];
      [v88 setObject:v70 forKey:@"AUXP_MikeyBus_FirmwareRevision"];
    }
    v71 = [v68 objectForKeyedSubscript:@"Product Hardware Revision"];

    if (v71)
    {
      v72 = [v68 objectForKeyedSubscript:@"Product Hardware Revision"];
      [v88 setObject:v72 forKey:@"AUXP_MikeyBus_HardwareRevision"];
    }
    v73 = [v68 objectForKeyedSubscript:@"Product ID"];

    if (v73)
    {
      v74 = [v68 objectForKeyedSubscript:@"Product ID"];
      [v88 setObject:v74 forKey:@"AUXP_MikeyBus_PID"];
    }
    v75 = [v68 objectForKeyedSubscript:@"Product Model Number"];

    if (v75)
    {
      v76 = [v68 objectForKeyedSubscript:@"Product Model Number"];
      [v88 setObject:v76 forKey:@"AUXP_MikeyBus_ProductModelNumber"];
    }
    v77 = [v68 objectForKeyedSubscript:@"Product Name"];

    if (v77)
    {
      v78 = [v68 objectForKeyedSubscript:@"Product Name"];
      [v88 setObject:v78 forKey:@"AUXP_MikeyBus_ProductName"];
    }
    v79 = [v68 objectForKeyedSubscript:@"Product Vendor Name"];

    if (v79)
    {
      v80 = [v68 objectForKeyedSubscript:@"Product Vendor Name"];
      [v88 setObject:v80 forKey:@"AUXP_MikeyBus_ProductVendorName"];
    }
    v81 = [v68 objectForKeyedSubscript:@"Product Vendor ID"];

    if (v81)
    {
      v82 = [v68 objectForKeyedSubscript:@"Product Vendor ID"];
      [v88 setObject:v82 forKey:@"AUXP_MikeyBus_VID"];
    }
  }
  v83 = [(AppleUSBCLightningAdapterAnalytics *)v87 log];
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v91 = @"com.apple.accessories.USBCLightningAdapter.Disconnected";
    _os_log_impl(&dword_0, v83, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", buf, 0xCu);
  }

  v84 = [(AppleUSBCLightningAdapterAnalytics *)v87 log];
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
    -[USBAnalytics _handleServiceMatched:]((uint64_t)v88, v84);
  }

  v11 = v88;
  if ((AnalyticsSendEventLazy() & 1) == 0)
  {
    v85 = [(AppleUSBCLightningAdapterAnalytics *)v87 log];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      -[USBAnalytics _handleServiceMatched:](@"com.apple.accessories.USBCLightningAdapter.Disconnected", v85);
    }
  }
LABEL_89:
}

id __60__AppleUSBCLightningAdapterAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
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

void __43__AppleUSBCLightningAdapterAnalytics_start__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Already started... ignoring!", v1, 2u);
}

void __42__AppleUSBCLightningAdapterAnalytics_stop__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Already stopped... ignoring!", v1, 2u);
}

@end