@interface AXUserNotificationsUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXUserNotificationsUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __58__AXUserNotificationsUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_271 withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __58__AXUserNotificationsUIGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __58__AXUserNotificationsUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"UserNotificationsUI"];
  [v2 setDebugBuild:0];
  [v2 setValidationTargetName:@"UserNotificationsUI"];

  return MEMORY[0x270F0A270]();
}

void __58__AXUserNotificationsUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"_UNBlockTouchesViewAcessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CALayerAccessibility__UserNotificationsUI__QuartzCore" canInteractWithTargetClass:1];
}

@end