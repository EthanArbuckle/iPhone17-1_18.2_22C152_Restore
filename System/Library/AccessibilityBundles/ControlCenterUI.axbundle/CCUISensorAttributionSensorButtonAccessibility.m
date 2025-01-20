@interface CCUISensorAttributionSensorButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CCUISensorAttributionSensorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUISensorAttributionSensorButton";
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
  v2 = [(CCUISensorAttributionSensorButtonAccessibility *)self safeValueForKey:@"descriptionLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

@end