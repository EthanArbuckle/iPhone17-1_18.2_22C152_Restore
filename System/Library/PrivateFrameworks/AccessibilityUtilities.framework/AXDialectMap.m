@interface AXDialectMap
+ (id)_hanjaCharacterSet;
+ (id)_hanjaToHangulMap;
- (AXDialectMap)initWithLocale:(id)a3 specificLanguageID:(id)a4 speakableCharacters:(id)a5 secondaryLanguageRange:(id)a6;
- (AXLangMap)langMap;
- (AXLanguageManager)langManager;
- (BOOL)_languageIsKorean;
- (BOOL)canSpeakCharacter:(unsigned __int16)a3;
- (BOOL)canSpeakCharacter:(unsigned __int16)a3 allowTransliteration:(BOOL)a4;
- (BOOL)canSpeakLongCharacter:(unsigned int)a3;
- (BOOL)canSpeakString:(id)a3;
- (BOOL)canSpeakString:(id)a3 allowsTransliteration:(BOOL)a4;
- (BOOL)hasSpeakableCharacters;
- (BOOL)isDialectSecondaryForCharacter:(unsigned __int16)a3;
- (NSCharacterSet)secondaryLanguageRange;
- (NSCharacterSet)speakableCharacters;
- (NSLocale)locale;
- (NSString)languageNameAndLocaleInCurrentLocale;
- (NSString)languageNameAndLocaleInNativeLocale;
- (NSString)languageNameInCurrentLocale;
- (NSString)languageNameInNativeLocale;
- (NSString)localeNameInCurrentLocale;
- (NSString)regionID;
- (NSString)specificLanguageID;
- (NSString)voiceName;
- (id)_stringByTransliterationHanjaToHangul:(id)a3;
- (id)_transliteratedSpeechCharacters;
- (id)basicDescription;
- (id)transliteratedStringForString:(id)a3;
- (void)setLangMap:(id)a3;
- (void)setLocale:(id)a3;
- (void)setSecondaryLanguageRange:(id)a3;
- (void)setSpeakableCharacters:(id)a3;
- (void)setSpecificLanguageID:(id)a3;
- (void)setVoiceName:(id)a3;
@end

@implementation AXDialectMap

- (AXDialectMap)initWithLocale:(id)a3 specificLanguageID:(id)a4 speakableCharacters:(id)a5 secondaryLanguageRange:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)AXDialectMap;
  v14 = [(AXDialectMap *)&v28 init];
  v15 = v14;
  if (v14)
  {
    [(AXDialectMap *)v14 setLocale:v10];
    [(AXDialectMap *)v15 setSpeakableCharacters:v12];
    [(AXDialectMap *)v15 setSecondaryLanguageRange:v13];
    if (v11)
    {
      v16 = [v11 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
      v17 = AXCLanguageConvertToCanonicalForm();
      [(AXDialectMap *)v15 setSpecificLanguageID:v17];
    }
    else
    {
      v16 = [(AXDialectMap *)v15 locale];
      v17 = [v16 localeIdentifier];
      v18 = [v17 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
      v19 = AXCLanguageConvertToCanonicalForm();
      [(AXDialectMap *)v15 setSpecificLanguageID:v19];
    }
    v20 = [(AXDialectMap *)v15 specificLanguageID];
    int v21 = [v20 hasPrefix:@"zh"];

    if (v21)
    {
      v22 = [(AXDialectMap *)v15 specificLanguageID];
      v23 = [v22 stringByReplacingOccurrencesOfString:@"Hant-" withString:&stru_1EDC3DEF8];
      [(AXDialectMap *)v15 setSpecificLanguageID:v23];

      v24 = [(AXDialectMap *)v15 specificLanguageID];
      v25 = [v24 stringByReplacingOccurrencesOfString:@"Hans-" withString:&stru_1EDC3DEF8];
      [(AXDialectMap *)v15 setSpecificLanguageID:v25];
    }
    v26 = v15;
  }

  return v15;
}

- (id)basicDescription
{
  v3 = NSString;
  v4 = [(AXDialectMap *)self langMap];
  v5 = [v4 userPreferredDialect];
  if ([v5 isEqual:self]) {
    v6 = @"* ";
  }
  else {
    v6 = &stru_1EDC3DEF8;
  }
  v7 = [(AXDialectMap *)self voiceName];
  v8 = [(AXDialectMap *)self locale];
  v9 = [v8 localeIdentifier];
  id v10 = [(AXDialectMap *)self specificLanguageID];
  id v11 = [v3 stringWithFormat:@"%@AXDialect <%p>. Voice:%@. LocaleID:%@ LangID:%@", v6, self, v7, v9, v10];

  return v11;
}

- (AXLanguageManager)langManager
{
  return +[AXLanguageManager sharedInstance];
}

- (NSString)regionID
{
  v2 = [(AXDialectMap *)self locale];
  v3 = [v2 localeIdentifier];

  return (NSString *)v3;
}

- (NSString)languageNameInCurrentLocale
{
  v3 = [(AXDialectMap *)self langManager];
  v4 = [v3 userLocale];

  v5 = [(AXDialectMap *)self locale];
  v6 = [v5 localeIdentifier];
  if ([v6 isEqualToString:@"wuu_CN"])
  {
    v7 = @"Shanghainese";
LABEL_5:
    v8 = AXLocalizedStringWithLocale(v7, 0);
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"ar_001"])
  {
    v7 = @"Arabic";
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F1C438];
    id v11 = [(AXDialectMap *)self locale];
    id v12 = [v11 languageCode];
    id v13 = [v4 displayNameForKey:v10 value:v12];

    id v9 = [v13 capitalizedStringWithLocale:v4];
  }

  return (NSString *)v9;
}

