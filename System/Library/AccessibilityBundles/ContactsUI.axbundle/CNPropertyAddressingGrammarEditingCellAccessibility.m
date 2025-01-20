@interface CNPropertyAddressingGrammarEditingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CNPropertyAddressingGrammarEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyAddressingGrammarEditingCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNPropertyAddressingGrammarEditingCell" isKindOfClass:@"CNPropertySimpleCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertySimpleCell", @"labelView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertySimpleCell", @"valueView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CNPropertyAddressingGrammarEditingCellAccessibility *)self safeValueForKey:@"labelView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(CNPropertyAddressingGrammarEditingCellAccessibility *)self safeValueForKey:@"valueView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(CNPropertyAddressingGrammarEditingCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  id v3 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v2);

  return v3;
}

uint64_t __93__CNPropertyAddressingGrammarEditingCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456487F0](@"UITableViewCellReorderControl");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end