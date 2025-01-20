@interface SBUIViewControllerWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTodayViewController;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation SBUIViewControllerWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIViewControllerWrapperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityInTodayViewController
{
  v2 = [(SBUIViewControllerWrapperViewAccessibility *)self subviews];
  BOOL v3 = [v2 indexOfObjectPassingTest:&__block_literal_global_20] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

uint64_t __81__SBUIViewControllerWrapperViewAccessibility__accessibilityInTodayViewController__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Sbtodayviewcon.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  if ([(SBUIViewControllerWrapperViewAccessibility *)self _accessibilityInTodayViewController])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBUIViewControllerWrapperViewAccessibility;
  return [(SBUIViewControllerWrapperViewAccessibility *)&v4 shouldGroupAccessibilityChildren];
}

@end