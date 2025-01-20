@interface NSLocale
@end

@implementation NSLocale

void __60__NSLocale_InternationalSupportExtensions___deviceLanguages__block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(v0, "localizations", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v10 + 1) + 8 * v6) stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
        if (v7) {
          [v1 addObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v8 = [v1 array];
  v9 = (void *)_deviceLanguages___deviceLanguages;
  _deviceLanguages___deviceLanguages = v8;
}

void __63__NSLocale_InternationalSupportExtensions__baseSystemLanguages__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "systemLanguages", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(a1 + 32) baseLanguageFromLanguage:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [v2 array];
  long long v10 = (void *)baseSystemLanguages___baseSystemLanguages;
  baseSystemLanguages___baseSystemLanguages = v9;
}

void __60__NSLocale_InternationalSupportExtensions__supportedRegions__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CA80];
  v1 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
  v2 = [v0 setWithArray:v1];

  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3FC55F0];
  [v2 minusSet:v3];

  uint64_t v4 = (void *)supportedRegions___supportedRegions;
  supportedRegions___supportedRegions = (uint64_t)v2;
}

void __72__NSLocale_InternationalSupportExtensions__relatedLanguagesForLanguage___block_invoke()
{
  v0 = (void *)relatedLanguagesForLanguage____relatedLanguages;
  relatedLanguagesForLanguage____relatedLanguages = (uint64_t)&unk_1F3FC3AC8;
}

void __68__NSLocale_InternationalSupportExtensions__availableSpokenLanguages__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA20] availableLocaleIdentifiers];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * v8), (void)v14);
        long long v10 = [v9 languageIdentifier];

        long long v11 = [*(id *)(a1 + 32) spokenLanguagesForLanguage:v10];
        [v3 addObjectsFromArray:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  long long v13 = (void *)availableSpokenLanguages___availableSpokenLanguages;
  availableSpokenLanguages___availableSpokenLanguages = v12;
}

id __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  if (a4 == 2)
  {
    uint64_t v8 = @"popular.";
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_7;
    }
    uint64_t v8 = @"minimum.";
  }
  uint64_t v9 = [(__CFString *)v8 stringByAppendingString:v7];
  if (v9)
  {
    long long v10 = (void *)v9;
    long long v11 = [v6 objectForKeyedSubscript:v9];

    goto LABEL_8;
  }
LABEL_7:
  long long v11 = 0;
LABEL_8:

  return v11;
}

uint64_t __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

@end