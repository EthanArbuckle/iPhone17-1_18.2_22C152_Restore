@interface _BPSAbstractZip
- (BOOL)cancelled;
- (BOOL)errored;
- (BOOL)finished;
- (BOOL)recursive;
- (BPSSubscriber)downstream;
- (NSMutableArray)buffers;
- (NSMutableArray)subscriptions;
- (NSMutableArray)upstreamFinished;
- (_BPSAbstractZip)initWithDownstream:(id)a3 upstreamCount:(int64_t)a4;
- (id)convertValues:(id)a3;
- (int64_t)pendingDemand;
- (int64_t)receiveInput:(id)a3 index:(int64_t)a4;
- (int64_t)upstreamCount;
- (void)cancel;
- (void)lockSendCompletion:(id)a3 index:(int64_t)a4;
- (void)receiveCompletion:(id)a3 index:(int64_t)a4;
- (void)receiveSubscription:(id)a3 index:(int64_t)a4;
- (void)requestDemand:(int64_t)a3;
- (void)resolvePendingDemandAndUnlock;
- (void)setBuffers:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setDownstream:(id)a3;
- (void)setErrored:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setPendingDemand:(int64_t)a3;
- (void)setRecursive:(BOOL)a3;
- (void)setSubscriptions:(id)a3;
- (void)setUpstreamCount:(int64_t)a3;
- (void)setUpstreamFinished:(id)a3;
@end

@implementation _BPSAbstractZip

- (_BPSAbstractZip)initWithDownstream:(id)a3 upstreamCount:(int64_t)a4
{
  id v22 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_BPSAbstractZip;
  v7 = [(_BPSAbstractZip *)&v23 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_downstream, a3);
    v8->_upstreamCount = a4;
    v9 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v10 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    buffers = v8->_buffers;
    v8->_buffers = (NSMutableArray *)v10;

    uint64_t v12 = [v9 mutableCopy];
    upstreamFinished = v8->_upstreamFinished;
    v8->_upstreamFinished = (NSMutableArray *)v12;

    uint64_t v14 = [v9 mutableCopy];
    subscriptions = v8->_subscriptions;
    v8->_subscriptions = (NSMutableArray *)v14;

    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_downstreamLock = 0;
    if (a4 >= 1)
    {
      uint64_t v16 = MEMORY[0x1E4F1CC28];
      do
      {
        v17 = v8->_subscriptions;
        v18 = [MEMORY[0x1E4F1CA98] null];
        [(NSMutableArray *)v17 addObject:v18];

        v19 = v8->_buffers;
        v20 = (void *)[v9 mutableCopy];
        [(NSMutableArray *)v19 addObject:v20];

        [(NSMutableArray *)v8->_upstreamFinished addObject:v16];
        --a4;
      }
      while (a4);
    }
  }

  return v8;
}

- (void)receiveSubscription:(id)a3 index:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([(_BPSAbstractZip *)self upstreamCount] <= a4)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"BPSZip.m" lineNumber:56 description:@"Index should be less than upstream count"];
  }
  os_unfair_lock_lock(&self->_lock);
  if ([(_BPSAbstractZip *)self cancelled]) {
    goto LABEL_16;
  }
  if ([(_BPSAbstractZip *)self errored]) {
    goto LABEL_16;
  }
  if ([(_BPSAbstractZip *)self finished]) {
    goto LABEL_16;
  }
  v8 = [(_BPSAbstractZip *)self subscriptions];
  v9 = [v8 objectAtIndexedSubscript:a4];
  uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
LABEL_16:
    os_unfair_lock_unlock(&self->_lock);
    [v7 cancel];
  }
  else
  {
    uint64_t v12 = [(_BPSAbstractZip *)self subscriptions];
    [v12 setObject:v7 atIndexedSubscript:a4];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = [(_BPSAbstractZip *)self subscriptions];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v22 + 1) + 8 * v17);
          v19 = [MEMORY[0x1E4F1CA98] null];
          LOBYTE(v18) = [v18 isEqual:v19];

          if (v18)
          {

            [(_BPSAbstractZip *)self setRecursive:0];
            os_unfair_lock_unlock(&self->_lock);
            goto LABEL_17;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    [(_BPSAbstractZip *)self setRecursive:1];
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_recursive_lock_lock_with_options();
    v20 = [(_BPSAbstractZip *)self downstream];
    [v20 receiveSubscription:self];

    os_unfair_recursive_lock_unlock();
    os_unfair_lock_lock(&self->_lock);
    [(_BPSAbstractZip *)self setRecursive:0];
    [(_BPSAbstractZip *)self resolvePendingDemandAndUnlock];
  }
LABEL_17:
}

