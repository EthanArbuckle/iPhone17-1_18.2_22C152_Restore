@interface AXSpringBoardFoundationGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSpringBoardFoundationGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_282];

    _Failover = objc_alloc_init(AXSpringBoardFoundationGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __60__AXSpringBoardFoundationGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __60__AXSpringBoardFoundationGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SpringBoardFoundation AX"];
  [v2 setOverrideProcessName:@"SpringBoardFoundation"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __60__AXSpringBoardFoundationGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SBFWallpaperViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFLockScreenDateViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFLockScreenDateSubtitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFTouchPassThroughViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFFocusIsolationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBFLockScreenDateSubtitleDateViewAccessibility" canInteractWithTargetClass:1];
}

@end