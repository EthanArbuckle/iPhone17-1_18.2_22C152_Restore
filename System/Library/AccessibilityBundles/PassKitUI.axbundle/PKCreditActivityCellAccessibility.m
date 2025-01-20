@interface PKCreditActivityCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKCreditActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCreditActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKCreditActivityCell" hasInstanceVariable:@"_labelTitle" withType:"UILabel"];
  [v3 validateClass:@"PKCreditActivityCell" hasInstanceVariable:@"_chartView" withType:"PKSpendingSummaryChartView"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PKCreditActivityCellAccessibility *)self safeUIViewForKey:@"_labelTitle"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PKCreditActivityCellAccessibility *)self safeUIViewForKey:@"_chartView"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end