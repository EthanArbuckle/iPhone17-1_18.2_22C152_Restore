@interface _UIStatusBarTimeItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UIStatusBarTimeItemAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIStatusBarTimeItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarTimeItem";
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
  v3 = @"_UIStatusBarTimeItem";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"pillTimeView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"shortTimeView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"dateView", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarTimeItemAccessibility;
  [(_UIStatusBarTimeItemAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v5 = (id)[(_UIStatusBarTimeItemAccessibility *)v8 safeUIViewForKey:@"timeView"];
  objc_msgSend(v5, "_accessibilitySetBoolValue:forKey:", 1);
  id v4 = (id)[(_UIStatusBarTimeItemAccessibility *)v8 safeUIViewForKey:@"shortTimeView"];
  [v4 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsTime"];
  id v3 = (id)[(_UIStatusBarTimeItemAccessibility *)v8 safeUIViewForKey:@"pillTimeView"];
  [v3 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsPillTime"];
  id v2 = (id)[(_UIStatusBarTimeItemAccessibility *)v8 safeUIViewForKey:@"dateView"];
  [v2 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsDate"];
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
}

- (_UIStatusBarTimeItemAccessibility)init
{
  SEL v5 = a2;
  objc_super v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarTimeItemAccessibility;
  objc_super v6 = [(_UIStatusBarTimeItemAccessibility *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(_UIStatusBarTimeItemAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  }
  id v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

@end