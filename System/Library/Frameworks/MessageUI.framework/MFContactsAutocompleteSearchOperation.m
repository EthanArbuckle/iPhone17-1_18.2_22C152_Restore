@interface MFContactsAutocompleteSearchOperation
+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5 autocompleteStore:(id)a6;
- (BOOL)includeContacts;
- (BOOL)includeRecents;
- (BOOL)includeServers;
- (BOOL)includeSuggestions;
- (BOOL)simulateResults;
- (CNAutocompleteFetchContext)fetchContext;
- (CNAutocompleteStore)autocompleteStore;
- (MFContactsAutocompleteSearchOperation)init;
- (id)_simulatedRecipientResults;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetchDidFinish:(id)a3;
- (void)cancel;
- (void)configureForSearchTypes:(unint64_t)a3;
- (void)main;
- (void)setAutocompleteStore:(id)a3;
- (void)setFetchContext:(id)a3;
- (void)setIncludeContacts:(BOOL)a3;
- (void)setIncludeRecents:(BOOL)a3;
- (void)setIncludeServers:(BOOL)a3;
- (void)setIncludeSuggestions:(BOOL)a3;
- (void)setSimulateResults:(BOOL)a3;
@end

@implementation MFContactsAutocompleteSearchOperation

+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5 autocompleteStore:(id)a6
{
  id v10 = a6;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___MFContactsAutocompleteSearchOperation;
  v11 = objc_msgSendSuper2(&v13, sel_operationWithOwner_text_taskID_, a3, a4, a5);
  [v11 setAutocompleteStore:v10];

  return v11;
}

- (MFContactsAutocompleteSearchOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)MFContactsAutocompleteSearchOperation;
  v2 = [(MFContactsAutocompleteSearchOperation *)&v8 init];
  if (v2)
  {
    v3 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
    fetchRequestToken = v2->_fetchRequestToken;
    v2->_fetchRequestToken = v3;

    uint64_t v5 = [MEMORY[0x1E4F60E18] promise];
    fetchRequestPromise = v2->_fetchRequestPromise;
    v2->_fetchRequestPromise = (EFPromise *)v5;

    [(EFCancelationToken *)v2->_fetchRequestToken addCancelable:v2->_fetchRequestPromise];
  }
  return v2;
}

- (void)cancel
{
  [(EFCancelationToken *)self->_fetchRequestToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)MFContactsAutocompleteSearchOperation;
  [(MFContactsAutocompleteSearchOperation *)&v3 cancel];
}

- (void)configureForSearchTypes:(unint64_t)a3
{
  [(MFContactsAutocompleteSearchOperation *)self setIncludeContacts:(a3 >> 1) & 1];
  [(MFContactsAutocompleteSearchOperation *)self setIncludeRecents:(a3 & 5) != 0];
  [(MFContactsAutocompleteSearchOperation *)self setIncludeServers:(a3 >> 3) & 1];

  [(MFContactsAutocompleteSearchOperation *)self setIncludeSuggestions:(a3 >> 4) & 1];
}

- (void)main
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([(MFContactsAutocompleteSearchOperation *)self simulateResults])
  {
    id obj = [(MFContactsAutocompleteSearchOperation *)self _simulatedRecipientResults];
    objc_super v3 = [(CNAutocompleteFetchContext *)self->_fetchContext otherAddressesAlreadyChosen];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id obja = obj;
      uint64_t v6 = [obja countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v45 != v7) {
              objc_enumerationMutation(obja);
            }
            v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            id v10 = [v9 uncommentedAddress];
            v11 = [(CNAutocompleteFetchContext *)self->_fetchContext otherAddressesAlreadyChosen];
            char v12 = [v11 containsObject:v10];

            if ((v12 & 1) == 0) {
              [v5 addObject:v9];
            }
          }
          uint64_t v6 = [obja countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v6);
      }
    }
    else
    {
      uint64_t v5 = obj;
    }
    objc_msgSend(MEMORY[0x1E4F60F28], "__mui_nextRunLoopMainThreadScheduler");
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    v30 = [(MFContactsSearchOperation *)self owner];
    v31 = objc_msgSend(v30, "ef_onScheduler:", v28);
    v32 = [(MFContactsSearchOperation *)self taskID];
    [v31 _handleContactsAutocompleteSearch:self returnedResults:v5 taskID:v32];

    id v25 = [(MFContactsSearchOperation *)self owner];
    v29 = objc_msgSend(v25, "ef_onScheduler:", v28);
    v33 = [(MFContactsSearchOperation *)self taskID];
    [v29 _handleContactsAutocompleteSearchFinished:self taskID:v33];

    goto LABEL_22;
  }
  id objb = [MEMORY[0x1E4F5A068] request];
  objc_super v13 = [(MFContactsSearchOperation *)self text];
  [objb setSearchString:v13];

  v14 = [(MFContactsSearchOperation *)self owner];
  objc_msgSend(objb, "setSearchType:", objc_msgSend(v14, "autocompleteSearchType"));

  [objb setIncludeContacts:self->_includeContacts];
  [objb setIncludeRecents:self->_includeRecents];
  [objb setIncludeSuggestions:self->_includeSuggestions];
  [objb setIncludeDirectoryServers:self->_includeServers];
  v15 = [(CNAutocompleteFetchContext *)self->_fetchContext sendingAddress];

  if (!v15)
  {
    v16 = [(MFContactsSearchOperation *)self owner];
    v17 = [v16 sendingAddress];
    [(CNAutocompleteFetchContext *)self->_fetchContext setSendingAddress:v17];
  }
  v18 = [(CNAutocompleteFetchContext *)self->_fetchContext sendingAddressAccountIdentifier];

  if (!v18)
  {
    v19 = [(MFContactsSearchOperation *)self owner];
    v20 = [v19 sendingAccountIdentifier];
    [(CNAutocompleteFetchContext *)self->_fetchContext setSendingAddressAccountIdentifier:v20];
  }
  [objb setFetchContext:self->_fetchContext];
  if (([(MFContactsAutocompleteSearchOperation *)self isCancelled] & 1) == 0)
  {
    v21 = [(MFContactsSearchOperation *)self taskID];
    v22 = [(MFContactsAutocompleteSearchOperation *)self autocompleteStore];
    v23 = [v22 scheduleFetchRequest:objb delegate:self];

    fetchRequestToken = self->_fetchRequestToken;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __45__MFContactsAutocompleteSearchOperation_main__block_invoke;
    v42[3] = &unk_1E5F79088;
    id v25 = v23;
    id v43 = v25;
    [(EFCancelationToken *)fetchRequestToken addCancelationBlock:v42];
    v26 = [(EFPromise *)self->_fetchRequestPromise future];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v27 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __45__MFContactsAutocompleteSearchOperation_main__block_invoke_2;
    v38[3] = &unk_1E5F7A7B0;
    objc_copyWeak(&v40, &location);
    id v28 = v21;
    id v39 = v28;
    [v26 onScheduler:v27 addSuccessBlock:v38];

    uint64_t v37 = 0;
    [v26 result:&v37];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);

    v29 = v43;
    uint64_t v5 = objb;
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v5 = objb;
LABEL_23:
}

