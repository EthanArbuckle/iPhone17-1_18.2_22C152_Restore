@interface SBUIRemoteKeyboardWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityWindowVisible;
@end

@implementation SBUIRemoteKeyboardWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIRemoteKeyboardWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  v3 = AXUIKeyboardWindow();
  char v8 = 0;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  if (v3 == v4 && (AXUIKeyboardIsOnScreen() & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUIRemoteKeyboardWindowAccessibility;
    BOOL v5 = [(SBUIRemoteKeyboardWindowAccessibility *)&v7 _accessibilityWindowVisible];
  }

  return v5;
}

@end