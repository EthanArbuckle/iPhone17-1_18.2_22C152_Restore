@interface _UIStaticScrollBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIStaticScrollBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStaticScrollBar";
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
  v3 = @"_UIStaticScrollBar";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", 0);
  v4 = "UIButton";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, @"_upButton");
  [location[0] validateClass:v3 hasInstanceVariable:@"_downButton" withType:v4];
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)_UIStaticScrollBarAccessibility;
  [(_UIStaticScrollBarAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v2 = (id)[(_UIStaticScrollBarAccessibility *)v6 safeValueForKey:@"_upButton"];
  [v2 setAccessibilityIdentifier:@"ScrollUp"];

  id v3 = (id)[(_UIStaticScrollBarAccessibility *)v6 safeValueForKey:@"_downButton"];
  [v3 setAccessibilityIdentifier:@"ScrollDown"];
}

- (void)willMoveToWindow:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIStaticScrollBarAccessibility;
  [(_UIStaticScrollBarAccessibility *)&v3 willMoveToWindow:location[0]];
  [(_UIStaticScrollBarAccessibility *)v5 _accessibilityLoadAccessibilityInformation];
  objc_storeStrong(location, 0);
}

@end