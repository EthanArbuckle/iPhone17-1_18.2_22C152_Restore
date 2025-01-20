@interface CSScreenLockMonitor
+ (id)sharedInstance;
- (BOOL)_queryIsScreenLocked;
- (BOOL)isScreenLocked;
- (CSScreenLockMonitor)init;
- (void)_notifyObserver:(id)a3 isScreenLocked:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)screenLockStateChanged;
@end

@implementation CSScreenLockMonitor

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)_notifyObserver:(id)a3 isScreenLocked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSScreenLockMonitor:self didReceiveScreenLockStateChanged:v4];
  }
}

- (BOOL)_queryIsScreenLocked
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"MKBUserSessionID";
  v2 = [NSNumber numberWithUnsignedInt:getuid()];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  LOBYTE(v2) = MKBGetDeviceLockState() - 1 < 2;
  return (char)v2;
}

- (void)screenLockStateChanged
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CSScreenLockMonitor *)self _queryIsScreenLocked];
  self->_isScreenLocked = v3;
  BOOL v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"Unlocked";
    if (v3) {
      v5 = @"Locked";
    }
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSScreenLockMonitor screenLockStateChanged]";
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Screen Lock Status Changed : %{public}@", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __45__CSScreenLockMonitor_screenLockStateChanged__block_invoke;
  v6[3] = &unk_1E6201240;
  v6[4] = self;
  [(CSEventMonitor *)self enumerateObserversInQueue:v6];
}

uint64_t __45__CSScreenLockMonitor_screenLockStateChanged__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 isScreenLocked:*(unsigned __int8 *)(*(void *)(a1 + 32) + 24)];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.keybagd.lock_status", 0);
  BOOL v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSScreenLockMonitor _stopMonitoring]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : screen lock / unlock state", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CSScreenLockMonitor__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async((dispatch_queue_t)a3, block);
}

uint64_t __49__CSScreenLockMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)HandleDeviceLockStateChanged, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSScreenLockMonitor _startMonitoringWithQueue:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : screen lock / unlock state", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = [*(id *)(a1 + 32) _queryIsScreenLocked];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CSScreenLockMonitor;
  [(CSEventMonitor *)&v2 dealloc];
}

- (CSScreenLockMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSScreenLockMonitor;
  uint64_t result = [(CSEventMonitor *)&v3 init];
  if (result) {
    result->_isScreenLocked = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9381 != -1) {
    dispatch_once(&sharedInstance_onceToken_9381, &__block_literal_global_9382);
  }
  objc_super v2 = (void *)sharedInstance__sharedInstance_9383;
  return v2;
}

uint64_t __37__CSScreenLockMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_9383 = objc_alloc_init(CSScreenLockMonitor);
  return MEMORY[0x1F41817F8]();
}

@end