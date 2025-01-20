@interface CSBuiltinSpeakerStateMonitor
+ (id)sharedInstance;
- (BOOL)_getIsSpeakerMutedDefaultVal;
- (BOOL)isBuiltinSpeakerMuted;
- (BOOL)isSpeakerMuted;
- (CSBuiltinSpeakerStateMonitor)init;
- (OS_dispatch_queue)queue;
- (unint64_t)builtInSpeakerState;
- (unint64_t)currentBuiltinSpeakerState;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_didReceiveBuiltinSpeakerStateChangeNotification:(unint64_t)a3;
- (void)_didReceiveSpeakerMuteStateChangeNotification:(BOOL)a3;
- (void)_fetchSpeakerStateActiveInfo;
- (void)_fetchSpeakerStateMutedInfo;
- (void)_notifyObserver:(id)a3 withBuiltinSpeakerState:(unint64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setBuiltInSpeakerState:(unint64_t)a3;
- (void)setIsSpeakerMuted:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSBuiltinSpeakerStateMonitor

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  v5 = [WeakRetained queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2;
  v7[3] = &unk_1E61FFF18;
  id v8 = v3;
  id v6 = v3;
  objc_copyWeak(&v9, a1);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_didReceiveBuiltinSpeakerStateChangeNotification:(unint64_t)a3
{
  self->_builtInSpeakerState = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__CSBuiltinSpeakerStateMonitor__didReceiveBuiltinSpeakerStateChangeNotification___block_invoke;
  v3[3] = &unk_1E6201188;
  v3[4] = self;
  v3[5] = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __81__CSBuiltinSpeakerStateMonitor__didReceiveBuiltinSpeakerStateChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withBuiltinSpeakerState:*(void *)(a1 + 40)];
}

- (void)_notifyObserver:(id)a3 withBuiltinSpeakerState:(unint64_t)a4
{
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSBuiltinSpeakerStateMonitor:self didReceiveBuiltinSpeakerStateChange:a4];
  }
}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 136315394;
    v10 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke_2";
    __int16 v11 = 2114;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Speaker state changed : %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v4 = *(void **)(a1 + 32);
  if (v4
    && ([v4 objectForKeyedSubscript:@"active"],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"active"];
    objc_msgSend(WeakRetained, "_didReceiveBuiltinSpeakerStateChangeNotification:", objc_msgSend(v7, "unsignedIntegerValue"));
  }
  else
  {
    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get speaker state from AVVC, default to inactive", (uint8_t *)&v9, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _didReceiveBuiltinSpeakerStateChangeNotification:0];
  }
}

- (void).cxx_destruct
{
}

- (void)setIsSpeakerMuted:(BOOL)a3
{
  self->_isSpeakerMuted = a3;
}

- (BOOL)isSpeakerMuted
{
  return self->_isSpeakerMuted;
}

- (unint64_t)builtInSpeakerState
{
  return self->_builtInSpeakerState;
}

- (void)setQueue:(id)a3
{
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v3 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  [v3 enableSpeakerStateListening:1 completionBlock:&__block_literal_global_49];
}

void __81__CSBuiltinSpeakerStateMonitor_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = [v2 localizedDescription];
      int v6 = 136315394;
      v7 = "-[CSBuiltinSpeakerStateMonitor CSAudioServerCrashMonitorDidReceiveServerRestart:]_block_invoke";
      __int16 v8 = 2114;
      int v9 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Failed to enable speakerStateListening: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_didReceiveSpeakerMuteStateChangeNotification:(BOOL)a3
{
  self->_isSpeakerMuted = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__CSBuiltinSpeakerStateMonitor__didReceiveSpeakerMuteStateChangeNotification___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __78__CSBuiltinSpeakerStateMonitor__didReceiveSpeakerMuteStateChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 isSpeakerMuted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setBuiltInSpeakerState:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CSBuiltinSpeakerStateMonitor_setBuiltInSpeakerState___block_invoke;
  v4[3] = &unk_1E6201378;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __55__CSBuiltinSpeakerStateMonitor_setBuiltInSpeakerState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveBuiltinSpeakerStateChangeNotification:*(void *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  [v2 setSpeakerStateChangedBlock:0];
  [v2 setSpeakerMuteStateChangedBlock:0];
  [v2 enableSpeakerStateListening:0 completionBlock:&__block_literal_global_44];
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSBuiltinSpeakerStateMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Speaker state from AVVC", (uint8_t *)&v4, 0xCu);
  }
}

void __47__CSBuiltinSpeakerStateMonitor__stopMonitoring__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v4 = v3;
      v5 = [v2 localizedDescription];
      int v6 = 136315394;
      v7 = "-[CSBuiltinSpeakerStateMonitor _stopMonitoring]_block_invoke";
      __int16 v8 = 2114;
      int v9 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Failed to disable speakerStateListening: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke;
  v10[3] = &unk_1E61FFC78;
  objc_copyWeak(&v11, &location);
  [v5 setSpeakerStateChangedBlock:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_35;
  v8[3] = &unk_1E61FFCC8;
  objc_copyWeak(&v9, &location);
  [v5 setSpeakerMuteStateChangedBlock:v8];
  [v5 enableSpeakerStateListening:1 completionBlock:&__block_literal_global_41];
  int v6 = +[CSAudioServerCrashMonitor sharedInstance];
  [v6 addObserver:self];

  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Speaker state from AVVC", buf, 0xCu);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_35(uint64_t a1, char a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2_36;
  v6[3] = &unk_1E61FFCA0;
  char v8 = a2;
  objc_copyWeak(&v7, v3);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      v5 = [v2 localizedDescription];
      int v6 = 136315394;
      id v7 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Failed to enable speakerStateListening: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2_36(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = @"muted";
    if (!*(unsigned char *)(a1 + 40)) {
      id v3 = @"not muted";
    }
    int v5 = 136315394;
    int v6 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke_2";
    __int16 v7 = 2114;
    __int16 v8 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Speaker mute state changed: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didReceiveSpeakerMuteStateChangeNotification:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isBuiltinSpeakerMuted
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CSBuiltinSpeakerStateMonitor_isBuiltinSpeakerMuted__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__CSBuiltinSpeakerStateMonitor_isBuiltinSpeakerMuted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (unint64_t)currentBuiltinSpeakerState
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CSBuiltinSpeakerStateMonitor_currentBuiltinSpeakerState__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__CSBuiltinSpeakerStateMonitor_currentBuiltinSpeakerState__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40) != 0;
  return result;
}

