@interface BPSCountWindow
- (BPSCountWindow)initWithCapacity:(unint64_t)a3 aggregator:(id)a4 identifier:(id)a5;
- (id)accumulator;
- (id)closure;
- (id)identifier;
- (id)metadata;
- (int64_t)receiveInput:(id)a3;
- (unint64_t)capacity;
- (unint64_t)currentCount;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
@end

@implementation BPSCountWindow

- (BPSCountWindow)initWithCapacity:(unint64_t)a3 aggregator:(id)a4 identifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!a3)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"BPSCountWindowAssigner.m" lineNumber:40 description:@"Expecting capacity to be greater than 0"];
  }
  v21.receiver = self;
  v21.super_class = (Class)BPSCountWindow;
  v11 = [(BPSCountWindow *)&v21 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_capacity = a3;
    uint64_t v13 = [v9 accumulator];
    id accumulator = v12->_accumulator;
    v12->_id accumulator = (id)v13;

    uint64_t v15 = [v9 closure];
    id closure = v12->_closure;
    v12->_id closure = (id)v15;

    objc_storeStrong((id *)&v12->_identifier, a5);
    v12->_currentCount = 0;
    v17 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v12->_status;
    v12->_status = v17;

    v12->_downstreamRequested = 0;
  }

  return v12;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)metadata
{
  v2 = [[BPSCountWindowMetadata alloc] initWithCurrentCount:self->_currentCount];
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
  if ([(BPSSubscriptionStatus *)v5->_status state] != 1) {
    goto LABEL_7;
  }
  unint64_t currentCount = v5->_currentCount;
  if (currentCount < v5->_capacity)
  {
    v5->_unint64_t currentCount = currentCount + 1;
    id closure = v5->_closure;
    id v9 = v5->_accumulator;
    id v10 = (void (**)(void *, id, id))_Block_copy(closure);
    os_unfair_lock_unlock(p_lock);
    uint64_t v11 = v10[2](v10, v9, v4);

    os_unfair_lock_lock(p_lock);
    id accumulator = v5->_accumulator;
    v5->_id accumulator = (id)v11;
  }
  if (v5->_downstreamRequested && v5->_currentCount == v5->_capacity)
  {
    [(BPSSubscriptionStatus *)v5->_status setState:2];
    uint64_t v13 = [(BPSWindow *)v5 downstream];
    v14 = [(BPSSubscriptionStatus *)v5->_status subscription];
    id v15 = v5->_accumulator;
    os_unfair_lock_unlock(p_lock);
    [v13 receiveInput:v15];

    v16 = +[BPSCompletion success];
    [v13 receiveCompletion:v16];

    [v14 cancel];
  }
  else
  {
LABEL_7:
    os_unfair_lock_unlock(p_lock);
  }

  return 0;
}

- (void)receiveSubscription:(id)a3
{
  id v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v5 = [(BPSSubscriptionStatus *)self->_status state];
  if (v5 == 2 || v5 == 1)
  {
    os_unfair_lock_unlock(&self->_lock);
    [v9 cancel];
  }
  else if (!v5)
  {
    [(BPSSubscriptionStatus *)self->_status setState:1];
    [(BPSSubscriptionStatus *)self->_status setSubscription:v9];
    v6 = [(BPSWindow *)self downstream];
    unint64_t capacity = self->_capacity;
    id v8 = self;
    os_unfair_lock_unlock(p_lock);
    [v6 receiveSubscription:v8];

    [v9 requestDemand:capacity];
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
  int64_t v5 = self;
  uint64_t v13 = v5;
  if (a3 <= 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:v13 file:@"BPSCountWindowAssigner.m" lineNumber:192 description:@"Expecting demand to be greater than 0"];

    int64_t v5 = v13;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSSubscriptionStatus *)v13->_status state] == 1
    && (v13->_downstreamRequested = 1, v13->_currentCount == v13->_capacity))
  {
    [(BPSSubscriptionStatus *)v13->_status setState:2];
    uint64_t v7 = [(BPSWindow *)v13 downstream];
    status = v13->_status;
    id v9 = v13->_accumulator;
    id v10 = [(BPSSubscriptionStatus *)status subscription];
    os_unfair_lock_unlock(p_lock);
    [v7 receiveInput:v9];

    uint64_t v11 = +[BPSCompletion success];
    [v7 receiveCompletion:v11];

    [v10 cancel];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)currentCount
{
  return self->_currentCount;
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end