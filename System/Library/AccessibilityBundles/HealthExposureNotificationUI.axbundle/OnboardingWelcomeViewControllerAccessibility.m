@interface OnboardingWelcomeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OnboardingWelcomeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExposureNotificationUI.OnboardingWelcomeViewController";
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
  v5.super_class = (Class)OnboardingWelcomeViewControllerAccessibility;
  [(OnboardingWelcomeViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(OnboardingWelcomeViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = [v3 _accessibilityFindDescendant:&__block_literal_global_0];

  [v4 _setAccessibilityTraitsBlock:&__block_literal_global_286];
}

uint64_t __90__OnboardingWelcomeViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 font];
  objc_super v5 = [v4 fontDescriptor];

  v6 = [v5 objectForKey:@"NSCTFontUIUsageAttribute"];
  v7 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2B0]];
  v8 = [v7 objectForKey:@"NSCTFontUIUsageAttribute"];
  char v9 = [v6 isEqualToString:v8];

  if (v9) {
    uint64_t v10 = 1;
  }
  else {
LABEL_4:
  }
    uint64_t v10 = 0;

  return v10;
}

uint64_t __90__OnboardingWelcomeViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return *MEMORY[0x263F1CEF8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OnboardingWelcomeViewControllerAccessibility;
  [(OnboardingWelcomeViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(OnboardingWelcomeViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end