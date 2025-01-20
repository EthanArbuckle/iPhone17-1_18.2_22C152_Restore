@interface OrdinalCardCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation OrdinalCardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.OrdinalCardCell";
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
  v2 = [(OrdinalCardCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_20];
  v3 = AXLabelForElements();

  return v3;
}

uint64_t __50__OrdinalCardCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VideosUI.OrdinalCardCell");
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isAccessibilityElement];
  }

  return v3;
}

@end