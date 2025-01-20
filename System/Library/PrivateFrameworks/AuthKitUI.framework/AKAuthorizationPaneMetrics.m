@interface AKAuthorizationPaneMetrics
+ (CGSize)cellIconSize;
+ (CGSize)iconSize;
+ (UIEdgeInsets)paneAdditionSafeAreaInsets;
+ (double)blurryTrayHeight;
+ (double)clearButtonWidth;
+ (double)confirmButtonTrailingSpacing;
+ (double)confirmButtonWidth;
+ (double)contentOffsetThresholdToShowBlurTray;
+ (double)continueButtonBottomSpacing;
+ (double)continueButtonCornerRadius;
+ (double)continueButtonHeight;
+ (double)continueButtonTextHorizontalPadding;
+ (double)continueButtonTopSpacing;
+ (double)continueButtonWidth;
+ (double)editPaneInfoLabelHorizontalPadding;
+ (double)emailCellHeight;
+ (double)headerHeight;
+ (double)iconBottomSpacing;
+ (double)iconTopSpacing;
+ (double)infoLabelBottomSpacing;
+ (double)infoLabelToTableSpacing;
+ (double)interBulletSpacing;
+ (double)interScopeFieldSpacing;
+ (double)keyboardAccessoryViewHeight;
+ (double)maximumContentHeightFactor;
+ (double)nameCellHeight;
+ (double)paneCornerRadius;
+ (double)privacyInfoToLinkBottomSpacing;
+ (double)privacyInfoTopSpacing;
+ (double)privacyLinkBottomSpacing;
+ (double)privacyLinkTopSpacing;
+ (double)selectEmailCellHeight;
+ (double)tableSectionFooterHeight;
+ (double)titleBottomSpacing;
+ (double)titleToSmallTitleVerticalSpacing;
+ (double)titleTopSpacing;
+ (double)upgradeAccountInterItemSpacing;
+ (double)upgradeAccountTopSpacing;
+ (double)useOtherAppleIDBottomSpacing;
+ (double)useOtherAppleIDTopSpacing;
+ (double)userOtherAppleIDLeadingSpacing;
@end

@implementation AKAuthorizationPaneMetrics

+ (CGSize)iconSize
{
  double v2 = 54.0;
  double v3 = 54.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)cellIconSize
{
  double v2 = 40.5;
  double v3 = 40.5;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)titleTopSpacing
{
  return 24.0;
}

+ (double)titleBottomSpacing
{
  return 24.0;
}

+ (double)titleToSmallTitleVerticalSpacing
{
  return 2.0;
}

+ (double)interBulletSpacing
{
  return 20.0;
}

+ (double)privacyLinkTopSpacing
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 22.0;
  }
  else {
    double v3 = 10.0;
  }

  return v3;
}

+ (double)privacyInfoTopSpacing
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 22.0;
  }
  else {
    double v3 = 10.0;
  }

  return v3;
}

+ (double)privacyInfoToLinkBottomSpacing
{
  return 0.0;
}

+ (double)privacyLinkBottomSpacing
{
  return 22.0;
}

+ (double)continueButtonTopSpacing
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 32.0;
  }
  else {
    double v3 = 16.0;
  }

  return v3;
}

+ (double)continueButtonBottomSpacing
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 32.0;
  }
  else {
    double v3 = 44.0;
  }

  return v3;
}

+ (double)continueButtonHeight
{
  return 44.0;
}

+ (double)continueButtonWidth
{
  return 270.0;
}

+ (double)continueButtonTextHorizontalPadding
{
  return 27.0;
}

+ (double)continueButtonCornerRadius
{
  return 10.0;
}

+ (double)paneCornerRadius
{
  return 10.0;
}

+ (UIEdgeInsets)paneAdditionSafeAreaInsets
{
  double v2 = 10.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)iconTopSpacing
{
  return 16.0;
}

+ (double)iconBottomSpacing
{
  return 16.0;
}

+ (double)headerHeight
{
  return 22.0;
}

+ (double)nameCellHeight
{
  return 60.0;
}

+ (double)emailCellHeight
{
  return 60.0;
}

+ (double)selectEmailCellHeight
{
  return 44.0;
}

+ (double)clearButtonWidth
{
  return 20.0;
}

+ (double)upgradeAccountTopSpacing
{
  return 32.0;
}

+ (double)upgradeAccountInterItemSpacing
{
  return 36.0;
}

+ (double)keyboardAccessoryViewHeight
{
  return 44.0;
}

+ (double)infoLabelToTableSpacing
{
  return 26.0;
}

+ (double)interScopeFieldSpacing
{
  return 10.0;
}

+ (double)tableSectionFooterHeight
{
  return 0.0;
}

+ (double)blurryTrayHeight
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 100.0;
  }
  else {
    double v3 = 120.0;
  }

  return v3;
}

+ (double)maximumContentHeightFactor
{
  return 0.86;
}

+ (double)editPaneInfoLabelHorizontalPadding
{
  return 50.0;
}

+ (double)contentOffsetThresholdToShowBlurTray
{
  return 8.0;
}

+ (double)infoLabelBottomSpacing
{
  return 24.0;
}

+ (double)useOtherAppleIDTopSpacing
{
  return 16.0;
}

+ (double)useOtherAppleIDBottomSpacing
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    double v3 = 0.0;
  }
  else {
    double v3 = 12.0;
  }

  return v3;
}

+ (double)userOtherAppleIDLeadingSpacing
{
  return 15.0;
}

+ (double)confirmButtonWidth
{
  return 218.0;
}

+ (double)confirmButtonTrailingSpacing
{
  return -15.0;
}

@end