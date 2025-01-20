@interface AXSiriUICoreAXGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSiriUICoreAXGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __51__AXSiriUICoreAXGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_277 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_283];
}

uint64_t __51__AXSiriUICoreAXGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __51__AXSiriUICoreAXGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Siri UI Core AX Bundle"];
  [v2 setOverrideProcessName:@"Siri UI Core AX Bundle"];

  return MEMORY[0x270F0A270]();
}

void __51__AXSiriUICoreAXGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SUICProgressIndicatorViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUICFlamesViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUICOrbViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUICStreamingTextViewAccessibility" canInteractWithTargetClass:1];
}

@end