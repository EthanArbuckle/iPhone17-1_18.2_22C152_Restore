@interface IRTimer
- (IRTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6;
- (OS_dispatch_source)timerSource;
- (void)dealloc;
- (void)invalidate;
- (void)setTimerSource:(id)a3;
@end

@implementation IRTimer

- (IRTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  BOOL v7 = a4;
  v10 = a5;
  id v11 = a6;
  v29.receiver = self;
  v29.super_class = (Class)IRTimer;
  v12 = [(IRTimer *)&v29 init];
  if (v12)
  {
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v10);
    [(IRTimer *)v12 setTimerSource:v13];

    double v14 = a3 * 1000000000.0;
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)v14);
    if (v7) {
      uint64_t v16 = (unint64_t)v14;
    }
    else {
      uint64_t v16 = -1;
    }
    v17 = [(IRTimer *)v12 timerSource];
    dispatch_source_set_timer(v17, v15, v16, 0x989680uLL);

    objc_initWeak(&location, v12);
    v18 = [(IRTimer *)v12 timerSource];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __48__IRTimer_initWithInterval_repeats_queue_block___block_invoke;
    v24 = &unk_2653A0AA0;
    id v25 = v11;
    BOOL v27 = v7;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v18, &v21);

    v19 = [(IRTimer *)v12 timerSource];
    dispatch_activate(v19);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

void __48__IRTimer_initWithInterval_repeats_queue_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained invalidate];
  }
}

- (void)dealloc
{
  [(IRTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)IRTimer;
  [(IRTimer *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = [(IRTimer *)self timerSource];

  if (v3)
  {
    v4 = [(IRTimer *)self timerSource];
    dispatch_source_cancel(v4);

    [(IRTimer *)self setTimerSource:0];
  }
}

- (void).cxx_destruct
{
}

@end