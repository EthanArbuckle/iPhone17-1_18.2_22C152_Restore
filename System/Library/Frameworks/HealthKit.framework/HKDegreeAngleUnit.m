@interface HKDegreeAngleUnit
- (id)dimension;
@end

@implementation HKDegreeAngleUnit

- (id)dimension
{
  return +[_HKBaseDimension angle];
}

@end