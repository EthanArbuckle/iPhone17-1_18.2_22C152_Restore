@interface FMDispatchTimer
- (FMDispatchTimer)initWithQueue:(id)a3 timeout:(double)a4 completion:(id)a5;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timerSource;
- (double)leewayTimeInterval;
- (double)timeout;
- (id)completion;
- (void)cancel;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setLeewayTimeInterval:(double)a3;
- (void)setQueue:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimerSource:(id)a3;
- (void)start;
@end

@implementation FMDispatchTimer

- (FMDispatchTimer)initWithQueue:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FMDispatchTimer;
  v10 = [(FMDispatchTimer *)&v18 init];
  if (v10)
  {
    if (v8)
    {
      v11 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v11;
    }
    else
    {
      v13 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v14 = MEMORY[0x1E4F14428];
      queue = v10->_queue;
      v10->_queue = v13;
    }

    v10->_timeout = a4;
    uint64_t v15 = MEMORY[0x1D25F2CB0](v9);
    id completion = v10->_completion;
    v10->_id completion = (id)v15;

    v10->_leewayTimeInterval = 1.0;
  }

  return v10;
}

- (void)dealloc
{
  timerSource = self->_timerSource;
  if (timerSource) {
    dispatch_source_cancel(timerSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)FMDispatchTimer;
  [(FMDispatchTimer *)&v4 dealloc];
}

- (void)start
{
  v3 = [(FMDispatchTimer *)self queue];
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  [(FMDispatchTimer *)self setTimerSource:v4];

  objc_initWeak(&location, self);
  v5 = [(FMDispatchTimer *)self timerSource];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __24__FMDispatchTimer_start__block_invoke;
  v16 = &unk_1E689E6E0;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v5, &v13);

  [(FMDispatchTimer *)self timeout];
  double v7 = v6;
  [(FMDispatchTimer *)self leewayTimeInterval];
  double v9 = v8;
  v10 = [(FMDispatchTimer *)self timerSource];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v9 * 1000000000.0));

  v12 = [(FMDispatchTimer *)self timerSource];
  dispatch_resume(v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __24__FMDispatchTimer_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained completion];
  v2 = (void *)v1;
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
}

- (void)cancel
{
  v3 = [(FMDispatchTimer *)self timerSource];

  if (v3)
  {
    dispatch_source_t v4 = [(FMDispatchTimer *)self timerSource];
    dispatch_source_cancel(v4);

    [(FMDispatchTimer *)self setTimerSource:0];
  }
}

- (double)leewayTimeInterval
{
  return self->_leewayTimeInterval;
}

- (void)setLeewayTimeInterval:(double)a3
{
  self->_leewayTimeInterval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end