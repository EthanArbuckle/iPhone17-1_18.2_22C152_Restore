@interface HKPrismDiopterUnit
- (id)dimension;
@end

@implementation HKPrismDiopterUnit

- (id)dimension
{
  return +[_HKBaseDimension prismDiopter];
}

@end