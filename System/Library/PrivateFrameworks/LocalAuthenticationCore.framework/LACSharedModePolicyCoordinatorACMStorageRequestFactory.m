@interface LACSharedModePolicyCoordinatorACMStorageRequestFactory
- (id)requestWithPolicyTraits:(int64_t)a3;
@end

@implementation LACSharedModePolicyCoordinatorACMStorageRequestFactory

- (id)requestWithPolicyTraits:(int64_t)a3
{
  v3 = [[LACSharedModePolicyCoordinatorACMStorageRequest alloc] initWithKey:4 BOOLValue:(a3 & 3) != 0];
  return v3;
}

BOOL __82__LACSharedModePolicyCoordinatorACMStorageRequestFactory_requestWithPolicyTraits___block_invoke(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 32) & 3) != 0;
}

@end