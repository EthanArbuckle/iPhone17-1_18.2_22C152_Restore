@interface OrdinalListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation OrdinalListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.OrdinalListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(OrdinalListCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_7];
  v3 = AXLabelForElements();

  return v3;
}

uint64_t __50__OrdinalListCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VideosUI.OrdinalListCell");
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isAccessibilityElement];
  }

  return v3;
}

@end