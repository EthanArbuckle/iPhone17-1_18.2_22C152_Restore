@interface INPriceRange(AssistantCardService)
+ (id)_currencySymbolForCode:()AssistantCardService;
+ (id)_localeForCode:()AssistantCardService;
- (id)acs_formattedRangeString;
@end

@implementation INPriceRange(AssistantCardService)

- (id)acs_formattedRangeString
{
  v2 = objc_opt_class();
  v3 = [a1 currencyCode];
  v4 = [v2 _currencySymbolForCode:v3];

  if (acs_formattedRangeString_once != -1) {
    dispatch_once(&acs_formattedRangeString_once, &__block_literal_global_0);
  }
  v5 = [a1 currencyCode];
  [(id)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter setCurrencyCode:v5];

  [(id)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter setCurrencySymbol:v4];
  v6 = [a1 currencyCode];
  [(id)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter setCurrencyCode:v6];

  [(id)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter setCurrencySymbol:0];
  v7 = (void *)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter;
  v8 = [a1 minimumPrice];
  v9 = [v7 stringFromNumber:v8];

  v10 = (void *)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter;
  v11 = [a1 maximumPrice];
  v12 = [v10 stringFromNumber:v11];

  v13 = [NSString stringWithFormat:@"%@-%@", v9, v12];

  return v13;
}

+ (id)_localeForCode:()AssistantCardService
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [MEMORY[0x263EFF960] availableLocaleIdentifiers];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = *MEMORY[0x263EFF4D8];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x263EFF960]);
        v12 = objc_msgSend(v11, "initWithLocaleIdentifier:", v10, (void)v15);
        v13 = [v12 objectForKey:v8];
        if ([v13 isEqualToString:v3])
        {

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_currencySymbolForCode:()AssistantCardService
{
  id v4 = (objc_class *)MEMORY[0x263F08A30];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [a1 _localeForCode:v5];

  if (v7)
  {
    [v6 setLocale:v7];
    [v6 setNumberStyle:2];
    uint64_t v8 = [v6 currencySymbol];
    if ((unint64_t)[v8 length] >= 2)
    {
      uint64_t v9 = [v8 substringToIndex:1];

      uint64_t v8 = (void *)v9;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end