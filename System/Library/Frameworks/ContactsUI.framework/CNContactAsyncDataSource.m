@interface CNContactAsyncDataSource
- (BOOL)canReload;
- (BOOL)shouldReturnToAccountsAndGroupsViewAfterSearchIsCanceled;
- (CNCancelable)reloadStreamCancelationToken;
- (CNCancelable)searchCancelationToken;
- (CNContactAsyncDataSource)initWithStore:(id)a3;
- (CNContactDataSourceDelegate)delegate;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)store;
- (CNContactStoreFilter)filter;
- (CNPublishingSubject)reloadStream;
- (CNSchedulerProvider)reloadSchedulerProvider;
- (NSArray)allKeysToFetchForTransientContacts;
- (NSArray)contacts;
- (NSArray)indexSections;
- (NSArray)sections;
- (NSDictionary)contactMatchInfos;
- (NSMutableArray)resultingContacts;
- (NSString)displayName;
- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForContact:(id)a3;
- (id)preferredForNameMeContactIdentifier;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateResults;
- (void)invalidateSearch;
- (void)reload;
- (void)reloadWithRequest:(id)a3;
- (void)setAllKeysToFetchForTransientContacts:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setReloadSchedulerProvider:(id)a3;
- (void)setReloadStream:(id)a3;
- (void)setReloadStreamCancelationToken:(id)a3;
- (void)setResultingContacts:(id)a3;
- (void)setSearchCancelationToken:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CNContactAsyncDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingContacts, 0);
  objc_storeStrong((id *)&self->_reloadStream, 0);
  objc_storeStrong((id *)&self->_reloadSchedulerProvider, 0);
  objc_storeStrong((id *)&self->_reloadStreamCancelationToken, 0);
  objc_storeStrong((id *)&self->_searchCancelationToken, 0);
  objc_storeStrong((id *)&self->_allKeysToFetchForTransientContacts, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)setResultingContacts:(id)a3
{
}

- (NSMutableArray)resultingContacts
{
  return self->_resultingContacts;
}

- (void)setReloadStream:(id)a3
{
}

- (CNPublishingSubject)reloadStream
{
  return self->_reloadStream;
}

- (void)setReloadSchedulerProvider:(id)a3
{
}

- (CNSchedulerProvider)reloadSchedulerProvider
{
  return self->_reloadSchedulerProvider;
}

- (void)setReloadStreamCancelationToken:(id)a3
{
}

- (CNCancelable)reloadStreamCancelationToken
{
  return self->_reloadStreamCancelationToken;
}

- (void)setSearchCancelationToken:(id)a3
{
}

- (CNCancelable)searchCancelationToken
{
  return self->_searchCancelationToken;
}

- (void)setAllKeysToFetchForTransientContacts:(id)a3
{
}

- (NSArray)allKeysToFetchForTransientContacts
{
  return self->_allKeysToFetchForTransientContacts;
}

- (void)setFilter:(id)a3
{
}

- (CNContactStoreFilter)filter
{
  return self->_filter;
}

- (void)setStore:(id)a3
{
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)invalidate
{
  [(CNContactAsyncDataSource *)self invalidateSearch];

  [(CNContactAsyncDataSource *)self invalidateResults];
}

- (void)invalidateSearch
{
  v3 = [(CNContactAsyncDataSource *)self searchCancelationToken];
  [v3 cancel];

  [(CNContactAsyncDataSource *)self setNetworkActivityIndicatorVisible:0];
}

- (void)invalidateResults
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [(CNContactAsyncDataSource *)self setResultingContacts:v3];

  id v4 = [(CNContactAsyncDataSource *)self delegate];
  [v4 contactDataSourceDidChange:self];
}

- (void)reloadWithRequest:(id)a3
{
  id v4 = a3;
  [(CNContactAsyncDataSource *)self invalidateSearch];
  v5 = [(CNContactAsyncDataSource *)self filter];
  if (![v5 isServerFilter]) {
    goto LABEL_4;
  }
  v6 = [v5 fullTextString];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    [(CNContactAsyncDataSource *)self setNetworkActivityIndicatorVisible:1];
LABEL_4:
    objc_initWeak(&location, self);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke;
    aBlock[3] = &unk_1E549AFD0;
    objc_copyWeak(&v18, &location);
    aBlock[4] = v19;
    v8 = _Block_copy(aBlock);
    v9 = [(CNContactAsyncDataSource *)self store];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_2;
    v14[3] = &unk_1E549B020;
    objc_copyWeak(&v16, &location);
    id v15 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_4;
    v12[3] = &unk_1E549B048;
    id v10 = v15;
    v12[4] = self;
    id v13 = v10;
    v11 = [v9 executeFetchRequest:v4 progressiveResults:v14 completion:v12];
    [(CNContactAsyncDataSource *)self setSearchCancelationToken:v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    _Block_object_dispose(v19, 8);
    objc_destroyWeak(&location);
  }
}

void __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = WeakRetained;
    [WeakRetained invalidateResults];
    id WeakRetained = v3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_3;
  block[3] = &unk_1E549AFF8;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  block[4] = WeakRetained;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 setNetworkActivityIndicatorVisible:0];
}

void __46__CNContactAsyncDataSource_reloadWithRequest___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = [*(id *)(a1 + 32) resultingContacts];
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 contactDataSourceDidChange:*(void *)(a1 + 32)];
}

