@interface PBAAlertControllerVisualStyleActionSheet
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
@end

@implementation PBAAlertControllerVisualStyleActionSheet

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SBFEffectiveHomeButtonType();
  [v3 layoutMargins];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  if (v4 == 2) {
    double v11 = 40.0;
  }
  else {
    double v11 = 44.0;
  }
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v11;
  result.left = v13;
  result.top = v12;
  return result;
}

@end