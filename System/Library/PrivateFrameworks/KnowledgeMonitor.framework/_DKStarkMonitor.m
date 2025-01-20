@interface _DKStarkMonitor
+ (id)_eventWithState:(BOOL)a3;
+ (id)entitlements;
+ (id)eventStream;
- (CARSessionStatus)sessionStatus;
- (void)deactivate;
- (void)dealloc;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
- (void)updateCurrentState;
@end

@implementation _DKStarkMonitor

- (void)synchronouslyReflectCurrentValue
{
  v3 = [(_DKMonitor *)self currentEvent];

  if (!v3)
  {
    [(_DKStarkMonitor *)self updateCurrentState];
  }
}

- (void)dealloc
{
  [(_DKStarkMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKStarkMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"CarPlayConnected";
}

+ (id)entitlements
{
  return 0;
}

+ (id)_eventWithState:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x263F35050] yes];
  }
  else {
  objc_super v3 = [MEMORY[0x263F35050] no];
  }
  v4 = (void *)MEMORY[0x263F35088];
  v5 = [MEMORY[0x263F35148] carPlayIsConnectedStream];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = [MEMORY[0x263EFF910] distantFuture];
  v8 = [v4 eventWithStream:v5 startDate:v6 endDate:v7 value:v3];

  return v8;
}

- (void)start
{
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKStarkMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKStarkMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  objc_super v3 = [(_DKStarkMonitor *)self sessionStatus];

  if (v3)
  {
    v4 = [(_DKStarkMonitor *)self sessionStatus];
    [v4 removeSessionObserver:self];

    [(_DKStarkMonitor *)self setSessionStatus:0];
  }
}

- (void)updateCurrentState
{
  objc_super v3 = [(_DKStarkMonitor *)self sessionStatus];
  v4 = [v3 currentSession];
  BOOL v5 = v4 != 0;

  v6 = +[_DKStarkMonitor _eventWithState:v5];
  [(_DKMonitor *)self setCurrentEvent:v6 inferHistoricalState:1];

  id v9 = [NSNumber numberWithBool:v5];
  v7 = [MEMORY[0x263F351B8] userContext];
  v8 = [MEMORY[0x263F351D0] keyPathForCarplayConnectedStatus];
  [v7 setObject:v9 forKeyedSubscript:v8];
}

- (void)sessionDidConnect:(id)a3
{
  if (a3)
  {
    v4 = [(_DKMonitor *)self queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37___DKStarkMonitor_sessionDidConnect___block_invoke;
    v8[3] = &unk_264714788;
    v8[4] = self;
    BOOL v5 = v8;
    v6 = (void *)os_transaction_create();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_10;
    block[3] = &unk_2647148A0;
    id v10 = v6;
    id v11 = v5;
    id v7 = v6;
    dispatch_async(v4, block);
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  if (a3)
  {
    v4 = [(_DKMonitor *)self queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40___DKStarkMonitor_sessionDidDisconnect___block_invoke;
    v8[3] = &unk_264714788;
    v8[4] = self;
    BOOL v5 = v8;
    v6 = (void *)os_transaction_create();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_10;
    block[3] = &unk_2647148A0;
    id v10 = v6;
    id v11 = v5;
    id v7 = v6;
    dispatch_async(v4, block);
  }
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end