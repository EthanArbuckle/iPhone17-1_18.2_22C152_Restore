@interface HKRadianAngleUnit
- (id)dimension;
@end

@implementation HKRadianAngleUnit

- (id)dimension
{
  return +[_HKBaseDimension angle];
}

@end