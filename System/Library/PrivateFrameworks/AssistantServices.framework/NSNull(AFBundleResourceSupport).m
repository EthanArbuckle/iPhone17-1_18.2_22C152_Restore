@interface NSNull(AFBundleResourceSupport)
- (uint64_t)af_getBundleResourceURL;
@end

@implementation NSNull(AFBundleResourceSupport)

- (uint64_t)af_getBundleResourceURL
{
  return 0;
}

@end