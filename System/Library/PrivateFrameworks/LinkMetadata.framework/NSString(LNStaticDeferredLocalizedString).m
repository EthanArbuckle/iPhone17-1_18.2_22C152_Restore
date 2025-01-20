@interface NSString(LNStaticDeferredLocalizedString)
- (uint64_t)bundleIdentifier;
- (uint64_t)bundleURL;
- (uint64_t)defaultValue;
- (uint64_t)table;
@end

@implementation NSString(LNStaticDeferredLocalizedString)

- (uint64_t)defaultValue
{
  return 0;
}

- (uint64_t)table
{
  return 0;
}

- (uint64_t)bundleURL
{
  return 0;
}

- (uint64_t)bundleIdentifier
{
  return 0;
}

@end