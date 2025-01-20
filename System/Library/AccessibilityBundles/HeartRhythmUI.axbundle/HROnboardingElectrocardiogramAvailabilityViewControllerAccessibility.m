@interface HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HROnboardingElectrocardiogramAvailabilityViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HROnboardingElectrocardiogramAvailabilityViewController", @"heroView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HROnboardingElectrocardiogramAvailabilityViewController", @"titleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility;
  [(HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility *)self safeValueForKey:@"heroView"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityHealthCinnamonLocalizedString(@"simulated.watch.ecg");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF00] | v5];
  v6 = [(HROnboardingElectrocardiogramAvailabilityViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v7 = [v6 accessibilityTraits];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v7];
}

@end