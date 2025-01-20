@interface CNContactsAutocompleteSearchOperation
+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5 autocompleteStore:(id)a6;
- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5;
- (BOOL)includeContacts;
- (BOOL)includeRecents;
- (BOOL)includeServers;
- (BOOL)includeStewie;
- (BOOL)includeSuggestions;
- (BOOL)shouldUnifyResults;
- (BOOL)simulateResults;
- (CNAutocompleteFetchContext)fetchContext;
- (CNAutocompleteStore)autocompleteStore;
- (CNCancelationToken)fetchRequestToken;
- (CNContactsAutocompleteSearchOperation)init;
- (CNPromise)fetchRequestPromise;
- (NSNumber)shouldIncludeGroupResults;
- (id)_simulatedRecipientResults;
- (id)defaultChildForUnifiedEmailRecipients:(id)a3;
- (id)originContextForResult:(id)a3;
- (id)unifyRecipientsIfNeccesary:(id)a3;
- (id)unifyingIdentifierForRecipient:(id)a3;
- (int64_t)addressableGroupResultStyle;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetchDidFinish:(id)a3;
- (void)cancel;
- (void)configureForSearchTypes:(unint64_t)a3;
- (void)dealloc;
- (void)main;
- (void)setAddressableGroupResultStyle:(int64_t)a3;
- (void)setAutocompleteStore:(id)a3;
- (void)setFetchContext:(id)a3;
- (void)setFetchRequestPromise:(id)a3;
- (void)setFetchRequestToken:(id)a3;
- (void)setIncludeContacts:(BOOL)a3;
- (void)setIncludeRecents:(BOOL)a3;
- (void)setIncludeServers:(BOOL)a3;
- (void)setIncludeStewie:(BOOL)a3;
- (void)setIncludeSuggestions:(BOOL)a3;
- (void)setShouldIncludeGroupResults:(id)a3;
- (void)setShouldUnifyResults:(BOOL)a3;
- (void)setSimulateResults:(BOOL)a3;
@end

@implementation CNContactsAutocompleteSearchOperation

+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5 autocompleteStore:(id)a6
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CNContactsAutocompleteSearchOperation;
  id v9 = a6;
  v10 = objc_msgSendSuper2(&v12, sel_operationWithOwner_text_taskID_, a3, a4, a5);
  objc_msgSend(v10, "setAutocompleteStore:", v9, v12.receiver, v12.super_class);

  return v10;
}

- (CNContactsAutocompleteSearchOperation)init
{
  v14.receiver = self;
  v14.super_class = (Class)CNContactsAutocompleteSearchOperation;
  v2 = [(CNContactsAutocompleteSearchOperation *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F5A4B8]);
    v4 = [MEMORY[0x1E4F5A4F0] defaultProvider];
    uint64_t v5 = [v3 initWithSchedulerProvider:v4];
    fetchRequestPromise = v2->_fetchRequestPromise;
    v2->_fetchRequestPromise = (CNPromise *)v5;

    objc_initWeak(&location, v2);
    v7 = (void *)MEMORY[0x1E4F5A368];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__CNContactsAutocompleteSearchOperation_init__block_invoke;
    v11[3] = &unk_1E6128E48;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = [v7 tokenWithCancelationBlock:v11];
    fetchRequestToken = v2->_fetchRequestToken;
    v2->_fetchRequestToken = (CNCancelationToken *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __45__CNContactsAutocompleteSearchOperation_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained fetchRequestPromise];
  v2 = [v1 future];
  char v3 = [v2 isCancelled];

  if ((v3 & 1) == 0)
  {
    v4 = [WeakRetained fetchRequestPromise];
    uint64_t v5 = [v4 future];
    [v5 cancel];
  }
}

- (void)cancel
{
  char v3 = [(CNContactsAutocompleteSearchOperation *)self fetchRequestToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)CNContactsAutocompleteSearchOperation;
  [(CNContactsAutocompleteSearchOperation *)&v4 cancel];
}

- (void)dealloc
{
  char v3 = [(CNContactsAutocompleteSearchOperation *)self fetchRequestToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)CNContactsAutocompleteSearchOperation;
  [(CNContactsAutocompleteSearchOperation *)&v4 dealloc];
}

