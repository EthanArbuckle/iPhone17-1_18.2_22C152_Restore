@interface ArtworkCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ArtworkCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.ArtworkCollectionViewCell";
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
  if (AXRequestingClient() == 15)
  {
    v5.receiver = self;
    v5.super_class = (Class)ArtworkCollectionViewCellAccessibility;
    v3 = [(ArtworkCollectionViewCellAccessibility *)&v5 accessibilityLabel];
  }
  else
  {
    v3 = accessibilityAppStoreLocalizedString(@"artwork.view");
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end