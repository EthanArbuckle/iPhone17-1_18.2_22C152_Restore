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
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSJarvisTriggerModeMonitor:self didReceiveTriggerModeChanged:a4];
  }
}

- (void)_notifyJarvisTriggerModeDidChanged
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CSJarvisTriggerModeMonitor *)self _fetchTriggerMode];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor _notifyJarvisTriggerModeDidChanged]";
    __int16 v8 = 1026;
    int v9 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Notifying jarvis trigger mode change to %{public}d", buf, 0x12u);
  }
  self->_triggerMode = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CSJarvisTriggerModeMonitor__notifyJarvisTriggerModeDidChanged__block_invoke;
  v5[3] = &unk_1E6201188;
  v5[4] = self;
  v5[5] = v3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v5];
}

uint64_t __64__CSJarvisTriggerModeMonitor__notifyJarvisTriggerModeDidChanged__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withJarvisTriggerMode:*(void *)(a1 + 40)];
}

- (int64_t)_fetchTriggerMode
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[CSFPreferences sharedPreferences];
  int64_t v3 = [v2 getJarvisTriggerMode];

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor _fetchTriggerMode]";
    __int16 v8 = 1026;
    int v9 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  return v3;
}

- (int64_t)getTriggerMode
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int64_t triggerMode = self->_triggerMode;
    int v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor getTriggerMode]";
    __int16 v8 = 1026;
    int v9 = triggerMode;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Queried Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  return self->_triggerMode;
}

- (void)setTriggerMode:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor setTriggerMode:]";
    __int16 v8 = 1026;
    int v9 = a3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Setting Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  v5 = +[CSFPreferences sharedPreferences];
  [v5 setJarvisTriggerMode:a3];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"kCSPreferencesJarvisTriggerModeDidChangeDarwinNotification", 0);
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSJarvisTriggerModeMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : jarvis trigger mode switch", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_jarvisTriggerModeDidChange, @"kCSPreferencesJarvisTriggerModeDidChangeDarwinNotification", 0, CFNotificationSuspensionBehaviorDrop);
  int64_t v5 = [(CSJarvisTriggerModeMonitor *)self _fetchTriggerMode];
  int v6 = v5;
  self->_int64_t triggerMode = v5;
  uint64_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[CSJarvisTriggerModeMonitor _startMonitoringWithQueue:]";
    __int16 v10 = 1026;
    int v11 = v6;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : jarvis trigger mode switch, trigger mode is set to %{public}d", (uint8_t *)&v8, 0x12u);
  }
}

- (CSJarvisTriggerModeMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSJarvisTriggerModeMonitor;
  result = [(CSEventMonitor *)&v3 init];
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
    return off_1E6200FB8[a3 + 1];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12486 != -1) {
    dispatch_once(&sharedInstance_onceToken_12486, &__block_literal_global_12487);
  }
  v2 = (void *)sharedInstance__sharedInstance_12488;
  return v2;
}

uint64_t __44__CSJarvisTriggerModeMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_12488 = objc_alloc_init(CSJarvisTriggerModeMonitor);
  return MEMORY[0x1F41817F8]();
}

@end