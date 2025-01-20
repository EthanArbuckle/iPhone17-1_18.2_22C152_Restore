@interface BRLTTableEnumerator
+ (NSBundle)systemTranslatorBundle;
+ (id)defaultTableForLocale:(id)a3;
+ (id)defaultTablesArrayForLocale:(id)a3;
+ (id)localizedNameForLanguage:(id)a3;
+ (id)localizedNameForLanguageAgnosticTableIdentifier:(id)a3;
+ (id)localizedNameForServiceWithIdentifier:(id)a3;
+ (id)tableEnumeratorWithSystemBundlePath;
- (BRLTTableEnumerator)initWithTranslatorBundlesPath:(id)a3;
- (NSArray)translatorBundles;
- (NSMutableDictionary)languageAgnosticIdentifiersToTables;
- (NSSet)languageAgnosticTableIdentifiers;
- (NSSet)supportedLanguageLocales;
- (NSSet)supportedLocales;
- (NSString)translatorBundlePath;
- (id)languageAgnosticTablesForIdentifier:(id)a3 inBundle:(id)a4;
- (id)languageAgnosticTablesInBundle:(id)a3;
- (id)tablesForLocale:(id)a3 inBundle:(id)a4;
- (void)setLanguageAgnosticIdentifiersToTables:(id)a3;
- (void)setTranslatorBundlePath:(id)a3;
- (void)translatorBundles;
@end

@implementation BRLTTableEnumerator

+ (id)localizedNameForServiceWithIdentifier:(id)a3
{
  return BRLTLocalizedStringForKey(a3);
}

+ (id)localizedNameForLanguageAgnosticTableIdentifier:(id)a3
{
  return BRLTLocalizedStringForKey(a3);
}

+ (id)localizedNameForLanguage:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF960] currentLocale];
  v5 = [v4 localizedStringForLanguage:v3 context:3];
  if (![v5 length])
  {
    v6 = [NSString stringWithFormat:@"%@.language", v3];
    uint64_t v7 = BRLTLocalizedStringForKey(v6);

    v5 = (void *)v7;
  }

  return v5;
}

+ (id)defaultTableForLocale:(id)a3
{
  id v3 = [a1 defaultTablesArrayForLocale:a3];
  v4 = [v3 firstObject];

  return v4;
}

+ (id)defaultTablesArrayForLocale:(id)a3
{
  v48[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (defaultTablesArrayForLocale__onceToken != -1) {
    dispatch_once(&defaultTablesArrayForLocale__onceToken, &__block_literal_global_2);
  }
  v35 = [v4 collatorIdentifier];
  v5 = objc_msgSend((id)defaultTablesArrayForLocale__DefaultTables, "objectForKeyedSubscript:");
  if (v5) {
    goto LABEL_10;
  }
  id v6 = v35;
  uint64_t v7 = [v6 rangeOfString:@"-"];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7 + 1;
    v9 = [v6 substringFromIndex:v7 + 1];
    uint64_t v10 = [v9 rangeOfString:@"-"];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [v6 substringToIndex:v10 + v8];

      id v6 = (id)v11;
    }
  }
  v5 = [(id)defaultTablesArrayForLocale__DefaultTables objectForKeyedSubscript:v6];

  if (v5) {
    goto LABEL_10;
  }
  v12 = (void *)defaultTablesArrayForLocale__DefaultTables;
  v13 = [v4 languageCode];
  v5 = [v12 objectForKeyedSubscript:v13];

  if (v5) {
    goto LABEL_10;
  }
  v29 = [a1 systemTranslatorBundle];
  v30 = objc_msgSend(v29, "brl_supportedTablesForLocale:", v4);

  uint64_t v31 = [v30 firstObject];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [NSString stringWithFormat:@"%@.%@", @"com.apple.scrod.braille.table.duxbury", v31];

    v48[0] = v33;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];

    if (v5)
    {
LABEL_10:
      id v34 = v4;
      v14 = objc_opt_new();
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      obuint64_t j = v5;
      uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v37 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v43 != v37) {
              objc_enumerationMutation(obj);
            }
            v18 = [[BRLTTable alloc] initWithIdentifier:*(void *)(*((void *)&v42 + 1) + 8 * i)];
            v19 = [(BRLTTable *)v18 replacements];
            uint64_t v20 = [v19 count];

            if (v20)
            {
              long long v40 = 0u;
              long long v41 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              v21 = [(BRLTTable *)v18 replacements];
              uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v39;
                do
                {
                  for (uint64_t j = 0; j != v23; ++j)
                  {
                    if (*(void *)v39 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = [[BRLTTable alloc] initWithIdentifier:*(void *)(*((void *)&v38 + 1) + 8 * j)];
                    [v14 addObject:v26];
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
                }
                while (v23);
              }
            }
            else
            {
              [v14 addObject:v18];
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v16);
      }
      v27 = obj;

      id v4 = v34;
      goto LABEL_28;
    }
  }
  else
  {
  }
  v5 = [(id)defaultTablesArrayForLocale__DefaultTables objectForKeyedSubscript:@"en"];
  if (v5) {
    goto LABEL_10;
  }
  v27 = BRLTLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    +[BRLTTableEnumerator defaultTablesArrayForLocale:](v4);
  }
  v14 = (void *)MEMORY[0x263EFFA68];
