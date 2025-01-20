@interface IPLanguageListManager
+ (BOOL)canRemoveLanguages:(id)a3 fromPreferredLanguages:(id)a4;
+ (id)effectiveSystemLanguagesWithUnsupportedVariant:(BOOL)a3 forPreferredLanguages:(id)a4;
+ (id)manager;
+ (id)regionalVariantLanguagesForBaseLanguage:(id)a3;
+ (id)regionalVariantLanguagesForSystemLanguages;
+ (void)preheat;
+ (void)sortByLocalizedLanguage:(id)a3;
- (IPLanguageListManager)initWithPreferredLanguages:(id)a3;
- (IPLanguageListManager)initWithPreferredLanguages:(id)a3 preferredLocale:(id)a4;
- (IPLanguageListManager)initWithPreferredLanguages:(id)a3 preferredLocale:(id)a4 systemLanguages:(id)a5;
- (NSArray)preferredLanguages;
- (NSArray)systemLanguages;
- (NSLocale)preferredLocale;
- (NSString)deviceLanguage;
- (NSString)systemDisplayLanguage;
- (id)deviceLanguagesForChangingDeviceLanguage:(BOOL)a3;
- (id)languageVariants;
- (id)otherLanguages;
- (void)setPreferredLanguages:(id)a3;
- (void)setPreferredLocale:(id)a3;
- (void)setRegion:(id)a3 updateFirstLanguage:(BOOL)a4;
- (void)systemDisplayLanguage;
@end

@implementation IPLanguageListManager

- (IPLanguageListManager)initWithPreferredLanguages:(id)a3 preferredLocale:(id)a4 systemLanguages:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IPLanguageListManager;
  v12 = [(IPLanguageListManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preferredLanguages, a3);
    objc_storeStrong((id *)&v13->_preferredLocale, a4);
    objc_storeStrong((id *)&v13->_systemLanguages, a5);
  }

  return v13;
}

- (IPLanguageListManager)initWithPreferredLanguages:(id)a3 preferredLocale:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 systemLanguages];
  id v10 = [(IPLanguageListManager *)self initWithPreferredLanguages:v8 preferredLocale:v7 systemLanguages:v9];

  return v10;
}

- (IPLanguageListManager)initWithPreferredLanguages:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 preferredLocale];
  id v7 = [MEMORY[0x1E4F1CA20] systemLanguages];
  id v8 = [(IPLanguageListManager *)self initWithPreferredLanguages:v5 preferredLocale:v6 systemLanguages:v7];

  return v8;
}

+ (id)manager
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F1CA20] _globalPreferredLanguages];
  v4 = [MEMORY[0x1E4F1CA20] preferredLocale];
  id v5 = [MEMORY[0x1E4F1CA20] systemLanguages];
  v6 = (void *)[v2 initWithPreferredLanguages:v3 preferredLocale:v4 systemLanguages:v5];

  return v6;
}

+ (void)preheat
{
  id v2 = (id)[(id)objc_opt_class() regionalVariantLanguagesForSystemLanguages];
}

