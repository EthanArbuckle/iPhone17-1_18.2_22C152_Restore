@interface CSAlwaysOnProcessorStateMonitor
+ (id)sharedInstance;
- (BOOL)isEnabled;
- (CSAlwaysOnProcessorStateMonitor)init;
- (void)_didReceiveAOPListeningStateChange:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSAlwaysOnProcessorStateMonitor

- (BOOL)isEnabled
{
  return self->_isListeningEnabled;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11483 != -1) {
    dispatch_once(&sharedInstance_onceToken_11483, &__block_literal_global_11484);
  }
  v2 = (void *)sharedInstance_sharedInstance_11485;
  return v2;
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSAlwaysOnProcessorStateMonitor:self didReceiveStateChange:v4];
  }
}

- (void)_didReceiveAOPListeningStateChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSAlwaysOnProcessorStateMonitor _didReceiveAOPListeningStateChange:]";
    __int16 v10 = 1026;
    BOOL v11 = v3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Received AOP Listening state change notification : %{public}d", buf, 0x12u);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__CSAlwaysOnProcessorStateMonitor__didReceiveAOPListeningStateChange___block_invoke;
  v6[3] = &unk_1E6201138;
  v6[4] = self;
  BOOL v7 = v3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v6];
}

uint64_t __70__CSAlwaysOnProcessorStateMonitor__didReceiveAOPListeningStateChange___block_invoke(uint64_t a1, uint64_t a2)
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
      id v6 = "-[CSAlwaysOnProcessorStateMonitor _stopMonitoring]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AOP Listening state", (uint8_t *)&v5, 0xCu);
      int notifyToken = self->_notifyToken;
    }
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  int v5 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke;
  v7[3] = &unk_1E6200D60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 listeningEnabledCompletionBlock:v7];
}

void __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = CSLogContextFacilityCoreSpeech;
  if (v5 && os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    BOOL v11 = v6;
    uint64_t v12 = [v5 localizedDescription];
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSAlwaysOnProcessorStateMonitor _startMonitoringWithQueue:]_block_invoke";
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s Failed to fetch listeningEnabled : %{public}@", buf, 0x16u);

    id v6 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSAlwaysOnProcessorStateMonitor _startMonitoringWithQueue:]_block_invoke";
    __int16 v18 = 1026;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s listening property in AOP : %{public}d", buf, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = a2;
  [*(id *)(a1 + 32) _didReceiveAOPListeningStateChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 24)];
  uint64_t v7 = (int *)(*(void *)(a1 + 32) + 28);
  if (*v7 == -1)
  {
    id v8 = *(NSObject **)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke_7;
    v13[3] = &unk_1E6200D88;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    uint64_t v15 = v10;
    notify_register_dispatch("com.apple.audio.AOP.enable", v7, v8, v13);
  }
}

void __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke_7(uint64_t a1)
{
  v2 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke_2;
  v5[3] = &unk_1E6200D60;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 listeningEnabledCompletionBlock:v5];
}

void __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = CSLogContextFacilityCoreSpeech;
  if (*(void *)(a1 + 32) && os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = v6;
    id v8 = [v5 localizedDescription];
    int v9 = 136315394;
    uint64_t v10 = "-[CSAlwaysOnProcessorStateMonitor _startMonitoringWithQueue:]_block_invoke_2";
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch listeningEnabledOnNotification : %{public}@", (uint8_t *)&v9, 0x16u);

    id v6 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[CSAlwaysOnProcessorStateMonitor _startMonitoringWithQueue:]_block_invoke";
    __int16 v11 = 1026;
    LODWORD(v12) = a2;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s listening property in AOP : %{public}d", (uint8_t *)&v9, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 24) = a2;
  [*(id *)(a1 + 40) _didReceiveAOPListeningStateChange:*(unsigned __int8 *)(*(void *)(a1 + 40) + 24)];
}

- (CSAlwaysOnProcessorStateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSAlwaysOnProcessorStateMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result)
  {
    result->_isListeningEnabled = 0;
    result->_int notifyToken = -1;
  }
  return result;
}

uint64_t __49__CSAlwaysOnProcessorStateMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_11485 = objc_alloc_init(CSAlwaysOnProcessorStateMonitor);
  return MEMORY[0x1F41817F8]();
}

@end