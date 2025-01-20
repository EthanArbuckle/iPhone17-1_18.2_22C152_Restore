@interface NSError(HMBShareOperation)
+ (uint64_t)hmbRetryShareOperationError;
- (BOOL)hmbIsRetryShareOperationError;
@end

@implementation NSError(HMBShareOperation)

- (BOOL)hmbIsRetryShareOperationError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"HMBShareOperationErrorDomain"]) {
    BOOL v3 = [a1 code] == 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (uint64_t)hmbRetryShareOperationError
{
  return [a1 errorWithDomain:@"HMBShareOperationErrorDomain" code:1 userInfo:0];
}

@end