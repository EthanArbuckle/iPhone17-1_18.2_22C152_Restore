@interface AXPDFKitGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPDFKitGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __45__AXPDFKitGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_274 withPreValidationHandler:&__block_literal_global_276 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_282];
}

uint64_t __45__AXPDFKitGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __45__AXPDFKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX PDFKitGlue"];
  [v2 setOverrideProcessName:@"AX PDFKitGlue"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __45__AXPDFKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PDFPageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PDFThumbnailViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PDFDocumentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PDFRemoteViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PDFIconsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PDFTextInputViewAccessibility" canInteractWithTargetClass:1];
}

@end