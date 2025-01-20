@interface SUIKSearchResultCollectionViewSectionHeaderInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_commonInit;
@end

@implementation SUIKSearchResultCollectionViewSectionHeaderInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUIKSearchResultCollectionViewSectionHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(SUIKSearchResultCollectionViewSectionHeaderInvertColorsAccessibility *)self safeValueForKey:@"categoryImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)_commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)SUIKSearchResultCollectionViewSectionHeaderInvertColorsAccessibility;
  [(SUIKSearchResultCollectionViewSectionHeaderInvertColorsAccessibility *)&v3 _commonInit];
  [(SUIKSearchResultCollectionViewSectionHeaderInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end