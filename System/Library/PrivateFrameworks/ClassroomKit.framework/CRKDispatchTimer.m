@interface CRKDispatchTimer
+ (id)scheduledTimerWithTimerInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (CRKDispatchTimer)initWithTimeInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueue;
- (OS_dispatch_source)timerSource;
- (double)timeInterval;
- (id)fireHandler;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)setFireHandler:(id)a3;
- (void)setTimerSource:(id)a3;
- (void)timerDidFire;
@end

@implementation CRKDispatchTimer

- (void)dealloc
{
  v3 = [(CRKDispatchTimer *)self timerSource];
  dispatch_source_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)CRKDispatchTimer;
  [(CRKDispatchTimer *)&v4 dealloc];
}

- (CRKDispatchTimer)initWithTimeInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRKDispatchTimer;
  v11 = [(CRKDispatchTimer *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_timeInterval = a3;
    uint64_t v13 = MEMORY[0x22A620AF0](v10);
    id fireHandler = v12->_fireHandler;
    v12->_id fireHandler = (id)v13;

    objc_storeStrong((id *)&v12->_targetQueue, a4);
    dispatch_queue_t v15 = dispatch_queue_create(0, 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;
  }
  return v12;
}

+ (id)scheduledTimerWithTimerInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithTimeInterval:v9 queue:v8 handler:a3];

  [v10 resume];

  return v10;
}

- (void)resume
{
  v3 = [(CRKDispatchTimer *)self queue];
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
  [(CRKDispatchTimer *)self setTimerSource:v4];

  v5 = [(CRKDispatchTimer *)self timerSource];
  [(CRKDispatchTimer *)self timeInterval];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  dispatch_source_set_timer(v5, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

  objc_initWeak(&location, self);
  id v8 = [(CRKDispatchTimer *)self timerSource];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __26__CRKDispatchTimer_resume__block_invoke;
  uint64_t v13 = &unk_2646F3D40;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v8, &v10);

  id v9 = [(CRKDispatchTimer *)self timerSource];
  dispatch_resume(v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __26__CRKDispatchTimer_resume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained timerSource];
    intptr_t v3 = dispatch_source_testcancel(v2);

    id WeakRetained = v4;
    if (!v3)
    {
      [v4 timerDidFire];
      id WeakRetained = v4;
    }
  }
}

- (void)timerDidFire
{
  intptr_t v3 = [(CRKDispatchTimer *)self fireHandler];

  if (v3)
  {
    dispatch_block_t block = [(CRKDispatchTimer *)self fireHandler];
    [(CRKDispatchTimer *)self setFireHandler:0];
    id v4 = [(CRKDispatchTimer *)self targetQueue];
    dispatch_async(v4, block);
  }
}

- (void)cancel
{
  intptr_t v3 = [(CRKDispatchTimer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__CRKDispatchTimer_cancel__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __26__CRKDispatchTimer_cancel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timerSource];
  dispatch_source_cancel(v2);

  intptr_t v3 = *(void **)(a1 + 32);

  return [v3 setFireHandler:0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (id)fireHandler
{
  return self->_fireHandler;
}

- (void)setFireHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireHandler, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end