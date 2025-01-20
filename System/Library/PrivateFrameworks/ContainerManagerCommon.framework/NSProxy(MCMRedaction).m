@interface NSProxy(MCMRedaction)
- (__CFString)redactedDescription;
@end

@implementation NSProxy(MCMRedaction)

- (__CFString)redactedDescription
{
  v1 = [a1 description];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 redactedDescription];
  }
  else
  {
    v2 = @"<~~~>";
  }

  return v2;
}

@end