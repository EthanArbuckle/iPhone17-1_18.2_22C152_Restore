@interface NSLocale(CalClassAdditions)
- (uint64_t)CalLanguageIsSimplifiedChinese;
- (uint64_t)CalPrefersFullMonthDisplayNames;
- (uint64_t)CalRegionIsChina;
- (uint64_t)CalShouldUseAbbreviatedDayNames;
- (uint64_t)CalUnableToAbbreviateMonthNames;
- (uint64_t)CalUsesCelsius;
- (uint64_t)_calendarIsIslamic;
- (uint64_t)_languageIsArabic;
@end

@implementation NSLocale(CalClassAdditions)

- (uint64_t)CalPrefersFullMonthDisplayNames
{
  uint64_t result = [a1 _languageIsArabic];
  if (result)
  {
    return [a1 _calendarIsIslamic];
  }
  return result;
}

- (uint64_t)_languageIsArabic
{
  v1 = [a1 languageCode];
  uint64_t v2 = [v1 isEqualToString:@"ar"];

  return v2;
}

- (uint64_t)_calendarIsIslamic
{
  v1 = [a1 objectForKey:*MEMORY[0x1E4F1C3E0]];
  uint64_t v2 = [v1 calendarIdentifier];
  uint64_t v3 = [v2 containsString:@"islamic"];

  return v3;
}

- (uint64_t)CalUnableToAbbreviateMonthNames
{
  v1 = [a1 languageCode];
  uint64_t v2 = [v1 isEqualToString:@"fi"];

  return v2;
}

- (uint64_t)CalShouldUseAbbreviatedDayNames
{
  return [a1 _languageIsArabic] ^ 1;
}

- (uint64_t)CalRegionIsChina
{
  v1 = [a1 countryCode];
  uint64_t v2 = [v1 isEqualToString:@"CN"];

  return v2;
}

- (uint64_t)CalLanguageIsSimplifiedChinese
{
  v0 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v1 = [v0 firstObject];

  uint64_t v2 = [v1 hasPrefix:@"zh-Hans"];
  return v2;
}

- (uint64_t)CalUsesCelsius
{
  v1 = [a1 objectForKey:*MEMORY[0x1E4F1C478]];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F1C480]];

  return v2;
}

@end