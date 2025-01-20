@interface STStorageAppCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation STStorageAppCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageAppCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STStorageAppCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageAppCell" hasInstanceVariable:@"_sizeLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageAppCell" hasInstanceVariable:@"_infoLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(STStorageAppCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _sizeLabel, _infoLabel"];
}

@end