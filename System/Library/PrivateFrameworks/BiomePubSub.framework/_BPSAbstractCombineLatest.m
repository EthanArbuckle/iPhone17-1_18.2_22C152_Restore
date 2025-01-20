@interface _BPSAbstractCombineLatest
- (BOOL)cancelled;
- (BOOL)errored;
- (BOOL)finished;
- (BOOL)recursion;
- (BPSSubscriber)downstream;
- (NSMutableArray)buffers;
- (NSMutableArray)subscriptions;
- (_BPSAbstractCombineLatest)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4;
- (id)convertValues:(id)a3;
- (int64_t)demand;
- (int64_t)receiveInput:(id)a3 atIndex:(unint64_t)a4;
- (unint64_t)finishCount;
- (unint64_t)upstreamCount;
- (void)cancel;
- (void)receiveCompletion:(id)a3 atIndex:(unint64_t)a4;
- (void)receiveSubscription:(id)a3 atIndex:(unint64_t)a4;
- (void)requestDemand:(int64_t)a3;
- (void)setBuffers:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setErrored:(BOOL)a3;
- (void)setFinishCount:(unint64_t)a3;
- (void)setFinished:(BOOL)a3;
- (void)setRecursion:(BOOL)a3;
- (void)setSubscriptions:(id)a3;
- (void)setUpstreamCount:(unint64_t)a3;
@end

@implementation _BPSAbstractCombineLatest

- (_BPSAbstractCombineLatest)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_BPSAbstractCombineLatest;
  v8 = [(_BPSAbstractCombineLatest *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_downstream, a3);
    v9->_upstreamCount = a4;
    v9->_recursion = 0;
    v9->_finished = 0;
    v9->_errored = 0;
    v9->_cancelled = 0;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSMutableArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    buffers = v9->_buffers;
    v9->_buffers = (NSMutableArray *)v12;

    v9->_demand = 0;
    v9->_lock._os_unfair_lock_opaque = 0;
    for (v9->_downstreamLock = 0; a4; --a4)
    {
      v14 = v9->_subscriptions;
      v15 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableArray *)v14 addObject:v15];

      v16 = v9->_buffers;
      v17 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableArray *)v16 addObject:v17];
    }
  }

  return v9;
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = self;
  if (a3 <= 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:v5 file:@"BPSCombineLatest.m" lineNumber:66 description:@"Expecting demand to be greater than 0"];
  }
  os_unfair_lock_lock(&v5->_lock);
  if ([(_BPSAbstractCombineLatest *)v5 cancelled] || [(_BPSAbstractCombineLatest *)v5 finished])
  {
    os_unfair_lock_unlock(&v5->_lock);
  }
  else
  {
    v6 = [(_BPSAbstractCombineLatest *)v5 subscriptions];
    id v7 = (void *)[v6 copy];

    [(_BPSAbstractCombineLatest *)v5 setDemand:[(_BPSAbstractCombineLatest *)v5 demand] + a3];
    os_unfair_lock_unlock(&v5->_lock);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
          v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v17);
          char v15 = [v13 isEqual:v14];

          if ((v15 & 1) == 0) {
            [v13 requestDemand:a3];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)receiveSubscription:(id)a3 atIndex:(unint64_t)a4
{
  id v14 = a3;
  if ([(_BPSAbstractCombineLatest *)self upstreamCount] <= a4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"BPSCombineLatest.m" lineNumber:89 description:@"Index should be less than upstream count"];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(_BPSAbstractCombineLatest *)self cancelled]) {
    goto LABEL_6;
  }
  id v8 = [(_BPSAbstractCombineLatest *)self subscriptions];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a4];
  uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
LABEL_6:
    os_unfair_lock_unlock(&self->_lock);
    NSLog(&cfstr_ShouldCancelSu.isa);
    [v14 cancel];
  }
  else
  {
    uint64_t v12 = [(_BPSAbstractCombineLatest *)self subscriptions];
    [v12 setObject:v14 atIndexedSubscript:a4];

    os_unfair_lock_unlock(p_lock);
  }
}

- (int64_t)receiveInput:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = self;
  if ([(_BPSAbstractCombineLatest *)v8 upstreamCount] <= a4)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:v8 file:@"BPSCombineLatest.m" lineNumber:105 description:@"Index should be less than upstream count"];
  }
  os_unfair_lock_lock(&v8->_lock);
  if ([(_BPSAbstractCombineLatest *)v8 cancelled] || [(_BPSAbstractCombineLatest *)v8 finished]) {
    goto LABEL_22;
  }
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:v8 file:@"BPSCombineLatest.m" lineNumber:113 description:@"value can't be nil"];
  }
  uint64_t v9 = [(_BPSAbstractCombineLatest *)v8 buffers];
  [v9 setObject:v7 atIndexedSubscript:a4];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [(_BPSAbstractCombineLatest *)v8 buffers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v11) = 1;
          goto LABEL_17;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if ([(_BPSAbstractCombineLatest *)v8 recursion]
    || ([(_BPSAbstractCombineLatest *)v8 demand] < 1 ? (char v14 = 1) : (char v14 = v11), (v14 & 1) != 0))
  {
LABEL_22:
    os_unfair_lock_unlock(&v8->_lock);
  }
  else
  {
    [(_BPSAbstractCombineLatest *)v8 setDemand:[(_BPSAbstractCombineLatest *)v8 demand] - 1];
    v16 = [(_BPSAbstractCombineLatest *)v8 buffers];
    os_unfair_lock_unlock(&v8->_lock);
    long long v17 = [(_BPSAbstractCombineLatest *)v8 convertValues:v16];
    os_unfair_lock_lock(&v8->_lock);
    [(_BPSAbstractCombineLatest *)v8 setRecursion:1];
    os_unfair_lock_unlock(&v8->_lock);
    os_unfair_recursive_lock_lock_with_options();
    long long v18 = [(_BPSAbstractCombineLatest *)v8 downstream];
    uint64_t v19 = [v18 receiveInput:v17];

    os_unfair_recursive_lock_unlock();
    os_unfair_lock_lock(&v8->_lock);
    [(_BPSAbstractCombineLatest *)v8 setRecursion:0];
    if (v19 >= 1) {
      [(_BPSAbstractCombineLatest *)v8 setDemand:[(_BPSAbstractCombineLatest *)v8 demand] + v19];
    }
    os_unfair_lock_unlock(&v8->_lock);
  }
  return 0;
}

