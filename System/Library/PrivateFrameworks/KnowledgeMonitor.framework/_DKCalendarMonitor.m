@interface _DKCalendarMonitor
+ (id)_eventWithTitle:(id)a3 interaction:(id)a4;
+ (id)entitlements;
+ (id)eventStream;
- (_DKCalendarMonitor)init;
- (void)dealloc;
- (void)start;
- (void)stop;
- (void)update;
@end

@implementation _DKCalendarMonitor

+ (id)eventStream
{
  return @"NextCalendarEvent";
}

+ (id)entitlements
{
  return &unk_26D86D7D0;
}

- (_DKCalendarMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DKCalendarMonitor;
  v2 = [(_DKMonitor *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F04B98]);
    [v3 requestAccessToEntityType:0 completion:&__block_literal_global_9];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__receiveDatabaseChangeNotification_ name:*MEMORY[0x263F04AD8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(_DKCalendarMonitor *)self deactivate];
  v4.receiver = self;
  v4.super_class = (Class)_DKCalendarMonitor;
  [(_DKMonitor *)&v4 dealloc];
}

- (void)start
{
  v2.receiver = self;
  v2.super_class = (Class)_DKCalendarMonitor;
  [(_DKMonitor *)&v2 instantMonitorNeedsActivation];
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKCalendarMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKCalendarMonitor *)self deactivate];
  }
}

+ (id)_eventWithTitle:(id)a3 interaction:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F35060];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 interaction];
  v17 = v8;
  v18[0] = v6;
  v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  v10 = (void *)MEMORY[0x263F35088];
  v11 = [MEMORY[0x263F35148] calendarEventStream];
  v12 = [v6 startDate];
  v13 = [v6 endDate];
  v14 = [MEMORY[0x263F35150] withTitle:v7];

  v15 = [v10 eventWithStream:v11 startDate:v12 endDate:v13 value:v14 metadata:v9];

  return v15;
}

- (void)update
{
  objc_super v3 = [(_DKMonitor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28___DKCalendarMonitor_update__block_invoke;
  v7[3] = &unk_264714788;
  v7[4] = self;
  objc_super v4 = v7;
  v5 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_8;
  block[3] = &unk_2647148A0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  dispatch_async(v3, block);
}

@end