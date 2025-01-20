@interface PKAddPaymentPassDevicePickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKAddPaymentPassDevicePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKAddPaymentPassDevicePickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKAddPaymentPassDevicePickerViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewController", @"tableView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKAddPaymentPassDevicePickerViewController", @"tableView:cellForRowAtIndexPath:", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)PKAddPaymentPassDevicePickerViewControllerAccessibility;
  [(PKAddPaymentPassDevicePickerViewControllerAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  char v17 = 0;
  objc_opt_class();
  id v3 = [(PKAddPaymentPassDevicePickerViewControllerAccessibility *)self safeValueForKey:@"tableView"];
  v4 = __UIAccessibilityCastAsClass();

  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [v4 visibleCells];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [v10 accessibilityTraits];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __101__PKAddPaymentPassDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v12[3] = &__block_descriptor_40_e5_Q8__0l;
        v12[4] = v11;
        [v10 _setAccessibilityTraitsBlock:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __101__PKAddPaymentPassDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return *MEMORY[0x263F1CEE8] | *(void *)(a1 + 32);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKAddPaymentPassDevicePickerViewControllerAccessibility;
  v4 = [(PKAddPaymentPassDevicePickerViewControllerAccessibility *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 accessibilityTraits];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__PKAddPaymentPassDevicePickerViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke;
  v7[3] = &__block_descriptor_40_e5_Q8__0l;
  v7[4] = v5;
  [v4 _setAccessibilityTraitsBlock:v7];

  return v4;
}

uint64_t __91__PKAddPaymentPassDevicePickerViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return *MEMORY[0x263F1CEE8] | *(void *)(a1 + 32);
}

@end