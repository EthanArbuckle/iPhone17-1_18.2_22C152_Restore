@interface NSObject(MKClusterAnnotation)
- (uint64_t)_isMKClusterAnnotation;
@end

@implementation NSObject(MKClusterAnnotation)

- (uint64_t)_isMKClusterAnnotation
{
  return 0;
}

@end