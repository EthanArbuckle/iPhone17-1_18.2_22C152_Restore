@interface ATCountSessionTask
- (ATCountSessionTask)initWithMaximumCount:(unint64_t)a3;
- (void)start;
@end

@implementation ATCountSessionTask

- (void).cxx_destruct
{
}

- (void)start
{
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v5, v6, 0x3B9ACA00uLL, 0);
  v7 = self->_timer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __27__ATCountSessionTask_start__block_invoke;
  handler[3] = &unk_1E6B8C468;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_timer);
}

void __27__ATCountSessionTask_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedItemCount:", objc_msgSend(*(id *)(a1 + 32), "completedItemCount") + 1);
  uint64_t v2 = [*(id *)(a1 + 32) completedItemCount];
  if (v2 == [*(id *)(a1 + 32) totalItemCount])
  {
    [*(id *)(a1 + 32) setFinished:1];
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 168);
    dispatch_suspend(v3);
  }
}

- (ATCountSessionTask)initWithMaximumCount:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ATCountSessionTask;
  v4 = [(ATSessionTask *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ATSessionTask *)v4 setTotalItemCount:a3];
  }
  return v5;
}

@end