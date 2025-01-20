@interface AXAppleAccountUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAppleAccountUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __53__AXAppleAccountUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_276 withPreValidationHandler:&__block_literal_global_278 postValidationHandler:&__block_literal_global_284 safeCategoryInstallationHandler:&__block_literal_global_287];
}

uint64_t __53__AXAppleAccountUIGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __53__AXAppleAccountUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AppleAccountUI"];
  [v2 setOverrideProcessName:@"AppleAccountUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __53__AXAppleAccountUIGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AAUISignInViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AAUIImageControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AAUIProfilePhotoViewAccessibility" canInteractWithTargetClass:1];
}

@end