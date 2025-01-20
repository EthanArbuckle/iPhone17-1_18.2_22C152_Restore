@interface QLImageAnalysisManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)imageAnalysisToolbarButton;
@end

@implementation QLImageAnalysisManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLImageAnalysisManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)imageAnalysisToolbarButton
{
  v5.receiver = self;
  v5.super_class = (Class)QLImageAnalysisManagerAccessibility;
  v2 = [(QLImageAnalysisManagerAccessibility *)&v5 imageAnalysisToolbarButton];
  v3 = accessibilityLocalizedString(@"ql.visual.lookup.button.label");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end