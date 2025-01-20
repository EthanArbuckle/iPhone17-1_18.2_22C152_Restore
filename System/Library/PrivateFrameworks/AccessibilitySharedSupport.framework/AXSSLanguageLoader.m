@interface AXSSLanguageLoader
+ (id)_characterSetForRanges:(id)a3;
+ (id)loadLanguages;
@end

@implementation AXSSLanguageLoader

+ (id)loadLanguages
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AXSSLanguageLoader_loadLanguages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (loadLanguages_onceToken != -1) {
    dispatch_once(&loadLanguages_onceToken, block);
  }
  v2 = (void *)[(id)loadLanguages_langMaps copy];

  return v2;
}

void __35__AXSSLanguageLoader_loadLanguages__block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = (void *)loadLanguages_langMaps;
  loadLanguages_langMaps = v2;

  uint64_t v39 = a1;
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 pathForResource:@"SynthesizerLanguageMap" ofType:@"plist"];

  v27 = (void *)v5;
  [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v26 = long long v50 = 0u;
  id obj = [v26 objectForKeyedSubscript:@"languageMaps"];
  uint64_t v30 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v48;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v48 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v6;
        v7 = *(void **)(*((void *)&v47 + 1) + 8 * v6);
        v36 = [v7 objectForKeyedSubscript:@"languageID"];
        v35 = [v7 objectForKeyedSubscript:@"alternateLanguageIDs"];
        v34 = [v7 objectForKeyedSubscript:@"ambiguousWithLanguages"];
        v8 = [v7 objectForKeyedSubscript:@"isAmbiguous"];
        unsigned int v33 = [v8 BOOLValue];

        v9 = [v7 objectForKeyedSubscript:@"isWestern"];
        unsigned int v32 = [v9 BOOLValue];

        v10 = [v7 objectForKeyedSubscript:@"isRTL"];
        unsigned int v31 = [v10 BOOLValue];

        v41 = [MEMORY[0x1E4F1CA48] array];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v38 = [v7 objectForKeyedSubscript:@"localeLanguageMaps"];
        uint64_t v42 = [v38 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v42)
        {
          uint64_t v40 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v44 != v40) {
                objc_enumerationMutation(v38);
              }
              v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              v13 = [v12 objectForKeyedSubscript:@"localeID"];
              v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v13];
              v15 = [v12 objectForKeyedSubscript:@"voiceName"];
              v16 = [v12 objectForKeyedSubscript:@"languageID"];
              v17 = [v12 objectForKeyedSubscript:@"speakableCharacterRanges"];
              v18 = [*(id *)(v39 + 32) _characterSetForRanges:v17];
              v19 = [v12 objectForKeyedSubscript:@"supplementaryCharacterRanges"];

              v20 = [*(id *)(v39 + 32) _characterSetForRanges:v19];
              [v18 formUnionWithCharacterSet:v20];
              v21 = *(void **)(v39 + 32);
              v22 = [v12 objectForKeyedSubscript:@"secondaryLanguageRange"];
              v23 = [v21 _characterSetForRanges:v22];

              v24 = [[AXSSDialectMap alloc] initWithLocale:v14 voiceName:v15 specificLanguageID:v16 voiceIdentifier:0 speakableCharacters:v18 secondaryLanguageRange:v23];
              [v41 addObject:v24];
            }
            uint64_t v42 = [v38 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v42);
        }

        v25 = [[AXSSLanguageMap alloc] initWithLanguageID:v36 isWestern:v32 isAmbiguous:v33 isRTL:v31 dialects:v41 alternateLanguageIDs:v35 associatedAmbiguousLanguages:v34];
        [(id)loadLanguages_langMaps addObject:v25];

        uint64_t v6 = v37 + 1;
      }
      while (v37 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v30);
  }
}

+ (id)_characterSetForRanges:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  if ([v3 length])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v15 = v3;
    id obj = [v3 componentsSeparatedByString:@" "];
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"-"];
          v10 = [v9 objectAtIndex:0];
          uint64_t v11 = [v10 integerValue];
          v12 = [v9 objectAtIndex:1];
          uint64_t v13 = [v12 integerValue];

          objc_msgSend(v4, "addCharactersInRange:", v11, v13);
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    id v3 = v15;
  }

  return v4;
}

@end