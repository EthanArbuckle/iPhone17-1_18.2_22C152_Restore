@interface AXMessageUIFrameworkGlue
+ (void)_webKitInitialized;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMessageUIFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v3 = [MEMORY[0x263F21400] sharedInstance];
    [v3 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_400 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_409];

    uint64_t v4 = [objc_allocWithZone((Class)AXMessageUIFrameworkGlue) init];
    v5 = (void *)_Failover;
    _Failover = v4;

    v6 = [MEMORY[0x263F21388] sharedInstance];
    [v6 addHandler:&__block_literal_global_522 forFramework:@"WebKitLegacy"];
  }
  if ([(id)*MEMORY[0x263F1D020] _accessibilityBoolValueForKey:@"_accessibilityWebKitLoaded"])
  {
    [a1 _webKitInitialized];
  }
  else
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:a1 selector:sel__webKitInitialized name:@"UIApplicationLoadedWebKit" object:0];
  }
}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MFMailComposeView"];
  [v2 validateClass:@"UITextField"];
  [v2 validateClass:@"MFModernComposeRecipientAtom"];
  [v2 validateClass:@"MFComposeFromView"];
  [v2 validateClass:@"MFComposeSubjectView"];
  [v2 validateClass:@"MFComposeRecipient"];
  [v2 validateClass:@"MFRecipientTableViewCell"];
  [v2 validateClass:@"MFModernAtomView"];
  [v2 validateClass:@"MFModernLabelledAtomList"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFRecipientTableViewCell", @"recipient", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipient", @"displayString", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipient", @"address", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipient", @"label", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeView", @"initWithFrame: options: isQuickReply:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "Q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeSubjectView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientView", @"addRecipient: index: animate:", "v", "@", "Q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientView", @"addButton", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientView", @"recipients", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientView", @"_reflowAnimated:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientView", @"removeRecipient:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextContentView", @"webView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"WebView", @"selectedDOMRange", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeImageSizeView", @"setSizeDescription:forScale:", "v", "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeImageSizeView", @"_scaleLabelIndexForScale:", "Q", "Q", 0);
  [v2 validateClass:@"_MFPlaceholderComposeRecipient" isKindOfClass:@"MFComposeRecipient"];
  [v2 validateClass:@"MFModernComposeRecipientAtom" isKindOfClass:@"MFModernAtomView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFModernAtomView", @"presentationOptions", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFModernAtomView", @"title", "@", 0);
  [v2 validateClass:@"MFComposeImageSizeView" hasInstanceVariable:@"_segmentedControl" withType:"UISegmentedControl"];
  [v2 validateClass:@"MFModernComposeRecipientAtom" hasInstanceVariable:@"_recipient" withType:"MFComposeRecipient"];
  [v2 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_ccField" withType:"MFMailComposeRecipientTextView"];
  [v2 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_bccField" withType:"MFMailComposeRecipientTextView"];
  [v2 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_subjectField" withType:"MFComposeSubjectView"];
  [v2 validateClass:@"MFModernAddressAtom" hasInstanceVariable:@"_atomView" withType:"CNAtomView"];
  [v2 validateClass:@"MFHeaderLabelView"];
  [v2 validateClass:@"_MFMailRecipientTextField"];
  [v2 validateClass:@"MFComposeMultiView"];

  return 1;
}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MessageUI Framework AX Bundle"];
  [v2 setOverrideProcessName:@"MessageUI"];

  return MEMORY[0x270F09468]();
}

void __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UITableViewAccessibility__MessageUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITextViewAccessibility__MessageUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeRecipientTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMailComposeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFHeaderLabelViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFModernLabelledAtomListAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFModernComposeRecipientAtomAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFCaptionLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeWebViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeRecipientAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeFromViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFRecipientTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeRecipientViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeSubjectViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeImageSizeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMailComposeControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFModernAtomViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFModernAddressAtomAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFAtomTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_MFAtomTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIDimmingViewAccessibility__MessageUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFAttachmentAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIViewAccessibility__MessageUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFAutocompleteResultsTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_MFAtomFieldEditorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeSendAccessoryButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeStyleSelectorButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeTextColorButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFPhotoPickerControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFPhotoPickerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFMailComposeNavigationBarTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeActionCardTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFComposeStyleSelectorViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WKContentViewAccessibility__MessageUI__WebKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFQuickReplyExpandButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFQuickReplySendAccessoryButtonAccessibility" canInteractWithTargetClass:1];
}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_526 withPreValidationHandler:&__block_literal_global_534 postValidationHandler:&__block_literal_global_543];
}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextContentView", @"_accessibilityShouldUpdateTextCache", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextContentView", @"_accessibilitySetShouldUpdateCache:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextContentView", @"_accessibilitySetShouldUpdateCache:", "v", "B", 0);

  return 1;
}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MessageUI - WebKitLegacy"];
  [v2 setOverrideProcessName:@"UIKitWeb"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

+ (void)_webKitInitialized
{
  if (_UIApplicationIsExtension())
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2401F1000, v2, OS_LOG_TYPE_DEFAULT, "Not loading MessageUI.axbundle because we're in an extension", v3, 2u);
    }
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke()
{
  if (_Failover_block_invoke_onceToken != -1) {
    dispatch_once(&_Failover_block_invoke_onceToken, &__block_literal_global_557);
  }
}

void __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke_2()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_559 withPreValidationHandler:&__block_literal_global_561 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_569];
}

uint64_t __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke_3()
{
  return 1;
}

uint64_t __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MessageUI Web Framework AX Bundle"];
  [v2 setOverrideProcessName:@"MessageUI - Web"];

  return MEMORY[0x270F09468]();
}

uint64_t __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore" canInteractWithTargetClass:1];
}

@end