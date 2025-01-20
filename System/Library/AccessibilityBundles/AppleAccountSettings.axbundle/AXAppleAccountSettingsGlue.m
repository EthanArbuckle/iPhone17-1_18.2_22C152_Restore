@interface AXAppleAccountSettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAppleAccountSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __59__AXAppleAccountSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_278 withPreValidationHandler:&__block_literal_global_280 postValidationHandler:&__block_literal_global_286 safeCategoryInstallationHandler:&__block_literal_global_289];
}

uint64_t __59__AXAppleAccountSettingsGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __59__AXAppleAccountSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AppleAccount settings"];
  [v2 setOverrideProcessName:@"AppleAccount settings"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __59__AXAppleAccountSettingsGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AAUserNotificationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AAUIAppleAccountHeaderViewAccessibility" canInteractWithTargetClass:1];
}

@end