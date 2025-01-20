@interface CCUIConnectivityAirplaneViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)buttonTapped:(id)a3;
@end

@implementation CCUIConnectivityAirplaneViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIConnectivityAirplaneViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIConnectivityAirplaneViewController", @"buttonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIConnectivityAirplaneViewController", @"_isAirplaneModeEnabled", "B", 0);
}

- (void)buttonTapped:(id)a3
{
  id v4 = a3;
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    v5 = [MEMORY[0x263F22860] bluetoothKeyboardDevices];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v7 = [MEMORY[0x263F229E8] server];
    int v8 = [v7 isBluetoothBrailleDisplayConnected];
  }
  else
  {
    int v8 = 0;
  }
  char v9 = [(CCUIConnectivityAirplaneViewControllerAccessibility *)self safeBoolForKey:@"_isAirplaneModeEnabled"];
  if (UIAccessibilityIsSwitchControlRunning() | v6 | v8) != 1 || (v9)
  {
    v22.receiver = self;
    v22.super_class = (Class)CCUIConnectivityAirplaneViewControllerAccessibility;
    [(CCUIConnectivityAirplaneViewControllerAccessibility *)&v22 buttonTapped:v4];
  }
  else
  {
    char v28 = 0;
    objc_opt_class();
    v10 = __UIAccessibilityCastAsClass();
    v11 = (void *)MEMORY[0x263F1C3F8];
    v12 = accessibilityLocalizedString(@"control.center.airplane.mode.enable.alert.title");
    v13 = accessibilityLocalizedString(@"control.center.bluetooth.devices.disconnect.message");
    v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

    v15 = (void *)MEMORY[0x263F1C3F0];
    v16 = accessibilityLocalizedString(@"control.center.alert.cancel");
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __68__CCUIConnectivityAirplaneViewControllerAccessibility_buttonTapped___block_invoke;
    v26[3] = &unk_2651173D0;
    id v27 = v10;
    id v17 = v10;
    v18 = [v15 actionWithTitle:v16 style:1 handler:v26];

    v19 = (void *)MEMORY[0x263F1C3F0];
    v20 = accessibilityLocalizedString(@"control.center.airplane.mode.alert.confirm");
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __68__CCUIConnectivityAirplaneViewControllerAccessibility_buttonTapped___block_invoke_2;
    v23[3] = &unk_2651173F8;
    id v24 = v4;
    v25 = self;
    v21 = [v19 actionWithTitle:v20 style:0 handler:v23];

    [v14 addAction:v18];
    [v14 addAction:v21];
    [v14 setPreferredAction:v18];
    [v17 presentViewController:v14 animated:1 completion:0];
  }
}

uint64_t __68__CCUIConnectivityAirplaneViewControllerAccessibility_buttonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

id __68__CCUIConnectivityAirplaneViewControllerAccessibility_buttonTapped___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)CCUIConnectivityAirplaneViewControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_buttonTapped_, v1);
}

@end