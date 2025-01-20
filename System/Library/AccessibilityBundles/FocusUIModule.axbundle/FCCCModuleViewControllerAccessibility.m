@interface FCCCModuleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityButtonView;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation FCCCModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FCCCModuleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FCCCModuleViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"FCUIActivityPickerViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"FCCCModuleViewController" hasInstanceVariable:@"_activeTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"FCCCModuleViewController" hasInstanceVariable:@"_onStateLabel" withType:"UILabel"];
  [v3 validateClass:@"FCCCModuleViewController" hasInstanceVariable:@"_roundButtonVC" withType:"CCUILabeledRoundButtonViewController"];
  [v3 validateClass:@"FCCCModuleViewController" hasInstanceVariable:@"_activeActivity" withType:"<FCActivityDescribing>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButtonViewController", @"button", "@", 0);
  [v3 validateProtocol:@"FCActivityDescribing" hasRequiredInstanceMethod:@"activityDisplayName"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15.receiver = self;
  v15.super_class = (Class)FCCCModuleViewControllerAccessibility;
  [(FCCCModuleViewControllerAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(FCCCModuleViewControllerAccessibility *)self _accessibilityButtonView];
  [v3 setIsAccessibilityElement:0];

  v4 = [(FCCCModuleViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v4 setIsAccessibilityElement:1];
  v5 = accessibilityLocalizedString(@"focus.module.label");
  [v4 setAccessibilityLabel:v5];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12[3] = &unk_265121D20;
  objc_copyWeak(&v13, &location);
  [v4 _setAccessibilityValueBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v10[3] = &unk_265121D48;
  objc_copyWeak(&v11, &location);
  [v4 _setAccessibilityTraitsBlock:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v8[3] = &unk_265121DB0;
  objc_copyWeak(&v9, &location);
  [v4 _setAccessibilityCustomActionsBlock:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v6[3] = &unk_265121DD8;
  objc_copyWeak(&v7, &location);
  [v4 _setAccessibilityActivationPointBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

id __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v2 = accessibilityLocalizedString(@"focus.module.label");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained safeValueForKey:@"_activeTitleLabel"];
  v5 = [v4 accessibilityLabel];

  if ([v5 localizedCaseInsensitiveCompare:v2]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

uint64_t __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1CEE8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"_activeActivity"];

  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v1;
}

id __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityButtonView];
  id v3 = [v2 accessibilityCustomActions];

  return v3;
}

double __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityButtonView];
  [v2 accessibilityActivationPoint];
  double v4 = v3;

  return v4;
}

- (id)_accessibilityButtonView
{
  return (id)[(FCCCModuleViewControllerAccessibility *)self safeValueForKeyPath:@"_roundButtonVC.button"];
}

@end