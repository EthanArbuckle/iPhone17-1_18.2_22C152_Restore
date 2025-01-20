@interface CSSpringboardStartMonitor
+ (id)sharedInstance;
- (BOOL)_checkSpringBoardStarted;
- (BOOL)isSpringboardStarted;
- (CSSpringboardStartMonitor)init;
- (void)_didReceiveSpringboardStarted:(BOOL)a3;
- (void)_didReceiveSpringboardStartedInQueue:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withStarted:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSSpringboardStartMonitor

- (BOOL)_checkSpringBoardStarted
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int out_token = -1;
    notify_register_check("com.apple.springboard.finishedstartup", &out_token);
    if (out_token == -1)
    {
      BOOL v2 = 0;
    }
    else
    {
      *(void *)state64 = 0;
      notify_get_state(out_token, (uint64_t *)state64);
      notify_cancel(out_token);
      BOOL v2 = *(void *)state64 != 0;
    }
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v4 = @"NO";
      if (v2) {
        v4 = @"YES";
      }
      *(_DWORD *)state64 = 136315394;
      *(void *)&state64[4] = "-[CSSpringboardStartMonitor _checkSpringBoardStarted]";
      __int16 v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s SpringBoard started = %{public}@", state64, 0x16u);
    }
  }
  return v2;
}

- (BOOL)isSpringboardStarted
{
  return self->_isSpringBoardStarted;
}

- (void)_notifyObserver:(id)a3 withStarted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSSpringboardStartMonitor:self didReceiveStarted:v4];
  }
}

- (void)_didReceiveSpringboardStarted:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__CSSpringboardStartMonitor__didReceiveSpringboardStarted___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObservers:v3];
}

uint64_t __59__CSSpringboardStartMonitor__didReceiveSpringboardStarted___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withStarted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveSpringboardStartedInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__CSSpringboardStartMonitor__didReceiveSpringboardStartedInQueue___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __66__CSSpringboardStartMonitor__didReceiveSpringboardStartedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withStarted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    BOOL v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSSpringboardStartMonitor _stopMonitoring]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Springboard start", (uint8_t *)&v5, 0xCu);
    }
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
    handler[2] = __55__CSSpringboardStartMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6201110;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.finishedstartup", &self->_notifyToken, v4, handler);
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSpringboardStartMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Start monitoring : Springboard start";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSpringboardStartMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Cannot start monitoring Springboard start because it was already started";
LABEL_6:
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_isSpringBoardStarted = [(CSSpringboardStartMonitor *)self _checkSpringBoardStarted];
}

uint64_t __55__CSSpringboardStartMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = [*(id *)(a1 + 32) _checkSpringBoardStarted];
  BOOL v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[28];
  return [v2 _didReceiveSpringboardStarted:v3];
}

- (CSSpringboardStartMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSSpringboardStartMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_isSpringBoardStarted = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12542 != -1) {
    dispatch_once(&sharedInstance_onceToken_12542, &__block_literal_global_12543);
  }
  BOOL v2 = (void *)sharedInstance__sharedInstance_12544;
  return v2;
}

uint64_t __43__CSSpringboardStartMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_12544 = objc_alloc_init(CSSpringboardStartMonitor);
  return MEMORY[0x1F41817F8]();
}

@end