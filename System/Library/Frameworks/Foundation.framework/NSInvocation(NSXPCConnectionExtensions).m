@interface NSInvocation(NSXPCConnectionExtensions)
- (id)userInfo;
- (uint64_t)_hasBlockArgument;
- (void)setUserInfo:()NSXPCConnectionExtensions;
@end

@implementation NSInvocation(NSXPCConnectionExtensions)

- (uint64_t)_hasBlockArgument
{
  v1 = (void *)[a1 methodSignature];
  uint64_t result = [v1 numberOfArguments];
  if (result)
  {
    unint64_t v3 = result;
    if (*(__int16 *)([v1 _argInfo:0] + 34) < 0)
    {
      return 1;
    }
    else
    {
      uint64_t v4 = 1;
      do
      {
        unint64_t v5 = v4;
        if (v3 == v4) {
          break;
        }
        uint64_t v6 = [v1 _argInfo:v4];
        uint64_t v4 = v5 + 1;
      }
      while ((*(__int16 *)(v6 + 34) & 0x80000000) == 0);
      return v5 < v3;
    }
  }
  return result;
}

- (void)setUserInfo:()NSXPCConnectionExtensions
{
}

- (id)userInfo
{
  return objc_getAssociatedObject(a1, "_NSXPCConnectionNSInvocationKey");
}

@end