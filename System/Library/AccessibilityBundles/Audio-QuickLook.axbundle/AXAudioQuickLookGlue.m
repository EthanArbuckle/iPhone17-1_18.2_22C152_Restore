@interface AXAudioQuickLookGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAudioQuickLookGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_284];
}

uint64_t __53__AXAudioQuickLookGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __53__AXAudioQuickLookGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileQuickLook Audio AX Bundle"];
  [v2 setOverrideProcessName:@"MobileQuickLook Audio"];

  return MEMORY[0x270F0A270]();
}

uint64_t __53__AXAudioQuickLookGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"QLAudioViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end