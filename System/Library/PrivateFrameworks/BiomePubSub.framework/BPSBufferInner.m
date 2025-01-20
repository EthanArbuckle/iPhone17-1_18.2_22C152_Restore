@interface BPSBufferInner
- (BOOL)recursion;
- (BPSBufferInner)initWithDownstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6;
- (BPSCompletion)terminal;
- (BPSSubscriber)downstream;
- (BPSSubscriptionStatus)status;
- (NSMutableArray)values;
- (id)_lockedPopWithDemand:(int64_t)a3;
- (id)newBookmark;
- (id)upstreamSubscriptions;
- (int64_t)_drain;
- (int64_t)downstreamDemand;
- (int64_t)receiveInput:(id)a3;
- (unint64_t)prefetch;
- (unint64_t)size;
- (unint64_t)whenFull;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setDownstreamDemand:(int64_t)a3;
- (void)setPrefetch:(unint64_t)a3;
- (void)setRecursion:(BOOL)a3;
- (void)setSize:(unint64_t)a3;
- (void)setStatus:(id)a3;
- (void)setTerminal:(id)a3;
- (void)setValues:(id)a3;
- (void)setWhenFull:(unint64_t)a3;
@end

@implementation BPSBufferInner

- (BPSBufferInner)initWithDownstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6
{
  id v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BPSBufferInner;
  v12 = [(BPSBufferInner *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downstream, a3);
    v13->_size = a4;
    v13->_prefetch = a5;
    v13->_whenFull = a6;
    v13->_lock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    values = v13->_values;
    v13->_values = (NSMutableArray *)v14;

    v16 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v13->_status;
    v13->_status = v16;
  }
  return v13;
}

- (void)requestDemand:(int64_t)a3
{
  v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  if ([(BPSSubscriptionStatus *)v8->_status state] == 1)
  {
    v5 = [(BPSSubscriptionStatus *)v8->_status subscription];
    v8->_downstreamDemand += a3;
    BOOL recursion = v8->_recursion;
    os_unfair_lock_unlock(p_lock);
    if (!recursion)
    {
      uint64_t v7 = [(BPSBufferInner *)v8 _drain];
      if (v7 >= 1) {
        [v5 requestDemand:v7];
      }
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)cancel
{
  v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  if ([(BPSSubscriptionStatus *)v8->_status state] == 1)
  {
    v3 = [(BPSSubscriptionStatus *)v8->_status subscription];
    uint64_t v4 = +[BPSSubscriptionStatus terminal];
    status = v8->_status;
    v8->_status = (BPSSubscriptionStatus *)v4;

    uint64_t v6 = objc_opt_new();
    values = v8->_values;
    v8->_values = (NSMutableArray *)v6;

    os_unfair_lock_unlock(p_lock);
    [v3 cancel];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)receiveSubscription:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(BPSSubscriptionStatus *)self->_status state])
  {
    os_unfair_lock_unlock(&self->_lock);
    [v8 cancel];
  }
  else
  {
    uint64_t v4 = [[BPSSubscriptionStatus alloc] initWithState:1 subscription:v8];
    status = self->_status;
    self->_status = v4;

    unint64_t prefetch = self->_prefetch;
    if (prefetch == 1)
    {
      unint64_t size = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (prefetch)
    {
      unint64_t size = 0;
    }
    else
    {
      unint64_t size = self->_size;
    }
    os_unfair_lock_unlock(&self->_lock);
    [v8 requestDemand:size];
    [(BPSSubscriber *)self->_downstream receiveSubscription:self];
  }
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSSubscriptionStatus *)v5->_status state] == 1 && [(BPSCompletion *)v5->_terminal state] != 1)
  {
    if ([(NSMutableArray *)v5->_values count] >= v5->_size)
    {
      unint64_t whenFull = v5->_whenFull;
      if (!whenFull)
      {
LABEL_11:
        os_unfair_lock_unlock(p_lock);
        int64_t v7 = [(BPSBufferInner *)v5 _drain];
        goto LABEL_12;
      }
      if (whenFull == 1 && [(NSMutableArray *)v5->_values count]) {
        [(NSMutableArray *)v5->_values removeObjectAtIndex:0];
      }
    }
    if ([(NSMutableArray *)v5->_values count] < v5->_size) {
      [(NSMutableArray *)v5->_values addObject:v4];
    }
    goto LABEL_11;
  }
  os_unfair_lock_unlock(p_lock);
  int64_t v7 = 0;
LABEL_12:

  return v7;
}

- (void)receiveCompletion:(id)a3
{
  id v9 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSSubscriptionStatus *)v5->_status state] != 1) {
    goto LABEL_4;
  }
  if (v5->_terminal)
  {
    uint64_t v7 = +[BPSSubscriptionStatus terminal];
    status = v5->_status;
    v5->_status = (BPSSubscriptionStatus *)v7;

LABEL_4:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v5->_terminal, a3);
  os_unfair_lock_unlock(p_lock);
  [(BPSBufferInner *)v5 _drain];
