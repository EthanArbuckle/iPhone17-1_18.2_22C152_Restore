@interface GAXStyleProvider_Pad
- (BOOL)workspaceInstructionsLabelShouldBeDisplayed;
- (UIEdgeInsets)hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:(int64_t)a3;
- (double)featureViewControllerHeight;
@end

@implementation GAXStyleProvider_Pad

- (double)featureViewControllerHeight
{
  return 95.0;
}

- (BOOL)workspaceInstructionsLabelShouldBeDisplayed
{
  return 0;
}

- (UIEdgeInsets)hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2) {
    double v3 = 52.0;
  }
  else {
    double v3 = 63.0;
  }
  v4 = +[UIScreen mainScreen];
  [v4 scale];
  double v6 = v3 + 1.0 / v5;

  double v7 = 84.0;
  double v8 = v3;
  double v9 = v6;
  double v10 = 84.0;
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

@end