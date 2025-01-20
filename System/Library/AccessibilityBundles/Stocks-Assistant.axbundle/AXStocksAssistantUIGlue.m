@interface AXStocksAssistantUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXStocksAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_306 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_315];

    _Failover = [objc_allocWithZone((Class)AXStocksAssistantUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __56__AXStocksAssistantUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"StocksAssistantStockListCell"];
  [v2 validateClass:@"StocksAssistantStockDetailCell"];
  [v2 validateClass:@"StocksAssistantStockListCell" hasInstanceVariable:@"_companyNameLabel" withType:"UILabel"];
  [v2 validateClass:@"StocksAssistantStockListCell" hasInstanceVariable:@"_tickerLabel" withType:"UILabel"];
  [v2 validateClass:@"StocksAssistantStockListCell" hasInstanceVariable:@"_attributeTitle" withType:"UILabel"];
  [v2 validateClass:@"StocksAssistantStockListCell" hasInstanceVariable:@"_attributeValue" withType:"UILabel"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"StocksAssistantStockCell", @"stock", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"changeIsNegative", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"formattedChangePercent:", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Stock", @"formattedPrice", "@", 0);

  return 1;
}

uint64_t __56__AXStocksAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Stocks Assistant UI AX Bundle"];
  [v2 setOverrideProcessName:@"Stocks Assistant UI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __56__AXStocksAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"StocksAssistantStockListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"StocksAssistantChartViewAccessibility" canInteractWithTargetClass:1];
}

@end