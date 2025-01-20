@interface CAMSecureWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsIsInHostedDarkWindow;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation CAMSecureWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSecureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  v2 = +[AXSpringBoardServer server];
  unsigned int v3 = [v2 isScreenLockedWithPasscode:0];

  if (!v3) {
    return 1;
  }
  v4 = +[AXSpringBoardServer server];
  unsigned __int8 v5 = [v4 isDarkModeActive];

  return v5 ^ 1;
}

- (BOOL)_accessibilityInvertColorsIsInHostedDarkWindow
{
  v2 = +[AXSpringBoardServer server];
  unsigned int v3 = [v2 isScreenLockedWithPasscode:0];

  if (!v3) {
    return 0;
  }
  v4 = +[AXSpringBoardServer server];
  unsigned __int8 v5 = [v4 isDarkModeActive];

  return v5;
}

@end