@interface UIRemoteKeyboardWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsIsDarkWindow;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation UIRemoteKeyboardWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIRemoteKeyboardWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsIsDarkWindow
{
  v2 = +[UIKeyboardImpl activeInstance];
  v3 = [v2 safeValueForKey:@"_inheritedRenderConfig"];
  char v4 = [v3 safeBoolForKey:@"lightKeyboard"] ^ 1;

  return v4;
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  if AXProcessIsSpotlight() && (AXInvertColorsIsSystemWideDarkModeEnabled()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIRemoteKeyboardWindowInvertColorsAccessibility;
  return [(UIRemoteKeyboardWindowInvertColorsAccessibility *)&v4 _accessibilityInvertColorsSupportsDarkWindowInvert];
}

@end