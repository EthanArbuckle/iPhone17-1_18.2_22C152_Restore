@interface BCUIRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation BCUIRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BCUIRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIBatteryView", @"isLowBattery", "B", 0);
  [v3 validateClass:@"_UIStaticBatteryView" isKindOfClass:@"_UIBatteryView"];
  [v3 validateClass:@"BCUIRowView" hasInstanceVariable:@"_batteryView" withType:"_UIStaticBatteryView"];
  [v3 validateClass:@"BCUIRowView" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(BCUIRowViewAccessibility *)self safeValueForKey:@"_batteryView"];
  char v4 = [v3 safeBoolForKey:@"isLowBattery"];

  v5 = [(BCUIRowViewAccessibility *)self safeValueForKey:@"_nameLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = [(BCUIRowViewAccessibility *)self safeValueForKey:@"_batteryView"];
  v8 = [v7 accessibilityLabel];
  v9 = [(BCUIRowViewAccessibility *)self safeValueForKey:@"_batteryView"];
  v10 = [v9 accessibilityValue];
  if (v4)
  {
    v13 = accessibilityLocalizedString(@"battery.center.low.battery");
    v11 = __UIAXStringForVariables();
  }
  else
  {
    v11 = __UIAXStringForVariables();
  }

  return v11;
}

@end