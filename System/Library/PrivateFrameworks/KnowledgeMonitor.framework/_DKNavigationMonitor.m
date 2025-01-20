@interface _DKNavigationMonitor
+ (id)entitlements;
+ (id)eventStream;
+ (void)setIsNavigating:(BOOL)a3;
- (BOOL)enabled;
- (BOOL)navigating;
- (id)loadState;
- (int)startedToken;
- (int)stoppedToken;
- (void)deactivate;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setNavigating:(BOOL)a3;
- (void)setNavigationStatus:(BOOL)a3;
- (void)setStartedToken:(int)a3;
- (void)setStoppedToken:(int)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKNavigationMonitor

- (void)dealloc
{
  [(_DKNavigationMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKNavigationMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"NavigationInProgress";
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

+ (void)setIsNavigating:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  objc_super v3 = [MEMORY[0x263F351B8] userContext];
  v4 = [MEMORY[0x263F351D0] keyPathForNavigationStatus];
  [v3 setObject:v5 forKeyedSubscript:v4];
}

- (void)setNavigationStatus:(BOOL)a3
{
  if (self->_enabled)
  {
    BOOL v3 = a3;
    if (self->_navigating != a3)
    {
      self->_navigating = a3;
      v4 = objc_opt_class();
      [v4 setIsNavigating:v3];
    }
  }
}

- (void)start
{
  v11.receiver = self;
  v11.super_class = (Class)_DKNavigationMonitor;
  if ([(_DKMonitor *)&v11 instantMonitorNeedsActivation])
  {
    self->_enabled = 1;
    BOOL v3 = (const char *)[@"com.apple.GeoServices.navigation.started" UTF8String];
    v4 = [(_DKMonitor *)self queue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __29___DKNavigationMonitor_start__block_invoke;
    handler[3] = &unk_264714B68;
    handler[4] = self;
    notify_register_dispatch(v3, &self->_startedToken, v4, handler);

    id v5 = (const char *)[@"com.apple.GeoServices.navigation.stopped" UTF8String];
    v6 = [(_DKMonitor *)self queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __29___DKNavigationMonitor_start__block_invoke_2;
    v9[3] = &unk_264714B68;
    v9[4] = self;
    notify_register_dispatch(v5, &self->_stoppedToken, v6, v9);

    v7 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29___DKNavigationMonitor_start__block_invoke_3;
    block[3] = &unk_264714788;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNavigationMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKNavigationMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  self->_enabled = 0;
  int startedToken = self->_startedToken;
  if (startedToken)
  {
    notify_cancel(startedToken);
    self->_int startedToken = 0;
  }
  int stoppedToken = self->_stoppedToken;
  if (stoppedToken)
  {
    notify_cancel(stoppedToken);
    self->_int stoppedToken = 0;
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)navigating
{
  return self->_navigating;
}

- (void)setNavigating:(BOOL)a3
{
  self->_navigating = a3;
}

- (int)startedToken
{
  return self->_startedToken;
}

- (void)setStartedToken:(int)a3
{
  self->_int startedToken = a3;
}

- (int)stoppedToken
{
  return self->_stoppedToken;
}

- (void)setStoppedToken:(int)a3
{
  self->_int stoppedToken = a3;
}

@end