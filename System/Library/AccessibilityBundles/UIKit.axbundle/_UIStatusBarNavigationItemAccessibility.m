@interface _UIStatusBarNavigationItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UIStatusBarNavigationItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIStatusBarNavigationItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarNavigationItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIStatusBarNavigationItem";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"applyUpdate:toDisplayItem:", v4, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarItemUpdate", @"data", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarData", @"backNavigationEntry", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDataStringEntry", @"stringValue", v4, 0);
  objc_storeStrong(v6, v5);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarNavigationItemAccessibility;
  [(_UIStatusBarNavigationItemAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  id v2 = (id)[(_UIStatusBarNavigationItemAccessibility *)v5 safeUIViewForKey:@"nameView"];
  [v2 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsBreadcrumb"];
  [v2 setAccessibilityRespondsToUserInteraction:1];
  [v2 setAccessibilityTraits:*MEMORY[0x263F813F0] | *MEMORY[0x263F1CEE8]];
  objc_storeStrong(&v2, 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  v14.receiver = v18;
  v14.super_class = (Class)_UIStatusBarNavigationItemAccessibility;
  id v15 = [(_UIStatusBarNavigationItemAccessibility *)&v14 applyUpdate:location[0] toDisplayItem:v16];
  id v7 = (id)[location[0] safeValueForKey:@"data"];
  id v6 = (id)[v7 safeValueForKey:@"backNavigationEntry"];
  id v13 = (id)[v6 safeStringForKey:@"stringValue"];

  id v11 = (id)[(_UIStatusBarNavigationItemAccessibility *)v18 safeUIViewForKey:@"nameView"];
  v8 = NSString;
  id v10 = accessibilityLocalizedString(@"breadcrumb.return.to.app");
  id v9 = (id)[v8 stringWithFormat:v13];
  objc_msgSend(v11, "setAccessibilityLabel:");

  id v12 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);

  return v12;
}

- (_UIStatusBarNavigationItemAccessibility)init
{
  SEL v5 = a2;
  id v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarNavigationItemAccessibility;
  id v6 = [(_UIStatusBarNavigationItemAccessibility *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(_UIStatusBarNavigationItemAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  }
  objc_super v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

@end