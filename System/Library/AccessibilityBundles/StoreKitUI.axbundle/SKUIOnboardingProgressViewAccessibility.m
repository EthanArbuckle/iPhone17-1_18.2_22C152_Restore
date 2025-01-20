@interface SKUIOnboardingProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
@end

@implementation SKUIOnboardingProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIOnboardingProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIOnboardingProgressView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIOnboardingProgressView", @"progress", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityPath
{
  id v3 = (void *)MEMORY[0x263F1C478];
  [(SKUIOnboardingProgressViewAccessibility *)self bounds];
  AX_CGRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  [(SKUIOnboardingProgressViewAccessibility *)self bounds];
  v9 = objc_msgSend(v3, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v5, v7, v8 * 0.5, 0.0, 360.0);
  v10 = UIAccessibilityConvertPathFunction();

  return v10;
}

- (id)accessibilityLabel
{
  v2 = [(SKUIOnboardingProgressViewAccessibility *)self safeValueForKey:@"title"];
  id v3 = __UIAccessibilitySafeClass();

  return v3;
}

- (id)accessibilityValue
{
  [(SKUIOnboardingProgressViewAccessibility *)self safeDoubleForKey:@"progress"];
  if (v2 <= 0.0)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = AXFormatFloatWithPercentage();
  }

  return v3;
}

@end