@interface AXSSLanguageManager
+ (id)commonPunctuationCharacters;
+ (id)shared;
+ (id)stringByReplacingFatWidthCharactersWithBasicCharacters:(id)a3;
- (AXSSDialectMap)dialectForCurrentLocale;
- (AXSSDialectMap)dialectForCurrentRegion;
- (AXSSDialectMap)dialectForSystemLanguage;
- (AXSSLanguageManager)init;
- (BOOL)isCharacterCommon:(unsigned __int16)a3;
- (BOOL)isCommonGreekCharacter:(unsigned __int16)a3;
- (BOOL)isStringComposedByCommonCharacters:(id)a3;
- (NSArray)languageMaps;
- (NSCharacterSet)commonCharacters;
- (NSCharacterSet)commonGreekCharacters;
- (NSLocale)userLocale;
- (NSString)systemLanguageID;
- (id)_preferredLanguage;
- (id)description;
- (id)dialectForLanguageID:(id)a3;
- (id)dialectForSpeechSynthesisVoiceID:(id)a3;
- (id)dialectThatCanSpeakCharacter:(unsigned __int16)a3;
- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3;
- (id)dialectsThatCanSpeakString:(id)a3;
- (void)_handleUserLocaleDidChange:(id)a3;
- (void)setCommonCharacters:(id)a3;
- (void)setCommonGreekCharacters:(id)a3;
- (void)setDialectForCurrentLocale:(id)a3;
- (void)setDialectForCurrentRegion:(id)a3;
- (void)setDialectForSystemLanguage:(id)a3;
- (void)setLanguageMaps:(id)a3;
- (void)setUserLocale:(id)a3;
- (void)updateCachedDialects;
@end

@implementation AXSSLanguageManager

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)shared__shared;

  return v2;
}

uint64_t __29__AXSSLanguageManager_shared__block_invoke()
{
  shared__shared = objc_alloc_init(AXSSLanguageManager);

  return MEMORY[0x1F41817F8]();
}

+ (id)commonPunctuationCharacters
{
  if (commonPunctuationCharacters_onceToken != -1) {
    dispatch_once(&commonPunctuationCharacters_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)commonPunctuationCharacters_charSet;

  return v2;
}

uint64_t __50__AXSSLanguageManager_commonPunctuationCharacters__block_invoke()
{
  commonPunctuationCharacters_charSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"~!@#*$%&+|=(){}[]<>,./?:'_-\"\\""];;

  return MEMORY[0x1F41817F8]();
}

+ (id)stringByReplacingFatWidthCharactersWithBasicCharacters:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 65296, 75);
  uint64_t v5 = [v3 rangeOfCharacterFromSet:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v3;
  }
  else
  {
    uint64_t v7 = v5;
    uint64_t v8 = [v3 length];
    v9 = (void *)MEMORY[0x1E4F28E78];
    v10 = [v3 substringToIndex:v7];
    id v6 = [v9 stringWithString:v10];

    if (v7 >= v8)
    {
      uint64_t v11 = v7;
    }
    else
    {
      uint64_t v11 = v7;
      do
      {
        uint64_t v12 = [v3 characterAtIndex:v7];
        if ([v4 characterIsMember:v12])
        {
          uint64_t v13 = v7 - v11;
          if (v7 > v11)
          {
            v14 = objc_msgSend(v3, "substringWithRange:", v11, v13);
            [v6 appendString:v14];
          }
          objc_msgSend(v6, "appendFormat:", @"%C ", v13, (unsigned __int16)(v12 + 288));
          uint64_t v11 = ++v7;
        }
        else
        {
          ++v7;
        }
      }
      while (v7 != v8);
    }
    if (v8 - 1 > v11)
    {
      v15 = objc_msgSend(v3, "substringWithRange:", v11, v8 - 1 - v11);
      [v6 appendString:v15];
    }
  }

  return v6;
}

