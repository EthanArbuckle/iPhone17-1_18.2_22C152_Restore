@interface HFLocationSensingCoordinator
- (BOOL)homeSensingEnabled;
- (BOOL)readHomeSensingDefault;
- (HFLocationManagerDispatcher)locationDispatcher;
- (HFLocationSensingCoordinator)init;
- (HFLocationSensingCoordinator)initWithDelegate:(id)a3;
- (HFLocationSensingCoordinatorDelegate)delegate;
- (NAFuture)homeSensingFirstFuture;
- (NAFuture)locationSensingAvailableFuture;
- (NSUserDefaults)defaults;
- (int)defaultsChangedNotifyToken;
- (void)_defaultsDidChange;
- (void)dealloc;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDefaultsChangedNotifyToken:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeSensingEnabled:(BOOL)a3;
- (void)setHomeSensingFirstFuture:(id)a3;
- (void)setLocationDispatcher:(id)a3;
@end

@implementation HFLocationSensingCoordinator

- (HFLocationSensingCoordinator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HFLocationSensingCoordinator;
  v5 = [(HFLocationSensingCoordinator *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Home.group"];
    defaults = v6->_defaults;
    v6->_defaults = (NSUserDefaults *)v7;

    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    homeSensingFirstFuture = v6->_homeSensingFirstFuture;
    v6->_homeSensingFirstFuture = v9;

    objc_initWeak(&location, v6);
    v11 = (const char *)HFHomeSensingDefaultsChangedNotification;
    v12 = MEMORY[0x263EF83A0];
    id v13 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __49__HFLocationSensingCoordinator_initWithDelegate___block_invoke;
    handler[3] = &unk_26408DD70;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch(v11, &v6->_defaultsChangedNotifyToken, v12, handler);

    v14 = [MEMORY[0x263F42628] defaultScheduler];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__HFLocationSensingCoordinator_initWithDelegate___block_invoke_2;
    v20[3] = &unk_26408DDE0;
    v15 = v6;
    v21 = v15;
    id v16 = (id)[v14 performBlock:v20];

    v17 = +[HFLocationManagerDispatcher sharedDispatcher];
    [(HFLocationSensingCoordinator *)v15 setLocationDispatcher:v17];

    v18 = [(HFLocationSensingCoordinator *)v15 locationDispatcher];
    [v18 addObserver:v15];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __62__HFLocationSensingCoordinator_locationSensingAvailableFuture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained locationDispatcher];
  v3 = [v2 authorizationStatusFuture];
  id v4 = [v3 flatMap:&__block_literal_global_11];

  return v4;
}

- (HFLocationManagerDispatcher)locationDispatcher
{
  return self->_locationDispatcher;
}

- (void)setLocationDispatcher:(id)a3
{
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  int v4 = [a3 authorizationStatus];
  v5 = [(HFLocationSensingCoordinator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(HFLocationSensingCoordinator *)self delegate];
    [v7 coordinator:self locationSensingAvailabilityDidChange:(v4 - 3) < 2];
  }
}

- (HFLocationSensingCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFLocationSensingCoordinatorDelegate *)WeakRetained;
}

- (BOOL)homeSensingEnabled
{
  return !self->_cachedHomeSensingValueSet || self->_cachedHomeSensingValue;
}

- (NAFuture)locationSensingAvailableFuture
{
  objc_initWeak(&location, self);
  v3 = [(HFLocationSensingCoordinator *)self homeSensingFirstFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__HFLocationSensingCoordinator_locationSensingAvailableFuture__block_invoke;
  v6[3] = &unk_26408DDB8;
  objc_copyWeak(&v7, &location);
  int v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (NAFuture *)v4;
}

void __49__HFLocationSensingCoordinator_initWithDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) readHomeSensingDefault];
  v3 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = "disabled";
    if (v2) {
      int v4 = "enabled";
    }
    int v7 = 136315138;
    v8 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Home Sensing is %s", (uint8_t *)&v7, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) homeSensingFirstFuture];
  char v6 = [NSNumber numberWithBool:v2];
  [v5 finishWithResult:v6];
}

- (NAFuture)homeSensingFirstFuture
{
  return self->_homeSensingFirstFuture;
}

- (BOOL)readHomeSensingDefault
{
  v3 = [(HFLocationSensingCoordinator *)self defaults];
  int v4 = [v3 objectForKey:@"HFHomeSensingEnabled"];

  if (v4)
  {
    char v5 = [v4 BOOLValue];
    self->_cachedHomeSensingValue = v5;
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
    char v5 = 1;
  }
  self->_cachedHomeSensingValueSet = v6;

  return v5;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

id __62__HFLocationSensingCoordinator_locationSensingAvailableFuture__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 intValue] - 3 < 2;
  v3 = (void *)MEMORY[0x263F58190];
  int v4 = [NSNumber numberWithBool:v2];
  char v5 = [v3 futureWithResult:v4];

  return v5;
}

void __49__HFLocationSensingCoordinator_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _defaultsDidChange];
}

- (HFLocationSensingCoordinator)init
{
  return [(HFLocationSensingCoordinator *)self initWithDelegate:0];
}

- (void)dealloc
{
  notify_cancel([(HFLocationSensingCoordinator *)self defaultsChangedNotifyToken]);
  v3.receiver = self;
  v3.super_class = (Class)HFLocationSensingCoordinator;
  [(HFLocationSensingCoordinator *)&v3 dealloc];
}

- (void)setHomeSensingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (+[HFExecutionEnvironment isHomeApp]
    || +[HFExecutionEnvironment isWatchApp])
  {
    char v5 = HFLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = "Disabling";
      if (v3) {
        BOOL v6 = "Enabling";
      }
      int v9 = 136315138;
      v10 = v6;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%s Home Sensing", (uint8_t *)&v9, 0xCu);
    }

    int v7 = [(HFLocationSensingCoordinator *)self defaults];
    [v7 setBool:v3 forKey:@"HFHomeSensingEnabled"];

    self->_cachedHomeSensingValue = v3;
    self->_cachedHomeSensingValueSet = 1;
    notify_post((const char *)HFHomeSensingDefaultsChangedNotification);
  }
  else
  {
    v8 = HFLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring request to set Home Sensing pref - process is not Home", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)_defaultsDidChange
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFLocationSensingCoordinator *)self readHomeSensingDefault];
  int v4 = HFLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Home Sensing preferences changed - state is now %{BOOL}d", (uint8_t *)v8, 8u);
  }

  char v5 = [(HFLocationSensingCoordinator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(HFLocationSensingCoordinator *)self delegate];
    [v7 coordinator:self homeSensingStatusDidChange:v3];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setHomeSensingFirstFuture:(id)a3
{
}

- (void)setDefaults:(id)a3
{
}

- (int)defaultsChangedNotifyToken
{
  return self->_defaultsChangedNotifyToken;
}

- (void)setDefaultsChangedNotifyToken:(int)a3
{
  self->_defaultsChangedNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDispatcher, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_homeSensingFirstFuture, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end