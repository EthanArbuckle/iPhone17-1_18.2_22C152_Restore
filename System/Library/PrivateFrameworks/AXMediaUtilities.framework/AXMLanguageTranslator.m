@interface AXMLanguageTranslator
+ (id)allowedTargetLocalesForTranslation;
- (AXMLanguageTranslator)init;
- (_LTTranslator)translator;
- (id)_canonicalLocaleForLocale:(id)a3;
- (id)_canonicalLocalesForLocales:(id)a3;
- (id)_descriptionForLocales:(id)a3;
- (id)_filteredLocalesToInstallFromAvailableLocales:(id)a3 requestedLocales:(id)a4 fallBackToBaseLanguageIfNeeded:(BOOL)a5;
- (id)_localeIdentifiersForLocales:(id)a3;
- (id)_proposedTranslationLocaleForLocale:(id)a3;
- (id)translateText:(id)a3 toLocale:(id)a4 respectAllowList:(BOOL)a5 metrics:(id)a6 error:(id *)a7;
- (void)availableTranslationLocales:(id)a3;
- (void)installOfflineTranslationModelForLanguageCodeIfNeeded:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)installOfflineTranslationModelForLocales:(id)a3 fallBackToBaseLanguageIfNeeded:(BOOL)a4 forceReinstall:(BOOL)a5 progress:(id)a6 completion:(id)a7;
- (void)installedTranslationLocales:(id)a3;
- (void)setTranslator:(id)a3;
- (void)translateText:(id)a3 toLocale:(id)a4 respectAllowList:(BOOL)a5 completion:(id)a6;
- (void)userSelectableTranslationLocales:(id)a3;
@end

@implementation AXMLanguageTranslator

- (AXMLanguageTranslator)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXMLanguageTranslator;
  result = [(AXMLanguageTranslator *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)allowedTargetLocalesForTranslation
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"zh_CN"];
  v15[0] = v14;
  v13 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  v15[1] = v13;
  v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"it_IT"];
  v15[2] = v2;
  objc_super v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"ja_JP"];
  v15[3] = v3;
  v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"ar_AE"];
  v15[4] = v4;
  v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"de_DE"];
  v15[5] = v5;
  v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"es_ES"];
  v15[6] = v6;
  v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"fr_FR"];
  v15[7] = v7;
  v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"ru_RU"];
  v15[8] = v8;
  v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"pt_BR"];
  v15[9] = v9;
  v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"ko_KR"];
  v15[10] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

- (id)_proposedTranslationLocaleForLocale:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[AXMLanguageTranslator allowedTargetLocalesForTranslation];
  if ([v4 containsObject:v3])
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[AXMLocSupport sharedInstance];
    id v5 = [v6 localeMatchingBaseLanguageOfLocale:v3 fromLocales:v4];
  }
  v7 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v3 localeIdentifier];
    v9 = [v5 localeIdentifier];
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEFAULT, "inLocale: '%@' proposed: '%@'", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

- (void)availableTranslationLocales:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_DEFAULT, "Requesting available translation locales", buf, 2u);
  }

  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  uint64_t v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  location[1] = (id)MEMORY[0x1E4F143A8];
  location[2] = (id)3221225472;
  location[3] = __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke;
  location[4] = &unk_1E6116EC0;
  location[5] = self;
  location[6] = buf;
  AX_PERFORM_WITH_LOCK();
  if ([*((id *)v12 + 5) count])
  {
    v4[2](v4, *((void *)v12 + 5));
  }
  else
  {
    objc_initWeak(location, self);
    id LTTranslatorClass = get_LTTranslatorClass();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke_2;
    v7[3] = &unk_1E6117710;
    objc_copyWeak(&v9, location);
    v8 = v4;
    [LTTranslatorClass availableLocalePairsForTask:1 completion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  _Block_object_dispose(buf, 8);
}

void __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v27 = +[AXMLanguageTranslator allowedTargetLocalesForTranslation];
  uint64_t v24 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = +[AXMLocSupport sharedInstance];
  v6 = objc_msgSend(v5, "en_USLocale");
  v26 = [v4 setWithObject:v6];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "sourceLocale", v24);
        v14 = +[AXMLocSupport sharedInstance];
        uint64_t v15 = objc_msgSend(v14, "en_USLocale");
        int v16 = [v13 isEquivalentTo:v15];

        if (v16)
        {
          v17 = [v12 targetLocale];
          if (v17)
          {
            if ([v27 containsObject:v17])
            {
              [v26 addObject:v17];
            }
            else
            {
              v18 = AXMediaLogLanguageTranslation();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                v19 = [v17 localeIdentifier];
                *(_DWORD *)buf = 138412290;
                v33 = v19;
                _os_log_impl(&dword_1B57D5000, v18, OS_LOG_TYPE_INFO, "Filtering available locale. Not allowed: %@", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v9);
  }

  v20 = [v26 allObjects];
  v21 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [WeakRetained _descriptionForLocales:v20];
    *(_DWORD *)buf = 138412290;
    v33 = v22;
    _os_log_impl(&dword_1B57D5000, v21, OS_LOG_TYPE_DEFAULT, "Available translation locales: %@", buf, 0xCu);
  }
  id v23 = v20;
  AX_PERFORM_WITH_LOCK();
  (*(void (**)(void))(*(void *)(v24 + 32) + 16))();
}

