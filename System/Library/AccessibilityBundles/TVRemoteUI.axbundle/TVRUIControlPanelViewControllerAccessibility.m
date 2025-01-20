@interface TVRUIControlPanelViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVRUIControlPanelViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIControlPanelViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIControlPanelViewController", @"currentButtonPanel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIButtonPanelView", @"leftButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIButtonPanelView", @"primaryButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIButtonPanelView", @"rightButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIButtonPanelView", @"pagingButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIControlPanelViewControllerAccessibility;
  [(TVRUIControlPanelViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TVRUIControlPanelViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4 = [(TVRUIControlPanelViewControllerAccessibility *)self _axElements];
  [v3 setAccessibilityElements:v4];
}

- (id)_axElements
{
  v2 = [(TVRUIControlPanelViewControllerAccessibility *)self safeValueForKey:@"currentButtonPanel"];
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [v2 safeArrayForKey:@"leftButtons"];
  [v3 axSafelyAddObjectsFromArray:v4];

  objc_super v5 = [v2 safeValueForKey:@"primaryButton"];
  [v3 axSafelyAddObject:v5];

  v6 = [v2 safeArrayForKey:@"rightButtons"];
  [v3 axSafelyAddObjectsFromArray:v6];

  v7 = [v2 safeValueForKey:@"pagingButton"];
  [v3 axSafelyAddObject:v7];

  return v3;
}

@end