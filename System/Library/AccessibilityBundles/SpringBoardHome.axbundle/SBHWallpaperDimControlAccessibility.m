@interface SBHWallpaperDimControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsDimmed;
- (id)accessibilityLabel;
@end

@implementation SBHWallpaperDimControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHWallpaperDimControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  if ([(SBHWallpaperDimControlAccessibility *)self _axIsDimmed]) {
    v2 = @"home.screen.brighten.wallpaper";
  }
  else {
    v2 = @"home.screen.dim.wallpaper";
  }
  v3 = accessibilityLocalizedString(v2);

  return v3;
}

- (BOOL)_axIsDimmed
{
  return [(SBHWallpaperDimControlAccessibility *)self safeBoolForKey:@"isDimmed"];
}

@end