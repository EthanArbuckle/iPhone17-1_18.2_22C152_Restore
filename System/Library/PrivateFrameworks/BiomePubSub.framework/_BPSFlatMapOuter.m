@interface _BPSFlatMapOuter
- (BMBookmark)outerBookmark;
- (BOOL)cancelledOrCompleted;
- (BOOL)downstreamRecursive;
- (BOOL)innerRecursive;
- (BOOL)outerFinished;
- (BPSSubscriber)downstream;
- (BPSSubscription)outerSubscription;
- (NSMutableArray)buffer;
- (NSMutableDictionary)subscriptions;
- (_BPSFlatMapOuter)initWithDownstream:(id)a3 maxPublishers:(int64_t)a4 map:(id)a5;
- (id)map;
- (id)newBookmark;
- (id)upstreamSubscriptions;
- (int64_t)downstreamDemand;
- (int64_t)maxPublishers;
- (int64_t)nextInnerIndex;
- (int64_t)pendingSubscriptions;
- (int64_t)receiveInnerInput:(id)a3 index:(int64_t)a4;
- (int64_t)receiveInput:(id)a3;
- (void)_updateBookmarkWhenLocked;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveInnerCompletion:(id)a3 index:(int64_t)a4;
- (void)receiveInnerSubscription:(id)a3 index:(int64_t)a4;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setBuffer:(id)a3;
- (void)setCancelledOrCompleted:(BOOL)a3;
- (void)setDownstream:(id)a3;
- (void)setDownstreamDemand:(int64_t)a3;
- (void)setDownstreamRecursive:(BOOL)a3;
- (void)setInnerRecursive:(BOOL)a3;
- (void)setMap:(id)a3;
- (void)setMaxPublishers:(int64_t)a3;
- (void)setNextInnerIndex:(int64_t)a3;
- (void)setOuterBookmark:(id)a3;
- (void)setOuterFinished:(BOOL)a3;
- (void)setOuterSubscription:(id)a3;
- (void)setPendingSubscriptions:(int64_t)a3;
- (void)setSubscriptions:(id)a3;
@end

@implementation _BPSFlatMapOuter

- (_BPSFlatMapOuter)initWithDownstream:(id)a3 maxPublishers:(int64_t)a4 map:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_BPSFlatMapOuter;
  v11 = [(_BPSFlatMapOuter *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downstream, a3);
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    outerBookmark = v12->_outerBookmark;
    v12->_outerBookmark = (BMBookmark *)v13;

    uint64_t v15 = objc_opt_new();
    subscriptions = v12->_subscriptions;
    v12->_subscriptions = (NSMutableDictionary *)v15;

    v12->_maxPublishers = a4;
    uint64_t v17 = [v10 copy];
    id map = v12->_map;
    v12->_id map = (id)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    buffer = v12->_buffer;
    v12->_buffer = (NSMutableArray *)v19;

    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_outerLock._os_unfair_lock_opaque = 0;
    v12->_downstreamLock = 0;
  }

  return v12;
}

- (void)receiveSubscription:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(_BPSFlatMapOuter *)self outerSubscription];
  if (v4)
  {

LABEL_4:
    os_unfair_lock_unlock(&self->_lock);
    [v5 cancel];
    goto LABEL_6;
  }
  if ([(_BPSFlatMapOuter *)self cancelledOrCompleted]) {
    goto LABEL_4;
  }
  os_unfair_lock_unlock(&self->_lock);
  [(_BPSFlatMapOuter *)self setOuterSubscription:v5];
  objc_msgSend(v5, "requestDemand:", -[_BPSFlatMapOuter maxPublishers](self, "maxPublishers"));
