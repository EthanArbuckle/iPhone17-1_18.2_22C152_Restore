@interface GEOSystemMonitor
+ (GEOSystemMonitor)sharedInstance;
- (BOOL)isBackgroundAppRefreshEnabledForBundleIdentifier:(id)a3 isDisabledGlobally:(BOOL *)a4;
- (BOOL)isPowerAdapterConnected;
- (GEOSystemMonitor)init;
- (uint64_t)_disableBatteryPercentageNotifications;
- (uint64_t)_disablePowerAdapterNotifications;
- (uint64_t)_updateBatteryPercentage;
- (unint64_t)batteryLevel;
- (void)_disablePowerNotifications;
- (void)_enableBatteryPercentageNotifications;
- (void)_enablePowerAdapterNotifications;
- (void)_updatePowerAdapterState;
- (void)addBatteryLevelObserver:(id)a3 onlyWhenCharging:(BOOL)a4 queue:(id)a5;
- (void)addPowerAdapterObserver:(id)a3 queue:(id)a4;
- (void)addSystemSleepObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)removeBatteryLevelObserver:(id)a3;
- (void)removePowerAdapterObserver:(id)a3;
- (void)removeSystemSleepObserver:(id)a3;
@end

@implementation GEOSystemMonitor

+ (GEOSystemMonitor)sharedInstance
{
  if (_MergedGlobals_341 != -1) {
    dispatch_once(&_MergedGlobals_341, &__block_literal_global_208);
  }
  v2 = (void *)qword_1EB2A0808;

  return (GEOSystemMonitor *)v2;
}

void __34__GEOSystemMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEOSystemMonitor);
  v1 = (void *)qword_1EB2A0808;
  qword_1EB2A0808 = (uint64_t)v0;
}

- (GEOSystemMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)GEOSystemMonitor;
  v2 = [(GEOSystemMonitor *)&v9 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    uint64_t v5 = geo_dispatch_queue_create();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    *(void *)&v2->_powerAdapterNotifyToken = -1;
    v7 = v2;
  }

  return v2;
}

- (BOOL)isBackgroundAppRefreshEnabledForBundleIdentifier:(id)a3 isDisabledGlobally:(BOOL *)a4
{
  id v5 = a3;
  if (objc_opt_class()
    && ([MEMORY[0x1E4F74228] sharedConnection],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isAutomaticAppUpdatesAllowed],
        v6,
        (v7 & 1) != 0))
  {
    if (a4) {
      *a4 = 0;
    }
    v8 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [v8 objectForKeyedSubscript:v5];
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        char v10 = [v9 BOOLValue];
      }
      else {
        char v10 = 1;
      }
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __27__GEOSystemMonitor_dealloc__block_invoke;
  char v7 = &unk_1E53D79D8;
  v8 = self;
  geo_isolate_sync();
  v3.receiver = self;
  v3.super_class = (Class)GEOSystemMonitor;
  [(GEOSystemMonitor *)&v3 dealloc];
}

uint64_t __27__GEOSystemMonitor_dealloc__block_invoke(uint64_t a1)
{
  -[GEOSystemMonitor _disablePowerNotifications](*(void *)(a1 + 32));
  -[GEOSystemMonitor _disableBatteryPercentageNotifications](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  return -[GEOSystemMonitor _disablePowerAdapterNotifications](v2);
}

- (void)_disablePowerNotifications
{
  if (a1)
  {
    geo_assert_isolated();
    if (_rootPort)
    {
      uint64_t v2 = GEOGetSystemMonitorLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)objc_super v3 = 0;
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Unregistering for IOKit power notifications", v3, 2u);
      }

      IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 32), 0);
      IODeregisterForSystemPower((io_object_t *)(a1 + 40));
      IOServiceClose(_rootPort);
      IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 32));
      _rootPort = 0;
    }
  }
}