- (void)configureForSearchTypes:(unint64_t)a3
{
  [(CNContactsAutocompleteSearchOperation *)self setIncludeContacts:(a3 >> 1) & 1];
  [(CNContactsAutocompleteSearchOperation *)self setIncludeRecents:(a3 & 5) != 0];
  [(CNContactsAutocompleteSearchOperation *)self setIncludeStewie:(a3 >> 5) & 1];
  [(CNContactsAutocompleteSearchOperation *)self setIncludeServers:(a3 >> 3) & 1];

  [(CNContactsAutocompleteSearchOperation *)self setIncludeSuggestions:(a3 >> 4) & 1];
}

- (void)main
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1B5AF5000, v1, OS_LOG_TYPE_DEBUG, "CNAutocompleteFetch Error for task %@: %@", v2, 0x16u);
}

void __45__CNContactsAutocompleteSearchOperation_main__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) owner];
  __int16 v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [v3 taskID];
  [v2 _handleContactsAutocompleteSearch:v3 returnedResults:v4 taskID:v5];

  id v8 = [*(id *)(a1 + 32) owner];
  v6 = *(void **)(a1 + 32);
  v7 = [v6 taskID];
  [v8 _handleContactsAutocompleteSearchFinished:v6 taskID:v7];
}

uint64_t __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2(uint64_t a1)
{
  v2 = contactsSearchManagerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return [*(id *)(a1 + 40) cancel];
}

void __45__CNContactsAutocompleteSearchOperation_main__block_invoke_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  uint64_t v4 = [v3 mainThreadScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2_89;
  v6[3] = &unk_1E61283C0;
  v6[4] = WeakRetained;
  id v7 = *(id *)(a1 + 32);
  id v5 = (id)[v4 afterDelay:v6 performBlock:0.0];
}

void __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2_89(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) owner];
  [v2 _handleContactsAutocompleteSearchFinished:*(void *)(a1 + 32) taskID:*(void *)(a1 + 40)];
}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CNAutocompleteSearchOperation *)self owner];
  v10 = [v9 fetchDelegate];

  if (v10)
  {
    v11 = [v7 searchString];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __119__CNContactsAutocompleteSearchOperation_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler___block_invoke;
    v14[3] = &unk_1E6128BE0;
    id v15 = v8;
    char v12 = [v10 getSupplementalGroupsForSearchQuery:v11 completionHandler:v14];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

void __119__CNContactsAutocompleteSearchOperation_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v17 = a3;
  v19 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E4F5A090];
        v11 = [v9 title];
        char v12 = [v9 identifier];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __119__CNContactsAutocompleteSearchOperation_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler___block_invoke_2;
        v20[3] = &unk_1E6128E98;
        v20[4] = v9;
        v13 = [v10 messagesResultWithAddress:0 displayName:v11 nameComponents:0 resultType:1 addressType:0 identifier:v12 contactProvider:0 groupMembersProvider:v20 userInfo:0];

        if (v13) {
          [v19 addObject:v13];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = (void *)[v19 copy];
  (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v17);
}

id __119__CNContactsAutocompleteSearchOperation_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [*(id *)(a1 + 32) groupMembers];
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v7 = [v6 nameComponents];
        id v8 = v7;
        if (v7)
        {
          id v9 = (void *)MEMORY[0x1E4F5A078];
          v10 = [v7 givenName];
          v11 = [v8 familyName];
          char v12 = [v8 nickname];
          v13 = [v8 nameSuffix];
          uint64_t v14 = [v9 nameComponentsWithFirstName:v10 lastName:v11 nickname:v12 nameSuffix:v13];

          id v15 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v8 style:2 options:0];
        }
        else
        {
          id v15 = [v6 name];
          uint64_t v14 = 0;
        }
        v16 = (void *)MEMORY[0x1E4F5A090];
        id v17 = [v6 address];
        v18 = objc_msgSend(v16, "messagesResultWithAddress:displayName:nameComponents:resultType:addressType:identifier:contactProvider:groupMembersProvider:userInfo:", v17, v15, v14, 0, objc_msgSend(v6, "addressType"), 0, 0, 0, 0);

        if (v18) {
          [v22 addObject:v18];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v3);
  }

  v19 = (void *)[v22 copy];

  return v19;
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
}

