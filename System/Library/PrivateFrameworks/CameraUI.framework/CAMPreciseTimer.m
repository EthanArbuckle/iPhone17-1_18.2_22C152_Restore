@interface CAMPreciseTimer
- (BOOL)fired;
- (CAMPreciseTimer)init;
- (CAMPreciseTimer)initWithDelay:(double)a3 interval:(double)a4 handler:(id)a5;
- (OS_dispatch_source)_currentTimer;
- (double)delay;
- (double)interval;
- (id)_handler;
- (void)_setCurrentTimer:(id)a3;
- (void)_setFired:(BOOL)a3;
- (void)invalidate;
- (void)start;
@end

@implementation CAMPreciseTimer

- (CAMPreciseTimer)initWithDelay:(double)a3 interval:(double)a4 handler:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CAMPreciseTimer;
  v9 = [(CAMPreciseTimer *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_delay = a3;
    v9->_interval = a4;
    uint64_t v11 = [v8 copy];
    id handler = v10->__handler;
    v10->__id handler = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (void)start
{
  if (self->__currentTimer) {
    [(CAMPreciseTimer *)self invalidate];
  }
  [(CAMPreciseTimer *)self _setFired:0];
  [(CAMPreciseTimer *)self delay];
  double v4 = v3;
  [(CAMPreciseTimer *)self interval];
  double v6 = v5;
  v7 = [(CAMPreciseTimer *)self _handler];
  id v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  dispatch_source_set_timer(v8, v9, (unint64_t)(v6 * 1000000000.0), 0);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __24__CAMPreciseTimer_start__block_invoke;
  handler[3] = &unk_263FA28F8;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(v8);
  [(CAMPreciseTimer *)self _setCurrentTimer:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_setFired:(BOOL)a3
{
  self->_fired = a3;
}

- (double)delay
{
  return self->_delay;
}

- (double)interval
{
  return self->_interval;
}

- (id)_handler
{
  return self->__handler;
}

- (void)_setCurrentTimer:(id)a3
{
}

- (void)invalidate
{
  double v3 = [(CAMPreciseTimer *)self _currentTimer];
  if (v3)
  {
    double v4 = v3;
    dispatch_source_cancel(v3);
    [(CAMPreciseTimer *)self _setCurrentTimer:0];
    double v3 = v4;
  }
}

- (OS_dispatch_source)_currentTimer
{
  return self->__currentTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentTimer, 0);
  objc_storeStrong(&self->__handler, 0);
}

- (CAMPreciseTimer)init
{
  return [(CAMPreciseTimer *)self initWithDelay:0 interval:0.0 handler:0.0];
}

void __24__CAMPreciseTimer_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setFired:1];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);
  }
}

- (BOOL)fired
{
  return self->_fired;
}

@end