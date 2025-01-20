@interface VUIFocusableTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsMoreLabelVisible;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
@end

@implementation VUIFocusableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIFocusableTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIFocusableTextView" isKindOfClass:@"TVFocusableTextView"];
  [v3 validateClass:@"TVFocusableTextView" hasProperty:@"moreLabel" withType:"@"];
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(VUIFocusableTextViewAccessibility *)self _accessibilityIsMoreLabelVisible])
  {
    id v3 = [(VUIFocusableTextViewAccessibility *)self safeValueForKey:@"moreLabel"];
    [v3 accessibilityActivationPoint];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VUIFocusableTextViewAccessibility;
    [(VUIFocusableTextViewAccessibility *)&v10 accessibilityActivationPoint];
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityHint
{
  if ([(VUIFocusableTextViewAccessibility *)self _accessibilityIsMoreLabelVisible])
  {
    id v3 = accessibilityLocalizedString(@"more.label.details.hint");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VUIFocusableTextViewAccessibility;
    id v3 = [(VUIFocusableTextViewAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (BOOL)_accessibilityIsMoreLabelVisible
{
  objc_opt_class();
  id v3 = [(VUIFocusableTextViewAccessibility *)self safeValueForKey:@"moreLabel"];
  double v4 = __UIAccessibilityCastAsClass();

  if (v4) {
    int v5 = [v4 isHidden] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end