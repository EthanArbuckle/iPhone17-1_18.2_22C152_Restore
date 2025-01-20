@interface CNPropertyAddressingGrammarLabeledEditingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CNPropertyAddressingGrammarLabeledEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyAddressingGrammarLabeledEditingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPropertyAddressingGrammarLabeledEditingCell" isKindOfClass:@"CNPropertySimpleEditingCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertySimpleEditingCell", @"textField", "@", 0);
  [v3 validateClass:@"CNPropertySimpleEditingCell" hasProperty:@"labelButton" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = [(CNPropertyAddressingGrammarLabeledEditingCellAccessibility *)self safeValueForKeyPath:@"textField.placeholder"];
  v4 = [(CNPropertyAddressingGrammarLabeledEditingCellAccessibility *)self safeValueForKeyPath:@"textField.text"];
  v8[0] = v3;
  v8[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v6 = AXLabelForElements();

  return v6;
}

- (id)accessibilityValue
{
  v2 = [(CNPropertyAddressingGrammarLabeledEditingCellAccessibility *)self safeValueForKey:@"labelButton"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(CNPropertyAddressingGrammarLabeledEditingCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_7];
  id v3 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v2);

  return v3;
}

uint64_t __100__CNPropertyAddressingGrammarLabeledEditingCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456487F0](@"UITableViewCellReorderControl");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyAddressingGrammarLabeledEditingCellAccessibility;
  return *MEMORY[0x263F1CEE8] & [(CNPropertyAddressingGrammarLabeledEditingCellAccessibility *)&v3 accessibilityTraits];
}

@end