@interface PKBillPaymentRingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityAdjust:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PKBillPaymentRingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKBillPaymentRingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKBillPaymentRingView" hasInstanceVariable:@"_enterCurrencyAmountView" withType:"PKEnterCurrencyAmountView"];
  [v3 validateClass:@"PKBillPaymentRingView" hasInstanceVariable:@"_topCurvedTextLabel" withType:"PKCurvedTextLabel"];
  [v3 validateClass:@"PKBillPaymentRingView" hasInstanceVariable:@"_bottomCurvedTextLabel" withType:"PKCurvedTextLabel"];
  [v3 validateClass:@"PKBillPaymentRingView" hasInstanceVariable:@"_maximumPaymentAmount" withType:"d"];
  [v3 validateClass:@"PKBillPaymentRingView" hasInstanceVariable:@"_minimumPaymentAmount" withType:"d"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKBillPaymentRingView", @"amount", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKBillPaymentRingView", @"setAmount:animated:", "v", "@", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"payment.amount.label");
}

- (id)accessibilityValue
{
  v2 = [(PKBillPaymentRingViewAccessibility *)self safeUIViewForKey:@"_enterCurrencyAmountView"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityHint
{
  id v3 = [(PKBillPaymentRingViewAccessibility *)self safeUIViewForKey:@"_topCurvedTextLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PKBillPaymentRingViewAccessibility *)self safeUIViewForKey:@"_bottomCurvedTextLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (void)_accessibilityAdjust:(BOOL)a3
{
  objc_opt_class();
  v4 = [(PKBillPaymentRingViewAccessibility *)self safeValueForKey:@"amount"];
  v5 = __UIAccessibilityCastAsClass();

  [v5 doubleValue];
  [(PKBillPaymentRingViewAccessibility *)self safeDoubleForKey:@"_minimumPaymentAmount"];
  [(PKBillPaymentRingViewAccessibility *)self safeDoubleForKey:@"_maximumPaymentAmount"];
  AXPerformSafeBlock();
}

void __59__PKBillPaymentRingViewAccessibility__accessibilityAdjust___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x263F087B0];
  id v4 = [NSString stringWithFormat:@"%.2f", *(void *)(a1 + 40)];
  id v3 = [v2 decimalNumberWithString:v4];
  [v1 setAmount:v3 animated:0];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

@end