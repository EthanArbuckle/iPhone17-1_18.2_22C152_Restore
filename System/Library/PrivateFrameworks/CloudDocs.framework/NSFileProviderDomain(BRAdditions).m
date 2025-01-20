@interface NSFileProviderDomain(BRAdditions)
- (uint64_t)br_isCiconiaDomain;
@end

@implementation NSFileProviderDomain(BRAdditions)

- (uint64_t)br_isCiconiaDomain
{
  v1 = [a1 identifier];
  uint64_t v2 = [v1 hasPrefix:@"Ciconia-"];

  return v2;
}

@end