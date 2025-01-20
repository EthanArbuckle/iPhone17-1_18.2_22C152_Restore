@interface SUICProgressIndicatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SUICProgressIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUICProgressIndicatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUICProgressIndicatorView", @"isSpinning", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUICProgressIndicatorView", @"isCheckmarkVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUICProgressIndicatorView", @"isArrowVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUICProgressIndicatorView", @"progressValue", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"progress.indicator.label");
}

- (id)accessibilityValue
{
  if ([(SUICProgressIndicatorViewAccessibility *)self safeBoolForKey:@"isSpinning"])
  {
    id v3 = @"progress.indicator.value.indeterminate";
  }
  else if ([(SUICProgressIndicatorViewAccessibility *)self safeBoolForKey:@"isCheckmarkVisible"])
  {
    id v3 = @"progress.indicator.value.finished";
  }
  else
  {
    if (![(SUICProgressIndicatorViewAccessibility *)self safeBoolForKey:@"isArrowVisible"])
    {
      [(SUICProgressIndicatorViewAccessibility *)self safeCGFloatForKey:@"progressValue"];
      if (v6 <= 0.0 || v6 > 1.0)
      {
        v8.receiver = self;
        v8.super_class = (Class)SUICProgressIndicatorViewAccessibility;
        v4 = [(SUICProgressIndicatorViewAccessibility *)&v8 accessibilityValue];
      }
      else
      {
        v4 = AXFormatFloatWithPercentage();
      }
      goto LABEL_8;
    }
    id v3 = @"progress.indicator.value.idle";
  }
  v4 = accessibilityLocalizedString(v3);
LABEL_8:

  return v4;
}

@end