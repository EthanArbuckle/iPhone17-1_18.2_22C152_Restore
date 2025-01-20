@interface NSLocale
@end

@implementation NSLocale

void __63__NSLocale_IconServicesAdditions___IS_currentLanguageDirection__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CA20];
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v1 = [v2 languageCode];
  _IS_currentLanguageDirection_direction = [v0 characterDirectionForLanguage:v1];
}

@end