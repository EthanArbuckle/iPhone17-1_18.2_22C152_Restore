@interface ContaineeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setContainerViewController:(id)a3;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willResignCurrent:(BOOL)a3;
@end

@implementation ContaineeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ContaineeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ContaineeViewController" hasInstanceVariable:@"_cardPresentationController" withType:"CardPresentationController"];
  [v3 validateClass:@"CardPresentationController" hasInstanceVariable:@"_cardView" withType:"CardView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ContaineeViewController", @"willBecomeCurrent:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ContaineeViewController", @"willResignCurrent:", "v", "B", 0);
}

- (void)setContainerViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ContaineeViewControllerAccessibility;
  [(ContaineeViewControllerAccessibility *)&v4 setContainerViewController:a3];
  [(ContaineeViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)ContaineeViewControllerAccessibility;
  [(ContaineeViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ContaineeViewControllerAccessibility *)self safeValueForKey:@"_cardPresentationController"];
  objc_super v4 = [v3 safeValueForKey:@"_cardView"];
  [v4 _accessibilityLoadAccessibilityInformation];

  v5 = [(ContaineeViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v5 setAccessibilityElementsHidden:0];
}

- (void)willBecomeCurrent:(BOOL)a3
{
  id v3 = [(ContaineeViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityElementsHidden:0];
}

- (void)willResignCurrent:(BOOL)a3
{
  id v3 = [(ContaineeViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityElementsHidden:1];
}

@end