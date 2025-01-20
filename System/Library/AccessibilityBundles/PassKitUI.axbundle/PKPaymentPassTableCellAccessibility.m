@interface PKPaymentPassTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PKPaymentPassTableCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKPaymentPassTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentPassTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentPassTableCell" isKindOfClass:@"PSTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"specifier", "@", 0);
  [v3 validateClass:@"PKPaymentPassTableCell" hasInstanceVariable:@"_subTextLabel" withType:"UILabel"];
  [v3 validateClass:@"PKPaymentPassTableCell" hasInstanceVariable:@"_pass" withType:"PKPaymentPass"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSecureElementPass", @"primaryAccountNumberSuffix", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentPassTableCell", @"initWithStyle: reuseIdentifier: specifier:", "@", "q", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentPassTableCellAccessibility;
  [(PKPaymentPassTableCellAccessibility *)&v28 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(PKPaymentPassTableCellAccessibility *)self safeValueForKey:@"_subTextLabel"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(PKPaymentPassTableCellAccessibility *)self safeValueForKey:@"_pass"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [(PKPaymentPassTableCellAccessibility *)self safeValueForKey:@"specifier"];
  char v27 = 0;
  objc_opt_class();
  uint64_t v8 = [(PKPaymentPassTableCellAccessibility *)self safeValueForKey:@"_pass"];
  v9 = __UIAccessibilityCastAsClass();

  v10 = [v9 paymentPass];
  LOBYTE(v8) = [v10 isStoredValuePass];

  v11 = PKSanitizedPrimaryAccountRepresentationForPass();
  if ((v8 & 1) == 0)
  {
    v12 = [v7 objectForKeyedSubscript:@"pkCustomSubTitle"];
    if ([v12 length])
    {
LABEL_8:

      goto LABEL_9;
    }
    id v13 = [v4 text];
    if (![v13 length] || !v6)
    {
LABEL_7:

      goto LABEL_8;
    }
    v14 = [v4 text];
    int v15 = [v14 isEqualToString:v11];

    if (v15)
    {
      v16 = [v4 accessibilityLabel];
      v17 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
      v18 = [v17 invertedSet];
      v19 = [v16 componentsSeparatedByCharactersInSet:v18];
      v12 = [v19 componentsJoinedByString:&stru_26F75DA98];

      v20 = (void *)MEMORY[0x263F21660];
      v21 = NSString;
      v22 = accessibilityLocalizedString(@"ends.with");
      v23 = objc_msgSend(v21, "stringWithFormat:", v22, v12);
      v24 = [v20 axAttributedStringWithString:v23];

      [v24 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21888]];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __81__PKPaymentPassTableCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      v25[3] = &unk_265141108;
      id v26 = v24;
      id v13 = v24;
      [v4 _setAccessibilityLabelBlock:v25];

      goto LABEL_7;
    }
  }
LABEL_9:
}

id __81__PKPaymentPassTableCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(PKPaymentPassTableCellAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentPassTableCellAccessibility;
    return [(PKPaymentPassTableCellAccessibility *)&v6 accessibilityTraits] & (*MEMORY[0x263F1CF20] == 0);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentPassTableCellAccessibility;
    return [(PKPaymentPassTableCellAccessibility *)&v5 accessibilityTraits];
  }
}

- (PKPaymentPassTableCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassTableCellAccessibility;
  objc_super v5 = [(PKPaymentPassTableCellAccessibility *)&v7 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  [(PKPaymentPassTableCellAccessibility *)v5 _accessibilityLoadAccessibilityInformation];

  return v5;
}

@end