- (NSString)languageNameInNativeLocale
{
  v3 = [(AXDialectMap *)self locale];
  v4 = [v3 localeIdentifier];
  v5 = [(AXDialectMap *)self locale];
  v6 = [v5 localeIdentifier];
  v7 = _languageAndRegionNameForNonConformingCodes(v4, v6);

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = [(AXDialectMap *)self locale];
    uint64_t v10 = *MEMORY[0x1E4F1C438];
    id v11 = [(AXDialectMap *)self locale];
    id v12 = [v11 languageCode];
    id v13 = [v9 displayNameForKey:v10 value:v12];

    v14 = [(AXDialectMap *)self locale];
    id v8 = [v13 capitalizedStringWithLocale:v14];
  }

  return (NSString *)v8;
}

- (NSString)languageNameAndLocaleInCurrentLocale
{
  v3 = [(AXDialectMap *)self langManager];
  v4 = [v3 userLocale];

  v5 = [(AXDialectMap *)self locale];
  v6 = [v5 localeIdentifier];
  v7 = _languageAndRegionNameForNonConformingCodes(v6, 0);

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = (void *)*MEMORY[0x1E4F1C430];
    uint64_t v10 = [(AXDialectMap *)self locale];
    id v11 = [v10 localeIdentifier];
    _icuDisplayNameForLocale(v4, v9, v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSString)localeNameInCurrentLocale
{
  v3 = [(AXDialectMap *)self langManager];
  v4 = [v3 userLocale];

  v5 = (void *)*MEMORY[0x1E4F1C400];
  v6 = (void *)MEMORY[0x1E4F1CA20];
  v7 = [(AXDialectMap *)self locale];
  id v8 = [v7 localeIdentifier];
  id v9 = [v6 componentsFromLocaleIdentifier:v8];
  uint64_t v10 = [v9 objectForKey:v5];
  id v11 = _icuDisplayNameForLocale(v4, v5, v10);

  id v12 = [v11 capitalizedStringWithLocale:v4];

  return (NSString *)v12;
}

- (NSString)languageNameAndLocaleInNativeLocale
{
  v3 = [(AXDialectMap *)self locale];
  v4 = [v3 localeIdentifier];
  v5 = [(AXDialectMap *)self locale];
  v6 = [v5 localeIdentifier];
  v7 = _languageAndRegionNameForNonConformingCodes(v4, v6);

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = [(AXDialectMap *)self specificLanguageID];
    uint64_t v10 = +[AXLanguageManager nonlocalizedNameForLanguage:v9];

    if (!v10)
    {
      id v11 = [(AXDialectMap *)self locale];
      uint64_t v12 = *MEMORY[0x1E4F1C430];
      id v13 = [(AXDialectMap *)self locale];
      v14 = [v13 localeIdentifier];
      uint64_t v10 = [v11 displayNameForKey:v12 value:v14];
    }
    v15 = [(AXDialectMap *)self locale];
    id v8 = [v10 capitalizedStringWithLocale:v15];
  }

  return (NSString *)v8;
}