- (id)deviceLanguagesForChangingDeviceLanguage:(BOOL)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [(IPLanguageListManager *)self systemLanguages];
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = [(IPLanguageListManager *)self systemLanguages];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __66__IPLanguageListManager_deviceLanguagesForChangingDeviceLanguage___block_invoke;
  v54[3] = &unk_1E63C0118;
  id v8 = v6;
  id v55 = v8;
  [v7 enumerateObjectsUsingBlock:v54];

  uint64_t v45 = [(IPLanguageListManager *)self systemDisplayLanguage];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA20], "baseLanguageFromLanguage:");
  id v10 = [(IPLanguageListManager *)self preferredLocale];
  uint64_t v11 = [v10 countryCode];

  v12 = +[IntlUtility preferredLanguagesForRegionWithoutFiltering:v11];
  v13 = [(IPLanguageListManager *)self systemLanguages];
  v14 = [(id)objc_opt_class() regionalVariantLanguagesForSystemLanguages];
  objc_super v15 = [v13 arrayByAddingObjectsFromArray:v14];
  v43 = (void *)v11;
  v16 = +[IntlUtility filterLanguageList:v12 forRegion:v11 fromLanguages:v15];
  v17 = (void *)[v16 mutableCopy];

  v18 = (void *)v9;
  v19 = v17;

  [v8 removeObjectsInArray:v17];
  if (v18)
  {
    [v8 removeObject:v18];
    [v17 removeObject:v18];
  }
  v20 = (void *)v45;
  if (v45)
  {
    [v8 removeObject:v45];
    [v17 removeObject:v45];
  }
  v21 = [MEMORY[0x1E4F1CA70] orderedSet];
  v22 = v21;
  if (v45) {
    [v21 addObject:v45];
  }
  [v22 addObjectsFromArray:v17];
  v44 = v8;
  [v22 addObjectsFromArray:v8];
  if (!a3)
  {
    v42 = v17;
    v23 = v18;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v24 = [(IPLanguageListManager *)self preferredLanguages];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v51 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          v30 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v29];
          uint64_t v31 = [v22 indexOfObject:v29];
          if (v31 != 0x7FFFFFFFFFFFFFFFLL
            || (uint64_t v31 = [v22 indexOfObject:v30], v31 != 0x7FFFFFFFFFFFFFFFLL))
          {
            [v22 removeObjectAtIndex:v31];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v26);
    }

    v20 = (void *)v45;
    [v22 removeObject:v45];
    v18 = v23;
    v19 = v42;
  }
  v32 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v33 = v22;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = +[IPLanguage languageWithIdentifier:*(void *)(*((void *)&v46 + 1) + 8 * j)];
        [v32 addObject:v38];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v35);
  }

  v39 = [v32 array];

  return v39;
}

void __66__IPLanguageListManager_deviceLanguagesForChangingDeviceLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[IntlUtility normalizedLanguageIDFromString:a2];
  [v2 addObject:v3];
}

- (id)languageVariants
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(IPLanguageListManager *)self systemDisplayLanguage];
  id v3 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v2];
  v4 = [(id)objc_opt_class() regionalVariantLanguagesForBaseLanguage:v3];
  id v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [v5 array];

  return v12;
}

- (id)otherLanguages
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA20] renderableUILanguages];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(IPLanguageListManager *)self systemLanguages];
  [v4 removeObjectsInArray:v5];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(IPLanguageListManager *)self preferredLanguages];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v12 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v11];
        uint64_t v13 = [v4 indexOfObject:v11];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL || (uint64_t v13 = [v4 indexOfObject:v12], v13 != 0x7FFFFFFFFFFFFFFFLL)) {
          [v4 removeObjectAtIndex:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v14 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  v21 = [(IPLanguageListManager *)self deviceLanguagesForChangingDeviceLanguage:0];
  [v14 removeObjectsInArray:v21];

  [(id)objc_opt_class() sortByLocalizedLanguage:v14];
  return v14;
}

- (void)setRegion:(id)a3 updateFirstLanguage:(BOOL)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v39 = self;
  id v6 = [(IPLanguageListManager *)self preferredLanguages];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if ([v7 count])
  {
    char v8 = 0;
    unint64_t v9 = 0;
    uint64_t v37 = *MEMORY[0x1E4F1C400];
    v38 = v7;
    id v35 = v5;
    do
    {
      id v10 = objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v35);
      uint64_t v11 = [MEMORY[0x1E4F1CA20] languageFromLanguage:v10 byReplacingRegion:v5];
      v40 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v10];
      if (v8)
      {
        int v12 = 0;
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v10];
        long long v14 = [MEMORY[0x1E4F1CA20] systemLanguages];
        if ([v14 containsObject:v13])
        {
          int v12 = 1;
        }
        else
        {
          id v15 = [MEMORY[0x1E4F1CA20] baseSystemLanguages];
          int v12 = [v15 containsObject:v13];
        }
      }
      uint64_t v16 = [(id)objc_opt_class() regionalVariantLanguagesForSystemLanguages];
      char v17 = [v16 containsObject:v10];

      if (v12)
      {
        uint64_t v7 = v38;
        if (!a4 && ![MEMORY[0x1E4F1CA20] _language:v10 usesSameLocalizationAs:v11])
        {
          if ((v17 & 1) == 0)
          {
            uint64_t v18 = (void *)MEMORY[0x1E4F28B50];
            uint64_t v19 = [(id)objc_opt_class() regionalVariantLanguagesForSystemLanguages];
            v41[0] = v10;
            v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
            v21 = [v18 preferredLocalizationsFromArray:v19 forPreferences:v20];
            v22 = [v21 firstObject];

            uint64_t v7 = v38;
            if ([v22 length]
              && [MEMORY[0x1E4F1CA20] _language:v22 usesSameLocalizationAs:v10])
            {
              [v38 replaceObjectAtIndex:v9 withObject:v22];
            }

            id v5 = v35;
          }
          goto LABEL_20;
        }
      }
      else
      {
        uint64_t v23 = [v40 objectForKeyedSubscript:v37];
        uint64_t v7 = v38;
        if (v23)
        {
          long long v24 = (void *)v23;
          char v25 = v17 ^ 1;
          long long v26 = [v40 objectForKeyedSubscript:v37];
          long long v27 = [(IPLanguageListManager *)v39 preferredLocale];
          long long v28 = [v27 countryCode];
          char v29 = [v26 isEqualToString:v28] | v25;

          id v5 = v35;
          uint64_t v7 = v38;

          if ((v29 & 1) == 0) {
            goto LABEL_20;
          }
        }
      }
      [v7 replaceObjectAtIndex:v9 withObject:v11];
