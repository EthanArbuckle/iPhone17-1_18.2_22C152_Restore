@interface WFCurrencyAmountContentItem
+ (id)coercions;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)decimalNumberCoercionHandler;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)numberCoercionHandler;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)quantityCoercionHandler;
+ (id)stringCoercionHandler;
- (BOOL)getListSubtitle:(id)a3;
- (INCurrencyAmount)currencyAmount;
@end

@implementation WFCurrencyAmountContentItem

+ (id)quantityCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_52];
}

id __54__WFCurrencyAmountContentItem_quantityCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 currencyAmount];
  v3 = [WFQuantityValue alloc];
  v4 = [v2 amount];
  v5 = [v2 currencyCode];
  v6 = [(WFQuantityValue *)v3 initWithMagnitude:v4 unitString:v5];

  v7 = +[WFObjectRepresentation object:v6];

  return v7;
}

+ (id)decimalNumberCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_50];
}

id __59__WFCurrencyAmountContentItem_decimalNumberCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 currencyAmount];
  v3 = [v2 amount];
  v4 = +[WFObjectRepresentation object:v3];

  return v4;
}

+ (id)numberCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_48];
}

id __52__WFCurrencyAmountContentItem_numberCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 currencyAmount];
  v4 = [v3 amount];
  [v4 doubleValue];
  v5 = objc_msgSend(v2, "numberWithDouble:");
  v6 = +[WFObjectRepresentation object:v5];

  return v6;
}

+ (id)stringCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_15953];
}

id __52__WFCurrencyAmountContentItem_stringCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 currencyAmount];
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v3 setNumberStyle:2];
  v4 = [v2 currencyCode];
  [v3 setCurrencyCode:v4];

  v5 = [v2 amount];
  v6 = [v3 stringFromNumber:v5];
  v7 = +[WFObjectRepresentation object:v6];

  return v7;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Currency Amounts");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Currency Amounts", @"Currency Amounts");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Currency Amount", @"Currency Amount");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Scripting";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)coercions
{
  v17[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_class();
  v4 = [a1 stringCoercionHandler];
  v5 = +[WFCoercion coercionToClass:v3 handler:v4];
  v17[0] = v5;
  uint64_t v6 = objc_opt_class();
  v7 = [a1 numberCoercionHandler];
  v8 = +[WFCoercion coercionToClass:v6 handler:v7];
  v17[1] = v8;
  uint64_t v9 = objc_opt_class();
  v10 = [a1 decimalNumberCoercionHandler];
  v11 = +[WFCoercion coercionToClass:v9 handler:v10];
  v17[2] = v11;
  uint64_t v12 = objc_opt_class();
  v13 = [a1 quantityCoercionHandler];
  v14 = +[WFCoercion coercionToClass:v12 handler:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  uint64_t v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedContentPropertyNameMarker(@"Currency Code");
  uint64_t v3 = +[WFContentPropertyBuilder keyPath:@"currencyAmount.currencyCode" name:v2 class:objc_opt_class()];
  v8[0] = v3;
  v4 = WFLocalizedContentPropertyNameMarker(@"Currency Amount");
  v5 = +[WFContentPropertyBuilder keyPath:@"currencyAmount.amount" name:v4 class:objc_opt_class()];
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  return v6;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    v5 = [(WFCurrencyAmountContentItem *)self currencyAmount];
    id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v6 setNumberStyle:2];
    v7 = [v5 currencyCode];
    [v6 setCurrencyCode:v7];

    v8 = [v5 amount];
    uint64_t v9 = [v6 stringFromNumber:v8];
    v4[2](v4, v9);
  }
  return 1;
}

- (INCurrencyAmount)currencyAmount
{
  uint64_t v3 = objc_opt_class();
  return (INCurrencyAmount *)[(WFContentItem *)self objectForClass:v3];
}

@end