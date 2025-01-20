@interface HighlightItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axPillView;
- (id)accessibilityLabel;
- (id)automationElements;
@end

@implementation HighlightItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.HighlightItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SLHighlightPillView"];
  [v3 validateClass:@"ShelfKitCollectionViews.ArtworkView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [MEMORY[0x263EFF980] array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__HighlightItemCellAccessibility_accessibilityLabel__block_invoke;
  v8[3] = &unk_265144130;
  v8[4] = self;
  id v9 = v3;
  id v4 = v3;
  id v5 = (id)[(HighlightItemCellAccessibility *)self _accessibilityFindDescendant:v8];
  v6 = MEMORY[0x24565B6E0](v4);

  return v6;
}

uint64_t __52__HighlightItemCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    if ([v3 isAccessibilityElement])
    {
      MEMORY[0x24565B6C0](@"SLHighlightPillView");
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        MEMORY[0x24565B6C0](@"ShelfKitCollectionViews.ArtworkView");
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [*(id *)(a1 + 40) addObject:v4];
        }
      }
    }
  }

  return 0;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v7.receiver = self;
  v7.super_class = (Class)HighlightItemCellAccessibility;
  id v4 = [(HighlightItemCellAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  id v5 = [(HighlightItemCellAccessibility *)self _axPillView];
  if ([v5 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v5];
  }

  return v3;
}

- (id)automationElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v7.receiver = self;
  v7.super_class = (Class)HighlightItemCellAccessibility;
  id v4 = [(HighlightItemCellAccessibility *)&v7 automationElements];
  [v3 axSafelyAddObjectsFromArray:v4];

  id v5 = [(HighlightItemCellAccessibility *)self _axPillView];
  if ([v5 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v5];
  }

  return v3;
}

- (id)_axPillView
{
  uint64_t v3 = MEMORY[0x24565B6C0](@"SLHighlightPillView", a2);

  return (id)[(HighlightItemCellAccessibility *)self _accessibilityDescendantOfType:v3];
}

@end