- (int64_t)receiveInput:(id)a3 index:(int64_t)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = self;
  if ([(_BPSAbstractZip *)v8 upstreamCount] <= a4)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2 object:v8 file:@"BPSZip.m" lineNumber:97 description:@"Expecting Index to be less than upstream count"];
  }
  os_unfair_lock_lock(&v8->_lock);
  if ([(_BPSAbstractZip *)v8 cancelled]
    || [(_BPSAbstractZip *)v8 errored]
    || [(_BPSAbstractZip *)v8 finished])
  {
LABEL_37:
    os_unfair_lock_unlock(&v8->_lock);
LABEL_38:
    int64_t v29 = 0;
  }
  else
  {
    v9 = [(_BPSAbstractZip *)v8 buffers];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a4];
    [v10 addObject:v7];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    char v11 = [(_BPSAbstractZip *)v8 buffers];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
    int64_t v48 = a4;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v54;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v54 != v14) {
            objc_enumerationMutation(v11);
          }
          if (![*(id *)(*((void *)&v53 + 1) + 8 * i) count])
          {

            if ([(_BPSAbstractZip *)v8 upstreamCount] >= 1)
            {
              uint64_t v37 = 0;
              while (1)
              {
                v38 = [(_BPSAbstractZip *)v8 upstreamFinished];
                v39 = [v38 objectAtIndexedSubscript:v37];

                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 && ([v39 BOOLValue])
                {
                  v40 = [(_BPSAbstractZip *)v8 buffers];
                  v41 = [v40 objectAtIndexedSubscript:v37];
                  uint64_t v42 = [v41 count];

                  if (!v42)
                  {
                    [(_BPSAbstractZip *)v8 setFinished:1];
                    v44 = +[BPSCompletion success];
                    [(_BPSAbstractZip *)v8 lockSendCompletion:v44 index:v48];

                    goto LABEL_38;
                  }
                }
                else
                {
                }
                if (++v37 >= [(_BPSAbstractZip *)v8 upstreamCount]) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_37;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    id v47 = v7;

    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v17 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v18 = (void *)[v16 mutableCopy];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v19 = [(_BPSAbstractZip *)v8 buffers];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          long long v25 = [v24 objectAtIndexedSubscript:0];
          [v24 removeObjectAtIndex:0];
          [v18 addObject:v25];
          v26 = (void *)[v24 mutableCopy];
          [v17 addObject:v26];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v21);
    }

    [(_BPSAbstractZip *)v8 setBuffers:v17];
    [(_BPSAbstractZip *)v8 setRecursive:1];
    os_unfair_lock_unlock(&v8->_lock);
    uint64_t v27 = [(_BPSAbstractZip *)v8 convertValues:v18];
    os_unfair_recursive_lock_lock_with_options();
    v28 = [(_BPSAbstractZip *)v8 downstream];
    int64_t v29 = [v28 receiveInput:v27];

    os_unfair_recursive_lock_unlock();
    os_unfair_lock_lock(&v8->_lock);
    [(_BPSAbstractZip *)v8 setRecursive:0];
    [(_BPSAbstractZip *)v8 setPendingDemand:0];
    if (v29 < 1)
    {
      os_unfair_lock_unlock(&v8->_lock);
      int64_t v29 = 0;
    }
    else
    {
      v46 = v27;
      v30 = [(_BPSAbstractZip *)v8 subscriptions];
      v31 = (void *)[v30 copy];

      os_unfair_lock_unlock(&v8->_lock);
      int64_t v32 = v48;
      if ([v31 count] >= 1)
      {
        uint64_t v33 = 0;
        do
        {
          v34 = [v31 objectAtIndexedSubscript:v33];
          if (v32 != v33)
          {
            v35 = [MEMORY[0x1E4F1CA98] null];
            char v36 = [v34 isEqual:v35];

            int64_t v32 = v48;
            if ((v36 & 1) == 0) {
              [v34 requestDemand:v29];
            }
          }

          ++v33;
        }
        while (v33 < [v31 count]);
      }

      uint64_t v27 = v46;
    }

    id v7 = v47;
  }

  return v29;
}

- (void)receiveCompletion:(id)a3 index:(int64_t)a4
{
  id v12 = a3;
  v6 = self;
  os_unfair_lock_lock(&v6->_lock);
  if ([(_BPSAbstractZip *)v6 cancelled]
    || [(_BPSAbstractZip *)v6 errored]
    || [(_BPSAbstractZip *)v6 finished])
  {
    goto LABEL_4;
  }
  uint64_t v7 = [v12 state];
  if (v7 == 1)
  {
    [(_BPSAbstractZip *)v6 setErrored:1];
  }
  else
  {
    if (v7) {
      goto LABEL_5;
    }
    v8 = [(_BPSAbstractZip *)v6 upstreamFinished];
    [v8 setObject:MEMORY[0x1E4F1CC38] atIndexedSubscript:a4];

    v9 = [(_BPSAbstractZip *)v6 buffers];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a4];
    uint64_t v11 = [v10 count];

    if (v11)
    {
LABEL_4:
      os_unfair_lock_unlock(&v6->_lock);
      goto LABEL_5;
    }
    [(_BPSAbstractZip *)v6 setFinished:1];
  }
  [(_BPSAbstractZip *)v6 lockSendCompletion:v12 index:a4];
