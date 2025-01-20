@interface HFStaticNonBlockingItemProvider
+ (BOOL)prefersNonBlockingReloads;
@end

@implementation HFStaticNonBlockingItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

@end