@interface HKNonConvertibleIUUnit
- (id)dimension;
@end

@implementation HKNonConvertibleIUUnit

- (id)dimension
{
  return +[_HKBaseDimension nonConvertibleIU];
}

@end