@interface BCBatteryWidgetRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation BCBatteryWidgetRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BCBatteryWidgetRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BCBatteryWidgetRowView", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BCBatteryWidgetRowView", @"glyphImage", "@", 0);
  [v3 validateClass:@"BCBatteryWidgetRowView" hasInstanceVariable:@"_percentCharge" withType:"NSUInteger"];
  [v3 validateClass:@"BCBatteryWidgetRowView" hasInstanceVariable:@"_charging" withType:"B"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(BCBatteryWidgetRowViewAccessibility *)self safeValueForKey:@"name"];
  v4 = [(BCBatteryWidgetRowViewAccessibility *)self safeValueForKey:@"glyphImage"];
  v7 = [v4 accessibilityLabel];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (id)accessibilityValue
{
  [(BCBatteryWidgetRowViewAccessibility *)self safeUnsignedIntegerForKey:@"_percentCharge"];
  if ([(BCBatteryWidgetRowViewAccessibility *)self safeBoolForKey:@"_charging"]) {
    id v3 = @"device.charge.value.charging";
  }
  else {
    id v3 = @"device.charge.value";
  }
  v4 = accessibilityLocalizedString(v3);
  v5 = NSString;
  v6 = AXFormatFloatWithPercentage();
  v7 = objc_msgSend(v5, "stringWithFormat:", v4, v6);

  return v7;
}

@end