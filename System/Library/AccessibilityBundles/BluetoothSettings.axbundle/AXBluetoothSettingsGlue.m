@interface AXBluetoothSettingsGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXBluetoothSettingsGlue

+ (id)accessibilityBundles
{
  return (id)[MEMORY[0x263EFF8C0] array];
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke_2;
    v6[3] = &unk_26510ECE8;
    v7 = @"BluetoothSettings";
    v8 = @"BluetoothSettings";
    [v2 performValidations:&__block_literal_global withPreValidationHandler:v6 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_282];

    uint64_t v3 = [objc_allocWithZone((Class)AXBluetoothSettingsGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    v5 = [MEMORY[0x263F229D0] sharedInstance];
    [v5 installSafeCategories:&__block_literal_global_291 afterDelay:@"BluetoothSettings" validationTargetName:@"BluetoothSettings" overrideProcessName:0.0];
  }
}

uint64_t __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setValidationTargetName:v3];
  [v4 setOverrideProcessName:*(void *)(a1 + 40)];

  return MEMORY[0x270F0A270]();
}

void __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"BTSDevicesControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BTSSPPairingRequestAccessibility" canInteractWithTargetClass:1];
}

void __56__AXBluetoothSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"BTTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BTTableSharingCellAccessibility" canInteractWithTargetClass:1];
}

@end