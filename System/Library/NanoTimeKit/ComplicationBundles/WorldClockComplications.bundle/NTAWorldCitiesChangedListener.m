@interface NTAWorldCitiesChangedListener
+ (id)sharedListener;
- (BOOL)active;
- (NSMutableSet)observers;
- (id)addObserverOnQueue:(id)a3 usingBlock:(id)a4;
- (void)_notifyPrefsChanged;
- (void)activate;
- (void)deactivate;
- (void)removeObserver:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setObservers:(id)a3;
@end

@implementation NTAWorldCitiesChangedListener

+ (id)sharedListener
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23C357AE8;
  block[3] = &unk_264E3D8E0;
  block[4] = a1;
  if (qword_268BA3C40 != -1) {
    dispatch_once(&qword_268BA3C40, block);
  }
  v2 = (void *)qword_268BA3C48;

  return v2;
}

- (id)addObserverOnQueue:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [[NTAWorldClockPreferencesListenerObserver alloc] initWithQueue:v6 block:v7];
    if (([(NSMutableSet *)self->_observers containsObject:v8] & 1) == 0)
    {
      observers = self->_observers;
      if (!observers)
      {
        v10 = objc_opt_new();
        [(NTAWorldCitiesChangedListener *)self setObservers:v10];

        observers = self->_observers;
      }
      [(NSMutableSet *)observers addObject:v8];
      if (!self->_active) {
        [(NTAWorldCitiesChangedListener *)self activate];
      }
    }
  }
  else
  {
    v11 = NTALogForCategory(5uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_23C35D3A4((uint64_t)self, v11);
    }

    v8 = 0;
  }

  return v8;
}

- (void)removeObserver:(id)a3
{
  [(NSMutableSet *)self->_observers removeObject:a3];
  if (![(NSMutableSet *)self->_observers count])
  {
    MEMORY[0x270F9A6D0](self, sel_deactivate);
  }
}

- (void)activate
{
  [(NTAWorldCitiesChangedListener *)self setActive:1];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_23C357D20, @"NanoMobileTimerWorldClockPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, 0, (CFNotificationCallback)sub_23C357D20, @"com.apple.mobiletimer.user-preferences-and-local-notifications-changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)sub_23C357D20, @"com.apple.mobiletimer.user-preferences-changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)deactivate
{
  [(NTAWorldCitiesChangedListener *)self setActive:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"NanoMobileTimerWorldClockPreferencesChangedNotification", 0);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v3, 0, @"com.apple.mobiletimer.user-preferences-and-local-notifications-changed", 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(v4, 0, @"com.apple.mobiletimer.user-preferences-changed", 0);
}

- (void)_notifyPrefsChanged
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_active)
  {
    v3 = [MEMORY[0x263F55DB8] sharedManager];
    [v3 loadCities];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = self->_observers;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "queue", (void)v13);

          if (v10)
          {
            v11 = [v9 queue];
            v12 = [v9 block];
            [v11 addOperationWithBlock:v12];
          }
          else
          {
            v11 = [v9 block];
            v11[2]();
          }
        }
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

@end