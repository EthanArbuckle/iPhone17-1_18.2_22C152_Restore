@interface MUIResultSuggestionQuery
- (id)_createQuery;
- (id)_messageListFromSearchableItems:(uint64_t)a1;
- (id)initWithPhraseManager:(void *)a3 handler:(void *)a4 suggester:;
- (void)_createQuery;
- (void)cancel;
@end

@implementation MUIResultSuggestionQuery

- (id)initWithPhraseManager:(void *)a3 handler:(void *)a4 suggester:
{
  id v8 = a2;
  id v9 = a3;
  v10 = a4;
  if (!a1) {
    goto LABEL_9;
  }
  v26.receiver = a1;
  v26.super_class = (Class)MUIResultSuggestionQuery;
  v11 = (id *)objc_msgSendSuper2(&v26, sel_init);
  a1 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  objc_storeStrong(v11 + 1, a2);
  uint64_t v12 = [v9 copy];
  id v13 = a1[2];
  a1[2] = (id)v12;

  if (v10)
  {
    id v14 = v10[1];
    uint64_t v15 = [v14 copy];
    id v16 = a1[3];
    a1[3] = (id)v15;

    id v17 = v10[2];
  }
  else
  {
    uint64_t v23 = [0 copy];
    id v24 = a1[3];
    a1[3] = (id)v23;

    id v17 = 0;
  }
  objc_storeStrong(a1 + 4, v17);
  if (v10)
  {
    objc_storeStrong(a1 + 5, v10[3]);
    id v18 = v10[4];
  }
  else
  {
    id v25 = a1[5];
    a1[5] = 0;

    id v18 = 0;
  }
  objc_storeStrong(a1 + 6, v18);
  uint64_t v19 = -[MUIResultSuggestionQuery _createQuery](a1);
  id v20 = a1[7];
  a1[7] = (id)v19;

  if (a1[7])
  {
LABEL_8:
    a1 = a1;
    v21 = a1;
  }
  else
  {
LABEL_9:
    v21 = 0;
  }

  return v21;
}

