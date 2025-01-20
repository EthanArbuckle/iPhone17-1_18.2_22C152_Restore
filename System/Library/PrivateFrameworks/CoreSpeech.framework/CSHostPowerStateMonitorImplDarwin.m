@interface CSHostPowerStateMonitorImplDarwin
+ (id)sharedInstance;
- (CSHostPowerStateMonitorImplDarwin)init;
- (int)_fetchHostStateWithService:(unsigned int)a3;
- (int64_t)currentDarwinHostState;
- (int64_t)currentPowerState;
- (int64_t)currentRawPowerState;
- (void)_didReceiveDarwinHostStateChangeNotification:(int64_t)a3;
- (void)_notifyObserver:(id)a3 withDarwinHostState:(int64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSHostPowerStateMonitorImplDarwin

- (void)_notifyObserver:(id)a3 withDarwinHostState:(int64_t)a4
{
  id v6 = a3;
  [(CSHostPowerStateMonitorImplDarwin *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSHostPowerStateMonitor:self didReceiveDarwinHostStateChange:a4];
  }
}

- (void)_didReceiveDarwinHostStateChangeNotification:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100124CA4;
  v3[3] = &unk_100253878;
  v3[4] = self;
  v3[5] = a3;
  [(CSHostPowerStateMonitorImplDarwin *)self enumerateObserversInQueue:v3];
}

- (int)_fetchHostStateWithService:(unsigned int)a3
{
  int v4 = -1;
  int valuePtr = -1;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a3, @"HostState", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v6 = CFProperty;
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFNumberGetTypeID()) {
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
    }
    CFRelease(v6);
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[CSHostPowerStateMonitorImplDarwin _fetchHostStateWithService:]";
      __int16 v13 = 1026;
      int v14 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Darwin Host State update : %{public}d", buf, 0x12u);
    }
    int v4 = valuePtr;
  }
  self->_hostState = v4;
  return v4;
}

- (int64_t)currentDarwinHostState
{
  return self->_hostState;
}

- (int64_t)currentRawPowerState
{
  return -1;
}

- (int64_t)currentPowerState
{
  return -1;
}

- (void)_stopMonitoring
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[CSHostPowerStateMonitorImplDarwin _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Host power state update", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  kern_return_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  io_object_t serviceNotification;
  int v14;
  const char *v15;

  int v4 = IONotificationPortCreate(kIOMainPortDefault);
  self->_notificationPort = v4;
  if (v4)
  {
    CFDictionaryRef v5 = IOServiceMatching("AppleDisplayPlatformControl");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
    if (MatchingService)
    {
      io_service_t v7 = MatchingService;
      IONotificationPortSetDispatchQueue(self->_notificationPort, (dispatch_queue_t)&_dispatch_main_q);
      v8 = IOServiceAddInterestNotification(self->_notificationPort, v7, "IOGeneralInterest", (IOServiceInterestCallback)sub_10012517C, self, &self->_serviceNotification);
      v9 = CSLogContextFacilityCoreSpeech;
      if (v8)
      {
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136315138;
          v15 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Failed to register host state notification", (uint8_t *)&v14, 0xCu);
        }
      }
      else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        v15 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Host power state update", (uint8_t *)&v14, 0xCu);
      }
      IOObjectRelease(v7);
    }
    else
    {
      v11 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        v15 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to find matching service for AppleDisplayPlatformControl", (uint8_t *)&v14, 0xCu);
      }
    }
    if (!self->_serviceNotification)
    {
      v12 = CSLogContextFacilityCoreSpeech;
      serviceNotification = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR);
      if (serviceNotification)
      {
        int v14 = 136315138;
        v15 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Invalid service notification!", (uint8_t *)&v14, 0xCu);
        serviceNotification = self->_serviceNotification;
      }
      IOObjectRelease(serviceNotification);
      self->_serviceNotification = 0;
    }
  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Invalid notification port!", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (CSHostPowerStateMonitorImplDarwin)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSHostPowerStateMonitorImplDarwin;
  v2 = [(CSHostPowerStateMonitorImplDarwin *)&v8 init];
  int v3 = v2;
  if (v2)
  {
    v2->_serviceNotification = 0;
    CFDictionaryRef v4 = IOServiceMatching("AppleDisplayPlatformControl");
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
    if (MatchingService) {
      uint64_t v6 = [(CSHostPowerStateMonitorImplDarwin *)v3 _fetchHostStateWithService:MatchingService];
    }
    else {
      uint64_t v6 = -1;
    }
    v3->_hostState = v6;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3AC0 != -1) {
    dispatch_once(&qword_1002A3AC0, &stru_100252088);
  }
  v2 = (void *)qword_1002A3AB8;
  return v2;
}

@end