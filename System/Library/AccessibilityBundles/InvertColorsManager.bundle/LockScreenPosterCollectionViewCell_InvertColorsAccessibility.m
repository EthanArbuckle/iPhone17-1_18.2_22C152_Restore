@interface LockScreenPosterCollectionViewCell_InvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityFindImageViews;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation LockScreenPosterCollectionViewCell_InvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.LockScreenPosterCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityFindImageViews
{
  return +[AXInvertColorsManager findSubviewDescendants:self visitor:&stru_44928];
}

- (void)_accessibilityLoadInvertColors
{
  v2 = self;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(LockScreenPosterCollectionViewCell_InvertColorsAccessibility *)v2 _accessibilityFindImageViews];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v7);
        if (_AXSInvertColorsEnabled()
          && ([(LockScreenPosterCollectionViewCell_InvertColorsAccessibility *)v2 window],
              v9 = objc_claimAutoreleasedReturnValue(),
              [v9 traitCollection],
              v10 = objc_claimAutoreleasedReturnValue(),
              v11 = (char *)[v10 userInterfaceStyle],
              v10,
              v9,
              v11 == (unsigned char *)&dword_0 + 2))
        {
          v12 = [v8 layer];
          +[AXInvertColorsAppHelper applyInvertFilterToLayer:v12];
        }
        else
        {
          v12 = [v8 layer];
          +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v12];
        }

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LockScreenPosterCollectionViewCell_InvertColorsAccessibility;
  [(LockScreenPosterCollectionViewCell_InvertColorsAccessibility *)&v3 layoutSubviews];
  [(LockScreenPosterCollectionViewCell_InvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end