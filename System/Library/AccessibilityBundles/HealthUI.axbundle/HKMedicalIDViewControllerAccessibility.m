@interface HKMedicalIDViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMakeEditingInsertStyleControlInaccessibleOnCell:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKMedicalIDViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKMedicalIDViewController" conformsToProtocol:@"UITableViewDataSource"];
  [v3 validateClass:@"HKMedicalIDViewController" isKindOfClass:@"UITableViewController"];
  [v3 validateClass:@"HKMedicalIDViewController" conformsToProtocol:@"UITableViewDataSource"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewController", @"tableView", "@", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDViewControllerAccessibility;
  [(HKMedicalIDViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(HKMedicalIDViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)HKMedicalIDViewControllerAccessibility;
  [(HKMedicalIDViewControllerAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  char v12 = 0;
  objc_opt_class();
  id v3 = [(HKMedicalIDViewControllerAccessibility *)self safeValueForKey:@"tableView"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 visibleCells];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__HKMedicalIDViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11[3] = &unk_265125FB0;
  v11[4] = self;
  [v5 enumerateObjectsUsingBlock:v11];

  char v12 = 0;
  v6 = [(HKMedicalIDViewControllerAccessibility *)self safeValueForKey:@"navigationItem"];
  v7 = __UIAccessibilitySafeClass();

  v8 = [v7 titleView];
  v9 = __UIAccessibilitySafeClass();

  if (v12) {
    abort();
  }
  v10 = [v9 text];
  [v9 setAccessibilityLabel:v10];

  [v9 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

uint64_t __84__HKMedicalIDViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _accessibilityMakeEditingInsertStyleControlInaccessibleOnCell:a2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDViewControllerAccessibility;
  v5 = [(HKMedicalIDViewControllerAccessibility *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  [(HKMedicalIDViewControllerAccessibility *)self _accessibilityMakeEditingInsertStyleControlInaccessibleOnCell:v5];

  return v5;
}

- (void)_accessibilityMakeEditingInsertStyleControlInaccessibleOnCell:(id)a3
{
}

@end