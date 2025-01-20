@interface PBFGalleryEditingSceneViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PBFGalleryEditingSceneViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBFGalleryEditingSceneViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBFGalleryEditingSceneViewControllerInvertColorsAccessibility;
  [(PBFGalleryEditingSceneViewControllerInvertColorsAccessibility *)&v4 viewDidAppear:a3];
  [(PBFGalleryEditingSceneViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PBFGalleryEditingSceneViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end