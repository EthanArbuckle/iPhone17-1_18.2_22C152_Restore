@interface CSSiriEnabledMonitor
+ (id)sharedInstance;
- (BOOL)fetchIsEnabled;
- (BOOL)isEnabled;
- (CSSiriEnabledMonitor)init;
- (void)_didReceiveSiriSettingChanged:(BOOL)a3;
- (void)_notifyObserver:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSiriEnabledMonitor

- (BOOL)isEnabled
{
  return self->_isSiriSettingEnabled;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (sharedInstance_onceToken_272 != -1) {
      dispatch_once(&sharedInstance_onceToken_272, &__block_literal_global_273);
    }
    id v2 = (id)sharedInstance__sharedInstance;
  }
  return v2;
}

- (BOOL)fetchIsEnabled
{
  BOOL result = AFPreferencesAssistantEnabled() != 0;
  self->_isSiriSettingEnabled = result;
  return result;
}

- (void)_notifyObserver:(id)a3
{
  id v4 = a3;
  [(CSEventMonitor *)self notifyObserver:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 CSSiriEnabledMonitor:self didReceiveEnabled:self->_isSiriSettingEnabled];
  }
}

- (void)_didReceiveSiriSettingChanged:(BOOL)a3
{
  self->_isSiriSettingEnabled = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__CSSiriEnabledMonitor__didReceiveSiriSettingChanged___block_invoke;
  v3[3] = &unk_1E6201240;
  v3[4] = self;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __54__CSSiriEnabledMonitor__didReceiveSiriSettingChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"kAFPreferencesDidChangeDarwinNotification", 0);
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSSiriEnabledMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Siri setting switch", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AssistantPrefsChangedNotification, @"kAFPreferencesDidChangeDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v5 = AFPreferencesAssistantEnabled();
  if (self->_isSiriSettingEnabled != (v5 != 0)) {
    [(CSSiriEnabledMonitor *)self _didReceiveSiriSettingChanged:v5 != 0];
  }
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isSiriSettingEnabled) {
      uint64_t v7 = @"Enabled";
    }
    else {
      uint64_t v7 = @"Disabled";
    }
    int v8 = 136315394;
    v9 = "-[CSSiriEnabledMonitor _startMonitoringWithQueue:]";
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Siri setting switch, Siri is %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (CSSiriEnabledMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSiriEnabledMonitor;
  BOOL result = [(CSEventMonitor *)&v3 init];
  if (result) {
    result->_isSiriSettingEnabled = 0;
  }
  return result;
}

uint64_t __38__CSSiriEnabledMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_alloc_init(CSSiriEnabledMonitor);
  return MEMORY[0x1F41817F8]();
}

@end