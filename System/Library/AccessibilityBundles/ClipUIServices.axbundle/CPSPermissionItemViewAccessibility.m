@interface CPSPermissionItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axLabeledSwitchStack;
- (id)_axPermissionSwitch;
- (id)_axSwitchLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CPSPermissionItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CPSPermissionItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CPSPermissionItemView", @"setOn:", "v", "B", 0);
  [v3 validateClass:@"CPSPermissionItemView" hasInstanceVariable:@"_permissionSwitch" withType:"UISwitch"];
  [v3 validateClass:@"CPSPermissionItemView" hasInstanceVariable:@"_switchWithLabelVisualEffectView" withType:"UIVisualEffectView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIVisualEffectView", @"contentView", "@", 0);
  [v3 validateClass:@"CPSVibrantLabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)CPSPermissionItemViewAccessibility;
  [(CPSPermissionItemViewAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(CPSPermissionItemViewAccessibility *)self _axLabeledSwitchStack];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [(CPSPermissionItemViewAccessibility *)self _axPermissionSwitch];
  [v4 setIsAccessibilityElement:1];
  v6 = [(CPSPermissionItemViewAccessibility *)self _axSwitchLabel];
  v7 = [v6 accessibilityLabel];
  [v4 setAccessibilityLabel:v7];

  objc_msgSend(v4, "setAccessibilityTraits:", objc_msgSend(v5, "accessibilityTraits"));
  objc_initWeak(&location, self);
  v8 = [v5 accessibilityValue];
  [v4 setAccessibilityValue:v8];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v14[3] = &unk_265116280;
  id v9 = v5;
  id v15 = v9;
  [v4 _setAccessibilityValueBlock:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v11[3] = &unk_2651162D0;
  objc_copyWeak(&v13, &location);
  id v10 = v9;
  id v12 = v10;
  [v4 _setAccessibilityActivateBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityValue];
}

uint64_t __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

void __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) accessibilityValue];
  objc_msgSend(v1, "setOn:", objc_msgSend(v2, "BOOLValue") ^ 1);
}

- (id)_axLabeledSwitchStack
{
  id v2 = [(CPSPermissionItemViewAccessibility *)self safeValueForKey:@"_switchWithLabelVisualEffectView"];
  id v3 = [v2 safeUIViewForKey:@"contentView"];

  id v4 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_2];

  return v4;
}

uint64_t __59__CPSPermissionItemViewAccessibility__axLabeledSwitchStack__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axPermissionSwitch
{
  return (id)[(CPSPermissionItemViewAccessibility *)self safeUIViewForKey:@"_permissionSwitch"];
}

- (id)_axSwitchLabel
{
  id v2 = [(CPSPermissionItemViewAccessibility *)self _axLabeledSwitchStack];
  id v3 = [v2 _accessibilityFindSubviewDescendant:&__block_literal_global_302];

  return v3;
}

uint64_t __52__CPSPermissionItemViewAccessibility__axSwitchLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245647820](@"CPSVibrantLabel");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end