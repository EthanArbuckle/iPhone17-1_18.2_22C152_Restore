@interface AXImageQuickLookGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXImageQuickLookGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:&__block_literal_global_273 safeCategoryInstallationHandler:&__block_literal_global_276];
}

uint64_t __53__AXImageQuickLookGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __53__AXImageQuickLookGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __53__AXImageQuickLookGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"QLImageDisplayBundleAccessibility" canInteractWithTargetClass:1];
}

@end