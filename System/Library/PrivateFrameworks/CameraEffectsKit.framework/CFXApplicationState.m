@interface CFXApplicationState
+ (CFXApplicationState)sharedInstance;
+ (void)beginMonitoringApplicationState;
- (BOOL)isRegisteredForEvents;
- (CFXApplicationState)init;
- (int64_t)applicationState;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)registerForEvents;
- (void)setApplicationState:(int64_t)a3;
- (void)setIsRegisteredForEvents:(BOOL)a3;
- (void)unregisterForEvents;
@end

@implementation CFXApplicationState

+ (void)beginMonitoringApplicationState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CFXApplicationState_beginMonitoringApplicationState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

id __54__CFXApplicationState_beginMonitoringApplicationState__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) sharedInstance];
}

+ (CFXApplicationState)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CFXApplicationState_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_s_sharedInstance;
  return (CFXApplicationState *)v2;
}

uint64_t __37__CFXApplicationState_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_s_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(CFXApplicationState *)self unregisterForEvents];
  v3.receiver = self;
  v3.super_class = (Class)CFXApplicationState;
  [(CFXApplicationState *)&v3 dealloc];
}

- (CFXApplicationState)init
{
  v5.receiver = self;
  v5.super_class = (Class)CFXApplicationState;
  v2 = [(CFXApplicationState *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(CFXApplicationState *)v2 setApplicationState:0];
    [(CFXApplicationState *)v3 registerForEvents];
  }
  return v3;
}

- (void)registerForEvents
{
  if (![(CFXApplicationState *)self isRegisteredForEvents])
  {
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

    objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x263F07FD8] object:0];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F07FC0] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F07FC8] object:0];

    [(CFXApplicationState *)self setIsRegisteredForEvents:1];
  }
}

- (void)unregisterForEvents
{
  if ([(CFXApplicationState *)self isRegisteredForEvents])
  {
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self];

    [(CFXApplicationState *)self setIsRegisteredForEvents:0];
  }
}

- (void)applicationWillResignActive:(id)a3
{
}

- (void)applicationDidBecomeActive:(id)a3
{
}

- (void)applicationDidEnterBackground:(id)a3
{
}

- (int64_t)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(int64_t)a3
{
  self->_applicationState = a3;
}

- (BOOL)isRegisteredForEvents
{
  return self->_isRegisteredForEvents;
}

- (void)setIsRegisteredForEvents:(BOOL)a3
{
  self->_isRegisteredForEvents = a3;
}

@end