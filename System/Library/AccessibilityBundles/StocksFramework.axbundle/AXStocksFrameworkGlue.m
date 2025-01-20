@interface AXStocksFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXStocksFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_292 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_301];

    _Failover = [objc_allocWithZone((Class)AXStocksFrameworkGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __54__AXStocksFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __54__AXStocksFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Stocks Framework AX Bundle"];
  [v2 setOverrideProcessName:@"Stocks Framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __54__AXStocksFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"StockAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"StockGraphViewAccessibility" canInteractWithTargetClass:1];
}

@end