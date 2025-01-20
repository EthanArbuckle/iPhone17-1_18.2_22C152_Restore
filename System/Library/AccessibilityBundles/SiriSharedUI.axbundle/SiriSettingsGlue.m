@interface SiriSettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation SiriSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken_0 != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken_0, &__block_literal_global_0);
  }
}

void __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268_0 withPreValidationHandler:&__block_literal_global_299 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_308];

  id v1 = [MEMORY[0x263F229D0] sharedInstance];
  [v1 installSafeCategories:&__block_literal_global_313 afterDelay:@"Siri Settings AX Bundle" validationTargetName:@"Siri View Service" overrideProcessName:0.1];
}

uint64_t __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"ACSettingsSliderUIController" hasInstanceVariable:@"_setting" withType:"ACSettingsSliderSetting"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSettingsBasicSetting", @"name", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSettingsSwitchView", @"title", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSettingsSwitchView", @"switchControl", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSettingsSliderView", @"slider", "@", 0);

  return 1;
}

uint64_t __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Siri Settings AX Bundle"];
  [v2 setOverrideProcessName:@"Siri Settings"];

  return MEMORY[0x270F0A270]();
}

uint64_t __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"ACSettingsSliderViewAccessibility" canInteractWithTargetClass:1];
}

uint64_t __49__SiriSettingsGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"ACSettingsSwitchViewAccessibility" canInteractWithTargetClass:1];
}

@end