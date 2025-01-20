@interface CSVoiceTriggerEnabledMonitor
+ (id)sharedInstance;
- (BOOL)_checkVoiceTriggerEnabled;
- (BOOL)isEnabled;
- (CSVoiceTriggerEnabledMonitor)init;
- (void)_didReceiveVoiceTriggerSettingChanged:(BOOL)a3;
- (void)_didReceiveVoiceTriggerSettingChangedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSVoiceTriggerEnabledMonitor

- (BOOL)isEnabled
{
  return self->_isVoiceTriggerEnabled;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6596 != -1) {
    dispatch_once(&sharedInstance_onceToken_6596, &__block_literal_global_6597);
  }
  v2 = (void *)sharedInstance__sharedInstance_6598;
  return v2;
}

- (BOOL)_checkVoiceTriggerEnabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[CSFPreferences sharedPreferences];
  int v3 = [v2 voiceTriggerEnabled];

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v3) {
      v5 = @"YES";
    }
    int v7 = 136315394;
    v8 = "-[CSVoiceTriggerEnabledMonitor _checkVoiceTriggerEnabled]";
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSVoiceTriggerEnabledMonitor:self didReceiveEnabled:v4];
  }
}

- (void)_didReceiveVoiceTriggerSettingChanged:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__CSVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChanged___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObservers:v3];
}

uint64_t __70__CSVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveVoiceTriggerSettingChangedInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__CSVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChangedInQueue___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __77__CSVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    BOOL v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSVoiceTriggerEnabledMonitor _stopMonitoring]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitring : VoiceTrigger setting switch", (uint8_t *)&v5, 0xCu);
      int notifyToken = self->_notifyToken;
    }
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__CSVoiceTriggerEnabledMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6201110;
    handler[4] = self;
    notify_register_dispatch("com.apple.coreaudio.BorealisToggled", &self->_notifyToken, v4, handler);
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v9 = "-[CSVoiceTriggerEnabledMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Start monitring : VoiceTrigger setting switch";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v9 = "-[CSVoiceTriggerEnabledMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Cannot start monitoring VoiceTrigger setting switch because it was already started";
LABEL_6:
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_isVoiceTriggerEnabled = [(CSVoiceTriggerEnabledMonitor *)self _checkVoiceTriggerEnabled];
}

void __58__CSVoiceTriggerEnabledMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned __int8 **)(a1 + 32);
  int v3 = v2[28];
  if (v3 == [v2 _checkVoiceTriggerEnabled])
  {
    BOOL v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 28)) {
        uint64_t v7 = @"ON";
      }
      else {
        uint64_t v7 = @"OFF";
      }
      int v8 = 136315394;
      __int16 v9 = "-[CSVoiceTriggerEnabledMonitor _startMonitoringWithQueue:]_block_invoke";
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s VoiceTrigger is already %{public}@, received duplicated notification!", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(a1 + 32) _checkVoiceTriggerEnabled];
    int v5 = *(unsigned __int8 **)(a1 + 32);
    uint64_t v6 = v5[28];
    [v5 _didReceiveVoiceTriggerSettingChanged:v6];
  }
}

- (CSVoiceTriggerEnabledMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerEnabledMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_isVoiceTriggerEnabled = 0;
  }
  return result;
}

uint64_t __46__CSVoiceTriggerEnabledMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_6598 = objc_alloc_init(CSVoiceTriggerEnabledMonitor);
  return MEMORY[0x1F41817F8]();
}

@end