LABEL_6:
}

- (int64_t)_drain
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(BPSSubscriptionStatus *)self->_status state] == 1)
  {
    int64_t v5 = 0;
    uint64_t v23 = 0;
    lock = p_lock;
    while (self->_downstreamDemand)
    {
      if (![(NSMutableArray *)self->_values count] && self->_terminal)
      {
        v21 = +[BPSSubscriptionStatus terminal];
        status = self->_status;
        self->_status = v21;

        os_unfair_lock_unlock(p_lock);
        [(BPSSubscriber *)self->_downstream receiveCompletion:self->_terminal];
        return v5;
      }
      uint64_t v6 = -[BPSBufferInner _lockedPopWithDemand:](self, "_lockedPopWithDemand:", self->_downstreamDemand, v23);
      self->_downstreamDemand -= [v6 count];
      if (![v6 count])
      {
        os_unfair_lock_unlock(p_lock);

        return v5;
      }
      int64_t v25 = v5;
      self->_BOOL recursion = 1;
      os_unfair_lock_unlock(p_lock);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        int v10 = 0;
        uint64_t v11 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v7);
            }
            v3 += [(BPSSubscriber *)self->_downstream receiveInput:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          }
          v10 += v9;
          uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v9);
      }
      else
      {
        int v10 = 0;
      }

      if (self->_prefetch) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v10;
      }
      p_lock = lock;
      os_unfair_lock_lock(lock);
      self->_BOOL recursion = 0;
      if (v3 >= 1) {
        self->_downstreamDemand += v3;
      }
      int64_t v5 = v13 + v25;
      os_unfair_lock_unlock(lock);

      os_unfair_lock_lock(lock);
      uint64_t v3 = v23;
      if ([(BPSSubscriptionStatus *)self->_status state] != 1) {
        goto LABEL_24;
      }
    }
    terminal = self->_terminal;
    if (terminal && [(BPSCompletion *)terminal state] == 1)
    {
      v16 = +[BPSSubscriptionStatus terminal];
      v17 = self->_status;
      self->_status = v16;

      os_unfair_lock_unlock(p_lock);
      downstream = self->_downstream;
      objc_super v19 = [(BPSCompletion *)self->_terminal error];
      v20 = +[BPSCompletion failureWithError:v19];
      [(BPSSubscriber *)downstream receiveCompletion:v20];

      return v5;
    }
  }
  else
  {
    int64_t v5 = 0;
  }
LABEL_24:
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)_lockedPopWithDemand:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || [(NSMutableArray *)self->_values count] <= (unint64_t)a3)
  {
    id v7 = self->_values;
    uint64_t v8 = (NSMutableArray *)objc_opt_new();
    values = self->_values;
    self->_values = v8;
  }
  else
  {
    int64_t v5 = a3 - 1;
    if (a3 < 1)
    {
      id v7 = 0;
    }
    else
    {
      uint64_t v6 = -[NSMutableArray subarrayWithRange:](self->_values, "subarrayWithRange:", 0, a3 - 1);
      id v7 = (NSMutableArray *)[v6 mutableCopy];

      -[NSMutableArray removeObjectsInRange:](self->_values, "removeObjectsInRange:", 0, v5);
    }
  }
  return v7;
}

- (id)newBookmark
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [(BPSBufferInner *)self upstreamSubscriptions];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1F040FEE8])
        {
          uint64_t v10 = [v9 newBookmark];
          if (v10) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v11 = __biome_log_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v25 = v9;
            _os_log_error_impl(&dword_1AD01F000, v11, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }
        }
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
LABEL_13:
        v12 = (void *)v10;
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [BMBookmarkNode alloc];
  values = self->_values;
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = [(BMBookmarkNode *)v13 initWithValue:values upstreams:v3 name:v16];

  return v17;
}

- (id)upstreamSubscriptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(BPSSubscriptionStatus *)self->_status state] == 1)
  {
    id v4 = [(BPSSubscriptionStatus *)self->_status subscription];
    os_unfair_lock_unlock(p_lock);
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_unint64_t size = a3;
}

- (unint64_t)prefetch
{
  return self->_prefetch;
}

- (void)setPrefetch:(unint64_t)a3
{
  self->_unint64_t prefetch = a3;
}

- (unint64_t)whenFull
{
  return self->_whenFull;
}

- (void)setWhenFull:(unint64_t)a3
{
  self->_unint64_t whenFull = a3;
}

- (int64_t)downstreamDemand
{
  return self->_downstreamDemand;
}

- (void)setDownstreamDemand:(int64_t)a3
{
  self->_downstreamDemand = a3;
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (BOOL)recursion
{
  return self->_recursion;
}

- (void)setRecursion:(BOOL)a3
{
  self->_BOOL recursion = a3;
}

- (BPSCompletion)terminal
{
  return self->_terminal;
}

- (void)setTerminal:(id)a3
{
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end