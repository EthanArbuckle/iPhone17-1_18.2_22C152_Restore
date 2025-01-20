@interface BPSSessionWindow
- (BPSSessionWindow)initWithDateInterval:(id)a3 gap:(double)a4 timestamp:(id)a5 aggregator:(id)a6 identifier:(id)a7;
- (NSDateInterval)dateInterval;
- (double)gap;
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

@implementation BPSSessionWindow

- (BPSSessionWindow)initWithDateInterval:(id)a3 gap:(double)a4 timestamp:(id)a5 aggregator:(id)a6 identifier:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)BPSSessionWindow;
  v17 = [(BPSSessionWindow *)&v28 init];
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v17->_dateInterval, a3);
    v18->_gap = a4;
    uint64_t v19 = [v14 copy];
    id timestamp = v18->_timestamp;
    v18->_id timestamp = (id)v19;

    uint64_t v21 = [v15 accumulator];
    id accumulator = v18->_accumulator;
    v18->_id accumulator = (id)v21;

    uint64_t v23 = [v15 closure];
    id closure = v18->_closure;
    v18->_id closure = (id)v23;

    objc_storeStrong((id *)&v18->_identifier, a7);
    v25 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v18->_status;
    v18->_status = v25;

    v18->_downstreamRequested = 0;
  }

  return v18;
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
    v9 = [v11 error];
    v10 = +[BPSCompletion failureWithError:v9];
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
    v9 = +[BPSCompletion success];
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
    v9 = _Block_copy(closure);
    v10 = (void (**)(void *, id))_Block_copy(v5->_timestamp);
    os_unfair_lock_unlock(p_lock);
    id v11 = v10[2](v10, v4);
    v27 = v9;
    v12 = (*((void (**)(void *, id, id))v9 + 2))(v9, v8, v4);

    os_unfair_lock_lock(p_lock);
    if ([(NSDateInterval *)v5->_dateInterval containsDate:v11])
    {
      objc_storeStrong(&v5->_accumulator, v12);
      [v11 timeIntervalSinceReferenceDate];
      double v14 = v13;
      id v15 = [(NSDateInterval *)v5->_dateInterval startDate];
      [v15 timeIntervalSinceReferenceDate];
      double v17 = v14 - v16 + v5->_gap + -0.0001;

      id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v19 = [(NSDateInterval *)v5->_dateInterval startDate];
      uint64_t v20 = [v18 initWithStartDate:v19 duration:v17];
      dateInterval = v5->_dateInterval;
      v5->_dateInterval = (NSDateInterval *)v20;

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      [(BPSSubscriptionStatus *)v5->_status setState:2];
      v22 = [(BPSWindow *)v5 downstream];
      uint64_t v23 = [(BPSSubscriptionStatus *)v5->_status subscription];
      id v24 = v5->_accumulator;
      os_unfair_lock_unlock(p_lock);
      [v22 receiveInput:v24];

      v25 = +[BPSCompletion success];
      [v22 receiveCompletion:v25];

      [v23 cancel];
    }
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
    [v5 handleFailureInMethod:a2 object:v6 file:@"BPSSessionWindowAssigner.m" lineNumber:196 description:@"Expecting demand to be greater than 0"];
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

- (double)gap
{
  return self->_gap;
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
  objc_storeStrong(&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end