- (BOOL)isDialectSecondaryForCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = [(AXDialectMap *)self secondaryLanguageRange];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

- (BOOL)canSpeakCharacter:(unsigned __int16)a3
{
  return [(AXDialectMap *)self canSpeakCharacter:a3 allowTransliteration:1];
}

- (BOOL)hasSpeakableCharacters
{
  v2 = [(AXDialectMap *)self speakableCharacters];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canSpeakCharacter:(unsigned __int16)a3 allowTransliteration:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  v7 = [(AXDialectMap *)self speakableCharacters];

  if (!v7) {
    return 0;
  }
  id v8 = [(AXDialectMap *)self speakableCharacters];
  char v9 = [v8 characterIsMember:v5];
  if ((v9 & 1) == 0 && v4)
  {
    if ([(AXDialectMap *)self speakingRequiresTransliteration])
    {
      uint64_t v10 = [(AXDialectMap *)self _transliteratedSpeechCharacters];
      char v9 = [v10 characterIsMember:v5];
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)canSpeakLongCharacter:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(AXDialectMap *)self speakableCharacters];

  if (!v5) {
    return 0;
  }
  v6 = [(AXDialectMap *)self speakableCharacters];
  char v7 = [v6 longCharacterIsMember:v3];

  return v7;
}

- (BOOL)canSpeakString:(id)a3
{
  return [(AXDialectMap *)self canSpeakString:a3 allowsTransliteration:1];
}

