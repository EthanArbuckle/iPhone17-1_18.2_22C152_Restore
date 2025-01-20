@interface CollectionsFilterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CollectionsFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CollectionsFilterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CollectionsFilterCarouselView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CollectionsFilterCell", @"filterLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CollectionsFilterCell", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CollectionsFilterViewModel", @"isSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CollectionsFilterCarouselView", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CollectionsFilterCarouselView", @"logicController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CollectionsFilterLogicController", @"filters", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CollectionsFilterCellAccessibility *)self safeValueForKey:@"filterLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  id v3 = [(CollectionsFilterCellAccessibility *)self safeValueForKey:@"viewModel"];
  int v4 = [v3 safeBoolForKey:@"isSelected"];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (_NSRange)accessibilityRowRange
{
  if (accessibilityRowRange_onceToken != -1) {
    dispatch_once(&accessibilityRowRange_onceToken, &__block_literal_global_5);
  }
  id v3 = [(CollectionsFilterCellAccessibility *)self _accessibilityAncestorIsKindOf:accessibilityRowRange_carouselViewClass];
  if (v3)
  {
    objc_opt_class();
    int v4 = [v3 safeValueForKey:@"collectionView"];
    uint64_t v5 = __UIAccessibilityCastAsClass();

    v6 = [v3 safeValueForKey:@"logicController"];
    v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0x7FFFFFFFLL;
    if (v5 && v6)
    {
      v10 = [v6 safeArrayForKey:@"filters"];
      if ([v10 count])
      {
        objc_opt_class();
        v11 = __UIAccessibilityCastAsClass();
        v12 = [v5 indexPathForCell:v11];

        if (v12)
        {
          uint64_t v9 = [v12 item];
          uint64_t v8 = [v10 count];
        }
        else
        {
          uint64_t v8 = 0;
          uint64_t v9 = 0x7FFFFFFFLL;
        }
      }
      else
      {
        uint64_t v8 = 0;
        uint64_t v9 = 0x7FFFFFFFLL;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0x7FFFFFFFLL;
  }

  NSUInteger v13 = v9;
  NSUInteger v14 = v8;
  result.length = v14;
  result.location = v13;
  return result;
}

uint64_t __59__CollectionsFilterCellAccessibility_accessibilityRowRange__block_invoke()
{
  uint64_t result = MEMORY[0x245653010](@"CollectionsFilterCarouselView");
  accessibilityRowRange_carouselViewClass = result;
  return result;
}

@end