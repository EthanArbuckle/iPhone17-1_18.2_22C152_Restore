@interface BPSSubscriptionStatus
+ (id)awaitingSubscription;
+ (id)subscribedWithSubscription:(id)a3;
+ (id)terminal;
- (BPSSubscription)subscription;
- (BPSSubscriptionStatus)initWithState:(int64_t)a3 subscription:(id)a4;
- (int64_t)state;
- (void)setState:(int64_t)a3;
- (void)setSubscription:(id)a3;
@end

@implementation BPSSubscriptionStatus

- (void).cxx_destruct
{
}

- (BPSSubscriptionStatus)initWithState:(int64_t)a3 subscription:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BPSSubscriptionStatus;
  v8 = [(BPSSubscriptionStatus *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    objc_storeStrong((id *)&v8->_subscription, a4);
  }

  return v9;
}

+ (id)awaitingSubscription
{
  v2 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
  return v2;
}

+ (id)subscribedWithSubscription:(id)a3
{
  id v3 = a3;
  v4 = [[BPSSubscriptionStatus alloc] initWithState:1 subscription:v3];

  return v4;
}

+ (id)terminal
{
  v2 = [[BPSSubscriptionStatus alloc] initWithState:2 subscription:0];
  return v2;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

@end