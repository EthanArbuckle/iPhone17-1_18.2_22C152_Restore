@interface CSBatteryChargingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation CSBatteryChargingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSBatteryChargingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end