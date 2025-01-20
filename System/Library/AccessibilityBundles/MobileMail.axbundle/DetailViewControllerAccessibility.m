@interface DetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySpeakThisViewController;
@end

@implementation DetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DetailViewController", @"contentViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"_accessibilitySpeakThisViewController", "@", 0);
}

- (id)_accessibilitySpeakThisViewController
{
  v2 = [(DetailViewControllerAccessibility *)self safeValueForKey:@"contentViewController"];
  id v3 = [v2 safeValueForKey:@"_accessibilitySpeakThisViewController"];

  return v3;
}

@end