@interface HKLengthUnit
- (id)dimension;
@end

@implementation HKLengthUnit

- (id)dimension
{
  return +[_HKBaseDimension length];
}

@end