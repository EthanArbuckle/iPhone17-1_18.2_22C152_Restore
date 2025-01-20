@interface HROnboardingHeroExplanationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HROnboardingHeroExplanationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HROnboardingHeroExplanationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)HROnboardingHeroExplanationViewControllerAccessibility;
  [(HROnboardingHeroExplanationViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v3 = [(HROnboardingHeroExplanationViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
}

@end