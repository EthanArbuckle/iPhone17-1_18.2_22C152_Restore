@interface CSPhraseSpotterEnabledMonitor
+ (id)sharedInstance;
- (BOOL)_checkPhraseSpotterEnabled;
- (BOOL)isEnabled;
- (CSPhraseSpotterEnabledMonitor)init;
- (void)_didReceivePhraseSpotterSettingChangedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4;
- (void)_phraseSpotterEnabledDidChange;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSPhraseSpotterEnabledMonitor

- (void)_phraseSpotterEnabledDidChange
{
  BOOL v3 = [(CSPhraseSpotterEnabledMonitor *)self _checkPhraseSpotterEnabled];
  BOOL isPhraseSpotterEnabled = self->_isPhraseSpotterEnabled;
  if (isPhraseSpotterEnabled == v3)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v6 = @"ON";
      if (!isPhraseSpotterEnabled) {
        CFStringRef v6 = @"OFF";
      }
      int v7 = 136315394;
      v8 = "-[CSPhraseSpotterEnabledMonitor _phraseSpotterEnabledDidChange]";
      __int16 v9 = 2114;
      CFStringRef v10 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s PhraseSpotter is already %{public}@, received duplicated notification!", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    self->_BOOL isPhraseSpotterEnabled = v3;
    [(CSPhraseSpotterEnabledMonitor *)self _didReceivePhraseSpotterSettingChangedInQueue:v3];
  }
}

- (BOOL)_checkPhraseSpotterEnabled
{
  v2 = +[CSFPreferences sharedPreferences];
  unsigned int v3 = [v2 phraseSpotterEnabled];

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 136315394;
    v8 = "-[CSPhraseSpotterEnabledMonitor _checkPhraseSpotterEnabled]";
    __int16 v9 = 2114;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s PhraseSpotter enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (BOOL)isEnabled
{
  return self->_isPhraseSpotterEnabled;
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSPhraseSpotterEnabledMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSPhraseSpotterEnabledMonitor:self didReceiveEnabled:v4];
  }
}

- (void)_didReceivePhraseSpotterSettingChangedInQueue:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100052AD8;
  v3[3] = &unk_1002536A8;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSPhraseSpotterEnabledMonitor *)self enumerateObserversInQueue:v3];
}

- (void)_stopMonitoring
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification", 0);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100052B90, @"kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification", 0, CFNotificationSuspensionBehaviorDrop);
  self->_BOOL isPhraseSpotterEnabled = [(CSPhraseSpotterEnabledMonitor *)self _checkPhraseSpotterEnabled];
}

- (CSPhraseSpotterEnabledMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSPhraseSpotterEnabledMonitor;
  result = [(CSPhraseSpotterEnabledMonitor *)&v3 init];
  if (result) {
    result->_BOOL isPhraseSpotterEnabled = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_1002A3748 != -1) {
    dispatch_once(&qword_1002A3748, &stru_10024F520);
  }
  v2 = (void *)qword_1002A3740;
  return v2;
}

@end