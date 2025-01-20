@interface BCUIAvocadoViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axKeySuffixForParts:(unint64_t)a3;
- (id)_axLabelForBatteryDevice:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5;
@end

@implementation BCUIAvocadoViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BCUIAvocadoViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BCUIAvocadoViewController", @"invalidateBatteryDeviceState", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BCUIAvocadoViewController", @"_configureBatteryDeviceView:withBatteryDevice:transitionCoordinator:", "v", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)BCUIAvocadoViewControllerAccessibility;
  [(BCUIAvocadoViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  AXPerformSafeBlock();
}

uint64_t __84__BCUIAvocadoViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateBatteryDeviceState];
}

- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BCUIAvocadoViewControllerAccessibility;
  [(BCUIAvocadoViewControllerAccessibility *)&v22 _configureBatteryDeviceView:v8 withBatteryDevice:v9 transitionCoordinator:v10];
  objc_opt_class();
  v11 = __UIAccessibilityCastAsClass();

  v12 = [v11 name];
  v13 = [(BCUIAvocadoViewControllerAccessibility *)self _axLabelForBatteryDevice:v11];
  v14 = NSString;
  v15 = accessibilityLocalizedString(@"battery.center.device.percent");
  [v11 percentCharge];
  v16 = AXFormatFloatWithPercentage();
  v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

  v18 = 0;
  if ([v11 isCharging])
  {
    v18 = accessibilityLocalizedString(@"battery.center.device.charging");
  }
  if ([v11 isLowBattery])
  {
    v19 = accessibilityLocalizedString(@"battery.center.low.battery");
  }
  else
  {
    v19 = 0;
  }
  if ([v11 isLowPowerModeActive])
  {
    v20 = accessibilityLocalizedString(@"battery.center.low.power.mode");
  }
  else
  {
    v20 = 0;
  }
  v21 = __UIAXStringForVariables();
  objc_msgSend(v8, "setAccessibilityLabel:", v21, v13, v17, v18, v19, v20, @"__AXStringForVariablesSentinel");

  [v8 setIsAccessibilityElement:v11 != 0];
  [v8 setAccessibilityTraits:*MEMORY[0x263F1CF48]];
}

- (id)_axLabelForBatteryDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 vendor];
  uint64_t v6 = [v4 accessoryCategory];
  uint64_t v7 = [v4 safeIntegerForKey:@"transportType"];
  if (v5 == 2)
  {
    v16 = @"battery.center.beats";
    goto LABEL_32;
  }
  if (v5 != 1)
  {
    uint64_t v17 = v6 - 1;
    if ((unint64_t)(v6 - 1) < 0xA)
    {
      v18 = off_26510DDB0;
LABEL_30:
      v16 = v18[v17];
      goto LABEL_32;
    }
LABEL_31:
    v16 = 0;
    goto LABEL_32;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [v4 productIdentifier];
  uint64_t v10 = [v4 parts];
  if (v8 == 2)
  {
    if (v9 == *MEMORY[0x263F29DA8] || v9 == *MEMORY[0x263F29DF8])
    {
      v16 = @"battery.center.case";
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (v8 != 3) {
    goto LABEL_28;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *MEMORY[0x263F29DC0];
  if (v9 == *MEMORY[0x263F29DA0] || v9 == *MEMORY[0x263F29DB8] || v9 == v12)
  {
    if (v9 == v12)
    {
      v15 = [@"battery.center.airpods" stringByAppendingString:@".pro"];
    }
    else
    {
      v15 = @"battery.center.airpods";
    }
    v20 = [(BCUIAvocadoViewControllerAccessibility *)self _axKeySuffixForParts:v11];
    v16 = [(__CFString *)v15 stringByAppendingString:v20];

    if (v16) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (v9 == *MEMORY[0x263F29DB0])
  {
    v16 = @"battery.center.beats.x";
    goto LABEL_32;
  }
  if (v9 == *MEMORY[0x263F29DC8])
  {
    v16 = @"battery.center.powerbeats";
    goto LABEL_32;
  }
  if (v9 == *MEMORY[0x263F29DD0])
  {
    v16 = @"battery.center.beats.solo";
    goto LABEL_32;
  }
  if (v9 == *MEMORY[0x263F29DD8])
  {
    v16 = @"battery.center.powerbeats.4";
    goto LABEL_32;
  }
  if (v9 == *MEMORY[0x263F29DE0])
  {
    v16 = @"battery.center.beats.solo.pro";
    goto LABEL_32;
  }
  if (v9 == *MEMORY[0x263F29DE8])
  {
    v16 = @"battery.center.beats.studio";
    goto LABEL_32;
  }
  if (v9 == *MEMORY[0x263F29DF0])
  {
    v23 = [(BCUIAvocadoViewControllerAccessibility *)self _axKeySuffixForParts:v10];
    v16 = @"battery.center.beats.powerbeats.pro";
    id v24 = (id)[@"battery.center.beats.powerbeats.pro" stringByAppendingString:v23];

    goto LABEL_32;
  }
  if (v9 != *MEMORY[0x263F29D98])
  {
LABEL_28:
    uint64_t v17 = v6 - 1;
    if ((unint64_t)(v6 - 1) < 0xA)
    {
      v18 = off_26510DD60;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v16 = @"battery.center.magic.mouse";
LABEL_32:
  v21 = accessibilityLocalizedString(v16);

  return v21;
}

- (id)_axKeySuffixForParts:(unint64_t)a3
{
  id v3 = @".left";
  id v4 = @".case";
  unint64_t v5 = a3 & 3;
  if ((a3 & 4) == 0) {
    id v4 = &stru_26F639078;
  }
  if (v5 == 2) {
    id v4 = @".right";
  }
  if (v5 != 1) {
    id v3 = v4;
  }
  if (a3) {
    return v3;
  }
  else {
    return &stru_26F639078;
  }
}

@end