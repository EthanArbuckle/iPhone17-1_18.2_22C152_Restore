@interface NSLocale
@end

@implementation NSLocale

uint64_t __51__NSLocale_LTLocaleIdentifier__lt_preferredLocales__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263EFF960], "lt_localeWithLTIdentifier:", a2);
}

uint64_t __85__NSLocale_LTLocaleIdentifier__lt_bestMatchForPreferredLocales_fromSupportedLocales___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _ltLocaleIdentifier];
}

uint64_t __85__NSLocale_LTLocaleIdentifier__lt_bestMatchForPreferredLocales_fromSupportedLocales___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _ltLocaleIdentifier];
}

@end