@interface NSOperationQueue(AppleAccount)
+ (id)aa_operationQueueWithUnderlyingQueue:()AppleAccount;
@end

@implementation NSOperationQueue(AppleAccount)

+ (id)aa_operationQueueWithUnderlyingQueue:()AppleAccount
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"NSOperationQueue+AppleAccount.m", 16, @"Invalid parameter not satisfying: %@", @"underlyingQueue" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v6 setUnderlyingQueue:v5];

  return v6;
}

@end