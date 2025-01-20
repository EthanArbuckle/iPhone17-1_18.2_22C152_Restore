@interface SFCircleProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SFCircleProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFCircleProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityPath
{
  v3 = (void *)MEMORY[0x263F1C478];
  [(SFCircleProgressViewAccessibility *)self bounds];
  AX_CGRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  [(SFCircleProgressViewAccessibility *)self bounds];
  v9 = objc_msgSend(v3, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v5, v7, v8 * 0.5, 0.0, 360.0);
  v10 = UIAccessibilityConvertPathFunction();

  return v10;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"download.progress.indicator");
}

- (id)accessibilityValue
{
  [(SFCircleProgressViewAccessibility *)self safeFloatForKey:@"progress"];

  return (id)MEMORY[0x270F0A108](0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

@end