@interface DCSelectorDelayer
- (BOOL)callOnMainThread;
- (BOOL)isScheduledToFire;
- (BOOL)waitToFireUntilRequestsStop;
- (DCSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7;
- (OS_dispatch_queue)requestQueue;
- (SEL)selector;
- (double)delay;
- (id)fireBlock;
- (id)target;
- (void)_cancelFireRequests;
- (void)callTargetSelector;
- (void)cancelPreviousFireRequests;
- (void)dealloc;
- (void)fireImmediately;
- (void)requestFire;
- (void)setCallOnMainThread:(BOOL)a3;
- (void)setDelay:(double)a3;
- (void)setFireBlock:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setWaitToFireUntilRequestsStop:(BOOL)a3;
@end

@implementation DCSelectorDelayer

- (DCSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DCSelectorDelayer;
  v13 = [(DCSelectorDelayer *)&v18 init];
  v14 = v13;
  if (v13)
  {
    [(DCSelectorDelayer *)v13 setTarget:v12];
    [(DCSelectorDelayer *)v14 setSelector:a4];
    [(DCSelectorDelayer *)v14 setDelay:a5];
    [(DCSelectorDelayer *)v14 setWaitToFireUntilRequestsStop:v8];
    [(DCSelectorDelayer *)v14 setCallOnMainThread:v7];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.notes.coalescer.requests", v15);
    [(DCSelectorDelayer *)v14 setRequestQueue:v16];
  }
  return v14;
}

- (void)dealloc
{
  v3 = [(DCSelectorDelayer *)self requestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__DCSelectorDelayer_dealloc__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)DCSelectorDelayer;
  [(DCSelectorDelayer *)&v4 dealloc];
}

uint64_t __28__DCSelectorDelayer_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFireRequests];
}

- (void)requestFire
{
  v3 = [(DCSelectorDelayer *)self requestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__DCSelectorDelayer_requestFire__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __32__DCSelectorDelayer_requestFire__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) waitToFireUntilRequestsStop];
  v3 = [*(id *)(a1 + 32) fireBlock];
  objc_super v4 = v3;
  if (v2)
  {

    if (v4) {
      [*(id *)(a1 + 32) _cancelFireRequests];
    }
  }
  else
  {

    if (v4) {
      return;
    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __32__DCSelectorDelayer_requestFire__block_invoke_2;
  v14 = &unk_2642A9450;
  objc_copyWeak(&v15, &location);
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &v11);
  objc_msgSend(*(id *)(a1 + 32), "setFireBlock:", v5, v11, v12, v13, v14);

  if ([*(id *)(a1 + 32) callOnMainThread])
  {
    v6 = MEMORY[0x263EF83A0];
    id v7 = MEMORY[0x263EF83A0];
  }
  else
  {
    v6 = dispatch_get_global_queue(0, 0);
  }
  [*(id *)(a1 + 32) delay];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  v10 = [*(id *)(a1 + 32) fireBlock];
  dispatch_after(v9, v6, v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __32__DCSelectorDelayer_requestFire__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained requestQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__DCSelectorDelayer_requestFire__block_invoke_3;
    block[3] = &unk_2642A9250;
    id v4 = v2;
    id v6 = v4;
    dispatch_sync(v3, block);

    [v4 callTargetSelector];
  }
}

uint64_t __32__DCSelectorDelayer_requestFire__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFireBlock:0];
}

- (void)fireImmediately
{
  v3 = [(DCSelectorDelayer *)self requestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__DCSelectorDelayer_fireImmediately__block_invoke;
  block[3] = &unk_2642A9250;
  void block[4] = self;
  dispatch_sync(v3, block);

  if ([(DCSelectorDelayer *)self callOnMainThread])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __36__DCSelectorDelayer_fireImmediately__block_invoke_2;
    v4[3] = &unk_2642A9250;
    v4[4] = self;
    dc_performBlockOnMainThread(v4);
  }
  else
  {
    [(DCSelectorDelayer *)self callTargetSelector];
  }
}

uint64_t __36__DCSelectorDelayer_fireImmediately__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFireRequests];
}

uint64_t __36__DCSelectorDelayer_fireImmediately__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callTargetSelector];
}

- (void)callTargetSelector
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "imp";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

- (BOOL)isScheduledToFire
{
  int v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(DCSelectorDelayer *)self requestQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__DCSelectorDelayer_isScheduledToFire__block_invoke;
  v5[3] = &unk_2642A9650;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__DCSelectorDelayer_isScheduledToFire__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) fireBlock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (void)cancelPreviousFireRequests
{
  uint64_t v3 = [(DCSelectorDelayer *)self requestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DCSelectorDelayer_cancelPreviousFireRequests__block_invoke;
  block[3] = &unk_2642A9250;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __47__DCSelectorDelayer_cancelPreviousFireRequests__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFireRequests];
}

- (void)_cancelFireRequests
{
  uint64_t v3 = [(DCSelectorDelayer *)self fireBlock];

  if (v3)
  {
    id v4 = [(DCSelectorDelayer *)self fireBlock];
    dispatch_block_cancel(v4);

    [(DCSelectorDelayer *)self setFireBlock:0];
  }
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_selector = v3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)waitToFireUntilRequestsStop
{
  return self->_waitToFireUntilRequestsStop;
}

- (void)setWaitToFireUntilRequestsStop:(BOOL)a3
{
  self->_waitToFireUntilRequestsStop = a3;
}

- (BOOL)callOnMainThread
{
  return self->_callOnMainThread;
}

- (void)setCallOnMainThread:(BOOL)a3
{
  self->_callOnMainThread = a3;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);

  objc_destroyWeak(&self->_target);
}

@end