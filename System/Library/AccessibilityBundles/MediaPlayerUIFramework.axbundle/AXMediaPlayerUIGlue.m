@interface AXMediaPlayerUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMediaPlayerUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __52__AXMediaPlayerUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __52__AXMediaPlayerUIGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __52__AXMediaPlayerUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MediaUI Player AX Bundle"];
  [v2 setOverrideProcessName:@"MediaPlayerUI"];

  return MEMORY[0x270F0A270]();
}

void __52__AXMediaPlayerUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MPUMarqueeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPURatingControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPUEmphasizedTextAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPUNowPlayingIndicatorViewAccessibility" canInteractWithTargetClass:1];
}

@end