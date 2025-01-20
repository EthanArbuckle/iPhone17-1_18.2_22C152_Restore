@interface BLSHBacklightOSTimerProvider
- (NSDate)now;
- (id)dateWithTimeIntervalSinceNow:(double)a3;
- (id)scheduledTimerWithIdentifier:(id)a3 interval:(double)a4 leewayInterval:(double)a5 handler:(id)a6;
- (id)scheduledWakingTimerWithIdentifier:(id)a3 interval:(double)a4 leewayInterval:(double)a5 handler:(id)a6;
- (void)dispatchToMainQueueAfterSecondsDelay:(double)a3 identifier:(id)a4 block:(id)a5;
@end

@implementation BLSHBacklightOSTimerProvider

- (NSDate)now
{
  return (NSDate *)[MEMORY[0x263EFF910] now];
}

- (id)dateWithTimeIntervalSinceNow:(double)a3
{
  return (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
}

- (id)scheduledTimerWithIdentifier:(id)a3 interval:(double)a4 leewayInterval:(double)a5 handler:(id)a6
{
  v9 = (objc_class *)MEMORY[0x263F29C20];
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)[[v9 alloc] initWithIdentifier:v11];

  [v12 scheduleWithFireInterval:MEMORY[0x263EF83A0] leewayInterval:v10 queue:a4 handler:a5];

  return v12;
}

- (id)scheduledWakingTimerWithIdentifier:(id)a3 interval:(double)a4 leewayInterval:(double)a5 handler:(id)a6
{
  v9 = (objc_class *)MEMORY[0x263F7C4A8];
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)[[v9 alloc] initWithIdentifier:v11];

  [v12 scheduleWithFireInterval:MEMORY[0x263EF83A0] leewayInterval:v10 queue:a4 handler:a5];

  return v12;
}

- (void)dispatchToMainQueueAfterSecondsDelay:(double)a3 identifier:(id)a4 block:(id)a5
{
  int64_t v5 = (uint64_t)(a3 * 1000000000.0);
  dispatch_block_t block = a5;
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

@end