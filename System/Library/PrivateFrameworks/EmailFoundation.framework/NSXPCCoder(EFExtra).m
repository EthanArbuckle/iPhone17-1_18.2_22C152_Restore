@interface NSXPCCoder(EFExtra)
- (uint64_t)ef_isNSXPCCoder;
@end

@implementation NSXPCCoder(EFExtra)

- (uint64_t)ef_isNSXPCCoder
{
  return 1;
}

@end