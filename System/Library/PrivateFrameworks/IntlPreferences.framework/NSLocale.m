@interface NSLocale
@end

@implementation NSLocale

uint64_t __68__NSLocale_IntlPreferencesAdditions__supportedCJLanguageIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:a2];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  if ([v3 isEqualToString:@"zh"]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isEqualToString:@"ja"];
  }

  return v4;
}

void __59__NSLocale_IntlPreferencesAdditions__renderableUILanguages__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C978];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v4 URLForResource:@"RenderableUILanguages" withExtension:@"plist"];
  uint64_t v2 = [v0 arrayWithContentsOfURL:v1];
  v3 = (void *)renderableUILanguages___renderableLanguages;
  renderableUILanguages___renderableLanguages = v2;
}

void __63__NSLocale_IntlPreferencesAdditions__renderableLocaleLanguages__block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA20] availableLocaleIdentifiers];
  v1 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = objc_msgSend(MEMORY[0x1E4F1CA20], "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v6), (void)v12);
        [v1 addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  v8 = (void *)MEMORY[0x1E4F1CA20];
  v9 = [v1 allObjects];
  uint64_t v10 = [v8 renderableLanguagesFromList:v9];
  v11 = (void *)renderableLocaleLanguages___renderableLanguages;
  renderableLocaleLanguages___renderableLanguages = v10;
}

uint64_t __66__NSLocale_IntlPreferencesAdditions__renderableLanguagesFromList___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[IntlUtility sharedIntlUtility];
  uint64_t v4 = [v3 canRenderLanguage:v2];

  return v4;
}

void __86__NSLocale_IntlPreferencesAdditions__archivedPreferencesWithHashesForBundleIDs_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _hashesFromAppPreferences:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __59__NSLocale_IntlPreferencesAdditions__selectableScriptCodes__block_invoke()
{
  v0 = (void *)selectableScriptCodes_selectableScriptCodes;
  selectableScriptCodes_selectableScriptCodes = (uint64_t)&unk_1F19D8A90;
}

@end