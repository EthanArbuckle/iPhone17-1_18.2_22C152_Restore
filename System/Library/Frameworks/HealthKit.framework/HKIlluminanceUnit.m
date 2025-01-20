@interface HKIlluminanceUnit
- (id)dimension;
@end

@implementation HKIlluminanceUnit

- (id)dimension
{
  return +[_HKBaseDimension illuminance];
}

@end