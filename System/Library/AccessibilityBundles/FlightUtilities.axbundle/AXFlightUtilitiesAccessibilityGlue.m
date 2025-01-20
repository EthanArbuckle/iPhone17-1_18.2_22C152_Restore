@interface AXFlightUtilitiesAccessibilityGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXFlightUtilitiesAccessibilityGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXFlightUtilitiesAccessibilityGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __67__AXFlightUtilitiesAccessibilityGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __67__AXFlightUtilitiesAccessibilityGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Flight Utilities"];
  [v2 setOverrideProcessName:@"Flight Utilities framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __67__AXFlightUtilitiesAccessibilityGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"FUFlightViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FUPlaneTrackerAnnotationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FUFlightInfoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FULoadingViewAccessibility" canInteractWithTargetClass:1];
}

@end