- (AXSSLanguageManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)AXSSLanguageManager;
  v2 = [(AXSSLanguageManager *)&v13 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(AXSSLanguageManager *)v2 setUserLocale:v3];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__handleUserLocaleDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    id v5 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    id v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    [v5 formUnionWithCharacterSet:v6];

    uint64_t v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    [v5 formUnionWithCharacterSet:v7];

    uint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789•■"];
    [v5 formUnionWithCharacterSet:v8];

    v9 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    [v5 formUnionWithCharacterSet:v9];

    [(AXSSLanguageManager *)v2 setCommonCharacters:v5];
    v10 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"αβγδεζηθικλμνξοπρσςτυφχψωΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ"];
    [(AXSSLanguageManager *)v2 setCommonGreekCharacters:v10];

    uint64_t v11 = v2;
  }

  return v2;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(AXSSLanguageManager *)self languageMaps];
  id v5 = objc_msgSend(v3, "stringWithFormat:", @"AXSSLanguageManager:<%p>. %lu lang maps", self, objc_msgSend(v4, "count"));

  return v5;
}

- (id)_preferredLanguage
{
  v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndex:0];
    v4 = AXSSLanguageConvertToCanonicalForm(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)systemLanguageID
{
  id v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if ([v3 count])
  {
    v4 = [v3 objectAtIndex:0];
    id v5 = AXSSLanguageCanonicalFormToGeneralLanguage(v4);
  }
  else
  {
    v4 = [(AXSSLanguageManager *)self userLocale];
    id v6 = [v4 objectForKey:*MEMORY[0x1E4F1C438]];
    id v5 = AXSSLanguageCanonicalFormToGeneralLanguage(v6);
  }

  return (NSString *)v5;
}

- (NSArray)languageMaps
{
  languageMaps = self->_languageMaps;
  if (!languageMaps)
  {
    v4 = +[AXSSLanguageLoader loadLanguages];
    id v5 = self->_languageMaps;
    self->_languageMaps = v4;

    languageMaps = self->_languageMaps;
  }

  return languageMaps;
}

- (AXSSDialectMap)dialectForSystemLanguage
{
  dialectForSystemLanguage = self->_dialectForSystemLanguage;
  if (!dialectForSystemLanguage)
  {
    [(AXSSLanguageManager *)self updateCachedDialects];
    dialectForSystemLanguage = self->_dialectForSystemLanguage;
  }

  return dialectForSystemLanguage;
}

- (void)setDialectForSystemLanguage:(id)a3
{
  id v5 = a3;
  dialectForSystemLanguage = self->_dialectForSystemLanguage;
  p_dialectForSystemLanguage = &self->_dialectForSystemLanguage;
  id v8 = v5;
  if (!-[AXSSDialectMap isEqual:](dialectForSystemLanguage, "isEqual:")) {
    objc_storeStrong((id *)p_dialectForSystemLanguage, a3);
  }
}

- (AXSSDialectMap)dialectForCurrentLocale
{
  dialectForCurrentLocale = self->_dialectForCurrentLocale;
  if (!dialectForCurrentLocale)
  {
    [(AXSSLanguageManager *)self updateCachedDialects];
    dialectForCurrentLocale = self->_dialectForCurrentLocale;
  }

  return dialectForCurrentLocale;
}

- (AXSSDialectMap)dialectForCurrentRegion
{
  dialectForCurrentRegion = self->_dialectForCurrentRegion;
  if (!dialectForCurrentRegion)
  {
    [(AXSSLanguageManager *)self updateCachedDialects];
    dialectForCurrentRegion = self->_dialectForCurrentRegion;
  }

  return dialectForCurrentRegion;
}

- (void)setDialectForCurrentLocale:(id)a3
{
  id v5 = a3;
  dialectForCurrentLocale = self->_dialectForCurrentLocale;
  p_dialectForCurrentLocale = &self->_dialectForCurrentLocale;
  id v8 = v5;
  if (!-[AXSSDialectMap isEqual:](dialectForCurrentLocale, "isEqual:")) {
    objc_storeStrong((id *)p_dialectForCurrentLocale, a3);
  }
}

