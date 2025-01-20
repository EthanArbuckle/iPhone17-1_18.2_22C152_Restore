@interface PKPaymentTransactionViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation PKPaymentTransactionViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentTransactionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PKPaymentTransactionViewInvertColorsAccessibility *)self safeUIViewForKey:@"_primaryImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionViewInvertColorsAccessibility;
  [(PKPaymentTransactionViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(PKPaymentTransactionViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end