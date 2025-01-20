@interface STUsageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STUsageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUsageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUsageCell" hasInstanceVariable:@"_itemNameLabel" withType:"UILabel"];
  [v3 validateClass:@"STUsageCell" hasInstanceVariable:@"_usageLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  return (id)[(STUsageCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_itemNameLabel, _usageLabel"];
}

@end