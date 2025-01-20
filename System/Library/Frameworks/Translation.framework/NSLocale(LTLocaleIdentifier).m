@interface NSLocale(LTLocaleIdentifier)
+ (id)lt_bestMatchForPreferredLocales:()LTLocaleIdentifier fromSupportedLocales:;
+ (id)lt_defaultTargetForSource:()LTLocaleIdentifier systemLocale:availableLocales:targetMap:;
+ (id)lt_fallbackForLocale:()LTLocaleIdentifier;
+ (id)lt_localeWithLTIdentifier:()LTLocaleIdentifier;
+ (id)lt_preferredLocales;
- (id)_ltCsLocaleIdentifier;
- (id)_ltLocaleIdentifier;
- (id)_vsLocaleIdentifier;
- (id)lt_nlLanguageCode;
- (uint64_t)_ltEqual:()LTLocaleIdentifier;
@end

@implementation NSLocale(LTLocaleIdentifier)

+ (id)lt_localeWithLTIdentifier:()LTLocaleIdentifier
{
  v4 = objc_msgSend(a3, "lt_localeIdentifier");
  v5 = [a1 localeWithLocaleIdentifier:v4];

  return v5;
}

- (id)_ltLocaleIdentifier
{
  v1 = [a1 localeIdentifier];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  return v2;
}

- (id)_ltCsLocaleIdentifier
{
  v1 = [a1 localeIdentifier];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  return v2;
}

- (id)_vsLocaleIdentifier
{
  v1 = [a1 localeIdentifier];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  return v2;
}

- (uint64_t)_ltEqual:()LTLocaleIdentifier
{
  id v4 = a3;
  v5 = [a1 _ltLocaleIdentifier];
  v6 = [v4 _ltLocaleIdentifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

- (id)lt_nlLanguageCode
{
  v1 = (void *)MEMORY[0x263EFF960];
  v2 = [a1 localeIdentifier];
  v3 = [v1 baseLanguageFromLanguage:v2];

  return v3;
}

+ (id)lt_preferredLocales
{
  v0 = [MEMORY[0x263EFF960] preferredLanguages];
  v1 = [v0 _ltCompactMap:&__block_literal_global_15];

  return v1;
}

+ (id)lt_bestMatchForPreferredLocales:()LTLocaleIdentifier fromSupportedLocales:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF960], "lt_preferredLocales");

    id v5 = (id)v7;
  }
  v8 = [v6 _ltCompactMap:&__block_literal_global_7_0];
  v9 = [v5 _ltCompactMap:&__block_literal_global_9_0];
  [MEMORY[0x263EFF960] matchedLanguagesFromAvailableLanguages:v8 forPreferredLanguages:v9];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        if (v15)
        {
          v22 = (void *)v15;
          id v16 = v10;
          goto LABEL_22;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v24 = v8;
    uint64_t v19 = *(void *)v26;
LABEL_13:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v26 != v19) {
        objc_enumerationMutation(v16);
      }
      v21 = [*(id *)(*((void *)&v25 + 1) + 8 * v20) _ltLocaleIdentifier];
      v22 = _LTLanguageCodeToSupportedLocale(v21, v6);

      if (v22) {
        break;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v18) {
          goto LABEL_13;
        }
        v22 = 0;
        break;
      }
    }
    v8 = v24;
  }
  else
  {
    v22 = 0;
  }
LABEL_22:

  return v22;
}

+ (id)lt_fallbackForLocale:()LTLocaleIdentifier
{
  v3 = (void *)MEMORY[0x263EFF960];
  id v4 = a3;
  id v5 = [v3 localeWithLocaleIdentifier:@"en_US"];
  id v6 = [[_LTLocalePair alloc] initWithSourceLocale:v4 targetLocale:v5];
  uint64_t v7 = [v4 _ltLocaleIdentifier];

  v8 = [v5 _ltLocaleIdentifier];
  if ([v7 isEqualToString:v8])
  {

LABEL_4:
    id v10 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"es_ES"];
    goto LABEL_6;
  }
  BOOL v9 = [(_LTLocalePair *)v6 isVariantPair];

  if (v9) {
    goto LABEL_4;
  }
  id v10 = v5;
LABEL_6:
  uint64_t v11 = v10;

  return v11;
}

+ (id)lt_defaultTargetForSource:()LTLocaleIdentifier systemLocale:availableLocales:targetMap:
{
  v65[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v13)
  {
    v49 = a1;
    id v52 = v12;
    id v54 = v11;
    uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v16 = [v15 URLForResource:@"DefaultTargets" withExtension:@"plist"];
    uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v16];
    id v62 = 0;
    uint64_t v18 = [MEMORY[0x263F08AC0] propertyListWithData:v17 options:0 format:0 error:&v62];
    id v19 = v62;
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    id v22 = v18;
    if (!v22
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v14 = v22, (objc_msgSend(v22, "lt_ensureTypesForKeys:values:", v20, v21) & 1) == 0))
    {

      v14 = 0;
    }

    if (!v14 || v19)
    {
      v23 = _LTOSLogAssets();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        +[NSLocale(LTLocaleIdentifier) lt_defaultTargetForSource:systemLocale:availableLocales:targetMap:]((uint64_t)v19, v23);
      }
    }

    id v12 = v52;
    id v11 = v54;
    a1 = v49;
    id v13 = 0;
  }
  v56 = [v11 regionCode];
  v24 = objc_msgSend(v14, "objectForKeyedSubscript:");
  long long v25 = [v24 objectForKeyedSubscript:@"source"];
  if (v25)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v26 = v25;
    }
    else {
      long long v26 = 0;
    }
  }
  else
  {
    long long v26 = 0;
  }
  id v27 = v26;

  long long v28 = [v24 objectForKeyedSubscript:@"target"];
  if (v28)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v29 = v28;
    }
    else {
      long long v29 = 0;
    }
  }
  else
  {
    long long v29 = 0;
  }
  id v30 = v29;

  v57 = v27;
  if (v14 && v24 && v27 && v30)
  {
    id v51 = v13;
    id v55 = v11;
    long long v31 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v27];
    v65[0] = v31;
    long long v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];
    uint64_t v33 = objc_msgSend(a1, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v32, v12);

    id v48 = v30;
    v34 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v30];
    v64 = v34;
    uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
    v36 = objc_msgSend(a1, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v35, v12);

    v37 = [MEMORY[0x263EFF980] array];
    if (v33 && ([v10 _ltEqual:v33] & 1) == 0) {
      [v37 addObject:v33];
    }
    v47 = (void *)v33;
    v50 = a1;
    id v53 = v12;
    if (v36) {
      [v37 addObject:v36];
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v38 = v37;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v59;
      while (2)
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v59 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v44 = [[_LTLocalePair alloc] initWithSourceLocale:v10 targetLocale:v43];
          if (![(_LTLocalePair *)v44 isVariantPair])
          {
            id v45 = v43;

            goto LABEL_41;
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v58 objects:v63 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }

    objc_msgSend(v50, "lt_fallbackForLocale:", v10);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

    id v12 = v53;
    id v11 = v55;
    id v13 = v51;
    id v30 = v48;
  }
  else
  {
    objc_msgSend(a1, "lt_fallbackForLocale:", v10);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v45;
}

+ (void)lt_defaultTargetForSource:()LTLocaleIdentifier systemLocale:availableLocales:targetMap:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24639B000, a2, OS_LOG_TYPE_ERROR, "Failed to read default target locale mapping: %@", (uint8_t *)&v2, 0xCu);
}

@end