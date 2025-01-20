@interface UIRemoteKeyboardWindowHostedAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityWindowVisible;
@end

@implementation UIRemoteKeyboardWindowHostedAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIRemoteKeyboardWindowHosted";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityWindowVisible
{
  v11 = self;
  SEL v10 = a2;
  id v5 = (id)AXUIKeyboardWindow();
  char v9 = 0;
  objc_opt_class();
  id v8 = (id)__UIAccessibilityCastAsClass();
  id v7 = v8;
  objc_storeStrong(&v8, 0);
  id v4 = v7;
  if (v5 == v7 && (AXUIKeyboardIsOnScreen() & 1) != 0)
  {
    unsigned int v3 = 1;
  }
  else
  {
    v6.receiver = v11;
    v6.super_class = (Class)UIRemoteKeyboardWindowHostedAccessibility;
    unsigned int v3 = [(UIRemoteKeyboardWindowHostedAccessibility *)&v6 _accessibilityWindowVisible];
  }

  return v3 != 0;
}

@end