- (uint64_t)_disableBatteryPercentageNotifications
{
  if (result)
  {
    uint64_t v1 = result;
    result = geo_assert_isolated();
    if (*(_DWORD *)(v1 + 76) != -1)
    {
      uint64_t v2 = GEOGetSystemMonitorLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)objc_super v3 = 0;
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Unregistering for IOKit battery percentage notifications", v3, 2u);
      }

      result = notify_cancel(*(_DWORD *)(v1 + 76));
      *(_DWORD *)(v1 + 76) = -1;
      *(void *)(v1 + 88) = 0;
    }
  }
  return result;
}

- (uint64_t)_disablePowerAdapterNotifications
{
  if (result)
  {
    uint64_t v1 = result;
    result = geo_assert_isolated();
    if (*(_DWORD *)(v1 + 72) != -1)
    {
      uint64_t v2 = GEOGetSystemMonitorLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)objc_super v3 = 0;
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Unregistering for IOKit power adapter notifications", v3, 2u);
      }

      result = notify_cancel(*(_DWORD *)(v1 + 72));
      *(_DWORD *)(v1 + 72) = -1;
      *(unsigned char *)(v1 + 80) = 0;
    }
  }
  return result;
}

void __36__GEOSystemMonitor__systemCanSleep___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) hasObservers];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = _rootPort == 0;
  }
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    -[GEOSystemMonitor _disablePowerNotifications](v3);
  }
}

void __36__GEOSystemMonitor__systemCanSleep___block_invoke_11(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(NSObject **)(a1 + 32);
    id v4 = a2;
    dispatch_group_enter(v3);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__GEOSystemMonitor__systemCanSleep___block_invoke_2;
    v7[3] = &unk_1E53DC3A0;
    long long v6 = *(_OWORD *)(a1 + 32);
    id v5 = (id)v6;
    long long v8 = v6;
    [v4 systemCanSleep:v7];
  }
}

void __36__GEOSystemMonitor__systemCanSleep___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __36__GEOSystemMonitor__systemCanSleep___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __37__GEOSystemMonitor__systemWillSleep___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) hasObservers];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = _rootPort == 0;
  }
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    -[GEOSystemMonitor _disablePowerNotifications](v3);
  }
}

void __37__GEOSystemMonitor__systemWillSleep___block_invoke_14(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(NSObject **)(a1 + 32);
    id v4 = a2;
    dispatch_group_enter(v3);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__GEOSystemMonitor__systemWillSleep___block_invoke_2;
    v5[3] = &unk_1E53D79D8;
    id v6 = *(id *)(a1 + 32);
    [v4 systemWillSleep:v5];
  }
}

void __37__GEOSystemMonitor__systemWillSleep___block_invoke_2(uint64_t a1)
{
}

void __34__GEOSystemMonitor__systemDidWake__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) hasObservers];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = _rootPort == 0;
  }
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    -[GEOSystemMonitor _disablePowerNotifications](v3);
  }
}

- (void)addSystemSleepObserver:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  geo_isolate_sync();
}

void __49__GEOSystemMonitor_addSystemSleepObserver_queue___block_invoke(void *a1)
{
  BOOL v2 = *(void **)(a1[4] + 24);
  if (!v2)
  {
    uint64_t v3 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED7AD908 queue:0];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    BOOL v2 = *(void **)(a1[4] + 24);
  }
  char v6 = [v2 hasObservers];
  [*(id *)(a1[4] + 24) registerObserver:a1[5] queue:a1[6]];
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = a1[4];
    if (v7)
    {
      geo_assert_isolated();
      if (!_rootPort)
      {
        id v8 = GEOGetSystemMonitorLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Registering for IOKit power notifications", buf, 2u);
        }

        _rootPort = IORegisterForSystemPower(0, (IONotificationPortRef *)(v7 + 32), (IOServiceInterestCallback)_GEOSystemMonitorPowerNotification, (io_object_t *)(v7 + 40));
        if (_rootPort)
        {
          IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(v7 + 32), *(dispatch_queue_t *)(v7 + 8));
        }
        else
        {
          objc_super v9 = GEOGetSystemMonitorLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)char v10 = 0;
            _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, "IORegisterForSystemPower failed", v10, 2u);
          }
        }
      }
    }
  }
}

- (void)removeSystemSleepObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