- (void)setDialectForCurrentRegion:(id)a3
{
  id v5 = a3;
  dialectForCurrentRegion = self->_dialectForCurrentRegion;
  p_dialectForCurrentRegion = &self->_dialectForCurrentRegion;
  id v8 = v5;
  if (!-[AXSSDialectMap isEqual:](dialectForCurrentRegion, "isEqual:")) {
    objc_storeStrong((id *)p_dialectForCurrentRegion, a3);
  }
}

- (id)dialectForLanguageID:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if ([v4 hasPrefix:@"zh"])
    {
      id v6 = [v5 stringByReplacingOccurrencesOfString:@"Hant-" withString:&stru_1F0C5BA58];

      id v5 = [v6 stringByReplacingOccurrencesOfString:@"Hans-" withString:&stru_1F0C5BA58];
    }
    uint64_t v7 = [(AXSSLanguageManager *)self dialectForSystemLanguage];
    id v8 = [v7 specificLanguageID];
    int v9 = [v8 hasPrefix:v5];

    if (v9)
    {
      id v10 = v7;
    }
    else
    {
      uint64_t v11 = [(AXSSLanguageManager *)self dialectForCurrentLocale];
      uint64_t v12 = [v11 specificLanguageID];
      int v13 = [v12 hasPrefix:v5];

      if (v13)
      {
        id v10 = v11;
      }
      else
      {
        v14 = [(AXSSLanguageManager *)self dialectForCurrentRegion];
        v15 = [v14 specificLanguageID];
        int v16 = [v15 hasPrefix:v5];

        if (v16)
        {
          id v10 = v14;
        }
        else
        {
          v33 = v14;
          id v34 = (id)[v5 rangeOfString:@"-"];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          obuint64_t j = [(AXSSLanguageManager *)self languageMaps];
          uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v42;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v42 != v19) {
                  objc_enumerationMutation(obj);
                }
                v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                v22 = [v21 generalLanguageID];
                if ([v5 hasPrefix:v22])
                {

LABEL_22:
                  if (v34 != (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    long long v39 = 0u;
                    long long v40 = 0u;
                    long long v37 = 0u;
                    long long v38 = 0u;
                    id v35 = [v21 dialects];
                    uint64_t v25 = [v35 countByEnumeratingWithState:&v37 objects:v45 count:16];
                    if (v25)
                    {
                      uint64_t v26 = v25;
                      uint64_t v27 = *(void *)v38;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v26; ++j)
                        {
                          if (*(void *)v38 != v27) {
                            objc_enumerationMutation(v35);
                          }
                          v29 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                          v30 = [v29 specificLanguageID];
                          char v31 = [v30 isEqualToString:v5];

                          if (v31)
                          {
                            id v10 = v29;

                            goto LABEL_34;
                          }
                        }
                        uint64_t v26 = [v35 countByEnumeratingWithState:&v37 objects:v45 count:16];
                        if (v26) {
                          continue;
                        }
                        break;
                      }
                    }
                  }
                  id v10 = [v21 defaultDialect];
LABEL_34:

                  goto LABEL_35;
                }
                v23 = [v21 alternateLanguageIDs];
                int v24 = [v23 containsObject:v5];

                if (v24) {
                  goto LABEL_22;
                }
              }
              uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v10 = 0;
LABEL_35:
          v14 = v33;
        }
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)dialectForSpeechSynthesisVoiceID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = [(AXSSLanguageManager *)self languageMaps];
    uint64_t v22 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v22)
    {
      uint64_t v6 = *(void *)v30;
      int v24 = v5;
      uint64_t v21 = *(void *)v30;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v23 = v7;
          id v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          int v9 = objc_msgSend(v8, "dialects", v21);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v26 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                v15 = [v14 voiceIdentifier];
                if ([v15 hasPrefix:v4])
                {
                  int v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                  uint64_t v17 = [v14 speakableCharacters];
                  int v18 = [v16 isSupersetOfSet:v17];

                  if (!v18)
                  {
                    id v19 = v14;

                    goto LABEL_22;
                  }
                }
                else
                {
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v23 + 1;
          id v5 = v24;
          uint64_t v6 = v21;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v22);
    }

    id v19 = 0;
  }
  else
  {
    id v19 = [(AXSSLanguageManager *)self dialectForSystemLanguage];
  }