- (void)_fetchSpeakerStateActiveInfo
{
  unint64_t v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke;
  v9[3] = &unk_1E6200D60;
  v9[4] = self;
  int v5 = v3;
  uint64_t v10 = v5;
  [v4 speakerStateActiveCompletionBlock:v9];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v5, v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_29;
    block[3] = &unk_1E6201288;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  __int16 v7 = *(NSObject **)(v6 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_2;
  block[3] = &unk_1E62006B0;
  id v10 = v5;
  uint64_t v11 = v6;
  char v12 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_29(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke";
    _os_log_error_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_ERROR, "%s Timed-out for fetching speaker state active info, setting speakerStateActive = NO", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _didReceiveBuiltinSpeakerStateChangeNotification:0];
}

uint64_t __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v8 = v3;
      char v9 = [v2 localizedDescription];
      int v10 = 136315394;
      uint64_t v11 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke_2";
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fetch builtIn speaker active state, error : %{public}@", (uint8_t *)&v10, 0x16u);
    }
    int v4 = *(void **)(a1 + 40);
    uint64_t v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = &stru_1F13A10B0;
      if (!*(unsigned char *)(a1 + 48)) {
        uint64_t v6 = @"in";
      }
      int v10 = 136315394;
      uint64_t v11 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Queried built-in speaker state as %{public}@active", (uint8_t *)&v10, 0x16u);
    }
    int v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  }
  return [v4 _didReceiveBuiltinSpeakerStateChangeNotification:v5];
}

- (void)_fetchSpeakerStateMutedInfo
{
  unint64_t v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  BOOL v4 = [(CSBuiltinSpeakerStateMonitor *)self _getIsSpeakerMutedDefaultVal];
  uint64_t v5 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke;
  v11[3] = &unk_1E61FFC50;
  v11[4] = self;
  BOOL v13 = v4;
  uint64_t v6 = v3;
  __int16 v12 = v6;
  [v5 speakerStateMutedCompletionBlock:v11];

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v6, v7))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke_15;
    block[3] = &unk_1E61FFE00;
    BOOL v10 = v4;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  dispatch_time_t v7 = *(NSObject **)(v6 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke_2;
  block[3] = &unk_1E61FFC28;
  id v10 = v5;
  uint64_t v11 = v6;
  char v12 = *(unsigned char *)(a1 + 48);
  char v13 = a2;
  id v8 = v5;
  dispatch_async(v7, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke_15(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    BOOL v4 = @"YES";
    if (!*(unsigned char *)(a1 + 40)) {
      BOOL v4 = @"NO";
    }
    int v5 = 136315394;
    uint64_t v6 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateMutedInfo]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v4;
    _os_log_error_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_ERROR, "%s Timed-out for fetching speaker state muted info, setting isMuted = %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(a1 + 32) _didReceiveSpeakerMuteStateChangeNotification:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = v3;
      id v8 = [v2 localizedDescription];
      int v9 = 136315394;
      id v10 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateMutedInfo]_block_invoke_2";
      __int16 v11 = 2114;
      char v12 = v8;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch speaker state muted info, error : %{public}@", (uint8_t *)&v9, 0x16u);
    }
    BOOL v4 = (unsigned __int8 *)(a1 + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = @"muted";
      if (!*(unsigned char *)(a1 + 49)) {
        int v5 = @"not muted";
      }
      int v9 = 136315394;
      id v10 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateMutedInfo]_block_invoke";
      __int16 v11 = 2114;
      char v12 = v5;
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Queried built-in speaker mute state as %{public}@", (uint8_t *)&v9, 0x16u);
    }
    BOOL v4 = (unsigned __int8 *)(a1 + 49);
  }
  return [*(id *)(a1 + 40) _didReceiveSpeakerMuteStateChangeNotification:*v4];
}

- (BOOL)_getIsSpeakerMutedDefaultVal
{
  return 1;
}

- (CSBuiltinSpeakerStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSBuiltinSpeakerStateMonitor;
  id v2 = [(CSEventMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSBuiltInSpeakerStateMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_builtInSpeakerState = 0;
    v2->_isSpeakerMuted = [(CSBuiltinSpeakerStateMonitor *)v2 _getIsSpeakerMutedDefaultVal];
    [(CSBuiltinSpeakerStateMonitor *)v2 _fetchSpeakerStateMutedInfo];
    [(CSBuiltinSpeakerStateMonitor *)v2 _fetchSpeakerStateActiveInfo];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6917 != -1) {
    dispatch_once(&sharedInstance_onceToken_6917, &__block_literal_global_6918);
  }
  id v2 = (void *)sharedInstance__sharedInstance_6919;
  return v2;
}

uint64_t __46__CSBuiltinSpeakerStateMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_6919 = objc_alloc_init(CSBuiltinSpeakerStateMonitor);
  return MEMORY[0x1F41817F8]();
}

@end