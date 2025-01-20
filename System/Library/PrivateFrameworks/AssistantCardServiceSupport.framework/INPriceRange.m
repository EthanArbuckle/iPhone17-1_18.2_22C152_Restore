@interface INPriceRange
@end

@implementation INPriceRange

uint64_t __62__INPriceRange_AssistantCardService__acs_formattedRangeString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter;
  acs_formattedRangeString_minimumPriceRangeCurrencyFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter setLocale:v2];

  [(id)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter setNumberStyle:2];
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  v4 = (void *)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter;
  acs_formattedRangeString_maximumPriceRangeCurrencyFormatter = (uint64_t)v3;

  v5 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter setLocale:v5];

  v6 = (void *)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter;
  return [v6 setNumberStyle:2];
}

@end