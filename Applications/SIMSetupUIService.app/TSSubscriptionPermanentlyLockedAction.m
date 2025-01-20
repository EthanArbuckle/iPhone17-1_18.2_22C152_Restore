@interface TSSubscriptionPermanentlyLockedAction
- (int64_t)actionType;
@end

@implementation TSSubscriptionPermanentlyLockedAction

- (int64_t)actionType
{
  return 4;
}

@end