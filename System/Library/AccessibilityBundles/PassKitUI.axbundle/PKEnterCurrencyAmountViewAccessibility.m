@interface PKEnterCurrencyAmountViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstResponder;
- (BOOL)isAccessibilityElement;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKEnterCurrencyAmountViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKEnterCurrencyAmountView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKEnterCurrencyAmountView", @"amountTextField", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKEnterCurrencyAmountView", @"textField:shouldChangeCharactersInRange:replacementString:", "B", "@", "{_NSRange=QQ}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKEnterCurrencyAmountView", @"amountLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKEnterCurrencyAmountView", @"amountString", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PKEnterCurrencyAmountViewAccessibility *)self accessibilityUserDefinedLabel];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKEnterCurrencyAmountViewAccessibility;
    v5 = [(PKEnterCurrencyAmountViewAccessibility *)&v7 accessibilityLabel];
  }
  else
  {
    v5 = accessibilityLocalizedString(@"currency.amount");
  }

  return v5;
}

- (id)accessibilityValue
{
  return (id)[(PKEnterCurrencyAmountViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"amountLabel"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v2 = [(PKEnterCurrencyAmountViewAccessibility *)self accessibilityValue];
  uint64_t v3 = [v2 length];

  NSUInteger v4 = v3;
  NSUInteger v5 = 0;
  result.length = v5;
  result.location = v4;
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  v11 = [(PKEnterCurrencyAmountViewAccessibility *)self safeValueForKey:@"amountTextField"];
  [v11 setAccessibilityElementsHidden:1];

  v12 = [(PKEnterCurrencyAmountViewAccessibility *)self safeStringForKey:@"amountString"];
  v13 = (void *)[v12 copy];

  v30.receiver = self;
  v30.super_class = (Class)PKEnterCurrencyAmountViewAccessibility;
  BOOL v14 = -[PKEnterCurrencyAmountViewAccessibility textField:shouldChangeCharactersInRange:replacementString:](&v30, sel_textField_shouldChangeCharactersInRange_replacementString_, v10, location, length, v9);

  v15 = [(PKEnterCurrencyAmountViewAccessibility *)self safeStringForKey:@"amountString"];
  v16 = (void *)[v15 copy];

  if (v16 && ([v16 isEqualToString:v13] & 1) == 0)
  {
    v17 = objc_opt_new();
    v18 = [v17 groupingSeparator];
    if ([v16 isEqualToString:@"0"] && objc_msgSend(v13, "length") == 1)
    {
      id v19 = v13;
    }
    else
    {
      if ([v13 isEqualToString:@"0"] && objc_msgSend(v16, "length") == 1)
      {
        id v20 = v16;
        int v21 = 0;
        goto LABEL_18;
      }
      unint64_t v22 = [v16 length];
      unint64_t v23 = [v13 length];
      unint64_t v24 = [v16 length];
      if (v22 >= v23)
      {
        if (v24 <= [v13 length]) {
          goto LABEL_23;
        }
        objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v13, "length"));
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        int v21 = 0;
        if (!v20) {
          goto LABEL_23;
        }
        goto LABEL_18;
      }
      id v19 = [v13 substringFromIndex:v24];
    }
    id v20 = v19;
    int v21 = 1;
    if (!v19)
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_18:
    if (v18)
    {
      uint64_t v25 = [v20 stringByReplacingOccurrencesOfString:v18 withString:&stru_26F75DA98];

      id v20 = (id)v25;
    }
    v26 = [MEMORY[0x263F21660] axAttributedStringWithString:v20];
    v27 = v26;
    v28 = (void *)MEMORY[0x263F218D8];
    if (!v21) {
      v28 = (void *)MEMORY[0x263F218E0];
    }
    [v26 setAttribute:MEMORY[0x263EFFA88] forKey:*v28];
    [v27 setAttribute:&unk_26F76B640 forKey:*MEMORY[0x263F216D8]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v27);

    goto LABEL_23;
  }
  if ([v16 isEqualToString:@"0"]
    && [v13 isEqualToString:@"0"])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
  }
LABEL_24:

  return v14;
}

@end