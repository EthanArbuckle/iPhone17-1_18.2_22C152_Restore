@interface _UIViewServiceViewControllerOperatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4;
@end

@implementation _UIViewServiceViewControllerOperatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIViewServiceViewControllerOperator";
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UIViewServiceViewControllerOperator" hasInstanceVariable:@"_localViewController" withType:"UIViewController"];
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  char v11 = 0;
  objc_opt_class();
  id v6 = (id)[(_UIViewServiceViewControllerOperatorAccessibility *)v15 safeValueForKey:@"_localViewController"];
  id v10 = (id)__UIAccessibilityCastAsClass();

  id v9 = v10;
  objc_storeStrong(&v10, 0);
  id v12 = v9;
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v16 = [v12 accessibilityPostScreenChangedForChildViewController:location[0] isAddition:v13] & 1;
    int v8 = 1;
  }
  else
  {
    v7.receiver = v15;
    v7.super_class = (Class)_UIViewServiceViewControllerOperatorAccessibility;
    char v16 = [(_UIViewServiceViewControllerOperatorAccessibility *)&v7 accessibilityPostScreenChangedForChildViewController:location[0] isAddition:v13];
    int v8 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v16 & 1;
}

@end