@interface HKVolumeUnit
- (id)dimension;
@end

@implementation HKVolumeUnit

- (id)dimension
{
  return +[_HKBaseDimension volume];
}

@end