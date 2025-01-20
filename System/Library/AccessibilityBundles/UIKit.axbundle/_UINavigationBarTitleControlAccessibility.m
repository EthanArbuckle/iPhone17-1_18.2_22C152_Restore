@interface _UINavigationBarTitleControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UINavigationBarTitleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UINavigationBarTitleControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = @"_UINavigationBarTitleControl";
  v3 = @"UIControl";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v4 = "B";
  [location[0] validateClass:@"UIControl" hasInstanceMethod:@"canBecomeFocused" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"isInteractive", v4, 0);
  v6 = "@";
  [location[0] validateClass:v5 hasInstanceMethod:@"titleLabel" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"titleView", v6, 0);
  objc_storeStrong(v8, v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15 = self;
  SEL v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationBarTitleControlAccessibility;
  [(_UINavigationBarTitleControlAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  char v11 = 0;
  objc_opt_class();
  id v8 = (id)[(_UINavigationBarTitleControlAccessibility *)v15 safeValueForKey:@"titleLabel"];
  id v10 = (id)__UIAccessibilityCastAsClass();

  id v9 = v10;
  objc_storeStrong(&v10, 0);
  id v12 = v9;
  [v9 setIsAccessibilityElement:1];
  if (v12)
  {
    if ([(_UINavigationBarTitleControlAccessibility *)v15 safeBoolForKey:@"isInteractive"])
    {
      [v12 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
      id v4 = v12;
      id v7 = (id)[v12 text];
      id v6 = (id)UIKitAccessibilityLocalizedString();
      id v5 = (id)__UIAXStringForVariables();
      objc_msgSend(v4, "setAccessibilityLabel:", v6, @"__AXStringForVariablesSentinel");
    }
    else
    {
      [v12 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
      id v2 = v12;
      id v3 = (id)[v12 text];
      objc_msgSend(v2, "setAccessibilityLabel:");
    }
  }
  objc_storeStrong(&v12, 0);
}

- (BOOL)canBecomeFocused
{
  id v8 = self;
  v7[1] = (id)a2;
  char v6 = 0;
  objc_opt_class();
  id v3 = (id)[(_UINavigationBarTitleControlAccessibility *)v8 safeValueForKey:@"titleLabel"];
  id v5 = (id)__UIAccessibilityCastAsClass();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  BOOL v9 = v4
    && ([(_UINavigationBarTitleControlAccessibility *)v8 _accessibilityIsFKARunningForFocusItem] & 1) != 0&& ([(_UINavigationBarTitleControlAccessibility *)v8 safeBoolForKey:@"isInteractive"] & 1) != 0;
  objc_storeStrong(v7, 0);
  return v9;
}

@end