- (void)reload
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactAsyncDataSource *)self filter];
  if ([v3 isServerFilter])
  {
    id v4 = [(CNContactAsyncDataSource *)self allKeysToFetchForTransientContacts];
  }
  else
  {
    id v5 = [(CNContactAsyncDataSource *)self contactFormatter];
    id v6 = [v5 descriptorForRequiredKeys];
    v10[0] = v6;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v4];
  id v8 = [(CNContactStoreFilter *)self->_filter predicate];
  [v7 setPredicate:v8];

  id v9 = [(CNContactAsyncDataSource *)self reloadStream];
  [v9 observerDidReceiveResult:v7];
}

- (id)indexPathForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactAsyncDataSource *)self contacts];
  if ([v5 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
      id v8 = [v7 identifier];
      id v9 = [v4 identifier];
      int v10 = [v8 isEqual:v9];

      if (v10) {
        break;
      }

      if (++v6 >= (unint64_t)[v5 count]) {
        goto LABEL_5;
      }
    }
    v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
  }
  else
  {
LABEL_5:
    v11 = 0;
  }

  return v11;
}

- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(CNContactAsyncDataSource *)self filter];
  if ([v9 isServerFilter])
  {
    int v10 = [(CNContactAsyncDataSource *)self resultingContacts];
    int v11 = [v10 containsObject:v7];

    if (v11)
    {
      id v12 = v7;
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v13 = [(CNContactAsyncDataSource *)self store];
  v14 = [v7 identifier];
  id v21 = 0;
  id v12 = [v13 unifiedContactWithIdentifier:v14 keysToFetch:v8 error:&v21];
  id v15 = v21;

  if (v15) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactAsyncDataSource.m", 165, 3, @"Error completing contact: %@", v16, v17, v18, v19, (uint64_t)v15);
  }

LABEL_8:

  return v12;
}

- (NSString)displayName
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"SEARCH_NAV_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  return (NSString *)v3;
}

- (BOOL)canReload
{
  return 1;
}

- (NSArray)indexSections
{
  return 0;
}

- (NSArray)sections
{
  return 0;
}

- (NSDictionary)contactMatchInfos
{
  return 0;
}

- (id)preferredForNameMeContactIdentifier
{
  return 0;
}

- (NSArray)contacts
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = [(CNContactAsyncDataSource *)self resultingContacts];
  id v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (CNContactDataSourceDelegate)delegate
{
  return [(CNContactDataSourceSafeDelegate *)self->_delegate delegate];
}

- (void)setDelegate:(id)a3
{
  id v7 = a3;
  id v4 = [(CNContactDataSourceSafeDelegate *)self->_delegate delegate];

  if (v4 != v7)
  {
    id v5 = [[CNContactDataSourceSafeDelegate alloc] initWithDelegate:v7];
    delegate = self->_delegate;
    self->_delegate = v5;
  }
}

- (BOOL)shouldReturnToAccountsAndGroupsViewAfterSearchIsCanceled
{
  return 1;
}

- (void)dealloc
{
  [(CNContactAsyncDataSource *)self invalidateSearch];
  id v3 = [(CNContactAsyncDataSource *)self reloadStreamCancelationToken];
  [v3 cancel];

  [(CNContactAsyncDataSource *)self setReloadStreamCancelationToken:0];
  v4.receiver = self;
  v4.super_class = (Class)CNContactAsyncDataSource;
  [(CNContactAsyncDataSource *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(CNContactAsyncDataSource *)self store];
  uint64_t v6 = (void *)[v4 initWithStore:v5];

  id v7 = [(CNContactAsyncDataSource *)self resultingContacts];
  id v8 = (void *)[v7 copy];
  [v6 setResultingContacts:v8];

  id v9 = [(CNContactAsyncDataSource *)self contactFormatter];
  [v6 setContactFormatter:v9];

  int v10 = [(CNContactAsyncDataSource *)self allKeysToFetchForTransientContacts];
  [v6 setAllKeysToFetchForTransientContacts:v10];

  int v11 = [(CNContactAsyncDataSource *)self filter];
  [v6 setFilter:v11];

  return v6;
}

- (CNContactAsyncDataSource)initWithStore:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactAsyncDataSource;
  id v5 = [(CNContactAsyncDataSource *)&v18 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(CNContactAsyncDataSource *)v5 setStore:v4];
    id v7 = [MEMORY[0x1E4F1CA48] array];
    [(CNContactAsyncDataSource *)v6 setResultingContacts:v7];

    id v8 = [MEMORY[0x1E4F5A4F0] providerWithBackgroundConcurrencyLimit:1];
    [(CNContactAsyncDataSource *)v6 setReloadSchedulerProvider:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F5A4C0]);
    [(CNContactAsyncDataSource *)v6 setReloadStream:v9];

    int v10 = [(CNContactAsyncDataSource *)v6 reloadStream];
    int v11 = [(CNContactAsyncDataSource *)v6 reloadSchedulerProvider];
    id v12 = [v10 throttle:v11 schedulerProvider:0.75];
    id v13 = [MEMORY[0x1E4F5A488] observerWithWeakTarget:v6 resultSelector:sel_reloadWithRequest_];
    v14 = [v12 subscribe:v13];
    [(CNContactAsyncDataSource *)v6 setReloadStreamCancelationToken:v14];

    uint64_t v15 = objc_opt_new();
    filter = v6->_filter;
    v6->_filter = (CNContactStoreFilter *)v15;
  }
  return v6;
}

@end