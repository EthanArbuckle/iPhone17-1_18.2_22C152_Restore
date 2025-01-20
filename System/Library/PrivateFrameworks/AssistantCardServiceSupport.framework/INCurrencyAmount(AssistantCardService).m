@interface INCurrencyAmount(AssistantCardService)
+ (id)_acs_currencySymbolForCode:()AssistantCardService;
+ (id)_acs_localeForCode:()AssistantCardService;
- (id)_acs_currencySymbol;
- (id)_acs_formattedStringIncludeSymbol:()AssistantCardService;
- (uint64_t)acs_formattedAmountString;
@end

@implementation INCurrencyAmount(AssistantCardService)

- (uint64_t)acs_formattedAmountString
{
  return objc_msgSend(a1, "_acs_formattedStringIncludeSymbol:", 1);
}

- (id)_acs_formattedStringIncludeSymbol:()AssistantCardService
{
  uint64_t v5 = [a1 amount];
  if (v5
    && (v6 = (void *)v5,
        [a1 currencyCode],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    if (_acs_formattedStringIncludeSymbol__once != -1) {
      dispatch_once(&_acs_formattedStringIncludeSymbol__once, &__block_literal_global);
    }
    v8 = [a1 currencyCode];
    [(id)_acs_formattedStringIncludeSymbol__sCurrencyFormatter setCurrencyCode:v8];

    if (a3) {
      v9 = 0;
    }
    else {
      v9 = &stru_26D3AA9F8;
    }
    [(id)_acs_formattedStringIncludeSymbol__sCurrencyFormatter setCurrencySymbol:v9];
    v11 = (void *)_acs_formattedStringIncludeSymbol__sCurrencyFormatter;
    v12 = [a1 amount];
    v10 = [v11 stringFromNumber:v12];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_acs_currencySymbol
{
  v1 = (void *)MEMORY[0x263F0FA48];
  v2 = [a1 currencyCode];
  v3 = objc_msgSend(v1, "_acs_currencySymbolForCode:", v2);

  return v3;
}

+ (id)_acs_localeForCode:()AssistantCardService
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

+ (id)_acs_currencySymbolForCode:()AssistantCardService
{
  id v4 = (objc_class *)MEMORY[0x263F08A30];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = objc_msgSend(a1, "_acs_localeForCode:", v5);

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