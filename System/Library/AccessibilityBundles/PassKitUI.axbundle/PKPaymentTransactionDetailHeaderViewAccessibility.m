@interface PKPaymentTransactionDetailHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setSubtitleText:(id)a3;
@end

@implementation PKPaymentTransactionDetailHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentTransactionDetailHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentTransactionDetailHeaderView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentTransactionDetailHeaderView", @"setSubtitleText:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentTransactionDetailHeaderViewAccessibility;
  [(PKPaymentTransactionDetailHeaderViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKPaymentTransactionDetailHeaderViewAccessibility *)self gestureRecognizers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(PKPaymentTransactionDetailHeaderViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
    [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

    v6 = [(PKPaymentTransactionDetailHeaderViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
    v7 = accessibilityLocalizedString(@"merchant.raw.name.hint");
    [v6 setAccessibilityHint:v7];
  }
}

- (void)setSubtitleText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailHeaderViewAccessibility;
  [(PKPaymentTransactionDetailHeaderViewAccessibility *)&v4 setSubtitleText:a3];
  [(PKPaymentTransactionDetailHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end