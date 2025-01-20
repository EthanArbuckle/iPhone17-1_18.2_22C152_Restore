@interface AXInvertColors_TVRemoteUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_TVRemoteUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVRUIRemoteViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_materialLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIButtonPanelView", @"initWithPrimaryButtonType:secondaryLeftButtons:secondaryRightButtons:styleProvider:", "@", "q", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIButtonPanelView", @"leftButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIButtonPanelView", @"rightButtons", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"TVRUIControlPanelViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"TVRUIButtonPanelViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"TVRUIRemoteViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end