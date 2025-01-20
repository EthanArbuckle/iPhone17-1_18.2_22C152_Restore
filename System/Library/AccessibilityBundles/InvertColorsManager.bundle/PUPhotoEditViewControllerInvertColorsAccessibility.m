@interface PUPhotoEditViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation PUPhotoEditViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoEditViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PUPhotoEditViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerInvertColorsAccessibility;
  [(PUPhotoEditViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(PUPhotoEditViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end