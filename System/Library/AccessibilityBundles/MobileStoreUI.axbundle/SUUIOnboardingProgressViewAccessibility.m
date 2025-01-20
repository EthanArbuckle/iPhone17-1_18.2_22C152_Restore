@interface SUUIOnboardingProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
@end

@implementation SUUIOnboardingProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIOnboardingProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOnboardingProgressView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOnboardingProgressView", @"progress", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityPath
{
  id v3 = (void *)MEMORY[0x263F1C478];
  [(SUUIOnboardingProgressViewAccessibility *)self bounds];
  AX_CGRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  [(SUUIOnboardingProgressViewAccessibility *)self bounds];
  v9 = objc_msgSend(v3, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v5, v7, v8 * 0.5, 0.0, 360.0);
  v10 = UIAccessibilityConvertPathFunction();

  return v10;
}

- (id)accessibilityLabel
{
  v2 = [(SUUIOnboardingProgressViewAccessibility *)self safeValueForKey:@"title"];
  id v3 = __UIAccessibilitySafeClass();

  return v3;
}

- (id)accessibilityValue
{
  [(SUUIOnboardingProgressViewAccessibility *)self safeDoubleForKey:@"progress"];
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