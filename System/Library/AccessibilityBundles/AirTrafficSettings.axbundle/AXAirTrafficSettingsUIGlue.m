@interface AXAirTrafficSettingsUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAirTrafficSettingsUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_288 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_297];

    _Failover = [objc_allocWithZone((Class)AXAirTrafficSettingsUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __59__AXAirTrafficSettingsUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SyncFooterView" isKindOfClass:@"UIView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SyncFooterView", @"updateProgress: dataSource:", "B", "@", "@", 0);

  return 1;
}

uint64_t __59__AXAirTrafficSettingsUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AirTraffic AX Bundle"];
  [v2 setOverrideProcessName:@"AirTraffic"];

  return MEMORY[0x270F0A270]();
}

uint64_t __59__AXAirTrafficSettingsUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"SyncFooterViewAccessibility" canInteractWithTargetClass:1];
}

@end