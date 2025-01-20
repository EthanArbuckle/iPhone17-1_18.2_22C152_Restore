@interface CSLanguageCodeUpdateMonitorImplDarwin
- (BOOL)isLanguageCodeCurrent:(id)a3;
- (CSLanguageCodeUpdateMonitorImplDarwin)init;
- (void)_didReceiveLanguageCodeUpdate:(id)a3;
- (void)_notifyObserver:(id)a3 withLanguageCode:(id)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSLanguageCodeUpdateMonitorImplDarwin

- (void).cxx_destruct
{
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

- (BOOL)isLanguageCodeCurrent:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NSString *)self->_currentLanguageCode isEqualToString:v4];
  if (v5)
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      v9 = "-[CSLanguageCodeUpdateMonitorImplDarwin isLanguageCodeCurrent:]";
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_INFO, "%s language code already up-to-date : %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (void)_didReceiveLanguageCodeUpdate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSLanguageCodeUpdateMonitorImplDarwin _didReceiveLanguageCodeUpdate:]";
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Siri language changed to : %{public}@", buf, 0x16u);
  }
  if (v5)
  {
    if (![(CSLanguageCodeUpdateMonitorImplDarwin *)self isLanguageCodeCurrent:v5])
    {
      objc_storeStrong((id *)&self->_currentLanguageCode, a3);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __71__CSLanguageCodeUpdateMonitorImplDarwin__didReceiveLanguageCodeUpdate___block_invoke;
      v8[3] = &unk_1E6200210;
      v8[4] = self;
      id v9 = v5;
      [(CSEventMonitor *)self enumerateObserversInQueue:v8];
    }
  }
  else
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CSLanguageCodeUpdateMonitorImplDarwin _didReceiveLanguageCodeUpdate:]";
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Ignore notifying change of language code, since it is nil", buf, 0xCu);
    }
  }
}

uint64_t __71__CSLanguageCodeUpdateMonitorImplDarwin__didReceiveLanguageCodeUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withLanguageCode:*(void *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSLanguageCodeUpdateMonitorImplDarwin _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Siri language code", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSLanguageCodeUpdateMonitorImplDarwin _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Siri language code", (uint8_t *)&v4, 0xCu);
  }
}

- (CSLanguageCodeUpdateMonitorImplDarwin)init
{
  if (+[CSUtils isDarwinOS])
  {
    v8.receiver = self;
    v8.super_class = (Class)CSLanguageCodeUpdateMonitorImplDarwin;
    int v3 = [(CSEventMonitor *)&v8 init];
    if (v3)
    {
      uint64_t v4 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
      currentLanguageCode = v3->_currentLanguageCode;
      v3->_currentLanguageCode = (NSString *)v4;
    }
    self = v3;
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end