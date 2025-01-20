@interface VUICollectionViewFeaturedCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation VUICollectionViewFeaturedCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUICollectionViewFeaturedCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end