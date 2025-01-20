@interface AXAudioConferenceControlCenterModuleGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAudioConferenceControlCenterModuleGlue

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

void __73__AXAudioConferenceControlCenterModuleGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];
}

uint64_t __73__AXAudioConferenceControlCenterModuleGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __73__AXAudioConferenceControlCenterModuleGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AudioConferenceControlCenter Module (ControlCenter)"];
  [v2 setOverrideProcessName:@"AudioConferenceControlCenter Module (ControlCenter)"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __73__AXAudioConferenceControlCenterModuleGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F811B8];
  id v4 = a2;
  v3 = [v2 sharedInstance];
  [v3 setNeedsLoadAccessibilityInformation];

  [v4 installSafeCategory:@"AudioConferenceControlCenterModuleEffectControlAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"AudioSettingsViewAccessibility" canInteractWithTargetClass:1];
}

@end