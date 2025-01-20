@interface NSDate(_HKPropertyAnimationExtensions)
- (uint64_t)hk_animatable;
- (uint64_t)hk_midPointToValue:()_HKPropertyAnimationExtensions percentage:;
@end

@implementation NSDate(_HKPropertyAnimationExtensions)

- (uint64_t)hk_animatable
{
  return 1;
}

- (uint64_t)hk_midPointToValue:()_HKPropertyAnimationExtensions percentage:
{
  id v6 = a4;
  [a1 timeIntervalSinceReferenceDate];
  double v8 = v7;
  [v6 timeIntervalSinceReferenceDate];
  double v10 = v9;

  v11 = (void *)MEMORY[0x1E4F1C9C8];
  double v12 = fmax(a2, 0.0);
  if (v12 > 1.0) {
    double v12 = 1.0;
  }
  double v13 = v8 + v12 * (v10 - v8);
  return [v11 dateWithTimeIntervalSinceReferenceDate:v13];
}

@end