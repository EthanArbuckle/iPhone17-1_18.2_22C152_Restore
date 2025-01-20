@interface ATXPeopleSuggesterDataSource
- (ATXPeopleSuggesterDataSource)initWithDevice:(id)a3;
- (void)peopleSuggestionsWithCallback:(id)a3;
@end

@implementation ATXPeopleSuggesterDataSource

- (ATXPeopleSuggesterDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXPeopleSuggesterDataSource;
  v6 = [(ATXPeopleSuggesterDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)peopleSuggestionsWithCallback:(id)a3
{
  id v3 = a3;
  if (ATXHeuristicCanLearnFromApp(&unk_1F27273C8))
  {
    v4 = (void *)MEMORY[0x1D25F43D0]();
    id v5 = [MEMORY[0x1E4F5B428] peopleSuggester];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__ATXPeopleSuggesterDataSource_peopleSuggestionsWithCallback___block_invoke;
    v6[3] = &unk_1E68A56E0;
    id v7 = v3;
    [v5 suggestPeopleWithCompletionHandler:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __62__ATXPeopleSuggesterDataSource_peopleSuggestionsWithCallback___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v28 = a1;
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v30 + 1) + 8 * v11) contact];
          v13 = (void *)MEMORY[0x1E4F1CA60];
          v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "type"));
          v15 = [v13 dictionaryWithObject:v14 forKey:@"type"];

          v16 = [v12 identifier];
          uint64_t v17 = [v16 length];

          if (v17)
          {
            v18 = [v12 identifier];
            [v15 setObject:v18 forKeyedSubscript:@"identifier"];
          }
          v19 = [v12 handle];
          uint64_t v20 = [v19 length];

          if (v20)
          {
            v21 = [v12 handle];
            [v15 setObject:v21 forKeyedSubscript:@"handle"];
          }
          v22 = [v12 personId];
          uint64_t v23 = [v22 length];

          if (v23)
          {
            v24 = [v12 personId];
            [v15 setObject:v24 forKeyedSubscript:@"personID"];
          }
          v25 = [v12 displayName];
          uint64_t v26 = [v25 length];

          if (v26)
          {
            v27 = [v12 displayName];
            [v15 setObject:v27 forKeyedSubscript:@"displayName"];
          }
          [v6 addObject:v15];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(v28 + 32) + 16))();
    id v5 = v29;
  }
}

- (void).cxx_destruct
{
}

@end