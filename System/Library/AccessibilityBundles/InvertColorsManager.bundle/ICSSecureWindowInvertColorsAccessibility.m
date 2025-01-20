@interface ICSSecureWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
- (void)_accessibilityLoadInvertColors;
@end

@implementation ICSSecureWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ICSSecureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  if (_AXSInvertColorsEnabled()
    && ([(ICSSecureWindowInvertColorsAccessibility *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (char *)[v3 userInterfaceStyle],
        v3,
        v4 == (unsigned char *)&dword_0 + 2))
  {
    id v6 = +[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.0];
    id v5 = +[AXInvertColorsAppHelper insertBackgroundView:color:](AXInvertColorsAppHelper, "insertBackgroundView:color:", self);
  }
  else
  {
    id v6 = [(ICSSecureWindowInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
    +[AXInvertColorsAppHelper removeBackgroundView:](AXInvertColorsAppHelper, "removeBackgroundView:");
  }
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  v2 = [(ICSSecureWindowInvertColorsAccessibility *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == (char *)&dword_0 + 2;

  return v3;
}

@end