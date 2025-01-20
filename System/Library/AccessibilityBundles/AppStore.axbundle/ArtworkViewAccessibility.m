@interface ArtworkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ArtworkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStoreKitInternal.ArtworkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppStore.BrandedAppTodayCardCollectionViewCell"];
  [v3 validateClass:@"AppStore.ArcadeFooterCollectionViewCell"];
  [v3 validateClass:@"AppStore.ArtworkSectionBackgroundView"];
  [v3 validateClass:@"AppStore.CarouselItemLockupCollectionView"];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(ArtworkViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245641130](@"AppStore.BrandedAppTodayCardCollectionViewCell", a2)];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(ArtworkViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245641130](@"AppStore.ArcadeFooterCollectionViewCell")];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      v6 = [(ArtworkViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245641130](@"AppStore.ArtworkSectionBackgroundView")];
      BOOL v4 = v6 == 0;
    }
  }

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(ArtworkViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245641130](@"AppStore.CarouselItemLockupCollectionView", a2)];

  id v3 = (unint64_t *)MEMORY[0x263F1CF00];
  if (v2) {
    id v3 = (unint64_t *)MEMORY[0x263F1CEE8];
  }
  return *v3;
}

- (id)accessibilityLabel
{
  if (AXRequestingClient() == 15)
  {
    v7.receiver = self;
    v7.super_class = (Class)ArtworkViewAccessibility;
    id v3 = [(ArtworkViewAccessibility *)&v7 accessibilityLabel];
  }
  else
  {
    BOOL v4 = [(ArtworkViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245641130](@"AppStore.CarouselItemLockupCollectionView")];

    if (v4) {
      v5 = @"app.suggestion";
    }
    else {
      v5 = @"artwork.view";
    }
    id v3 = accessibilityAppStoreLocalizedString(v5);
  }

  return v3;
}

@end