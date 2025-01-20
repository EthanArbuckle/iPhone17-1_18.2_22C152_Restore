@interface ASWebsiteNameProvider
@end

@implementation ASWebsiteNameProvider

void __77___ASWebsiteNameProvider_beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 104) knownWebsiteNamesDidChange];
}

void __33___ASWebsiteNameProvider_prewarm__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id)WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_INFO, "prewarm found %lu entries", buf, 0xCu);
  }

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33___ASWebsiteNameProvider_prewarm__block_invoke_99;
  v5[3] = &unk_264395E10;
  v5[4] = *(void *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
  [*(id *)(*(void *)(a1 + 32) + 104) knownWebsiteNamesDidChange];
}

uint64_t __33___ASWebsiteNameProvider_prewarm__block_invoke_99(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _processFetchedMetadataEntry:a3 forDomain:a2];
}

uint64_t __33___ASWebsiteNameProvider_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

void __78___ASWebsiteNameProvider_debug_fetchWebsiteNamesForDomains_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = (id)*((void *)WeakRetained + 10);
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), WeakRetained);
}

void __54___ASWebsiteNameProvider_debug_deleteAllPersistedData__block_invoke(uint64_t a1, char a2)
{
  id v3 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __54___ASWebsiteNameProvider_debug_deleteAllPersistedData__block_invoke_cold_1(a2, v3);
  }
}

uint64_t __56___ASWebsiteNameProvider__bestTitleFromCandidateTitles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 uppercaseString];
  uint64_t v5 = [v3 isEqualToString:v4];

  int v6 = objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", @"The ");
  uint64_t v7 = -2;
  if (!v5) {
    uint64_t v7 = -1;
  }
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v5 << 63 >> 63;
  }
  if ((objc_msgSend(v3, "safari_hasCaseInsensitiveSuffix:", @" Website") & 1) != 0
    || objc_msgSend(v3, "safari_hasCaseInsensitiveSuffix:", @"Inc."))
  {
    --v8;
  }
  v9 = [*(id *)(a1 + 32) _undesirableCharactersCharacterSet];
  uint64_t v10 = [v3 rangeOfCharacterFromSet:v9 options:0];

  return v8 - (v10 != 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t __56___ASWebsiteNameProvider__bestTitleFromCandidateTitles___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = v7 - v8;
  if (v7 == v8)
  {
    uint64_t v10 = [v5 length];
    uint64_t v9 = v10 - [v6 length];
  }
  uint64_t v11 = -1;
  if (v9 >= 1) {
    uint64_t v11 = 1;
  }
  if (v9) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

void __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v5 siteName];
      v13 = [v5 title];
      v14 = [v5 originalTitle];
      int v15 = 138740739;
      uint64_t v16 = v11;
      __int16 v17 = 2117;
      v18 = v12;
      __int16 v19 = 2117;
      v20 = v13;
      __int16 v21 = 2117;
      v22 = v14;
      _os_log_debug_impl(&dword_21918F000, v7, OS_LOG_TYPE_DEBUG, "WebsiteNameProvider got metadata for domain \"%{sensitive}@\": siteName: %{sensitive}@, title: %{sensitive}@, originalTitle: %{sensitive}@", (uint8_t *)&v15, 0x2Au);
    }
    uint64_t v8 = [(id)objc_opt_class() websiteNameForLinkMetadata:v5];
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke_cold_2((uint64_t)v8, a1, v9);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v10);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __66___ASWebsiteNameProvider__trimErrantLeadingAndTrailingCharacters___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 substringFromIndex:1];

  return v2;
}

id __66___ASWebsiteNameProvider__trimErrantLeadingAndTrailingCharacters___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);

  return v3;
}

void __47___ASWebsiteNameProvider__openDatabaseIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v3 = *(void **)(v2 + 40);
    id v9 = 0;
    char v4 = [v3 openWithAccessType:1 error:&v9];
    id v5 = v9;
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = v4;
    if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = objc_msgSend(v5, "safari_privacyPreservingDescription");
        __47___ASWebsiteNameProvider__openDatabaseIfNeeded__block_invoke_cold_1(v8, buf, v7);
      }

      char v6 = *(unsigned char *)(*(void *)(a1 + 32) + 24);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

uint64_t __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x270F9A758]();
}

void __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_2(void *a1)
{
  SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(a1[4] + 40), @"SELECT name FROM websiteNames WHERE domain = ?", a1 + 5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v7 nextObject];
  uint64_t v3 = [v2 stringAtIndex:0];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  char v6 = [v7 statement];
  [v6 invalidate];
}

uint64_t __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_3(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x270F9A758]();
}

uint64_t __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _processFetchedMetadataEntry:a2 forDomain:*(void *)(a1 + 40)];
}

void __71___ASWebsiteNameProvider_fetchOperation_finishedWithResult_completion___block_invoke(id *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 4;
  uint64_t v3 = [a1[4] domain];
  uint64_t v4 = [*v2 metadataEntry];
  id v5 = a1[5];
  [a1[6] _cacheFetchedAndKeychainBackedWebsiteName:v5 forDomain:v3];
  char v6 = (void *)*((void *)a1[6] + 13);
  v11[0] = v3;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v6 knownWebsiteNamesDidChangeOnDomains:v7];

  [v4 updateWebsiteName:v5];
  uint64_t v8 = (void *)*((void *)a1[6] + 7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71___ASWebsiteNameProvider_fetchOperation_finishedWithResult_completion___block_invoke_2;
  v9[3] = &unk_264396048;
  id v10 = a1[7];
  [v8 saveMetadataEntry:v4 forDomain:v3 completionHandler:v9];
}

uint64_t __71___ASWebsiteNameProvider_fetchOperation_finishedWithResult_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65___ASWebsiteNameProvider__processFetchedMetadataEntry_forDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFinished])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 domain];
    uint64_t v4 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  return v4;
}

void __68___ASWebsiteNameProvider__cacheDatabaseBackedWebsiteName_forDomain___block_invoke(uint64_t *a1)
{
  if ([(id)a1[4] length])
  {
    uint64_t v2 = a1[4];
    id v3 = *(void **)(a1[5] + 88);
    uint64_t v4 = a1[6];
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
    objc_msgSend(*(id *)(a1[5] + 88), "setObject:forKeyedSubscript:");
  }
}

void __78___ASWebsiteNameProvider__cacheFetchedAndKeychainBackedWebsiteName_forDomain___block_invoke(uint64_t *a1)
{
  if ([(id)a1[4] length])
  {
    uint64_t v2 = a1[4];
    id v3 = *(void **)(a1[5] + 80);
    uint64_t v4 = a1[6];
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
    objc_msgSend(*(id *)(a1[5] + 80), "setObject:forKeyedSubscript:");
  }
}

void __54___ASWebsiteNameProvider_debug_deleteAllPersistedData__block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_21918F000, a2, OS_LOG_TYPE_DEBUG, "Deleting all persisted data with success: %d", (uint8_t *)v2, 8u);
}

void __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138740227;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Fetch for %{sensitive}@ failed with error %@", (uint8_t *)&v4, 0x16u);
}

void __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138740227;
  uint64_t v5 = a1;
  __int16 v6 = 2117;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_21918F000, log, OS_LOG_TYPE_DEBUG, "WebsiteNameProvider found \"%{sensitive}@\" as a website name for domain \"%{sensitive}@\"", (uint8_t *)&v4, 0x16u);
}

void __47___ASWebsiteNameProvider__openDatabaseIfNeeded__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Failed to open database: %{public}@", buf, 0xCu);
}

@end