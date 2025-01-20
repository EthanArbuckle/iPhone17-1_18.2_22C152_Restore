@interface PKPaymentTransactionDetailLineItemTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PKPaymentTransactionDetailLineItemTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentTransactionDetailLineItemTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentTransactionDetailLineItemTableViewCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPaymentTransactionDetailLineItemTableViewCell" hasInstanceVariable:@"_valueLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PKPaymentTransactionDetailLineItemTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

- (id)accessibilityValue
{
  return (id)[(PKPaymentTransactionDetailLineItemTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_valueLabel"];
}

@end