LABEL_5:
}

- (void)lockSendCompletion:(id)a3 index:(int64_t)a4
{
  id v16 = a3;
  v5 = [(_BPSAbstractZip *)self subscriptions];
  v6 = (void *)[v5 copy];

  if ([(_BPSAbstractZip *)self upstreamCount] >= 1)
  {
    int64_t v7 = 0;
    v8 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      v9 = (void *)[v8 mutableCopy];
      uint64_t v10 = [(_BPSAbstractZip *)self buffers];
      [v10 setObject:v9 atIndexedSubscript:v7];

      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      id v12 = [(_BPSAbstractZip *)self subscriptions];
      [v12 setObject:v11 atIndexedSubscript:v7];

      ++v7;
    }
    while (v7 < [(_BPSAbstractZip *)self upstreamCount]);
  }
  [(_BPSAbstractZip *)self setRecursive:1];
  os_unfair_lock_unlock(&self->_lock);
  if ([v6 count])
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [v6 objectAtIndexedSubscript:v13];
      if ([v14 conformsToProtocol:&unk_1F040FDC0]) {
        [v14 cancel];
      }

      ++v13;
    }
    while (v13 < [v6 count]);
  }
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v15 = [(_BPSAbstractZip *)self downstream];
  [v15 receiveCompletion:v16];

  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock(&self->_lock);
  [(_BPSAbstractZip *)self setRecursive:0];
  [(_BPSAbstractZip *)self resolvePendingDemandAndUnlock];
}

- (void)cancel
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = self;
  p_lock = &v2->_lock;
  os_unfair_lock_lock(&v2->_lock);
  if ([(_BPSAbstractZip *)v2 cancelled])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = [(_BPSAbstractZip *)v2 subscriptions];
    v5 = (void *)[v4 copy];

    [(_BPSAbstractZip *)v2 setCancelled:1];
    if ([(_BPSAbstractZip *)v2 upstreamCount] >= 1)
    {
      uint64_t v6 = 0;
      int64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
      do
      {
        v8 = (void *)[v7 mutableCopy];
        v9 = [(_BPSAbstractZip *)v2 buffers];
        [v9 setObject:v8 atIndexedSubscript:v6];

        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v11 = [(_BPSAbstractZip *)v2 subscriptions];
        [v11 setObject:v10 atIndexedSubscript:v6];

        ++v6;
      }
      while (v6 < [(_BPSAbstractZip *)v2 upstreamCount]);
    }
    os_unfair_lock_unlock(p_lock);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            objc_msgSend(v17, "cancel", (void)v18);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (void)resolvePendingDemandAndUnlock
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(_BPSAbstractZip *)self subscriptions];
  v4 = (void *)[v3 copy];

  uint64_t v5 = [(_BPSAbstractZip *)self pendingDemand];
  [(_BPSAbstractZip *)self setPendingDemand:0];
  os_unfair_lock_unlock(&self->_lock);
  if (v5 >= 1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            objc_msgSend(v11, "requestDemand:", v5, (void)v12);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self;
  if (a3 <= 0)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:v5 file:@"BPSZip.m" lineNumber:272 description:@"Demand should be greater than 0"];
  }
  os_unfair_lock_lock(&v5->_lock);
  if ([(_BPSAbstractZip *)v5 recursive])
  {
    [(_BPSAbstractZip *)v5 setPendingDemand:[(_BPSAbstractZip *)v5 pendingDemand] + a3];
LABEL_8:
    os_unfair_lock_unlock(&v5->_lock);
    goto LABEL_9;
  }
  if ([(_BPSAbstractZip *)v5 cancelled]
    || [(_BPSAbstractZip *)v5 errored]
    || [(_BPSAbstractZip *)v5 finished])
  {
    goto LABEL_8;
  }
  id v6 = [(_BPSAbstractZip *)v5 subscriptions];
  uint64_t v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(&v5->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          objc_msgSend(v13, "requestDemand:", a3, (void)v15);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

LABEL_9:
}

- (id)convertValues:(id)a3
{
  return 0;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)errored
{
  return self->_errored;
}

- (void)setErrored:(BOOL)a3
{
  self->_errored = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableArray)upstreamFinished
{
  return self->_upstreamFinished;
}

- (void)setUpstreamFinished:(id)a3
{
}

- (int64_t)upstreamCount
{
  return self->_upstreamCount;
}

- (void)setUpstreamCount:(int64_t)a3
{
  self->_upstreamCount = a3;
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (int64_t)pendingDemand
{
  return self->_pendingDemand;
}

- (void)setPendingDemand:(int64_t)a3
{
  self->_pendingDemand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstreamFinished, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end