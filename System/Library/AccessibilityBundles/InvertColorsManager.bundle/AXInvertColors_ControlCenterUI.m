@interface AXInvertColors_ControlCenterUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_ControlCenterUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIModuleCollectionView"];
  [v3 validateClass:@"CCUIModularControlCenterOverlayViewController" hasInstanceVariable:@"_scrollView" withType:"CCUIScrollView_Legacy"];
  [v3 validateClass:@"CCUIModularControlCenterOverlayViewController" hasInstanceVariable:@"_headerPocketView" withType:"CCUIHeaderPocketView"];
  [v3 validateClass:@"CCUIModularControlCenterOverlayViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CCUIContentModuleContainerView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CCUIContentModuleContainerViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CCUIContentModuleContainerViewController" hasInstanceVariable:@"_contentView" withType:"UIView"];
  [v3 validateClass:@"CCUIContentModuleContainerViewController" hasInstanceVariable:@"_contentContainerView" withType:"CCUIContentModuleContentContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"viewWillLayoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"clickPresentationInteractionShouldBegin:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContentContainerView", @"moduleProvidesOwnPlatter", "B", 0);
  [v3 validateClass:@"CCUIContentModuleContentContainerView" hasInstanceVariable:@"_moduleMaterialView" withType:"MTMaterialView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_materialLayer", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"CCUIModuleCollectionViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CCUIModularControlCenterOverlayViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CCUIContentModuleContainerViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CCUIContentModuleContentContainerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end