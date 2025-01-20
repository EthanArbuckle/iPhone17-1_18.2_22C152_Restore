@interface NSString(AFPreferences)
- (uint64_t)_afpreferences_isLanguageCodePrefix;
- (uint64_t)_afpreferences_languageCodePrefix;
@end

@implementation NSString(AFPreferences)

- (uint64_t)_afpreferences_languageCodePrefix
{
  uint64_t v2 = [a1 rangeOfString:@"-"];
  return [a1 substringToIndex:v2];
}

- (uint64_t)_afpreferences_isLanguageCodePrefix
{
  return [a1 containsString:@"-"] ^ 1;
}

@end