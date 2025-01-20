@interface HKConductanceUnit
- (id)dimension;
@end

@implementation HKConductanceUnit

- (id)dimension
{
  return +[_HKBaseDimension conductance];
}

@end