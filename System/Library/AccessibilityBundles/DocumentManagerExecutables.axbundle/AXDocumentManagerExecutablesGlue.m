@interface AXDocumentManagerExecutablesGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXDocumentManagerExecutablesGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __65__AXDocumentManagerExecutablesGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __65__AXDocumentManagerExecutablesGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __65__AXDocumentManagerExecutablesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"DocumentManagerExecutables AX"];
  [v2 setOverrideProcessName:@"DocumentManagerExecutables"];

  return MEMORY[0x270F0A270]();
}

void __65__AXDocumentManagerExecutablesGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"DOCTagEditorTagCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCTagCheckableDotViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCTagEditorTextFieldCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCAddTagViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCChainedTagsViewAccessibility" canInteractWithTargetClass:1];
}

@end