@interface AXControlCenterUIKitGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXControlCenterUIKitGlue

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

void __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke()
{
  v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

  id v1 = [MEMORY[0x263F22850] sharedInstance];
  [v1 addHandler:&__block_literal_global_321 forBundleName:@"SleepModeControlCenterButton"];
}

uint64_t __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"ControlCenterUIKit (ControlCenter)"];
  [v2 setOverrideProcessName:@"ControlCenterUIKit (ControlCenter)"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CCUIButtonModuleViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIToggleViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIMenuModuleViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIAppLauncherViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUILabeledRoundButtonViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIMenuModuleItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIButtonModuleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIBaseSliderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIContinuousSliderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUISteppedSliderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUILabeledRoundButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIRoundButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIMenuModuleStackViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIControlTemplateViewAccessibility" canInteractWithTargetClass:1];
}

void __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_323 withPreValidationHandler:&__block_literal_global_328 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_333];
}

uint64_t __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"ControlCenterUIKit (SleepModule)"];
  [v2 setOverrideProcessName:@"ControlCenterUIKit (SleepModule)"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

@end