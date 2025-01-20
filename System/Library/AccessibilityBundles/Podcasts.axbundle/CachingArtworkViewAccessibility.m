@interface CachingArtworkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CachingArtworkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.CachingArtworkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ShelfKitCollectionViews.ArtworkWithPlaybackStatusView"];
  [v3 validateClass:@"ShelfKitCollectionViews.EpisodeHeaderCollectionViewCell"];
  [v3 validateClass:@"ShelfKitCollectionViews.ChevronButton"];
  [v3 validateClass:@"ShelfKitCollectionViews.CachingArtworkView" isKindOfClass:@"UIView"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(CachingArtworkViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:0];
  id v3 = v2;
  BOOL v5 = 1;
  if (v2)
  {
    v4 = [v2 _accessibilityFindSubviewDescendant:&__block_literal_global_289];

    if (v4) {
      BOOL v5 = 0;
    }
  }

  return v5;
}

uint64_t __57__CachingArtworkViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24565B6C0](@"ShelfKitCollectionViews.EpisodeHeaderCollectionViewCell");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__CachingArtworkViewAccessibility_isAccessibilityElement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24565B6C0](@"ShelfKitCollectionViews.ArtworkWithPlaybackStatusView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  id v2 = [(CachingArtworkViewAccessibility *)self safeValueForKey:@"superview"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 _accessibilityFindSubviewDescendant:&__block_literal_global_295];
    v4 = [v3 accessibilityLabel];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      v6 = NSString;
      v7 = accessibilityLocalizedString(@"artwork.title.view");
      v8 = [v3 accessibilityLabel];
      v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

      goto LABEL_6;
    }
  }
  v9 = accessibilityLocalizedString(@"artwork");
LABEL_6:

  return v9;
}

uint64_t __53__CachingArtworkViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24565B6C0](@"ShelfKitCollectionViews.ChevronButton");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end