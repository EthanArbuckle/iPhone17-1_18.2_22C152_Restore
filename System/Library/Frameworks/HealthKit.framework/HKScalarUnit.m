@interface HKScalarUnit
- (id)dimension;
@end

@implementation HKScalarUnit

- (id)dimension
{
  return +[_HKBaseDimension nullDimension];
}

@end