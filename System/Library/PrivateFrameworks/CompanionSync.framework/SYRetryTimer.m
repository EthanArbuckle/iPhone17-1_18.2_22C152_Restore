@interface SYRetryTimer
- (BOOL)incrementBackoff;
- (SYRetryTimer)initWithInterval:(double)a3 backoffFactor:(double)a4 maxRetries:(int)a5 queue:(id)a6 callout:(id)a7;
- (void)cancel;
@end

@implementation SYRetryTimer

- (SYRetryTimer)initWithInterval:(double)a3 backoffFactor:(double)a4 maxRetries:(int)a5 queue:(id)a6 callout:(id)a7
{
  v12 = a6;
  id v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SYRetryTimer;
  v14 = [(SYRetryTimer *)&v27 init];
  v15 = v14;
  if (v14)
  {
    v14->_interval = a3;
    v14->_backoffFactor = a4;
    v14->_maxRetries = a5;
    v14->_numRetries = 0;
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v12);
    timer = v15->_timer;
    v15->_timer = (OS_dispatch_source *)v16;

    v18 = v15->_timer;
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    objc_initWeak(&location, v15);
    v20 = v15->_timer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __72__SYRetryTimer_initWithInterval_backoffFactor_maxRetries_queue_callout___block_invoke;
    handler[3] = &unk_264422EB0;
    objc_copyWeak(&v25, &location);
    id v24 = v13;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume((dispatch_object_t)v15->_timer);
    v21 = v15;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __72__SYRetryTimer_initWithInterval_backoffFactor_maxRetries_queue_callout___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    ++WeakRetained[9];
    v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }
}

- (BOOL)incrementBackoff
{
  int maxRetries = self->_maxRetries;
  int numRetries = self->_numRetries;
  if (numRetries < maxRetries)
  {
    double v4 = self->_backoffFactor * self->_interval;
    self->_interval = v4;
    timer = self->_timer;
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    dispatch_source_set_timer(timer, v6, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  }
  return numRetries < maxRetries;
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end