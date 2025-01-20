@interface _UIStatusBarBluetoothItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIStatusBarBluetoothItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarBluetoothItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIStatusBarIndicatorItem";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UIStatusBarBluetoothItem");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", @"_UIStatusBarIndicatorItem", @"imageView");
  [location[0] validateClass:@"_UIStatusBarItemUpdate" hasProperty:@"data" withType:"@"];
  [location[0] validateClass:@"_UIStatusBarData" hasProperty:@"bluetoothEntry" withType:"@"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDataEntry", @"isEnabled", "B", 0);
  v4 = "q";
  [location[0] validateClass:@"_UIStatusBarDataBatteryEntry" hasInstanceMethod:@"capacity" withFullSignature:0];
  v5 = @"_UIStatusBarDataBluetoothEntry";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"batteryEntry", v6, 0);
  objc_storeStrong(v8, v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v38 = self;
  SEL v37 = a2;
  v36.receiver = self;
  v36.super_class = (Class)_UIStatusBarBluetoothItemAccessibility;
  [(_UIStatusBarBluetoothItemAccessibility *)&v36 _accessibilityLoadAccessibilityInformation];
  id v35 = (id)[(_UIStatusBarBluetoothItemAccessibility *)v38 _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  char v33 = 0;
  objc_opt_class();
  id v21 = (id)[(_UIStatusBarBluetoothItemAccessibility *)v38 safeValueForKey:@"imageView"];
  id v32 = (id)__UIAccessibilityCastAsClass();

  id v31 = v32;
  objc_storeStrong(&v32, 0);
  id v34 = v31;
  id v20 = (id)[v31 image];
  id v30 = (id)[v20 accessibilityIdentifier];

  if (([v30 isEqualToString:@"bluetooth"] & 1) != 0
    || ([v30 isEqualToString:@"headphones"] & 1) != 0)
  {
    id v29 = accessibilityLocalizedString(@"bluetooth");
    id v28 = 0;
    if (v35)
    {
      id v27 = (id)[v35 safeValueForKeyPath:@"data.bluetoothEntry"];
      if (v27)
      {
        if ([v27 safeBoolForKey:@"isEnabled"] & 1)
        {
          uint64_t v25 = [v27 safeIntegerForKey:@"state"];
          if (v25)
          {
            if (v25 == 1)
            {
              id v4 = accessibilityLocalizedString(@"status.bluetooth.connected");
              id v5 = v29;
              id v29 = v4;
            }
            else if (v25 == 2)
            {
              id v6 = accessibilityLocalizedString(@"status.bluetooth.headphones.connected");
              id v7 = v29;
              id v29 = v6;
            }
          }
          else
          {
            id v8 = accessibilityLocalizedString(@"status.bluetooth.disconnected");
            id v9 = v29;
            id v29 = v8;
          }
        }
        else
        {
          id v2 = accessibilityLocalizedString(@"bluetooth.off");
          id v3 = v29;
          id v29 = v2;
        }
        id v24 = (id)[v35 safeValueForKeyPath:@"data.bluetoothEntry.batteryEntry"];
        if (v24)
        {
          id obj = (id)[v24 safeStringForKey:@"detailString"];
          id v22 = 0;
          if (obj)
          {
            objc_storeStrong(&v22, obj);
          }
          else if ([v24 safeIntegerForKey:@"capacity"] >= 0)
          {
            id v10 = (id)AXFormatFloatWithPercentage();
            id v11 = v28;
            id v28 = v10;

            if ([v30 isEqualToString:@"headphones"]) {
              id v12 = accessibilityLocalizedString(@"status.bluetooth.headphones.battery.charge");
            }
            else {
              id v12 = accessibilityLocalizedString(@"status.bluetooth.generic.battery.charge");
            }
            id v13 = v22;
            id v22 = v12;
          }
          id v17 = v22;
          v18 = @"__AXStringForVariablesSentinel";
          id v14 = (id)__UIAXStringForVariables();
          id v15 = v29;
          id v29 = v14;

          objc_storeStrong(&v22, 0);
          objc_storeStrong(&obj, 0);
        }
        objc_storeStrong(&v24, 0);
      }
      objc_storeStrong(&v27, 0);
    }
    objc_msgSend(v34, "setAccessibilityValue:", v28, v17, v18);
    [v34 setIsAccessibilityElement:1];
    [v34 setAccessibilityLabel:v29];
    id v19 = v34;
    uint64_t v16 = [v34 accessibilityTraits];
    [v19 setAccessibilityTraits:v16 & ~*MEMORY[0x263F1CF00]];
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarBluetoothItemAccessibility;
  id v8 = [(_UIStatusBarBluetoothItemAccessibility *)&v7 applyUpdate:location[0] toDisplayItem:v9];
  [(_UIStatusBarBluetoothItemAccessibility *)v11 _accessibilitySetRetainedValue:location[0] forKey:@"AccessibilityStatusBarUpdateData"];
  [(_UIStatusBarBluetoothItemAccessibility *)v11 _accessibilityLoadAccessibilityInformation];
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v6;
}

@end