LABEL_6:
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = a3;
  id v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  BOOL v7 = [(_BPSFlatMapOuter *)v5 cancelledOrCompleted];
  os_unfair_lock_unlock(&v5->_lock);
  if (!v7)
  {
    v8 = [(_BPSFlatMapOuter *)v5 map];
    id v9 = ((void (**)(void, id))v8)[2](v8, v4);

    uint64_t v10 = [(_BPSFlatMapOuter *)v5 nextInnerIndex];
    [(_BPSFlatMapOuter *)v5 setNextInnerIndex:[(_BPSFlatMapOuter *)v5 nextInnerIndex] + 1];
    os_unfair_lock_lock(p_lock);
    [(_BPSFlatMapOuter *)v5 setPendingSubscriptions:[(_BPSFlatMapOuter *)v5 pendingSubscriptions] + 1];
    os_unfair_lock_unlock(p_lock);
    v11 = [[_BPSFlatMapSide alloc] initWithIndex:v10 outer:v5];
    [v9 subscribe:v11];
  }
  return 0;
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  [(_BPSFlatMapOuter *)v5 setOuterFinished:1];
  [(_BPSFlatMapOuter *)v5 _updateBookmarkWhenLocked];
  [(_BPSFlatMapOuter *)v5 setOuterSubscription:0];
  uint64_t v7 = [v4 state];
  if (v7 == 1)
  {
    BOOL v11 = [(_BPSFlatMapOuter *)v5 cancelledOrCompleted];
    [(_BPSFlatMapOuter *)v5 setCancelledOrCompleted:1];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v12 = [(_BPSFlatMapOuter *)v5 subscriptions];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v18 = [(_BPSFlatMapOuter *)v5 subscriptions];
          uint64_t v19 = [v18 objectForKeyedSubscript:v17];

          [v19 cancel];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    v20 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    [(_BPSFlatMapOuter *)v5 setSubscriptions:v20];

    os_unfair_lock_unlock(p_lock);
    if (!v11)
    {
      os_unfair_recursive_lock_lock_with_options();
      v21 = [(_BPSFlatMapOuter *)v5 downstream];
      objc_super v22 = [v4 error];
      v23 = +[BPSCompletion failureWithError:v22];
      [v21 receiveCompletion:v23];

LABEL_19:
      os_unfair_recursive_lock_unlock();
    }
  }
  else if (!v7)
  {
    v8 = [(_BPSFlatMapOuter *)v5 buffer];
    if (v8)
    {
      id v9 = [(_BPSFlatMapOuter *)v5 buffer];
      BOOL v10 = [v9 count] != 0;
    }
    else
    {
      BOOL v10 = 0;
    }

    if ([(_BPSFlatMapOuter *)v5 cancelledOrCompleted]
      || v10
      || ([(_BPSFlatMapOuter *)v5 subscriptions],
          v24 = objc_claimAutoreleasedReturnValue(),
          uint64_t v25 = [v24 count],
          uint64_t v26 = [(_BPSFlatMapOuter *)v5 pendingSubscriptions],
          v24,
          v25 + v26))
    {
      os_unfair_lock_unlock(p_lock);
      goto LABEL_21;
    }
    [(_BPSFlatMapOuter *)v5 setCancelledOrCompleted:1];
    os_unfair_lock_unlock(p_lock);
    os_unfair_recursive_lock_lock_with_options();
    v21 = [(_BPSFlatMapOuter *)v5 downstream];
    v27 = +[BPSCompletion success];
    [v21 receiveCompletion:v27];

    goto LABEL_19;
  }
