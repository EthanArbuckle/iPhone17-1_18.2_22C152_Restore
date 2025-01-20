@interface HKTimeUnit
- (id)dimension;
@end

@implementation HKTimeUnit

- (id)dimension
{
  return +[_HKBaseDimension time];
}

@end