@interface AXAdLibGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAdLibGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_281];

    _Failover = [objc_allocWithZone((Class)AXAdLibGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __44__AXAdLibGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __44__AXAdLibGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AdLib"];
  [v2 setOverrideProcessName:@"AdLib"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

uint64_t __44__AXAdLibGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"ADBannerViewAccessibility" canInteractWithTargetClass:1];
}

@end