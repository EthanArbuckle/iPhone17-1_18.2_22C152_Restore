@interface BPSPassThroughSubject
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)active;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)canStorePassThroughValueInBookmark;
- (BOOL)complete;
- (BOOL)completed;
- (BOOL)hasAnyDownstreamDemand;
- (BPSCompletion)completion;
- (BPSPassThroughSubject)init;
- (BPSSubscriber)subscriber;
- (BPSSubscriberList)downstreams;
- (BPSSubscription)sub;
- (NSMutableArray)nextEvents;
- (NSMutableArray)upstreamSubscriptions;
- (id)bookmark;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (id)validateBookmark:(id)a3;
- (int64_t)receiveInput:(id)a3;
- (os_unfair_recursive_lock_s)rlock;
- (void)acknowledgeDownstreamDemand;
- (void)applyBookmark:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)disassociate:(int64_t)a3;
- (void)receiveCompletion:(id)a3;
- (void)reset;
- (void)sendCompletion;
- (void)sendCompletion:(id)a3;
- (void)sendEvent:(id)a3;
- (void)sendSubscription:(id)a3;
- (void)sendValue:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setComplete:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setDownstreams:(id)a3;
- (void)setHasAnyDownstreamDemand:(BOOL)a3;
- (void)setNextEvents:(id)a3;
- (void)setSub:(id)a3;
- (void)setSubscriber:(id)a3;
- (void)setUpstreamSubscriptions:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSPassThroughSubject

- (BPSPassThroughSubject)init
{
  v12.receiver = self;
  v12.super_class = (Class)BPSPassThroughSubject;
  v2 = [(BPSPassThroughSubject *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    upstreamSubscriptions = v2->_upstreamSubscriptions;
    v2->_upstreamSubscriptions = (NSMutableArray *)v3;

    completion = v2->_completion;
    v2->_completion = 0;

    v2->_active = 1;
    uint64_t v6 = objc_opt_new();
    downstreams = v2->_downstreams;
    v2->_downstreams = (BPSSubscriberList *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    subscriber = v2->_subscriber;
    v2->_subscriber = 0;

    v2->_complete = 0;
    uint64_t v9 = objc_opt_new();
    nextEvents = v2->_nextEvents;
    v2->_nextEvents = (NSMutableArray *)v9;

    v2->_rlock = 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_upstreamSubscriptions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BPSPassThroughSubject;
  [(BPSPassThroughSubject *)&v8 dealloc];
}

- (void)sendSubscription:(id)a3
{
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_upstreamSubscriptions addObject:v5];
  LODWORD(self) = [(BPSPassThroughSubject *)self hasAnyDownstreamDemand];
  os_unfair_lock_unlock(p_lock);
  if (self) {
    [v5 requestDemand:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (void)acknowledgeDownstreamDemand
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(BPSPassThroughSubject *)self hasAnyDownstreamDemand])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(BPSPassThroughSubject *)self setHasAnyDownstreamDemand:1];
    uint64_t v4 = [(BPSPassThroughSubject *)self upstreamSubscriptions];
    os_unfair_lock_unlock(p_lock);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "requestDemand:", 0x7FFFFFFFFFFFFFFFLL, (void)v10);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)subscribe:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  if ([(BPSPassThroughSubject *)self active])
  {
    long long v10 = [[_BPSInnerConduit alloc] initWithParent:self downstream:v5];
    uint64_t v6 = [(BPSPassThroughSubject *)self downstreams];
    uint64_t v7 = [v6 appendElement:v10];

    [(_BPSInnerConduit *)v10 assignIdentity:v7];
    os_unfair_lock_unlock(p_lock);
    [v5 receiveSubscription:v10];
  }
  else
  {
    uint64_t v8 = [(BPSPassThroughSubject *)self completion];

    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Terminal will always be set when not active"];
    }
    os_unfair_lock_unlock(p_lock);
    long long v9 = objc_opt_new();
    [v5 receiveSubscription:v9];

    long long v10 = [(BPSPassThroughSubject *)self completion];
    objc_msgSend(v5, "receiveCompletion:");
  }
}

