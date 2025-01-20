@interface WGNewWidgetsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation WGNewWidgetsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGNewWidgetsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGNewWidgetsButton", @"text", "@", 0);
  [v3 validateClass:@"WGNewWidgetsButton" hasInstanceVariable:@"_overlayButton" withType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(WGNewWidgetsButtonAccessibility *)self safeValueForKey:@"text"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (BOOL)accessibilityActivate
{
  v2 = [(WGNewWidgetsButtonAccessibility *)self safeValueForKey:@"_overlayButton"];
  char v3 = [v2 accessibilityActivate];

  return v3;
}

@end