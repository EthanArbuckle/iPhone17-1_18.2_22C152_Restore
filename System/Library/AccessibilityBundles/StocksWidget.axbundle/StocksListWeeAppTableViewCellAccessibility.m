@interface StocksListWeeAppTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (StocksListWeeAppTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_accessibilityBoxButtonLabel;
- (id)accessibilityLabel;
- (int64_t)accessibilityStocksRowDataType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setAccessibilityStocksRowDataType:(int64_t)a3;
- (void)updateValues;
@end

@implementation StocksListWeeAppTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StocksListWeeAppTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityStocksRowDataType
{
  return MEMORY[0x270F0A458](self, &__StocksListWeeAppTableViewCellAccessibility__accessibilityStocksRowDataType);
}

- (void)setAccessibilityStocksRowDataType:(int64_t)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"StocksListWeeAppTableViewCell", @"stock", "@", 0);
  [v3 validateClass:@"StocksListWeeAppTableViewCell" hasInstanceVariable:@"_priceLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"StocksListWeeAppTableViewCell", @"boxButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"companyName", "@", 0);
  [v3 validateClass:@"StocksListWeeAppTableViewCell" hasInstanceVariable:@"_boxLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"marketcap", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"Stock", @"BlankValueString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"changeIsNegative", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"changeIsZero", "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"Stock", @"formattedStringForString: fractionDigits: percentStyle:", "@", "@", "I", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"formattedChangePercent:", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"change", "@", 0);
}

- (id)_accessibilityBoxButtonLabel
{
  v2 = [(StocksListWeeAppTableViewCellAccessibility *)self safeValueForKey:@"stock"];
  id v3 = [v2 safeValueForKey:@"marketcap"];
  v4 = [(id)MEMORY[0x245664E80](@"Stock") safeValueForKey:@"BlankValueString"];
  if ([v3 isEqualToString:v4])
  {
    v5 = 0;
  }
  else
  {
    [v3 floatValue];
    v6 = AXFormatFloat();

    v7 = (void *)MEMORY[0x263F08A30];
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
    id v3 = [v7 localizedStringFromNumber:v8 numberStyle:5];

    v9 = NSString;
    v10 = accessibilityLocalizedString(@"marketcap.value");
    v5 = objc_msgSend(v9, "stringWithFormat:", v10, v3);
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  id v11 = v2;
  AXPerformSafeBlock();
  id v12 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  if ([v11 safeBoolForKey:@"changeIsZero"])
  {
    v13 = accessibilityLocalizedString(@"no.change");
  }
  else
  {
    int v14 = [v11 safeBoolForKey:@"changeIsNegative"];
    v15 = NSString;
    if (v14) {
      v16 = @"negative.change";
    }
    else {
      v16 = @"positive.change";
    }
    v17 = accessibilityLocalizedString(v16);
    v13 = objc_msgSend(v15, "stringWithFormat:", v17, v12);
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  id v18 = v11;
  AXPerformSafeBlock();
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  if ([v18 safeBoolForKey:@"changeIsZero"])
  {
    v20 = accessibilityLocalizedString(@"no.change");
  }
  else
  {
    int v21 = [v18 safeBoolForKey:@"changeIsNegative"];
    v22 = NSString;
    if (v21) {
      v23 = @"down.value";
    }
    else {
      v23 = @"up.value";
    }
    v24 = accessibilityLocalizedString(v23);
    v20 = objc_msgSend(v22, "stringWithFormat:", v24, v19);
  }
  v25 = __UIAXStringForVariables();

  return v25;
}

uint64_t __74__StocksListWeeAppTableViewCellAccessibility__accessibilityBoxButtonLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) formattedChangePercent:1];

  return MEMORY[0x270F9A758]();
}

void __74__StocksListWeeAppTableViewCellAccessibility__accessibilityBoxButtonLabel__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x245664E80](@"Stock");
  id v6 = [*(id *)(a1 + 32) safeValueForKey:@"change"];
  uint64_t v3 = [v2 formattedStringForString:v6 fractionDigits:2 percentStyle:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(StocksListWeeAppTableViewCellAccessibility *)self safeValueForKey:@"stock"];
  objc_opt_class();
  uint64_t v4 = [(StocksListWeeAppTableViewCellAccessibility *)self safeValueForKey:@"_priceLabel"];
  v5 = __UIAccessibilityCastAsClass();

  id v6 = [(StocksListWeeAppTableViewCellAccessibility *)self safeValueForKey:@"boxButton"];
  v7 = [v3 safeValueForKey:@"companyName"];
  v8 = [v5 accessibilityLabel];
  id v11 = [v6 accessibilityLabel];
  v9 = __UIAXStringForVariables();

  return v9;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)StocksListWeeAppTableViewCellAccessibility;
  [(StocksListWeeAppTableViewCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = [(StocksListWeeAppTableViewCellAccessibility *)self safeValueForKey:@"boxButton"];
  [v3 setIsAccessibilityElement:0];
  uint64_t v4 = [(StocksListWeeAppTableViewCellAccessibility *)self _accessibilityBoxButtonLabel];
  [v3 setAccessibilityLabel:v4];
}

- (void)updateValues
{
  v3.receiver = self;
  v3.super_class = (Class)StocksListWeeAppTableViewCellAccessibility;
  [(StocksListWeeAppTableViewCellAccessibility *)&v3 updateValues];
  [(StocksListWeeAppTableViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (StocksListWeeAppTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)StocksListWeeAppTableViewCellAccessibility;
  uint64_t v4 = [(StocksListWeeAppTableViewCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(StocksListWeeAppTableViewCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end