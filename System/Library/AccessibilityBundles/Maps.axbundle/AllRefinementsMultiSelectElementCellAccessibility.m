@interface AllRefinementsMultiSelectElementCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axRefinementMultiSelectButton;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AllRefinementsMultiSelectElementCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Maps.AllRefinementsMultiSelectElementCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(AllRefinementsMultiSelectElementCellAccessibility *)self _axRefinementMultiSelectButton];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(AllRefinementsMultiSelectElementCellAccessibility *)self _axRefinementMultiSelectButton];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)_axRefinementMultiSelectButton
{
  return (id)[(AllRefinementsMultiSelectElementCellAccessibility *)self _accessibilityFindDescendant:&__block_literal_global_0];
}

uint64_t __83__AllRefinementsMultiSelectElementCellAccessibility__axRefinementMultiSelectButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245653010](@"SwiftUI.AccessibilityNode");
  int isKindOfClass = objc_opt_isKindOfClass();
  v4 = [v2 accessibilityIdentifier];

  LODWORD(v2) = [v4 isEqualToString:@"RefinementMultiSelectButton"];
  return isKindOfClass & v2;
}

@end