void __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke_63(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (void)userSelectableTranslationLocales:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AXMLanguageTranslator_userSelectableTranslationLocales___block_invoke;
  v6[3] = &unk_1E6117758;
  id v7 = v4;
  id v5 = v4;
  [(AXMLanguageTranslator *)self availableTranslationLocales:v6];
}

void __58__AXMLanguageTranslator_userSelectableTranslationLocales___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ax_filteredArrayUsingBlock:", &__block_literal_global_9);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__AXMLanguageTranslator_userSelectableTranslationLocales___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AXMLocSupport sharedInstance];
  id v4 = objc_msgSend(v3, "en_USLocale");
  int v5 = [v2 isEquivalentTo:v4];

  return v5 ^ 1u;
}

- (void)installedTranslationLocales:(id)a3
{
  id v4 = a3;
  int v5 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_DEFAULT, "Requesting installed translation locales", buf, 2u);
  }

  id LTTranslatorClass = get_LTTranslatorClass();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__AXMLanguageTranslator_installedTranslationLocales___block_invoke;
  v8[3] = &unk_1E6117780;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [LTTranslatorClass installedLocales:v8];
}

void __53__AXMLanguageTranslator_installedTranslationLocales___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _descriptionForLocales:v3];
  int v5 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_DEFAULT, "Installed translation locales: %@", buf, 0xCu);
  }

  v6 = [MEMORY[0x1E4F47E18] store];
  v13[0] = v4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", @"locales", @"date");
  v13[1] = v7;
  v12[2] = @"process";
  uint64_t v8 = [MEMORY[0x1E4F28F80] processInfo];
  id v9 = [v8 processName];
  v13[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  [v6 setValue:v10 forKey:@"InstalledTranslationLocales" forAssetType:*MEMORY[0x1E4F47E68]];

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (void)installOfflineTranslationModelForLocales:(id)a3 fallBackToBaseLanguageIfNeeded:(BOOL)a4 forceReinstall:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(AXMLanguageTranslator *)self _descriptionForLocales:v11];
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEFAULT, "Requesting installation of translation assets: %@", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke;
  v19[3] = &unk_1E6117820;
  v19[4] = self;
  id v20 = v11;
  BOOL v23 = a4;
  id v21 = v13;
  id v22 = v12;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  [(AXMLanguageTranslator *)self availableTranslationLocales:v19];
}

