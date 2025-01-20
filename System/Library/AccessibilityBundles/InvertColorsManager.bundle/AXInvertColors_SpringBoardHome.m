@interface AXInvertColors_SpringBoardHome
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SpringBoardHome

+ (void)performValidations:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconImageView", @"iconView", "@", 0);
  [v6 validateClass:@"SBHAddWidgetSheetAppCollectionViewCell" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"mt_removeAllVisualStyling", "v", 0);
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHVisualStylingView", @"_updateVisualStyling", "v", 0);
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetStackViewController", @"_createBackgroundViewIfNecessary:", "v", "B", 0);
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetStackViewController", @"backgroundView", "@", 0);
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"_contextMenuInteraction:previewForIconWithConfigurationOptions:highlighted:", "@", "@", "Q", "B", 0);
  [v6 validateClass:@"SBFloatingDockView"];
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockView", @"mainPlatterView", "@", 0);
  [v6 validateClass:@"SBFloatingDockPlatterView"];
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockPlatterView", @"backgroundView", "@", 0);
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_materialLayer", "@", 0);
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetStackViewController", @"delegate", "@", 0);
  objc_msgSend(v6, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"delegate", "@", 0);
  v3 = +[NSBundle mainBundle];
  v4 = [v3 bundleIdentifier];
  unsigned int v5 = [v4 isEqualToString:AX_SpringBoardBundleName];

  if (v5) {
    [v6 validateClass:@"AMUIInfographViewController"];
  }
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SBIconListViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBIconImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBHAddWidgetSheetAppCollectionViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBFloatingDockViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBHVisualStylingViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBHWidgetStackViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBIconViewInvertColorsAccessibility" canInteractWithTargetClass:1];

  +[AXInvertColorsManager traverseAppForInvertColors];
}

+ (int64_t)helperType
{
  return 1;
}

@end