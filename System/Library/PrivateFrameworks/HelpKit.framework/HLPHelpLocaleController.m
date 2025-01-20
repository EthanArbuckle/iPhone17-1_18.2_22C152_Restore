@interface HLPHelpLocaleController
- (HLPHelpLocaleController)initWithURL:(id)a3;
- (NSArray)locales;
- (NSArray)preferredLanguagesOverride;
- (id)currentLocale;
- (id)englishLocale;
- (id)localeWithPreferredLanguages:(id)a3;
- (void)processData:(id)a3 formattedData:(id)a4;
- (void)processFileURLWithCompletionHandler:(id)a3;
- (void)setLocales:(id)a3;
- (void)setPreferredLanguagesOverride:(id)a3;
@end

@implementation HLPHelpLocaleController

- (HLPHelpLocaleController)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HLPHelpLocaleController;
  v5 = [(HLPRemoteDataController *)&v11 initWithURL:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(HLPRemoteDataController *)v5 URL];
    char v8 = [v7 isFileURL];

    if ((v8 & 1) == 0)
    {
      v9 = [v4 URLByAppendingPathComponent:@"locale-list.json"];
      [(HLPRemoteDataController *)v6 setURL:v9];
    }
  }

  return v6;
}

- (void)processFileURLWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [(HLPRemoteDataController *)self URL];
  v7 = [v6 path];
  id v19 = 0;
  char v8 = [v5 contentsOfDirectoryAtPath:v7 error:&v19];
  id v9 = v19;

  if (v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke;
    block[3] = &unk_2645796F8;
    id v18 = v4;
    id v17 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v10 = v18;
  }
  else
  {
    objc_super v11 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_264578E18;
    v14[4] = self;
    id v15 = v11;
    id v10 = v11;
    [v8 enumerateObjectsUsingBlock:v14];
    [(HLPHelpLocaleController *)self processData:0 formattedData:v10];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_264578C30;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

uint64_t __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0);
}

void __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [v15 pathExtension];
  int v4 = [v3 isEqualToString:@"lproj"];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) URL];
    v6 = [v5 URLByAppendingPathComponent:v15];

    v7 = [v6 URLByAppendingPathComponent:@"locale-info.json"];

    if ([v7 checkResourceIsReachableAndReturnError:0])
    {
      char v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v7];
      id v9 = NSDictionary;
      id v10 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:0];
      objc_super v11 = [v9 dictionaryWithDictionary:v10];

      v12 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11];
      if ([v12 count])
      {
        id v13 = [v12 objectForKeyedSubscript:@"meta"];
        v14 = [v13 objectForKeyedSubscript:@"isoCodes"];
        [v12 setObject:v14 forKeyedSubscript:@"isoCodes"];

        [v12 setObject:v15 forKeyedSubscript:@"folder"];
        [*(id *)(a1 + 40) addObject:v12];
      }
    }
  }
}

uint64_t __63__HLPHelpLocaleController_processFileURLWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoading:0];
  [*(id *)(a1 + 32) setHasLoaded:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)processData:(id)a3 formattedData:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = (void *)MEMORY[0x263EFFA68];
    v7 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
    char v8 = (void *)[v6 mutableCopy];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __53__HLPHelpLocaleController_processData_formattedData___block_invoke;
    id v17 = &unk_264579720;
    id v18 = v7;
    id v19 = v8;
    id v9 = v8;
    id v10 = v7;
    [v5 enumerateObjectsUsingBlock:&v14];
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v10, v14, v15, v16, v17);
    objc_super v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    supportedLanguageCodes = self->_supportedLanguageCodes;
    self->_supportedLanguageCodes = v11;

    id v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
    [(HLPHelpLocaleController *)self setLocales:v13];
  }
}

void __53__HLPHelpLocaleController_processData_formattedData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = [[HLPHelpLocale alloc] initWithDictionary:v3];

  int v4 = *(void **)(a1 + 32);
  id v5 = [(HLPHelpLocale *)v6 isoCodes];
  [v4 addObjectsFromArray:v5];

  [*(id *)(a1 + 40) addObject:v6];
}

- (id)englishLocale
{
  v2 = objc_alloc_init(HLPHelpLocale);
  [(HLPHelpLocale *)v2 setPath:@"en.lproj"];
  [(HLPHelpLocale *)v2 setIsoCodes:&unk_26D2A85E0];
  return v2;
}

- (id)localeWithPreferredLanguages:(id)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  id v13 = a3;
  int v4 = (void *)[v13 mutableCopy];
  do
  {
    if (![v4 count]) {
      break;
    }
    id v5 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:self->_supportedLanguageCodes forPreferences:v4];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__HLPHelpLocaleController_localeWithPreferredLanguages___block_invoke;
    v14[3] = &unk_264578FA0;
    v14[4] = self;
    void v14[5] = &v15;
    [v5 enumerateObjectsUsingBlock:v14];
    [v4 removeObjectAtIndex:0];
    uint64_t v6 = v16[5];
  }
  while (!v6);
  if (!v16[5])
  {
    v7 = [0 path];
    uint64_t v8 = [v7 length];

    if (!v8)
    {
      id v9 = objc_alloc_init(HLPHelpLocale);
      id v10 = (void *)v16[5];
      v16[5] = (uint64_t)v9;

      [(id)v16[5] setPath:@"en.lproj"];
      [(id)v16[5] setIsoCodes:&unk_26D2A85F8];
    }
  }
  id v11 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __56__HLPHelpLocaleController_localeWithPreferredLanguages___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 lowercaseString];
  v7 = [*(id *)(a1 + 32) locales];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__HLPHelpLocaleController_localeWithPreferredLanguages___block_invoke_2;
  v10[3] = &unk_264579748;
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v8;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void __56__HLPHelpLocaleController_localeWithPreferredLanguages___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  v7 = [v9 isoCodes];
  uint64_t v8 = [v7 indexOfObject:*(void *)(a1 + 32)];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)currentLocale
{
  id v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  int v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = [v4 objectForKey:@"HLPHelpBookPreferredLanguageOverride"];

  if (v5) {
    [v3 addObject:v5];
  }
  uint64_t v6 = [(HLPHelpLocaleController *)self preferredLanguagesOverride];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(HLPHelpLocaleController *)self preferredLanguagesOverride];
    [v3 addObjectsFromArray:v8];
  }
  id v9 = [MEMORY[0x263EFF960] preferredLanguages];
  [v3 addObjectsFromArray:v9];

  id v10 = [(HLPHelpLocaleController *)self localeWithPreferredLanguages:v3];

  return v10;
}

- (NSArray)preferredLanguagesOverride
{
  return self->_preferredLanguagesOverride;
}

- (void)setPreferredLanguagesOverride:(id)a3
{
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_preferredLanguagesOverride, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_storeStrong((id *)&self->_supportedLanguageCodes, 0);
}

@end