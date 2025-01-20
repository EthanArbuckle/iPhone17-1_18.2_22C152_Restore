@interface HKTiterUnit
- (id)dimension;
@end

@implementation HKTiterUnit

- (id)dimension
{
  return +[_HKBaseDimension titer];
}

@end