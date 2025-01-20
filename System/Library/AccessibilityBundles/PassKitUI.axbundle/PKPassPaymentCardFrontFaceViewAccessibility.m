@interface PKPassPaymentCardFrontFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsAccessPass;
- (BOOL)_accessibilityIsApplePayCashCard;
- (BOOL)_accessibilityIsStoredValuePass;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PKPassPaymentCardFrontFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassPaymentCardFrontFaceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPassPaymentCardFrontFaceView" isKindOfClass:@"PKPassFaceView"];
  [v3 validateClass:@"PKPassFaceView" hasInstanceVariable:@"_pass" withType:"PKPass"];
  [v3 validateClass:@"PKPassPaymentCardFrontFaceView" hasInstanceVariable:@"_balanceLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPass", @"localizedDescription", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsApplePayCashCard
{
  objc_opt_class();
  id v3 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self safeValueForKey:@"_pass"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 passType] == 1)
  {
    v5 = [v4 paymentPass];
    char v6 = [v5 hasAssociatedPeerPaymentAccount];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_accessibilityIsAccessPass
{
  objc_opt_class();
  id v3 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self safeValueForKey:@"_pass"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 paymentPass];
  LOBYTE(v3) = [v5 isAccessPass];

  return (char)v3;
}

- (BOOL)_accessibilityIsStoredValuePass
{
  objc_opt_class();
  id v3 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self safeValueForKey:@"_pass"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 paymentPass];
  LOBYTE(v3) = [v5 isStoredValuePass];

  return (char)v3;
}

- (id)accessibilityLabel
{
  if ([(PKPassPaymentCardFrontFaceViewAccessibility *)self _accessibilityIsApplePayCashCard])
  {
    id v3 = accessibilityLocalizedString(@"apple.pay.cash.label");
  }
  else
  {
    if ([(PKPassPaymentCardFrontFaceViewAccessibility *)self _accessibilityIsAccessPass])
    {
      v4 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self safeValueForKey:@"_pass"];
      v5 = [v4 safeValueForKey:@"organizationName"];

      char v6 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self safeValueForKey:@"_pass"];
      v7 = [v6 safeValueForKey:@"localizedDescription"];

      id v3 = __UIAXStringForVariables();
    }
    else
    {
      BOOL v8 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self _accessibilityIsStoredValuePass];
      v9 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self safeValueForKey:@"_pass"];
      v5 = v9;
      if (!v8)
      {
        v10 = [v9 safeValueForKey:@"organizationName"];

        v11 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self safeValueForKey:@"_pass"];
        v12 = [v11 safeValueForKey:@"primaryAccountNumberSuffix"];

        if ([v12 length])
        {
          v13 = NSString;
          v14 = accessibilityLocalizedString(@"card.ending.in");
          v15 = objc_msgSend(v13, "stringWithFormat:", v14, v12);
        }
        else
        {
          v15 = 0;
        }
        v16 = __UIAXStringForVariables();
        id v3 = objc_msgSend(MEMORY[0x263F21660], "axAttributedStringWithString:", v16, v15, @"__AXStringForVariablesSentinel");
        [v3 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21888]];

        goto LABEL_12;
      }
      id v3 = [v9 safeStringForKey:@"localizedDescription"];
    }
  }
LABEL_12:

  return v3;
}

- (id)accessibilityValue
{
  if ([(PKPassPaymentCardFrontFaceViewAccessibility *)self _accessibilityIsApplePayCashCard])
  {
    id v3 = [(PKPassPaymentCardFrontFaceViewAccessibility *)self safeValueForKey:@"_balanceLabel"];
    v4 = [v3 accessibilityLabel];

    if ([v4 length])
    {
      v5 = NSString;
      char v6 = accessibilityLocalizedString(@"current.balance.fmt");
      v7 = objc_msgSend(v5, "stringWithFormat:", v6, v4);

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PKPassPaymentCardFrontFaceViewAccessibility;
  v7 = [(PKPassPaymentCardFrontFaceViewAccessibility *)&v9 accessibilityValue];
LABEL_6:

  return v7;
}

@end