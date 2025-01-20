@interface OnboardingInfoViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OnboardingInfoViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExposureNotificationUI.OnboardingInfoViewController";
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
  v5.receiver = self;
  v5.super_class = (Class)OnboardingInfoViewControllerAccessibility;
  [(OnboardingInfoViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(OnboardingInfoViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = [v3 _accessibilityDescendantOfType:objc_opt_class()];

  [v4 _setAccessibilityTraitsBlock:&__block_literal_global_1];
}

uint64_t __87__OnboardingInfoViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OnboardingInfoViewControllerAccessibility;
  [(OnboardingInfoViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(OnboardingInfoViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end