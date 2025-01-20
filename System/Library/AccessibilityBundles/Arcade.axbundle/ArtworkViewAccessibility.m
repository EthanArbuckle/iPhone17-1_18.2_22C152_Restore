@interface ArtworkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
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
  return *MEMORY[0x263F1CF00];
}

- (id)accessibilityLabel
{
  if (AXRequestingClient() == 15)
  {
    v5.receiver = self;
    v5.super_class = (Class)ArtworkViewAccessibility;
    v3 = [(ArtworkViewAccessibility *)&v5 accessibilityLabel];
  }
  else
  {
    v3 = accessibilityAppStoreLocalizedString(@"artwork.view");
  }

  return v3;
}

@end