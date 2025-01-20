@interface STStorageSystemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STStorageSystemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageSystemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STStorageSystemCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageSystemCell" hasInstanceVariable:@"_sizeLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  return (id)[(STStorageSystemCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _sizeLabel"];
}

@end