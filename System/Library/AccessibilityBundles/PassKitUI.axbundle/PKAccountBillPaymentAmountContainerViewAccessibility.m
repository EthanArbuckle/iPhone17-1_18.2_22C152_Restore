@interface PKAccountBillPaymentAmountContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PKAccountBillPaymentAmountContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKAccountBillPaymentAmountContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKAccountBillPaymentAmountContainerView" hasInstanceVariable:@"_enterCurrencyAmountView" withType:"PKEnterCurrencyAmountView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKAccountBillPaymentAmountContainerView", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentAmountContainerViewAccessibility;
  [(PKAccountBillPaymentAmountContainerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityLocalizedString(@"payment.amount.label");
  v4 = [(PKAccountBillPaymentAmountContainerViewAccessibility *)self safeUIViewForKey:@"_enterCurrencyAmountView"];
  [v4 setAccessibilityLabel:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccountBillPaymentAmountContainerViewAccessibility;
  [(PKAccountBillPaymentAmountContainerViewAccessibility *)&v3 layoutSubviews];
  [(PKAccountBillPaymentAmountContainerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end