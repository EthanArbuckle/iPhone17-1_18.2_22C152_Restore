@interface TVRUIDevicePickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupDeviceTitleView;
- (void)_toggleState;
@end

@implementation TVRUIDevicePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUIDevicePickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDevicePickerViewController", @"_setupDeviceTitleView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDevicePickerViewController", @"isDevicePickerShowing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDevicePickerViewController", @"titleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDevicePickerViewController", @"tableView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDevicePickerViewController", @"_toggleState", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVRUIDeviceListCell", @"device", "@", 0);
  [v3 validateProtocol:@"TVRUIDevice" hasRequiredInstanceMethod:@"model"];
  [v3 validateProtocol:@"TVRUIDevice" hasRequiredInstanceMethod:@"name"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)TVRUIDevicePickerViewControllerAccessibility;
  [(TVRUIDevicePickerViewControllerAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TVRUIDevicePickerViewControllerAccessibility *)self safeValueForKey:@"titleButton"];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_26515E8F0;
  objc_copyWeak(&v10, &location);
  [v3 _setAccessibilityValueBlock:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_26515E8F0;
  objc_copyWeak(&v8, &location);
  [v3 _setAccessibilityHintBlock:v7];
  v4 = [(TVRUIDevicePickerViewControllerAccessibility *)self safeValueForKey:@"tableView"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v5[3] = &unk_26515E918;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityElementsHiddenBlock:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"isDevicePickerShowing"]) {
    v2 = @"dropdown.expanded.value";
  }
  else {
    v2 = @"dropdown.collapsed.value";
  }
  id v3 = accessibilityLocalizedString(v2);

  return v3;
}

id __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"isDevicePickerShowing"]) {
    v2 = @"dropdown.expanded.hint";
  }
  else {
    v2 = @"dropdown.collapsed.hint";
  }
  id v3 = accessibilityLocalizedString(v2);

  return v3;
}

uint64_t __90__TVRUIDevicePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isDevicePickerShowing"] ^ 1;

  return v2;
}

- (void)_setupDeviceTitleView
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIDevicePickerViewControllerAccessibility;
  [(TVRUIDevicePickerViewControllerAccessibility *)&v3 _setupDeviceTitleView];
  [(TVRUIDevicePickerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)TVRUIDevicePickerViewControllerAccessibility;
  v4 = [(TVRUIDevicePickerViewControllerAccessibility *)&v14 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = [v4 safeValueForKey:@"device"];
  uint64_t v6 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v6];
  v7 = [v5 safeValueForKey:@"model"];
  int v8 = [v7 containsString:@"AppleTV"];

  v9 = [v5 safeValueForKey:@"name"];
  if (v8) {
    id v10 = @"apple.tv.device.label";
  }
  else {
    id v10 = @"tv.device.label";
  }
  v11 = accessibilityLocalizedString(v10);
  objc_super v12 = __UIAXStringForVariables();
  objc_msgSend(v4, "setAccessibilityLabel:", v12, v11, @"__AXStringForVariablesSentinel");

  return v4;
}

- (void)_toggleState
{
  v2.receiver = self;
  v2.super_class = (Class)TVRUIDevicePickerViewControllerAccessibility;
  [(TVRUIDevicePickerViewControllerAccessibility *)&v2 _toggleState];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end