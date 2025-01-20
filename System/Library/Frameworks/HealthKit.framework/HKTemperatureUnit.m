@interface HKTemperatureUnit
- (id)dimension;
@end

@implementation HKTemperatureUnit

- (id)dimension
{
  return +[_HKBaseDimension temperature];
}

@end