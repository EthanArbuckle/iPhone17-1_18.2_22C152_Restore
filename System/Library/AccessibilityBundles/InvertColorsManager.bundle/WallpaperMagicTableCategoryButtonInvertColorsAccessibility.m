@interface WallpaperMagicTableCategoryButtonInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation WallpaperMagicTableCategoryButtonInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WallpaperMagicTableCategoryButton";
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