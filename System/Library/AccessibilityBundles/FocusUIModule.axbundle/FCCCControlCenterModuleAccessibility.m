@interface FCCCControlCenterModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsOnboardingControlVisible;
- (id)_accessibilityModuleViewController;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation FCCCControlCenterModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FCCCControlCenterModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FCCCControlCenterModule" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"FCUIActivityPickerViewController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"FCUIActivityPickerViewController", @"isOnboardingEncountered", "B", 0);
  [v3 validateClass:@"FCCCControlCenterModule" hasInstanceVariable:@"_moduleViewController" withType:"FCCCModuleViewController"];
  [v3 validateClass:@"FCCCModuleViewController" hasInstanceVariable:@"_activeActivity" withType:"<FCActivityDescribing>"];
  [v3 validateClass:@"FCCCModuleViewController" hasInstanceVariable:@"_suggestedActivity" withType:"<FCActivityDescribing>"];
  [v3 validateClass:@"FCCCModuleViewController" hasInstanceVariable:@"_activeTitleLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)FCCCControlCenterModuleAccessibility;
  [(FCCCControlCenterModuleAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  id v3 = [(FCCCControlCenterModuleAccessibility *)self safeValueForKey:@"view"];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_265121CF8;
  objc_copyWeak(&v11, &location);
  [v3 _setIsAccessibilityElementBlock:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v8[3] = &unk_265121D20;
  objc_copyWeak(&v9, &location);
  [v3 _setAccessibilityLabelBlock:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v6[3] = &unk_265121D48;
  objc_copyWeak(&v7, &location);
  [v3 _setAccessibilityTraitsBlock:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v4[3] = &unk_265121D20;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityHintBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _accessibilityIsOnboardingControlVisible];

  return v2;
}

id __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityIsOnboardingControlVisible];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v5 = [v4 _accessibilityModuleViewController];
    v6 = [v5 safeValueForKey:@"_activeTitleLabel"];
    id v7 = [v6 accessibilityLabel];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained _accessibilityIsOnboardingControlVisible];

  uint64_t v3 = MEMORY[0x263F1CEE8];
  if (!v2) {
    uint64_t v3 = MEMORY[0x263F1CF18];
  }
  return *(void *)v3;
}

id __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained _accessibilityIsOnboardingControlVisible];

  if (v2)
  {
    uint64_t v3 = accessibilityLocalizedString(@"double.tap.to.explore.controls");
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityIsOnboardingControlVisible
{
  char v3 = objc_msgSend((id)MEMORY[0x24564D1F0](@"FCUIActivityPickerViewController", a2), "safeBoolForKey:", @"isOnboardingEncountered");
  id v4 = [(FCCCControlCenterModuleAccessibility *)self _accessibilityModuleViewController];
  uint64_t v5 = [v4 safeValueForKey:@"_activeActivity"];

  v6 = [(FCCCControlCenterModuleAccessibility *)self _accessibilityModuleViewController];
  uint64_t v7 = [v6 safeValueForKey:@"_suggestedActivity"];

  if (v5 | v7) {
    char v8 = v3 ^ 1;
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (id)_accessibilityModuleViewController
{
  return (id)[(FCCCControlCenterModuleAccessibility *)self safeValueForKey:@"_moduleViewController"];
}

@end