@interface AppleFireWireAnalytics
- (AppleFireWireAnalytics)init;
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

@implementation AppleFireWireAnalytics

- (AppleFireWireAnalytics)init
{
  v12.receiver = self;
  v12.super_class = (Class)AppleFireWireAnalytics;
  v2 = [(AppleFireWireAnalytics *)&v12 init];
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
  block[2] = __31__AppleFireWireAnalytics_start__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

void __31__AppleFireWireAnalytics_start__block_invoke(uint64_t a1)
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
  block[2] = __30__AppleFireWireAnalytics_stop__block_invoke;
  block[3] = &unk_20408;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

void __30__AppleFireWireAnalytics_stop__block_invoke(uint64_t a1)
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
  CFMutableDictionaryRef v6 = IOServiceMatching("IOFireWireDevice");
  ioNotificationPort = self->_ioNotificationPort;
  CFDictionaryRef v8 = v6;
  os_log_t v9 = IOServiceAddMatchingNotification(ioNotificationPort, "IOServiceFirstMatch", v8, (IOServiceMatchingCallback)_serviceMatched_1, self, &self->_ioServiceMatchingIterator);
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
    _serviceMatched_1(self, self->_ioServiceMatchingIterator);
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
    if ([(AppleFireWireAnalytics *)self analyticsEventsEnabled])
    {
      IOObjectRetain(a3);
      dispatch_queue_t v5 = objc_opt_new();
      CFMutableDictionaryRef v6 = getPropFromReg(kAppleFireWireAnalytics_IOFireWireDevice_Property_VendorID, a3);
      [v5 setValue:v6 forKey:@"FireWire_VendorID"];

      v7 = getPropFromReg(kAppleFireWireAnalytics_IOFireWireDevice_Property_VendorName, a3);
      [v5 setValue:v7 forKey:@"FireWire_VendorName"];

      CFDictionaryRef v8 = getPropFromReg(kAppleFireWireAnalytics_IOFireWireDevice_Property_ProductName, a3);
      [v5 setValue:v8 forKey:@"FireWire_ProductName"];

      IOObjectRelease(a3);
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v14 = @"com.apple.accessories.IOFireWireDevice.FirstMatch";
        _os_log_impl(&dword_0, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Sending analytics event... (eventName: %@)", buf, 0xCu);
      }
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        -[ApplePCIeAnalytics _handleServiceMatched:]();
      }
      id v10 = v5;
      if ((AnalyticsSendEventLazy() & 1) == 0)
      {
        v11 = self->_log;
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
          -[AppleFireWireAnalytics _handleServiceMatched:]((os_log_t)v11);
        }
      }
    }
    else
    {
      objc_super v12 = self->_log;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v14 = @"com.apple.accessories.IOFireWireDevice.FirstMatch";
        _os_log_impl(&dword_0, (os_log_t)v12, OS_LOG_TYPE_INFO, "Analytics events are disabled for this event - ignoring... (eventName: %@)", buf, 0xCu);
      }
    }
  }
}

id __48__AppleFireWireAnalytics__handleServiceMatched___block_invoke(uint64_t a1)
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

- (void)_handleServiceMatched:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"com.apple.accessories.IOFireWireDevice.FirstMatch";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to send analytics event! (eventName: %@)", (uint8_t *)&v1, 0xCu);
}

@end