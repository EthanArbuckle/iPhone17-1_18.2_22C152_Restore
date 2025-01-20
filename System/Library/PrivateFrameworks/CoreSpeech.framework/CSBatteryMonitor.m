@interface CSBatteryMonitor
+ (id)sharedInstance;
- (CSBatteryMonitor)init;
- (unsigned)_checkBatteryState;
- (unsigned)batteryState;
- (void)_didReceiveBatteryStatusChanged:(unsigned __int8)a3;
- (void)_didReceiveBatteryStatusChangedInQueue:(unsigned __int8)a3;
- (void)_notifyObserver:(id)a3 withBatteryState:(unsigned __int8)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSBatteryMonitor

- (unsigned)_checkBatteryState
{
  int v2 = IOPSDrawingUnlimitedPower();
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"Battery";
    if (v2) {
      CFStringRef v4 = @"Charger";
    }
    int v6 = 136315394;
    v7 = "-[CSBatteryMonitor _checkBatteryState]";
    __int16 v8 = 2114;
    CFStringRef v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Power source : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  if (v2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (unsigned)batteryState
{
  return self->_batteryState;
}

- (void)_notifyObserver:(id)a3 withBatteryState:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [(CSBatteryMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSBatteryMonitor:self didReceiveBatteryStatusChanged:v4];
  }
}

- (void)_didReceiveBatteryStatusChanged:(unsigned __int8)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10016BE3C;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  unsigned __int8 v4 = a3;
  [(CSBatteryMonitor *)self enumerateObservers:v3];
}

- (void)_didReceiveBatteryStatusChangedInQueue:(unsigned __int8)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10016BEC0;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  unsigned __int8 v4 = a3;
  [(CSBatteryMonitor *)self enumerateObserversInQueue:v3];
}

- (void)_stopMonitoring
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    unsigned __int8 v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSBatteryMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Power source", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  unsigned __int8 v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10016C130;
    handler[3] = &unk_100253680;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.powersources.source", &self->_notifyToken, v4, handler);
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFStringRef v9 = "-[CSBatteryMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Start monitoring : Power source";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFStringRef v9 = "-[CSBatteryMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Cannot start monitoring power source because it was already started";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_batteryState = [(CSBatteryMonitor *)self _checkBatteryState];
}

- (CSBatteryMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSBatteryMonitor;
  result = [(CSBatteryMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_batteryState = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (qword_1002A3CB0 != -1) {
      dispatch_once(&qword_1002A3CB0, &stru_100253658);
    }
    id v2 = (id)qword_1002A3CA8;
  }
  return v2;
}

@end