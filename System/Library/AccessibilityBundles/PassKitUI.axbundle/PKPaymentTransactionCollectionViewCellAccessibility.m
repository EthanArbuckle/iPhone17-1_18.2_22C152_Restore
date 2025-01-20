@interface PKPaymentTransactionCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPaymentTransactionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentTransactionCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
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
  v2 = [(PKPaymentTransactionCollectionViewCellAccessibility *)self safeUIViewForKey:@"_transactionView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PKPaymentTransactionCollectionViewCellAccessibility *)self safeUIViewForKey:@"_transactionView"];
  v3 = [v2 accessibilityValue];

  return v3;
}

@end