@interface AXSetupAssistantUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSetupAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:&__block_literal_global_284 safeCategoryInstallationHandler:&__block_literal_global_287];
}

uint64_t __55__AXSetupAssistantUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXSetupAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SetupAssistantUI Accessibility"];
  [v2 setOverrideProcessName:@"SetupAssistantUI"];

  return MEMORY[0x270F0A270]();
}

void __55__AXSetupAssistantUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"BFFPaneHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BFFWindowAccessibility" canInteractWithTargetClass:1];
}

@end