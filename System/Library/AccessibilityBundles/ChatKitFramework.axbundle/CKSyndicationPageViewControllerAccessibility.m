@interface CKSyndicationPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKSyndicationPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKSyndicationPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKSyndicationPageViewControllerAccessibility;
  [(CKSyndicationPageViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CKSyndicationPageViewControllerAccessibility *)self safeValueForKey:@"pageControl"];
  [v3 setIsAccessibilityElement:1];
}

@end