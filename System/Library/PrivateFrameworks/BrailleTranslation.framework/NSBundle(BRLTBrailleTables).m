@interface NSBundle(BRLTBrailleTables)
+ (id)brl_brailleTableBundleWithIdentifier:()BRLTBrailleTables;
- (id)brl_brailleTablesDictionary;
- (id)brl_languageAgnosticTables;
- (id)brl_supportedLocales;
- (id)brl_supportedLocalesForTableWithIdentifier:()BRLTBrailleTables;
- (id)brl_supportedTablesForLocale:()BRLTBrailleTables;
- (uint64_t)brl_tableIsLanguageAgnosticWithIdentifier:()BRLTBrailleTables;
- (void)brl_brailleTablesDictionary;
@end

@implementation NSBundle(BRLTBrailleTables)

+ (id)brl_brailleTableBundleWithIdentifier:()BRLTBrailleTables
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[BRLTTableEnumerator tableEnumeratorWithSystemBundlePath];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(v4, "translatorBundles", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 bundleIdentifier];
        char v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)brl_brailleTablesDictionary
{
  v1 = [a1 objectForInfoDictionaryKey:@"BrailleTables"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v3 = BRLTLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(NSBundle(BRLTBrailleTables) *)(uint64_t)v1 brl_brailleTablesDictionary];
    }

    id v2 = 0;
  }
  else
  {
    id v2 = v1;
  }

  return v2;
}

- (id)brl_supportedLocales
{
  v1 = a1;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(a1, "brl_brailleTablesDictionary");
  id v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      uint64_t v17 = v5;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * v7);
        if ((objc_msgSend(v1, "brl_tableIsLanguageAgnosticWithIdentifier:", v8, v17) & 1) == 0)
        {
          v9 = v1;
          v10 = objc_msgSend(v1, "brl_supportedLocalesForTableWithIdentifier:", v8);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:*(void *)(*((void *)&v19 + 1) + 8 * i)];
                if (v15) {
                  [v3 addObject:v15];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }

          uint64_t v5 = v17;
          v1 = v9;
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)brl_supportedTablesForLocale:()BRLTBrailleTables
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30 = a1;
  uint64_t v5 = objc_msgSend(a1, "brl_brailleTablesDictionary");
  id v6 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v7;
        uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8 * v7);
        v9 = objc_msgSend(v30, "brl_supportedLocalesForTableWithIdentifier:", v8);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v33 = v9;
        uint64_t v35 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v35)
        {
          uint64_t v34 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v37 != v34) {
                objc_enumerationMutation(v33);
              }
              uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v12 = (void *)MEMORY[0x263EFF960];
              uint64_t v13 = [v4 languageCode];
              long long v14 = [v12 localeWithLocaleIdentifier:v13];

              long long v15 = [v4 localeIdentifier];
              long long v16 = __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v15, v15);
              uint64_t v17 = __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v16, v11);
              int v18 = [v16 isEqualToString:v17];

              if (v18)
              {
                if ([v6 containsObject:v8]) {
                  [v6 removeObject:v8];
                }
                [v6 insertObject:v8 atIndex:0];
              }
              else
              {
                long long v19 = [v4 languageCode];
                long long v20 = __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v19, v19);
                long long v21 = __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v20, v11);
                int v22 = [v20 isEqualToString:v21];

                if (v22) {
                  goto LABEL_17;
                }
                long long v23 = [v14 languageCode];
                long long v24 = __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v23, v23);
                long long v25 = __60__NSBundle_BRLTBrailleTables__brl_supportedTablesForLocale___block_invoke((uint64_t)v24, v11);
                int v26 = [v24 isEqualToString:v25];

                if (v26)
                {
LABEL_17:
                  if (([v6 containsObject:v8] & 1) == 0) {
                    [v6 addObject:v8];
                  }
                }
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v35);
        }

        uint64_t v7 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v31);
  }

  return v6;
}

- (id)brl_languageAgnosticTables
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(a1, "brl_brailleTablesDictionary");
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(a1, "brl_tableIsLanguageAgnosticWithIdentifier:", v9, (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)brl_supportedLocalesForTableWithIdentifier:()BRLTBrailleTables
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "brl_brailleTablesDictionary");
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"languages"];

  return v7;
}

- (uint64_t)brl_tableIsLanguageAgnosticWithIdentifier:()BRLTBrailleTables
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "brl_brailleTablesDictionary");
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"languageAgnostic"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = [v7 BOOLValue];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)brl_brailleTablesDictionary
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 138412546;
  uint64_t v5 = @"BrailleTables";
  __int16 v6 = 2112;
  id v7 = (id)objc_opt_class();
  id v3 = v7;
  _os_log_error_impl(&dword_21C554000, a2, OS_LOG_TYPE_ERROR, "Expected NSDictionary for %@ key, but found %@ instead.", (uint8_t *)&v4, 0x16u);
}

@end