@interface RecentlyPlayedCollectionCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation RecentlyPlayedCollectionCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RecentlyPlayedTodayExtension.RecentlyPlayedCollectionCell";
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