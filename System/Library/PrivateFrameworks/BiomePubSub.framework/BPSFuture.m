@interface BPSFuture
- (BOOL)completed;
- (BOOL)sentResult;
- (BPSFuture)initWithAttemptToFulfill:(id)a3;
- (BPSFutureResult)result;
- (BPSSubscriber)subscriber;
- (BPSSubscriberList)downstreams;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (id)upstreamPublishers;
- (os_unfair_recursive_lock_s)publisherLock;
- (void)disassociate:(int64_t)a3;
- (void)reset;
- (void)setDownstreams:(id)a3;
- (void)setPublisherLock:(os_unfair_recursive_lock_s)a3;
- (void)setResult:(id)a3;
- (void)setSentResult:(BOOL)a3;
- (void)setSubscriber:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSFuture

- (BPSFuture)initWithAttemptToFulfill:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v15.receiver = self;
  v15.super_class = (Class)BPSFuture;
  v5 = [(BPSFuture *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    downstreams = v5->_downstreams;
    v5->_downstreams = (BPSSubscriberList *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_publisherLock = 0;
    v8 = v5->_result;
    v5->_result = 0;

    v5->_sentResult = 0;
    objc_initWeak(&location, v5);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__BPSFuture_initWithAttemptToFulfill___block_invoke;
    aBlock[3] = &unk_1E5E76568;
    objc_copyWeak(&v13, &location);
    v12 = v5;
    v9 = _Block_copy(aBlock);
    v4[2](v4, v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __38__BPSFuture_initWithAttemptToFulfill___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (BPSPipelineSupportsPullBasedPublishers(*(void **)(a1 + 32)))
    {
      os_unfair_recursive_lock_lock_with_options();
      [*(id *)(a1 + 32) setResult:v3];
      v5 = [*(id *)(a1 + 32) subscriber];
      [v5 requestNextEvents];

      os_unfair_recursive_lock_unlock();
    }
    else
    {
      os_unfair_lock_lock(WeakRetained + 2);
      uint64_t v6 = [*(id *)(a1 + 32) result];

      if (v6)
      {
        os_unfair_lock_unlock(WeakRetained + 2);
      }
      else
      {
        [*(id *)(a1 + 32) setResult:v3];
        v7 = [*(id *)(a1 + 32) downstreams];
        v8 = [v7 claimAll];

        os_unfair_lock_unlock(WeakRetained + 2);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "fulfill:", v3, (void)v14);
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v11);
        }
      }
    }
  }
}

- (void)subscribe:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = [(BPSFuture *)self result];
  if (v9)
  {
    os_unfair_lock_unlock(p_lock);
    uint64_t v6 = [[_BPSInnerFutureConduit alloc] initWithParent:self downstream:v5];
    [v5 receiveSubscription:v6];

    [(_BPSInnerFutureConduit *)v6 fulfill:v9];
  }
  else
  {
    uint64_t v6 = [[_BPSInnerFutureConduit alloc] initWithParent:self downstream:v5];
    v7 = [(BPSFuture *)self downstreams];
    uint64_t v8 = [v7 appendElement:v6];

    [(_BPSInnerFutureConduit *)v6 assignIdentity:v8];
    os_unfair_lock_unlock(p_lock);
    [v5 receiveSubscription:v6];
  }
}

- (void)disassociate:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(BPSFuture *)self downstreams];
  [v6 removeTicket:a3];

  os_unfair_lock_unlock(p_lock);
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)startWithSubscriber:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(BPSFuture *)self setSubscriber:v4];

  os_unfair_recursive_lock_unlock();
  return 0;
}

- (id)nextEvent
{
  os_unfair_recursive_lock_lock_with_options();
  if ([(BPSFuture *)self sentResult]
    || ([(BPSFuture *)self result], id v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    id v5 = 0;
  }
  else
  {
    [(BPSFuture *)self setSentResult:1];
    id v4 = [(BPSFuture *)self result];
    id v5 = [v4 value];
  }
  os_unfair_recursive_lock_unlock();
  return v5;
}

- (BOOL)completed
{
  LOBYTE(self) = [(BPSFuture *)self sentResult];
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)reset
{
  os_unfair_recursive_lock_lock_with_options();
  [(BPSFuture *)self setResult:0];
  [(BPSFuture *)self setSentResult:0];
  os_unfair_recursive_lock_unlock();
}

- (BPSSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
}

- (os_unfair_recursive_lock_s)publisherLock
{
  return self->_publisherLock;
}

- (void)setPublisherLock:(os_unfair_recursive_lock_s)a3
{
  self->_publisherLock = a3;
}

- (BOOL)sentResult
{
  return self->_sentResult;
}

- (void)setSentResult:(BOOL)a3
{
  self->_sentResult = a3;
}

- (BPSSubscriberList)downstreams
{
  return self->_downstreams;
}

- (void)setDownstreams:(id)a3
{
}

- (BPSFutureResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_downstreams, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
}

@end