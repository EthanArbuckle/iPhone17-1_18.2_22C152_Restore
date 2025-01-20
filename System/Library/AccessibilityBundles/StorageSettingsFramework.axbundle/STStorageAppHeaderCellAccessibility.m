@interface STStorageAppHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation STStorageAppHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageAppHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STStorageAppHeaderCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageAppHeaderCell" hasInstanceVariable:@"_vendorLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageAppHeaderCell" hasInstanceVariable:@"_infoLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(STStorageAppHeaderCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _infoLabel, _vendorLabel"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

@end