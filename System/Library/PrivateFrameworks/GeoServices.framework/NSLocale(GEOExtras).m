@interface NSLocale(GEOExtras)
- (id)_geo_languageAndLocale;
@end

@implementation NSLocale(GEOExtras)

- (id)_geo_languageAndLocale
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = [MEMORY[0x1E4F1CA20] systemLanguages];
  uint64_t v4 = [v2 mostPreferredLanguageOf:v3 forUsage:1 options:0];

  if (v4) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = &stru_1ED51F370;
  }
  v6 = NSString;
  v7 = [a1 localeIdentifier];
  v8 = [v6 stringWithFormat:@"%@:%@", v5, v7];

  return v8;
}

@end