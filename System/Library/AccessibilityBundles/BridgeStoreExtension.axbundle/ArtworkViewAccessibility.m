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
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(ArtworkViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456457F0](@"BridgeStoreExtension.CarouselItemLockupCollectionView", a2)];

  v3 = (unint64_t *)MEMORY[0x263F1CF00];
  if (v2) {
    v3 = (unint64_t *)MEMORY[0x263F1CEE8];
  }
  return *v3;
}

- (id)accessibilityLabel
{
  if (AXRequestingClient() == 15)
  {
    v7.receiver = self;
    v7.super_class = (Class)ArtworkViewAccessibility;
    v3 = [(ArtworkViewAccessibility *)&v7 accessibilityLabel];
  }
  else
  {
    v4 = [(ArtworkViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456457F0](@"BridgeStoreExtension.CarouselItemLockupCollectionView")];

    if (v4) {
      v5 = @"app.suggestion";
    }
    else {
      v5 = @"artwork.view";
    }
    v3 = accessibilityAppStoreLocalizedString(v5);
  }

  return v3;
}

@end