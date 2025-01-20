@interface NTKECreateWatchFaceViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation NTKECreateWatchFaceViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKECreateWatchFaceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 view];
  v4 = [v3 layer];
  +[AXInvertColorsAppHelper toggleInvertColors:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NTKECreateWatchFaceViewControllerInvertColorsAccessibility;
  [(NTKECreateWatchFaceViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(NTKECreateWatchFaceViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end