- (BOOL)canSpeakString:(id)a3 allowsTransliteration:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6
    && ([(AXDialectMap *)self speakableCharacters],
        char v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = +[AXLanguageManager sharedInstance];
    uint64_t v9 = [v6 length];
    if (v9)
    {
      unint64_t v10 = v9;
      BOOL v11 = 0;
      for (i = 0; i != v10; BOOL v11 = i >= v10)
      {
        uint64_t v13 = [v6 characterAtIndex:i];
        if (([v8 isCharacterCommon:v13] & 1) == 0
          && ![(AXDialectMap *)self canSpeakCharacter:v13 allowTransliteration:v4])
        {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_languageIsKorean
{
  v2 = [(AXDialectMap *)self locale];
  uint64_t v3 = [v2 languageIdentifier];
  char v4 = [v3 hasPrefix:@"ko"];

  return v4;
}

- (id)transliteratedStringForString:(id)a3
{
  id v4 = a3;
  if ([(AXDialectMap *)self _languageIsKorean])
  {
    id v5 = [(AXDialectMap *)self _stringByTransliterationHanjaToHangul:v4];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)_transliteratedSpeechCharacters
{
  if ([(AXDialectMap *)self _languageIsKorean])
  {
    v2 = +[AXDialectMap _hanjaCharacterSet];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)_hanjaToHangulMap
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AXDialectMap__hanjaToHangulMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_hanjaToHangulMap_onceToken != -1) {
    dispatch_once(&_hanjaToHangulMap_onceToken, block);
  }
  v2 = (void *)_hanjaToHangulMap_hanjaToHangulMap;

  return v2;
}

void __33__AXDialectMap__hanjaToHangulMap__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v0 pathForResource:@"hanjaToHangul" ofType:@"plist"];

  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];
  v2 = (void *)_hanjaToHangulMap_hanjaToHangulMap;
  _hanjaToHangulMap_hanjaToHangulMap = v1;
}

+ (id)_hanjaCharacterSet
{
  if (_hanjaCharacterSet_onceToken != -1) {
    dispatch_once(&_hanjaCharacterSet_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)_hanjaCharacterSet_hanjaCharacterSet;

  return v2;
}

void __34__AXDialectMap__hanjaCharacterSet__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = +[AXDialectMap _hanjaToHangulMap];
  uint64_t v1 = [MEMORY[0x1E4F28E78] string];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(v0, "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [v1 appendString:*(void *)(*((void *)&v9 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v1];
  id v8 = (void *)_hanjaCharacterSet_hanjaCharacterSet;
  _hanjaCharacterSet_hanjaCharacterSet = v7;
}

- (id)_stringByTransliterationHanjaToHangul:(id)a3
{
  id v5 = a3;
  uint64_t v6 = +[AXDialectMap _hanjaCharacterSet];
  if ([v5 rangeOfCharacterFromSet:v6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = +[AXDialectMap _hanjaToHangulMap];
    id v9 = v5;
    id v10 = v8;
    v32 = v6;
    id v33 = v5;
    v34 = v10;
    if ([v9 length])
    {
      v30 = self;
      SEL v31 = a2;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      id v7 = v9;
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v14 = [v9 rangeOfComposedCharacterSequenceAtIndex:v12];
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = v14;
          v17 = objc_msgSend(v9, "substringWithRange:", v14, v15);
          v18 = [v10 objectForKey:v17];
          v19 = v18;
          if (v18)
          {
            id v20 = v18;

            if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v16 = v13;
            }
            v11 += [v17 length];
            id v10 = v20;
          }
          else
          {
            uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
            if (v13 != 0x7FFFFFFFFFFFFFFFLL)
            {
              int v21 = [v10 objectForKey:@"T"];
              v22 = v21;
              if (v21)
              {
                if (v11 != [v21 length]) {
                  _AXAssert();
                }
                if (v11 == [v22 length])
                {
                  uint64_t v23 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v13, v11, v22);

                  id v7 = (id)v23;
                }
              }
              id v24 = v34;

              --v12;
              uint64_t v11 = 0;
              uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
              id v10 = v24;
            }
          }

          uint64_t v13 = v16;
        }
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v25 = [v10 objectForKey:@"T"];
          v26 = v25;
          if (v25)
          {
            if (v11 != [v25 length])
            {
              objc_super v28 = [MEMORY[0x1E4F28B00] currentHandler];
              [v28 handleFailureInMethod:v31 object:v30 file:@"AXDialectMap.m" lineNumber:378 description:@"Hanja to hangul transliteration tabler should only contain equal length mappings"];
            }
            uint64_t v27 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v13, v11, v26);

            id v7 = (id)v27;
          }
        }
        ++v12;
      }
      while (v12 < [v9 length]);
    }
    else
    {
      id v7 = v9;
    }

    uint64_t v6 = v32;
    id v5 = v33;
  }

  return v7;
}

- (AXLangMap)langMap
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_langMap);

  return (AXLangMap *)WeakRetained;
}

- (void)setLangMap:(id)a3
{
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)specificLanguageID
{
  return self->_specificLanguageID;
}

- (void)setSpecificLanguageID:(id)a3
{
}

- (NSCharacterSet)speakableCharacters
{
  return self->_speakableCharacters;
}

- (void)setSpeakableCharacters:(id)a3
{
}

- (NSCharacterSet)secondaryLanguageRange
{
  return self->_secondaryLanguageRange;
}

- (void)setSecondaryLanguageRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLanguageRange, 0);
  objc_storeStrong((id *)&self->_speakableCharacters, 0);
  objc_storeStrong((id *)&self->_specificLanguageID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);

  objc_destroyWeak((id *)&self->_langMap);
}

@end