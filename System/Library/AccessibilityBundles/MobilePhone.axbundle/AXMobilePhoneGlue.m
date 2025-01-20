@interface AXMobilePhoneGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobilePhoneGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_368 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_377];

    _Failover = [objc_allocWithZone((Class)AXMobilePhoneGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __50__AXMobilePhoneGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"PHVoicemailPlayerController", @"sharedPlayerController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"phonePad: appendString:", "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"phonePad: replaceLastDigitWithString:", "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"viewWillDisappear:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"VMVoicemail", @"flags", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailPlayerController", @"isPlaying", "B", 0);
  [v2 validateClass:@"DialerController" hasInstanceVariable:@"_dialerView" withType:"PHAbstractDialerView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"_phonePad: appendString: suppressClearingDialedNumber:", "v", "@", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"phonePadDeleteLastDigit:", "v", "@", 0);
  [v2 validateClass:@"DialerController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"_callButtonPressed:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"phonePadDeleteLastDigit:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"phonePad: appendString:", "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DialerController", @"loadView", "v", 0);
  [v2 validateClass:@"MPKeypadViewController" isKindOfClass:@"DialerController"];
  [v2 validateClass:@"PHHandsetDialerNameLabelView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHHandsetDialerLCDView", @"delegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractDialerView", @"delegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHHandsetDialerLCDView", @"deleteCharacter", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHHandsetDialerLCDView", @"setText: needsFormat:", "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAbstractDialerView", @"lcdView", "@", 0);
  [v2 validateClass:@"PHAbstractDialerView" hasInstanceVariable:@"_addContactButton" withType:"UIControl"];
  [v2 validateClass:@"PHAbstractDialerView" hasInstanceVariable:@"_deleteButton" withType:"UIControl"];
  [v2 validateClass:@"PHAbstractDialerView" hasInstanceVariable:@"_callButton" withType:"UIControl"];
  [v2 validateClass:@"PHHandsetDialerLCDView" hasInstanceVariable:@"_numberTextField" withType:"PHLCDViewTextField"];
  [v2 validateClass:@"PHLCDViewTextField" isKindOfClass:@"UITextField"];

  return 1;
}

uint64_t __50__AXMobilePhoneGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobilePhone AX Bundle"];
  [v2 setOverrideProcessName:@"Phone"];

  return MEMORY[0x270F0A270]();
}

void __50__AXMobilePhoneGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"DialerControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PhoneRootViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHTextCycleLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VMPlayerTimelineSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHVoicemailGreetingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHVoicemailPlayerControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PhoneApplicationAccesssibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPRecentsTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHRecentCallDetailsItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobilePhoneUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MobilePhoneUILabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHAbstractDialerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHHandsetDialerLCDViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHLCDViewTextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHVoicemailInboxListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHVoicemailMessageTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VMMessageMetadataViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHHandsetDialerDeleteButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHHandsetDialerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VMRoundButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VMPlayerControlButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHVoicemailMessageTableViewCellScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PersonalNicknameMenuViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPLegacyRecentsTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPVoicemailMessageViewModelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPVoicemailTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VMMessageTranscriptViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITextViewAccessibility__MobilePhone__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHDialerContactResultButtonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SearchHeaderCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ContactSearchViewCellAccessibility" canInteractWithTargetClass:1];
}

@end