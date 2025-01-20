@interface PlayClockFaceViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation PlayClockFaceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ClockPoster.PlayClockFaceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PlayClockFaceViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PlayClockFaceViewControllerAccessibility;
  [(PlayClockFaceViewControllerAccessibility *)&v3 viewDidLoad];
  [(PlayClockFaceViewControllerAccessibility *)self _accessibilityLoadInvertColors];
}

@end