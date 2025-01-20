@interface _UIRootPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPresentationControllerModalizes;
@end

@implementation _UIRootPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIRootPresentationController";
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

- (BOOL)_accessibilityPresentationControllerModalizes
{
  return 0;
}

@end