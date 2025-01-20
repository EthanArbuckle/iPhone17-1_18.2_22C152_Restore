@interface _SBWallpaperSecureWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation _SBWallpaperSecureWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SBWallpaperSecureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  v2 = [(_SBWallpaperSecureWindowInvertColorsAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(@"PBUIPosterWallpaperRemoteViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end