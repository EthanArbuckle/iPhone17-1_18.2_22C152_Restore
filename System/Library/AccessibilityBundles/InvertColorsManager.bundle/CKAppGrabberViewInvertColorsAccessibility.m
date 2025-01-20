@interface CKAppGrabberViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation CKAppGrabberViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAppGrabberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  objc_opt_class();
  v3 = [(CKAppGrabberViewInvertColorsAccessibility *)self safeUIViewForKey:@"_headerView"];
  v4 = [v3 backgroundColor];
  v5 = __UIAccessibilityCastAsClass();

  AXColorGetLuma();
  BOOL v7 = v6 < 0.5;

  return v7;
}

- (void)_accessibilityLoadInvertColors
{
  v2 = [(CKAppGrabberViewInvertColorsAccessibility *)self safeUIViewForKey:@"_iconImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 window];
  v5 = [v4 rootViewController];
  double v6 = [v5 safeStringForKey:@"_hostBundleID"];

  if (v6) {
    [v2 _setAccessibilityInvertState:_AXSInvertColorsEnabledAppCached()];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKAppGrabberViewInvertColorsAccessibility;
  [(CKAppGrabberViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(CKAppGrabberViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end