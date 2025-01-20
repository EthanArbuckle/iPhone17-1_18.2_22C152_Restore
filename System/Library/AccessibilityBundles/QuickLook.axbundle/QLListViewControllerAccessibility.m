@interface QLListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation QLListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  id v2 = (id)[(QLListViewControllerAccessibility *)self safeValueForKey:@"_dismiss"];
  return 1;
}

@end