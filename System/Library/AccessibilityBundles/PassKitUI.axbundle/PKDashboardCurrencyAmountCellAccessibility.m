@interface PKDashboardCurrencyAmountCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PKDashboardCurrencyAmountCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKDashboardCurrencyAmountCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKDashboardCurrencyAmountCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PKDashboardCurrencyAmountCell" hasInstanceVariable:@"_currencyLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKDashboardCurrencyAmountCellAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PKDashboardCurrencyAmountCellAccessibility *)self safeUIViewForKey:@"_currencyLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end