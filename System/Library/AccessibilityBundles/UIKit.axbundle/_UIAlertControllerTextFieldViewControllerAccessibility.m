@interface _UIAlertControllerTextFieldViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axModalizeViewControllerViews;
@end

@implementation _UIAlertControllerTextFieldViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIAlertControllerTextFieldViewController";
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
  [location[0] validateClass:@"_UIAlertControllerTextFieldViewController" isKindOfClass:@"UICollectionViewController"];
  objc_storeStrong(location, 0);
}

- (void)_axModalizeViewControllerViews
{
  v7 = self;
  SEL v6 = a2;
  char v5 = 0;
  objc_opt_class();
  id v4 = (id)__UIAccessibilityCastAsClass();
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  id v2 = (id)[v3 collectionView];
  [v2 setAccessibilityContainerType:0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerTextFieldViewControllerAccessibility;
  [(_UIAlertControllerTextFieldViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  [(_UIAlertControllerTextFieldViewControllerAccessibility *)v4 _axModalizeViewControllerViews];
}

@end