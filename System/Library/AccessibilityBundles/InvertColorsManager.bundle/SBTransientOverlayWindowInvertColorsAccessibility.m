@interface SBTransientOverlayWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
- (void)_setDelegateViewController:(id)a3;
@end

@implementation SBTransientOverlayWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBTransientOverlayWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  v3 = [(SBTransientOverlayWindowInvertColorsAccessibility *)self safeValueForKey:@"delegate"];
  v4 = [v3 safeValueForKey:@"_hostContentAdapter"];
  v5 = [v4 safeStringForKey:@"serviceBundleIdentifier"];
  unsigned __int8 v6 = [v5 isEqualToString:@"com.apple.ScreenshotServicesService"];

  if (v6) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SBTransientOverlayWindowInvertColorsAccessibility;
  return [(SBTransientOverlayWindowInvertColorsAccessibility *)&v8 _accessibilityInvertColorsSupportsDarkWindowInvert];
}

- (void)_setDelegateViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayWindowInvertColorsAccessibility;
  [(SBTransientOverlayWindowInvertColorsAccessibility *)&v4 _setDelegateViewController:a3];
  +[AXInvertColorsManager toggleDarkModeWindowInvert:self];
}

@end