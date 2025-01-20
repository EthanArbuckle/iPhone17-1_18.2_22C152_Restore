@interface BPSDrivableSink
- (BOOL)finished;
- (BPSDrivableSink)initWithReceiveBookmarkCompletion:(id)a3 shouldContinue:(id)a4;
- (BPSDrivableSink)initWithReceiveBookmarkedCompletion:(id)a3 shouldContinue:(id)a4;
- (BPSDrivableSink)initWithReceiveCompletion:(id)a3 shouldContinue:(id)a4;
- (BPSPublisher)publisher;
- (BPSSubscriptionStatus)status;
- (id)newBookmark;
- (id)receivedCompletion;
- (id)shouldContinue;
- (int64_t)receiveInput:(id)a3;
- (void)_cancel;
- (void)_cancelPublisher:(id)a3;
- (void)cancel;
- (void)completeWithError:(id)a3;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestNextEvents;
- (void)setFinished:(BOOL)a3;
- (void)setPublisher:(id)a3;
- (void)setReceivedCompletion:(id)a3;
- (void)setShouldContinue:(id)a3;
- (void)setStatus:(id)a3;
- (void)subscribeTo:(id)a3;
@end

@implementation BPSDrivableSink

- (void)subscribeTo:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(BPSDrivableSink *)self setPublisher:v4];
  v5 = [(BPSDrivableSink *)self publisher];
  v6 = [v5 startWithSubscriber:self];

  if (v6)
  {
    [(BPSDrivableSink *)self completeWithError:v6];
  }
  else
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v7 = (void *)getBMDSLSubscribeOnClass_softClass_0;
    uint64_t v13 = getBMDSLSubscribeOnClass_softClass_0;
    if (!getBMDSLSubscribeOnClass_softClass_0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getBMDSLSubscribeOnClass_block_invoke_0;
      v9[3] = &unk_1E5E763D0;
      v9[4] = &v10;
      __getBMDSLSubscribeOnClass_block_invoke_0((uint64_t)v9);
      v7 = (void *)v11[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v10, 8);
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(BPSDrivableSink *)self requestNextEvents];
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (void)setPublisher:(id)a3
{
}