LABEL_22:

  return v19;
}

- (id)dialectsThatCanSpeakString:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v6 = [(AXSSLanguageManager *)self languageMaps];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v12 = [v11 defaultDialect];
        int v13 = [v12 canSpeakString:v4];

        if (v13)
        {
          v14 = [v11 defaultDialect];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  v15 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  int v16 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = AXSSLanguageConvertToCanonicalForm(*(void **)(*((void *)&v27 + 1) + 8 * j));
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__AXSSLanguageManager_dialectsThatCanSpeakString___block_invoke;
  v25[3] = &unk_1E606CFF0;
  id v26 = v16;
  id v23 = v16;
  [v5 sortUsingComparator:v25];

  return v5;
}

uint64_t __50__AXSSLanguageManager_dialectsThatCanSpeakString___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  uint64_t v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  uint64_t v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(AXSSLanguageManager *)self dialectForSystemLanguage];
  if ([v5 canSpeakCharacter:v3])
  {
    v23[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
LABEL_3:
    id v7 = (id)v6;
    goto LABEL_9;
  }
  uint64_t v8 = [(AXSSLanguageManager *)self dialectForCurrentLocale];

  if ([v8 canSpeakCharacter:v3])
  {
    uint64_t v22 = v8;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    id v5 = v8;
  }
  else
  {
    id v5 = [(AXSSLanguageManager *)self dialectForCurrentRegion];

    if ([v5 canSpeakCharacter:v3])
    {
      uint64_t v21 = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      goto LABEL_3;
    }
    uint64_t v15 = 0;
    int v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__3;
    uint64_t v19 = __Block_byref_object_dispose__3;
    id v20 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = [(AXSSLanguageManager *)self languageMaps];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke;
    v13[3] = &unk_1E606D018;
    __int16 v14 = v3;
    v13[4] = &v15;
    [v9 enumerateObjectsWithOptions:0 usingBlock:v13];

    uint64_t v10 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke_2;
    v12[3] = &unk_1E606D068;
    v12[4] = &v15;
    [v10 enumerateObjectsWithOptions:2 usingBlock:v12];
    id v7 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
LABEL_9:

  return v7;
}

void __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 defaultDialect];
  int v4 = [v3 canSpeakCharacter:*(unsigned __int16 *)(a1 + 40)];

  if (v4)
  {
    id v5 = [v9 defaultDialect];
    char v6 = [v5 isDialectSecondaryForCharacter:*(unsigned __int16 *)(a1 + 40)];

    if ((v6 & 1) == 0)
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v8 = [v9 defaultDialect];
      [v7 addObject:v8];
    }
  }
}

void __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = AXSSLanguageConvertToCanonicalForm(a2);
  int v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke_3;
  v9[3] = &unk_1E606D040;
  id v5 = v3;
  id v10 = v5;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v9];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndexedSubscript:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeObjectAtIndex:v7];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) insertObject:v8 atIndex:0];
  }
}

uint64_t __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 languageMap];
  int v4 = [v3 generalLanguageID];
  uint64_t v5 = [v2 hasPrefix:v4];

  return v5;
}

