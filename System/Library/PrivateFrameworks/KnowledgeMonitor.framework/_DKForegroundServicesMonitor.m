@interface _DKForegroundServicesMonitor
+ (id)entitlements;
- (id)processUpdateHandler;
- (id)servicesOfInterestForWatchCommunication;
- (void)addServicesForeground:(id)a3 andRemoveServices:(id)a4;
- (void)processMonitor:(id)a3 didUpdateState:(id)a4 forProcess:(id)a5;
- (void)start;
- (void)stop;
@end

@implementation _DKForegroundServicesMonitor

+ (id)entitlements
{
  return &unk_26D86D7A0;
}

- (id)servicesOfInterestForWatchCommunication
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.PassbookUIService", 0);
}

- (void)start
{
  if ([(_DKMonitor *)self instantMonitorNeedsActivation])
  {
    v3 = [MEMORY[0x263EFF9C0] set];
    previouslyForegroundServices = self->_previouslyForegroundServices;
    self->_previouslyForegroundServices = v3;

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37___DKForegroundServicesMonitor_start__block_invoke;
    v7[3] = &unk_264714DA8;
    v7[4] = self;
    v5 = [MEMORY[0x263F645C0] monitorWithConfiguration:v7];
    processMonitor = self->_processMonitor;
    self->_processMonitor = v5;
  }
}

- (void)stop
{
  if ([(_DKMonitor *)self instantMonitorNeedsDeactivation])
  {
    [(RBSProcessMonitor *)self->_processMonitor invalidate];
    processMonitor = self->_processMonitor;
    self->_processMonitor = 0;

    previouslyForegroundServices = self->_previouslyForegroundServices;
    self->_previouslyForegroundServices = 0;
  }
}

- (void)addServicesForeground:(id)a3 andRemoveServices:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x22A629AA0]();
  v9 = [MEMORY[0x263F351B8] userContext];
  v10 = [(_DKMonitor *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [MEMORY[0x263F351D0] keyPathForServicesAppearingForeground];
    v12 = [v9 objectForKeyedSubscript:v11];
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_225002000, v10, OS_LOG_TYPE_DEFAULT, "Adding objects: %@, Removing objects: %@, previously %@", (uint8_t *)&v14, 0x20u);
  }
  v13 = [MEMORY[0x263F351D0] keyPathForServicesAppearingForeground];
  [v9 addObjects:v6 andRemoveObjects:v7 fromArrayAtKeyPath:v13];
}

- (void)processMonitor:(id)a3 didUpdateState:(id)a4 forProcess:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = [a5 bundle];
  v9 = [v8 identifier];

  v10 = [(_DKForegroundServicesMonitor *)self servicesOfInterestForWatchCommunication];
  int v11 = [v10 containsObject:v9];

  if (v11)
  {
    v12 = [v7 state];
    int v13 = [v12 taskState];

    if (v13 == 4)
    {
      if (([(NSMutableSet *)self->_previouslyForegroundServices containsObject:v9] & 1) == 0)
      {
        v17[0] = v9;
        int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
        [(_DKForegroundServicesMonitor *)self addServicesForeground:v14 andRemoveServices:MEMORY[0x263EFFA68]];

        [(NSMutableSet *)self->_previouslyForegroundServices addObject:v9];
      }
    }
    else
    {
      __int16 v16 = v9;
      id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
      [(_DKForegroundServicesMonitor *)self addServicesForeground:MEMORY[0x263EFFA68] andRemoveServices:v15];

      [(NSMutableSet *)self->_previouslyForegroundServices removeObject:v9];
    }
  }
}

- (id)processUpdateHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52___DKForegroundServicesMonitor_processUpdateHandler__block_invoke;
  v4[3] = &unk_264714DF8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x22A629CE0](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyForegroundServices, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
}

@end