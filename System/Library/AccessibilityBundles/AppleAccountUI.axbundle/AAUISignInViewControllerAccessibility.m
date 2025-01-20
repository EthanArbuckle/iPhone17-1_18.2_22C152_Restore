@interface AAUISignInViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_passwordCell;
- (id)_usernameCell;
@end

@implementation AAUISignInViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AAUISignInViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AAUISignInViewController", @"_usernameCell", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AAUISignInViewController", @"_passwordCell", "@", 0);
}

- (id)_usernameCell
{
  char v10 = 0;
  objc_opt_class();
  v9.receiver = self;
  v9.super_class = (Class)AAUISignInViewControllerAccessibility;
  id v3 = [(AAUISignInViewControllerAccessibility *)&v9 _usernameCell];
  v4 = __UIAccessibilityCastAsClass();

  if (v10) {
    abort();
  }
  [v4 setIsAccessibilityElement:0];
  v5 = [v4 editableTextField];
  v6 = [v4 textLabel];
  v7 = [v6 accessibilityLabel];
  [v5 setAccessibilityLabel:v7];

  return v4;
}

- (id)_passwordCell
{
  char v11 = 0;
  objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)AAUISignInViewControllerAccessibility;
  id v3 = [(AAUISignInViewControllerAccessibility *)&v10 _passwordCell];
  v4 = __UIAccessibilityCastAsClass();

  if (v11) {
    abort();
  }
  v5 = [v4 textLabel];
  [v5 setIsAccessibilityElement:0];

  v6 = [v4 editableTextField];
  v7 = [v4 textLabel];
  v8 = [v7 accessibilityLabel];
  [v6 setAccessibilityLabel:v8];

  return v4;
}

@end