LABEL_28:

  return v14;
}

void __51__BRLTTableEnumerator_defaultTablesArrayForLocale___block_invoke()
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v0 = [v3 pathForResource:@"DefaultTables" ofType:@"plist"];
  uint64_t v1 = [NSDictionary dictionaryWithContentsOfFile:v0];
  v2 = (void *)defaultTablesArrayForLocale__DefaultTables;
  defaultTablesArrayForLocale__DefaultTables = v1;
}

+ (NSBundle)systemTranslatorBundle
{
  return (NSBundle *)objc_msgSend(MEMORY[0x263F086E0], "brl_brailleTableBundleWithIdentifier:", @"com.apple.scrod.braille.table.duxbury");
}

+ (id)tableEnumeratorWithSystemBundlePath
{
  uint64_t v2 = MEMORY[0x263F21240];
  if (MEMORY[0x263F21240])
  {
    AXBrailleTablesDirectory();
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = @"/System/Library/ScreenReader/BrailleTables";
  }
  id v4 = v3;
  if (v2) {

  }
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTranslatorBundlesPath:v4];
  return v5;
}

- (BRLTTableEnumerator)initWithTranslatorBundlesPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTTableEnumerator;
  v5 = [(BRLTTableEnumerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    translatorBundlePath = v5->_translatorBundlePath;
    v5->_translatorBundlePath = (NSString *)v6;
  }
  return v5;
}

- (NSArray)translatorBundles
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  translatorBundles = self->_translatorBundles;
  if (translatorBundles)
  {
LABEL_2:
    id v3 = translatorBundles;
    goto LABEL_7;
  }
  v25 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = [(BRLTTableEnumerator *)self translatorBundlePath];
  id v30 = 0;
  uint64_t v7 = [v5 contentsOfDirectoryAtPath:v6 error:&v30];
  id v8 = v30;

  if (!v8)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v17 = [v16 pathExtension];
          int v18 = [v17 isEqualToString:@"brailletable"];

          if (v18)
          {
            v19 = [(BRLTTableEnumerator *)self translatorBundlePath];
            uint64_t v20 = [v19 stringByAppendingPathComponent:v16];

            v21 = [MEMORY[0x263F086E0] bundleWithPath:v20];
            if (v21)
            {
              [(NSArray *)v25 addObject:v21];
            }
            else
            {
              uint64_t v22 = BRLTLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v20;
                _os_log_error_impl(&dword_21C554000, v22, OS_LOG_TYPE_ERROR, "Error loading brailletable bundle at %@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v13);
    }

    uint64_t v23 = self->_translatorBundles;
    self->_translatorBundles = v25;
    uint64_t v24 = v25;

    translatorBundles = self->_translatorBundles;
    goto LABEL_2;
  }
  objc_super v9 = BRLTLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[BRLTTableEnumerator translatorBundles](self);
  }

  id v3 = 0;
LABEL_7:
  return v3;
}

- (NSSet)supportedLocales
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  supportedLocales = self->_supportedLocales;
  if (!supportedLocales)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [(BRLTTableEnumerator *)self translatorBundles];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "brl_supportedLocales");
          [(NSSet *)v4 unionSet:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    id v11 = self->_supportedLocales;
    self->_supportedLocales = v4;

    supportedLocales = self->_supportedLocales;
  }
  return supportedLocales;
}

- (NSSet)supportedLanguageLocales
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  supportedLanguageLocales = self->_supportedLanguageLocales;
  if (!supportedLanguageLocales)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = [(BRLTTableEnumerator *)self supportedLocales];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)MEMORY[0x263EFF960];
          id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) languageCode];
          uint64_t v12 = [v10 localeWithLocaleIdentifier:v11];

          [(NSSet *)v4 addObject:v12];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    long long v13 = self->_supportedLanguageLocales;
    self->_supportedLanguageLocales = v4;

    supportedLanguageLocales = self->_supportedLanguageLocales;
  }
  return supportedLanguageLocales;
}

