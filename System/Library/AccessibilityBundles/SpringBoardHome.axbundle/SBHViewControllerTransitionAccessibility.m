@interface SBHViewControllerTransitionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)transitionDidFinish:(id)a3;
@end

@implementation SBHViewControllerTransitionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHViewControllerTransition";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)transitionDidFinish:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBHViewControllerTransitionAccessibility;
  [(SBHViewControllerTransitionAccessibility *)&v3 transitionDidFinish:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end