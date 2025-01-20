@interface HKFrequencyUnit
- (id)dimension;
@end

@implementation HKFrequencyUnit

- (id)dimension
{
  return +[_HKBaseDimension frequency];
}

@end