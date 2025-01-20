@interface _CSSingleBatteryChargingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _CSSingleBatteryChargingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_CSSingleBatteryChargingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(_CSSingleBatteryChargingViewAccessibility *)self safeUIViewForKey:@"_chargePercentLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end