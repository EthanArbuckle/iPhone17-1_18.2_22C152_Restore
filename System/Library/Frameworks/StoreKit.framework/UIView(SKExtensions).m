@interface UIView(SKExtensions)
- (BOOL)_sk_isAtLeast50PercentOnScreen;
@end

@implementation UIView(SKExtensions)

- (BOOL)_sk_isAtLeast50PercentOnScreen
{
  [a1 center];
  double v3 = v2;
  double v5 = v4;
  v6 = [a1 window];
  if (v6)
  {
    v7 = [a1 superview];
    objc_msgSend(v6, "convertPoint:fromView:", v7, v3, v5);
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    [v6 bounds];
    v14.x = v9;
    v14.y = v11;
    BOOL v12 = CGRectContainsPoint(v15, v14);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

@end