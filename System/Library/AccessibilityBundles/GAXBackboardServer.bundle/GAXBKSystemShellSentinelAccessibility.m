@interface GAXBKSystemShellSentinelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)dataMigratorDidComplete;
@end

@implementation GAXBKSystemShellSentinelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKSystemShellSentinel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)dataMigratorDidComplete
{
  v2.receiver = self;
  v2.super_class = (Class)GAXBKSystemShellSentinelAccessibility;
  [(GAXBKSystemShellSentinelAccessibility *)&v2 dataMigratorDidComplete];
  AXPerformBlockAsynchronouslyOnMainThread();
}

@end