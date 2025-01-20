@interface WDVideoURLManager
+ (BOOL)isVideoPlaybackEnabled;
+ (id)_baseURLForIdentifier:(id)a3;
+ (id)_parseJSON:(id)a3;
+ (id)preferredLanguageFromLanguages:(id)a3 languagePreferences:(id)a4;
+ (void)_fetchPreferredURLForIdentifier:(id)a3 completion:(id)a4;
+ (void)_fetchRawManifestForIdentifier:(id)a3 completion:(id)a4;
+ (void)fetchURLForVideoWithIdentifier:(id)a3 handler:(id)a4;
@end

@implementation WDVideoURLManager

+ (void)fetchURLForVideoWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__WDVideoURLManager_fetchURLForVideoWithIdentifier_handler___block_invoke;
  v10[3] = &unk_26458EA68;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [a1 _fetchPreferredURLForIdentifier:v9 completion:v10];
}

void __60__WDVideoURLManager_fetchURLForVideoWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__WDVideoURLManager_fetchURLForVideoWithIdentifier_handler___block_invoke_2;
  v10[3] = &unk_26458EA40;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v7 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __60__WDVideoURLManager_fetchURLForVideoWithIdentifier_handler___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_2210D2000, v2, OS_LOG_TYPE_DEFAULT, "Fetched URL for %@: %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

+ (BOOL)isVideoPlaybackEnabled
{
  return 1;
}

+ (void)_fetchPreferredURLForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__WDVideoURLManager__fetchPreferredURLForIdentifier_completion___block_invoke;
  v10[3] = &unk_26458EA90;
  id v12 = v7;
  id v13 = a1;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [a1 _fetchRawManifestForIdentifier:v9 completion:v10];
}

void __64__WDVideoURLManager__fetchPreferredURLForIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 48) _parseJSON:a2];
    _HKInitializeLogging();
    uint64_t v4 = (os_log_t *)MEMORY[0x263F09968];
    id v5 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 32);
      int v16 = 138543618;
      v17 = v6;
      __int16 v18 = 2114;
      v19 = v3;
      _os_log_impl(&dword_2210D2000, v5, OS_LOG_TYPE_DEFAULT, "Received JSON dictionary for identifier %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    id v7 = [v3 objectForKeyedSubscript:@"languages"];
    id v8 = *(void **)(a1 + 48);
    id v9 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v10 = [v8 preferredLanguageFromLanguages:v7 languagePreferences:v9];

    _HKInitializeLogging();
    id v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_2210D2000, v11, OS_LOG_TYPE_DEFAULT, "Chose language code %{public}@", (uint8_t *)&v16, 0xCu);
    }
    id v12 = [*(id *)(a1 + 48) _baseURLForIdentifier:*(void *)(a1 + 32)];
    id v13 = [v12 URLByAppendingPathComponent:v10];
    id v14 = [v13 URLByAppendingPathComponent:@"stream.m3u8"];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v15();
  }
}

+ (id)preferredLanguageFromLanguages:(id)a3 languagePreferences:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    id v7 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:v5 forPreferences:v6];
    id v8 = [v7 firstObject];
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x263F09968];
    id v8 = @"en";
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = @"en";
      _os_log_impl(&dword_2210D2000, v9, OS_LOG_TYPE_DEFAULT, "Received empty array of languages, returning %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }

  return v8;
}

+ (id)_parseJSON:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v3 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v5];

  return v3;
}

+ (void)_fetchRawManifestForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _baseURLForIdentifier:a3];
  id v8 = [v7 URLByAppendingPathComponent:@"manifest.json"];

  id v9 = [MEMORY[0x263F08BF8] sharedSession];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__WDVideoURLManager__fetchRawManifestForIdentifier_completion___block_invoke;
  v12[3] = &unk_26458EAB8;
  id v13 = v6;
  id v10 = v6;
  int v11 = [v9 dataTaskWithURL:v8 completionHandler:v12];

  [v11 resume];
}

void __63__WDVideoURLManager__fetchRawManifestForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_baseURLForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  uint64_t v5 = [v3 standardUserDefaults];
  id v6 = [v5 stringForKey:*MEMORY[0x263F0AD80]];

  id v7 = objc_msgSend(v6, "hk_stripLeadingTrailingWhitespace");
  objc_msgSend(v7, "hk_copyNonEmptyString");
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = @"https://health-assets.cdn-apple.com/videos";
  }
  id v10 = [NSURL URLWithString:v9];
  int v11 = [v10 URLByAppendingPathComponent:v4];

  _HKInitializeLogging();
  id v12 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = [v11 absoluteString];
    int v16 = 138412290;
    v17 = v14;
    _os_log_impl(&dword_2210D2000, v13, OS_LOG_TYPE_DEFAULT, "Server base URL: %@", (uint8_t *)&v16, 0xCu);
  }

  return v11;
}

@end