@interface HFTemperatureIconDescriptorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation HFTemperatureIconDescriptorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HFTemperatureIconDescriptor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityValue
{
  objc_opt_class();
  v3 = [(HFTemperatureIconDescriptorAccessibility *)self safeValueForKey:@"formattedTemperature"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end