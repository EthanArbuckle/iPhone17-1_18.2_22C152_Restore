@interface _BPSHandleEventsInner
- (BPSSubscriber)downstream;
- (_BPSHandleEventsInner)initWithDownstream:(id)a3 handleEvents:(id)a4;
- (id)upstreamSubscriptions;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)upstreamSubscriptions;
@end

@implementation _BPSHandleEventsInner

- (_BPSHandleEventsInner)initWithDownstream:(id)a3 handleEvents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_BPSHandleEventsInner;
  v9 = [(_BPSHandleEventsInner *)&v29 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downstream, a3);
    v11 = [v8 receiveSubscription];
    uint64_t v12 = [v11 copy];
    id receiveSubscription = v10->_receiveSubscription;
    v10->_id receiveSubscription = (id)v12;

    v14 = [v8 receiveOutput];
    uint64_t v15 = [v14 copy];
    id receiveOutput = v10->_receiveOutput;
    v10->_id receiveOutput = (id)v15;

    v17 = [v8 receiveCompletion];
    uint64_t v18 = [v17 copy];
    id receiveCompletion = v10->_receiveCompletion;
    v10->_id receiveCompletion = (id)v18;

    v20 = [v8 receiveCancel];
    uint64_t v21 = [v20 copy];
    id receiveCancel = v10->_receiveCancel;
    v10->_id receiveCancel = (id)v21;

    v23 = [v8 receiveRequest];
    uint64_t v24 = [v23 copy];
    id receiveRequest = v10->_receiveRequest;
    v10->_id receiveRequest = (id)v24;

    v26 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v10->_status;
    v10->_status = v26;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)cancel
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "%@ - cancel", (uint8_t *)&v3, 0xCu);
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    uint64_t v16 = objc_opt_class();
    _os_log_impl(&dword_1AD01F000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v15, 0xCu);
  }

  os_unfair_lock_lock(&v5->_lock);
  id v7 = (void (**)(void *, id))_Block_copy(v5->_receiveCompletion);
  if (v7)
  {
    os_unfair_lock_unlock(&v5->_lock);
    v7[2](v7, v4);
    os_unfair_lock_lock(&v5->_lock);
  }
  id receiveSubscription = v5->_receiveSubscription;
  v5->_id receiveSubscription = 0;

  id receiveOutput = v5->_receiveOutput;
  v5->_id receiveOutput = 0;

  id receiveCompletion = v5->_receiveCompletion;
  v5->_id receiveCompletion = 0;

  id receiveCancel = v5->_receiveCancel;
  v5->_id receiveCancel = 0;

  id receiveRequest = v5->_receiveRequest;
  v5->_id receiveRequest = 0;

  os_unfair_lock_unlock(&v5->_lock);
  [(BPSSubscriber *)v5->_downstream receiveCompletion:v4];
  os_unfair_lock_lock(&v5->_lock);
  uint64_t v13 = +[BPSSubscriptionStatus terminal];
  status = v5->_status;
  v5->_status = (BPSSubscriptionStatus *)v13;

  os_unfair_lock_unlock(&v5->_lock);
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  os_unfair_lock_lock(&v4->_lock);
  v6 = (void (**)(void *, id))_Block_copy(v4->_receiveOutput);
  os_unfair_lock_unlock(&v4->_lock);
  if (v6) {
    v6[2](v6, v5);
  }
  int64_t v7 = [(BPSSubscriber *)v4->_downstream receiveInput:v5];

  id v8 = _Block_copy(v4->_receiveRequest);
  v9 = v8;
  if (v7 >= 1 && v8 != 0) {
    (*((void (**)(void *, int64_t))v8 + 2))(v8, v7);
  }

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void (**)(void *, id))_Block_copy(self->_receiveSubscription);
  if (v4)
  {
    os_unfair_lock_unlock(&self->_lock);
    v4[2](v4, v5);
    os_unfair_lock_lock(&self->_lock);
  }
  if ([(BPSSubscriptionStatus *)self->_status state])
  {
    os_unfair_lock_unlock(&self->_lock);
    [v5 cancel];
  }
  else
  {
    [(BPSSubscriptionStatus *)self->_status setState:1];
    [(BPSSubscriptionStatus *)self->_status setSubscription:v5];
    os_unfair_lock_unlock(&self->_lock);
    [(BPSSubscriber *)self->_downstream receiveSubscription:self];
  }
}

- (void)requestDemand:(int64_t)a3
{
  id v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  id v5 = (void (**)(void *, int64_t))_Block_copy(v8->_receiveRequest);
  if (v5)
  {
    os_unfair_lock_unlock(p_lock);
    v5[2](v5, a3);
    os_unfair_lock_lock(p_lock);
  }
  v6 = [(BPSSubscriptionStatus *)v8->_status subscription];
  uint64_t v7 = [(BPSSubscriptionStatus *)v8->_status state];
  os_unfair_lock_unlock(p_lock);
  if (v7 == 1) {
    [v6 requestDemand:a3];
  }
}

- (id)upstreamSubscriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BPSSubscriptionStatus *)self->_status subscription];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(_BPSHandleEventsInner *)(uint64_t)self upstreamSubscriptions];
    }

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
  objc_storeStrong(&self->_receiveRequest, 0);
  objc_storeStrong(&self->_receiveCancel, 0);
  objc_storeStrong(&self->_receiveCompletion, 0);
  objc_storeStrong(&self->_receiveOutput, 0);
  objc_storeStrong(&self->_receiveSubscription, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (void)upstreamSubscriptions
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_error_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_ERROR, "%@ - upstreamSubscriptions are nil", (uint8_t *)&v3, 0xCu);
}

@end