- (void)receiveCompletion:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = [v6 state];
  if (v8 == 1)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_opt_class();
      id v28 = v27;
      v29 = [v6 error];
      *(_DWORD *)buf = 138412802;
      v32 = v27;
      __int16 v33 = 2048;
      unint64_t v34 = a4;
      __int16 v35 = 2112;
      v36 = v29;
      _os_log_error_impl(&dword_1AD01F000, v16, OS_LOG_TYPE_ERROR, "%@ - Complete at index: %lud with error: %@", buf, 0x20u);
    }
    os_unfair_lock_lock(&v7->_lock);
    [(_BPSAbstractCombineLatest *)v7 setFinished:1];
    [(_BPSAbstractCombineLatest *)v7 setErrored:1];
    long long v17 = (void *)MEMORY[0x1E4F1C978];
    long long v18 = [(_BPSAbstractCombineLatest *)v7 subscriptions];
    uint64_t v19 = [v17 arrayWithArray:v18];

    if ([v19 count])
    {
      unint64_t v20 = 0;
      do
      {
        v21 = [MEMORY[0x1E4F1CA98] null];
        long long v22 = [(_BPSAbstractCombineLatest *)v7 subscriptions];
        [v22 setObject:v21 atIndexedSubscript:v20];

        ++v20;
      }
      while ([v19 count] > v20);
    }
    if ([(_BPSAbstractCombineLatest *)v7 upstreamCount])
    {
      unint64_t v23 = 0;
      do
      {
        long long v24 = [MEMORY[0x1E4F1CA98] null];
        long long v25 = [(_BPSAbstractCombineLatest *)v7 buffers];
        [v25 setObject:v24 atIndexedSubscript:v23];

        ++v23;
      }
      while (v23 < [(_BPSAbstractCombineLatest *)v7 upstreamCount]);
    }
    os_unfair_lock_unlock(&v7->_lock);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __55___BPSAbstractCombineLatest_receiveCompletion_atIndex___block_invoke;
    v30[3] = &__block_descriptor_40_e32_v32__0__BPSSubscription_8Q16_B24l;
    v30[4] = a4;
    [v19 enumerateObjectsUsingBlock:v30];
    os_unfair_recursive_lock_lock_with_options();
    v26 = [(_BPSAbstractCombineLatest *)v7 downstream];
    [v26 receiveCompletion:v6];

    os_unfair_recursive_lock_unlock();
  }
  else if (!v8)
  {
    os_unfair_lock_lock(&v7->_lock);
    if ([(_BPSAbstractCombineLatest *)v7 finished]) {
      goto LABEL_18;
    }
    [(_BPSAbstractCombineLatest *)v7 setFinishCount:[(_BPSAbstractCombineLatest *)v7 finishCount] + 1];
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v10 = [(_BPSAbstractCombineLatest *)v7 subscriptions];
    [v10 setObject:v9 atIndexedSubscript:a4];

    uint64_t v11 = [(_BPSAbstractCombineLatest *)v7 finishCount];
    if (v11 != [(_BPSAbstractCombineLatest *)v7 upstreamCount])
    {
LABEL_18:
      os_unfair_lock_unlock(&v7->_lock);
    }
    else
    {
      [(_BPSAbstractCombineLatest *)v7 setFinished:1];
      if ([(_BPSAbstractCombineLatest *)v7 upstreamCount])
      {
        unint64_t v12 = 0;
        do
        {
          v13 = [MEMORY[0x1E4F1CA98] null];
          char v14 = [(_BPSAbstractCombineLatest *)v7 buffers];
          [v14 setObject:v13 atIndexedSubscript:v12];

          ++v12;
        }
        while (v12 < [(_BPSAbstractCombineLatest *)v7 upstreamCount]);
      }
      os_unfair_lock_unlock(&v7->_lock);
      os_unfair_recursive_lock_lock_with_options();
      char v15 = [(_BPSAbstractCombineLatest *)v7 downstream];
      [v15 receiveCompletion:v6];

      os_unfair_recursive_lock_unlock();
    }
  }
}

- (id)convertValues:(id)a3
{
  return 0;
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "%@ - Cancel", (uint8_t *)&v4, 0xCu);
}

- (unint64_t)upstreamCount
{
  return self->_upstreamCount;
}

- (void)setUpstreamCount:(unint64_t)a3
{
  self->_upstreamCount = a3;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
}

- (BOOL)recursion
{
  return self->_recursion;
}

- (void)setRecursion:(BOOL)a3
{
  self->_recursion = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)errored
{
  return self->_errored;
}

- (void)setErrored:(BOOL)a3
{
  self->_errored = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (unint64_t)finishCount
{
  return self->_finishCount;
}

- (void)setFinishCount:(unint64_t)a3
{
  self->_finishCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end