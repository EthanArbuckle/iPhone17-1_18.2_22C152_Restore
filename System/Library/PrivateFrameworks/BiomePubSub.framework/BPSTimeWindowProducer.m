@interface BPSTimeWindowProducer
- (BPSTimeWindowProducer)initWithDateInterval:(id)a3 aggregator:(id)a4 identifier:(id)a5;
- (NSDateInterval)dateInterval;
- (id)accumulator;
- (id)closure;
- (id)identifier;
- (id)metadata;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
@end

@implementation BPSTimeWindowProducer

- (BPSTimeWindowProducer)initWithDateInterval:(id)a3 aggregator:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BPSTimeWindowProducer;
  v12 = [(BPSTimeWindowProducer *)&v21 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_dateInterval, a3);
    uint64_t v14 = [v10 accumulator];
    id accumulator = v13->_accumulator;
    v13->_id accumulator = (id)v14;

    uint64_t v16 = [v10 closure];
    id closure = v13->_closure;
    v13->_id closure = (id)v16;

    objc_storeStrong((id *)&v13->_identifier, a5);
    v18 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v13->_status;
    v13->_status = v18;

    v13->_downstreamRequested = 0;
  }

  return v13;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)metadata
{
  v2 = [[BPSTimeWindowMetadata alloc] initWithDateInterval:self->_dateInterval];
  return v2;
}

- (void)receiveCompletion:(id)a3
{
  id v11 = a3;
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if ([(BPSSubscriptionStatus *)v4->_status state] != 1)
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_12;
  }
  [(BPSSubscriptionStatus *)v4->_status setState:2];
  v6 = [(BPSWindow *)v4 downstream];
  uint64_t v7 = [v11 state];
  if (v7 == 1)
  {
    os_unfair_lock_unlock(p_lock);
    id v9 = [v11 error];
    id v10 = +[BPSCompletion failureWithError:v9];
    [v6 receiveCompletion:v10];

LABEL_10:
    goto LABEL_11;
  }
  if (!v7)
  {
    if (v4->_downstreamRequested)
    {
      id v8 = v4->_accumulator;
      os_unfair_lock_unlock(p_lock);
      [v6 receiveInput:v8];
    }
    else
    {
      os_unfair_lock_unlock(p_lock);
    }
    id v9 = +[BPSCompletion success];
    [v6 receiveCompletion:v9];
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSSubscriptionStatus *)v5->_status state] == 1)
  {
    id closure = v5->_closure;
    id v8 = v5->_accumulator;
    id v9 = (void (**)(void *, id, id))_Block_copy(closure);
    os_unfair_lock_unlock(p_lock);
    uint64_t v10 = v9[2](v9, v8, v4);

    os_unfair_lock_lock(p_lock);
    id accumulator = v5->_accumulator;
    v5->_id accumulator = (id)v10;

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

  return 0;
}

- (void)receiveSubscription:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v5 = [(BPSSubscriptionStatus *)self->_status state];
  if (v5 == 2 || v5 == 1)
  {
    os_unfair_lock_unlock(&self->_lock);
    [v8 cancel];
  }
  else if (!v5)
  {
    [(BPSSubscriptionStatus *)self->_status setState:1];
    [(BPSSubscriptionStatus *)self->_status setSubscription:v8];
    v6 = [(BPSWindow *)self downstream];
    uint64_t v7 = self;
    os_unfair_lock_unlock(p_lock);
    [v6 receiveSubscription:v7];

    [v8 requestDemand:0x7FFFFFFFFFFFFFFFLL];
  }
  MEMORY[0x1F41817F8]();
}

- (void)cancel
{
  id v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if ([(BPSSubscriptionStatus *)v4->_status state] == 1)
  {
    [(BPSSubscriptionStatus *)v4->_status setState:2];
    v3 = [(BPSSubscriptionStatus *)v4->_status subscription];
    os_unfair_lock_unlock(p_lock);
    [v3 cancel];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)requestDemand:(int64_t)a3
{
  v6 = self;
  if (a3 <= 0)
  {
    int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:v6 file:@"BPSTimeWindowProducer.m" lineNumber:207 description:@"Expecting demand to be greater than 0"];
  }
  os_unfair_lock_lock(&v6->_lock);
  if ([(BPSSubscriptionStatus *)v6->_status state] == 1) {
    v6->_downstreamRequested = 1;
  }
  os_unfair_lock_unlock(&v6->_lock);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (id)accumulator
{
  return self->_accumulator;
}

- (id)closure
{
  return self->_closure;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_closure, 0);
  objc_storeStrong(&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end