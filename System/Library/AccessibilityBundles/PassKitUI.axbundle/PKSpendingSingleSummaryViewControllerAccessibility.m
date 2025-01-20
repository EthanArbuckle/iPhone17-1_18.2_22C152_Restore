@interface PKSpendingSingleSummaryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_configureFooter;
- (void)viewDidLoad;
@end

@implementation PKSpendingSingleSummaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSpendingSingleSummaryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSingleSummaryViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"PKSpendingSingleSummaryViewController" isKindOfClass:@"UICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSingleSummaryViewController", @"_configureFooter", "v", 0);
  [v3 validateClass:@"PKSpendingSingleSummaryViewController" hasInstanceVariable:@"_currentFooter" withType:"PKDashboardViewControllerFooterView"];
  [v3 validateClass:@"PKDashboardViewControllerFooterView" hasInstanceVariable:@"_payButtonImage" withType:"UIImage"];
  [v3 validateClass:@"PKDashboardViewControllerFooterView" hasInstanceVariable:@"_payButton" withType:"PKContinuousButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PKSpendingSingleSummaryViewControllerAccessibility;
  [(PKSpendingSingleSummaryViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKSpendingSingleSummaryViewControllerAccessibility *)self safeUIViewForKey:@"collectionView"];
  [v3 _setAccessibilityFauxCollectionViewCellsDisabled:1];

  v4 = [(PKSpendingSingleSummaryViewControllerAccessibility *)self safeValueForKey:@"_currentFooter"];
  v5 = [v4 safeValueForKey:@"_payButtonImage"];

  if (v5)
  {
    v6 = accessibilityLocalizedString(@"completed.button");
    v7 = [(PKSpendingSingleSummaryViewControllerAccessibility *)self safeValueForKey:@"_currentFooter"];
    v8 = [v7 safeUIViewForKey:@"_payButton"];
    [v8 setAccessibilityLabel:v6];
  }
}

- (void)_configureFooter
{
  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSingleSummaryViewControllerAccessibility;
  [(PKSpendingSingleSummaryViewControllerAccessibility *)&v3 _configureFooter];
  [(PKSpendingSingleSummaryViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSingleSummaryViewControllerAccessibility;
  [(PKSpendingSingleSummaryViewControllerAccessibility *)&v3 viewDidLoad];
  [(PKSpendingSingleSummaryViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end