void __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) _filteredLocalesToInstallFromAvailableLocales:a2 requestedLocales:*(void *)(a1 + 40) fallBackToBaseLanguageIfNeeded:*(unsigned __int8 *)(a1 + 64)];
  id v4 = (void *)[v3 mutableCopy];

  if ([v4 count])
  {
    int v5 = +[AXMLocSupport sharedInstance];
    v6 = objc_msgSend(v5, "en_USLocale");
    char v7 = [v4 containsObject:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = +[AXMLocSupport sharedInstance];
      id v9 = objc_msgSend(v8, "en_USLocale");
      [v4 addObject:v9];
    }
    uint64_t v10 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 32) _descriptionForLocales:v4];
      *(_DWORD *)buf = 138412290;
      long long v30 = v11;
      _os_log_impl(&dword_1B57D5000, v10, OS_LOG_TYPE_DEFAULT, "Requesting installation of translation assets after processing: %@", buf, 0xCu);
    }
    id v12 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_85;
    v24[3] = &unk_1E61177F8;
    id v13 = v4;
    uint64_t v14 = *(void *)(a1 + 32);
    id v25 = v13;
    uint64_t v26 = v14;
    id v27 = *(id *)(a1 + 56);
    id v28 = *(id *)(a1 + 48);
    [v12 installedTranslationLocales:v24];
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = [*(id *)(a1 + 32) _descriptionForLocales:*(void *)(a1 + 40)];
    BOOL v23 = _AXMMakeError(0, @"Requested locales '%@' not available to install", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v23);
  }
}

void __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_85(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  if ([v3 count]) {
    [v4 addObjectsFromArray:v3];
  }
  [v4 addObjectsFromArray:*(void *)(a1 + 32)];
  int v5 = [v4 allObjects];
  v6 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = [*(id *)(a1 + 40) _descriptionForLocales:v5];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1B57D5000, v6, OS_LOG_TYPE_DEFAULT, "Requesting installation of translation assets after combining with currently installed: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v8 = (void *)get_LTInstallRequestClass_softClass;
  uint64_t v20 = get_LTInstallRequestClass_softClass;
  if (!get_LTInstallRequestClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v22 = __get_LTInstallRequestClass_block_invoke;
    BOOL v23 = &unk_1E6116AD8;
    uint64_t v24 = &v17;
    __get_LTInstallRequestClass_block_invoke((uint64_t)&buf);
    uint64_t v8 = (void *)v18[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v17, 8);
  id v10 = [v9 alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_86;
  v15[3] = &unk_1E61177A8;
  id v16 = *(id *)(a1 + 48);
  id v11 = (void *)[v10 initWithLocales:v5 useCellular:0 progressHandler:v15];
  id LTTranslatorClass = get_LTTranslatorClass();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_2;
  void v13[3] = &unk_1E61177D0;
  id v14 = *(id *)(a1 + 56);
  [LTTranslatorClass installOfflineLocales:v11 completion:v13];
}

void __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (*(void *)(a1 + 32))
  {
    id v19 = v6;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = objc_alloc_init(AXMTranslationModelInstallStatus);
          id v16 = [v14 localeIdentifier];
          [(AXMTranslationModelInstallStatus *)v15 setLocaleIdentifier:v16];

          uint64_t v17 = [v14 progress];
          [v17 fractionCompleted];
          [(AXMTranslationModelInstallStatus *)v15 setProgress:(uint64_t)v18];

          -[AXMTranslationModelInstallStatus setState:](v15, "setState:", [v14 offlineState]);
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    char v7 = v19;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_filteredLocalesToInstallFromAvailableLocales:(id)a3 requestedLocales:(id)a4 fallBackToBaseLanguageIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v27;
    *(void *)&long long v12 = 138412290;
    long long v25 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v16, v25, (void)v26))
        {
          [v9 addObject:v16];
        }
        else
        {
          if (!v5) {
            goto LABEL_15;
          }
          uint64_t v17 = AXMediaLogLanguageTranslation();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            double v18 = [v16 localeIdentifier];
            *(_DWORD *)long long buf = v25;
            uint64_t v31 = v18;
            _os_log_impl(&dword_1B57D5000, v17, OS_LOG_TYPE_DEFAULT, "No exact match for translation asset matching '%@'. falling back to base language", buf, 0xCu);
          }
          id v19 = +[AXMLocSupport sharedInstance];
          long long v20 = [v19 localeMatchingBaseLanguageOfLocale:v16 fromLocales:v7];

          if (v20)
          {
            long long v21 = AXMediaLogLanguageTranslation();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = [v20 localeIdentifier];
              *(_DWORD *)long long buf = v25;
              uint64_t v31 = v22;
              _os_log_impl(&dword_1B57D5000, v21, OS_LOG_TYPE_DEFAULT, "Found fallback locale: %@", buf, 0xCu);
            }
            [v9 addObject:v20];
          }
          else
          {
LABEL_15:
            long long v20 = AXMediaLogLanguageTranslation();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              long long v23 = [v16 localeIdentifier];
              *(_DWORD *)long long buf = v25;
              uint64_t v31 = v23;
              _os_log_impl(&dword_1B57D5000, v20, OS_LOG_TYPE_DEFAULT, "Cannot install requested translation locale '%@'. Not available", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v13);
  }

  return v9;
}

