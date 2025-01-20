@interface CCUIControlTemplateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CCUIControlTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIControlTemplateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIControlTemplateView" hasInstanceVariable:@"title" withType:""];
  [v3 validateClass:@"CCUIControlTemplateView" hasInstanceVariable:@"subtitle" withType:""];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIControlTemplateView", @"isExpanded", "B", 0);
}

- (id)accessibilityLabel
{
  return (id)[(CCUIControlTemplateViewAccessibility *)self safeStringForKey:@"title"];
}

- (id)accessibilityValue
{
  return (id)[(CCUIControlTemplateViewAccessibility *)self safeStringForKey:@"subtitle"];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"control.expand.module");
}

- (BOOL)isAccessibilityElement
{
  return [(CCUIControlTemplateViewAccessibility *)self safeBoolForKey:@"isExpanded"] ^ 1;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(CCUIControlTemplateViewAccessibility *)self safeUIViewForKey:@"glyphView"];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CCUIControlTemplateViewAccessibility;
    [(CCUIControlTemplateViewAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

@end