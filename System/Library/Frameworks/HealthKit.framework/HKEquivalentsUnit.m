@interface HKEquivalentsUnit
- (id)dimension;
@end

@implementation HKEquivalentsUnit

- (id)dimension
{
  return +[_HKBaseDimension equivalents];
}

@end