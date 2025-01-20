@interface ACSettingsSwitchViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation ACSettingsSwitchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSettingsSwitchView";
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
  v2 = [(ACSettingsSwitchViewAccessibility *)self safeValueForKey:@"title"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(ACSettingsSwitchViewAccessibility *)self safeValueForKey:@"switchControl"];
  v3 = [v2 safeValueForKey:@"isOn"];
  if ([v3 BOOLValue]) {
    v4 = @"settings.status.on";
  }
  else {
    v4 = @"settings.status.off";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(ACSettingsSwitchViewAccessibility *)self safeValueForKey:@"switchControl"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end