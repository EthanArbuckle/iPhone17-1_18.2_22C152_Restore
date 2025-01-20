@interface PGPictureInPictureViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PGPictureInPictureViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGPictureInPictureViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureViewControllerInvertColorsAccessibility;
  [(PGPictureInPictureViewControllerInvertColorsAccessibility *)&v4 viewDidAppear:a3];
  [(PGPictureInPictureViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v3 = [(PGPictureInPictureViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  v2 = [v3 superview];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end