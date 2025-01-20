@interface UIPrintSegmentedSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)_accessibilityIncreaseAmount:(BOOL)a3;
@end

@implementation UIPrintSegmentedSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPrintSegmentedSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UIPrintSegmentedSlider" isKindOfClass:@"UISlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPrintSegmentedSlider", @"numberOfTicks", "Q", 0);
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIPrintSegmentedSliderAccessibility *)self safeCGFloatForKey:@"minimumValue"];
  double v6 = v5;
  [(UIPrintSegmentedSliderAccessibility *)self safeCGFloatForKey:@"maximumValue"];
  double v8 = v7;
  [(UIPrintSegmentedSliderAccessibility *)self safeCGFloatForKey:@"value"];
  double v10 = v9;
  double v11 = (v8 - v6)
      / (double)(unint64_t)[(UIPrintSegmentedSliderAccessibility *)self safeUnsignedIntegerForKey:@"numberOfTicks"];
  if (!v3) {
    double v11 = -v11;
  }
  double v12 = v10 + v11;
  if (v12 >= v6 && vabdd_f64(v12, v6) >= 0.001)
  {
    if (v12 > v8) {
      return v8;
    }
    double v6 = v12;
    if (vabdd_f64(v12, v8) < 0.001) {
      return v8;
    }
  }
  return v6;
}

@end