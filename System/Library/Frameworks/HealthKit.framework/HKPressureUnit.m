@interface HKPressureUnit
- (id)dimension;
@end

@implementation HKPressureUnit

- (id)dimension
{
  return +[_HKBaseDimension pressure];
}

@end