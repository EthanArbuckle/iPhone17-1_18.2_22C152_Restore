@interface _UIFindNavigatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIFindNavigatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFindNavigatorView";
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
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIFindNavigatorView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v4 = "@";
  [location[0] validateClass:@"_UIFindNavigatorView" hasInstanceMethod:@"settingsButton" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"replaceTextField", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"previousResultButton", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"nextResultButton", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)_UIFindNavigatorViewAccessibility;
  [(_UIFindNavigatorViewAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v8 = (id)[(_UIFindNavigatorViewAccessibility *)v16 safeValueForKey:@"settingsButton"];
  id v7 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v8, "setAccessibilityLabel:");

  char v12 = 0;
  objc_opt_class();
  id v9 = (id)[(_UIFindNavigatorViewAccessibility *)v16 safeValueForKey:@"replaceTextField"];
  id v11 = (id)__UIAccessibilityCastAsClass();

  id v10 = v11;
  objc_storeStrong(&v11, 0);
  id v13 = v10;
  id v2 = (id)[v10 leftView];
  [v2 setIsAccessibilityElement:0];

  id v4 = (id)[(_UIFindNavigatorViewAccessibility *)v16 safeValueForKey:@"previousResultButton"];
  id v3 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v4, "setAccessibilityLabel:");

  id v6 = (id)[(_UIFindNavigatorViewAccessibility *)v16 safeValueForKey:@"nextResultButton"];
  id v5 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v6, "setAccessibilityLabel:");

  objc_storeStrong(&v13, 0);
}

@end