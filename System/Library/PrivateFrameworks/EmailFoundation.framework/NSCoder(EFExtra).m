@interface NSCoder(EFExtra)
- (uint64_t)ef_isNSXPCCoder;
@end

@implementation NSCoder(EFExtra)

- (uint64_t)ef_isNSXPCCoder
{
  return 0;
}

@end