@interface AXWirelessModemSettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWirelessModemSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __60__AXWirelessModemSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_278 withPreValidationHandler:&__block_literal_global_280 postValidationHandler:&__block_literal_global_286 safeCategoryInstallationHandler:&__block_literal_global_289];
}

uint64_t __60__AXWirelessModemSettingsGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __60__AXWirelessModemSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"WirelessModem settings"];
  [v2 setOverrideProcessName:@"WirelessModem settings"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

uint64_t __60__AXWirelessModemSettingsGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"SetupViewAccessibility" canInteractWithTargetClass:1];
}

@end