@interface PSReversedSubtitleDisclosureTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_axCellSelf;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PSReversedSubtitleDisclosureTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSReversedSubtitleDisclosureTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCellSelf
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();

  return v2;
}

- (id)accessibilityLabel
{
  v2 = [(PSReversedSubtitleDisclosureTableCellAccessibility *)self _axCellSelf];
  v3 = [v2 titleLabel];
  v4 = [v3 accessibilityLabel];

  v5 = [v2 detailTextLabel];
  v6 = [v5 accessibilityLabel];

  v7 = __AXStringForVariables();

  return v7;
}

- (id)accessibilityValue
{
  v2 = [(PSReversedSubtitleDisclosureTableCellAccessibility *)self _axCellSelf];
  v3 = [v2 valueLabel];
  v4 = [v3 accessibilityLabel];

  return v4;
}

@end