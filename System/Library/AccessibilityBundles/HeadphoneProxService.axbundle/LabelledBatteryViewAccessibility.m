@interface LabelledBatteryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axBatteryType;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_axSetBatteryType:(id)a3;
@end

@implementation LabelledBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HeadphoneProxService.LabelledBatteryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axBatteryType
{
}

- (void)_axSetBatteryType:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HeadphoneProxService.LabelledBatteryView"];
  [v3 validateClass:@"HeadphoneProxService.LabelledBatteryView" hasSwiftField:@"batteryView" withSwiftType:"_UIBatteryView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(LabelledBatteryViewAccessibility *)self safeSwiftValueForKey:@"batteryView"];
  v4 = [v3 accessibilityLabel];
  v5 = [(LabelledBatteryViewAccessibility *)self _axBatteryType];
  v8 = accessibilityLocalizedString(v5);
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityValue
{
  v2 = [(LabelledBatteryViewAccessibility *)self safeSwiftValueForKey:@"batteryView"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(LabelledBatteryViewAccessibility *)self safeSwiftValueForKey:@"batteryView"];
  id v3 = [v2 accessibilityHint];

  return v3;
}

@end