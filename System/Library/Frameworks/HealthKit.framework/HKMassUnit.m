@interface HKMassUnit
- (id)dimension;
@end

@implementation HKMassUnit

- (id)dimension
{
  return +[_HKBaseDimension mass];
}

@end