- (id)_simulatedRecipientResults
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = objc_alloc_init(CNComposeRecipientOriginContext);
  uint64_t v5 = [(CNAutocompleteSearchOperation *)self text];
  [(CNComposeRecipientOriginContext *)v4 setSearchTerm:v5];

  [(CNComposeRecipientOriginContext *)v4 setResultType:16];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CNContactsAutocompleteSearchOperation__simulatedRecipientResults__block_invoke;
  v11[3] = &unk_1E6128EC0;
  char v12 = v4;
  id v6 = v3;
  id v13 = v6;
  uint64_t v7 = v4;
  id v8 = (void (**)(void, void))MEMORY[0x1BA9A6470](v11);
  ((void (**)(void, __CFString *))v8)[2](v8, @"Dan Keen <dkeen@apple.com>");
  ((void (**)(void, __CFString *))v8)[2](v8, @"Allan Shortlidge <tshortli@apple.com>");
  ((void (**)(void, __CFString *))v8)[2](v8, @"Michael A La Mode <malamode@apple.com>");
  ((void (**)(void, __CFString *))v8)[2](v8, @"James Magahern <jmagahern@apple.com>");
  id v9 = v6;

  return v9;
}

void __67__CNContactsAutocompleteSearchOperation__simulatedRecipientResults__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[CNComposeRecipient alloc] initWithContact:0 address:v3 kind:0];

  [(CNComposeRecipient *)v4 setOriginContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v4];
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (([(CNContactsAutocompleteSearchOperation *)self isCancelled] & 1) == 0)
  {
    v42 = objc_opt_new();
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v38 = v5;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (!v6) {
      goto LABEL_41;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v58;
    uint64_t v39 = *(void *)v58;
    while (1)
    {
      uint64_t v9 = 0;
      uint64_t v40 = v7;
      do
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v57 + 1) + 8 * v9);
        if ([v10 resultType] == 1)
        {
          id v56 = 0;
          v11 = [v10 members:&v56];
          id v12 = v56;
          if (v12)
          {
            id v13 = contactsSearchManagerLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              [(CNContactsAutocompleteSearchOperation *)v63 autocompleteFetch:&v64 didReceiveResults:v13];
            }
          }
          v43 = v12;
          v44 = v11;
          v45 = v10;
          if (v11)
          {
            uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v15 = v11;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v53;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v53 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                  long long v21 = +[CNComposeRecipient composeRecipientWithAutocompleteResult:v20];
                  if (v21)
                  {
                    long long v22 = [(CNContactsAutocompleteSearchOperation *)self originContextForResult:v20];
                    [v21 setOriginContext:v22];

                    [v14 addObject:v21];
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
              }
              while (v17);
            }

            v10 = v45;
          }
          else
          {
            uint64_t v14 = 0;
          }
          long long v24 = [(CNContactsAutocompleteSearchOperation *)self unifyRecipientsIfNeccesary:v14];

          long long v25 = [v10 displayName];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v26 = v24;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v61 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v49;
            while (2)
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v49 != v29) {
                  objc_enumerationMutation(v26);
                }
                v31 = [*(id *)(*((void *)&v48 + 1) + 8 * j) compositeName];
                int v32 = [v25 isEqualToString:v31];

                if (v32)
                {

                  long long v25 = 0;
                  goto LABEL_36;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v61 count:16];
              if (v28) {
                continue;
              }
              break;
            }
LABEL_36:
            v10 = v45;
          }

          long long v23 = [[CNComposeRecipientGroup alloc] initWithChildren:v26 displayString:v25];
          [(CNComposeRecipient *)v23 setAutocompleteResult:v10];

          uint64_t v8 = v39;
          uint64_t v7 = v40;
          if (v23)
          {
LABEL_38:
            v33 = [(CNContactsAutocompleteSearchOperation *)self originContextForResult:v10];
            [(CNComposeRecipient *)v23 setOriginContext:v33];

            [v42 addObject:v23];
          }
        }
        else
        {
          long long v23 = +[CNComposeRecipient composeRecipientWithAutocompleteResult:v10];
          if (v23) {
            goto LABEL_38;
          }
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (!v7)
      {
LABEL_41:

        v34 = [MEMORY[0x1E4F5A4F0] defaultProvider];
        v35 = [v34 mainThreadScheduler];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __77__CNContactsAutocompleteSearchOperation_autocompleteFetch_didReceiveResults___block_invoke;
        v46[3] = &unk_1E61283C0;
        v46[4] = self;
        id v47 = v42;
        id v36 = v42;
        id v37 = (id)[v35 afterDelay:v46 performBlock:0.0];

        id v5 = v38;
        break;
      }
    }
  }
}

