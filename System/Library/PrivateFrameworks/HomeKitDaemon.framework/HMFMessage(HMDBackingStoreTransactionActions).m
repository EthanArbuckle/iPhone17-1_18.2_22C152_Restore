@interface HMFMessage(HMDBackingStoreTransactionActions)
- (id)transactionResult;
@end

@implementation HMFMessage(HMDBackingStoreTransactionActions)

- (id)transactionResult
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"_reserved_BackingStoreTransactionResult"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

@end