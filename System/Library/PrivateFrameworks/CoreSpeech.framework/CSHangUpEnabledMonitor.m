@interface CSHangUpEnabledMonitor
+ (id)sharedInstance;
- (BOOL)_checkCanUseVoiceTriggerDuringCallEnabled;
- (BOOL)isEnabled;
- (CSHangUpEnabledMonitor)init;
- (void)_didReceiveCanUseVoiceTriggerDuringCallSettingChangedInQueue:(BOOL)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)_voiceTriggerDuringCallEnabledDidChange;
@end

@implementation CSHangUpEnabledMonitor

- (void).cxx_destruct
{
}

- (void)_voiceTriggerDuringCallEnabledDidChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC5E4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_checkCanUseVoiceTriggerDuringCallEnabled
{
  v2 = +[VTPreferences sharedPreferences];
  unsigned int v3 = [v2 canUseVoiceTriggerDuringPhoneCall];

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 136315394;
    v8 = "-[CSHangUpEnabledMonitor _checkCanUseVoiceTriggerDuringCallEnabled]";
    __int16 v9 = 2114;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Siri Hangup enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)_didReceiveCanUseVoiceTriggerDuringCallSettingChangedInQueue:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000AC890;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSHangUpEnabledMonitor *)self enumerateObserversInQueue:v3];
}

- (void)_stopMonitoring
{
  unsigned int v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSHangUpEnabledMonitor _stopMonitoring]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s stop monitoring Siri Hangup settings in VTPreferences", (uint8_t *)&v5, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kVTPreferencesCanUseVoiceTriggerDuringPhoneCallDidChangeDarwinNotification, 0);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  BOOL v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[CSHangUpEnabledMonitor _startMonitoringWithQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s start monitoring Siri Hangup settings in VTPreferences", (uint8_t *)&v6, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000ACA5C, kVTPreferencesCanUseVoiceTriggerDuringPhoneCallDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDrop);
  self->_isEnabled = [(CSHangUpEnabledMonitor *)self _checkCanUseVoiceTriggerDuringCallEnabled];
}

- (CSHangUpEnabledMonitor)init
{
  if (+[CSUtils isDarwinOS])
  {
    unsigned int v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSHangUpEnabledMonitor;
    BOOL v4 = [(CSHangUpEnabledMonitor *)&v8 init];
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("CSHangUpEnabledMonitor queue", 0);
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
  if (qword_1002A3898 != -1) {
    dispatch_once(&qword_1002A3898, &stru_1002506E8);
  }
  v2 = (void *)qword_1002A3890;
  return v2;
}

@end