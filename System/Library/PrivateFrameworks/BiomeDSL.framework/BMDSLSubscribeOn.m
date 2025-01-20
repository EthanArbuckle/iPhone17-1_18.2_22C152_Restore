@interface BMDSLSubscribeOn
- (BMDSL)upstream;
- (BMDSLScheduler)scheduler;
- (BMDSLSubscribeOn)initWithUpstream:(id)a3 scheduler:(id)a4;
- (BOOL)completed;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (void)cancel;
- (void)reset;
- (void)subscribe:(id)a3;
@end

@implementation BMDSLSubscribeOn

- (BOOL)completed
{
  LOBYTE(self) = self->_cancelled;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (id)nextEvent
{
  os_unfair_recursive_lock_lock_with_options();
  currentPublisher = self->_currentPublisher;
  if (currentPublisher)
  {
    v4 = [(BPSPublisher *)currentPublisher nextEvent];
  }
  else
  {
    v4 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v4;
}

void __40__BMDSLSubscribeOn_startWithSubscriber___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_recursive_lock_lock_with_options();
    objc_storeStrong(WeakRetained + 1, a2);
    os_unfair_recursive_lock_unlock();
    [*(id *)(a1 + 32) requestNextEvents];
  }
}

- (BMDSLSubscribeOn)initWithUpstream:(id)a3 scheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLSubscribeOn;
  v9 = [(BMDSLSubscribeOn *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    objc_storeStrong((id *)&v10->_scheduler, a4);
    v10->_cancelled = 0;
    v10->_lock = 0;
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  id v7 = [[_BPSSubscribeOnInner alloc] initWithDownstream:v4];
  id v5 = [(BMDSLSubscribeOn *)self scheduler];
  v6 = [(BMDSLSubscribeOn *)self upstream];
  [v5 subscribeWithDSLGraph:v6 forSubscriber:v4];

  [v4 receiveSubscription:v7];
}

- (id)startWithSubscriber:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(BMDSLSubscribeOn *)self scheduler];
  v6 = [(BMDSLSubscribeOn *)self upstream];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__BMDSLSubscribeOn_startWithSubscriber___block_invoke;
  v9[3] = &unk_1E60216D8;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  [v5 subscribeWithDSLGraph:v6 publisherBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return 0;
}

- (void)cancel
{
  v3 = [(BMDSLSubscribeOn *)self scheduler];
  [v3 cancel];

  os_unfair_recursive_lock_lock_with_options();
  self->_cancelled = 1;
  os_unfair_recursive_lock_unlock();
}

- (void)reset
{
  v3 = [(BMDSLSubscribeOn *)self scheduler];
  [v3 cancel];

  os_unfair_recursive_lock_lock_with_options();
  currentPublisher = self->_currentPublisher;
  self->_currentPublisher = 0;

  self->_cancelled = 0;
  os_unfair_recursive_lock_unlock();
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (BMDSLScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_currentPublisher, 0);
}

@end