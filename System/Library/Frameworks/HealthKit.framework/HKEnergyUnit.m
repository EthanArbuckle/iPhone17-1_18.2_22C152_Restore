@interface HKEnergyUnit
- (id)dimension;
@end

@implementation HKEnergyUnit

- (id)dimension
{
  return +[_HKBaseDimension energy];
}

@end