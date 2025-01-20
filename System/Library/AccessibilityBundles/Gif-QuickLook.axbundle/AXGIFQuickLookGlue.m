@interface AXGIFQuickLookGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXGIFQuickLookGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:&__block_literal_global_273];
}

uint64_t __51__AXGIFQuickLookGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __51__AXGIFQuickLookGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __51__AXGIFQuickLookGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"QLGIFDisplayBundleAccessibility" canInteractWithTargetClass:1];
}

@end