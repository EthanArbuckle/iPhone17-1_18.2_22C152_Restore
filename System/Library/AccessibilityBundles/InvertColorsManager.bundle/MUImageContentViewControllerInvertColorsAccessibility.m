@interface MUImageContentViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation MUImageContentViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUImageContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(MUImageContentViewControllerInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MUImageContentViewControllerInvertColorsAccessibility;
  [(MUImageContentViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(MUImageContentViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end