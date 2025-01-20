@interface PKSpendingSummaryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKSpendingSummaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSpendingSummaryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKSpendingSummaryViewController" hasInstanceVariable:@"_scrollView" withType:"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSummaryViewController", @"viewDidAppear:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSummaryViewControllerAccessibility;
  [(PKSpendingSummaryViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKSpendingSummaryViewControllerAccessibility *)self safeUIViewForKey:@"_scrollView"];
  [v3 _accessibilitySetScrollAcrossPageBoundaries:0];
  [v3 _accessibilitySetPagingEnabled:1];
  [v3 _accessibilitySetAllowedPagingOverlap:30.0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSummaryViewControllerAccessibility;
  [(PKSpendingSummaryViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(PKSpendingSummaryViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end