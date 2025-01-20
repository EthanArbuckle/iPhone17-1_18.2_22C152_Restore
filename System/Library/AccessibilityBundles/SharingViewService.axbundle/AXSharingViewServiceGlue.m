@interface AXSharingViewServiceGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSharingViewServiceGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __57__AXSharingViewServiceGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];
}

uint64_t __57__AXSharingViewServiceGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __57__AXSharingViewServiceGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SharingViewService"];
  [v2 setOverrideProcessName:@"SharingViewService"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __57__AXSharingViewServiceGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SVSBaseViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AppleTVSetupStartViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ProximityPairingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ProximityStatusViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PINEntryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"iOSSetupStartViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RepairStartViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WHASetupStartViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BroadwayActivationStartViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BroadwayCardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BroadwayActivationDoneViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIButtonAccessibility__Sharing__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SVSCardContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LabelledBatteryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HeadphoneMovieBatteryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HeadphoneBatteryContainerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HeadphoneImageBatteryViewAccessibility" canInteractWithTargetClass:1];
}

@end