@interface CSLanguageCodeUpdateMonitorImpl
- (BOOL)isLanguageCodeCurrent:(id)a3;
- (CSLanguageCodeUpdateMonitorImpl)init;
- (void)_didReceiveLanguageCodeUpdate;
- (void)_notifyObserver:(id)a3 withLanguageCode:(id)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSLanguageCodeUpdateMonitorImpl

- (BOOL)isLanguageCodeCurrent:(id)a3
{
  id v3 = a3;
  v4 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  char v5 = [v4 isEqualToString:v3];

  return v5;
}

- (void)_notifyObserver:(id)a3 withLanguageCode:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(CSEventMonitor *)self notifyObserver:v7];
  if (objc_opt_respondsToSelector()) {
    [v7 CSLanguageCodeUpdateMonitor:self didReceiveLanguageCodeChanged:v6];
  }
}

- (void)_didReceiveLanguageCodeUpdate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSLanguageCodeUpdateMonitorImpl _didReceiveLanguageCodeUpdate]";
    __int16 v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri language changed to : %{public}@", buf, 0x16u);
  }
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__CSLanguageCodeUpdateMonitorImpl__didReceiveLanguageCodeUpdate__block_invoke;
    v6[3] = &unk_1E6200210;
    v6[4] = self;
    id v7 = v3;
    [(CSEventMonitor *)self enumerateObserversInQueue:v6];
  }
  else
  {
    char v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSLanguageCodeUpdateMonitorImpl _didReceiveLanguageCodeUpdate]";
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Ignore notifying change of language code, since it is nil", buf, 0xCu);
    }
  }
}

uint64_t __64__CSLanguageCodeUpdateMonitorImpl__didReceiveLanguageCodeUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withLanguageCode:*(void *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F4E2E8], 0);
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSLanguageCodeUpdateMonitorImpl _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Siri language code", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AFLanguageDidChangeCallback, (CFStringRef)*MEMORY[0x1E4F4E2E8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[CSLanguageCodeUpdateMonitorImpl _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Siri language code", (uint8_t *)&v6, 0xCu);
  }
}

- (CSLanguageCodeUpdateMonitorImpl)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSLanguageCodeUpdateMonitorImpl;
  result = [(CSEventMonitor *)&v3 init];
  if (result) {
    result->_notifyToken = -1;
  }
  return result;
}

@end