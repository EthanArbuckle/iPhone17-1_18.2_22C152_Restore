@interface PosterGalleryAffordanceCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PosterGalleryAffordanceCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.PosterGalleryAffordanceCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"poster.gallery.affordance.cell.label");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (id)accessibilityIdentifier
{
  return @"posterboard-affordance-cell-add-button";
}

@end