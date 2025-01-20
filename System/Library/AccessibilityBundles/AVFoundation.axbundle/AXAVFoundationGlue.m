@interface AXAVFoundationGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAVFoundationGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXAVFoundationGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __51__AXAVFoundationGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __51__AXAVFoundationGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AVFoundation AX"];
  [v2 setOverrideProcessName:@"AVFoundation"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __51__AXAVFoundationGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 hasPrefix:*MEMORY[0x263F21360]];

  if ((v4 & 1) == 0) {
    [v5 installSafeCategory:@"AVPlayerAccessibility" canInteractWithTargetClass:1];
  }
}

@end