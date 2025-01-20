@interface LACSharedModePolicyTraitsManager
- (int64_t)policyTraitsForSharedMode:(id)a3;
@end

@implementation LACSharedModePolicyTraitsManager

- (int64_t)policyTraitsForSharedMode:(id)a3
{
  return [a3 isActive];
}

@end