LABEL_20:
      v8 |= v12;

      ++v9;
    }
    while (v9 < [v7 count]);
  }
  long long v30 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];
  uint64_t v31 = [v30 array];
  [v7 setArray:v31];

  v32 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v33 = [MEMORY[0x1E4F1CA20] localeIdentifierForRegionChange:v5];
  uint64_t v34 = [v32 localeWithLocaleIdentifier:v33];
  [(IPLanguageListManager *)v39 setPreferredLocale:v34];

  [(IPLanguageListManager *)v39 setPreferredLanguages:v7];
}

- (void)setPreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguages, a3);
  id v6 = a3;
  systemDisplayLanguage = self->_systemDisplayLanguage;
  self->_systemDisplayLanguage = 0;
}

- (NSString)deviceLanguage
{
  id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.Foundation"];
  v4 = [v3 localizations];

  id v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = [(IPLanguageListManager *)self preferredLanguages];
  uint64_t v7 = [v5 preferredLocalizationsFromArray:v4 forPreferences:v6];
  char v8 = [v7 firstObject];

  unint64_t v9 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v8];

  return (NSString *)v9;
}

- (NSString)systemDisplayLanguage
{
  v28[1] = *MEMORY[0x1E4F143B8];
  systemDisplayLanguage = self->_systemDisplayLanguage;
  if (systemDisplayLanguage) {
    goto LABEL_19;
  }
  v4 = [(IPLanguageListManager *)self deviceLanguage];
  id v5 = objc_opt_class();
  id v6 = [(IPLanguageListManager *)self preferredLanguages];
  uint64_t v7 = [v5 effectiveSystemLanguagesWithUnsupportedVariant:1 forPreferredLanguages:v6];
  char v8 = [v7 firstObject];

  unint64_t v9 = v4;
  id v10 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v8];
  uint64_t v11 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v9];
  int v12 = [v10 isEqualToString:v11];

  uint64_t v13 = v9;
  if (v12)
  {
    uint64_t v13 = v8;
  }
  if (v13)
  {
    long long v14 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v13];
    id v15 = [(id)objc_opt_class() regionalVariantLanguagesForBaseLanguage:v14];
    if ([v15 containsObject:v13])
    {
LABEL_18:
      char v25 = self->_systemDisplayLanguage;
      self->_systemDisplayLanguage = v13;
      long long v26 = v13;

      systemDisplayLanguage = self->_systemDisplayLanguage;
LABEL_19:
      uint64_t v19 = systemDisplayLanguage;
      goto LABEL_20;
    }
    uint64_t v16 = [(IPLanguageListManager *)self systemLanguages];
    char v17 = [v16 arrayByAddingObjectsFromArray:v15];

    if ([v17 containsObject:v13])
    {
      uint64_t v18 = 0;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28B50];
      v28[0] = v13;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      v22 = [v20 preferredLocalizationsFromArray:v17 forPreferences:v21];
      uint64_t v18 = [v22 firstObject];

      if ([(__CFString *)v18 isEqualToString:@"pt"])
      {

        uint64_t v18 = @"pt-BR";
      }
      else if (!v18)
      {
        goto LABEL_16;
      }
      if ([v17 containsObject:v18])
      {
        uint64_t v23 = v18;
        uint64_t v18 = v23;
LABEL_17:
        p_isa = &v23->isa;

        uint64_t v13 = p_isa;
        goto LABEL_18;
      }
    }
