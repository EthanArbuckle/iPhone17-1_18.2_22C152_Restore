@interface _CSDoubleBatteryChargingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _CSDoubleBatteryChargingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_CSDoubleBatteryChargingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_CSDoubleBatteryChargingView" hasInstanceVariable:@"_internalChargingNameLabel" withType:"SBUILegibilityLabel"];
  [v3 validateClass:@"_CSDoubleBatteryChargingView" hasInstanceVariable:@"_internalChargePercentLabel" withType:"SBUILegibilityLabel"];
  [v3 validateClass:@"_CSDoubleBatteryChargingView" hasInstanceVariable:@"_externalChargingNameLabel" withType:"SBUILegibilityLabel"];
  [v3 validateClass:@"_CSDoubleBatteryChargingView" hasInstanceVariable:@"_externalChargePercentLabel" withType:"SBUILegibilityLabel"];
  [v3 validateClass:@"_CSDoubleBatteryChargingView" hasInstanceVariable:@"_internalChargingIndicator" withType:"UIImageView"];
  [v3 validateClass:@"_CSDoubleBatteryChargingView" hasInstanceVariable:@"_externalChargingIndicator" withType:"UIImageView"];
}

- (id)accessibilityLabel
{
  id v3 = [(_CSDoubleBatteryChargingViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_internalChargingNameLabel, _internalChargePercentLabel"];
  v4 = [(_CSDoubleBatteryChargingViewAccessibility *)self safeUIViewForKey:@"_internalChargingIndicator"];
  int v5 = [v4 _accessibilityViewIsVisible];

  if (v5)
  {
    v6 = accessibilitySBLocalizedString(@"charging");
    v15 = v3;
    v16 = @"__AXStringForVariablesSentinel";
    uint64_t v7 = __AXStringForVariables();

    id v3 = (void *)v7;
  }
  v8 = [(_CSDoubleBatteryChargingViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_externalChargingNameLabel, _externalChargePercentLabel", v15, v16];
  v9 = [(_CSDoubleBatteryChargingViewAccessibility *)self safeUIViewForKey:@"_externalChargingIndicator"];
  int v10 = [v9 _accessibilityViewIsVisible];

  if (v10)
  {
    v11 = accessibilitySBLocalizedString(@"charging");
    uint64_t v12 = __AXStringForVariables();

    v8 = (void *)v12;
  }
  v13 = __AXStringForVariables();

  return v13;
}

@end