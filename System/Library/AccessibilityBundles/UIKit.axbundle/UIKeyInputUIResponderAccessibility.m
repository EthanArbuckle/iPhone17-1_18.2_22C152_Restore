@interface UIKeyInputUIResponderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation UIKeyInputUIResponderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIResponder";
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

- (unint64_t)accessibilityTraits
{
  v10 = self;
  SEL v9 = a2;
  unint64_t v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)UIKeyInputUIResponderAccessibility;
  unint64_t v8 = [(UIKeyInputUIResponderAccessibility *)&v7 accessibilityTraits];
  if ((-[NSObject __accessibilityRespondsToKeyInput](v10) & 1) == 0) {
    return v8;
  }
  v8 |= *MEMORY[0x263F81408] | *MEMORY[0x263F21B60];
  char v6 = 0;
  objc_opt_class();
  id v5 = (id)__UIAccessibilityCastAsClass();
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  char v3 = [v4 isFirstResponder];

  if (v3) {
    v8 |= *MEMORY[0x263F81398];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(UIKeyInputUIResponderAccessibility *)v10 isSecureTextEntry] & 1) != 0)
  {
    v8 |= *MEMORY[0x263F813D8];
  }
  return v8;
}

@end