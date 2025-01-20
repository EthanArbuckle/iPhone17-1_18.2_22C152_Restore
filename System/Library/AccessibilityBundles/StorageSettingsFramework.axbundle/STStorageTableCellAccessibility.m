@interface STStorageTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STStorageTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STStorageTableCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageTableCell" hasInstanceVariable:@"_infoLabel" withType:"UILabel"];
  [v3 validateClass:@"STStorageTableCell" hasInstanceVariable:@"_sizeLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStorageTableCell", @"infoHidden", "B", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(STStorageTableCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _sizeLabel"];
  if ([(STStorageTableCellAccessibility *)self safeBoolForKey:@"infoHidden"])
  {
    v4 = [(STStorageTableCellAccessibility *)self safeUIViewForKey:@"_infoLabel"];
    v7 = [v4 accessibilityLabel];
    uint64_t v5 = __UIAXStringForVariables();

    id v3 = (void *)v5;
  }

  return v3;
}

@end