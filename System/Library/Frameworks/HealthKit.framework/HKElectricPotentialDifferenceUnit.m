@interface HKElectricPotentialDifferenceUnit
- (id)dimension;
@end

@implementation HKElectricPotentialDifferenceUnit

- (id)dimension
{
  return +[_HKBaseDimension electricPotentialDifference];
}

@end