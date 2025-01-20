@interface ReducedLanguageIdentifierForKeyboardLanguage
@end

@implementation ReducedLanguageIdentifierForKeyboardLanguage

uint64_t ___ReducedLanguageIdentifierForKeyboardLanguage_block_invoke()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _ReducedLanguageIdentifierForKeyboardLanguage___languageCounts = (uint64_t)objc_alloc_init(MEMORY[0x263F08760]);
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  SupportedLanguages = (void *)UIKeyboardGetSupportedLanguages();
  uint64_t result = [SupportedLanguages countByEnumeratingWithState:&v5 objects:v9 count:16];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)v6;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v6 != v3) {
          objc_enumerationMutation(SupportedLanguages);
        }
        objc_msgSend((id)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts, "addObject:", objc_msgSend(MEMORY[0x263EFF960], "baseLanguageFromLanguage:", *(void *)(*((void *)&v5 + 1) + 8 * v4++), (void)v5));
      }
      while (v2 != v4);
      uint64_t result = [SupportedLanguages countByEnumeratingWithState:&v5 objects:v9 count:16];
      uint64_t v2 = result;
    }
    while (result);
  }
  return result;
}

@end