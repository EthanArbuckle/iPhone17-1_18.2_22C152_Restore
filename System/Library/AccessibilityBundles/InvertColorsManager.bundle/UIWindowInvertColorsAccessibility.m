@interface UIWindowInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityWindowHasInvertedApps;
- (void)_accessibilityLoadInvertColors;
- (void)_commonInitAttachedWindow:(BOOL)a3 debugName:(id)a4 scene:(id)a5;
@end

@implementation UIWindowInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_commonInitAttachedWindow:(BOOL)a3 debugName:(id)a4 scene:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)UIWindowInvertColorsAccessibility;
  [(UIWindowInvertColorsAccessibility *)&v6 _commonInitAttachedWindow:a3 debugName:a4 scene:a5];
  [(UIWindowInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
}

- (BOOL)_accessibilityWindowHasInvertedApps
{
  return 0;
}

@end