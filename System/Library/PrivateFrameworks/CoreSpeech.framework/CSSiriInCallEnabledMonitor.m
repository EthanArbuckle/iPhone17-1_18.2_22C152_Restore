@interface CSSiriInCallEnabledMonitor
+ (id)sharedInstance;
- (BOOL)_checkSiriInCallEnabled;
- (BOOL)isEnabled;
- (CSSiriInCallEnabledMonitor)init;
- (void)_didReceiveSiriInCallChangedInQueue:(BOOL)a3;
- (void)_siriInCallEnabledDidChangeEnabledDidChange;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSiriInCallEnabledMonitor

- (void).cxx_destruct
{
}

- (void)_siriInCallEnabledDidChangeEnabledDidChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012B4BC;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_checkSiriInCallEnabled
{
  if (AFSupportsSiriInCall())
  {
    v2 = +[AFPreferences sharedPreferences];
    unsigned int v3 = [v2 siriInCallEnabled];
  }
  else
  {
    unsigned int v3 = 0;
  }
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 136315394;
    v8 = "-[CSSiriInCallEnabledMonitor _checkSiriInCallEnabled]";
    __int16 v9 = 2114;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Siri in Call enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)_didReceiveSiriInCallChangedInQueue:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10012B778;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSSiriInCallEnabledMonitor *)self enumerateObserversInQueue:v3];
}

- (void)_stopMonitoring
{
  if (AFDeviceSupportsFullSiriUOD()
    && +[AFFeatureFlags isBlushingPhantomEnabled])
  {
    unsigned int v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[CSSiriInCallEnabledMonitor _stopMonitoring]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s stop monitoring Siri Hangup settings in AFPreferences", (uint8_t *)&v5, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFPreferencesDidChangeDarwinNotification, 0);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  if (AFDeviceSupportsFullSiriUOD()
    && +[AFFeatureFlags isBlushingPhantomEnabled])
  {
    BOOL v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "-[CSSiriInCallEnabledMonitor _startMonitoringWithQueue:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s start monitoring Siri in Call settings in AFPreferences", (uint8_t *)&v6, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10012B974, kAFPreferencesDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDrop);
  }
  self->_isEnabled = [(CSSiriInCallEnabledMonitor *)self _checkSiriInCallEnabled];
}

- (CSSiriInCallEnabledMonitor)init
{
  if (+[CSUtils isDarwinOS])
  {
    unsigned int v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSSiriInCallEnabledMonitor;
    BOOL v4 = [(CSSiriInCallEnabledMonitor *)&v8 init];
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("CSSiriInCallEnabledMonitor queue", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;

      v4->_isEnabled = 0;
    }
    self = v4;
    unsigned int v3 = self;
  }

  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3AF0 != -1) {
    dispatch_once(&qword_1002A3AF0, &stru_1002521B8);
  }
  v2 = (void *)qword_1002A3AE8;
  return v2;
}

@end