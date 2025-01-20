@interface AXInCallServiceGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXInCallServiceGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_300 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_309];
}

uint64_t __52__AXInCallServiceGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHEmergencyDialerViewController", @"viewDidDisappear:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHEmergencyDialerViewController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallParticipantsView", @"singleCallLabelView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallParticipantsView", @"topMultipleCallLabelView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallParticipantsView", @"bottomMultipleCallLabelView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractCallParticipantLabelView", @"participantMarqueeLabel", "@", 0);

  return 1;
}

uint64_t __52__AXInCallServiceGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"InCallService AX Bundle"];
  [v2 setOverrideProcessName:@"InCallService"];

  return MEMORY[0x270F0A270]();
}

void __52__AXInCallServiceGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PHAudioCallViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"InCallServiceApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHMobilePhoneRemoteViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHVideoCallInterfaceOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHEmergencyDialerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHHandsetDialerLCDViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHLCDViewTextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHAudioCallControlsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobilePhoneUILabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHBottomBarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHBottomBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHHandsetDialerDeleteButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHSingleCallParticipantLabelViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHAudioControlsButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHCountdownViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHSlidingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHSOSViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHSOSDialCountdownViewModelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHSOSNotifyCountdownViewModelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHActionSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHSOSDisconnectionConfirmationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHCallParticipantsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHBannerButtonsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ICSApplicationDelegateAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHInCallRemoteAlertShellViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end