@interface AXAirportSettings
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAirportSettings

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    uint64_t v2 = [objc_allocWithZone((Class)AXAirportSettings) init];
    v3 = (void *)_Failover;
    _Failover = v2;

    id v4 = [MEMORY[0x263F229D0] sharedInstance];
    [v4 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_278 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_287];
  }
}

uint64_t __50__AXAirportSettings_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __50__AXAirportSettings_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Airport Settings AX Bundle"];
  [v2 setOverrideProcessName:@"AirportSettings"];

  return MEMORY[0x270F0A270]();
}

uint64_t __50__AXAirportSettings_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"APNetworksControllerAccessibility" canInteractWithTargetClass:1];
}

@end