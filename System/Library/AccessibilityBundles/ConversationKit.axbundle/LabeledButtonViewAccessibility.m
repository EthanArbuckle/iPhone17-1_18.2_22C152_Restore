@interface LabeledButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)controlView;
- (unint64_t)accessibilityTraits;
@end

@implementation LabeledButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.LabeledButtonView";
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
  v2 = [(LabeledButtonViewAccessibility *)self controlView];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(LabeledButtonViewAccessibility *)self controlView];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(LabeledButtonViewAccessibility *)self controlView];
  unint64_t v3 = [v2 accessibilityValue];

  return v3;
}

- (id)controlView
{
  return (id)[(LabeledButtonViewAccessibility *)self safeSwiftValueForKey:@"control"];
}

@end