@interface MainViewControllerContainerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySpeakThisViewController;
@end

@implementation MainViewControllerContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MainViewControllerContainer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilitySpeakThisViewController
{
  return (id)[(MainViewControllerContainerAccessibility *)self safeValueForKey:@"currentChildViewController"];
}

@end