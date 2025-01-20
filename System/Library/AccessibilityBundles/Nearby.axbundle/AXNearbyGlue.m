@interface AXNearbyGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXNearbyGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken_0 != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken_0, &__block_literal_global_0);
  }
}

void __45__AXNearbyGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __45__AXNearbyGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __45__AXNearbyGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"Nearby"];
  [v2 setValidationTargetName:@"Nearby Accessibility Bundle"];

  return MEMORY[0x270F0A270]();
}

uint64_t __45__AXNearbyGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"NUIContainerStackViewAccessibility" canInteractWithTargetClass:1];
}

@end