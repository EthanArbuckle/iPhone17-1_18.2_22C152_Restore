@interface GKLocalPlayer(GKSpringboardSupport)
+ (uint64_t)hasAuthenticatedAccount;
@end

@implementation GKLocalPlayer(GKSpringboardSupport)

+ (uint64_t)hasAuthenticatedAccount
{
  return 0;
}

@end