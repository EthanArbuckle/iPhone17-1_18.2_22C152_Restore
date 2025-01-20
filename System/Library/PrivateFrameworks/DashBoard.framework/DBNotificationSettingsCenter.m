@interface DBNotificationSettingsCenter
+ (id)defaultCenter;
- (CARObserverHashTable)observers;
- (id)_init;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4;
- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4;
@end

@implementation DBNotificationSettingsCenter

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1) {
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)defaultCenter___defaultCenter;
  return v2;
}

uint64_t __45__DBNotificationSettingsCenter_defaultCenter__block_invoke()
{
  id v0 = [[DBNotificationSettingsCenter alloc] _init];
  uint64_t v1 = defaultCenter___defaultCenter;
  defaultCenter___defaultCenter = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)DBNotificationSettingsCenter;
  v2 = [(DBNotificationSettingsCenter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E180B28];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;

    v5 = [MEMORY[0x263F84580] currentNotificationSettingsCenter];
    [v5 setDelegate:v2];
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBNotificationSettingsCenter *)self observers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBNotificationSettingsCenter *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DBNotificationSettingsCenter *)self observers];
  [v8 userNotificationSettingsCenter:v7 didUpdateNotificationSourceIdentifiers:v6];
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DBNotificationSettingsCenter *)self observers];
  [v8 userNotificationSettingsCenter:v7 didUpdateNotificationSystemSettings:v6];
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end