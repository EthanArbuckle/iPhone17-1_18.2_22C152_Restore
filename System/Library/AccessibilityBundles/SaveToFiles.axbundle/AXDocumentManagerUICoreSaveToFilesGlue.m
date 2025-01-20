@interface AXDocumentManagerUICoreSaveToFilesGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXDocumentManagerUICoreSaveToFilesGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_1);
  }
}

void __71__AXDocumentManagerUICoreSaveToFilesGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __71__AXDocumentManagerUICoreSaveToFilesGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __71__AXDocumentManagerUICoreSaveToFilesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SaveToFiles AX"];
  [v2 setOverrideProcessName:@"SaveToFiles"];

  return MEMORY[0x270F0A270]();
}

void __71__AXDocumentManagerUICoreSaveToFilesGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"DOCSidebarItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCSidebarHeaderCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCItemCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCItemCollectionGridCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCItemCollectionListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCItemCollectionCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCSidebarViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCCopyableLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCFilenameViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCItemRenameTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCProgressIndicatorViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCMetadataKeyValueRowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIDocumentBrowserActionBarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIBarButtonItemAccessibility__DocumentManager__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOCItemInfoOpenButtonAccessibility" canInteractWithTargetClass:1];
}

@end