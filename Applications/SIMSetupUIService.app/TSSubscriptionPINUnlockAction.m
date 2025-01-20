@interface TSSubscriptionPINUnlockAction
- (int64_t)actionType;
@end

@implementation TSSubscriptionPINUnlockAction

- (int64_t)actionType
{
  return 2;
}

@end