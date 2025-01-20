@interface IP_unsupportedVariantsAddedByKeyboards_migrator
- (id)migrateForPreferences:(id)a3 keyboards:(id)a4;
- (id)performMigrationForPreferences:(id)a3;
@end

@implementation IP_unsupportedVariantsAddedByKeyboards_migrator

- (id)migrateForPreferences:(id)a3 keyboards:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = IPUIKeyboardInputModeGetLanguageWithRegion(*(void **)(*((void *)&v45 + 1) + 8 * i));
        v14 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v13];
        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v10);
  }
  v38 = v7;
  v35 = v8;

  v34 = (void *)[v5 mutableCopy];
  v15 = objc_msgSend(v5, "objectForKeyedSubscript:");
  v37 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v15];
  v16 = (void *)MEMORY[0x1E4F1CA20];
  v36 = v5;
  v17 = [v5 objectForKeyedSubscript:@"AppleLocale"];
  v18 = [v16 componentsFromLocaleIdentifier:v17];
  uint64_t v19 = *MEMORY[0x1E4F1C400];
  v20 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F1C400]];

  v21 = +[IPLanguageListManager effectiveSystemLanguagesWithUnsupportedVariant:1 forPreferredLanguages:v15];
  v39 = [v21 firstObject];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v15;
  uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v42 != v24) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        v27 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v26];
        v28 = [v27 objectForKeyedSubscript:v19];

        if (([v28 isEqualToString:v20] & 1) == 0
          && ([v26 isEqualToString:v39] & 1) == 0)
        {
          v29 = [MEMORY[0x1E4F1CA20] systemLanguages];
          char v30 = [v29 containsObject:v26];

          if ((v30 & 1) == 0)
          {
            if ([v38 containsObject:v26])
            {
              v31 = [MEMORY[0x1E4F1CA20] languageFromLanguage:v26 byReplacingRegion:v20];
              if ([v37 containsObject:v31]) {
                [v37 removeObject:v26];
              }
              else {
                objc_msgSend(v37, "replaceObjectAtIndex:withObject:", objc_msgSend(v37, "indexOfObject:", v26), v31);
              }
            }
          }
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v23);
  }

  v32 = [v37 array];
  [v34 setObject:v32 forKeyedSubscript:@"AppleLanguages"];

  return v34;
}

- (id)performMigrationForPreferences:(id)a3
{
  id v4 = a3;
  if ([(ISMigrator *)self previousSchemaVersion] >= 0x7D0)
  {
    id v7 = v4;
  }
  else
  {
    id v5 = [(objc_class *)IPUIKeyboardInputModeController() sharedInputModeController];
    id v6 = [v5 enabledInputModeIdentifiers];

    id v7 = [(IP_unsupportedVariantsAddedByKeyboards_migrator *)self migrateForPreferences:v4 keyboards:v6];
  }
  return v7;
}

@end