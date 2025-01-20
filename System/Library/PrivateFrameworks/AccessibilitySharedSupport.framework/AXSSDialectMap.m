@interface AXSSDialectMap
- (AXSSDialectMap)initWithLocale:(id)a3 voiceName:(id)a4 specificLanguageID:(id)a5 voiceIdentifier:(id)a6 speakableCharacters:(id)a7 secondaryLanguageRange:(id)a8;
- (AXSSLanguageMap)languageMap;
- (BOOL)canSpeakCharacter:(unsigned __int16)a3;
- (BOOL)canSpeakString:(id)a3;
- (BOOL)isDialectSecondaryForCharacter:(unsigned __int16)a3;
- (BOOL)isEqual:(id)a3;
- (NSCharacterSet)secondaryLanguageRange;
- (NSCharacterSet)speakableCharacters;
- (NSLocale)locale;
- (NSString)regionID;
- (NSString)specificLanguageID;
- (NSString)voiceIdentifier;
- (NSString)voiceName;
- (id)description;
- (void)setLocale:(id)a3;
- (void)setSecondaryLanguageRange:(id)a3;
- (void)setSpeakableCharacters:(id)a3;
- (void)setSpecificLanguageID:(id)a3;
- (void)setVoiceIdentifier:(id)a3;
- (void)setVoiceName:(id)a3;
@end

@implementation AXSSDialectMap

- (AXSSDialectMap)initWithLocale:(id)a3 voiceName:(id)a4 specificLanguageID:(id)a5 voiceIdentifier:(id)a6 speakableCharacters:(id)a7 secondaryLanguageRange:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)AXSSDialectMap;
  v19 = [(AXSSDialectMap *)&v34 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_locale, a3);
    objc_storeStrong((id *)&v20->_voiceName, a4);
    objc_storeStrong((id *)&v20->_speakableCharacters, a7);
    objc_storeStrong((id *)&v20->_secondaryLanguageRange, a8);
    if (v16)
    {
      uint64_t v21 = [v16 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
      specificLanguageID = v20->_specificLanguageID;
      v20->_specificLanguageID = (NSString *)v21;
    }
    else
    {
      specificLanguageID = [(AXSSDialectMap *)v20 locale];
      v23 = [specificLanguageID localeIdentifier];
      uint64_t v24 = [v23 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
      v25 = v20->_specificLanguageID;
      v20->_specificLanguageID = (NSString *)v24;
    }
    v26 = [(AXSSDialectMap *)v20 specificLanguageID];
    int v27 = [v26 hasPrefix:@"zh"];

    if (v27)
    {
      v28 = [(AXSSDialectMap *)v20 specificLanguageID];
      v29 = [v28 stringByReplacingOccurrencesOfString:@"Hant-" withString:&stru_1F0C5BA58];
      [(AXSSDialectMap *)v20 setSpecificLanguageID:v29];

      v30 = [(AXSSDialectMap *)v20 specificLanguageID];
      v31 = [v30 stringByReplacingOccurrencesOfString:@"Hans-" withString:&stru_1F0C5BA58];
      [(AXSSDialectMap *)v20 setSpecificLanguageID:v31];
    }
    v32 = v20;
  }

  return v20;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AXSSDialectMap *)self voiceName];
  v5 = [(AXSSDialectMap *)self locale];
  v6 = [v5 localeIdentifier];
  v7 = [(AXSSDialectMap *)self specificLanguageID];
  v8 = [v3 stringWithFormat:@"AXSSDialect <%p>. Voice:%@. LocaleID:%@ LangID:%@", self, v4, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(AXSSDialectMap *)self specificLanguageID];
    v7 = [v5 specificLanguageID];
    if ([v6 isEqual:v7])
    {
      v8 = [(AXSSDialectMap *)self voiceIdentifier];
      v9 = [v5 voiceIdentifier];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)canSpeakCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(AXSSDialectMap *)self speakableCharacters];
  char v6 = [v5 characterIsMember:v3];

  v7 = [(AXSSDialectMap *)self specificLanguageID];
  int v8 = [v7 hasPrefix:@"en"];

  if ((v6 & 1) != 0 || !v8) {
    return v6;
  }
  v9 = +[AXSSLanguageManager shared];
  char v10 = [v9 isCommonGreekCharacter:v3];

  return v10;
}

- (BOOL)canSpeakString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AXSSLanguageManager shared];
    uint64_t v6 = [v4 length];
    if (v6)
    {
      unint64_t v7 = v6;
      BOOL v8 = 0;
      for (i = 0; i != v7; BOOL v8 = i >= v7)
      {
        uint64_t v10 = [v4 characterAtIndex:i];
        if (([v5 isCharacterCommon:v10] & 1) == 0
          && ![(AXSSDialectMap *)self canSpeakCharacter:v10])
        {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isDialectSecondaryForCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(AXSSDialectMap *)self secondaryLanguageRange];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

- (NSString)regionID
{
  v2 = [(AXSSDialectMap *)self locale];
  uint64_t v3 = [v2 localeIdentifier];

  return (NSString *)v3;
}

- (AXSSLanguageMap)languageMap
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_languageMap);

  return (AXSSLanguageMap *)WeakRetained;
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

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
}

- (NSString)voiceIdentifier
{
  return self->_voiceIdentifier;
}

- (void)setVoiceIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_voiceIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_specificLanguageID, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_destroyWeak((id *)&self->_languageMap);
}

@end