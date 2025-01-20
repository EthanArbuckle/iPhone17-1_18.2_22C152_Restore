@interface _BPSMulticastInner
- (BPSSubscriber)downstream;
- (_BPSMulticastInner)initWithDownstream:(id)a3;
- (id)upstreamSubscriptions;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
@end

@implementation _BPSMulticastInner

- (_BPSMulticastInner)initWithDownstream:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BPSMulticastInner;
  v6 = [(_BPSMulticastInner *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downstream, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v7->_status;
    v7->_status = v8;
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_BPSMulticastInner;
  [(_BPSMulticastInner *)&v2 dealloc];
}

- (void)receiveSubscription:(id)a3
{
  p_lock = &self->_lock;
  v7 = (BPSSubscriber *)a3;
  os_unfair_lock_lock(p_lock);
  if ([(BPSSubscriptionStatus *)self->_status state])
  {
    os_unfair_lock_unlock(p_lock);
    [(BPSSubscriber *)v7 cancel];
  }
  else
  {
    [(BPSSubscriptionStatus *)self->_status setState:1];
    [(BPSSubscriptionStatus *)self->_status setSubscription:v7];

    downstream = self->_downstream;
    v6 = self;
    v7 = downstream;
    os_unfair_lock_unlock(p_lock);
    [(BPSSubscriber *)v7 receiveSubscription:v6];
  }
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_BPSMulticastInner receiveInput:]((uint64_t)v4, v6);
  }

  os_unfair_lock_lock(&v5->_lock);
  uint64_t v7 = [(BPSSubscriptionStatus *)v5->_status state];
  os_unfair_lock_unlock(&v5->_lock);
  if (v7 == 1)
  {
    v8 = [(_BPSMulticastInner *)v5 downstream];
    uint64_t v9 = [v8 receiveInput:v4];

    if (v9 > 0)
    {
      v10 = [(BPSSubscriptionStatus *)v5->_status subscription];
      [v10 requestDemand:v9];
    }
  }

  return 0;
}

- (void)requestDemand:(int64_t)a3
{
  id v5 = self;
  p_isa = (id *)&v5->super.super.super.isa;
  if (a3 <= 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:p_isa file:@"BPSMulticast.m" lineNumber:86 description:@"Expecting demand to be greater than 0"];

    id v5 = (_BPSMulticastInner *)p_isa;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([p_isa[2] state] == 1)
  {
    uint64_t v7 = [p_isa[2] subscription];
    os_unfair_lock_unlock(p_lock);
    [v7 requestDemand:a3];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = (id)objc_opt_class();
    id v7 = v11;
    _os_log_impl(&dword_1AD01F000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v10, 0xCu);
  }
  os_unfair_lock_lock(&v5->_lock);
  uint64_t v8 = [(BPSSubscriptionStatus *)v5->_status state];
  os_unfair_lock_unlock(&v5->_lock);
  if (v8 == 1)
  {
    uint64_t v9 = [(_BPSMulticastInner *)v5 downstream];
    [v9 receiveCompletion:v4];

    os_unfair_lock_lock(&v5->_lock);
    [(BPSSubscriptionStatus *)v5->_status setState:2];
    os_unfair_lock_unlock(&v5->_lock);
  }
}

- (void)cancel
{
  id v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if ([(BPSSubscriptionStatus *)v4->_status state] == 1)
  {
    [(BPSSubscriptionStatus *)v4->_status setState:2];
    os_unfair_lock_unlock(p_lock);
    v3 = [(BPSSubscriptionStatus *)v4->_status subscription];
    [v3 cancel];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
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
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (void)receiveInput:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "receiving: %@", (uint8_t *)&v2, 0xCu);
}

@end