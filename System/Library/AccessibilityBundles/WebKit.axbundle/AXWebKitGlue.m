@interface AXWebKitGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWebKitGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __45__AXWebKitGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __45__AXWebKitGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __45__AXWebKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"WebKit AX Bundle"];
  [v2 setOverrideProcessName:@"WebKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __45__AXWebKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WKContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WKSelectSinglePickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WKMultipleSelectPickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WKScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WKWebViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WKFormAccessoryViewAccessibility" canInteractWithTargetClass:1];
}

@end