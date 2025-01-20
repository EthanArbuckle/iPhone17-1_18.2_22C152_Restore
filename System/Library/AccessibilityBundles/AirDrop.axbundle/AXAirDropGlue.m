@interface AXAirDropGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAirDropGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_273];

    _Failover = objc_alloc_init(AXAirDropGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __46__AXAirDropGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __46__AXAirDropGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AirDropExtension"];
  [v2 setOverrideProcessName:@"AirDropExtension"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __46__AXAirDropGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AirDropBrowserViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AirDropNoContentViewAccessibility" canInteractWithTargetClass:1];
}

@end