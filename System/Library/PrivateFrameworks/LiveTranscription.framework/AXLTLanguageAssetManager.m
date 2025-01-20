@interface AXLTLanguageAssetManager
+ (id)sharedInstance;
- (NSLocale)locale;
- (void)deleteSpeechAssetForTaskHint:(int64_t)a3;
- (void)downloadSpeechAssetForTaskHint:(int64_t)a3 progress:(id)a4 completion:(id)a5;
- (void)languageAssetAvaliableForTaskHint:(int64_t)a3 completion:(id)a4;
@end

@implementation AXLTLanguageAssetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_languageAssetManager;
  return v2;
}

uint64_t __42__AXLTLanguageAssetManager_sharedInstance__block_invoke()
{
  sharedInstance_languageAssetManager = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)languageAssetAvaliableForTaskHint:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = AXLogLiveTranscription();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AXLTLanguageAssetManager languageAssetAvaliableForTaskHint:completion:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  v15 = (void *)MEMORY[0x263F17B70];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__AXLTLanguageAssetManager_languageAssetAvaliableForTaskHint_completion___block_invoke;
  v17[3] = &unk_264E39900;
  v17[4] = self;
  id v18 = v6;
  id v16 = v6;
  [v15 installedLanguagesForTaskHint:a3 completion:v17];
}

void __73__AXLTLanguageAssetManager_languageAssetAvaliableForTaskHint_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v7 = [v3 locale];
    v5 = [v7 localeIdentifier];
    uint64_t v6 = [v4 containsObject:v5];

    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v6);
  }
}

- (void)downloadSpeechAssetForTaskHint:(int64_t)a3 progress:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke;
  v12[3] = &unk_264E39978;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  [(AXLTLanguageAssetManager *)self languageAssetAvaliableForTaskHint:a3 completion:v12];
}

void __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v3 = AXLogLiveTranscription();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    id v11 = objc_alloc(MEMORY[0x263F17B60]);
    uint64_t v12 = [*(id *)(a1 + 32) locale];
    id v13 = [v12 localeIdentifier];
    id v14 = (void *)[v11 initWithLanguage:v13 taskHint:*(void *)(a1 + 56)];

    int64_t v15 = (void *)MEMORY[0x263F17B70];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_275;
    v18[3] = &unk_264E39928;
    id v19 = *(id *)(a1 + 40);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_2;
    v16[3] = &unk_264E39950;
    id v17 = *(id *)(a1 + 48);
    [v15 fetchAssetWithConfig:v14 clientIdentifier:@"AccessibilityLiveCaptions" progress:v18 completion:v16];
  }
}

uint64_t __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_275(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)deleteSpeechAssetForTaskHint:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__AXLTLanguageAssetManager_deleteSpeechAssetForTaskHint___block_invoke;
  v3[3] = &unk_264E399A0;
  v3[4] = self;
  v3[5] = a3;
  [(AXLTLanguageAssetManager *)self languageAssetAvaliableForTaskHint:a3 completion:v3];
}

void __57__AXLTLanguageAssetManager_deleteSpeechAssetForTaskHint___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = AXLogLiveTranscription();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __57__AXLTLanguageAssetManager_deleteSpeechAssetForTaskHint___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    id v11 = objc_alloc(MEMORY[0x263F17B60]);
    uint64_t v12 = [*(id *)(a1 + 32) locale];
    id v13 = [v12 localeIdentifier];
    id v14 = (void *)[v11 initWithLanguage:v13 taskHint:*(void *)(a1 + 40)];

    [MEMORY[0x263F17B70] unsubscribeFromAssetWithConfig:v14 clientIdentifier:@"AccessibilityLiveCaptions" error:0];
  }
}

- (NSLocale)locale
{
  return (NSLocale *)[MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en-US"];
}

- (void)languageAssetAvaliableForTaskHint:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__AXLTLanguageAssetManager_downloadSpeechAssetForTaskHint_progress_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__AXLTLanguageAssetManager_deleteSpeechAssetForTaskHint___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end