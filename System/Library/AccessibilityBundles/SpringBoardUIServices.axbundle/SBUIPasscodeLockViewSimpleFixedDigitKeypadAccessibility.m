@interface SBUIPasscodeLockViewSimpleFixedDigitKeypadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation SBUIPasscodeLockViewSimpleFixedDigitKeypadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeLockViewSimpleFixedDigitKeypad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  [(SBUIPasscodeLockViewSimpleFixedDigitKeypadAccessibility *)self _accessibilityVisibleFrame];
  return v3 > 0.0 && v2 > 0.0;
}

@end