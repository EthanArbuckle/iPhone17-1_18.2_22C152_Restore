@interface HMFMutableMessage(HMDBackingStoreTransactionActions)
- (uint64_t)setTransactionResult:()HMDBackingStoreTransactionActions;
@end

@implementation HMFMutableMessage(HMDBackingStoreTransactionActions)

- (uint64_t)setTransactionResult:()HMDBackingStoreTransactionActions
{
  return [a1 setUserInfoValue:a3 forKey:@"_reserved_BackingStoreTransactionResult"];
}

@end