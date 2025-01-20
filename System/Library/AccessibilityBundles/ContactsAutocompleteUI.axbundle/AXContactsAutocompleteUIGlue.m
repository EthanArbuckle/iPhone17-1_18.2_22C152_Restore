@interface AXContactsAutocompleteUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXContactsAutocompleteUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXContactsAutocompleteUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __61__AXContactsAutocompleteUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __61__AXContactsAutocompleteUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"ContactsAutocompleteUI AX"];
  [v2 setOverrideProcessName:@"ContactsAutocompleteUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __61__AXContactsAutocompleteUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"_CNAtomTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNComposeRecipientAtomAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAtomViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAtomTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_CNAtomFieldEditorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNComposeTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNComposeRecipientTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAutocompleteDisambiguatingTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNComposeRecipientTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNComposeHeaderLabelViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_CNAtomTextAttachmentAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAutocompleteResultsTableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAutocompleteResultsTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAutocompleteSuggestionsCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAutocompleteSuggestionsViewSectionHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CNAutocompleteSearchControllerAccessibility" canInteractWithTargetClass:1];
}

@end