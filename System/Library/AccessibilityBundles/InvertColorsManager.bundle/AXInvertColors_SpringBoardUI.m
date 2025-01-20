@interface AXInvertColors_SpringBoardUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SpringBoardUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIBackgroundView", @"_backgroundColorForDarkenAlpha:andProgress:", "@", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIBackgroundView", @"_updateAppearanceForBackgroundStyle:transitionToSettings:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIBackgroundView", @"beginTransitionToBackgroundStyle:", "v", "q", 0);
  [v3 validateClass:@"SBUIActionView" hasInstanceVariable:@"_action" withType:"SBUIAction"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIAction", @"badgeView", "@", 0);
  [v3 validateClass:@"SBUIActionView" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIActionView", @"_setupSubviews", "v", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SBUIBackgroundViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBUIActionViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end