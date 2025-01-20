@interface MailTrackingProtectionOnboardingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureCell:(id)a3 viewModel:(id)a4;
@end

@implementation MailTrackingProtectionOnboardingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailTrackingProtectionOnboardingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailTrackingProtectionOnboardingViewController", @"_configureCell:viewModel:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailTrackingProtectionOnboardingViewController", @"collectionView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)MailTrackingProtectionOnboardingViewControllerAccessibility;
  [(MailTrackingProtectionOnboardingViewControllerAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_opt_class();
  id v3 = [(MailTrackingProtectionOnboardingViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 visibleCells];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) _setAccessibilityAdditionalTraitsBlock:&__block_literal_global_0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

uint64_t __105__MailTrackingProtectionOnboardingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x263F1CEE8];
}

- (void)_configureCell:(id)a3 viewModel:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MailTrackingProtectionOnboardingViewControllerAccessibility;
  id v5 = a3;
  [(MailTrackingProtectionOnboardingViewControllerAccessibility *)&v6 _configureCell:v5 viewModel:a4];
  objc_msgSend(v5, "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_285, v6.receiver, v6.super_class);
}

uint64_t __88__MailTrackingProtectionOnboardingViewControllerAccessibility__configureCell_viewModel___block_invoke()
{
  return *MEMORY[0x263F1CEE8];
}

@end