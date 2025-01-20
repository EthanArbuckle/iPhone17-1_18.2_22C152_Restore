@interface ContinuousReadingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_outerScrollView;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ContinuousReadingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ContinuousReadingViewController";
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
  v4.super_class = (Class)ContinuousReadingViewControllerAccessibility;
  [(ContinuousReadingViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = (id)[(ContinuousReadingViewControllerAccessibility *)self safeValueForKey:@"_outerScrollView"];
}

- (id)_outerScrollView
{
  v4.receiver = self;
  v4.super_class = (Class)ContinuousReadingViewControllerAccessibility;
  v2 = [(ContinuousReadingViewControllerAccessibility *)&v4 _outerScrollView];
  [v2 setFocusGroupIdentifier:0];

  return v2;
}

@end