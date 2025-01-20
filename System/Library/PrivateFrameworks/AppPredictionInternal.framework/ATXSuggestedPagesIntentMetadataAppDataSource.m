@interface ATXSuggestedPagesIntentMetadataAppDataSource
- (id)_appsMatchingShortcutAvailability:(unint64_t)a3;
- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesIntentMetadataAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  id v6 = a4;
  if (a3 == 4)
  {
    uint64_t v7 = 127;
    goto LABEL_5;
  }
  if (a3 == 11)
  {
    uint64_t v7 = 15;
LABEL_5:
    v8 = [(ATXSuggestedPagesIntentMetadataAppDataSource *)self _appsMatchingShortcutAvailability:v7];
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)_appsMatchingShortcutAvailability:(unint64_t)a3
{
  v4 = objc_opt_new();
  v5 = BiomeLibrary();
  id v6 = [v5 App];
  uint64_t v7 = [v6 Intent];

  v8 = objc_msgSend(v7, "atx_publisherFromStartDate:", 0);
  v9 = [v8 filterWithIsIncluded:&__block_literal_global_6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke_3;
  v13[3] = &unk_1E68ABA40;
  unint64_t v15 = a3;
  id v10 = v4;
  id v14 = v10;
  id v11 = (id)[v9 sinkWithCompletion:&__block_literal_global_14 receiveInput:v13];

  return v10;
}

BOOL __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [v2 eventBody];
    id v6 = [v5 bundleID];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = [v5 interaction];
      BOOL v9 = [v8 length] != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D25F6CC0]();
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v3 eventBody];
  v8 = [v7 interaction];
  id v18 = 0;
  BOOL v9 = [v5 unarchivedObjectOfClass:v6 fromData:v8 error:&v18];
  id v10 = v18;

  if (!v9)
  {
    unint64_t v15 = __atxlog_handle_modes();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke_3_cold_1((uint64_t)v10, v15);
    }
    goto LABEL_6;
  }
  id v11 = [v9 intent];
  uint64_t v12 = *(void *)(a1 + 40) & [v11 shortcutAvailability];

  if (v12)
  {
    v13 = *(void **)(a1 + 32);
    id v14 = objc_alloc(MEMORY[0x1E4F4B070]);
    unint64_t v15 = [v3 eventBody];
    v16 = [v15 bundleID];
    v17 = (void *)[v14 initWithBundleId:v16 predictionSource:@"Intent Metadata"];
    [v13 addObject:v17];

LABEL_6:
  }
}

void __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesIntentMetadataAppDataSource: Could not unarchive interaction: %@", (uint8_t *)&v2, 0xCu);
}

@end