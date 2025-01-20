@interface STUIStatusBarNavigationItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (STUIStatusBarNavigationItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STUIStatusBarNavigationItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarNavigationItemAccessibility;
  [(STUIStatusBarNavigationItemAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarNavigationItemAccessibility *)self safeUIViewForKey:@"nameView"];
  [v3 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsBreadcrumb"];
  [v3 setAccessibilityRespondsToUserInteraction:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | *MEMORY[0x263F813F0]];
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarNavigationItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarNavigationItem", @"nameView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarNavigationItem", @"applyUpdate:toDisplayItem:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarItemUpdate", @"data", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarData", @"backNavigationEntry", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataStringEntry", @"stringValue", "@", 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarNavigationItemAccessibility;
  id v6 = a3;
  v7 = [(STUIStatusBarNavigationItemAccessibility *)&v16 applyUpdate:v6 toDisplayItem:a4];
  v8 = [v6 safeValueForKey:@"data"];

  v9 = [v8 safeValueForKey:@"backNavigationEntry"];
  v10 = [v9 safeStringForKey:@"stringValue"];

  v11 = [(STUIStatusBarNavigationItemAccessibility *)self safeUIViewForKey:@"nameView"];
  v12 = NSString;
  v13 = accessibilityLocalizedString(@"breadcrumb.return.to.app");
  v14 = objc_msgSend(v12, "stringWithFormat:", v13, v10);
  [v11 setAccessibilityLabel:v14];

  return v7;
}

- (STUIStatusBarNavigationItemAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarNavigationItemAccessibility;
  v2 = [(STUIStatusBarNavigationItemAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(STUIStatusBarNavigationItemAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

@end