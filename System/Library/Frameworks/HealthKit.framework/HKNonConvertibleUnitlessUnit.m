@interface HKNonConvertibleUnitlessUnit
- (id)dimension;
@end

@implementation HKNonConvertibleUnitlessUnit

- (id)dimension
{
  return +[_HKBaseDimension unitLess];
}

@end