@interface AXSpringBoardUIServicesGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSpringBoardUIServicesGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_282];

    _Failover = objc_alloc_init(AXSpringBoardUIServicesGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __60__AXSpringBoardUIServicesGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __60__AXSpringBoardUIServicesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SpringBoardUIServices AX"];
  [v2 setOverrideProcessName:@"SpringBoardUIServices"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __60__AXSpringBoardUIServicesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SBUIPasscodeLockViewBaseAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIRingViewLabelButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIPasscodeTextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIPasscodeLockNumberPadAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBPasscodeNumberPadButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBEmptyButtonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIVibrantButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUILegibilityLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUISimpleFixedDigitPasscodeEntryFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIRemoteAlertServiceViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBPowerDownViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIProudLockIconViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIPasscodeEntryFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIPasscodeLockViewWithKeyboardAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIPasscodeLockViewSimpleFixedDigitKeypadAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUICallToActionLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUILongNumericPasscodeEntryFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIPasscodeLockViewWithKeypadAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUISpotlightBarNavigationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIPasscodePillButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSUIWallpaperPreviewViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIAppleLogoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBSUIWallpaperButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUISystemApertureElementSourceAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUISystemApertureSecureWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUISystemApertureCAPackageButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SBUIPasscodeBiometricAuthenticationViewAccessibility" canInteractWithTargetClass:1];
}

@end