@interface AXTextInputUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTextInputUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_299 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_308];

    _Failover = [objc_allocWithZone((Class)AXTextInputUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __50__AXTextInputUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUICandidateView", @"primaryGrid", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUICandidateGrid", @"collectionView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIEmojiSearchInputViewController", @"emojiSearchView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIEmojiSearchView", @"searchTextField", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIEmojiSearchTextField", @"isActive", "B", 0);

  return 1;
}

uint64_t __50__AXTextInputUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"TextInputUI AX"];
  [v2 setOverrideProcessName:@"TextInputUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __50__AXTextInputUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"TUICandidateCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIProactiveCandidateCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUICandidateGroupHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUICandidateGridAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUICandidateSortControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUICandidateArrowButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUICandidateViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUISystemInputAssistantViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIPredictionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIPredictionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIAutofillExtraCandidateCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUISuggestionCandidateCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIEmojiSearchResultCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIEmojiSearchTextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIEmojiSearchResultsCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIEmojiSearchInputViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TUIEmojiSearchViewAccessibility" canInteractWithTargetClass:1];
}

@end