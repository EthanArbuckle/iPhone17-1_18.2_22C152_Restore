@interface _DKInCarMonitor
+ (id)entitlements;
+ (id)eventStream;
+ (void)setIsConnected:(BOOL)a3;
- (BOOL)connected;
- (BOOL)enabled;
- (id)loadState;
- (int)connectedToken;
- (int)disconnectedToken;
- (void)deactivate;
- (void)dealloc;
- (void)setConnected:(BOOL)a3;
- (void)setConnectedStatus:(BOOL)a3;
- (void)setConnectedToken:(int)a3;
- (void)setDisconnectedToken:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKInCarMonitor

- (void)dealloc
{
  [(_DKInCarMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKInCarMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"InCar";
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

+ (void)setIsConnected:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  objc_super v3 = [MEMORY[0x263F351B8] userContext];
  v4 = [MEMORY[0x263F351D0] keyPathForCarConnectedStatus];
  [v3 setObject:v5 forKeyedSubscript:v4];
}

- (void)setConnectedStatus:(BOOL)a3
{
  if (self->_enabled)
  {
    BOOL v3 = a3;
    if (self->_connected != a3)
    {
      self->_connected = a3;
      v4 = objc_opt_class();
      [v4 setIsConnected:v3];
    }
  }
}

- (void)start
{
  v11.receiver = self;
  v11.super_class = (Class)_DKInCarMonitor;
  if ([(_DKMonitor *)&v11 instantMonitorNeedsActivation])
  {
    self->_enabled = 1;
    BOOL v3 = (const char *)[@"com.apple.locationd.vehicle.connected" UTF8String];
    v4 = [(_DKMonitor *)self queue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __24___DKInCarMonitor_start__block_invoke;
    handler[3] = &unk_264714B68;
    handler[4] = self;
    notify_register_dispatch(v3, &self->_connectedToken, v4, handler);

    id v5 = (const char *)[@"com.apple.locationd.vehicle.disconnected" UTF8String];
    v6 = [(_DKMonitor *)self queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __24___DKInCarMonitor_start__block_invoke_2;
    v9[3] = &unk_264714B68;
    v9[4] = self;
    notify_register_dispatch(v5, &self->_disconnectedToken, v6, v9);

    v7 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __24___DKInCarMonitor_start__block_invoke_3;
    block[3] = &unk_264714788;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKInCarMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKInCarMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  self->_enabled = 0;
  int connectedToken = self->_connectedToken;
  if (connectedToken) {
    notify_cancel(connectedToken);
  }
  disint connectedToken = self->_disconnectedToken;
  if (disconnectedToken)
  {
    notify_cancel(disconnectedToken);
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

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (int)connectedToken
{
  return self->_connectedToken;
}

- (void)setConnectedToken:(int)a3
{
  self->_int connectedToken = a3;
}

- (int)disconnectedToken
{
  return self->_disconnectedToken;
}

- (void)setDisconnectedToken:(int)a3
{
  self->_disint connectedToken = a3;
}

@end