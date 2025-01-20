@interface SearchUICombinedCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUICombinedCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUICombinedCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUICardSectionView"];
  [v3 validateClass:@"SearchUICircleButtonItemView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SearchUICombinedCollectionViewCellAccessibility *)self safeValueForKey:@"rowModel"];

  if (v3)
  {
    v4 = UIAXStringForAllChildren();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUICombinedCollectionViewCellAccessibility;
    v4 = [(SearchUICombinedCollectionViewCellAccessibility *)&v6 accessibilityLabel];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUICombinedCollectionViewCellAccessibility;
  unint64_t v3 = [(SearchUICombinedCollectionViewCellAccessibility *)&v6 accessibilityTraits];
  if ([(SearchUICombinedCollectionViewCellAccessibility *)self safeBoolForKey:@"isSelected"])uint64_t v4 = ~*MEMORY[0x263F1CF38]; {
  else
  }
    uint64_t v4 = -1;
  return v4 & v3;
}

- (id)accessibilityElements
{
  return (id)[(SearchUICombinedCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_3];
}

uint64_t __72__SearchUICombinedCollectionViewCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Searchuicardse_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(SearchUICombinedCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_288];
}

uint64_t __89__SearchUICombinedCollectionViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Searchuicircle.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end