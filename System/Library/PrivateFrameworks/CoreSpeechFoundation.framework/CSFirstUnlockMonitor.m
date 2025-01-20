@interface CSFirstUnlockMonitor
+ (id)sharedInstance;
- (BOOL)_checkFirstUnlocked;
- (BOOL)isFirstUnlocked;
- (CSFirstUnlockMonitor)init;
- (void)_didReceiveFirstUnlock:(BOOL)a3;
- (void)_didReceiveFirstUnlockInQueue:(BOOL)a3;
- (void)_firstUnlockNotified;
- (void)_notifyObserver:(id)a3 withUnlocked:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSFirstUnlockMonitor

- (BOOL)_checkFirstUnlocked
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = MKBDeviceUnlockedSinceBoot();
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = @"YES";
    if (!v2) {
      v4 = @"NO";
    }
    int v6 = 136315394;
    v7 = "-[CSFirstUnlockMonitor _checkFirstUnlocked]";
    __int16 v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Unlocked since boot = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v2 == 1;
}

- (BOOL)isFirstUnlocked
{
  return self->_firstUnlocked;
}

- (void)_notifyObserver:(id)a3 withUnlocked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSFirstUnlockMonitor:self didReceiveFirstUnlock:v4];
  }
}

- (void)_didReceiveFirstUnlock:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__CSFirstUnlockMonitor__didReceiveFirstUnlock___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObservers:v3];
}

uint64_t __47__CSFirstUnlockMonitor__didReceiveFirstUnlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withUnlocked:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didReceiveFirstUnlockInQueue:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__CSFirstUnlockMonitor__didReceiveFirstUnlockInQueue___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __54__CSFirstUnlockMonitor__didReceiveFirstUnlockInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withUnlocked:*(unsigned __int8 *)(a1 + 40)];
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
      id v6 = "-[CSFirstUnlockMonitor _stopMonitoring]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : First unlock", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_firstUnlockNotified
{
  BOOL v3 = [(CSFirstUnlockMonitor *)self _checkFirstUnlocked];
  self->_firstUnlocked = v3;
  [(CSFirstUnlockMonitor *)self _didReceiveFirstUnlock:v3];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __50__CSFirstUnlockMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6201110;
    handler[4] = self;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_notifyToken, v4, handler);
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSFirstUnlockMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Start monitoring : First unlock";
      goto LABEL_6;
    }
  }
  else
  {
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSFirstUnlockMonitor _startMonitoringWithQueue:]";
      id v6 = "%s Cannot start monitoring first unlock because it was already started";
LABEL_6:
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_firstUnlocked = [(CSFirstUnlockMonitor *)self _checkFirstUnlocked];
}

uint64_t __50__CSFirstUnlockMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _firstUnlockNotified];
}

- (CSFirstUnlockMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSFirstUnlockMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result)
  {
    result->_int notifyToken = -1;
    result->_firstUnlocked = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (sharedInstance_onceToken_12976 != -1) {
      dispatch_once(&sharedInstance_onceToken_12976, &__block_literal_global_12977);
    }
    id v2 = (id)sharedInstance__sharedInstance_12978;
  }
  return v2;
}

uint64_t __38__CSFirstUnlockMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_12978 = objc_alloc_init(CSFirstUnlockMonitor);
  return MEMORY[0x1F41817F8]();
}

@end