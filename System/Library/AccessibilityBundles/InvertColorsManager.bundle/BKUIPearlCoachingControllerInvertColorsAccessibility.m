@interface BKUIPearlCoachingControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation BKUIPearlCoachingControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlCoachingController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlCoachingControllerInvertColorsAccessibility;
  [(BKUIPearlCoachingControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(BKUIPearlCoachingControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  if (AXDeviceIsPad())
  {
    id v3 = [(BKUIPearlCoachingControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
    [v3 setAccessibilityIgnoresInvertColors:1];
  }
}

@end