- (id)dialectThatCanSpeakCharacter:(unsigned __int16)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXSSLanguageManager *)self dialectsThatCanSpeakCharacter:a3];
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    [MEMORY[0x1E4F1CA20] preferredLanguages];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v31)
    {
      uint64_t v6 = *(void *)v43;
      long long v32 = v5;
      long long v33 = v3;
      uint64_t v30 = *(void *)v43;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v43 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = AXSSLanguageConvertToCanonicalForm(*(void **)(*((void *)&v42 + 1) + 8 * v7));
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v9 = v3;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v39;
            while (2)
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v39 != v12) {
                  objc_enumerationMutation(v9);
                }
                __int16 v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                uint64_t v15 = objc_msgSend(v14, "languageMap", v30);
                int v16 = [v15 generalLanguageID];
                char v17 = [v8 hasPrefix:v16];

                if (v17)
                {
                  id v4 = v14;

                  id v5 = v32;
                  uint64_t v3 = v33;
                  goto LABEL_30;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

          ++v7;
          id v5 = v32;
          uint64_t v3 = v33;
          uint64_t v6 = v30;
        }
        while (v7 != v31);
        uint64_t v31 = [v32 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v31);
    }

    uint64_t v18 = [v3 firstObject];
    uint64_t v19 = [v18 languageMap];
    int v20 = [v19 isAmbiguous];

    if (v20)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v21 = v3;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v35;
        while (2)
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v35 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            long long v27 = objc_msgSend(v26, "specificLanguageID", v30);
            char v28 = [v27 isEqualToString:@"en-US"];

            if (v28)
            {
              id v4 = v26;

              goto LABEL_30;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
    }
    objc_msgSend(v3, "firstObject", v30);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
  }

  return v4;
}

- (BOOL)isCharacterCommon:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(AXSSLanguageManager *)self commonCharacters];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

- (BOOL)isCommonGreekCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(AXSSLanguageManager *)self commonGreekCharacters];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

- (BOOL)isStringComposedByCommonCharacters:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    while (v5 == v8 + v7)
    {
      uint64_t v8 = v5;
      uint64_t v7 = v6;
      id v9 = [(AXSSLanguageManager *)self commonCharacters];
      uint64_t v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v9, 1, v6 + v5, objc_msgSend(v4, "length") - (v6 + v5));
      uint64_t v6 = v10;

      if (v5 + v6 >= (unint64_t)[v4 length])
      {
        BOOL v11 = v5 != 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_8;
      }
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_8:

  return v11;
}

