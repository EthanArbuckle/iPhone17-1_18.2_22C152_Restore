@interface STUIStatusBarBluetoothItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STUIStatusBarBluetoothItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  v27.receiver = self;
  v27.super_class = (Class)STUIStatusBarBluetoothItemAccessibility;
  [(STUIStatusBarBluetoothItemAccessibility *)&v27 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarBluetoothItemAccessibility *)self _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  char v26 = 0;
  objc_opt_class();
  v4 = [(STUIStatusBarBluetoothItemAccessibility *)self safeValueForKey:@"imageView"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 image];
  v7 = [v6 accessibilityIdentifier];

  if (([v7 isEqualToString:@"bluetooth"] & 1) != 0
    || [v7 isEqualToString:@"headphones"])
  {
    v8 = accessibilityLocalizedString(@"bluetooth");
    if (!v3)
    {
LABEL_22:
      objc_msgSend(v5, "setIsAccessibilityElement:", 1, v23, v24);
      [v5 setAccessibilityLabel:v8];
      uint64_t v22 = [v5 accessibilityTraits];
      [v5 setAccessibilityTraits:v22 & ~*MEMORY[0x263F1CF00]];

      goto LABEL_23;
    }
    v9 = [v3 safeValueForKeyPath:@"data.bluetoothEntry"];
    v10 = v9;
    if (!v9)
    {
LABEL_21:

      goto LABEL_22;
    }
    if ([v9 safeBoolForKey:@"isEnabled"])
    {
      unint64_t v11 = [v10 safeIntegerForKey:@"state"];
      if (v11 > 2) {
        goto LABEL_10;
      }
      v12 = off_26515C9E8[v11];
    }
    else
    {
      v12 = @"bluetooth.off";
    }
    uint64_t v13 = accessibilityLocalizedString(v12);

    v8 = (void *)v13;
LABEL_10:
    v14 = [v3 safeValueForKeyPath:@"data.bluetoothEntry.batteryEntry"];
    v15 = v14;
    if (!v14)
    {
LABEL_20:

      goto LABEL_21;
    }
    v16 = [v14 safeStringForKey:@"detailString"];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __85__STUIStatusBarBluetoothItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      v25[3] = &unk_26515C8F8;
      v25[4] = self;
      [v5 setAccessibilityValueBlock:v25];
      if ([v15 safeIntegerForKey:@"capacity"] < 0)
      {
        v20 = 0;
        goto LABEL_19;
      }
      if ([v7 isEqualToString:@"headphones"]) {
        v19 = @"status.bluetooth.headphones.battery.charge";
      }
      else {
        v19 = @"status.bluetooth.generic.battery.charge";
      }
      accessibilityLocalizedString(v19);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v18;
LABEL_19:
    v23 = v20;
    v24 = @"__AXStringForVariablesSentinel";
    uint64_t v21 = __UIAXStringForVariables();

    v8 = (void *)v21;
    goto LABEL_20;
  }
LABEL_23:
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarBluetoothItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarBluetoothItem" isKindOfClass:@"STUIStatusBarIndicatorItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorItem" hasProperty:@"imageView" withType:"@"];
  [v3 validateClass:@"STUIStatusBarItemUpdate" hasProperty:@"data" withType:"@"];
  [v3 validateClass:@"STStatusBarData" hasProperty:@"bluetoothEntry" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataEntry", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataBatteryEntry", @"capacity", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataBluetoothEntry", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataBluetoothEntry", @"batteryEntry", "@", 0);
}

id __85__STUIStatusBarBluetoothItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  v2 = [v1 safeValueForKeyPath:@"data.bluetoothEntry.batteryEntry"];
  id v3 = __UIAccessibilitySafeClass();

  if (![v3 isEnabled] || objc_msgSend(v3, "capacity") < 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = AXFormatFloatWithPercentage();
  }

  return v4;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarBluetoothItemAccessibility;
  id v6 = a3;
  v7 = [(STUIStatusBarBluetoothItemAccessibility *)&v9 applyUpdate:v6 toDisplayItem:a4];
  [(STUIStatusBarBluetoothItemAccessibility *)self _accessibilitySetRetainedValue:v6, @"AccessibilityStatusBarUpdateData", v9.receiver, v9.super_class forKey];

  [(STUIStatusBarBluetoothItemAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v7;
}

@end