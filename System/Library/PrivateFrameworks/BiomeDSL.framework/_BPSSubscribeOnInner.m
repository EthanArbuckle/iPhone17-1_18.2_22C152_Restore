@interface _BPSSubscribeOnInner
- (BPSSubscriber)downstream;
- (BPSSubscription)subscription;
- (BPSSubscriptionStatus)status;
- (_BPSSubscribeOnInner)initWithDownstream:(id)a3;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setStatus:(id)a3;
- (void)setSubscription:(id)a3;
@end

@implementation _BPSSubscribeOnInner

- (_BPSSubscribeOnInner)initWithDownstream:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BPSSubscribeOnInner;
  v6 = [(_BPSSubscribeOnInner *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downstream, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F50238]) initWithState:0 subscription:0];
    status = v7->_status;
    v7->_status = (BPSSubscriptionStatus *)v8;
  }
  return v7;
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v8 = self;
  v4 = [(_BPSSubscribeOnInner *)v8 status];
  uint64_t v5 = [v4 state];

  if (v5 == 1)
  {
    v6 = [(_BPSSubscribeOnInner *)v8 status];
    v7 = [v6 subscription];
    [v7 requestDemand:a3];
  }
}

- (void)cancel
{
  v3 = self;
  v2 = [(_BPSSubscribeOnInner *)v3 subscription];
  [v2 cancel];
}

- (void)receiveCompletion:(id)a3
{
  v6 = self;
  id v4 = a3;
  uint64_t v5 = [(_BPSSubscribeOnInner *)v6 downstream];
  [v5 receiveCompletion:v4];
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = [(_BPSSubscribeOnInner *)v4 downstream];
  int64_t v7 = [v6 receiveInput:v5];

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSSubscribeOnInner *)self status];
  [v5 setState:1];

  id v6 = [(_BPSSubscribeOnInner *)self status];
  [v6 setSubscription:v4];
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end