- (void)updateCachedDialects
{
  v2 = self;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXSSLanguageManager *)self systemLanguageID];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v4 = [(AXSSLanguageManager *)v2 languageMaps];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v82 objects:v91 count:16];
  v58 = v2;
  v56 = v3;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v83;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v83 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        uint64_t v10 = [v9 generalLanguageID];
        int v11 = [v3 hasPrefix:v10];

        if (v11)
        {
          uint64_t v18 = [(AXSSLanguageManager *)v2 _preferredLanguage];
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          uint64_t v19 = [v9 dialects];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v78 objects:v90 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v79;
            while (2)
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v79 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void **)(*((void *)&v78 + 1) + 8 * j);
                long long v25 = [v24 specificLanguageID];
                int v26 = [v25 isEqual:v18];

                if (v26)
                {
                  v2 = v58;
                  [(AXSSLanguageManager *)v58 setDialectForSystemLanguage:v24];
                  goto LABEL_30;
                }
                v2 = v58;
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v78 objects:v90 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }
LABEL_30:

          if (!v2->_dialectForSystemLanguage)
          {
            long long v27 = [v9 defaultDialect];
            [(AXSSLanguageManager *)v2 setDialectForSystemLanguage:v27];
          }
          uint64_t v3 = v56;
          goto LABEL_33;
        }
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v12 = [v9 alternateLanguageIDs];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v74 objects:v89 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v75;
          while (2)
          {
            for (uint64_t k = 0; k != v14; ++k)
            {
              if (*(void *)v75 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([v3 hasPrefix:*(void *)(*((void *)&v74 + 1) + 8 * k)])
              {
                char v17 = [v9 defaultDialect];
                v2 = v58;
                [(AXSSLanguageManager *)v58 setDialectForSystemLanguage:v17];

                goto LABEL_17;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v74 objects:v89 count:16];
            v2 = v58;
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v82 objects:v91 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_33:

  char v28 = [(AXSSLanguageManager *)v2 userLocale];
  long long v29 = [v28 objectForKey:*MEMORY[0x1E4F1C438]];

  if (v29)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v30 = [(AXSSLanguageManager *)v2 languageMaps];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v88 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v71;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v71 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = *(void **)(*((void *)&v70 + 1) + 8 * m);
          long long v36 = [v35 generalLanguageID];
          int v37 = [v29 hasPrefix:v36];

          if (v37)
          {
            long long v38 = [v35 defaultDialect];
            [(AXSSLanguageManager *)v2 setDialectForCurrentLocale:v38];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v70 objects:v88 count:16];
      }
      while (v32);
    }
  }
  long long v39 = [(AXSSLanguageManager *)v2 userLocale];
  uint64_t v40 = *MEMORY[0x1E4F1C400];
  long long v41 = [v39 objectForKey:*MEMORY[0x1E4F1C400]];

  if (v41)
  {
    v55 = v29;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obuint64_t j = [(AXSSLanguageManager *)v2 languageMaps];
    uint64_t v60 = [obj countByEnumeratingWithState:&v66 objects:v87 count:16];
    if (v60)
    {
      uint64_t v59 = *(void *)v67;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v67 != v59) {
            objc_enumerationMutation(obj);
          }
          uint64_t v61 = v42;
          long long v43 = *(void **)(*((void *)&v66 + 1) + 8 * v42);
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v44 = [v43 dialects];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v62 objects:v86 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v63;
            while (2)
            {
              for (uint64_t n = 0; n != v46; ++n)
              {
                if (*(void *)v63 != v47) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v49 = *(void **)(*((void *)&v62 + 1) + 8 * n);
                v50 = [v49 locale];
                v51 = [v50 objectForKey:v40];
                int v52 = [v51 hasSuffix:v41];

                if (v52)
                {
                  [(AXSSLanguageManager *)v58 setDialectForCurrentRegion:v49];
                  goto LABEL_60;
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v62 objects:v86 count:16];
              if (v46) {
                continue;
              }
              break;
            }
          }
LABEL_60:

          uint64_t v42 = v61 + 1;
        }
        while (v61 + 1 != v60);
        uint64_t v60 = [obj countByEnumeratingWithState:&v66 objects:v87 count:16];
      }
      while (v60);
    }

    long long v29 = v55;
    uint64_t v3 = v56;
    v2 = v58;
  }
  if (!v2->_dialectForSystemLanguage)
  {
    if (v2->_dialectForCurrentLocale)
    {
      uint64_t v53 = [(AXSSLanguageManager *)v2 dialectForCurrentLocale];
LABEL_68:
      v54 = (void *)v53;
      [(AXSSLanguageManager *)v2 setDialectForSystemLanguage:v53];

      goto LABEL_69;
    }
    if (v2->_dialectForCurrentRegion)
    {
      uint64_t v53 = [(AXSSLanguageManager *)v2 dialectForCurrentRegion];
      goto LABEL_68;
    }
  }
LABEL_69:
}

- (void)_handleUserLocaleDidChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "autoupdatingCurrentLocale", a3);
  [(AXSSLanguageManager *)self setUserLocale:v4];

  [(AXSSLanguageManager *)self updateCachedDialects];
}

- (void)setLanguageMaps:(id)a3
{
}

- (NSLocale)userLocale
{
  return self->_userLocale;
}

- (void)setUserLocale:(id)a3
{
}

- (NSCharacterSet)commonCharacters
{
  return self->_commonCharacters;
}

- (void)setCommonCharacters:(id)a3
{
}

- (NSCharacterSet)commonGreekCharacters
{
  return self->_commonGreekCharacters;
}

- (void)setCommonGreekCharacters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonGreekCharacters, 0);
  objc_storeStrong((id *)&self->_commonCharacters, 0);
  objc_storeStrong((id *)&self->_userLocale, 0);
  objc_storeStrong((id *)&self->_languageMaps, 0);
  objc_storeStrong((id *)&self->_dialectForCurrentRegion, 0);
  objc_storeStrong((id *)&self->_dialectForCurrentLocale, 0);

  objc_storeStrong((id *)&self->_dialectForSystemLanguage, 0);
}

@end