@interface STUIStatusBarBatteryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axInStatusBar;
@end

@implementation STUIStatusBarBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarBatteryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBar"];
  [v3 validateClass:@"STUIStatusBarBatteryView" isKindOfClass:@"_UIBatteryView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(STUIStatusBarBatteryViewAccessibility *)self accessibilityUserDefinedLabel];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_opt_class();
    v5 = __UIAccessibilityCastAsClass();
    [v5 chargePercent];
    v6 = NSString;
    v7 = accessibilityLocalizedString(@"status.battery.capacity");
    v8 = AXFormatFloatWithPercentage();
    v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

    v10 = 0;
    if ([v5 saverModeActive])
    {
      v10 = accessibilityLocalizedString(@"status.low.power.mode");
    }
    __UIAXStringForVariables();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)accessibilityValue
{
  id v3 = [(STUIStatusBarBatteryViewAccessibility *)self accessibilityUserDefinedValue];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_13;
  }
  char v12 = 0;
  objc_opt_class();
  v6 = __UIAccessibilityCastAsClass();
  if ([v6 showsInlineChargingIndicator])
  {
    uint64_t v7 = [v6 chargingState];
    if ((unint64_t)(v7 - 1) >= 2)
    {
      if (v7)
      {
        v11.receiver = self;
        v11.super_class = (Class)STUIStatusBarBatteryViewAccessibility;
        uint64_t v9 = [(STUIStatusBarBatteryViewAccessibility *)&v11 accessibilityValue];
        goto LABEL_11;
      }
      v8 = @"status.not.charging";
    }
    else
    {
      v8 = @"status.battery.charging";
    }
    uint64_t v9 = accessibilityLocalizedString(v8);
LABEL_11:
    id v5 = (id)v9;
    goto LABEL_12;
  }
  id v5 = 0;
LABEL_12:

LABEL_13:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarBatteryViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(STUIStatusBarBatteryViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0] | *MEMORY[0x263F81368];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  if (-[STUIStatusBarBatteryViewAccessibility _axInStatusBar](self)) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarBatteryViewAccessibility;
  return [(STUIStatusBarBatteryViewAccessibility *)&v4 _accessibilitySupportsActivateAction];
}

- (void)_axInStatusBar
{
  if (result)
  {
    v1 = [result _accessibilityAncestorIsKindOf:MEMORY[0x245665C20](@"STUIStatusBar")];

    return (void *)(v1 != 0);
  }
  return result;
}

@end