@interface HRSpeedBumpViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HRSpeedBumpViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HRSpeedBumpViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HRSpeedBumpViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HRSpeedBumpViewController", @"titleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HRSpeedBumpViewControllerAccessibility;
  [(HRSpeedBumpViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HRSpeedBumpViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v4];
}

@end