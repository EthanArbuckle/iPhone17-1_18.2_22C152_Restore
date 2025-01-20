@interface PMPosterViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation PMPosterViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PMPosterViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PMPosterViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PMPosterViewControllerInvertColorsAccessibility;
  [(PMPosterViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(PMPosterViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end