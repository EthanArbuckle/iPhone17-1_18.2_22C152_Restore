@interface NSDictionary(ASDTIOA2Config)
- (uint64_t)asdtExclavesInjectionBufferName;
- (uint64_t)asdtExclavesInputBufferName;
- (uint64_t)asdtIsolatedInputUseCaseID;
@end

@implementation NSDictionary(ASDTIOA2Config)

- (uint64_t)asdtExclavesInputBufferName
{
  return [a1 asdtStringForKey:@"ExclavesInputBufferName"];
}

- (uint64_t)asdtExclavesInjectionBufferName
{
  return [a1 asdtStringForKey:@"ExclavesInjectionBufferName"];
}

- (uint64_t)asdtIsolatedInputUseCaseID
{
  v1 = [a1 asdtNumberForKey:@"IsolatedInputUseCaseID"];
  uint64_t v2 = [v1 unsignedLongLongValue];

  return v2;
}

@end