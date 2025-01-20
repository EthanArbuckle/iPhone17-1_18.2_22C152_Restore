@interface VehicleCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VehicleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VehicleCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VehicleCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"VehicleCell" hasInstanceVariable:@"_batteryChargeView" withType:"VehicleBatteryView"];
  [v3 validateClass:@"VehicleBatteryView" hasInstanceVariable:@"_percentLabel" withType:"UILabel"];
  [v3 validateClass:@"VehicleBatteryView" hasInstanceVariable:@"_batteryStateAgeView" withType:"BatteryStateAgeView"];
  [v3 validateClass:@"BatteryStateAgeView" hasInstanceVariable:@"_stateUpdatedLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BatteryStateAgeView", @"dateOfLastSync", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(VehicleCellAccessibility *)self safeValueForKey:@"_batteryChargeView"];
  v4 = [(VehicleCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  v5 = [v4 accessibilityLabel];
  v6 = NSString;
  v7 = AXMapsLocString(@"VEHICLE_BATTERY_LEVEL");
  v8 = [v3 safeValueForKey:@"_percentLabel"];
  v9 = [v8 accessibilityLabel];
  v22 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v9);
  v10 = __UIAXStringForVariables();

  v11 = objc_msgSend(v3, "safeValueForKey:", @"_batteryStateAgeView", v22, @"__AXStringForVariablesSentinel");
  v12 = [v11 safeValueForKey:@"_stateUpdatedLabel"];
  if ([v12 _accessibilityViewIsVisible])
  {
    v13 = [v12 accessibilityLabel];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      objc_opt_class();
      v15 = [v11 safeValueForKey:@"dateOfLastSync"];
      v16 = __UIAccessibilityCastAsClass();

      if (v16)
      {
        if (accessibilityLabel_onceToken != -1) {
          dispatch_once(&accessibilityLabel_onceToken, &__block_literal_global_2);
        }
        v17 = (void *)accessibilityLabel_Formatter;
        v18 = [MEMORY[0x263EFF910] date];
        v19 = [v17 localizedStringForDate:v16 relativeToDate:v18];

        uint64_t v20 = __UIAXStringForVariables();

        v10 = (void *)v20;
      }
    }
  }

  return v10;
}

uint64_t __46__VehicleCellAccessibility_accessibilityLabel__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)accessibilityLabel_Formatter;
  accessibilityLabel_Formatter = v0;

  v2 = (void *)accessibilityLabel_Formatter;

  return [v2 setDateTimeStyle:1];
}

@end