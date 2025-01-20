@interface SHLCloudBackedSubscription
- (CKSubscription)subscription;
- (SHLCloudBackedSubscription)initWithSubscription:(id)a3;
@end

@implementation SHLCloudBackedSubscription

- (SHLCloudBackedSubscription)initWithSubscription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLCloudBackedSubscription;
  v6 = [(SHLCloudBackedSubscription *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscription, a3);
  }

  return v7;
}

- (CKSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
}

@end