void __46__GEOSystemMonitor_removeSystemSleepObserver___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) hasObservers])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) unregisterObserver:*(void *)(a1 + 40)];
    if (([*(id *)(*(void *)(a1 + 32) + 24) hasObservers] & 1) == 0)
    {
      uint64_t v2 = *(void *)(a1 + 32);
      -[GEOSystemMonitor _disablePowerNotifications](v2);
    }
  }
}

- (void)addPowerAdapterObserver:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  geo_isolate_sync();
}

void __50__GEOSystemMonitor_addPowerAdapterObserver_queue___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 48))
  {
    id v3 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED7619E0 queue:0];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v2 = a1[4];
  }
  char v6 = [*(id *)(v2 + 56) hasObservers];
  id v7 = *(void **)(a1[4] + 48);
  if (v6)
  {
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[6];
    [v7 registerObserver:v8 queue:v9];
  }
  else
  {
    char v10 = [v7 hasObservers];
    [*(id *)(a1[4] + 48) registerObserver:a1[5] queue:a1[6]];
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = a1[4];
      -[GEOSystemMonitor _enablePowerAdapterNotifications](v11);
    }
  }
}

- (void)_enablePowerAdapterNotifications
{
  if (a1)
  {
    geo_assert_isolated();
    if (*(_DWORD *)(a1 + 72) == -1)
    {
      uint64_t v2 = GEOGetSystemMonitorLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Registering for IOKit power adapter notifications", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, (id)a1);
      id v3 = *(NSObject **)(a1 + 8);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __52__GEOSystemMonitor__enablePowerAdapterNotifications__block_invoke;
      handler[3] = &unk_1E53DD2C0;
      objc_copyWeak(&v7, buf);
      if (notify_register_dispatch("com.apple.system.powermanagement.poweradapter", (int *)(a1 + 72), v3, handler))
      {
        uint64_t v4 = GEOGetSystemMonitorLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v5 = 0;
          _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_FAULT, "Registering for power adapter changes failed", v5, 2u);
        }
      }
      else
      {
        -[GEOSystemMonitor _updatePowerAdapterState](a1);
      }
      objc_destroyWeak(&v7);
      objc_destroyWeak(buf);
    }
  }
}

- (void)removePowerAdapterObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

uint64_t __47__GEOSystemMonitor_removePowerAdapterObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) hasObservers];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) unregisterObserver:*(void *)(a1 + 40)];
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) hasObservers];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) hasObservers];
      if ((result & 1) == 0)
      {
        uint64_t v3 = *(void *)(a1 + 32);
        return -[GEOSystemMonitor _disablePowerAdapterNotifications](v3);
      }
    }
  }
  return result;
}

- (void)addBatteryLevelObserver:(id)a3 onlyWhenCharging:(BOOL)a4 queue:(id)a5
{
  id v6 = a3;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  geo_isolate_sync();
}

void __67__GEOSystemMonitor_addBatteryLevelObserver_onlyWhenCharging_queue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56) && !*(void *)(v2 + 56))
  {
    id v8 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED761A60 queue:0];
    uint64_t v9 = *(void *)(a1 + 32);
    id v7 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = v8;
  }
  else
  {
    if (*(void *)(v2 + 64))
    {
      if (*(unsigned char *)(a1 + 56)) {
        goto LABEL_5;
      }
LABEL_13:
      int v3 = 0;
      goto LABEL_14;
    }
    id v5 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED761A60 queue:0];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v5;
  }

  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_13;
  }
LABEL_5:
  if ([*(id *)(*(void *)(a1 + 32) + 56) hasObservers]) {
    int v3 = 0;
  }
  else {
    int v3 = [*(id *)(*(void *)(a1 + 32) + 48) hasObservers] ^ 1;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = 56;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v4 = 64;
LABEL_15:
  [*(id *)(*(void *)(a1 + 32) + v4) registerObserver:*(void *)(a1 + 40) queue:*(void *)(a1 + 48)];
  if ([*(id *)(*(void *)(a1 + 32) + 64) hasObservers]) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = [*(id *)(*(void *)(a1 + 32) + 56) hasObservers]
  }
       && [*(id *)(*(void *)(a1 + 32) + 48) hasObservers]
       && *(unsigned char *)(*(void *)(a1 + 32) + 80) != 0;
  if (v3) {
    -[GEOSystemMonitor _enablePowerAdapterNotifications](*(void *)(a1 + 32));
  }
  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    -[GEOSystemMonitor _enableBatteryPercentageNotifications](v11);
  }
}