- (void)installOfflineTranslationModelForLanguageCodeIfNeeded:(id)a3 progress:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v11 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v27 = v8;
    _os_log_impl(&dword_1B57D5000, v11, OS_LOG_TYPE_DEFAULT, "Requesting install of translation asset for languageCode: %@", buf, 0xCu);
  }

  long long v12 = +[AXMLocSupport sharedInstance];
  uint64_t v13 = [v12 localeForLanguageCode:v8];

  if (v13)
  {
    long long v20 = +[AXMLocSupport sharedInstance];
    int v21 = [v20 localeBaseLanguageIsEnglish:v13];

    if (v21)
    {
      long long v22 = AXMediaLogLanguageTranslation();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B57D5000, v22, OS_LOG_TYPE_DEFAULT, "Locale base language is English. no download required", buf, 2u);
      }

      if (v10) {
        v10[2](v10, 0);
      }
    }
    else
    {
      long long v25 = v13;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [(AXMLanguageTranslator *)self installOfflineTranslationModelForLocales:v24 fallBackToBaseLanguageIfNeeded:1 forceReinstall:0 progress:v9 completion:v10];
    }
  }
  else if (v10)
  {
    long long v23 = _AXMMakeError(0, @"No locale produced for language code: %@", v14, v15, v16, v17, v18, v19, (uint64_t)v8);
    ((void (**)(id, void *))v10)[2](v10, v23);
  }
}

- (void)translateText:(id)a3 toLocale:(id)a4 respectAllowList:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11)
  {
    if (!v7)
    {
      uint64_t v13 = v11;
      goto LABEL_9;
    }
    uint64_t v13 = [(AXMLanguageTranslator *)self _proposedTranslationLocaleForLocale:v11];
    if (v13)
    {

LABEL_9:
      int v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2050000000;
      long long v22 = (void *)get_LTTextTranslationRequestClass_softClass;
      uint64_t v47 = get_LTTextTranslationRequestClass_softClass;
      if (!get_LTTextTranslationRequestClass_softClass)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __get_LTTextTranslationRequestClass_block_invoke;
        v49 = &unk_1E6116AD8;
        v50 = &v44;
        __get_LTTextTranslationRequestClass_block_invoke((uint64_t)buf);
        long long v22 = (void *)v45[3];
      }
      long long v23 = v22;
      _Block_object_dispose(&v44, 8);
      uint64_t v24 = (void *)[[v23 alloc] initWithSourceLocale:v21 targetLocale:v13];
      [v24 setTaskHint:1];
      [v24 setCensorSpeech:0];
      [v24 setForcedOfflineTranslation:1];
      long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];
      [v24 setText:v25];

      long long v26 = AXMediaLogLanguageTranslation();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v21 localeIdentifier];
        uint64_t v28 = [v13 localeIdentifier];
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2112;
        v49 = v10;
        _os_log_impl(&dword_1B57D5000, v26, OS_LOG_TYPE_DEFAULT, "Will translate from: '%@' to '%@' : %@", buf, 0x20u);
      }
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __76__AXMLanguageTranslator_translateText_toLocale_respectAllowList_completion___block_invoke;
      v42[3] = &unk_1E6117848;
      id v43 = v12;
      [v24 setTextTranslationHandler:v42];
      long long v29 = [(AXMLanguageTranslator *)self translator];
      [v29 translate:v24];

      id v11 = v13;
      goto LABEL_14;
    }
    long long v30 = NSString;
    uint64_t v31 = [v11 localeIdentifier];
    v32 = [v30 stringWithFormat:@"No suitable proposed locale for given target: %@", v31];

    uint64_t v33 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_impl(&dword_1B57D5000, v33, OS_LOG_TYPE_DEFAULT, "Will not perform translation. %@", buf, 0xCu);
    }

    v40 = _AXMMakeError(0, @"%@", v34, v35, v36, v37, v38, v39, (uint64_t)v32);
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v40);
  }
  else
  {
    uint64_t v14 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEFAULT, "Will not perform translation. No target locale was provided", buf, 2u);
    }

    _AXMMakeError(0, @"No target locale was provided", v15, v16, v17, v18, v19, v20, v41);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v11);
  }
