@interface WallpaperControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
@end

@implementation WallpaperControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WallpaperController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
}

@end