- (void)_enableBatteryPercentageNotifications
{
  if (a1)
  {
    geo_assert_isolated();
    if (*(_DWORD *)(a1 + 76) == -1)
    {
      uint64_t v2 = GEOGetSystemMonitorLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Registering for IOKit battery percentage notifications", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, (id)a1);
      int v3 = *(NSObject **)(a1 + 8);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __57__GEOSystemMonitor__enableBatteryPercentageNotifications__block_invoke;
      handler[3] = &unk_1E53DD2C0;
      objc_copyWeak(&v7, buf);
      if (notify_register_dispatch("com.apple.system.powersources.percent", (int *)(a1 + 76), v3, handler))
      {
        uint64_t v4 = GEOGetSystemMonitorLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v5 = 0;
          _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_FAULT, "Registering for battery percentage changes failed", v5, 2u);
        }
      }
      else
      {
        -[GEOSystemMonitor _updateBatteryPercentage](a1);
      }
      objc_destroyWeak(&v7);
      objc_destroyWeak(buf);
    }
  }
}

- (void)removeBatteryLevelObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

uint64_t __47__GEOSystemMonitor_removeBatteryLevelObserver___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 56) hasObservers] & 1) != 0
    || (uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) hasObservers], result))
  {
    [*(id *)(*(void *)(a1 + 32) + 56) unregisterObserver:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 64) unregisterObserver:*(void *)(a1 + 40)];
    if (([*(id *)(*(void *)(a1 + 32) + 56) hasObservers] & 1) == 0
      && ([*(id *)(*(void *)(a1 + 32) + 48) hasObservers] & 1) == 0)
    {
      -[GEOSystemMonitor _disablePowerAdapterNotifications](*(void *)(a1 + 32));
    }
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) hasObservers];
    if ((result & 1) == 0)
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v3 + 80))
      {
        uint64_t result = [*(id *)(v3 + 56) hasObservers];
        if (result) {
          return result;
        }
        uint64_t v3 = *(void *)(a1 + 32);
      }
      return -[GEOSystemMonitor _disableBatteryPercentageNotifications](v3);
    }
  }
  return result;
}

- (BOOL)isPowerAdapterConnected
{
  uint64_t v2 = self;
  id v4 = self->_isolater;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_powerPluggedIn;
  _geo_isolate_unlock();

  return (char)v2;
}

- (unint64_t)batteryLevel
{
  id v5 = self->_isolater;
  _geo_isolate_lock_data();
  unint64_t batteryLevel = self->_batteryLevel;
  _geo_isolate_unlock();

  return batteryLevel;
}

void __52__GEOSystemMonitor__enablePowerAdapterNotifications__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    geo_isolate_sync();
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    uint64_t v5 = MEMORY[0x1E4F143A8];
    geo_isolate_sync();
    if (*((unsigned char *)v7 + 24))
    {
      uint64_t v2 = GEOGetSystemMonitorLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        int v3 = *((unsigned __int8 *)v11 + 24);
        *(_DWORD *)buf = 67109120;
        int v15 = v3;
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Power adapter state did change (%i). Notifying observers", buf, 8u);
      }

      objc_msgSend(WeakRetained[6], "deviceDidChangePowerAdapterState:", *((unsigned __int8 *)v11 + 24), v4, 3221225472, __52__GEOSystemMonitor__enablePowerAdapterNotifications__block_invoke_2, &unk_1E53D79D8, WeakRetained, v5, 3221225472, __58__GEOSystemMonitor__postPowerAdapterDidChangeNotification__block_invoke, &unk_1E53D89E8, WeakRetained, &v10, &v6);
    }
    _Block_object_dispose(&v6, 8);
    _Block_object_dispose(&v10, 8);
  }
}