- (void)sendValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSPassThroughSubject *)v5 active])
  {
    uint64_t v7 = [(BPSPassThroughSubject *)v5 downstreams];
    uint64_t v8 = [v7 items];

    os_unfair_lock_unlock(p_lock);
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
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "offerInput:", v4, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)sendCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSPassThroughSubject *)v5 active])
  {
    [(BPSPassThroughSubject *)v5 setActive:0];
    [(BPSPassThroughSubject *)v5 setCompletion:v4];
    uint64_t v7 = [(BPSPassThroughSubject *)v5 downstreams];
    uint64_t v8 = [v7 claimAll];

    [(BPSPassThroughSubject *)v5 setUpstreamSubscriptions:0];
    os_unfair_lock_unlock(p_lock);
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
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "finishWithCompletion:", v4, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)disassociate:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(BPSPassThroughSubject *)self active])
  {
    uint64_t v6 = [(BPSPassThroughSubject *)self downstreams];
    [v6 removeTicket:a3];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)receiveCompletion:(id)a3
{
  id v4 = self;
  [(BPSPassThroughSubject *)v4 sendCompletion:a3];
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  [(BPSPassThroughSubject *)v4 sendValue:a3];

  return 0;
}

- (void)cancel
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = self;
  p_lock = &v2->_lock;
  os_unfair_lock_lock(&v2->_lock);
  if ([(BPSPassThroughSubject *)v2 active])
  {
    [(BPSPassThroughSubject *)v2 setActive:0];
    id v4 = [(BPSPassThroughSubject *)v2 upstreamSubscriptions];
    id v5 = (void *)[v4 copy];

    [(BPSPassThroughSubject *)v2 setUpstreamSubscriptions:0];
    os_unfair_lock_unlock(p_lock);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "cancel", (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v5 = a3;
  return v5;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 0;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

- (id)bookmarkableUpstreams
{
  return 0;
}

- (id)startWithSubscriber:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(BPSPassThroughSubject *)self setSubscriber:v4];

  os_unfair_recursive_lock_unlock();
  return 0;
}

- (id)nextEvent
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = [(BPSPassThroughSubject *)self nextEvents];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(BPSPassThroughSubject *)self nextEvents];
    id v6 = [v5 objectAtIndex:0];

    uint64_t v7 = [(BPSPassThroughSubject *)self nextEvents];
    [v7 removeObjectAtIndex:0];
  }
  else
  {
    id v6 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (BOOL)completed
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = 0;
  if ([(BPSPassThroughSubject *)self complete])
  {
    uint64_t v4 = [(BPSPassThroughSubject *)self nextEvents];
    BOOL v3 = [v4 count] == 0;
  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)reset
{
  os_unfair_recursive_lock_lock_with_options();
  [(BPSPassThroughSubject *)self setComplete:0];
  [(BPSPassThroughSubject *)self setSubscriber:0];
  BOOL v3 = [(BPSPassThroughSubject *)self nextEvents];
  [v3 removeAllObjects];

  os_unfair_recursive_lock_unlock();
}

- (id)bookmark
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(BPSPassThroughSubject *)self nextEvents];
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)validateBookmark:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v6, objc_opt_class(), v3];
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v4 = [v8 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v9];
  }
  return v4;
}

- (void)applyBookmark:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(BPSPassThroughSubject *)self setNextEvents:v4];

  os_unfair_recursive_lock_unlock();
}

- (void)sendCompletion
{
  os_unfair_recursive_lock_lock_with_options();
  [(BPSPassThroughSubject *)self setComplete:1];
  id v3 = [(BPSPassThroughSubject *)self subscriber];
  [v3 requestNextEvents];

  os_unfair_recursive_lock_unlock();
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(BPSPassThroughSubject *)self nextEvents];
  [v5 addObject:v4];

  uint64_t v6 = [(BPSPassThroughSubject *)self subscriber];
  [v6 requestNextEvents];

  os_unfair_recursive_lock_unlock();
}

- (NSMutableArray)upstreamSubscriptions
{
  return self->_upstreamSubscriptions;
}

- (void)setUpstreamSubscriptions:(id)a3
{
}

- (BOOL)hasAnyDownstreamDemand
{
  return self->_hasAnyDownstreamDemand;
}

- (void)setHasAnyDownstreamDemand:(BOOL)a3
{
  self->_hasAnyDownstreamDemand = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BPSCompletion)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BPSSubscriberList)downstreams
{
  return self->_downstreams;
}

- (void)setDownstreams:(id)a3
{
}

- (BPSSubscription)sub
{
  return self->_sub;
}

- (void)setSub:(id)a3
{
}

- (BPSSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (NSMutableArray)nextEvents
{
  return self->_nextEvents;
}

- (void)setNextEvents:(id)a3
{
}

- (os_unfair_recursive_lock_s)rlock
{
  return self->_rlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextEvents, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_sub, 0);
  objc_storeStrong((id *)&self->_downstreams, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_upstreamSubscriptions, 0);
}

@end