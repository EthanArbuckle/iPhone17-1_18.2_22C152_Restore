@interface AXInCallLockScreenGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXInCallLockScreenGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F21400] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];
}

uint64_t __55__AXInCallLockScreenGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXInCallLockScreenGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"InCallLockScreen AX Bundle"];
  [v2 setOverrideProcessName:@"AXInCallLockScreen"];

  return MEMORY[0x270F09468]();
}

uint64_t __55__AXInCallLockScreenGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"PHCallParticipantsViewAccessibility" canInteractWithTargetClass:1];
}

@end