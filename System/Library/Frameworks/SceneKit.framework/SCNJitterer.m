@interface SCNJitterer
+ (void)initialize;
- (BOOL)isAborting;
- (BOOL)isEnabled;
- (SCNJitterer)initWithDelegate:(id)a3;
- (void)dealloc;
- (void)delegateWillDie;
- (void)jitter;
- (void)restart;
- (void)setEnabled:(BOOL)a3;
- (void)stopIfNeeded;
- (void)update;
@end

@implementation SCNJitterer

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      self->_enabled = 1;
      [(SCNJitterer *)self restart];
    }
    else
    {
      [(SCNJitterer *)self stopIfNeeded];
      self->_enabled = 0;
    }
  }
}

- (void)restart
{
  if (self->_enabled)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __22__SCNJitterer_restart__block_invoke;
    block[3] = &unk_264004DF8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)_updateQueue, block);
  }
}

- (SCNJitterer)initWithDelegate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCNJitterer;
  v4 = [(SCNJitterer *)&v10 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, a3);
    v5->_restartSourceIsSuspended = 1;
    v5->_state = 3;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3052000000;
    v9[3] = __Block_byref_object_copy__0;
    v9[4] = __Block_byref_object_dispose__0;
    v9[5] = v5;
    v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)_updateQueue);
    v5->_restartSource = (OS_dispatch_source *)v6;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __32__SCNJitterer_initWithDelegate___block_invoke;
    handler[3] = &unk_264004AF0;
    handler[4] = v9;
    dispatch_source_set_event_handler(v6, handler);
    _Block_object_dispose(v9, 8);
  }
  return v5;
}

uint64_t __32__SCNJitterer_initWithDelegate___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16) = 1;
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) update];
}

+ (void)initialize
{
  _updateQueue = (uint64_t)dispatch_queue_create("com.apple.scenekit.jitteringUpdateQueue", 0);
}

void __22__SCNJitterer_restart__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    v3 = *(NSObject **)(v1 + 48);
    dispatch_time_t v4 = dispatch_time(0, 100000000);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  }
}

- (void)update
{
  id Weak = objc_loadWeak((id *)&self->_delegate);
  unint64_t state = self->_state;
  if (state)
  {
    if (state != 1) {
      return;
    }
    self->_iteration = 0;
    if (![Weak _canJitter]) {
      return;
    }
    self->_unint64_t state = 0;
  }

  [(SCNJitterer *)self jitter];
}

- (void)dealloc
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__SCNJitterer_dealloc__block_invoke;
  block[3] = &unk_264004DF8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_updateQueue, block);
  v3 = dispatch_semaphore_create(0);
  restartSource = self->_restartSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __22__SCNJitterer_dealloc__block_invoke_2;
  handler[3] = &unk_264004DF8;
  handler[4] = v3;
  dispatch_source_set_cancel_handler(restartSource, handler);
  dispatch_source_cancel((dispatch_source_t)self->_restartSource);
  dispatch_release((dispatch_object_t)self->_restartSource);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)SCNJitterer;
  [(SCNJitterer *)&v5 dealloc];
}

void __22__SCNJitterer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32)) {
    dispatch_resume(*(dispatch_object_t *)(v1 + 48));
  }
}

intptr_t __22__SCNJitterer_dealloc__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)delegateWillDie
{
  objc_storeWeak((id *)&self->_delegate, 0);
  if (self->_state <= 1) {
    self->_unint64_t state = 2;
  }
  v3 = _updateQueue;

  dispatch_sync(v3, &__block_literal_global_12);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isAborting
{
  return self->_state == 2;
}

- (void)jitter
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "_iteration <= C3DJitteringIterationCount";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. invalid iteration count", (uint8_t *)&v1, 0xCu);
}

uint64_t __21__SCNJitterer_jitter__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) update];
}

void __21__SCNJitterer_jitter__block_invoke_2(uint64_t a1)
{
}

- (void)stopIfNeeded
{
  if (self->_enabled)
  {
    if (self->_state <= 1) {
      self->_unint64_t state = 2;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__SCNJitterer_stopIfNeeded__block_invoke;
    block[3] = &unk_264004DF8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)_updateQueue, block);
  }
}

void __27__SCNJitterer_stopIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    dispatch_suspend(*(dispatch_object_t *)(v1 + 48));
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  }
}

@end