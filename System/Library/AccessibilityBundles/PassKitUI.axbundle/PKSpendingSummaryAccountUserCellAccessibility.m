@interface PKSpendingSummaryAccountUserCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKSpendingSummaryAccountUserCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSpendingSummaryAccountUserCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKSpendingSummaryAccountUserCell" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  [v3 validateClass:@"PKSpendingSummaryAccountUserCell" hasInstanceVariable:@"_amountLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PKSpendingSummaryAccountUserCellAccessibility *)self safeValueForKey:@"_nameLabel"];
  v6 = [(PKSpendingSummaryAccountUserCellAccessibility *)self safeValueForKey:@"_amountLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end