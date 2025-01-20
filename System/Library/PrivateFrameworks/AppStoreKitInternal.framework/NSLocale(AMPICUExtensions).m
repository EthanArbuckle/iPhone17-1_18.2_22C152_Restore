@interface NSLocale(AMPICUExtensions)
+ (id)ICUNumberingSystems;
+ (id)ISO3CharacterLanguageCodes;
+ (id)ISO3CharacterRegionCodes;
+ (id)ISO3CharacterTerritoryGroupCodes;
+ (id)ISOScriptCodes;
+ (id)ISOTerritoryGroupCodes;
+ (id)threeCharacterLanguageCodeFromTwoCharacterCode:()AMPICUExtensions;
+ (id)threeCharacterRegionCodeFromTwoCharacterCode:()AMPICUExtensions;
+ (id)twoCharacterLanguageCodeFromThreeCharacterCode:()AMPICUExtensions;
+ (id)twoCharacterRegionCodeFromThreeCharacterCode:()AMPICUExtensions;
- (id)availableCountriesOfLength:()AMPICUExtensions;
- (id)availableDateFormatTemplates;
- (id)availableLanguagesOfLength:()AMPICUExtensions;
- (id)availableResourcesOfStyle:()AMPICUExtensions icuPath:availableResourcesKeyPrefix:baseResourceKey:resourceKeyPath:availableResourcesResourceKey:availableResourcesResourceValue:allowFallbackResources:;
- (id)availableScriptsOfLength:()AMPICUExtensions;
- (id)localizedStringForCountryCode:()AMPICUExtensions length:;
- (id)localizedStringForLanguageCode:()AMPICUExtensions length:;
- (id)localizedStringForNumberingSystem:()AMPICUExtensions;
- (id)localizedStringForScriptCode:()AMPICUExtensions length:;
- (id)threeCharacterLanguageCode;
- (id)threeCharacterRegionCode;
- (uint64_t)availableVariants;
@end

@implementation NSLocale(AMPICUExtensions)

+ (id)ISOScriptCodes
{
  if (+[NSLocale(AMPICUExtensions) ISOScriptCodes]::onceToken != -1) {
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISOScriptCodes]::onceToken, &__block_literal_global_7);
  }
  v0 = (void *)_scriptCodes;
  return v0;
}

+ (id)ICUNumberingSystems
{
  if (+[NSLocale(AMPICUExtensions) ICUNumberingSystems]::onceToken != -1) {
    dispatch_once(&+[NSLocale(AMPICUExtensions) ICUNumberingSystems]::onceToken, &__block_literal_global_20);
  }
  v0 = (void *)_numberingSystems;
  return v0;
}

+ (id)ISOTerritoryGroupCodes
{
  if (+[NSLocale(AMPICUExtensions) ISOTerritoryGroupCodes]::onceToken != -1) {
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISOTerritoryGroupCodes]::onceToken, &__block_literal_global_24);
  }
  v0 = (void *)_territoryGroupCodes;
  return v0;
}

+ (id)ISO3CharacterTerritoryGroupCodes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__NSLocale_AMPICUExtensions__ISO3CharacterTerritoryGroupCodes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[NSLocale(AMPICUExtensions) ISO3CharacterTerritoryGroupCodes]::onceToken != -1) {
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISO3CharacterTerritoryGroupCodes]::onceToken, block);
  }
  v1 = (void *)_territoryGroupCodes3;
  return v1;
}

+ (id)ISO3CharacterLanguageCodes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NSLocale_AMPICUExtensions__ISO3CharacterLanguageCodes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[NSLocale(AMPICUExtensions) ISO3CharacterLanguageCodes]::onceToken != -1) {
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISO3CharacterLanguageCodes]::onceToken, block);
  }
  v1 = (void *)_languageCodes3;
  return v1;
}

+ (id)ISO3CharacterRegionCodes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NSLocale_AMPICUExtensions__ISO3CharacterRegionCodes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[NSLocale(AMPICUExtensions) ISO3CharacterRegionCodes]::onceToken != -1) {
    dispatch_once(&+[NSLocale(AMPICUExtensions) ISO3CharacterRegionCodes]::onceToken, block);
  }
  v1 = (void *)_regionCodes3;
  return v1;
}

