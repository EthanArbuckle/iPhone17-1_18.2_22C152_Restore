@interface AXDiagnosticsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXDiagnosticsGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXDiagnosticsGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __50__AXDiagnosticsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __50__AXDiagnosticsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Diagnostics AX"];
  [v2 setOverrideProcessName:@"Diagnostics"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __50__AXDiagnosticsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"DeviceInformationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CardViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TestRunnerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PromptViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TextButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ImageButtonAccessibility" canInteractWithTargetClass:1];
}

@end