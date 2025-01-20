@interface STStorageMediaItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation STStorageMediaItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageMediaItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STStorageMediaItemCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageMediaItemCell" hasInstanceVariable:@"_infoLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageMediaItemCell" hasInstanceVariable:@"_sizeLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  return (id)[(STStorageMediaItemCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _infoLabel"];
}

- (id)accessibilityValue
{
  return (id)[(STStorageMediaItemCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_sizeLabel"];
}

@end