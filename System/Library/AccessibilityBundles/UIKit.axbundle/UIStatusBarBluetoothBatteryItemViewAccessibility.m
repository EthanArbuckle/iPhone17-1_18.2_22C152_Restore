@interface UIStatusBarBluetoothBatteryItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarBluetoothBatteryItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarBluetoothBatteryItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (id)[(UIStatusBarBluetoothBatteryItemViewAccessibility *)self safeValueForKey:@"_capacity"];
  [v3 intValue];

  v4 = NSString;
  id v6 = accessibilityLocalizedString(@"status.bluetooth.battery.format");
  id v5 = (id)AXFormatFloatWithPercentage();
  id v7 = (id)objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarBluetoothBatteryItemViewAccessibility;
  return [(UIStatusBarBluetoothBatteryItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end