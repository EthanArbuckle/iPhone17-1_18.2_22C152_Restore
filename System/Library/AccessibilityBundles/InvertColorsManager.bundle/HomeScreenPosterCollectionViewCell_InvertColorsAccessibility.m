@interface HomeScreenPosterCollectionViewCell_InvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
@end

@implementation HomeScreenPosterCollectionViewCell_InvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.HomeScreenPosterCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v6 = self;
  if (_AXSInvertColorsEnabled())
  {
    v2 = [(HomeScreenPosterCollectionViewCell_InvertColorsAccessibility *)v6 window];
    v3 = [v2 traitCollection];
    v4 = (char *)[v3 userInterfaceStyle];

    if (v4 != (unsigned char *)&dword_0 + 2) {
      goto LABEL_6;
    }
    v5 = [(HomeScreenPosterCollectionViewCell_InvertColorsAccessibility *)v6 layer];
    +[AXInvertColorsAppHelper applyInvertFilterToLayer:v5];
  }
  else
  {
    v5 = [(HomeScreenPosterCollectionViewCell_InvertColorsAccessibility *)v6 layer];
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v5];
  }

LABEL_6:
}

@end