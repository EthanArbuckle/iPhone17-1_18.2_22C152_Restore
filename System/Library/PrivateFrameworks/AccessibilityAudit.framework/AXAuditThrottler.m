@interface AXAuditThrottler
+ (id)throttlerWithInterval:(double)a3 target:(id)a4 selector:(SEL)a5 queue:(id)a6 alwaysReschedule:(BOOL)a7;
- (BOOL)_alwaysReschedule;
- (BOOL)_pendingFire;
- (NSDate)_lastFireTime;
- (NSObject)_target;
- (OS_dispatch_queue)_fireQueue;
- (OS_dispatch_source)_dispatchTimer;
- (SEL)_selector;
- (double)_interval;
- (void)_fire;
- (void)_scheduleTimerAfterDelay:(double)a3;
- (void)scheduleNow;
- (void)set_alwaysReschedule:(BOOL)a3;
- (void)set_dispatchTimer:(id)a3;
- (void)set_fireQueue:(id)a3;
- (void)set_interval:(double)a3;
- (void)set_lastFireTime:(id)a3;
- (void)set_pendingFire:(BOOL)a3;
- (void)set_selector:(SEL)a3;
- (void)set_target:(id)a3;
@end

@implementation AXAuditThrottler

+ (id)throttlerWithInterval:(double)a3 target:(id)a4 selector:(SEL)a5 queue:(id)a6 alwaysReschedule:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a4;
  v13 = objc_opt_new();
  objc_msgSend(v13, "set_interval:", a3);
  objc_msgSend(v13, "set_selector:", a5);
  objc_msgSend(v13, "set_target:", v12);

  objc_msgSend(v13, "set_fireQueue:", v11);
  objc_msgSend(v13, "set_alwaysReschedule:", v7);

  return v13;
}

- (OS_dispatch_queue)_fireQueue
{
  fireQueue = self->__fireQueue;
  if (fireQueue)
  {
    v3 = fireQueue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
    id v4 = MEMORY[0x263EF83A0];
  }

  return v3;
}

- (void)_scheduleTimerAfterDelay:(double)a3
{
  v5 = [(AXAuditThrottler *)self _dispatchTimer];

  if (v5)
  {
    source = [(AXAuditThrottler *)self _dispatchTimer];
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    [(AXAuditThrottler *)self _interval];
    dispatch_source_set_timer(source, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v7 * 0.1 * 1000000000.0));
  }
  else
  {
    v8 = [(AXAuditThrottler *)self _fireQueue];
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
    [(AXAuditThrottler *)self set_dispatchTimer:v9];

    v10 = [(AXAuditThrottler *)self _dispatchTimer];
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    [(AXAuditThrottler *)self _interval];
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v12 * 0.1 * 1000000000.0));

    v13 = [(AXAuditThrottler *)self _dispatchTimer];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __45__AXAuditThrottler__scheduleTimerAfterDelay___block_invoke;
    handler[3] = &unk_26520D308;
    handler[4] = self;
    dispatch_source_set_event_handler(v13, handler);

    v14 = [(AXAuditThrottler *)self _dispatchTimer];
    dispatch_activate(v14);
  }
}

uint64_t __45__AXAuditThrottler__scheduleTimerAfterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fire];
}

- (void)_fire
{
  id v5 = [(AXAuditThrottler *)self _target];
  v3 = [(AXAuditThrottler *)self _selector];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [MEMORY[0x263EFF910] date];
    [(AXAuditThrottler *)self set_lastFireTime:v4];

    ((void (*)(id, const char *))[v5 methodForSelector:v3])(v5, v3);
  }
  [(AXAuditThrottler *)self set_pendingFire:0];
}

- (void)scheduleNow
{
  uint64_t v3 = [(AXAuditThrottler *)self _target];
  if (!v3) {
    return;
  }
  id v20 = (id)v3;
  id v4 = [(AXAuditThrottler *)self _target];
  if (![v4 isEqual:self])
  {
    id v5 = [(AXAuditThrottler *)self _selector];

    if (!v5) {
      return;
    }
    dispatch_time_t v6 = [MEMORY[0x263EFF910] date];
    double v7 = [(AXAuditThrottler *)self _lastFireTime];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    [(AXAuditThrottler *)self _interval];
    double v11 = v10;
    if ([(AXAuditThrottler *)self _alwaysReschedule])
    {
      [(AXAuditThrottler *)self _interval];
      double v12 = self;
    }
    else
    {
      if ([(AXAuditThrottler *)self _pendingFire]) {
        goto LABEL_18;
      }
      uint64_t v13 = [(AXAuditThrottler *)self _lastFireTime];
      if (!v13
        || (v14 = (void *)v13, [(AXAuditThrottler *)self _interval], double v16 = v15, v14, v9 >= v16))
      {
        v19 = [(AXAuditThrottler *)self _fireQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __31__AXAuditThrottler_scheduleNow__block_invoke;
        block[3] = &unk_26520D308;
        block[4] = self;
        dispatch_async(v19, block);

        goto LABEL_18;
      }
      double v17 = v11 - v9;
      [(AXAuditThrottler *)self set_pendingFire:1];
      [(AXAuditThrottler *)self _interval];
      if (v17 < 0.0 || v17 > v18) {
        [(AXAuditThrottler *)self _interval];
      }
      double v12 = self;
    }
    -[AXAuditThrottler _scheduleTimerAfterDelay:](v12, "_scheduleTimerAfterDelay:");
LABEL_18:

    return;
  }
}

uint64_t __31__AXAuditThrottler_scheduleNow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fire];
}

- (double)_interval
{
  return self->__interval;
}

- (void)set_interval:(double)a3
{
  self->__interval = a3;
}

- (NSDate)_lastFireTime
{
  return self->__lastFireTime;
}

- (void)set_lastFireTime:(id)a3
{
}

- (SEL)_selector
{
  if (self->__selector) {
    return self->__selector;
  }
  else {
    return 0;
  }
}

- (void)set_selector:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->__selector = v3;
}

- (BOOL)_alwaysReschedule
{
  return self->__alwaysReschedule;
}

- (void)set_alwaysReschedule:(BOOL)a3
{
  self->__alwaysReschedule = a3;
}

- (BOOL)_pendingFire
{
  return self->__pendingFire;
}

- (void)set_pendingFire:(BOOL)a3
{
  self->__pendingFire = a3;
}

- (NSObject)_target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__target);

  return WeakRetained;
}

- (void)set_target:(id)a3
{
}

- (void)set_fireQueue:(id)a3
{
}

- (OS_dispatch_source)_dispatchTimer
{
  return self->__dispatchTimer;
}

- (void)set_dispatchTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dispatchTimer, 0);
  objc_storeStrong((id *)&self->__fireQueue, 0);
  objc_destroyWeak((id *)&self->__target);

  objc_storeStrong((id *)&self->__lastFireTime, 0);
}

@end