LABEL_21:
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = self;
  if (a3 <= 0)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2 object:v5 file:@"BPSFlatMap.m" lineNumber:164 description:@"Zero or negative demand requested"];
  }
  if ([(_BPSFlatMapOuter *)v5 downstreamRecursive])
  {
    [(_BPSFlatMapOuter *)v5 setDownstreamDemand:[(_BPSFlatMapOuter *)v5 downstreamDemand] + a3];
  }
  else
  {
    os_unfair_lock_lock(&v5->_lock);
    if ([(_BPSFlatMapOuter *)v5 cancelledOrCompleted]) {
      goto LABEL_40;
    }
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(_BPSFlatMapOuter *)v5 setDownstreamDemand:0x7FFFFFFFFFFFFFFFLL];
      v6 = [(_BPSFlatMapOuter *)v5 buffer];
      uint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      [(_BPSFlatMapOuter *)v5 setBuffer:v7];

      v48 = [(_BPSFlatMapOuter *)v5 subscriptions];
      os_unfair_lock_unlock(&v5->_lock);
      os_unfair_recursive_lock_lock_with_options();
      [(_BPSFlatMapOuter *)v5 setDownstreamRecursive:1];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v54 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v14 = [(_BPSFlatMapOuter *)v5 downstream];
            uint64_t v15 = [v13 second];
            [v14 receiveInput:v15];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v10);
      }

      [(_BPSFlatMapOuter *)v5 setDownstreamRecursive:0];
      os_unfair_recursive_lock_unlock();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v16 = v48;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v50 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [v16 objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * j)];
            [v21 requestDemand:0x7FFFFFFFFFFFFFFFLL];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v18);
      }

      os_unfair_lock_lock(&v5->_lock);
    }
    else
    {
      [(_BPSFlatMapOuter *)v5 setDownstreamDemand:[(_BPSFlatMapOuter *)v5 downstreamDemand] + a3];
      uint64_t v22 = [(_BPSFlatMapOuter *)v5 buffer];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [(_BPSFlatMapOuter *)v5 buffer];
        uint64_t v25 = [v24 count];

        if (v25)
        {
          while ([(_BPSFlatMapOuter *)v5 downstreamDemand] >= 1)
          {
            uint64_t v26 = [(_BPSFlatMapOuter *)v5 buffer];
            v27 = [v26 firstObject];

            long long v28 = [(_BPSFlatMapOuter *)v5 buffer];
            [v28 removeObjectAtIndex:0];

            [(_BPSFlatMapOuter *)v5 setDownstreamDemand:[(_BPSFlatMapOuter *)v5 downstreamDemand] - 1];
            long long v29 = [(_BPSFlatMapOuter *)v5 subscriptions];
            long long v30 = [v27 first];
            long long v31 = [v29 objectForKeyedSubscript:v30];

            os_unfair_lock_unlock(&v5->_lock);
            os_unfair_recursive_lock_lock_with_options();
            [(_BPSFlatMapOuter *)v5 setDownstreamRecursive:1];
            v32 = [(_BPSFlatMapOuter *)v5 downstream];
            uint64_t v33 = [v27 second];
            uint64_t v34 = [v32 receiveInput:v33];

            [(_BPSFlatMapOuter *)v5 setDownstreamRecursive:0];
            os_unfair_recursive_lock_unlock();
            if (v34 >= 1)
            {
              os_unfair_lock_lock(&v5->_lock);
              [(_BPSFlatMapOuter *)v5 setDownstreamDemand:[(_BPSFlatMapOuter *)v5 downstreamDemand] + v34];
              os_unfair_lock_unlock(&v5->_lock);
            }
            if (v31)
            {
              [(_BPSFlatMapOuter *)v5 setInnerRecursive:1];
              [v31 requestDemand:1];
              [(_BPSFlatMapOuter *)v5 setInnerRecursive:0];
            }
            os_unfair_lock_lock(&v5->_lock);
            uint64_t v35 = [(_BPSFlatMapOuter *)v5 buffer];
            if (!v35)
            {

              break;
            }
            v36 = (void *)v35;
            v37 = [(_BPSFlatMapOuter *)v5 buffer];
            uint64_t v38 = [v37 count];

            if (!v38) {
              break;
            }
          }
        }
      }
    }
    v39 = [(_BPSFlatMapOuter *)v5 buffer];
    if (v39)
    {
      v40 = [(_BPSFlatMapOuter *)v5 buffer];
      BOOL v41 = [v40 count] != 0;
    }
    else
    {
      BOOL v41 = 0;
    }

    if ([(_BPSFlatMapOuter *)v5 cancelledOrCompleted]
      || ![(_BPSFlatMapOuter *)v5 outerFinished]
      || v41
      || ([(_BPSFlatMapOuter *)v5 subscriptions],
          v42 = objc_claimAutoreleasedReturnValue(),
          uint64_t v43 = [v42 count],
          uint64_t v44 = [(_BPSFlatMapOuter *)v5 pendingSubscriptions],
          v42,
          v43 + v44))
    {
LABEL_40:
      os_unfair_lock_unlock(&v5->_lock);
    }
    else
    {
      [(_BPSFlatMapOuter *)v5 setCancelledOrCompleted:1];
      os_unfair_lock_unlock(&v5->_lock);
      os_unfair_recursive_lock_lock_with_options();
      v45 = [(_BPSFlatMapOuter *)v5 downstream];
      v46 = +[BPSCompletion success];
      [v45 receiveCompletion:v46];

      os_unfair_recursive_lock_unlock();
    }
  }
}

- (void)cancel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  os_unfair_lock_lock(&v2->_lock);
  [(_BPSFlatMapOuter *)v2 setCancelledOrCompleted:1];
  v3 = [(_BPSFlatMapOuter *)v2 subscriptions];
  id v4 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [(_BPSFlatMapOuter *)v2 setSubscriptions:v4];

  id v5 = [(_BPSFlatMapOuter *)v2 outerSubscription];
  [(_BPSFlatMapOuter *)v2 _updateBookmarkWhenLocked];
  [(_BPSFlatMapOuter *)v2 setOuterSubscription:0];
  os_unfair_lock_unlock(&v2->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v3;
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
        uint64_t v11 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v11 cancel];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [v5 cancel];
}

