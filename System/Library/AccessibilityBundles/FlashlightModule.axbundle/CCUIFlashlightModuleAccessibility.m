@interface CCUIFlashlightModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CCUIFlashlightModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIFlashlightModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleAccessibility;
  [(CCUIFlashlightModuleAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CCUIFlashlightModuleAccessibility *)self safeValueForKey:@"contentViewController"];
  [v3 _accessibilityLoadAccessibilityInformation];
}

@end