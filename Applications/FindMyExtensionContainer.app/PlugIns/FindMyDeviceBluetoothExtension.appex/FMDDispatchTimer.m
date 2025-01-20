@interface FMDDispatchTimer
- (FMDDispatchTimer)initWithQueue:(id)a3 timeout:(double)a4 completion:(id)a5;
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

@implementation FMDDispatchTimer

- (FMDDispatchTimer)initWithQueue:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FMDDispatchTimer;
  v10 = [(FMDDispatchTimer *)&v17 init];
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
      id v13 = &_dispatch_main_q;
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)&_dispatch_main_q;
    }

    v10->_timeout = a4;
    id v14 = objc_retainBlock(v9);
    id completion = v10->_completion;
    v10->_id completion = v14;

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
  v4.super_class = (Class)FMDDispatchTimer;
  [(FMDDispatchTimer *)&v4 dealloc];
}

- (void)start
{
  v3 = [(FMDDispatchTimer *)self queue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  [(FMDDispatchTimer *)self setTimerSource:v4];

  objc_initWeak(&location, self);
  v5 = [(FMDDispatchTimer *)self timerSource];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1000118AC;
  v16 = &unk_100021598;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v5, &v13);

  [(FMDDispatchTimer *)self timeout];
  double v7 = v6;
  [(FMDDispatchTimer *)self leewayTimeInterval];
  double v9 = v8;
  v10 = [(FMDDispatchTimer *)self timerSource];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v9 * 1000000000.0));

  v12 = [(FMDDispatchTimer *)self timerSource];
  dispatch_resume(v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  v3 = [(FMDDispatchTimer *)self timerSource];

  if (v3)
  {
    dispatch_source_t v4 = [(FMDDispatchTimer *)self timerSource];
    dispatch_source_cancel(v4);

    [(FMDDispatchTimer *)self setTimerSource:0];
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