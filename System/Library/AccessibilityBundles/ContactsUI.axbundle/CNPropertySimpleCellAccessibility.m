@interface CNPropertySimpleCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CNPropertySimpleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertySimpleCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPropertySimpleCell" hasInstanceVariable:@"_labelLabel" withType:"UILabel"];
  [v3 validateClass:@"CNPropertySimpleCell" hasInstanceVariable:@"_valueLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  v2 = [(CNPropertySimpleCellAccessibility *)self safeValueForKey:@"_labelLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(CNPropertySimpleCellAccessibility *)self safeValueForKey:@"_valueLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end