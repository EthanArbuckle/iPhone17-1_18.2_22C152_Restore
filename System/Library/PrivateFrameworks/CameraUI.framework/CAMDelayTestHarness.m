@interface CAMDelayTestHarness
- (CAMDelayTestHarness)initWithTestName:(id)a3 secondsDelay:(int64_t)a4;
- (int64_t)_delay;
- (void)set_delay:(int64_t)a3;
- (void)startTesting;
@end

@implementation CAMDelayTestHarness

- (CAMDelayTestHarness)initWithTestName:(id)a3 secondsDelay:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CAMDelayTestHarness;
  v5 = [(CAMPerformanceTestHarness *)&v9 initWithTestName:a3];
  v6 = v5;
  if (v5)
  {
    v5->__delay = a4;
    v7 = v5;
  }

  return v6;
}

- (void)startTesting
{
  v5.receiver = self;
  v5.super_class = (Class)CAMDelayTestHarness;
  [(CAMPerformanceTestHarness *)&v5 startTesting];
  dispatch_time_t v3 = dispatch_time(0, 1000000000 * [(CAMDelayTestHarness *)self _delay]);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__CAMDelayTestHarness_startTesting__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __35__CAMDelayTestHarness_startTesting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTesting];
}

- (int64_t)_delay
{
  return self->__delay;
}

- (void)set_delay:(int64_t)a3
{
  self->__delay = a3;
}

@end