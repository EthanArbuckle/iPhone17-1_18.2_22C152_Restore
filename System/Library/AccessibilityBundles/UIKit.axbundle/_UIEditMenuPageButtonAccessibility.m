@interface _UIEditMenuPageButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityViewIsVisible;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIEditMenuPageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIEditMenuPageButton";
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
  [location[0] validateClass:@"_UIEditMenuPageButton" isKindOfClass:@"UIButton"];
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityViewIsVisible
{
  v10 = self;
  SEL v9 = a2;
  char v8 = 0;
  objc_opt_class();
  id v7 = (id)__UIAccessibilityCastAsClass();
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  [v6 alpha];
  BOOL v4 = v2 == 1.0;

  if (!v4) {
    return 0;
  }
  v5.receiver = v10;
  v5.super_class = (Class)_UIEditMenuPageButtonAccessibility;
  return [(_UIEditMenuPageButtonAccessibility *)&v5 _accessibilityViewIsVisible];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end