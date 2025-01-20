@interface NSNumber(Additions)
- (BOOL)fm_isEqualToNumber:()Additions withPrecision:;
@end

@implementation NSNumber(Additions)

- (BOOL)fm_isEqualToNumber:()Additions withPrecision:
{
  id v6 = a4;
  [a1 doubleValue];
  double v8 = v7;
  [v6 doubleValue];
  double v10 = v9;

  return vabdd_f64(v8, v10) <= a2;
}

@end