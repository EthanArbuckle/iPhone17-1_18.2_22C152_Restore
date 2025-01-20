@interface AXPreBoardGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPreBoardGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXPreBoardGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __47__AXPreBoardGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __47__AXPreBoardGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"PreBoard AX Bundle"];
  [v2 setOverrideProcessName:@"PreBoard"];

  return MEMORY[0x270F0A270]();
}

void __47__AXPreBoardGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PBAApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBADeviceUnlockViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBA_SBUICallToActionLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBAPasscodeEntryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBADataRecoveryViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end