LABEL_16:
    uint64_t v23 = v14;
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    -[IPLanguageListManager systemDisplayLanguage]();
  }

  uint64_t v19 = 0;
LABEL_20:
  return v19;
}

+ (id)regionalVariantLanguagesForBaseLanguage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "renderableUILanguages", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (([v3 isEqualToString:v10] & 1) == 0)
        {
          uint64_t v11 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v10];
          if ([v3 isEqualToString:v11]) {
            [v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 sortUsingComparator:&__block_literal_global_4];
  return v4;
}

uint64_t __65__IPLanguageListManager_regionalVariantLanguagesForBaseLanguage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[IPLanguage languageWithIdentifier:a2];
  uint64_t v6 = [v5 localizedStringForName];

  uint64_t v7 = +[IPLanguage languageWithIdentifier:v4];

  uint64_t v8 = [v7 localizedStringForName];

  uint64_t v9 = [v6 localizedStandardCompare:v8];
  return v9;
}

+ (id)regionalVariantLanguagesForSystemLanguages
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages;
  if (!regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages)
  {
    id v4 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "baseSystemLanguages", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [a1 regionalVariantLanguagesForBaseLanguage:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
          [v4 addObjectsFromArray:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v11 = [v4 array];
    int v12 = (void *)regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages;
    regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages = v11;

    id v3 = (void *)regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages;
  }
  return v3;
}

+ (void)sortByLocalizedLanguage:(id)a3
{
}

uint64_t __49__IPLanguageListManager_sortByLocalizedLanguage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedStringForName];
  uint64_t v6 = [v4 localizedStringForName];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

+ (id)effectiveSystemLanguagesWithUnsupportedVariant:(BOOL)a3 forPreferredLanguages:(id)a4
{
  BOOL v25 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  unint64_t v5 = 0x1E4F1C000uLL;
  uint64_t v6 = [MEMORY[0x1E4F1CA20] systemLanguages];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      uint64_t v24 = v10;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        if (objc_msgSend(v6, "containsObject:", v13, v24))
        {
          [v7 addObject:v13];
        }
        else
        {
          long long v14 = [*(id *)(v5 + 2592) baseLanguageFromLanguage:v13];
          if ([v6 containsObject:v14]) {
            goto LABEL_10;
          }
          [*(id *)(v5 + 2592) baseSystemLanguages];
          uint64_t v15 = v11;
          long long v16 = v6;
          long long v17 = v7;
          id v18 = v8;
          v20 = unint64_t v19 = v5;
          int v21 = [v20 containsObject:v14];

          unint64_t v5 = v19;
          id v8 = v18;
          uint64_t v7 = v17;
          uint64_t v6 = v16;
          uint64_t v11 = v15;
          uint64_t v10 = v24;
          if (v21)
          {
LABEL_10:
            if (v25) {
              v22 = v13;
            }
            else {
              v22 = v14;
            }
            [v7 addObject:v22];
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  if (![v7 count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      +[IPLanguageListManager effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:]();
    }
    [v7 addObject:@"en-001"];
  }

  return v7;
}

+ (BOOL)canRemoveLanguages:(id)a3 fromPreferredLanguages:(id)a4
{
  id v5 = a3;
  uint64_t v6 = +[IPLanguageListManager effectiveSystemLanguagesWithUnsupportedVariant:1 forPreferredLanguages:a4];
  uint64_t v7 = (void *)[v6 mutableCopy];

  [v7 removeObjectsInArray:v5];
  LOBYTE(v6) = [v7 count] != 0;

  return (char)v6;
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (NSLocale)preferredLocale
{
  return self->_preferredLocale;
}

- (void)setPreferredLocale:(id)a3
{
}

- (NSArray)systemLanguages
{
  return self->_systemLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguages, 0);
  objc_storeStrong((id *)&self->_preferredLocale, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_systemDisplayLanguage, 0);
}

- (void)systemDisplayLanguage
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  v1 = "-[IPLanguageListManager systemDisplayLanguage]";
  _os_log_fault_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: systemDisplayLanguage is nil.", (uint8_t *)&v0, 0xCu);
}

+ (void)effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v0 = 136315394;
  v1 = "+[IPLanguageListManager effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:]";
  __int16 v2 = 2112;
  id v3 = @"en-001";
  _os_log_fault_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: effectiveSystemLanguages is empty. Falling back to [%@].", (uint8_t *)&v0, 0x16u);
}

@end