@interface NTKCPhotosAddControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
@end

@implementation NTKCPhotosAddControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCPhotosAddController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCPhotosAddControllerInvertColorsAccessibility;
  [(NTKCPhotosAddControllerInvertColorsAccessibility *)&v5 picker:a3 didFinishPicking:a4];
  [(NTKCPhotosAddControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];
  unsigned int v4 = [v3 isEqualToString:AX_BridgeBundleName];

  if (v4)
  {
    objc_opt_class();
    objc_super v5 = __UIAccessibilityCastAsClass();
    v6 = [v5 view];
    v7 = [v6 window];
    v8 = [v7 layer];
    +[AXInvertColorsAppHelper toggleInvertColors:v8];
  }
}

@end