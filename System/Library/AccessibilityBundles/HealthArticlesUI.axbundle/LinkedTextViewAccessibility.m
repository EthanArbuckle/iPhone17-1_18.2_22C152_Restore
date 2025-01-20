@interface LinkedTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityActivate;
- (CGRect)accessibilityFrame;
- (id)_accessibilityLinkedTextView;
- (id)accessibilityLabel;
@end

@implementation LinkedTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthArticlesUI.LinkedTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(LinkedTextViewAccessibility *)self _accessibilityLinkedTextView];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGRect)accessibilityFrame
{
  v2 = [(LinkedTextViewAccessibility *)self _accessibilityLinkedTextView];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)accessibilityActivate
{
  v2 = [(LinkedTextViewAccessibility *)self _accessibilityLinkedTextView];
  char v3 = [v2 accessibilityActivate];

  return v3;
}

- (id)_accessibilityLinkedTextView
{
  uint64_t v3 = objc_opt_class();

  return (id)[(LinkedTextViewAccessibility *)self _accessibilityDescendantOfType:v3];
}

@end