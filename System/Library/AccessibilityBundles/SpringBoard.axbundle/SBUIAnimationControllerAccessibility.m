@interface SBUIAnimationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)beginAnimation;
@end

@implementation SBUIAnimationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIAnimationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)beginAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIAnimationControllerAccessibility;
  [(SBUIAnimationControllerAccessibility *)&v4 beginAnimation];
  v3 = [(SBUIAnimationControllerAccessibility *)self safeValueForKey:@"_transitionContainer"];
  [v3 _accessibilitySetAllowsSiblingsWhenOvergrown:1];
}

@end