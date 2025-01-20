@interface PKPaymentTransactionTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PKPaymentTransactionTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentTransactionTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKPaymentTransactionTableCellAccessibility *)self safeUIViewForKey:@"_transactionView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PKPaymentTransactionTableCellAccessibility *)self safeUIViewForKey:@"_transactionView"];
  v3 = [v2 accessibilityValue];

  return v3;
}

@end