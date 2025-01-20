@interface INCurrencyAmount
@end

@implementation INCurrencyAmount

uint64_t __76__INCurrencyAmount_AssistantCardService___acs_formattedStringIncludeSymbol___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)_acs_formattedStringIncludeSymbol__sCurrencyFormatter;
  _acs_formattedStringIncludeSymbol__sCurrencyFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)_acs_formattedStringIncludeSymbol__sCurrencyFormatter setLocale:v2];

  v3 = (void *)_acs_formattedStringIncludeSymbol__sCurrencyFormatter;
  return [v3 setNumberStyle:2];
}

@end