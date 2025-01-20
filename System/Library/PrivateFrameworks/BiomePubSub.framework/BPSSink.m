@interface BPSSink
- (BOOL)finished;
- (BPSPublisher)publisher;
- (BPSSink)initWithReceiveBookmarkCompletion:(id)a3 receiveInput:(id)a4;
- (BPSSink)initWithReceiveBookmarkedCompletion:(id)a3 receiveInput:(id)a4;
- (BPSSink)initWithReceiveCompletion:(id)a3 receiveInput:(id)a4;
- (BPSSubscriptionStatus)status;
- (id)newBookmark;
- (id)receivedCompletion;
- (id)receivedValue;
- (int64_t)demand;
- (int64_t)receiveInput:(id)a3;
- (void)_cancel;
- (void)_cancelPublisher:(id)a3;
- (void)cancel;
- (void)completeWithError:(id)a3;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestNextEvents;
- (void)setDemand:(int64_t)a3;
- (void)setFinished:(BOOL)a3;
- (void)setPublisher:(id)a3;
- (void)setReceivedCompletion:(id)a3;
- (void)setReceivedValue:(id)a3;
- (void)setStatus:(id)a3;
- (void)subscribeTo:(id)a3;
@end

@implementation BPSSink

- (BPSSink)initWithReceiveBookmarkCompletion:(id)a3 receiveInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BPSSink;
  v8 = [(BPSSink *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_demand = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = [v6 copy];
    id receivedCompletion = v9->_receivedCompletion;
    v9->_id receivedCompletion = (id)v10;

    uint64_t v12 = [v7 copy];
    id receivedValue = v9->_receivedValue;
    v9->_id receivedValue = (id)v12;

    *(void *)&v9->_lock._os_unfair_lock_opaque = 0;
    v9->_rlock.ourl_count = 0;
    v14 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v9->_status;
    v9->_status = v14;
  }
  return v9;
}

- (void)completeWithError:(id)a3
{
  id v11 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (![(BPSSink *)self finished])
  {
    v4 = [(BPSSink *)self publisher];
    int v5 = [v4 conformsToProtocol:&unk_1F0410F80];

    if (v5)
    {
      id v6 = [(BPSSink *)self publisher];
      id v7 = [v6 bookmarkNode];
    }
    else
    {
      id v7 = 0;
    }
    v8 = [(BPSSink *)self publisher];
    [v8 reset];

    v9 = [(BPSSink *)self receivedCompletion];
    if (v11) {
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:");
    }
    else {
    uint64_t v10 = +[BPSCompletion success];
    }
    ((void (**)(void, void *, void *))v9)[2](v9, v10, v7);

    [(BPSSink *)self setFinished:1];
    [(BPSSink *)self setPublisher:0];
  }
  os_unfair_recursive_lock_unlock();
}

- (void)requestNextEvents
{
  os_unfair_recursive_lock_lock_with_options();
  if (![(BPSSink *)self finished])
  {
    v3 = [(BPSSink *)self publisher];
    v4 = [v3 nextEvent];

    if (v4)
    {
      do
      {
        int v5 = (void *)MEMORY[0x1AD11D920]();
        id v6 = [(BPSSink *)self receivedValue];
        ((void (**)(void, void *))v6)[2](v6, v4);

        id v7 = [(BPSSink *)self publisher];
        uint64_t v8 = [v7 nextEvent];

        v4 = (void *)v8;
      }
      while (v8);
    }
    v9 = [(BPSSink *)self publisher];
    int v10 = [v9 completed];

    if (v10) {
      [(BPSSink *)self completeWithError:0];
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (BOOL)finished
{
  return self->_finished;
}

- (id)receivedValue
{
  return self->_receivedValue;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)receivedCompletion
{
  return self->_receivedCompletion;
}

- (void)subscribeTo:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(BPSSink *)self setPublisher:v4];
  int v5 = [(BPSSink *)self publisher];
  id v6 = [v5 startWithSubscriber:self];

  if (v6)
  {
    [(BPSSink *)self completeWithError:v6];
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v7 = (void *)getBMDSLSubscribeOnClass_softClass;
    uint64_t v13 = getBMDSLSubscribeOnClass_softClass;
    if (!getBMDSLSubscribeOnClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getBMDSLSubscribeOnClass_block_invoke;
      v9[3] = &unk_1E5E763D0;
      v9[4] = &v10;
      __getBMDSLSubscribeOnClass_block_invoke((uint64_t)v9);
      id v7 = (void *)v11[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v10, 8);
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(BPSSink *)self requestNextEvents];
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (void)setPublisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong(&self->_receivedValue, 0);
  objc_storeStrong(&self->_receivedCompletion, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (BPSSink)initWithReceiveBookmarkedCompletion:(id)a3 receiveInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__BPSSink_BMBookmark__initWithReceiveBookmarkedCompletion_receiveInput___block_invoke;
  v11[3] = &unk_1E5E760A0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  v9 = [(BPSSink *)self initWithReceiveCompletion:v11 receiveInput:v7];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __72__BPSSink_BMBookmark__initWithReceiveBookmarkedCompletion_receiveInput___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (id)[WeakRetained newBookmark];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)newBookmark
{
  v3 = [(BPSSink *)self status];
  id v4 = [v3 subscription];
  int v5 = [v4 conformsToProtocol:&unk_1F040FEE8];

  if (v5)
  {
    id v6 = [(BPSSink *)self status];
    id v7 = [v6 subscription];

    id v8 = (void *)[v7 newBookmark];
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke_cold_1((uint64_t)v8, v9);
    }
  }
  else
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(BPSDrivableSink(BMBookmark) *)self newBookmark];
    }
    id v8 = 0;
  }

  return v8;
}

