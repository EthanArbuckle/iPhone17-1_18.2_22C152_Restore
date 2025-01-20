@interface NSURLSessionConfiguration(AppleAccount)
- (void)aa_registerProtocolClass:()AppleAccount;
- (void)aa_unregisterProtocolClass:()AppleAccount;
@end

@implementation NSURLSessionConfiguration(AppleAccount)

- (void)aa_registerProtocolClass:()AppleAccount
{
  if (!a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"NSURLSession+AppleAccount.m", 20, @"Invalid parameter not satisfying: %@", @"class" object file lineNumber description];
  }
  v5 = [a1 protocolClasses];
  id v9 = v5;
  if (v5) {
    [v5 arrayByAddingObject:a3];
  }
  else {
  v6 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  }
  [a1 setProtocolClasses:v6];
}

- (void)aa_unregisterProtocolClass:()AppleAccount
{
  if (!a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"NSURLSession+AppleAccount.m", 31, @"Invalid parameter not satisfying: %@", @"class" object file lineNumber description];
  }
  id v8 = [a1 protocolClasses];
  v5 = objc_msgSend(v8, "aaf_arrayByRemovingObject:", a3);
  [a1 setProtocolClasses:v5];
}

@end