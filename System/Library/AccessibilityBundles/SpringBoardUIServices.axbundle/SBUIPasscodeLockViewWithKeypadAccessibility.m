@interface SBUIPasscodeLockViewWithKeypadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation SBUIPasscodeLockViewWithKeypadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeLockViewWithKeypad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

@end