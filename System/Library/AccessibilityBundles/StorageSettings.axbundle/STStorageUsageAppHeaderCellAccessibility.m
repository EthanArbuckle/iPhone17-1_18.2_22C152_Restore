@interface STStorageUsageAppHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STStorageUsageAppHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageUsageAppHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STStorageUsageAppHeaderCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageUsageAppHeaderCell" hasInstanceVariable:@"_infoLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageUsageAppHeaderCell" hasInstanceVariable:@"_vendorLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  return (id)[(STStorageUsageAppHeaderCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _infoLabel, _vendorLabel"];
}

@end