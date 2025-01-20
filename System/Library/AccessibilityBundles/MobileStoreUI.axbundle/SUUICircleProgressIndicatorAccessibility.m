@interface SUUICircleProgressIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SUUICircleProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUICircleProgressIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(SUUICircleProgressIndicatorAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 accessoryView];
    BOOL v6 = v5 != self;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"circle.progress.indicator");
}

@end