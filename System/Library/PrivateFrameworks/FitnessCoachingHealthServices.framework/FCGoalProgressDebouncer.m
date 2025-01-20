@interface FCGoalProgressDebouncer
- (BOOL)inProgress;
- (FCGoalProgressDebouncer)initWithServiceQueue:(id)a3;
- (FCGoalProgressDebouncerDelegate)delegate;
- (void)_handleTimerFired;
- (void)debounce;
- (void)setDelegate:(id)a3;
@end

@implementation FCGoalProgressDebouncer

- (FCGoalProgressDebouncer)initWithServiceQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCGoalProgressDebouncer;
  v6 = [(FCGoalProgressDebouncer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceQueue, a3);
  }

  return v7;
}

- (BOOL)inProgress
{
  return self->_timer != 0;
}

- (void)debounce
{
  if (!self->_timer)
  {
    objc_initWeak(location, self);
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_serviceQueue);
    timer = self->_timer;
    self->_timer = v3;

    id v5 = self->_timer;
    dispatch_time_t v6 = dispatch_time(0, 2147483647000000000);
    dispatch_source_set_timer(v5, v6, 0x1DCD64FFC4653600uLL, 0);
    v7 = self->_timer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __35__FCGoalProgressDebouncer_debounce__block_invoke;
    handler[3] = &unk_1E69B84D8;
    objc_copyWeak(&v11, location);
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  _HKInitializeLogging();
  objc_super v9 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_1D3B3E000, v9, OS_LOG_TYPE_DEFAULT, "Goal progress debounce pushed", (uint8_t *)location, 2u);
  }
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v8, 0x1DCD64FFC4653600uLL, 0);
}

void __35__FCGoalProgressDebouncer_debounce__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTimerFired];
}

- (void)_handleTimerFired
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D3B3E000, v5, OS_LOG_TYPE_DEFAULT, "Goal progress debounce finished", v7, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained debouncerDidFinishDebounce:self];
}

- (FCGoalProgressDebouncerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCGoalProgressDebouncerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end