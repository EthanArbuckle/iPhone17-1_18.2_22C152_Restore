@interface CNAutocompleteSuggestionsProbe
+ (id)contactIdentifierForAutocompleteResult:(id)a3;
+ (id)suggestionIdentifierForAutocompleteResult:(id)a3;
+ (int)suggestionSourcesForAutocompleteResult:(id)a3;
- (CNAutocompleteSuggestionsProbe)init;
- (CNAutocompleteSuggestionsProbe)initWithSuggestionsService:(id)a3 schedulerProvider:(id)a4 bundleIdentifier:(id)a5;
- (CNScheduler)workScheduler;
- (NSMutableArray)pendingBlocks;
- (NSString)bundleID;
- (SGSuggestionsServiceContactsProtocol)sgService;
- (void)recordSGServiceMessage:(id)a3;
- (void)recordUserSawResultsConsideredSuggestion;
- (void)recordUserSelectedAutocompleteResult:(id)a3;
- (void)sendData;
@end

@implementation CNAutocompleteSuggestionsProbe

+ (id)suggestionIdentifierForAutocompleteResult:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 sourceType] & 4) != 0)
  {
    v8[0] = *MEMORY[0x1E4F1AE08];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v6 = [v3 contactWithKeysToFetch:v5 error:0];

    v4 = 0;
    if ([v6 isSuggested])
    {
      v4 = [v6 suggestionRecordId];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)contactIdentifierForAutocompleteResult:(id)a3
{
  id v3 = a3;
  if (([v3 sourceType] & 2) != 0)
  {
    v4 = [v3 identifier];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)suggestionSourcesForAutocompleteResult:(id)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v15[0] = &unk_1F1A3BD40;
  v15[1] = &unk_1F1A3BD70;
  v16[0] = &unk_1F1A3BD58;
  v16[1] = &unk_1F1A3BD88;
  v15[2] = &unk_1F1A3BDA0;
  v15[3] = &unk_1F1A3BDD0;
  v16[2] = &unk_1F1A3BDB8;
  v16[3] = &unk_1F1A3BDE8;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __73__CNAutocompleteSuggestionsProbe_suggestionSourcesForAutocompleteResult___block_invoke;
  v8[3] = &unk_1E63DD900;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  int v6 = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __73__CNAutocompleteSuggestionsProbe_suggestionSourcesForAutocompleteResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 sourceType];
  uint64_t v8 = [v6 unsignedIntegerValue];

  if ((v8 & v7) != 0) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v9 intValue];
  }
}

- (CNAutocompleteSuggestionsProbe)init
{
  id v3 = [(objc_class *)getSGSuggestionsServiceClass() serviceForContacts];
  [v3 setSyncTimeout:0.2];
  v4 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];
  uint64_t v7 = [(CNAutocompleteSuggestionsProbe *)self initWithSuggestionsService:v3 schedulerProvider:v4 bundleIdentifier:v6];

  return v7;
}

- (CNAutocompleteSuggestionsProbe)initWithSuggestionsService:(id)a3 schedulerProvider:(id)a4 bundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNAutocompleteSuggestionsProbe;
  v12 = [(CNAutocompleteSuggestionsProbe *)&v22 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sgService, a3);
    uint64_t v14 = [v10 newSerialSchedulerWithName:@"com.apple.contacts.ContactsAutocomplete.CNAutocompleteSuggestionsProbe"];
    workScheduler = v13->_workScheduler;
    v13->_workScheduler = (CNScheduler *)v14;

    uint64_t v16 = [v11 copy];
    bundleID = v13->_bundleID;
    v13->_bundleID = (NSString *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    pendingBlocks = v13->_pendingBlocks;
    v13->_pendingBlocks = (NSMutableArray *)v18;

    v20 = v13;
  }

  return v13;
}

- (void)recordUserSelectedAutocompleteResult:(id)a3
{
  id v4 = a3;
  int v5 = [(id)objc_opt_class() suggestionSourcesForAutocompleteResult:v4];
  id v6 = [(id)objc_opt_class() suggestionIdentifierForAutocompleteResult:v4];
  uint64_t v7 = [(id)objc_opt_class() contactIdentifierForAutocompleteResult:v4];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CNAutocompleteSuggestionsProbe_recordUserSelectedAutocompleteResult___block_invoke;
  v10[3] = &unk_1E63DD928;
  int v13 = v5;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CNAutocompleteSuggestionsProbe *)self recordSGServiceMessage:v10];
}

uint64_t __71__CNAutocompleteSuggestionsProbe_recordUserSelectedAutocompleteResult___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 logMetricAutocompleteResult:*(unsigned int *)(a1 + 48) recordId:*(void *)(a1 + 32) contactIdentifier:*(void *)(a1 + 40) bundleId:a3];
}

- (void)recordUserSawResultsConsideredSuggestion
{
}

uint64_t __74__CNAutocompleteSuggestionsProbe_recordUserSawResultsConsideredSuggestion__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logMetricSearchResultsIncludedPureSuggestionWithBundleId:");
}

- (void)recordSGServiceMessage:(id)a3
{
  id v4 = a3;
  int v5 = [(CNAutocompleteSuggestionsProbe *)self pendingBlocks];
  id v6 = [(CNAutocompleteSuggestionsProbe *)self sgService];
  uint64_t v7 = [(CNAutocompleteSuggestionsProbe *)self bundleID];
  id v8 = [(CNAutocompleteSuggestionsProbe *)self workScheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__CNAutocompleteSuggestionsProbe_recordSGServiceMessage___block_invoke;
  v13[3] = &unk_1E63DD998;
  id v14 = v5;
  id v15 = v6;
  id v16 = v7;
  id v17 = v4;
  id v9 = v7;
  id v10 = v6;
  id v11 = v4;
  id v12 = v5;
  [v8 performBlock:v13];
}

void __57__CNAutocompleteSuggestionsProbe_recordSGServiceMessage___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__CNAutocompleteSuggestionsProbe_recordSGServiceMessage___block_invoke_2;
  v5[3] = &unk_1E63DD970;
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = (void *)[v5 copy];
  id v4 = _Block_copy(v3);
  [v2 addObject:v4];
}

uint64_t __57__CNAutocompleteSuggestionsProbe_recordSGServiceMessage___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)sendData
{
  id v3 = [(CNAutocompleteSuggestionsProbe *)self pendingBlocks];
  id v4 = [(CNAutocompleteSuggestionsProbe *)self workScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CNAutocompleteSuggestionsProbe_sendData__block_invoke;
  v6[3] = &unk_1E63DD9C0;
  id v7 = v3;
  id v5 = v3;
  [v4 performBlock:v6];
}

uint64_t __42__CNAutocompleteSuggestionsProbe_sendData__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (void)v8);
}

- (SGSuggestionsServiceContactsProtocol)sgService
{
  return self->_sgService;
}

- (CNScheduler)workScheduler
{
  return self->_workScheduler;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_workScheduler, 0);
  objc_storeStrong((id *)&self->_sgService, 0);
}

@end