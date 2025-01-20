@interface StocksAssistantStockListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation StocksAssistantStockListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StocksAssistantStockListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(StocksAssistantStockListCellAccessibility *)self safeValueForKey:@"_companyNameLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(StocksAssistantStockListCellAccessibility *)self safeValueForKey:@"_tickerLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [(StocksAssistantStockListCellAccessibility *)self safeValueForKey:@"_attributeTitle"];
  v8 = [v7 accessibilityLabel];

  v9 = [(StocksAssistantStockListCellAccessibility *)self safeValueForKey:@"_attributeValue"];
  v10 = [v9 accessibilityLabel];

  if ([v8 length] && objc_msgSend(v10, "length"))
  {
    v11 = __UIAXStringForVariables();
  }
  else
  {
    v11 = 0;
  }
  v12 = __UIAXStringForVariables();

  return v12;
}

- (id)accessibilityValue
{
  v2 = [(StocksAssistantStockListCellAccessibility *)self safeValueForKey:@"stock"];
  if ([v2 safeBoolForKey:@"changeIsNegative"]) {
    v3 = @"stock.down";
  }
  else {
    v3 = @"stock.up";
  }
  v4 = accessibilityLocalizedString(v3);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v16 = v2;
  AXPerformSafeBlock();
  id v5 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v14 = MEMORY[0x263EF8330];
  id v15 = v16;
  AXPerformSafeBlock();
  id v6 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  v7 = objc_msgSend(NSString, "stringWithFormat:", v4, v5, v6, v14, 3221225472, __63__StocksAssistantStockListCellAccessibility_accessibilityValue__block_invoke_2, &unk_26515ABC0);
  v8 = NSString;
  v9 = accessibilityLocalizedString(@"stock.price");
  v10 = [v15 safeValueForKey:@"formattedPrice"];

  v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

  v12 = __UIAXStringForVariables();

  return v12;
}

uint64_t __63__StocksAssistantStockListCellAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) formattedChangePercent:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __63__StocksAssistantStockListCellAccessibility_accessibilityValue__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) formattedChangePercent:1];

  return MEMORY[0x270F9A758]();
}

@end