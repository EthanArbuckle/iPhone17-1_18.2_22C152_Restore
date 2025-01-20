@interface AXMobileSafariFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobileSafariFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
  }
}

void __60__AXMobileSafariFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];
}

uint64_t __60__AXMobileSafariFrameworkGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __60__AXMobileSafariFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileSafariFramework"];
  [v2 setOverrideProcessName:@"MobileSafariFramework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __60__AXMobileSafariFrameworkGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SFDialogViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFDialogControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFUnifiedBarItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFUnifiedBarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFStartPageSectionHeaderTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFSiteIconCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_SFFluidProgressViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFSiteRowCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFUnifiedBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFUnifiedBarItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFUnifiedTabBarItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFUnifiedTabBarItemTitleContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_SFCompressedBarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFMoreMenuButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFCapsuleURLFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFCapsuleNavigationBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFAttributedRichLinkCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFScreenTimeOverlayViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFSiteCardCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFStartPageCustomizationCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFStartPageBackgroundImageCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFCrashBannerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFStartPageBackgroundImageModelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFCapsuleCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFSectionDisclosureButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFPrivacyReportBannerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFCapsuleInputAccessorySpacerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_SFSiteIconViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFCapsuleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFTabGroupCapsuleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFTabGroupTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFHighlightBannerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFLinkBannerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabOverviewDisplayItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabOverviewItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabSwitcherAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabOverviewLargeTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SwitchCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFInlinePopUpButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UICollectionViewLayoutAccessibility__MobileSafari__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PopUpCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CapsuleTabGroupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFStepperAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabOverviewNavigationBarTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFScribbleSelectionOverlayAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SFURLFieldOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MediaPlaybackButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MainButtonAccessibility" canInteractWithTargetClass:1];
}

@end