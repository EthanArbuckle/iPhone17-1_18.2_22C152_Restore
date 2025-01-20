@interface HKOnboardingBaseViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setUpConstraints;
@end

@implementation HKOnboardingBaseViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKOnboardingBaseViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setUpConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)HKOnboardingBaseViewControllerAccessibility;
  [(HKOnboardingBaseViewControllerAccessibility *)&v3 setUpConstraints];
  [(HKOnboardingBaseViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end