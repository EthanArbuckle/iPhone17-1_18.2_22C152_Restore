@interface FMDUIFMIPSettingsCache
+ (id)sharedInstance;
- (BOOL)fmipEnabled;
- (BOOL)fmipStateAvailable;
- (BOOL)fmipStateChangeInProgress;
- (BOOL)lowBatteryLocateEnabled;
- (BOOL)lowBatteryLocateStateAvailable;
- (FMDUIFMIPSettingsCache)init;
- (unint64_t)fmipState;
- (void)_loadFMIPState;
- (void)_loadLowBatteryState;
- (void)setFmipState:(unint64_t)a3;
- (void)setFmipStateAvailable:(BOOL)a3;
- (void)setLowBatteryLocateEnabled:(BOOL)a3;
- (void)setLowBatteryLocateStateAvailable:(BOOL)a3;
@end

@implementation FMDUIFMIPSettingsCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

uint64_t __40__FMDUIFMIPSettingsCache_sharedInstance__block_invoke()
{
  sharedInstance__instance = objc_alloc_init(FMDUIFMIPSettingsCache);
  return MEMORY[0x270F9A758]();
}

- (FMDUIFMIPSettingsCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)FMDUIFMIPSettingsCache;
  v2 = [(FMDUIFMIPSettingsCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_fmipState = 4;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_fmipStateChangeNotificationReceived, (CFStringRef)*MEMORY[0x263F3CC80], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)_lowBatteryLocateStateChangeNotificationReceived, (CFStringRef)*MEMORY[0x263F3CC78], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(FMDUIFMIPSettingsCache *)v3 _loadFMIPState];
    [(FMDUIFMIPSettingsCache *)v3 _loadLowBatteryState];
  }
  return v3;
}

- (BOOL)fmipEnabled
{
  unint64_t v3 = [(FMDUIFMIPSettingsCache *)self fmipState];
  if (v3 != 1) {
    LOBYTE(v3) = [(FMDUIFMIPSettingsCache *)self fmipState] == 0;
  }
  return v3;
}

- (BOOL)fmipStateChangeInProgress
{
  return [(FMDUIFMIPSettingsCache *)self fmipState] == 2
      || [(FMDUIFMIPSettingsCache *)self fmipState] == 0;
}

- (void)_loadLowBatteryState
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x263F3CC60] sharedInstance];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__FMDUIFMIPSettingsCache__loadLowBatteryState__block_invoke;
  v3[3] = &unk_264DB4080;
  objc_copyWeak(&v4, &location);
  [v2 lowBatteryLocateEnabledWithCompletion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __46__FMDUIFMIPSettingsCache__loadLowBatteryState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3)
  {
    id v7 = WeakRetained;
    [WeakRetained setLowBatteryLocateEnabled:a2];
    [v7 setLowBatteryLocateStateAvailable:1];
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"FMDUIFMIPSettingsCacheDidUpdateNotification" object:0];

    id WeakRetained = v7;
  }
}

- (void)_loadFMIPState
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x263F3CC60] sharedInstance];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__FMDUIFMIPSettingsCache__loadFMIPState__block_invoke;
  v3[3] = &unk_264DB40A8;
  objc_copyWeak(&v4, &location);
  [v2 fmipStateWithCompletion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __40__FMDUIFMIPSettingsCache__loadFMIPState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3)
  {
    id v7 = WeakRetained;
    [WeakRetained setFmipState:a2];
    [v7 setFmipStateAvailable:1];
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"FMDUIFMIPSettingsCacheDidUpdateNotification" object:0];

    id WeakRetained = v7;
  }
}

- (BOOL)fmipStateAvailable
{
  return self->_fmipStateAvailable;
}

- (void)setFmipStateAvailable:(BOOL)a3
{
  self->_fmipStateAvailable = a3;
}

- (unint64_t)fmipState
{
  return self->_fmipState;
}

- (void)setFmipState:(unint64_t)a3
{
  self->_fmipState = a3;
}

- (BOOL)lowBatteryLocateStateAvailable
{
  return self->_lowBatteryLocateStateAvailable;
}

- (void)setLowBatteryLocateStateAvailable:(BOOL)a3
{
  self->_lowBatteryLocateStateAvailable = a3;
}

- (BOOL)lowBatteryLocateEnabled
{
  return self->_lowBatteryLocateEnabled;
}

- (void)setLowBatteryLocateEnabled:(BOOL)a3
{
  self->_lowBatteryLocateEnabled = a3;
}

@end