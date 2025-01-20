@interface _UIKeyShortcutHUDShortcutInputViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIKeyShortcutHUDShortcutInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyShortcutHUDShortcutInputView";
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
  v3 = @"_UIKeyShortcutHUDShortcutInputView";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"inputLabel", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDShortcutInputViewAccessibility;
  [(_UIKeyShortcutHUDShortcutInputViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = (id)[(_UIKeyShortcutHUDShortcutInputViewAccessibility *)v6 safeValueForKey:@"modifiersLabel"];
  [v3 setIsAccessibilityElement:0];
  id v2 = (id)[(_UIKeyShortcutHUDShortcutInputViewAccessibility *)v6 safeValueForKey:@"inputLabel"];
  [v2 setIsAccessibilityElement:0];
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
}

@end