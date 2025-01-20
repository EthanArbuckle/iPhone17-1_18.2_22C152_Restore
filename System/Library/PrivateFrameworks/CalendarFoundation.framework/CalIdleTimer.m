@interface CalIdleTimer
- (CalIdleTimer)initWithQueue:(id)a3 timeoutInSeconds:(unint64_t)a4 leewayInSeconds:(unint64_t)a5 timeoutBlock:(id)a6;
- (void)cancel;
- (void)poke;
- (void)start;
@end

@implementation CalIdleTimer

- (CalIdleTimer)initWithQueue:(id)a3 timeoutInSeconds:(unint64_t)a4 leewayInSeconds:(unint64_t)a5 timeoutBlock:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CalIdleTimer;
  v13 = [(CalIdleTimer *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    uint64_t v15 = MEMORY[0x192FD8850](v12);
    id timeoutBlock = v14->_timeoutBlock;
    v14->_id timeoutBlock = (id)v15;

    v14->_timeoutInSeconds = a4;
    v14->_leewayInSeconds = a5;
  }

  return v14;
}

- (void)start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_timer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v3;

    objc_initWeak(&location, self);
    v5 = self->_timer;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __21__CalIdleTimer_start__block_invoke;
    v9 = &unk_1E56CDCB0;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v5, &v6);
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  [(CalIdleTimer *)self poke];
}

void __21__CalIdleTimer_start__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained cancel];
    (*(void (**)(void))(v2[2] + 16))();
    WeakRetained = v2;
  }
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)poke
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timer = self->_timer;
  if (timer)
  {
    int64_t v4 = 1000000000 * self->_timeoutInSeconds;
    uint64_t v5 = 1000000000 * self->_leewayInSeconds;
    dispatch_time_t v6 = dispatch_time(0, v4);
    dispatch_source_set_timer(timer, v6, 0xFFFFFFFFFFFFFFFFLL, v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end