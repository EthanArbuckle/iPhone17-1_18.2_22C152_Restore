@interface AXMusicUsageGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMusicUsageGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __49__AXMusicUsageGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __49__AXMusicUsageGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __49__AXMusicUsageGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MusicUsage Usage UI Settings AX Bundle"];
  [v2 setOverrideProcessName:@"MusicUsage Usage UI Settings"];

  return MEMORY[0x270F0A270]();
}

void __49__AXMusicUsageGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MusicUsageDetailHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MusicUsageTableViewCellAccessibility" canInteractWithTargetClass:1];
}

@end