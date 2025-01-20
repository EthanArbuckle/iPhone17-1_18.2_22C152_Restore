@interface _UIBatteryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_axInStatusBar;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBatteryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UIStatusBar"];
  v3 = @"_UIBatteryView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v4 = "B";
  [location[0] validateClass:v3 hasInstanceMethod:@"saverModeActive" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"chargingState", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"showsInlineChargingIndicator", v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(_UIBatteryViewAccessibility *)self storedIsAccessibilityElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 1;
  }
  id v4 = (id)[(_UIBatteryViewAccessibility *)self storedIsAccessibilityElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (id)accessibilityLabel
{
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)[(_UIBatteryViewAccessibility *)self accessibilityUserDefinedLabel];
  if (v13[0])
  {
    id v15 = v13[0];
    int v12 = 1;
  }
  else
  {
    [(_UIBatteryViewAccessibility *)v14 safeCGFloatForKey:@"chargePercent"];
    v11[1] = v2;
    BOOL v7 = NSString;
    id v9 = accessibilityLocalizedString(@"status.battery.capacity");
    id v8 = (id)AXFormatFloatWithPercentage();
    v11[0] = (id)objc_msgSend(v7, "stringWithFormat:", v9, v8);

    id v10 = 0;
    if ([(_UIBatteryViewAccessibility *)v14 safeBoolForKey:@"saverModeActive"])
    {
      id v3 = accessibilityLocalizedString(@"status.low.power.mode");
      id v4 = v10;
      id v10 = v3;
    }
    id v15 = (id)__UIAXStringForVariables();
    int v12 = 1;
    objc_storeStrong(&v10, 0);
    objc_storeStrong(v11, 0);
  }
  objc_storeStrong(v13, 0);
  BOOL v5 = v15;

  return v5;
}

- (id)accessibilityValue
{
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)[(_UIBatteryViewAccessibility *)self accessibilityUserDefinedValue];
  if (v15[0])
  {
    id v17 = v15[0];
    int v14 = 1;
  }
  else
  {
    v13[8] = 0;
    char v2 = [(_UIBatteryViewAccessibility *)v16 safeBoolForKey:@"showsInlineChargingIndicator"];
    *(void *)v13 = v2 & 1;
    if (v2)
    {
      uint64_t v12 = [(_UIBatteryViewAccessibility *)v16 safeIntegerForKey:@"chargingState"];
      if (v12)
      {
        if ((unint64_t)(v12 - 1) > 1)
        {
          v11.receiver = v16;
          v11.super_class = (Class)_UIBatteryViewAccessibility;
          id v7 = [(_UIBatteryViewAccessibility *)&v11 accessibilityValue];
          id v8 = *(void **)&v13[1];
          *(void *)&v13[1] = v7;
        }
        else
        {
          id v3 = accessibilityLocalizedString(@"status.battery.charging");
          id v4 = *(void **)&v13[1];
          *(void *)&v13[1] = v3;
        }
      }
      else
      {
        id v5 = accessibilityLocalizedString(@"status.not.charging");
        v6 = *(void **)&v13[1];
        *(void *)&v13[1] = v5;
      }
    }
    id v17 = *(id *)&v13[1];
    int v14 = 1;
    objc_storeStrong((id *)&v13[1], 0);
  }
  objc_storeStrong(v15, 0);
  id v9 = v17;

  return v9;
}

- (BOOL)_axInStatusBar
{
  if (a1)
  {
    id v2 = (id)[a1 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_UistatusbarBas_0.isa)];

    return v2 != 0;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)accessibilityTraits
{
  v6 = self;
  SEL v5 = a2;
  unint64_t v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIBatteryViewAccessibility;
  unint64_t v4 = [(_UIBatteryViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF68];
  if (-[_UIBatteryViewAccessibility _axInStatusBar](v6)) {
    v4 |= *MEMORY[0x263F813F0] | *MEMORY[0x263F81368];
  }
  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  SEL v5 = self;
  SEL v4 = a2;
  if (-[_UIBatteryViewAccessibility _axInStatusBar](self)) {
    return 1;
  }
  v3.receiver = v5;
  v3.super_class = (Class)_UIBatteryViewAccessibility;
  return [(_UIBatteryViewAccessibility *)&v3 _accessibilitySupportsActivateAction];
}

- (id)accessibilityHint
{
  v6 = self;
  SEL v5 = a2;
  if (-[_UIBatteryViewAccessibility _axInStatusBar](self))
  {
    id v7 = AXStatusBarItemHint(v6);
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)_UIBatteryViewAccessibility;
    id v7 = [(_UIBatteryViewAccessibility *)&v4 accessibilityHint];
  }
  id v2 = v7;

  return v2;
}

@end