@interface CTXPCSubscriptionContextPrivateRequest
- (int)requiredEntitlement;
@end

@implementation CTXPCSubscriptionContextPrivateRequest

- (int)requiredEntitlement
{
  return 3;
}

@end