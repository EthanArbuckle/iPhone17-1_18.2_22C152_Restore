@interface CycleHistoryTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CycleHistoryTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.CycleHistoryTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MenstrualCyclesAppPlugin.CycleHistoryTableViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MenstrualCyclesAppPlugin.CycleHistoryTableViewController", @"axFilterSelected", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)CycleHistoryTableViewControllerAccessibility;
  [(CycleHistoryTableViewControllerAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 navigationItem];
  v5 = [v4 rightBarButtonItem];
  [v5 setIsAccessibilityElement:1];
  v6 = accessibilityLocalizedString(@"cycle.history.filters");
  [v5 setAccessibilityLabel:v6];

  uint64_t v7 = [v5 accessibilityTraits];
  uint64_t v8 = *MEMORY[0x263F1CEE8] | v7;
  int v9 = [(CycleHistoryTableViewControllerAccessibility *)self safeBoolForKey:@"axFilterSelected"];
  uint64_t v10 = *MEMORY[0x263F1CF38];
  if (!v9) {
    uint64_t v10 = 0;
  }
  [v5 setAccessibilityTraits:v8 | v10];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CycleHistoryTableViewControllerAccessibility;
  [(CycleHistoryTableViewControllerAccessibility *)&v3 viewDidLoad];
  [(CycleHistoryTableViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end