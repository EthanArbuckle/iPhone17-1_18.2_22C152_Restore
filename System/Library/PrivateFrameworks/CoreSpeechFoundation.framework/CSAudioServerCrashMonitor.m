@interface CSAudioServerCrashMonitor
+ (CSAudioServerCrashMonitor)sharedInstance;
- (CSAudioServerCrashMonitor)init;
- (unint64_t)serverState;
- (void)_didReceiveMediaserverNotification:(unint64_t)a3;
- (void)_mediaserverdDidRestart;
- (void)_notifyObserver:(id)a3 withMediaserverState:(unint64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)setServerState:(unint64_t)a3;
@end

@implementation CSAudioServerCrashMonitor

- (void)setServerState:(unint64_t)a3
{
  self->_serverState = a3;
}

- (unint64_t)serverState
{
  return self->_serverState;
}

- (void)_notifyObserver:(id)a3 withMediaserverState:(unint64_t)a4
{
  id v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:");
  if (a4 == 2)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 CSAudioServerCrashMonitorDidReceiveServerRestart:self];
    }
  }
  else if (a4 == 1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v6 CSAudioServerCrashMonitorDidReceiveServerCrash:self];
  }
  MEMORY[0x1F4181820]();
}

- (void)_didReceiveMediaserverNotification:(unint64_t)a3
{
  self->_serverState = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__CSAudioServerCrashMonitor__didReceiveMediaserverNotification___block_invoke;
  v3[3] = &unk_1E6201188;
  v3[4] = self;
  v3[5] = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __64__CSAudioServerCrashMonitor__didReceiveMediaserverNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withMediaserverState:*(void *)(a1 + 40)];
}

- (void)_mediaserverdDidRestart
{
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CSAudioServerCrashMonitor__startMonitoringWithQueue___block_invoke;
  v9[3] = &unk_1E6201160;
  objc_copyWeak(&v10, &location);
  [v5 setServerCrashedBlock:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CSAudioServerCrashMonitor__startMonitoringWithQueue___block_invoke_6;
  v7[3] = &unk_1E6201160;
  objc_copyWeak(&v8, &location);
  [v5 setServerResetBlock:v7];
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSAudioServerCrashMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : audiomxd crash / recover event", buf, 0xCu);
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __55__CSAudioServerCrashMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSAudioServerCrashMonitor _startMonitoringWithQueue:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Received audiomxd or bridgeaudiod crashes event", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didReceiveMediaserverNotification:1];
}

void __55__CSAudioServerCrashMonitor__startMonitoringWithQueue___block_invoke_6(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSAudioServerCrashMonitor _startMonitoringWithQueue:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Received audiomxd or bridgeaudiod reset event", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didReceiveMediaserverNotification:2];
}

- (CSAudioServerCrashMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSAudioServerCrashMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result) {
    result->_serverState = 0;
  }
  return result;
}

+ (CSAudioServerCrashMonitor)sharedInstance
{
  if (sharedInstance_onceToken_13050 != -1) {
    dispatch_once(&sharedInstance_onceToken_13050, &__block_literal_global_13051);
  }
  v2 = (void *)sharedInstance__sharedInstance_13052;
  return (CSAudioServerCrashMonitor *)v2;
}

uint64_t __43__CSAudioServerCrashMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_13052 = objc_alloc_init(CSAudioServerCrashMonitor);
  return MEMORY[0x1F41817F8]();
}

@end