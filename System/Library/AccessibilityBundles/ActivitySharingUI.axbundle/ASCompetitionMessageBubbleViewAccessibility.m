@interface ASCompetitionMessageBubbleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ASCompetitionMessageBubbleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASCompetitionMessageBubbleView";
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

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"message.bubble");
}

- (CGRect)accessibilityFrame
{
  char v23 = 0;
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = v3;
  if (v3)
  {
    v5 = [v3 subviews];
    UIAXFrameForElements();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ASCompetitionMessageBubbleViewAccessibility;
    [(ASCompetitionMessageBubbleViewAccessibility *)&v22 accessibilityFrame];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }

  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ASCompetitionMessageBubbleViewAccessibility;
  return UIAccessibilityTraitButton | [(ASCompetitionMessageBubbleViewAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end