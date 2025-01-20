@interface NSValue(_HKPropertyAnimationExtensions)
- (BOOL)_hk_isCGPoint;
- (BOOL)_hk_isHKLinearTransform;
- (id)hk_midPointToValue:()_HKPropertyAnimationExtensions percentage:;
- (uint64_t)_hk_CGPointMidPointToValue:()_HKPropertyAnimationExtensions percentage:;
- (uint64_t)_hk_HKLinearTransformMidPointToValue:()_HKPropertyAnimationExtensions percentage:;
- (uint64_t)hk_animatable;
@end

@implementation NSValue(_HKPropertyAnimationExtensions)

- (uint64_t)hk_animatable
{
  if (objc_msgSend(a1, "_hk_isCGPoint")) {
    return 1;
  }
  return objc_msgSend(a1, "_hk_isHKLinearTransform");
}

- (BOOL)_hk_isCGPoint
{
  return strcmp((const char *)[objc_retainAutorelease(a1) objCType], "{CGPoint=dd}") == 0;
}

- (BOOL)_hk_isHKLinearTransform
{
  return strcmp((const char *)[objc_retainAutorelease(a1) objCType], "{HKLinearTransform=dd}") == 0;
}

- (id)hk_midPointToValue:()_HKPropertyAnimationExtensions percentage:
{
  id v6 = a4;
  if (objc_msgSend(a1, "_hk_isCGPoint"))
  {
    objc_msgSend(a1, "_hk_CGPointMidPointToValue:percentage:", v6, a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "_hk_isHKLinearTransform"))
  {
    objc_msgSend(a1, "_hk_HKLinearTransformMidPointToValue:percentage:", v6, a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = a1;
  }
  v8 = v7;

  return v8;
}

- (uint64_t)_hk_HKLinearTransformMidPointToValue:()_HKPropertyAnimationExtensions percentage:
{
  id v6 = a4;
  [a1 HKLinearTransformValue];
  double v8 = v7;
  double v10 = v9;
  [v6 HKLinearTransformValue];
  double v12 = v11;
  double v14 = v13;

  double v15 = fmax(a2, 0.0);
  double v16 = 1.0;
  if (v15 <= 1.0) {
    double v16 = v15;
  }
  double v17 = v8 + v16 * (v12 - v8);
  double v18 = v10 + v16 * (v14 - v10);
  v19 = (void *)MEMORY[0x1E4F29238];
  return objc_msgSend(v19, "valueWithHKLinearTransform:", v17, v18);
}

- (uint64_t)_hk_CGPointMidPointToValue:()_HKPropertyAnimationExtensions percentage:
{
  id v6 = a4;
  [a1 CGPointValue];
  double v8 = v7;
  double v10 = v9;
  [v6 CGPointValue];
  double v12 = v11;
  double v14 = v13;

  double v15 = fmax(a2, 0.0);
  double v16 = 1.0;
  if (v15 <= 1.0) {
    double v16 = v15;
  }
  double v17 = v8 + v16 * (v12 - v8);
  double v18 = v10 + v16 * (v14 - v10);
  v19 = (void *)MEMORY[0x1E4F29238];
  return objc_msgSend(v19, "valueWithCGPoint:", v17, v18);
}

@end