- (id)_createQuery
{
  v1 = a1;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = a1[5];
    v3 = [v2 senderFilterQueryFuture];
    id v38 = 0;
    v4 = [v3 resultWithTimeout:&v38 error:0.25];
    id v29 = v38;

    if (![v4 length] || v29)
    {
      v5 = +[MUISearchResultsSuggester log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(MUIResultSuggestionQuery *)(uint64_t)v1 _createQuery];
      }
    }
    id v6 = v1[1];
    id v7 = v1[6];
    id v8 = [v7 suggestionFilterQueryWithPhraseManager:v6 senderFilterQuery:v4];

    id v9 = (void *)MEMORY[0x1E4F60470];
    id v10 = v1[1];
    v11 = [v10 phrase];
    uint64_t v12 = [v1[1] updatedSuggestion];
    id v13 = [v9 expressionWithQueryString:v8 searchString:v11 updatedSuggestion:v12];

    if (v13)
    {
      id v14 = +[MUISearchResultsSuggester log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v1[6];
        id v16 = [v15 logIdentifier];
        id v17 = v1[1];
        id v18 = [v17 phrase];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v16;
        __int16 v41 = 2112;
        v42 = v18;
        _os_log_impl(&dword_1DDCDB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Generating search result suggestions for phrase %@", buf, 0x16u);
      }
      uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
      id v20 = [v1[6] fetchAttributes];
      if ([v20 count])
      {
        [v20 arrayByAddingObject:*MEMORY[0x1E4F234E0]];
      }
      else
      {
        uint64_t v39 = *MEMORY[0x1E4F234E0];
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      v21 = };

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v1);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke;
      aBlock[3] = &unk_1E6D13488;
      objc_copyWeak(&v37, (id *)buf);
      id v22 = v19;
      id v36 = v22;
      uint64_t v23 = _Block_copy(aBlock);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke_129;
      v30[3] = &unk_1E6D13500;
      v30[4] = v1;
      id v24 = v21;
      id v31 = v24;
      id v25 = v23;
      id v33 = v25;
      objc_copyWeak(&v34, (id *)buf);
      id v26 = v22;
      id v32 = v26;
      v27 = _Block_copy(v30);
      v1 = [MEMORY[0x1E4F60480] queryWithExpression:v13 builder:v27];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = WeakRetained[6];
      id v10 = objc_msgSend(v8, "ef_prefix:", objc_msgSend(v9, "maxItemCount"));
    }
    else
    {
      id v10 = 0;
    }
    v11 = +[MUISearchResultsSuggester log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v7[6];
      id v13 = [v12 logIdentifier];
      id v14 = v7[2];
      id v15 = _Block_copy(v14);
      int v16 = 138544130;
      id v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      id v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1DDCDB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] _invokeHandler:<%p> reason:'%{public}@' suggestions:%@", (uint8_t *)&v16, 0x2Au);
    }
    (*((void (**)(void))v7[2] + 2))();
  }
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke_129(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 24);
  }
  else {
    uint64_t v6 = 0;
  }
  [v3 setBundleID:v6];
  [v4 setFetchAttributes:*(void *)(a1 + 40)];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke_2;
  v13[3] = &unk_1E6D11BF8;
  id v14 = *(id *)(a1 + 56);
  [v4 setCompletionBlock:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke_3;
  v10[3] = &unk_1E6D134B0;
  objc_copyWeak(&v12, (id *)(a1 + 64));
  id v11 = *(id *)(a1 + 48);
  [v4 setResultsBlock:v10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke_134;
  v7[3] = &unk_1E6D134D8;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  id v8 = *(id *)(a1 + 56);
  [v4 setFailureBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
}

uint64_t __40__MUIResultSuggestionQuery__createQuery__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (uint64_t)WeakRetained;
  if (WeakRetained) {
    WeakRetained = (void *)WeakRetained[6];
  }
  uint64_t v6 = [WeakRetained maxItemCount];
  if ([*(id *)(a1 + 32) count] != v6)
  {
    id v7 = -[MUIResultSuggestionQuery _messageListFromSearchableItems:](v5, v3);
    id v8 = [v7 first];
    id v9 = [v7 second];
    if (v5)
    {
      id v10 = *(id *)(v5 + 48);
      id v11 = *(void **)(v5 + 8);
    }
    else
    {
      id v10 = 0;
      id v11 = 0;
    }
    id v12 = v11;
    id v13 = [v10 processSuggestionsResults:v8 phraseManager:v12 messageList:v9];

    id v14 = +[MUISearchResultsSuggester log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        id v15 = *(void **)(v5 + 48);
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;
      id v17 = [v16 logIdentifier];
      int v18 = 138543874;
      uint64_t v19 = v17;
      __int16 v20 = 2112;
      id v21 = v13;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_1DDCDB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched suggestions results: %@ from searchable items %@", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 32) addObjectsFromArray:v13];
  }
}

- (id)_messageListFromSearchableItems:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v30 = v3;
  if (a1)
  {
    v4 = v3;
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          id v13 = [MEMORY[0x1E4F60460] persistentIDForSearchableItem:v12];
          if (v13)
          {
            [v5 addObject:v13];
            [v6 setObject:v12 forKeyedSubscript:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v9);
    }

    id v14 = [*(id *)(a1 + 32) messageObjectIDsForSearchableItemIdentifiers:v5];
    id v15 = [v14 result];

    v28 = [v15 objectIDs];
    id v16 = [v15 objectIDByPersistentID];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __60__MUIResultSuggestionQuery__messageListFromSearchableItems___block_invoke;
    v31[3] = &unk_1E6D13528;
    id v32 = v16;
    id v29 = v16;
    id v17 = objc_msgSend(v7, "ef_compactMap:", v31);
    int v18 = [MEMORY[0x1E4F60320] predicateForMessagesWithObjectIDs:v28];
    [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
    v20 = uint64_t v19 = a1;
    id v21 = objc_alloc(MEMORY[0x1E4F60418]);
    uint64_t v22 = objc_opt_class();
    id v37 = v20;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    uint64_t v24 = (void *)[v21 initWithTargetClass:v22 predicate:v18 sortDescriptors:v23];

    id v25 = (void *)[objc_alloc(MEMORY[0x1E4F60380]) initWithQuery:v24 repository:*(void *)(v19 + 32)];
    id v26 = [MEMORY[0x1E4F60DF0] pairWithFirst:v17 second:v25];
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke_134(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[MUISearchResultsSuggester log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __40__MUIResultSuggestionQuery__createQuery__block_invoke_134_cold_1((uint64_t)WeakRetained, (uint64_t)v3, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
  if (self) {
    self = (MUIResultSuggestionQuery *)self->_underlyingQuery;
  }
  [(MUIResultSuggestionQuery *)self cancel];
}

MUISearchSuggestionResult *__60__MUIResultSuggestionQuery__messageListFromSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F60460] persistentIDForSearchableItem:v3];
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v8 = +[MUISearchResultsSuggester log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__MUIResultSuggestionQuery__messageListFromSearchableItems___block_invoke_cold_1(v3);
    }

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [[MUISearchSuggestionResult alloc] initWithSearchableItem:v3 objectID:v5];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingQuery, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_senderQueryManager, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_phraseManager, 0);
}

- (void)_createQuery
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = [v5 logIdentifier];
  BOOL v7 = objc_msgSend(a2, "ef_publicDescription");
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  id v11 = v7;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Sender filter query is empty (error=%{public}@)", (uint8_t *)&v8, 0x16u);
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke_134_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1) {
    id v5 = *(void **)(a1 + 48);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  BOOL v7 = [v6 logIdentifier];
  int v8 = 138543618;
  uint64_t v9 = v7;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch suggestions results: %@", (uint8_t *)&v8, 0x16u);
}

void __60__MUIResultSuggestionQuery__messageListFromSearchableItems___block_invoke_cold_1(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_0(&dword_1DDCDB000, v2, v3, "No suggestion result for item %@.", v4, v5, v6, v7, 2u);
}

@end