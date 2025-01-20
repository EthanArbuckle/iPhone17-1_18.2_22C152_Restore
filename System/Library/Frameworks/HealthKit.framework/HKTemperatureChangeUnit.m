@interface HKTemperatureChangeUnit
- (id)dimension;
@end

@implementation HKTemperatureChangeUnit

- (id)dimension
{
  return +[_HKBaseDimension changeInTemperature];
}

@end