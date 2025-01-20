@interface HKPowerUnit
- (id)dimension;
@end

@implementation HKPowerUnit

- (id)dimension
{
  return +[_HKBaseDimension power];
}

@end