- (NSSet)languageAgnosticTableIdentifiers
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(BRLTTableEnumerator *)self languageAgnosticIdentifiersToTables];
  id v4 = [v3 allKeys];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)languageAgnosticTablesInBundle:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_msgSend(v3, "brl_languageAgnosticTables");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
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
        uint64_t v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"-"];
        if ([v9 count] == 2)
        {
          uint64_t v10 = [v9 objectAtIndexedSubscript:1];
        }
        else
        {
          uint64_t v10 = 0;
        }
        id v11 = [BRLTTable alloc];
        uint64_t v12 = [v3 bundleIdentifier];
        long long v13 = [v9 objectAtIndexedSubscript:0];
        long long v14 = [(BRLTTable *)v11 initWithServiceIdentifier:v12 language:v13 variant:v10];

        [v4 addObject:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)languageAgnosticTablesForIdentifier:(id)a3 inBundle:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  uint64_t v9 = [(BRLTTableEnumerator *)self languageAgnosticTablesInBundle:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = [v14 language];
        int v16 = [v15 isEqualToString:v6];

        if (v16) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)tablesForLocale:(id)a3 inBundle:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x263EFF9C0] set];
  long long v20 = v5;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_msgSend(v6, "brl_supportedTablesForLocale:", v5);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) componentsSeparatedByString:@"-"];
        if ([v11 count] == 2)
        {
          uint64_t v12 = [v11 objectAtIndexedSubscript:1];
        }
        else
        {
          uint64_t v12 = 0;
        }
        long long v13 = [BRLTTable alloc];
        long long v14 = [v6 bundleIdentifier];
        long long v15 = [v11 objectAtIndexedSubscript:0];
        int v16 = [(BRLTTable *)v13 initWithServiceIdentifier:v14 language:v15 variant:v12];

        long long v17 = [(BRLTTable *)v16 replacements];
        uint64_t v18 = [v17 count];

        if (!v18) {
          [v21 addObject:v16];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  return v21;
}

- (NSMutableDictionary)languageAgnosticIdentifiersToTables
{
  uint64_t v2 = self;
  uint64_t v31 = *MEMORY[0x263EF8340];
  languageAgnosticIdentifiersToTables = self->_languageAgnosticIdentifiersToTables;
  if (!languageAgnosticIdentifiersToTables)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = [(BRLTTableEnumerator *)v2 translatorBundles];
    uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v20)
    {
      uint64_t v18 = *(void *)v26;
      long long v19 = v2;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(obj);
          }
          id v6 = [(BRLTTableEnumerator *)v2 languageAgnosticTablesInBundle:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v22 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * j);
                uint64_t v12 = [v11 language];
                long long v13 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v12];

                if (!v13)
                {
                  long long v13 = [MEMORY[0x263EFF9C0] set];
                  long long v14 = [v11 language];
                  [(NSMutableDictionary *)v4 setObject:v13 forKeyedSubscript:v14];
                }
                [v13 addObject:v11];
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v8);
          }

          uint64_t v2 = v19;
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v20);
    }

    long long v15 = v2->_languageAgnosticIdentifiersToTables;
    v2->_languageAgnosticIdentifiersToTables = v4;

    languageAgnosticIdentifiersToTables = v2->_languageAgnosticIdentifiersToTables;
  }
  return languageAgnosticIdentifiersToTables;
}

- (void)setLanguageAgnosticIdentifiersToTables:(id)a3
{
}

- (NSString)translatorBundlePath
{
  return self->_translatorBundlePath;
}

- (void)setTranslatorBundlePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translatorBundlePath, 0);
  objc_storeStrong((id *)&self->_languageAgnosticIdentifiersToTables, 0);
  objc_storeStrong((id *)&self->_supportedLanguageLocales, 0);
  objc_storeStrong((id *)&self->_supportedLocales, 0);
  objc_storeStrong((id *)&self->_translatorBundles, 0);
}

+ (void)defaultTablesArrayForLocale:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 localeIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C554000, v2, v3, "Couldn't find any table for locale %@ (identifiers: %@)", v4, v5, v6, v7, v8);
}

- (void)translatorBundles
{
  uint64_t v1 = [a1 translatorBundlePath];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C554000, v2, v3, "Couldn't get contents of %@: %@", v4, v5, v6, v7, v8);
}

@end