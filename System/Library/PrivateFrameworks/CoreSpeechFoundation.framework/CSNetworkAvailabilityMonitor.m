@interface CSNetworkAvailabilityMonitor
+ (id)sharedInstance;
- (CSNetworkAvailabilityMonitor)init;
- (void)_availabilityChanged;
- (void)_didReceivedNetworkAvailabilityChangedNotification:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withNetworkAvailability:(BOOL)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSNetworkAvailabilityMonitor

- (void)_notifyObserver:(id)a3 withNetworkAvailability:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSNetworkAvailabilityMonitor:self didReceiveNetworkAvailabilityChanged:v4];
  }
}

- (void)_didReceivedNetworkAvailabilityChangedNotification:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__CSNetworkAvailabilityMonitor__didReceivedNetworkAvailabilityChangedNotification___block_invoke;
  v3[3] = &unk_1E6201138;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __83__CSNetworkAvailabilityMonitor__didReceivedNetworkAvailabilityChangedNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withNetworkAvailability:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_availabilityChanged
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSNetworkAvailabilityMonitor _availabilityChanged]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Network availability changed", (uint8_t *)&v4, 0xCu);
  }
  [(CSNetworkAvailabilityMonitor *)self _didReceivedNetworkAvailabilityChangedNotification:isDNSAvailable()];
}

- (void)_stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    int v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[CSNetworkAvailabilityMonitor _stopMonitoring]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : network availability", (uint8_t *)&v5, 0xCu);
      int notifyToken = self->_notifyToken;
    }
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = a3;
  if (self->_notifyToken == -1)
  {
    notify_key = (const char *)nwi_state_get_notify_key();
    uint64_t v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[CSNetworkAvailabilityMonitor _startMonitoringWithQueue:]";
      __int16 v11 = 2080;
      v12 = notify_key;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s network state notify key : %s", buf, 0x16u);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__CSNetworkAvailabilityMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6201110;
    handler[4] = self;
    notify_register_dispatch(notify_key, &self->_notifyToken, v4, handler);
  }
  uint64_t v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSNetworkAvailabilityMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : network availability", buf, 0xCu);
  }
}

uint64_t __58__CSNetworkAvailabilityMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _availabilityChanged];
}

- (CSNetworkAvailabilityMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSNetworkAvailabilityMonitor;
  result = [(CSEventMonitor *)&v3 init];
  if (result) {
    result->_int notifyToken = -1;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10551 != -1) {
    dispatch_once(&sharedInstance_onceToken_10551, &__block_literal_global_10552);
  }
  v2 = (void *)sharedInstance__sharedInstance_10553;
  return v2;
}

uint64_t __46__CSNetworkAvailabilityMonitor_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance_10553 = objc_alloc_init(CSNetworkAvailabilityMonitor);
  return MEMORY[0x1F41817F8]();
}

@end