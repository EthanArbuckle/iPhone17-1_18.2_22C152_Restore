@interface HKDiopterUnit
- (id)dimension;
@end

@implementation HKDiopterUnit

- (id)dimension
{
  return +[_HKBaseDimension diopter];
}

@end