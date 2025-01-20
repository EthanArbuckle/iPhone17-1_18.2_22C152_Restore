@interface AXVictoriaSettings
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXVictoriaSettings

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    uint64_t v2 = [objc_allocWithZone((Class)AXVictoriaSettings) init];
    v3 = (void *)_Failover;
    _Failover = v2;

    id v4 = [MEMORY[0x263F229D0] sharedInstance];
    [v4 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_286 postValidationHandler:&__block_literal_global_292 safeCategoryInstallationHandler:&__block_literal_global_295];
  }
}

uint64_t __51__AXVictoriaSettings_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"NikeSettingsController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"NikeSettingsController", @"showPowerSongPicker:", "v", "@", 0);

  return 1;
}

uint64_t __51__AXVictoriaSettings_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"Nike+Settings"];
  [v2 setValidationTargetName:@"Nike+Settings"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __51__AXVictoriaSettings_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"NikeSettingsControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NikeSettingsWeightControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NikeUITableViewAccessibility" canInteractWithTargetClass:1];
}

@end