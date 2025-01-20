@interface AXMailAssistantUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMailAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __54__AXMailAssistantUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_335 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_344];
}

uint64_t __54__AXMailAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_toHeader" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_toField" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_ccHeader" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_ccField" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_bccHeader" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_bccField" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_subjectHeader" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_subjectField" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetComposeView" hasInstanceVariable:@"_bodyText" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetSearchResultCellView" hasInstanceVariable:@"_addressLabel" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetSearchResultCellView" hasInstanceVariable:@"_subjectLabel" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetSearchResultCellView" hasInstanceVariable:@"_bodyLabel" withType:"UILabel"];
  [v2 validateClass:@"MFEmailSnippetSearchResultCellView" hasInstanceVariable:@"_dateLabel" withType:"UIDateLabel"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFAssistantEmail", @"statusFlags", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MFEmailSnippetSearchResultCellView", @"setEmail:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SAEmailEmail", @"outgoing", "@", 0);

  return 1;
}

uint64_t __54__AXMailAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Assistant Mail AX Bundle"];
  [v2 setOverrideProcessName:@"Assistant Mail"];

  return MEMORY[0x270F0A270]();
}

void __54__AXMailAssistantUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MFEmailSnippetComposeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MFEmailSnippetSearchResultCellViewAccessibility" canInteractWithTargetClass:1];
}

@end