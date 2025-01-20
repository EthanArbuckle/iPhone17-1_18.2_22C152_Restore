@interface HROnboardingElectrocardiogramTakeRecordingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HROnboardingElectrocardiogramTakeRecordingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HROnboardingElectrocardiogramTakeRecordingViewController";
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
  v5.super_class = (Class)HROnboardingElectrocardiogramTakeRecordingViewControllerAccessibility;
  [(HROnboardingElectrocardiogramTakeRecordingViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(HROnboardingElectrocardiogramTakeRecordingViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v4];
}

@end