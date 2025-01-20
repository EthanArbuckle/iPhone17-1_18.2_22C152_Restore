@interface AMUIOnboardingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation AMUIOnboardingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AMUIOnboardingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AMUIOnboardingView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"AMUIOnboardingView" hasInstanceVariable:@"_continueButton" withType:"UIButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AMUIOnboardingViewAccessibility;
  [(AMUIOnboardingViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AMUIOnboardingViewAccessibility *)self safeValueForKey:@"_continueButton"];
  v4 = accessibilityLocalizedString(@"continue.button");
  [v3 setAccessibilityLabel:v4];

  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIOnboardingViewAccessibility;
  [(AMUIOnboardingViewAccessibility *)&v3 layoutSubviews];
  [(AMUIOnboardingViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end