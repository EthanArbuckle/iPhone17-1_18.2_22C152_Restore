@interface UITabBarControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySpeakThisViewController;
@end

@implementation UITabBarControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITabBarController";
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

- (id)_accessibilitySpeakThisViewController
{
  v9 = self;
  SEL v8 = a2;
  char v7 = 0;
  objc_opt_class();
  id v4 = (id)[(UITabBarControllerAccessibility *)v9 selectedViewController];
  id v6 = (id)__UIAccessibilityCastAsSafeCategory();

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  id v3 = (id)[v5 _accessibilitySpeakThisViewController];

  return v3;
}

@end