void __77__CNContactsAutocompleteSearchOperation_autocompleteFetch_didReceiveResults___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) owner];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 unifyRecipientsIfNeccesary:*(void *)(a1 + 40)];
  uint64_t v4 = [*(id *)(a1 + 32) taskID];
  [v5 _handleContactsAutocompleteSearch:v2 returnedResults:v3 taskID:v4];
}

- (id)originContextForResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sourceType] & 2;
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL | [v4 sourceType] & 1;
  if (([v4 sourceType] & 0x48) != 0) {
    uint64_t v7 = v6 | 8;
  }
  else {
    uint64_t v7 = v6;
  }
  unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFEFLL | (16 * (((unint64_t)[v4 sourceType] >> 2) & 1));
  uint64_t v9 = [v4 sourceType];

  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v8 | 2;
  }
  v11 = objc_alloc_init(CNComposeRecipientOriginContext);
  id v12 = [(CNAutocompleteSearchOperation *)self text];
  [(CNComposeRecipientOriginContext *)v11 setSearchTerm:v12];

  [(CNComposeRecipientOriginContext *)v11 setResultType:v10];

  return v11;
}

- (id)unifyRecipientsIfNeccesary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNContactsAutocompleteSearchOperation *)self shouldUnifyResults])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v33 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v12 = -[CNContactsAutocompleteSearchOperation unifyingIdentifierForRecipient:](self, "unifyingIdentifierForRecipient:", v11, v33);
          if (([v11 isGroup] & 1) == 0 && v12)
          {
            id v13 = [v5 objectForKeyedSubscript:v12];
            uint64_t v14 = v13;
            if (v13)
            {
              [v13 arrayByAddingObject:v11];
            }
            else
            {
              v45 = v11;
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
            id v15 = };
            [v5 setObject:v15 forKeyedSubscript:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v8);
    }

    id v16 = (id)objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v6;
    uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          if (objc_msgSend(v21, "isGroup", v33))
          {
            [v16 addObject:v21];
          }
          else
          {
            long long v22 = [(CNContactsAutocompleteSearchOperation *)self unifyingIdentifierForRecipient:v21];
            long long v23 = [v5 objectForKeyedSubscript:v22];
            long long v24 = v23;
            if (v23)
            {
              id v25 = v23;
            }
            else
            {
              v43 = v21;
              id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
            }
            id v26 = v25;

            uint64_t v27 = [v26 firstObject];

            if (v21 == v27)
            {
              uint64_t v28 = [(CNAutocompleteSearchOperation *)self owner];
              uint64_t v29 = [v28 autocompleteSearchType];

              if (v29) {
                [v26 firstObject];
              }
              else {
              v30 = [(CNContactsAutocompleteSearchOperation *)self defaultChildForUnifiedEmailRecipients:v26];
              }
              v31 = [[CNUnifiedComposeRecipient alloc] initWithChildren:v26 defaultChild:v30];
              [v16 addObject:v31];
            }
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v18);
    }

    id v4 = v33;
  }
  else
  {
    id v16 = v4;
  }

  return v16;
}

