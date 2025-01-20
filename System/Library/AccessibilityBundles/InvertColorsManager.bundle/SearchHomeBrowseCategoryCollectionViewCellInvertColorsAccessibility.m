@interface SearchHomeBrowseCategoryCollectionViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SearchHomeBrowseCategoryCollectionViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchHomeBrowseCategoryCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(SearchHomeBrowseCategoryCollectionViewCellInvertColorsAccessibility *)self safeUIViewForKey:@"_browseImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SearchHomeBrowseCategoryCollectionViewCellInvertColorsAccessibility;
  [(SearchHomeBrowseCategoryCollectionViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SearchHomeBrowseCategoryCollectionViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end