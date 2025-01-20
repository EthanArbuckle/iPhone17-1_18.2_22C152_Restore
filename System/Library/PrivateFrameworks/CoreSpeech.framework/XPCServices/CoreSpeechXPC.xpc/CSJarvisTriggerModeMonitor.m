@interface CSJarvisTriggerModeMonitor
+ (id)sharedInstance;
+ (id)triggerModeStringDescription:(int64_t)a3;
- (CSJarvisTriggerModeMonitor)init;
- (int64_t)_fetchTriggerMode;
- (int64_t)getTriggerMode;
- (void)_notifyJarvisTriggerModeDidChanged;
- (void)_notifyObserver:(id)a3 withJarvisTriggerMode:(int64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setTriggerMode:(int64_t)a3;
@end

@implementation CSJarvisTriggerModeMonitor

- (void)_notifyObserver:(id)a3 withJarvisTriggerMode:(int64_t)a4
{
  id v6 = a3;
  [(CSJarvisTriggerModeMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSJarvisTriggerModeMonitor:self didReceiveTriggerModeChanged:a4];
  }
}

- (void)_notifyJarvisTriggerModeDidChanged
{
  int64_t v3 = [(CSJarvisTriggerModeMonitor *)self _fetchTriggerMode];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor _notifyJarvisTriggerModeDidChanged]";
    __int16 v8 = 1026;
    int v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Notifying jarvis trigger mode change to %{public}d", buf, 0x12u);
  }
  self->_triggerMode = v3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002DA0;
  v5[3] = &unk_10001C480;
  v5[4] = self;
  v5[5] = v3;
  [(CSJarvisTriggerModeMonitor *)self enumerateObserversInQueue:v5];
}

- (int64_t)_fetchTriggerMode
{
  v2 = +[CSFPreferences sharedPreferences];
  id v3 = [v2 getJarvisTriggerMode];

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor _fetchTriggerMode]";
    __int16 v8 = 1026;
    int v9 = (int)v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  return (int64_t)v3;
}

- (int64_t)getTriggerMode
{
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int64_t triggerMode = self->_triggerMode;
    int v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor getTriggerMode]";
    __int16 v8 = 1026;
    int v9 = triggerMode;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Queried Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  return self->_triggerMode;
}

- (void)setTriggerMode:(int64_t)a3
{
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor setTriggerMode:]";
    __int16 v8 = 1026;
    int v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Setting Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  v5 = +[CSFPreferences sharedPreferences];
  [v5 setJarvisTriggerMode:a3];
}

- (void)_stopMonitoring
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kCSPreferencesJarvisTriggerModeDidChangeDarwinNotification, 0);
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSJarvisTriggerModeMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : jarvis trigger mode switch", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000031F8, kCSPreferencesJarvisTriggerModeDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDrop);
  int64_t v5 = [(CSJarvisTriggerModeMonitor *)self _fetchTriggerMode];
  int v6 = v5;
  self->_int64_t triggerMode = v5;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[CSJarvisTriggerModeMonitor _startMonitoringWithQueue:]";
    __int16 v10 = 1026;
    int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : jarvis trigger mode switch, trigger mode is set to %{public}d", (uint8_t *)&v8, 0x12u);
  }
}

- (CSJarvisTriggerModeMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSJarvisTriggerModeMonitor;
  result = [(CSJarvisTriggerModeMonitor *)&v3 init];
  if (result) {
    result->_int64_t triggerMode = 2;
  }
  return result;
}

+ (id)triggerModeStringDescription:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_10001C4A0[a3 + 1];
  }
}

+ (id)sharedInstance
{
  if (qword_100022D40 != -1) {
    dispatch_once(&qword_100022D40, &stru_10001C458);
  }
  v2 = (void *)qword_100022D38;
  return v2;
}

@end