@interface AXSiriGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSiriGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
  id v2 = [MEMORY[0x263F22838] server];
  [v2 registerSiriViewServicePID:getpid()];
}

void __43__AXSiriGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_280 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_289];
}

uint64_t __43__AXSiriGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"AceObject", @"propertyForKey:", "@", 0);
  [v2 validateClass:@"SRSecureWindow"];

  return 1;
}

uint64_t __43__AXSiriGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Siri AX Bundle"];
  [v2 setOverrideProcessName:@"Siri"];

  return MEMORY[0x270F0A270]();
}

void __43__AXSiriGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SRSiriViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SRUserUtteranceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SRGuideViewHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SRGuideViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SRGuideDetailSectionHeaderCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SRSpeechAlternativeTapToEditCellViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SRSecureWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SRCompactTextRequestViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SystemAssistantPromptEntryViewAccessibility" canInteractWithTargetClass:1];
}

@end