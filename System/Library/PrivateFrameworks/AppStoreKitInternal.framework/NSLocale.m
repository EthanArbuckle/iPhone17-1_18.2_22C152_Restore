@interface NSLocale
@end

@implementation NSLocale

void __44__NSLocale_AMPICUExtensions__ISOScriptCodes__block_invoke()
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int32_t IntPropertyMaxValue = u_getIntPropertyMaxValue(UCHAR_SCRIPT);
  if ((IntPropertyMaxValue & 0x80000000) == 0)
  {
    int v1 = 0;
    int v2 = IntPropertyMaxValue + 1;
    do
    {
      uint64_t ShortName = uscript_getShortName();
      if (ShortName)
      {
        v4 = [NSString stringWithUTF8String:ShortName];
        [v7 addObject:v4];
      }
      ++v1;
    }
    while (v2 != v1);
  }
  uint64_t v5 = [v7 sortedArrayUsingSelector:sel_compare_];
  v6 = (void *)_scriptCodes;
  _scriptCodes = v5;
}

void __49__NSLocale_AMPICUExtensions__ICUNumberingSystems__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unumsys_openAvailableNames();
  int v1 = uenum_count();
  if (v1 < 1)
  {
    v4 = 0;
  }
  else
  {
    int v2 = 0;
    do
    {
      uint64_t v3 = uenum_next();
      v4 = +[NSNumberingSystem numberingSystemWithNumberingSystemName:v3];

      if (v4)
      {
        uint64_t v5 = [NSString stringWithUTF8String:v3];
        [v0 setObject:v4 forKeyedSubscript:v5];
      }
      int v2 = v4;
      --v1;
    }
    while (v1);
  }
  uenum_close();
  uint64_t v6 = [v0 copy];
  id v7 = (void *)_numberingSystems;
  _numberingSystems = v6;
}

void __52__NSLocale_AMPICUExtensions__ISOTerritoryGroupCodes__block_invoke()
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  fillMutableSetWithRegionType(v3);
  fillMutableSetWithRegionType(v3);
  fillMutableSetWithRegionType(v3);
  fillMutableSetWithRegionType(v3);
  id v0 = [v3 allObjects];
  uint64_t v1 = [v0 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  int v2 = (void *)_territoryGroupCodes;
  _territoryGroupCodes = v1;
}

void __62__NSLocale_AMPICUExtensions__ISO3CharacterTerritoryGroupCodes__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) ISOTerritoryGroupCodes];
  int v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(@"_", "stringByAppendingString:", v7, (void)v13);
        id v8 = objc_claimAutoreleasedReturnValue();
        [v8 UTF8String];
        ISO3Country = (unsigned char *)uloc_getISO3Country();
        if (ISO3Country && *ISO3Country)
        {
          v10 = [NSString stringWithUTF8String:ISO3Country];
          [v2 addObject:v10];
        }
        else
        {
          [v2 addObject:v7];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  uint64_t v11 = [v2 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  v12 = (void *)_territoryGroupCodes3;
  _territoryGroupCodes3 = v11;
}

void __56__NSLocale_AMPICUExtensions__ISO3CharacterLanguageCodes__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) ISOLanguageCodes];
  int v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "UTF8String", (void)v12);
        ISO3Language = (unsigned char *)uloc_getISO3Language();
        if (ISO3Language && *ISO3Language)
        {
          v9 = [NSString stringWithUTF8String:ISO3Language];
          [v2 addObject:v9];
        }
        else
        {
          [v2 addObject:v7];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [v2 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  uint64_t v11 = (void *)_languageCodes3;
  _languageCodes3 = v10;
}

void __54__NSLocale_AMPICUExtensions__ISO3CharacterRegionCodes__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) ISOCountryCodes];
  int v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(@"_", "stringByAppendingString:", v7, (void)v13);
        id v8 = objc_claimAutoreleasedReturnValue();
        [v8 UTF8String];
        ISO3Country = (unsigned char *)uloc_getISO3Country();
        if (ISO3Country && *ISO3Country)
        {
          uint64_t v10 = [NSString stringWithUTF8String:ISO3Country];
          [v2 addObject:v10];
        }
        else
        {
          [v2 addObject:v7];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  uint64_t v11 = [v2 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  long long v12 = (void *)_regionCodes3;
  _regionCodes3 = v11;
}

@end