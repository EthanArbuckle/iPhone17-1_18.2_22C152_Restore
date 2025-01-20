@interface DMTimer
- (DMTimer)initWithSecondsBeforeFirstFire:(unint64_t)a3 secondsOfLeeway:(unint64_t)a4 fireBlock:(id)a5;
- (OS_dispatch_source)timer;
- (id)fireBlock;
- (unint64_t)secondsBeforeFirstFire;
- (unint64_t)secondsOfLeeway;
- (void)cancel;
- (void)cancelSynchronously;
- (void)resume;
- (void)setFireBlock:(id)a3;
- (void)setSecondsBeforeFirstFire:(unint64_t)a3;
- (void)setSecondsOfLeeway:(unint64_t)a3;
- (void)setTimer:(id)a3;
@end

@implementation DMTimer

- (DMTimer)initWithSecondsBeforeFirstFire:(unint64_t)a3 secondsOfLeeway:(unint64_t)a4 fireBlock:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)DMTimer;
  v9 = [(DMTimer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(DMTimer *)v9 setTimer:0];
    [(DMTimer *)v10 setFireBlock:v8];
    [(DMTimer *)v10 setSecondsBeforeFirstFire:a3];
    [(DMTimer *)v10 setSecondsOfLeeway:a4];
  }

  return v10;
}

- (void)resume
{
  __assert_rtn("-[DMTimer resume]", "DMTimer.m", 35, "self.timer == nil");
}

void __17__DMTimer_resume__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fireBlock];
  uint64_t v3 = v2[2](v2, *(void *)(a1 + 32));

  v4 = [*(id *)(a1 + 32) timer];
  intptr_t v5 = dispatch_source_testcancel(v4);

  if (!v5)
  {
    source = [*(id *)(a1 + 32) timer];
    dispatch_time_t v6 = dispatch_time(0, 1000000000 * v3);
    dispatch_source_set_timer(source, v6, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * [*(id *)(a1 + 32) secondsOfLeeway]);
  }
}

- (void)cancel
{
  v2 = [(DMTimer *)self timer];
  dispatch_source_cancel(v2);
}

- (void)cancelSynchronously
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(DMTimer *)self cancel];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__DMTimer_cancelSynchronously__block_invoke;
    block[3] = &unk_1E6C1E0D0;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __30__DMTimer_cancelSynchronously__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
}

- (unint64_t)secondsBeforeFirstFire
{
  return self->_secondsBeforeFirstFire;
}

- (void)setSecondsBeforeFirstFire:(unint64_t)a3
{
  self->_secondsBeforeFirstFire = a3;
}

- (unint64_t)secondsOfLeeway
{
  return self->_secondsOfLeeway;
}

- (void)setSecondsOfLeeway:(unint64_t)a3
{
  self->_secondsOfLeeway = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end