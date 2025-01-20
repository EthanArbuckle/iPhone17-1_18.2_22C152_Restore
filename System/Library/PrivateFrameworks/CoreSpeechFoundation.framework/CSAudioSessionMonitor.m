@interface CSAudioSessionMonitor
+ (id)sharedInstance;
- (CSAudioSessionMonitor)initWithCrashMonitor:(id)a3;
- (unint64_t)getAudioSessionState;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)audioSessionEventProvidingDidSetAudioSessionActive:(BOOL)a3;
- (void)audioSessionEventProvidingWillSetAudioSessionActive:(BOOL)a3;
- (void)notifyAudioSessionStateChange:(unint64_t)a3;
- (void)setAudioSessionState:(unint64_t)a3;
@end

@implementation CSAudioSessionMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crashMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAudioSessionState:(unint64_t)a3
{
  self->_audioSessionState = a3;
}

- (void)audioSessionEventProvidingDidSetAudioSessionActive:(BOOL)a3
{
  if (!a3) {
    [(CSAudioSessionMonitor *)self notifyAudioSessionStateChange:2];
  }
}

- (void)audioSessionEventProvidingWillSetAudioSessionActive:(BOOL)a3
{
  if (a3) {
    [(CSAudioSessionMonitor *)self notifyAudioSessionStateChange:1];
  }
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
}

- (void)notifyAudioSessionStateChange:(unint64_t)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CSAudioSessionMonitor_notifyAudioSessionStateChange___block_invoke;
  block[3] = &unk_1E6201378;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CSAudioSessionMonitor_notifyAudioSessionStateChange___block_invoke_3;
  v6[3] = &unk_1E6201188;
  v6[4] = self;
  v6[5] = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v6];
}

void __55__CSAudioSessionMonitor_notifyAudioSessionStateChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 40) != v2)
  {
    *(void *)(v1 + 40) = v2;
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 136315394;
      v7 = "-[CSAudioSessionMonitor notifyAudioSessionStateChange:]_block_invoke";
      __int16 v8 = 2050;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Notifying audio session state change to %{public}lu", (uint8_t *)&v6, 0x16u);
    }
  }
}

uint64_t __55__CSAudioSessionMonitor_notifyAudioSessionStateChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withAudioSessionState:*(void *)(a1 + 40)];
}

- (unint64_t)getAudioSessionState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CSAudioSessionMonitor_getAudioSessionState__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__CSAudioSessionMonitor_getAudioSessionState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)_stopMonitoring
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSAudioSessionMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : audio session event", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[CSAudioSessionMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : audio session event", (uint8_t *)&v4, 0xCu);
  }
}

- (CSAudioSessionMonitor)initWithCrashMonitor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSAudioSessionMonitor;
  uint64_t v5 = [(CSEventMonitor *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("audioSessionMonitor queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v5->_audioSessionState = 0;
    if (v4)
    {
      uint64_t v8 = (CSAudioServerCrashMonitor *)v4;
    }
    else
    {
      uint64_t v8 = +[CSAudioServerCrashMonitor sharedInstance];
    }
    crashMonitor = v5->_crashMonitor;
    v5->_crashMonitor = v8;

    [(CSEventMonitor *)v5->_crashMonitor addObserver:v5];
  }

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_849 != -1) {
    dispatch_once(&sharedInstance_onceToken_849, &__block_literal_global_850);
  }
  uint64_t v2 = (void *)sharedInstance__sharedInstance_851;
  return v2;
}

uint64_t __39__CSAudioSessionMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_851 = [[CSAudioSessionMonitor alloc] initWithCrashMonitor:0];
  return MEMORY[0x1F41817F8]();
}

@end