- (BPSSink)initWithReceiveCompletion:(id)a3 receiveInput:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__BPSSink_initWithReceiveCompletion_receiveInput___block_invoke;
  v10[3] = &unk_1E5E761B8;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(BPSSink *)self initWithReceiveBookmarkCompletion:v10 receiveInput:a4];

  return v8;
}

uint64_t __50__BPSSink_initWithReceiveCompletion_receiveInput___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)receiveSubscription:(id)a3
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  int v5 = [(BPSSink *)self status];
  uint64_t v6 = [v5 state];

  if (v6)
  {
    os_unfair_lock_unlock(p_lock);
    [v9 cancel];
  }
  else
  {
    id v7 = [(BPSSink *)self status];
    [v7 setState:1];

    id v8 = [(BPSSink *)self status];
    [v8 setSubscription:v9];

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v9, "requestDemand:", -[BPSSink demand](self, "demand"));
  }
}

- (void)receiveCompletion:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_BPSTimerInner receiveCompletion:]();
  }

  id v7 = [(BPSSink *)v4 receivedCompletion];
  ((void (**)(void, id, void))v7)[2](v7, v5, 0);

  os_unfair_lock_lock(&v4->_lock);
  id v8 = +[BPSSubscriptionStatus terminal];
  [(BPSSink *)v4 setStatus:v8];

  os_unfair_lock_unlock(&v4->_lock);
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = [(BPSSink *)v4 receivedValue];
  ((void (**)(void, id))v6)[2](v6, v5);

  return 0;
}

- (void)cancel
{
  v3 = [(BPSSink *)self publisher];
  int v4 = BPSPipelineSupportsPullBasedPublishers(v3);

  if (v4)
  {
    [(BPSSink *)self _cancel];
  }
  else
  {
    id v5 = self;
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_BPSTimerInner cancel]();
    }

    os_unfair_lock_lock(&v5->_lock);
    id v7 = [(BPSSink *)v5 status];
    uint64_t v8 = [v7 state];

    if (v8 == 1)
    {
      id v9 = [(BPSSink *)v5 status];
      uint64_t v10 = [v9 subscription];

      id v11 = +[BPSSubscriptionStatus terminal];
      [(BPSSink *)v5 setStatus:v11];

      os_unfair_lock_unlock(&v5->_lock);
      [v10 cancel];
    }
    else
    {
      os_unfair_lock_unlock(&v5->_lock);
    }
  }
}

- (void)_cancel
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = [(BPSSink *)self publisher];
  [(BPSSink *)self _cancelPublisher:v3];

  [(BPSSink *)self completeWithError:0];
  os_unfair_recursive_lock_unlock();
}

- (void)_cancelPublisher:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 performSelector:sel_cancel];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(v4, "upstreamPublishers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BPSSink *)self _cancelPublisher:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void)setReceivedCompletion:(id)a3
{
}

- (void)setReceivedValue:(id)a3
{
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

@end