+ (id)threeCharacterLanguageCodeFromTwoCharacterCode:()AMPICUExtensions
{
  id v3 = a3;
  [v3 UTF8String];
  ISO3Language = (unsigned char *)uloc_getISO3Language();
  if (ISO3Language && *ISO3Language)
  {
    v5 = [NSString stringWithUTF8String:ISO3Language];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)twoCharacterLanguageCodeFromThreeCharacterCode:()AMPICUExtensions
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 UTF8String];
  uloc_getLanguage();
  v4 = [NSString stringWithUTF8String:v6];

  return v4;
}

+ (id)threeCharacterRegionCodeFromTwoCharacterCode:()AMPICUExtensions
{
  id v3 = a3;
  id v4 = [@"_" stringByAppendingString:v3];
  [v4 UTF8String];
  ISO3Country = (unsigned char *)uloc_getISO3Country();
  if (ISO3Country && *ISO3Country)
  {
    uint64_t v6 = [NSString stringWithUTF8String:ISO3Country];
  }
  else
  {
    uint64_t v6 = objc_msgSend(v3, "copy", ISO3Country);
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

+ (id)twoCharacterRegionCodeFromThreeCharacterCode:()AMPICUExtensions
{
  objc_msgSend(@"_", "stringByAppendingString:");
  id v0 = objc_claimAutoreleasedReturnValue();
  [v0 UTF8String];
  uloc_getCountry();
  v1 = [NSString stringWithUTF8String:v3];

  return v1;
}

- (id)threeCharacterLanguageCode
{
  v1 = [a1 languageCode];
  id v2 = [MEMORY[0x1E4F1CA20] threeCharacterLanguageCodeFromTwoCharacterCode:v1];
  if (!v2) {
    id v2 = v1;
  }

  return v2;
}

- (id)threeCharacterRegionCode
{
  v1 = [a1 countryCode];
  id v2 = [MEMORY[0x1E4F1CA20] threeCharacterRegionCodeFromTwoCharacterCode:v1];
  if (!v2) {
    id v2 = v1;
  }

  return v2;
}

- (id)availableResourcesOfStyle:()AMPICUExtensions icuPath:availableResourcesKeyPrefix:baseResourceKey:resourceKeyPath:availableResourcesResourceKey:availableResourcesResourceValue:allowFallbackResources:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v15 = a3;
  id v16 = a5;
  id v49 = a7;
  id v47 = a8;
  id v48 = a9;
  v44 = v16;
  id v50 = [a1 localeIdentifier];
  v17 = &stru_1F3CF7B28;
  if (v15) {
    v17 = v15;
  }
  v45 = v17;
  objc_msgSend(v16, "stringByAppendingString:");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v19 = NSSelectorFromString(v18);
  v20 = objc_getAssociatedObject(a1, v19);
  v21 = [v20 objectForKeyedSubscript:@"localeID"];
  if (![v21 isEqual:v50])
  {

    if (!v20)
    {
LABEL_10:
      id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v43 = v50;
      v24 = (unsigned char *)[v43 UTF8String];
      if (!v24 || !*v24)
      {
LABEL_45:
        v27 = (void *)[v46 copy];
        if ([v49 length])
        {
          v56 = @"localeID";
          id v57 = v47;
          id v59 = v43;
          id v60 = v48;
          v37 = v61;
          v58 = v18;
        }
        else
        {
          v61[2] = v18;
          v61[3] = v43;
          v61[1] = @"localeID";
          v37 = &v62;
        }
        uint64_t *v37 = (uint64_t)v27;
        v38 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:");

        objc_setAssociatedObject(a1, v19, v38, (void *)0x303);
        v20 = v38;
        goto LABEL_49;
      }
      uint64_t v42 = ures_open();
      int v55 = 0;
      if ([(__CFString *)v15 length])
      {
        strcpy(__dst, a6);
        *(_WORD *)&__dst[strlen(__dst)] = 37;
        v25 = (const char *)[(__CFString *)v15 UTF8String];
        size_t v26 = strlen(__dst);
        strncat(__dst, v25, 255 - v26);
        ures_getByKey();
      }
      else
      {
        ures_getByKey();
      }
      if (v55 <= 0)
      {
        if ([v49 length])
        {
          [v49 componentsSeparatedByString:@"."];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
          if (v28)
          {
            uint64_t v41 = *(void *)v52;
LABEL_21:
            uint64_t v29 = 0;
            while (1)
            {
              if (*(void *)v52 != v41) {
                objc_enumerationMutation(obj);
              }
              v30 = *(void **)(*((void *)&v51 + 1) + 8 * v29);
              int v55 = 0;
              [v30 UTF8String];
              if (a10) {
                ures_getByKeyWithFallback();
              }
              else {
                ures_getByKey();
              }
              if (v55 > 0) {
                break;
              }
              ures_close();
              if (v28 == ++v29)
              {
                uint64_t v28 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
                if (v28) {
                  goto LABEL_21;
                }
                break;
              }
            }
          }

          if (v55 > 0)
          {
            ures_close();

            goto LABEL_43;
          }
        }
        int v55 = 0;
        for (uint64_t i = ures_getNextResource(); i; uint64_t i = ures_getNextResource())
        {
          if (!ures_getType())
          {
            Key = (unsigned char *)ures_getKey();
            v33 = Key;
            if (Key)
            {
              if (*Key)
              {
                int v55 = 0;
                *(_DWORD *)__dst = 0;
                uint64_t String = ures_getString();
                if (String)
                {
                  if (*(_DWORD *)__dst)
                  {
                    v35 = [NSString stringWithUTF8String:v33];
                    v36 = [NSString stringWithCharacters:String length:*(int *)__dst];
                    [v46 setObject:v36 forKeyedSubscript:v35];
                  }
                }
              }
            }
          }
          ures_close();
          int v55 = 0;
        }
        ures_close();
      }
LABEL_43:
      if (v42) {
        ures_close();
      }
      goto LABEL_45;
    }
LABEL_9:
    objc_setAssociatedObject(a1, v19, 0, (void *)0x303);
    goto LABEL_10;
  }
  if ([v49 length])
  {
    v22 = [v20 objectForKeyedSubscript:v47];
    int v23 = [v22 isEqual:v48];

    if (!v23)
    {
      if (!v20) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  v27 = [v20 objectForKeyedSubscript:v18];
LABEL_49:

  return v27;
}

- (uint64_t)availableVariants
{
  if (icuDataLangPath(void)::onceToken != -1) {
    dispatch_once(&icuDataLangPath(void)::onceToken, &__block_literal_global_115);
  }
  LOBYTE(v3) = 1;
  return [a1 availableResourcesOfStyle:0 icuPath:&icuDataLangPath(void)::sICUDataLangPath availableResourcesKeyPrefix:@"availableVariants" baseResourceKey:"Variants" resourceKeyPath:0 availableResourcesResourceKey:0 availableResourcesResourceValue:0 allowFallbackResources:v3];
}

- (id)availableCountriesOfLength:()AMPICUExtensions
{
  id v4 = a3;
  if (icuDataRegionPath(void)::onceToken != -1) {
    dispatch_once(&icuDataRegionPath(void)::onceToken, &__block_literal_global_124);
  }
  LOBYTE(v7) = 1;
  v5 = [a1 availableResourcesOfStyle:v4 icuPath:&icuDataRegionPath(void)::sICUDataRegionPath availableResourcesKeyPrefix:@"availableCountries" baseResourceKey:"Countries" resourceKeyPath:0 availableResourcesResourceKey:0 availableResourcesResourceValue:0 allowFallbackResources:v7];

  return v5;
}

- (id)availableLanguagesOfLength:()AMPICUExtensions
{
  id v4 = a3;
  if (icuDataLangPath(void)::onceToken != -1) {
    dispatch_once(&icuDataLangPath(void)::onceToken, &__block_literal_global_115);
  }
  LOBYTE(v7) = 1;
  v5 = [a1 availableResourcesOfStyle:v4 icuPath:&icuDataLangPath(void)::sICUDataLangPath availableResourcesKeyPrefix:@"availableLanguages" baseResourceKey:"Languages" resourceKeyPath:0 availableResourcesResourceKey:0 availableResourcesResourceValue:0 allowFallbackResources:v7];

  return v5;
}

- (id)availableScriptsOfLength:()AMPICUExtensions
{
  id v4 = a3;
  if (icuDataLangPath(void)::onceToken != -1) {
    dispatch_once(&icuDataLangPath(void)::onceToken, &__block_literal_global_115);
  }
  LOBYTE(v7) = 1;
  v5 = [a1 availableResourcesOfStyle:v4 icuPath:&icuDataLangPath(void)::sICUDataLangPath availableResourcesKeyPrefix:@"availableScripts" baseResourceKey:"Scripts" resourceKeyPath:0 availableResourcesResourceKey:0 availableResourcesResourceValue:0 allowFallbackResources:v7];

  return v5;
}

- (id)availableDateFormatTemplates
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 calendarIdentifier];
  if (v2) {
    uint64_t v3 = (__CFString *)v2;
  }
  else {
    uint64_t v3 = @"gregorian";
  }
  v9[0] = v3;
  v9[1] = @"availableFormats";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v5 = [v4 componentsJoinedByString:@"."];

  LOBYTE(v8) = 1;
  uint64_t v6 = [a1 availableResourcesOfStyle:0 icuPath:0 availableResourcesKeyPrefix:@"availableDateFormatTemplates" baseResourceKey:"calendar" resourceKeyPath:v5 availableResourcesResourceKey:@"calendarID" availableResourcesResourceValue:v3 allowFallbackResources:v8];

  return v6;
}

- (id)localizedStringForNumberingSystem:()AMPICUExtensions
{
  uint64_t v2 = objc_msgSend(@"@numbers=", "stringByAppendingString:");
  uint64_t v3 = [a1 localizedStringForLocaleIdentifier:v2];
  id v4 = v3;
  if (v3 && (uint64_t v5 = [v3 rangeOfString:@"="], v6))
  {
    uint64_t v7 = [v4 substringFromIndex:v5 + v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)localizedStringForLanguageCode:()AMPICUExtensions length:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:v6];

  if ([v8 length])
  {
    uint64_t v9 = 0;
    while (1)
    {
      v10 = (void *)v9;
      if (![v7 length] || v9) {
        break;
      }
      v11 = [a1 availableLanguagesOfLength:v7];
      uint64_t v9 = [v11 objectForKeyedSubscript:v8];

      if (!v9)
      {
        uint64_t v12 = [(id)AMPICUFormattingLengthFallbacks objectForKeyedSubscript:v7];

        id v7 = (id)v12;
        if (!v12) {
          id v7 = (id)AMPICUFormattingLengthStandard;
        }
      }
    }
    if (!v9)
    {
      v10 = [a1 localizedStringForLanguageCode:v8];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localizedStringForCountryCode:()AMPICUExtensions length:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[NSLocaleRegion alloc] initWithRegionIdentifier:v6];
  uint64_t v9 = [(NSLocaleRegion *)v8 twoCharacterCode];

  if ([v9 length])
  {
    uint64_t v10 = 0;
    while (1)
    {
      v11 = (void *)v10;
      if (![v7 length] || v10) {
        break;
      }
      uint64_t v12 = [a1 availableCountriesOfLength:v7];
      uint64_t v10 = [v12 objectForKeyedSubscript:v9];

      if (!v10)
      {
        uint64_t v13 = [(id)AMPICUFormattingLengthFallbacks objectForKeyedSubscript:v7];

        id v7 = (id)v13;
        if (!v13) {
          id v7 = (id)AMPICUFormattingLengthStandard;
        }
      }
    }
    if (!v10)
    {
      v11 = [a1 localizedStringForCountryCode:v9];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)localizedStringForScriptCode:()AMPICUExtensions length:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = (void *)v8;
      if (![v7 length] || v8) {
        break;
      }
      uint64_t v10 = [a1 availableScriptsOfLength:v7];
      uint64_t v8 = [v10 objectForKeyedSubscript:v6];

      if (!v8)
      {
        uint64_t v11 = [(id)AMPICUFormattingLengthFallbacks objectForKeyedSubscript:v7];

        id v7 = (id)v11;
        if (!v11) {
          id v7 = (id)AMPICUFormattingLengthStandard;
        }
      }
    }
    if (!v8)
    {
      uint64_t v9 = [a1 localizedStringForScriptCode:v6];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end