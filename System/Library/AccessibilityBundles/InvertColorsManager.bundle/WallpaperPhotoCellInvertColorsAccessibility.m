@interface WallpaperPhotoCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation WallpaperPhotoCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WallpaperPhotoCell";
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