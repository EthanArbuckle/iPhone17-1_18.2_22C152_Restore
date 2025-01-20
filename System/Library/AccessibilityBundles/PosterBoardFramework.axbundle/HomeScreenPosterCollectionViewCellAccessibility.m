@interface HomeScreenPosterCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HomeScreenPosterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.HomeScreenPosterCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"home.screen.poster.cell.customize.label");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  BOOL v3 = AXLayoutMode(v2) == 3;

  return v3;
}

@end