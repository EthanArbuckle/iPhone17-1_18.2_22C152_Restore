@interface MonthScrollViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MonthScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MonthScrollViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MonthScrollViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"MonthScrollViewController" hasInstanceVariable:@"_scrollView" withType:"UIScrollView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)MonthScrollViewControllerAccessibility;
  [(MonthScrollViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MonthScrollViewControllerAccessibility *)self safeValueForKey:@"_scrollView"];
  [v3 accessibilitySetIdentification:@"WorstScrollViewEver"];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MonthScrollViewControllerAccessibility;
  [(MonthScrollViewControllerAccessibility *)&v3 viewDidLoad];
  [(MonthScrollViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end