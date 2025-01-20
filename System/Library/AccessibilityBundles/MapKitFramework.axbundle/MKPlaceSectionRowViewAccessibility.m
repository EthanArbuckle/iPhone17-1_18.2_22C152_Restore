@interface MKPlaceSectionRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityLabel;
@end

@implementation MKPlaceSectionRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceSectionRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(MKPlaceSectionRowViewAccessibility *)self storedIsAccessibilityElement];

  if (v3)
  {
    v4 = [(MKPlaceSectionRowViewAccessibility *)self storedIsAccessibilityElement];
    LOBYTE(v5) = [v4 BOOLValue];
  }
  else
  {
    v4 = [(MKPlaceSectionRowViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_3];
    uint64_t v5 = v4 == 0;
  }

  return v5;
}

uint64_t __60__MKPlaceSectionRowViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  id v2 = [(MKPlaceSectionRowViewAccessibility *)self _accessibleSubviews];
  v3 = [v2 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
  v4 = [v3 axFilterObjectsUsingBlock:&__block_literal_global_276_0];
  uint64_t v5 = MEMORY[0x245652930]();

  v6 = AXStringByReplacingMiddleDots(v5);

  return v6;
}

uint64_t __56__MKPlaceSectionRowViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityViewIsVisible];
}

- (id)accessibilityDragSourceDescriptors
{
  v13[1] = *MEMORY[0x263EF8340];
  v3 = [(MKPlaceSectionRowViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_279 startWithSelf:1];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C3B8]);
    uint64_t v5 = NSString;
    v6 = AXMapKitLocString(@"DRAG_CARD_ROW");
    v7 = [(MKPlaceSectionRowViewAccessibility *)self accessibilityLabel];
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
    [(MKPlaceSectionRowViewAccessibility *)self accessibilityActivationPoint];
    UIAccessibilityPointToPoint();
    v9 = objc_msgSend(v4, "initWithName:point:inView:", v8, v3);
    v13[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MKPlaceSectionRowViewAccessibility;
    v10 = [(MKPlaceSectionRowViewAccessibility *)&v12 accessibilityDragSourceDescriptors];
  }

  return v10;
}

uint64_t __72__MKPlaceSectionRowViewAccessibility_accessibilityDragSourceDescriptors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityCanDrag];
}

@end