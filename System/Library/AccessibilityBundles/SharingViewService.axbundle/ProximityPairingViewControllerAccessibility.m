@interface ProximityPairingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_pairingComplete:(id)a3;
- (void)_showFailed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProximityPairingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProximityPairingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProximityPairingViewController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProximityPairingViewController", @"_showFailed", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProximityPairingViewController", @"_pairingComplete:", "v", "@", 0);
  [v3 validateClass:@"ProximityPairingViewController" hasInstanceVariable:@"_dismissButton" withType:"UIButton"];
  [v3 validateClass:@"ProximityPairingViewController" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"ProximityPairingViewController" hasInstanceVariable:@"_budsBatteryView" withType:"UIView"];
  [v3 validateClass:@"ProximityPairingViewController" hasInstanceVariable:@"_budsBatteryLabel" withType:"UILabel"];
  [v3 validateClass:@"ProximityPairingViewController" hasInstanceVariable:@"_mainBatteryView" withType:"UIView"];
  [v3 validateClass:@"ProximityPairingViewController" hasInstanceVariable:@"_mainBatteryLabel" withType:"UILabel"];
  [v3 validateClass:@"ProximityPairingViewController" hasInstanceVariable:@"_caseBatteryView" withType:"UIView"];
  [v3 validateClass:@"ProximityPairingViewController" hasInstanceVariable:@"_caseBatteryLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v28.receiver = self;
  v28.super_class = (Class)ProximityPairingViewControllerAccessibility;
  [(ProximityPairingViewControllerAccessibility *)&v28 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  v4 = accessibilityLocalizedString(@"dismiss.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  [v5 _accessibilitySetUserTestingIsCancelButton:1];

  v6 = [(ProximityPairingViewControllerAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  v7 = [v6 accessibilityLabel];

  objc_initWeak(&location, self);
  v8 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_budsBatteryView"];
  [v8 setIsAccessibilityElement:1];

  v9 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_budsBatteryView"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v25[3] = &unk_2651505D0;
  objc_copyWeak(&v26, &location);
  [v9 _setAccessibilityValueBlock:v25];

  v10 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_budsBatteryView"];
  [v10 setAccessibilityLabel:v7];

  v11 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_mainBatteryView"];
  [v11 setIsAccessibilityElement:1];

  v12 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_mainBatteryView"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v23[3] = &unk_2651505D0;
  objc_copyWeak(&v24, &location);
  [v12 _setAccessibilityValueBlock:v23];

  v13 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_mainBatteryView"];
  [v13 setAccessibilityLabel:v7];

  v14 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_caseBatteryView"];
  [v14 setIsAccessibilityElement:1];

  v15 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_caseBatteryView"];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v21 = &unk_2651505D0;
  objc_copyWeak(&v22, &location);
  [v15 _setAccessibilityValueBlock:&v18];

  v16 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_caseBatteryView", v18, v19, v20, v21];
  v17 = accessibilityB188LocalizedString(@"battery.case");
  [v16 setAccessibilityLabel:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

id __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_budsBatteryLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

id __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_mainBatteryLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

id __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_caseBatteryLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(ProximityPairingViewControllerAccessibility *)self safeValueForKey:@"_dismissButton"];
  char v3 = [v2 accessibilityActivate];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ProximityPairingViewControllerAccessibility;
  [(ProximityPairingViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(ProximityPairingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_pairingComplete:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ProximityPairingViewControllerAccessibility;
  [(ProximityPairingViewControllerAccessibility *)&v3 _pairingComplete:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_showFailed
{
  v2.receiver = self;
  v2.super_class = (Class)ProximityPairingViewControllerAccessibility;
  [(ProximityPairingViewControllerAccessibility *)&v2 _showFailed];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end