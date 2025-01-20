@interface NTKCFaceDetailKaleidoscopeContentSectionControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_presentPhotoPicker;
@end

@implementation NTKCFaceDetailKaleidoscopeContentSectionControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailKaleidoscopeContentSectionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_presentPhotoPicker
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailKaleidoscopeContentSectionControllerInvertColorsAccessibility;
  [(NTKCFaceDetailKaleidoscopeContentSectionControllerInvertColorsAccessibility *)&v3 _presentPhotoPicker];
  [(NTKCFaceDetailKaleidoscopeContentSectionControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_super v3 = +[NSBundle mainBundle];
  v4 = [v3 bundleIdentifier];
  unsigned int v5 = [v4 isEqualToString:AX_BridgeBundleName];

  if (v5)
  {
    objc_opt_class();
    v6 = [(NTKCFaceDetailKaleidoscopeContentSectionControllerInvertColorsAccessibility *)self safeValueForKey:@"parentViewController"];
    v7 = __UIAccessibilityCastAsClass();

    v8 = [v7 view];
    v9 = [v8 window];
    v10 = [v9 layer];
    +[AXInvertColorsAppHelper toggleInvertColors:v10];
  }
}

@end