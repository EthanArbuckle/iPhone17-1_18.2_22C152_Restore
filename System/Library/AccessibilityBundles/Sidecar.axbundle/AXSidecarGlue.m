@interface AXSidecarGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSidecarGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXSidecarGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __46__AXSidecarGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __46__AXSidecarGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Sidecar AX Bundle"];
  [v2 setOverrideProcessName:@"Sidecar"];

  return MEMORY[0x270F0A270]();
}

@end