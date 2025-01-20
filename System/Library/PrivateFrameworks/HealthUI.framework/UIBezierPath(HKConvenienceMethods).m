@interface UIBezierPath(HKConvenienceMethods)
- (id)hk_firstPoint;
- (void)hk_applyBlock:()HKConvenienceMethods;
@end

@implementation UIBezierPath(HKConvenienceMethods)

- (void)hk_applyBlock:()HKConvenienceMethods
{
  id v4 = a1;
  id info = a3;
  CGPathApply((CGPathRef)[v4 CGPath], info, (CGPathApplierFunction)_RunBlockForPointsInPath);
}

- (id)hk_firstPoint
{
  if ([a1 isEmpty])
  {
    v2 = 0;
  }
  else
  {
    v3 = objc_opt_new();
    CGPathApply((CGPathRef)[a1 CGPath], v3, (CGPathApplierFunction)_FindFirstPoint);
    v2 = [v3 lastObject];
  }
  return v2;
}

@end