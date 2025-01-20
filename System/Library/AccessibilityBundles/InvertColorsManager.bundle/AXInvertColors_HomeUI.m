@interface AXInvertColors_HomeUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_HomeUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUDashboardViewController"];
  [v3 validateClass:@"HUDashboardNavigationBar"];
  [v3 validateClass:@"HUDashboardViewController" isKindOfClass:@"HUControllableItemCollectionViewController"];
  [v3 validateClass:@"HUQuickControlRingSliderView"];
  [v3 validateClass:@"HUColorSwatchView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUColorSwatchView", @"circleLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUColorSwatchView", @"selectedCircleLayer", "@", 0);
  [v3 validateClass:@"HUColorPickerView"];
  [v3 validateClass:@"HUQuickControlSliderValueOverlayView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"HUDashboardViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"HUDashboardNavigationBarInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"HUQuickControlRingSliderViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"HUColorSwatchViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"HUColorPickerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"HUQuickControlSliderValueOverlayViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end