void __52__GEOSystemMonitor__enablePowerAdapterNotifications__block_invoke_2(uint64_t a1)
{
}

- (void)_updatePowerAdapterState
{
  if (a1)
  {
    geo_assert_isolated();
    if (*(_DWORD *)(a1 + 72) != -1)
    {
      int v2 = IOPSDrawingUnlimitedPower();
      *(unsigned char *)(a1 + 80) = v2;
      if (v2
        && [*(id *)(a1 + 56) hasObservers]
        && ([*(id *)(a1 + 64) hasObservers] & 1) == 0)
      {
        -[GEOSystemMonitor _enableBatteryPercentageNotifications](a1);
      }
      else if (([*(id *)(a1 + 64) hasObservers] & 1) == 0 {
             && (!*(unsigned char *)(a1 + 80) || ([*(id *)(a1 + 56) hasObservers] & 1) == 0))
      }
      {
        -[GEOSystemMonitor _disableBatteryPercentageNotifications](a1);
      }
    }
  }
}

uint64_t __58__GEOSystemMonitor__postPowerAdapterDidChangeNotification__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 80);
  if ([*(id *)(a1[4] + 48) hasObservers]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = [*(id *)(a1[4] + 56) hasObservers];
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = a1[4];
    return -[GEOSystemMonitor _disablePowerAdapterNotifications](v3);
  }
  return result;
}

void __57__GEOSystemMonitor__enableBatteryPercentageNotifications__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    geo_isolate_sync();
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    uint64_t v5 = MEMORY[0x1E4F143A8];
    geo_isolate_sync();
    if (*((unsigned char *)v7 + 24))
    {
      int v2 = GEOGetSystemMonitorLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = v11[3];
        *(_DWORD *)buf = 134283521;
        uint64_t v15 = v3;
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Battery level did change (%{private}llu). Notifying observers", buf, 0xCu);
      }

      objc_msgSend(WeakRetained[8], "deviceDidChangeBatteryLevel:", v11[3], v4, 3221225472, __57__GEOSystemMonitor__enableBatteryPercentageNotifications__block_invoke_2, &unk_1E53D79D8, WeakRetained, v5, 3221225472, __61__GEOSystemMonitor__postBatteryPercentageChangedNotification__block_invoke, &unk_1E53D89E8, WeakRetained, &v10, &v6);
      if (*((unsigned char *)WeakRetained + 80)) {
        [WeakRetained[7] deviceDidChangeBatteryLevel:v11[3]];
      }
    }
    _Block_object_dispose(&v6, 8);
    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __57__GEOSystemMonitor__enableBatteryPercentageNotifications__block_invoke_2(uint64_t a1)
{
  return -[GEOSystemMonitor _updateBatteryPercentage](*(void *)(a1 + 32));
}

- (uint64_t)_updateBatteryPercentage
{
  if (result)
  {
    uint64_t v1 = result;
    geo_assert_isolated();
    uint64_t result = IOPSGetPercentRemaining();
    if (!result) {
      *(void *)(v1 + 88) = 0;
    }
  }
  return result;
}

uint64_t __61__GEOSystemMonitor__postBatteryPercentageChangedNotification__block_invoke(uint64_t *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 88);
  if ([*(id *)(a1[4] + 64) hasObservers]) {
    char v2 = 1;
  }
  else {
    char v2 = [*(id *)(a1[4] + 56) hasObservers];
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    -[GEOSystemMonitor _disableBatteryPercentageNotifications](a1[4]);
  }
  uint64_t result = [*(id *)(a1[4] + 56) hasObservers];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1[4] + 48) hasObservers];
    if ((result & 1) == 0)
    {
      uint64_t v4 = a1[4];
      return -[GEOSystemMonitor _disablePowerAdapterNotifications](v4);
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryObservers, 0);
  objc_storeStrong((id *)&self->_chargingOnlyBatteryObservers, 0);
  objc_storeStrong((id *)&self->_powerAdapterObservers, 0);
  objc_storeStrong((id *)&self->_systemSleepObservers, 0);
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end