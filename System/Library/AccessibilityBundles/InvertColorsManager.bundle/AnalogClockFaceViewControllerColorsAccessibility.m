@interface AnalogClockFaceViewControllerColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation AnalogClockFaceViewControllerColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ClockPoster.AnalogClockFaceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(AnalogClockFaceViewControllerColorsAccessibility *)self safeValueForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AnalogClockFaceViewControllerColorsAccessibility;
  [(AnalogClockFaceViewControllerColorsAccessibility *)&v3 viewDidLoad];
  [(AnalogClockFaceViewControllerColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end