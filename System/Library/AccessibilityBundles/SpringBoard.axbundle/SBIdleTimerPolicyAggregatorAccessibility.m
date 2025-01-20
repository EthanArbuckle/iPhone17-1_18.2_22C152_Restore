@interface SBIdleTimerPolicyAggregatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)idleTimerDidWarn:(id)a3;
@end

@implementation SBIdleTimerPolicyAggregatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIdleTimerPolicyAggregator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)idleTimerDidWarn:(id)a3
{
  id v4 = a3;
  +[SBBacklightControllerAccessibility isIdling];
  v5.receiver = self;
  v5.super_class = (Class)SBIdleTimerPolicyAggregatorAccessibility;
  [(SBIdleTimerPolicyAggregatorAccessibility *)&v5 idleTimerDidWarn:v4];
}

@end