- (id)upstreamSubscriptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(_BPSFlatMapOuter *)self outerSubscription];
  if (v3)
  {
    id v4 = [(_BPSFlatMapOuter *)self outerSubscription];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)_updateBookmarkWhenLocked
{
  v1 = [a1 outerSubscription];
  OUTLINED_FUNCTION_0_1(&dword_1AD01F000, v2, v3, "Subscription - %@ doesn't conform to BMBookmarkableSubscription protocol", v4, v5, v6, v7, 2u);
}

- (id)newBookmark
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [BMBookmarkNode alloc];
  v10[0] = self->_outerBookmark;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v5 = [(_BPSFlatMapOuter *)self outerSubscription];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [(BMBookmarkNode *)v3 initWithValue:0 upstreams:v4 name:v7];

  return v8;
}

- (void)receiveInnerSubscription:(id)a3 index:(int64_t)a4
{
  p_lock = &self->_lock;
  id v10 = a3;
  os_unfair_lock_lock(p_lock);
  [(_BPSFlatMapOuter *)self setPendingSubscriptions:[(_BPSFlatMapOuter *)self pendingSubscriptions] - 1];
  uint64_t v7 = [(_BPSFlatMapOuter *)self subscriptions];
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v10 forKeyedSubscript:v8];

  if ([(_BPSFlatMapOuter *)self downstreamDemand] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v9 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  [v10 requestDemand:v9];
}

- (int64_t)receiveInnerInput:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(_BPSFlatMapOuter *)self downstreamDemand] == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_recursive_lock_lock_with_options();
    [(_BPSFlatMapOuter *)self setDownstreamRecursive:1];
    uint64_t v8 = [(_BPSFlatMapOuter *)self downstream];
    [v8 receiveInput:v6];

    [(_BPSFlatMapOuter *)self setDownstreamRecursive:0];
    os_unfair_recursive_lock_unlock();
LABEL_6:
    int64_t v13 = 0;
    goto LABEL_7;
  }
  if ([(_BPSFlatMapOuter *)self downstreamDemand] < 1
    || [(_BPSFlatMapOuter *)self innerRecursive])
  {
    uint64_t v9 = [(_BPSFlatMapOuter *)self buffer];
    id v10 = [BPSTuple alloc];
    uint64_t v11 = [NSNumber numberWithInteger:a4];
    long long v12 = [(BPSTuple *)v10 initWithFirst:v11 second:v6];
    [v9 addObject:v12];

    os_unfair_lock_unlock(p_lock);
    goto LABEL_6;
  }
  [(_BPSFlatMapOuter *)self setDownstreamDemand:[(_BPSFlatMapOuter *)self downstreamDemand] - 1];
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  int64_t v13 = 1;
  [(_BPSFlatMapOuter *)self setDownstreamRecursive:1];
  long long v15 = [(_BPSFlatMapOuter *)self downstream];
  uint64_t v16 = [v15 receiveInput:v6];

  [(_BPSFlatMapOuter *)self setDownstreamRecursive:0];
  os_unfair_recursive_lock_unlock();
  if (v16 >= 1)
  {
    os_unfair_lock_lock(&self->_lock);
    [(_BPSFlatMapOuter *)self setDownstreamDemand:[(_BPSFlatMapOuter *)self downstreamDemand] + v16];
    os_unfair_lock_unlock(&self->_lock);
    int64_t v13 = 1;
  }
LABEL_7:

  return v13;
}