LABEL_14:
}

void __76__AXMLanguageTranslator_translateText_toLocale_respectAllowList_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long v22 = 138412802;
    *(void *)&v22[4] = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_1B57D5000, v10, OS_LOG_TYPE_DEFAULT, "Did finish translation. Translation text: '%@'. result: '%@'. Error?: '%@'", v22, 0x20u);
  }

  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v11 = [v8 translations];
    id v12 = [v11 firstObject];

    if (v12)
    {
      uint64_t v19 = objc_alloc_init(AXMTranslatedText);
      uint64_t v20 = [v12 formattedString];
      [(AXMTranslatedText *)v19 setText:v20];

      [v12 confidence];
      -[AXMTranslatedText setConfidence:](v19, "setConfidence:");
      -[AXMTranslatedText setLowConfidence:](v19, "setLowConfidence:", [v12 isLowConfidence]);
      int v21 = [v8 locale];
      [(AXMTranslatedText *)v19 setTargetLocale:v21];
    }
    else
    {
      _AXMMakeError(0, @"Could not produce translation", v13, v14, v15, v16, v17, v18, *(uint64_t *)v22);
      uint64_t v19 = (AXMTranslatedText *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)translateText:(id)a3 toLocale:(id)a4 respectAllowList:(BOOL)a5 metrics:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__4;
  uint64_t v38 = __Block_byref_object_dispose__4;
  id v39 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  uint64_t v16 = [v14 startMeasure:@"Translate text"];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  __int16 v23 = __79__AXMLanguageTranslator_translateText_toLocale_respectAllowList_metrics_error___block_invoke;
  id v24 = &unk_1E6117870;
  id v26 = &v34;
  uint64_t v27 = &v28;
  uint64_t v17 = v15;
  __int16 v25 = v17;
  [(AXMLanguageTranslator *)self translateText:v12 toLocale:v13 respectAllowList:v9 completion:&v21];
  dispatch_time_t v18 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v17, v18);
  objc_msgSend(v16, "endMeasurement", v21, v22, v23, v24);
  if (a7) {
    *a7 = (id) v29[5];
  }
  id v19 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __79__AXMLanguageTranslator_translateText_toLocale_respectAllowList_metrics_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (_LTTranslator)translator
{
  translator = self->_translator;
  if (!translator)
  {
    id v4 = (_LTTranslator *)objc_alloc_init((Class)get_LTTranslatorClass());
    id v5 = self->_translator;
    self->_translator = v4;

    translator = self->_translator;
  }

  return translator;
}

- (id)_localeIdentifiersForLocales:(id)a3
{
  return (id)objc_msgSend(a3, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_116);
}

uint64_t __54__AXMLanguageTranslator__localeIdentifiersForLocales___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localeIdentifier];
}

- (id)_descriptionForLocales:(id)a3
{
  id v3 = NSString;
  id v4 = [(AXMLanguageTranslator *)self _localeIdentifiersForLocales:a3];
  id v5 = [v4 componentsJoinedByString:@" "];
  id v6 = [v3 stringWithFormat:@"[%@]", v5];

  return v6;
}

- (id)_canonicalLocaleForLocale:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localeIdentifier];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  if ([v4 isEqual:v5])
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)_canonicalLocalesForLocales:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AXMLanguageTranslator__canonicalLocalesForLocales___block_invoke;
  v5[3] = &unk_1E61178B8;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "ax_flatMappedArrayUsingBlock:", v5);

  return v3;
}

uint64_t __53__AXMLanguageTranslator__canonicalLocalesForLocales___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _canonicalLocaleForLocale:a2];
}

- (void)setTranslator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translator, 0);

  objc_storeStrong((id *)&self->_cachedAvailableTranslationLocales, 0);
}

@end