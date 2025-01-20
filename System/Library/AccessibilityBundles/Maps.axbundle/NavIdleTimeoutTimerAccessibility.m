@interface NavIdleTimeoutTimerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)idleTimeout;
@end

@implementation NavIdleTimeoutTimerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavIdleTimeoutTimer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (double)idleTimeout
{
  if (AXRequiresLongerTimeouts())
  {
    v3 = AXLogAppAccessibility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24223A000, v3, OS_LOG_TYPE_DEFAULT, "Accessibility option, setting idle timeout to 1 hour", buf, 2u);
    }

    return 3600.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NavIdleTimeoutTimerAccessibility;
    [(NavIdleTimeoutTimerAccessibility *)&v5 idleTimeout];
  }
  return result;
}

@end