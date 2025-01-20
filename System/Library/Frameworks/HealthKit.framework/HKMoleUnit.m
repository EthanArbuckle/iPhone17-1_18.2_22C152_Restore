@interface HKMoleUnit
- (id)dimension;
@end

@implementation HKMoleUnit

- (id)dimension
{
  return +[_HKBaseDimension nonConvertibleMole];
}

@end