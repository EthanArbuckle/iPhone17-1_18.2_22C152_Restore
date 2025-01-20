@interface _UIHostedWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation _UIHostedWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIHostedWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  v3 = [(_UIHostedWindowInvertColorsAccessibility *)self traitCollection];
  v4 = (char *)[v3 userInterfaceStyle];

  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    v5 = +[NSBundle mainBundle];
    v6 = [v5 bundlePath];
    if ([v6 hasSuffix:@"appex"])
    {

      return 0;
    }
    char IsViewService = AXApplicationIsViewService();

    if (IsViewService) {
      return 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)_UIHostedWindowInvertColorsAccessibility;
  return [(_UIHostedWindowInvertColorsAccessibility *)&v9 _accessibilityInvertColorsSupportsDarkWindowInvert];
}

@end