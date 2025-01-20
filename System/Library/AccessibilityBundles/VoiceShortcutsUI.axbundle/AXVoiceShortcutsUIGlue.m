@interface AXVoiceShortcutsUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXVoiceShortcutsUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXVoiceShortcutsUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __55__AXVoiceShortcutsUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXVoiceShortcutsUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"VoiceShortcutsUI AX"];
  [v2 setOverrideProcessName:@"VoiceShortcutsUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

@end