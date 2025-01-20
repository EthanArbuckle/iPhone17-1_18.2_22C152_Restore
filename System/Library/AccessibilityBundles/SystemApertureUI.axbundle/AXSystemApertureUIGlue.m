@interface AXSystemApertureUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSystemApertureUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXSystemApertureUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __55__AXSystemApertureUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXSystemApertureUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SystemApertureUI AX"];
  [v2 setOverrideProcessName:@"SystemApertureUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __55__AXSystemApertureUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SAUIElementViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SAUIElementViewAccessibility" canInteractWithTargetClass:1];
}

@end