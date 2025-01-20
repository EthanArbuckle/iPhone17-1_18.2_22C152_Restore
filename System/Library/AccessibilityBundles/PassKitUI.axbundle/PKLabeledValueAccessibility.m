@interface PKLabeledValueAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PKLabeledValueAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKLabeledValue";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKLabeledValue" hasInstanceVariable:@"_label" withType:"NSString"];
  [v3 validateClass:@"PKLabeledValue" hasInstanceVariable:@"_value" withType:"NSString"];
}

- (id)accessibilityLabel
{
  return (id)[(PKLabeledValueAccessibility *)self _accessibilityStringForLabelKeyValues:@"_label, _value"];
}

@end