- (void)completeWithError:(id)a3
{
  id v11 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (![(BPSDrivableSink *)self finished])
  {
    id v4 = [(BPSDrivableSink *)self publisher];
    int v5 = [v4 conformsToProtocol:&unk_1F0410F80];

    if (v5)
    {
      v6 = [(BPSDrivableSink *)self publisher];
      v7 = [v6 bookmarkNode];
    }
    else
    {
      v7 = 0;
    }
    id v8 = [(BPSDrivableSink *)self publisher];
    [v8 reset];

    v9 = [(BPSDrivableSink *)self receivedCompletion];
    if (v11) {
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:");
    }
    else {
    uint64_t v10 = +[BPSCompletion success];
    }
    ((void (**)(void, void *, void *))v9)[2](v9, v10, v7);

    [(BPSDrivableSink *)self setFinished:1];
    [(BPSDrivableSink *)self setPublisher:0];
  }
  os_unfair_recursive_lock_unlock();
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void)requestNextEvents
{
  os_unfair_recursive_lock_lock_with_options();
  if (![(BPSDrivableSink *)self finished])
  {
    v3 = [(BPSDrivableSink *)self publisher];
    id v4 = [v3 nextEvent];

    if (v4)
    {
      while (1)
      {
        int v5 = (void *)MEMORY[0x1AD11D920]();
        v6 = [(BPSDrivableSink *)self shouldContinue];
        int v7 = ((uint64_t (**)(void, void *))v6)[2](v6, v4);

        if (!v7) {
          break;
        }
        id v8 = [(BPSDrivableSink *)self publisher];
        uint64_t v9 = [v8 nextEvent];

        id v4 = (void *)v9;
        if (!v9) {
          goto LABEL_5;
        }
      }
      [(BPSDrivableSink *)self completeWithError:0];
    }
    else
    {
LABEL_5:
      uint64_t v10 = [(BPSDrivableSink *)self publisher];
      int v11 = [v10 completed];

      if (v11) {
        [(BPSDrivableSink *)self completeWithError:0];
      }
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (id)shouldContinue
{
  return self->_shouldContinue;
}

- (id)receivedCompletion
{
  return self->_receivedCompletion;
}

- (BPSDrivableSink)initWithReceiveBookmarkCompletion:(id)a3 shouldContinue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BPSDrivableSink;
  id v8 = [(BPSDrivableSink *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id receivedCompletion = v8->_receivedCompletion;
    v8->_id receivedCompletion = (id)v9;

    uint64_t v11 = [v7 copy];
    id shouldContinue = v8->_shouldContinue;
    v8->_id shouldContinue = (id)v11;

    *(void *)&v8->_lock._os_unfair_lock_opaque = 0;
    v8->_rlock.ourl_count = 0;
    uint64_t v13 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v8->_status;
    v8->_status = v13;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong(&self->_shouldContinue, 0);
  objc_storeStrong(&self->_receivedCompletion, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (BPSDrivableSink)initWithReceiveBookmarkedCompletion:(id)a3 shouldContinue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke;
  v11[3] = &unk_1E5E760A0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  uint64_t v9 = [(BPSDrivableSink *)self initWithReceiveCompletion:v11 shouldContinue:v7];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (void *)[WeakRetained newBookmark];

  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke_cold_1((uint64_t)v6, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)newBookmark
{
  v3 = [(BPSDrivableSink *)self status];
  id v4 = [v3 subscription];
  int v5 = [v4 conformsToProtocol:&unk_1F040FEE8];

  if (v5)
  {
    id v6 = [(BPSDrivableSink *)self status];
    id v7 = [v6 subscription];

    id v8 = (void *)[v7 newBookmark];
    uint64_t v9 = __biome_log_for_category();
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

- (BPSDrivableSink)initWithReceiveCompletion:(id)a3 shouldContinue:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__BPSDrivableSink_initWithReceiveCompletion_shouldContinue___block_invoke;
  v10[3] = &unk_1E5E761B8;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(BPSDrivableSink *)self initWithReceiveBookmarkCompletion:v10 shouldContinue:a4];

  return v8;
}

uint64_t __60__BPSDrivableSink_initWithReceiveCompletion_shouldContinue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)receiveSubscription:(id)a3
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  int v5 = [(BPSDrivableSink *)self status];
  uint64_t v6 = [v5 state];

  if (v6)
  {
    os_unfair_lock_unlock(p_lock);
    [v9 cancel];
  }
  else
  {
    id v7 = [(BPSDrivableSink *)self status];
    [v7 setState:1];

    id v8 = [(BPSDrivableSink *)self status];
    [v8 setSubscription:v9];

    os_unfair_lock_unlock(p_lock);
    [v9 requestDemand:1];
  }
}

- (void)receiveCompletion:(id)a3
{
  id v4 = a3;
  int v5 = self;
  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_BPSTimerInner receiveCompletion:]();
  }

  os_unfair_lock_lock(&v5->_lock);
  if (![(BPSDrivableSink *)v5 finished])
  {
    os_unfair_lock_unlock(&v5->_lock);
    id v7 = [(BPSDrivableSink *)v5 receivedCompletion];
    ((void (**)(void, id, void))v7)[2](v7, v4, 0);

    os_unfair_lock_lock(&v5->_lock);
    [(BPSDrivableSink *)v5 setFinished:1];
    id v8 = +[BPSSubscriptionStatus terminal];
    [(BPSDrivableSink *)v5 setStatus:v8];
  }
  os_unfair_lock_unlock(&v5->_lock);
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = [(BPSDrivableSink *)v4 shouldContinue];
  char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v5);

  if (v7)
  {
    int64_t v8 = 1;
  }
  else
  {
    id v9 = [(BPSDrivableSink *)v4 receivedCompletion];
    uint64_t v10 = +[BPSCompletion success];
    ((void (**)(void, void *, void))v9)[2](v9, v10, 0);

    [(BPSDrivableSink *)v4 cancel];
    os_unfair_lock_lock(&v4->_lock);
    [(BPSDrivableSink *)v4 setFinished:1];
    os_unfair_lock_unlock(&v4->_lock);
    int64_t v8 = 0;
  }

  return v8;
}

- (void)cancel
{
  v3 = [(BPSDrivableSink *)self publisher];
  int v4 = BPSPipelineSupportsPullBasedPublishers(v3);

  if (v4)
  {
    [(BPSDrivableSink *)self _cancel];
  }
  else
  {
    id v5 = self;
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_BPSTimerInner cancel]();
    }

    os_unfair_lock_lock(&v5->_lock);
    char v7 = [(BPSDrivableSink *)v5 status];
    uint64_t v8 = [v7 state];

    if (v8 == 1)
    {
      id v9 = [(BPSDrivableSink *)v5 status];
      uint64_t v10 = [v9 subscription];

      id v11 = +[BPSSubscriptionStatus terminal];
      [(BPSDrivableSink *)v5 setStatus:v11];

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
  v3 = [(BPSDrivableSink *)self publisher];
  [(BPSDrivableSink *)self _cancelPublisher:v3];

  [(BPSDrivableSink *)self completeWithError:0];
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
        [(BPSDrivableSink *)self _cancelPublisher:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
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

- (void)setShouldContinue:(id)a3
{
}

void __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "Creating bookmark:\n%@", (uint8_t *)&v2, 0xCu);
}

@end