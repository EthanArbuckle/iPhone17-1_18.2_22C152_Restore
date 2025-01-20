@interface BTSDevicesControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setBluetoothEnabled:(id)a3 specifier:(id)a4;
@end

@implementation BTSDevicesControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BTSDevicesController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setBluetoothEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F2B998] sharedInstance];
  int v9 = [v8 enabled];

  int v10 = [v6 BOOLValue];
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    v11 = [MEMORY[0x263F22860] bluetoothKeyboardDevices];
    BOOL v12 = [v11 count] != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v13 = [MEMORY[0x263F229E8] server];
    int v14 = [v13 isBluetoothBrailleDisplayConnected];
  }
  else
  {
    int v14 = 0;
  }
  if (((UIAccessibilityIsSwitchControlRunning() | v12 | v14) & (v9 ^ v10) ^ 1 | v10))
  {
    v26.receiver = self;
    v26.super_class = (Class)BTSDevicesControllerAccessibility;
    [(BTSDevicesControllerAccessibility *)&v26 setBluetoothEnabled:v6 specifier:v7];
  }
  else
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    v15 = __UIAccessibilityCastAsClass();
    v16 = (void *)MEMORY[0x263F1C3F8];
    v17 = accessibilityLocalizedString(@"bluetooth.disable.alert.title");
    v18 = accessibilityLocalizedString(@"bluetooth.disable.alert.message");
    v19 = [v16 alertControllerWithTitle:v17 message:v18 preferredStyle:1];

    objc_initWeak(&location, v15);
    v20 = (void *)MEMORY[0x263F1C3F0];
    v21 = accessibilityLocalizedString(@"alert.cancel");
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __67__BTSDevicesControllerAccessibility_setBluetoothEnabled_specifier___block_invoke;
    v30[3] = &unk_26510ED30;
    objc_copyWeak(&v31, &location);
    v30[4] = self;
    v22 = [v20 actionWithTitle:v21 style:0 handler:v30];

    v23 = (void *)MEMORY[0x263F1C3F0];
    v24 = accessibilityLocalizedString(@"bluetooth.alert.confirm");
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __67__BTSDevicesControllerAccessibility_setBluetoothEnabled_specifier___block_invoke_2;
    v27[3] = &unk_26510ED58;
    id v28 = v7;
    v29 = self;
    v25 = [v23 actionWithTitle:v24 style:0 handler:v27];

    [v19 addAction:v22];
    [v19 addAction:v25];
    [v15 presentViewController:v19 animated:1 completion:0];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void __67__BTSDevicesControllerAccessibility_setBluetoothEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  [v5 reloadSpecifiers];
}

id __67__BTSDevicesControllerAccessibility_setBluetoothEnabled_specifier___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BTSDevicesControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_setBluetoothEnabled_specifier_, MEMORY[0x263EFFA80], v1);
}

@end