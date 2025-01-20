@interface AXGameCenterPrivateUIFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXGameCenterPrivateUIFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_276);
  }
}

void __67__AXGameCenterPrivateUIFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_280 withPreValidationHandler:&__block_literal_global_294 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_303];
}

uint64_t __67__AXGameCenterPrivateUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"GKTurnGameCell" isKindOfClass:@"GKBaseGameCell"];
  [v2 validateClass:@"GKTurnParticipantCell" isKindOfClass:@"GKBasePlayerCell"];

  return 1;
}

uint64_t __67__AXGameCenterPrivateUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"GameCenterPrivateUIFramework"];
  [v2 setValidationTargetName:@"GameCenterPrivateUIFramework Accessibility Bundle"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __67__AXGameCenterPrivateUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"GKBaseGameCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKPlayerGameCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKPurchasableGameCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKShowMoreViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKTextBubbleControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKValueWithCaptionBubbleControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_GKBubbleFlowPseudoModalViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKComposeHeaderFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKBubbleFlowOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKSectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKRatingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKBubbleFlowAnimatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKBasePlayerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKTurnParticipantCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GKTurnGameCellAccessibility" canInteractWithTargetClass:1];
}

@end