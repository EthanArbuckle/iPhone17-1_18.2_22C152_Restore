@interface SubscriptionEntitlementsResult
@end

@implementation SubscriptionEntitlementsResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
}

@end