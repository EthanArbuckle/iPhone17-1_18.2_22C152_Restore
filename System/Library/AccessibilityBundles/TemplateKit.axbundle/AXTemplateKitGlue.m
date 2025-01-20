@interface AXTemplateKitGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTemplateKitGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __50__AXTemplateKitGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __50__AXTemplateKitGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __50__AXTemplateKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"TemplateKit AX"];
  [v2 setOverrideProcessName:@"TemplateKit"];

  return MEMORY[0x270F0A270]();
}

void __50__AXTemplateKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"TLKContentsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKKeyValueGridViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKAuxilliaryTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKTextAreaViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKRichTextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKStarsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKDetailsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKMultilineTextAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKSelectableGridButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKStoreButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TLKImageViewAccessibility" canInteractWithTargetClass:1];
}

@end