@interface SBDashBoardWallpaperEffectViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBDashBoardWallpaperEffectViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDashBoardWallpaperEffectView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return _AXSInvertColorsEnabledGlobalCached() != 0;
}

@end