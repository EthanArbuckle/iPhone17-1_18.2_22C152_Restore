@interface AVPlayerViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation AVPlayerViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPlayerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerViewControllerInvertColorsAccessibility;
  [(AVPlayerViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(AVPlayerViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(AVPlayerViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end