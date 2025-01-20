@interface BPSReduceProducer
+ (id)safeMutableCopy:(id)a3;
- (BOOL)cancelled;
- (BOOL)completed;
- (BOOL)downstreamRequested;
- (BOOL)empty;
- (BOOL)upstreamCompleted;
- (BPSReduceProducer)initWithDownstream:(id)a3 initial:(id)a4 reduce:(id)a5;
- (BPSSubscriber)downstream;
- (BPSSubscriptionStatus)status;
- (id)initial;
- (id)newBookmark;
- (id)receiveNewValue:(id)a3;
- (id)reduce;
- (id)result;
- (id)upstreamSubscriptions;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDownstream:(id)a3;
- (void)setDownstreamRequested:(BOOL)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setInitial:(id)a3;
- (void)setReduce:(id)a3;
- (void)setResult:(id)a3;
- (void)setStatus:(id)a3;
- (void)setUpstreamCompleted:(BOOL)a3;
- (void)upstreamSubscriptions;
@end

@implementation BPSReduceProducer

- (BPSReduceProducer)initWithDownstream:(id)a3 initial:(id)a4 reduce:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BPSReduceProducer;
  v12 = [(BPSReduceProducer *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downstream, a3);
    uint64_t v14 = +[BPSReduceProducer safeMutableCopy:v10];
    id v15 = v13->_result;
    v13->_result = (id)v14;

    uint64_t v16 = +[BPSReduceProducer safeMutableCopy:v10];
    id initial = v13->_initial;
    v13->_id initial = (id)v16;

    v18 = _Block_copy(v11);
    id reduce = v13->_reduce;
    v13->_id reduce = v18;

    v13->_downstreamRequested = 0;
    v13->_cancelled = 0;
    v13->_completed = 0;
    v13->_upstreamCompleted = 0;
    v13->_empty = 0;
    v20 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v13->_status;
    v13->_status = v20;

    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)receiveNewValue:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  uint64_t v7 = [v5 stringWithFormat:@"Override %@ in a subclass", v6];

  id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v7 userInfo:0];
  objc_exception_throw(v8);
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    uint64_t v19 = objc_opt_class();
    _os_log_impl(&dword_1AD01F000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v18, 0xCu);
  }

  os_unfair_lock_lock(&v5->_lock);
  uint64_t v7 = [(BPSReduceProducer *)v5 status];
  uint64_t v8 = [v7 state];

  if (v8 != 1)
  {
LABEL_15:
    os_unfair_lock_unlock(&v5->_lock);
    goto LABEL_16;
  }
  id v9 = [(BPSReduceProducer *)v5 status];
  [v9 setState:2];

  uint64_t v10 = [v4 state];
  if (v10 == 1)
  {
    if (![(BPSReduceProducer *)v5 cancelled]
      && ![(BPSReduceProducer *)v5 completed]
      && ![(BPSReduceProducer *)v5 upstreamCompleted])
    {
      [(BPSReduceProducer *)v5 setUpstreamCompleted:1];
      [(BPSReduceProducer *)v5 setCompleted:1];
      os_unfair_lock_unlock(&v5->_lock);
      v12 = [v4 error];
      v13 = [(BPSReduceProducer *)v5 downstream];
      uint64_t v14 = +[BPSCompletion failureWithError:v12];
      goto LABEL_23;
    }
    goto LABEL_15;
  }
  if (!v10)
  {
    if (![(BPSReduceProducer *)v5 cancelled]
      && ![(BPSReduceProducer *)v5 completed]
      && ![(BPSReduceProducer *)v5 upstreamCompleted])
    {
      [(BPSReduceProducer *)v5 setUpstreamCompleted:1];
      if ([(BPSReduceProducer *)v5 downstreamRequested]
        || [(BPSReduceProducer *)v5 empty])
      {
        int v11 = 1;
        [(BPSReduceProducer *)v5 setCompleted:1];
      }
      else
      {
        int v11 = 0;
      }
      v12 = [(BPSReduceProducer *)v5 result];
      os_unfair_lock_unlock(&v5->_lock);
      if (!v11) {
        goto LABEL_24;
      }
      if (v12)
      {
        id v15 = [(BPSReduceProducer *)v5 downstream];
        [v15 receiveInput:v12];
      }
      v13 = [(BPSReduceProducer *)v5 downstream];
      uint64_t v14 = +[BPSCompletion success];
LABEL_23:
      uint64_t v16 = (void *)v14;
      [v13 receiveCompletion:v14];

LABEL_24:
      os_unfair_lock_lock(&v5->_lock);
      v17 = [(BPSReduceProducer *)v5 status];
      [v17 setSubscription:0];

      os_unfair_lock_unlock(&v5->_lock);
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  uint64_t v7 = [(BPSReduceProducer *)v5 status];
  uint64_t v8 = [v7 state];

  if (v8 == 1)
  {
    [(BPSReduceProducer *)v5 setEmpty:0];
    os_unfair_lock_unlock(p_lock);
    id v9 = [(BPSReduceProducer *)v5 receiveNewValue:v4];
    uint64_t v10 = [v9 state];
    switch(v10)
    {
      case 0:
        os_unfair_lock_lock(p_lock);
        [(BPSReduceProducer *)v5 setUpstreamCompleted:1];
        BOOL v13 = [(BPSReduceProducer *)v5 downstreamRequested];
        if (v13) {
          [(BPSReduceProducer *)v5 setCompleted:1];
        }
        uint64_t v14 = [(BPSReduceProducer *)v5 status];
        [v14 setState:2];

        id v15 = [(BPSReduceProducer *)v5 result];
        os_unfair_lock_unlock(p_lock);
        uint64_t v16 = [(BPSReduceProducer *)v5 status];
        v17 = [v16 subscription];
        [v17 cancel];

        if (v13)
        {
          if (v15)
          {
            int v18 = [(BPSReduceProducer *)v5 downstream];
            [v18 receiveInput:v15];
          }
          uint64_t v19 = [(BPSReduceProducer *)v5 downstream];
          uint64_t v20 = +[BPSCompletion success];
          [v19 receiveCompletion:v20];
        }
        int64_t v12 = 0;

        goto LABEL_18;
      case 2:
        os_unfair_lock_lock(p_lock);
        [(BPSReduceProducer *)v5 setUpstreamCompleted:1];
        [(BPSReduceProducer *)v5 setCompleted:1];
        os_unfair_lock_unlock(p_lock);
        v21 = [(BPSReduceProducer *)v5 status];
        [v21 setState:2];

        v22 = [(BPSReduceProducer *)v5 status];
        objc_super v23 = [v22 subscription];
        [v23 cancel];

        v24 = [(BPSReduceProducer *)v5 downstream];
        v25 = [v9 error];
        v26 = +[BPSCompletion failureWithError:v25];
        [v24 receiveCompletion:v26];

        break;
      case 1:
        break;
      default:
        int v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          [(BPSReduceProducer *)(uint64_t)v5 receiveInput:v11];
        }

        int64_t v12 = 1;
        goto LABEL_18;
    }
    int64_t v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  os_unfair_lock_unlock(p_lock);
  int64_t v12 = 0;
LABEL_19:

  return v12;
}

- (void)receiveSubscription:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BPSReduceProducer *)self status];
  uint64_t v5 = [v4 state];

  if (v5)
  {
    os_unfair_lock_unlock(&self->_lock);
    v6 = [(BPSReduceProducer *)self status];
    uint64_t v7 = [v6 subscription];
    [v7 cancel];
  }
  else
  {
    uint64_t v8 = [(BPSReduceProducer *)self status];
    [v8 setState:1];

    id v9 = [(BPSReduceProducer *)self status];
    [v9 setSubscription:v11];

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v10 = [(BPSReduceProducer *)self downstream];
    [v10 receiveSubscription:self];

    [v11 requestDemand:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (void)cancel
{
  v2 = self;
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(_BPSHandleEventsInner *)(uint64_t)v2 cancel];
  }

  os_unfair_lock_lock(&v2->_lock);
  id v4 = [(BPSReduceProducer *)v2 status];
  uint64_t v5 = [v4 state];

  if (v5 == 1)
  {
    [(BPSReduceProducer *)v2 setCancelled:1];
    v6 = [(BPSReduceProducer *)v2 status];
    [v6 setState:2];

    os_unfair_lock_unlock(&v2->_lock);
    uint64_t v7 = [(BPSReduceProducer *)v2 status];
    uint64_t v8 = [v7 subscription];
    [v8 cancel];

    os_unfair_lock_lock(&v2->_lock);
    id v9 = [(BPSReduceProducer *)v2 status];
    [v9 setSubscription:0];
  }
  os_unfair_lock_unlock(&v2->_lock);
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v5 = self;
  int64_t v12 = v5;
  if (a3 <= 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:v12 file:@"BPSReduceProducer.m" lineNumber:226 description:@"Negative or zero demand requested"];

    uint64_t v5 = v12;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSReduceProducer *)v12 downstreamRequested]
    || [(BPSReduceProducer *)v12 cancelled]
    || [(BPSReduceProducer *)v12 completed]
    || ([(BPSReduceProducer *)v12 setDownstreamRequested:1],
        ![(BPSReduceProducer *)v12 upstreamCompleted]))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(BPSReduceProducer *)v12 setCompleted:1];
    uint64_t v7 = [(BPSReduceProducer *)v12 result];
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      uint64_t v8 = [(BPSReduceProducer *)v12 downstream];
      [v8 receiveInput:v7];
    }
    id v9 = [(BPSReduceProducer *)v12 downstream];
    uint64_t v10 = +[BPSCompletion success];
    [v9 receiveCompletion:v10];
  }
}

