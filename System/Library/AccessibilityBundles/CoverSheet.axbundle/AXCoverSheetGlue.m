@interface AXCoverSheetGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXCoverSheetGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_277 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_286];

    _Failover = objc_alloc_init(AXCoverSheetGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __49__AXCoverSheetGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __49__AXCoverSheetGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"CoverSheet AX"];
  [v2 setOverrideProcessName:@"CoverSheet"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __49__AXCoverSheetGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CSChargingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSCoverSheetViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSCoverSheetViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSModalPresentationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSActivityPickerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSHomeAffordanceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSMediaControlsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSPageControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSPasscodeViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSTimerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSFixedFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSRemoteContentModalViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSBatteryChargingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_CSSingleBatteryChargingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_CSDoubleBatteryChargingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSBatteryChargingRingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSDNDBedtimeGreetingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSMagSafeAccessoryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CSFocusActivityIndicatorAccessibility" canInteractWithTargetClass:1];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSComplicationWrapperViewController", @"widgetHostViewController", "@", 0);
  [v2 validateClass:@"CSCoverSheetView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetView", @"backgroundContentView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"sidebarComplicationContainerViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSInlineWidgetContainerViewController", @"widgetViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CSWidgetGridViewController", @"widgetGridViewController", "@", 0);
  [v2 installSafeCategory:@"CSQuickActionsButtonAccessibility" canInteractWithTargetClass:1];
}

@end