uint64_t __45__MFContactsAutocompleteSearchOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __45__MFContactsAutocompleteSearchOperation_main__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained owner];
  [v2 _handleContactsAutocompleteSearchFinished:WeakRetained taskID:*(void *)(a1 + 32)];
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
}

- (id)_simulatedRecipientResults
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = objc_alloc_init(MFComposeRecipientOriginContext);
  uint64_t v5 = [(MFContactsSearchOperation *)self text];
  [(MFComposeRecipientOriginContext *)v4 setSearchTerm:v5];

  [(MFComposeRecipientOriginContext *)v4 setResultType:16];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__MFContactsAutocompleteSearchOperation__simulatedRecipientResults__block_invoke;
  v11[3] = &unk_1E5F7A6E8;
  uint64_t v6 = v4;
  char v12 = v6;
  id v7 = v3;
  id v13 = v7;
  objc_super v8 = (void (**)(void *, __CFString *))_Block_copy(v11);
  v8[2](v8, @"Rachel Green <rachel@centralp3rk.com>");
  v8[2](v8, @"Phoebe Buffay <phoebe@centralp3rk.com>");
  v8[2](v8, @"Ross Geller <ross@centralp3rk.com>");
  v8[2](v8, @"Monica Geller <monica@centralp3rk.com>");
  id v9 = v7;

  return v9;
}

void __67__MFContactsAutocompleteSearchOperation__simulatedRecipientResults__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_super v3 = [[MFComposeRecipient alloc] initWithContact:0 address:v4 kind:0];
  [(MFComposeRecipient *)v3 setOriginContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v3];
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v25 = a4;
  if (([(MFContactsAutocompleteSearchOperation *)self isCancelled] & 1) == 0)
  {
    v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v25, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v25;
    uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(obj);
          }
          objc_super v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v9 = +[MFComposeRecipient composeRecipientWithAutocompleteResult:v8];
          if (v9)
          {
            id v10 = self;
            char v11 = [v8 sourceType];
            char v12 = [v8 sourceType];
            char v13 = [v8 sourceType];
            unint64_t v14 = [v8 sourceType];
            uint64_t v15 = [v8 sourceType];
            unint64_t v16 = v11 & 2 | (unint64_t)(v12 & 1);
            if ((v13 & 0x48) != 0) {
              v16 |= 8uLL;
            }
            unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFEFLL | (16 * ((v14 >> 2) & 1));
            if (v15) {
              uint64_t v18 = v17;
            }
            else {
              uint64_t v18 = v17 | 2;
            }
            v19 = objc_alloc_init(MFComposeRecipientOriginContext);
            self = v10;
            v20 = [(MFContactsSearchOperation *)v10 text];
            [(MFComposeRecipientOriginContext *)v19 setSearchTerm:v20];

            [(MFComposeRecipientOriginContext *)v19 setResultType:v18];
            [v9 setOriginContext:v19];
            [v27 addObject:v9];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v5);
    }

    v21 = [(MFContactsSearchOperation *)self owner];
    v22 = objc_msgSend(MEMORY[0x1E4F60F28], "__mui_nextRunLoopMainThreadScheduler");
    v23 = objc_msgSend(v21, "ef_onScheduler:", v22);
    v24 = [(MFContactsSearchOperation *)self taskID];
    [v23 _handleContactsAutocompleteSearch:self returnedResults:v27 taskID:v24];
  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  fetchRequestPromise = self->_fetchRequestPromise;
  objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EFPromise finishWithResult:](fetchRequestPromise, "finishWithResult:");
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
  objc_storeStrong((id *)&self->_fetchRequestPromise, 0);

  objc_storeStrong((id *)&self->_fetchRequestToken, 0);
}

@end