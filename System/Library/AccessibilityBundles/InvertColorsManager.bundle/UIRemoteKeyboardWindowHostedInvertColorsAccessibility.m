@interface UIRemoteKeyboardWindowHostedInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
@end

@implementation UIRemoteKeyboardWindowHostedInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIRemoteKeyboardWindowHosted";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  v3 = [(UIRemoteKeyboardWindowHostedInvertColorsAccessibility *)self traitCollection];
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
  v9.super_class = (Class)UIRemoteKeyboardWindowHostedInvertColorsAccessibility;
  return [(UIRemoteKeyboardWindowHostedInvertColorsAccessibility *)&v9 _accessibilityInvertColorsSupportsDarkWindowInvert];
}

@end