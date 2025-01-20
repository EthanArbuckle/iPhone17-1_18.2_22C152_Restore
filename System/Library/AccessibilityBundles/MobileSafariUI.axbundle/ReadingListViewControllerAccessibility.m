@interface ReadingListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUnhideSearchBar;
- (void)viewDidLoad;
@end

@implementation ReadingListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ReadingListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ReadingListViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"ReadingListViewController" hasInstanceVariable:@"_searchBar" withType:"UISearchBar"];
  [v3 validateClass:@"ReadingListViewController" hasInstanceVariable:@"_tableView" withType:"UITableView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)ReadingListViewControllerAccessibility;
  [(ReadingListViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(ReadingListViewControllerAccessibility *)self _axUnhideSearchBar];
}

- (void)_axUnhideSearchBar
{
  objc_opt_class();
  objc_super v3 = [(ReadingListViewControllerAccessibility *)self safeValueForKey:@"_tableView"];
  v4 = __UIAccessibilityCastAsClass();

  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    v5 = [(ReadingListViewControllerAccessibility *)self safeValueForKey:@"_searchBar"];

    if (v5) {
      objc_msgSend(v4, "setContentInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ReadingListViewControllerAccessibility;
  [(ReadingListViewControllerAccessibility *)&v3 viewDidLoad];
  [(ReadingListViewControllerAccessibility *)self _axUnhideSearchBar];
}

@end