+ (id)safeMutableCopy:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    id v4 = (id)[v3 mutableCopy];
  }
  else {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)upstreamSubscriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(BPSReduceProducer *)self status];
  id v4 = [v3 subscription];

  if (v4)
  {
    uint64_t v5 = [(BPSReduceProducer *)self status];
    v6 = [v5 subscription];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(BPSReduceProducer *)(uint64_t)self upstreamSubscriptions];
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)newBookmark
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [(BPSReduceProducer *)self upstreamSubscriptions];
  id v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
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
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1F040FEE8])
        {
          uint64_t v10 = [v9 newBookmark];
          if (v10) {
            goto LABEL_13;
          }
        }
        else
        {
          id v11 = __biome_log_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v9;
            _os_log_error_impl(&dword_1AD01F000, v11, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }
        }
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
LABEL_13:
        int64_t v12 = (void *)v10;
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  BOOL v13 = [BMBookmarkNode alloc];
  id v14 = self->_result;
  id v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  v17 = [(BMBookmarkNode *)v13 initWithValue:v14 upstreams:v3 name:v16];

  return v17;
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (id)initial
{
  return self->_initial;
}

- (void)setInitial:(id)a3
{
}

- (id)reduce
{
  return self->_reduce;
}

- (void)setReduce:(id)a3
{
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (BOOL)downstreamRequested
{
  return self->_downstreamRequested;
}

- (void)setDownstreamRequested:(BOOL)a3
{
  self->_downstreamRequested = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)upstreamCompleted
{
  return self->_upstreamCompleted;
}

- (void)setUpstreamCompleted:(BOOL)a3
{
  self->_upstreamCompleted = a3;
}

- (BOOL)empty
{
  return self->_empty;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong(&self->_reduce, 0);
  objc_storeStrong(&self->_initial, 0);
  objc_storeStrong(&self->_result, 0);
}

- (void)receiveInput:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138412546;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2048;
  uint64_t v8 = [a2 state];
  _os_log_fault_impl(&dword_1AD01F000, a3, OS_LOG_TYPE_FAULT, "%@ - BPSResultState - %ld is unrecognized", (uint8_t *)&v5, 0x16u);
}

- (void)upstreamSubscriptions
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_error_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_ERROR, "%@ - Subscritpion shouldn't be nil while generating bookmark", (uint8_t *)&v3, 0xCu);
}

@end