- (void)receiveInnerCompletion:(id)a3 index:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 state];
  if (v7 == 1)
  {
    os_unfair_lock_lock(&self->_lock);
    if ([(_BPSFlatMapOuter *)self cancelledOrCompleted])
    {
      p_lock = &self->_lock;
      goto LABEL_28;
    }
    uint64_t v35 = v6;
    [(_BPSFlatMapOuter *)self setCancelledOrCompleted:1];
    long long v14 = [(_BPSFlatMapOuter *)self subscriptions];
    long long v15 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    [(_BPSFlatMapOuter *)self setSubscriptions:v15];

    os_unfair_lock_unlock(&self->_lock);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v22 = [NSNumber numberWithInteger:a4];
          char v23 = [v21 isEqualToNumber:v22];

          if ((v23 & 1) == 0)
          {
            v24 = [v16 objectForKeyedSubscript:v21];
            [v24 cancel];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v18);
    }

    os_unfair_recursive_lock_lock_with_options();
    uint64_t v25 = [(_BPSFlatMapOuter *)self downstream];
    id v6 = v35;
    uint64_t v26 = [v35 error];
    v27 = +[BPSCompletion failureWithError:v26];
    [v25 receiveCompletion:v27];

    os_unfair_recursive_lock_unlock();
  }
  else if (!v7)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v8 = [(_BPSFlatMapOuter *)self subscriptions];
    uint64_t v9 = [NSNumber numberWithInteger:a4];
    [v8 removeObjectForKey:v9];

    id v10 = [(_BPSFlatMapOuter *)self buffer];
    if (v10)
    {
      uint64_t v11 = [(_BPSFlatMapOuter *)self buffer];
      BOOL v12 = [v11 count] == 0;
    }
    else
    {
      BOOL v12 = 1;
    }

    if (![(_BPSFlatMapOuter *)self cancelledOrCompleted]
      && [(_BPSFlatMapOuter *)self outerFinished])
    {
      long long v28 = [(_BPSFlatMapOuter *)self subscriptions];
      uint64_t v29 = [v28 count];
      if (v29 + [(_BPSFlatMapOuter *)self pendingSubscriptions]) {
        BOOL v12 = 0;
      }

      if (v12)
      {
        [(_BPSFlatMapOuter *)self setCancelledOrCompleted:1];
        os_unfair_lock_unlock(&self->_lock);
        os_unfair_recursive_lock_lock_with_options();
        long long v30 = [(_BPSFlatMapOuter *)self downstream];
        long long v31 = +[BPSCompletion success];
        [v30 receiveCompletion:v31];

        os_unfair_recursive_lock_unlock();
        goto LABEL_29;
      }
    }
    os_unfair_lock_unlock(&self->_lock);
    if ([(_BPSFlatMapOuter *)self maxPublishers] == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_29;
    }
    p_outerLock = &self->_outerLock;
    os_unfair_lock_lock(&self->_outerLock);
    uint64_t v33 = [(_BPSFlatMapOuter *)self outerSubscription];

    if (v33)
    {
      uint64_t v34 = [(_BPSFlatMapOuter *)self outerSubscription];
      os_unfair_lock_unlock(p_outerLock);
      [v34 requestDemand:1];

      goto LABEL_29;
    }
    p_lock = &self->_outerLock;
LABEL_28:
    os_unfair_lock_unlock(p_lock);
  }
LABEL_29:
}

- (BPSSubscription)outerSubscription
{
  return self->_outerSubscription;
}

- (void)setOuterSubscription:(id)a3
{
}

- (BMBookmark)outerBookmark
{
  return self->_outerBookmark;
}

- (void)setOuterBookmark:(id)a3
{
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (int64_t)downstreamDemand
{
  return self->_downstreamDemand;
}

- (void)setDownstreamDemand:(int64_t)a3
{
  self->_downstreamDemand = a3;
}

- (BOOL)downstreamRecursive
{
  return self->_downstreamRecursive;
}

- (void)setDownstreamRecursive:(BOOL)a3
{
  self->_downstreamRecursive = a3;
}

- (BOOL)innerRecursive
{
  return self->_innerRecursive;
}

- (void)setInnerRecursive:(BOOL)a3
{
  self->_innerRecursive = a3;
}

- (NSMutableDictionary)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (int64_t)nextInnerIndex
{
  return self->_nextInnerIndex;
}

- (void)setNextInnerIndex:(int64_t)a3
{
  self->_nextInnerIndex = a3;
}

- (int64_t)pendingSubscriptions
{
  return self->_pendingSubscriptions;
}

- (void)setPendingSubscriptions:(int64_t)a3
{
  self->_pendingSubscriptions = a3;
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (int64_t)maxPublishers
{
  return self->_maxPublishers;
}

- (void)setMaxPublishers:(int64_t)a3
{
  self->_maxPublishers = a3;
}

- (id)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
}

- (BOOL)cancelledOrCompleted
{
  return self->_cancelledOrCompleted;
}

- (void)setCancelledOrCompleted:(BOOL)a3
{
  self->_cancelledOrCompleted = a3;
}

- (BOOL)outerFinished
{
  return self->_outerFinished;
}

- (void)setOuterFinished:(BOOL)a3
{
  self->_outerFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_map, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_outerBookmark, 0);
  objc_storeStrong((id *)&self->_outerSubscription, 0);
}

@end