- (id)defaultChildForUnifiedEmailRecipients:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNAutocompleteSearchOperation *)self owner];
  uint64_t v6 = [v5 autocompleteSearchType];

  if (v6 || (unint64_t)[v4 count] <= 1)
  {
    long long v23 = [v4 firstObject];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v31 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v15 = [v14 address];
          [v7 addObject:v15];

          id v16 = [v14 address];
          uint64_t v17 = [v8 objectForKeyedSubscript:v16];

          if (!v17)
          {
            uint64_t v18 = [v14 address];
            [v8 setObject:v14 forKeyedSubscript:v18];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);
    }

    uint64_t v19 = [(CNContactsAutocompleteSearchOperation *)self fetchContext];
    uint64_t v20 = [v19 sendingAddress];
    long long v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v25 = [(CNContactsAutocompleteSearchOperation *)self fetchContext];
      id v26 = [v25 otherAddressesAlreadyChosen];
      id v22 = [v26 firstObject];
    }
    id v4 = v31;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()
      && (uint64_t v27 = [MEMORY[0x1E4F605B0] rangeOfAddressDomainFromAddress:v22], v27 != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v29 = objc_msgSend(v22, "substringWithRange:", v27, v28);
    }
    else
    {
      uint64_t v29 = 0;
    }
    v30 = [MEMORY[0x1E4F1BA28] bestGuessEmailAddressForAddresses:v7 sendingAddressDomain:v29 alreadyDuetRanked:1];
    long long v23 = [v8 objectForKeyedSubscript:v30];
    if (!v23)
    {
      long long v23 = [v9 firstObject];
    }
  }

  return v23;
}

- (id)unifyingIdentifierForRecipient:(id)a3
{
  id v3 = [a3 autocompleteResult];
  id v4 = [v3 identifier];

  return v4;
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  fetchRequestPromise = self->_fetchRequestPromise;
  objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CNPromise *)fetchRequestPromise finishWithResult:v4];
}

- (CNCancelationToken)fetchRequestToken
{
  return self->_fetchRequestToken;
}

- (void)setFetchRequestToken:(id)a3
{
}

- (CNPromise)fetchRequestPromise
{
  return self->_fetchRequestPromise;
}

- (void)setFetchRequestPromise:(id)a3
{
}

- (BOOL)includeContacts
{
  return self->_includeContacts;
}

- (void)setIncludeContacts:(BOOL)a3
{
  self->_includeContacts = a3;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (void)setIncludeRecents:(BOOL)a3
{
  self->_includeRecents = a3;
}

- (BOOL)includeStewie
{
  return self->_includeStewie;
}

- (void)setIncludeStewie:(BOOL)a3
{
  self->_includeStewie = a3;
}

- (BOOL)includeSuggestions
{
  return self->_includeSuggestions;
}

- (void)setIncludeSuggestions:(BOOL)a3
{
  self->_includeSuggestions = a3;
}

- (BOOL)includeServers
{
  return self->_includeServers;
}

- (void)setIncludeServers:(BOOL)a3
{
  self->_includeServers = a3;
}

- (NSNumber)shouldIncludeGroupResults
{
  return self->_shouldIncludeGroupResults;
}

- (void)setShouldIncludeGroupResults:(id)a3
{
}

- (BOOL)shouldUnifyResults
{
  return self->_shouldUnifyResults;
}

- (void)setShouldUnifyResults:(BOOL)a3
{
  self->_shouldUnifyResults = a3;
}

- (int64_t)addressableGroupResultStyle
{
  return self->_addressableGroupResultStyle;
}

- (void)setAddressableGroupResultStyle:(int64_t)a3
{
  self->_addressableGroupResultStyle = a3;
}

- (BOOL)simulateResults
{
  return self->_simulateResults;
}

- (void)setSimulateResults:(BOOL)a3
{
  self->_simulateResults = a3;
}

- (CNAutocompleteFetchContext)fetchContext
{
  return self->_fetchContext;
}

- (void)setFetchContext:(id)a3
{
}

- (CNAutocompleteStore)autocompleteStore
{
  return self->_autocompleteStore;
}

- (void)setAutocompleteStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteStore, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_shouldIncludeGroupResults, 0);
  objc_storeStrong((id *)&self->_fetchRequestPromise, 0);

  objc_storeStrong((id *)&self->_fetchRequestToken, 0);
}

void __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)autocompleteFetch:(void *)a3 didReceiveResults:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = objc_msgSend(a2, "ef_publicDescription");
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1B5AF5000, a4, OS_LOG_TYPE_ERROR, "Error fetching members for contact of type CNAutocompleteResultTypeGroup: %{public}@", a1, 0xCu);
}

@end