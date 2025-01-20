@interface HROnboardingElectrocardiogramResultViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateExpandedViewState;
@end

@implementation HROnboardingElectrocardiogramResultViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HROnboardingElectrocardiogramResultView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HROnboardingElectrocardiogramResultView", @"numberedTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HROnboardingElectrocardiogramResultView", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HROnboardingElectrocardiogramResultView", @"expandedView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HROnboardingElectrocardiogramResultView", @"_updateExpandedViewState", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramResultViewAccessibility;
  [(HROnboardingElectrocardiogramResultViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HROnboardingElectrocardiogramResultViewAccessibility *)self safeValueForKey:@"numberedTitleLabel"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v4];
}

- (void)_updateExpandedViewState
{
  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramResultViewAccessibility;
  [(HROnboardingElectrocardiogramResultViewAccessibility *)&v5 _updateExpandedViewState];
  if ([(HROnboardingElectrocardiogramResultViewAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
    uint64_t v4 = [(HROnboardingElectrocardiogramResultViewAccessibility *)self safeValueForKey:@"expandedView"];
    UIAccessibilityPostNotification(v3, v4);
  }
}

@end