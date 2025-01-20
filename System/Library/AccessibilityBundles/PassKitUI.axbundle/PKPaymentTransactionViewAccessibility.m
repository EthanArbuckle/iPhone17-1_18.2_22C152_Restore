@interface PKPaymentTransactionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PKPaymentTransactionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentTransactionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentTransactionView" hasInstanceVariable:@"_primaryLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPaymentTransactionView" hasInstanceVariable:@"_secondaryLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPaymentTransactionView" hasInstanceVariable:@"_tertiaryLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPaymentTransactionView" hasInstanceVariable:@"_transactionValueLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentTransactionView", @"transactionValueAttributedText", "@", 0);
  [v3 validateClass:@"PKPaymentTransactionView" hasInstanceVariable:@"_bonusImageView" withType:"UIImageView"];
  [v3 validateClass:@"PKPaymentTransactionView" hasInstanceVariable:@"_badgeLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentTransactionView", @"transactionValueAttributedText", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(PKPaymentTransactionViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_primaryLabel, _secondaryLabel, _tertiaryLabel"];
  v4 = accessibilityLocalizedString(@"station.to");
  v5 = [v3 stringByReplacingOccurrencesOfString:@"→" withString:v4];

  objc_opt_class();
  v6 = [(PKPaymentTransactionViewAccessibility *)self safeValueForKey:@"transactionValueAttributedText"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithStringOrAttributedString:v7];
  v9 = [v8 coalescedAttributes];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F1C298]];
  int v11 = [v10 BOOLValue];

  v12 = [v7 string];
  if (v11)
  {
    v13 = accessibilityLocalizedString(@"cancelled");
  }
  else
  {
    v13 = 0;
  }
  v14 = __UIAXStringForVariables();

  if (v11) {
  v15 = [(PKPaymentTransactionViewAccessibility *)self safeUIViewForKey:@"_badgeLabel", v12, v13, @"__AXStringForVariablesSentinel"];
  }
  v16 = [v15 accessibilityLabel];

  if ([v16 length])
  {
    v17 = NSString;
    v18 = accessibilityLocalizedString(@"cash.back.format");
    uint64_t v19 = objc_msgSend(v17, "stringWithFormat:", v18, v16);

    v16 = (void *)v19;
  }
  v20 = __UIAXStringForVariables();

  v21 = [(PKPaymentTransactionViewAccessibility *)self safeUIViewForKey:@"_bonusImageView", v16, @"__AXStringForVariablesSentinel"];
  int v22 = [v21 _accessibilityViewIsVisible];

  if (v22)
  {
    v25 = accessibilityLocalizedString(@"transaction.bonus");
    uint64_t v23 = __UIAXStringForVariables();

    v20 = (void *)v23;
  }

  return v20;
}

@end