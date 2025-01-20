@interface MUIMailboxFilterPersistedStore
- (Class)filterProviderClass;
- (Class)mailboxFilterClass;
- (EFCancelationToken)cancelationToken;
- (MUIMailboxFilterPersistedStore)initWithBaseStoragePath:(id)a3 defaultsRepresentationProvider:(id)a4 filterRepresentationProvider:(id)a5 mailboxFilterClass:(Class)a6 filterProviderClass:(Class)a7;
- (NSMutableDictionary)storage;
- (NSMutableDictionary)viewModelPool;
- (NSString)storagePath;
- (id)_cleanStorageToWrite;
- (id)_filterViewModelForContext:(id)a3;
- (id)_filtersForContext:(id)a3 provider:(id)a4;
- (id)defaultsRepresentationProvider;
- (id)filterRepresentationProvider;
- (id)filterViewModelForContext:(id)a3;
- (void)_load;
- (void)_setFilters:(id)a3 forContext:(id)a4 provider:(id)a5;
- (void)_write;
- (void)dealloc;
- (void)setDefaultsRepresentationProvider:(id)a3;
- (void)setFilterProviderClass:(Class)a3;
- (void)setFilterRepresentationProvider:(id)a3;
- (void)setMailboxFilterClass:(Class)a3;
- (void)setStorage:(id)a3;
@end

@implementation MUIMailboxFilterPersistedStore

- (MUIMailboxFilterPersistedStore)initWithBaseStoragePath:(id)a3 defaultsRepresentationProvider:(id)a4 filterRepresentationProvider:(id)a5 mailboxFilterClass:(Class)a6 filterProviderClass:(Class)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MUIMailboxFilterPersistedStore;
  v15 = [(MUIMailboxFilterPersistedStore *)&v29 init];
  if (v15)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storage = v15->_storage;
    v15->_storage = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    viewModelPool = v15->_viewModelPool;
    v15->_viewModelPool = v18;

    uint64_t v20 = objc_opt_new();
    cancelationToken = v15->_cancelationToken;
    v15->_cancelationToken = (EFCancelationToken *)v20;

    uint64_t v22 = [v12 stringByAppendingPathComponent:@"FiltersPreference.plist"];
    storagePath = v15->_storagePath;
    v15->_storagePath = (NSString *)v22;

    uint64_t v24 = [v13 copy];
    id defaultsRepresentationProvider = v15->_defaultsRepresentationProvider;
    v15->_id defaultsRepresentationProvider = (id)v24;

    uint64_t v26 = [v14 copy];
    id filterRepresentationProvider = v15->_filterRepresentationProvider;
    v15->_id filterRepresentationProvider = (id)v26;

    if (!a6) {
      a6 = (Class)objc_opt_class();
    }
    objc_storeStrong((id *)&v15->_mailboxFilterClass, a6);
    if (!a7) {
      a7 = (Class)objc_opt_class();
    }
    objc_storeStrong((id *)&v15->_filterProviderClass, a7);
    [(MUIMailboxFilterPersistedStore *)v15 _load];
  }

  return v15;
}

- (void)_load
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v4 = [(MUIMailboxFilterPersistedStore *)self storagePath];
  id v8 = (id)[v3 initWithContentsOfFile:v4];

  v5 = [v8 objectForKeyedSubscript:@"version"];
  LODWORD(v4) = [v5 isEqualToString:@"1"];

  if (v4)
  {
    v6 = [v8 objectForKeyedSubscript:@"preference"];
    v7 = (void *)[v6 mutableCopy];
    [(MUIMailboxFilterPersistedStore *)self setStorage:v7];
  }
}

- (NSString)storagePath
{
  return self->_storagePath;
}

- (id)filterViewModelForContext:(id)a3
{
  id v4 = a3;
  v5 = NSStringKeyForStorageFromContext(v4);
  v6 = [(MUIMailboxFilterPersistedStore *)self viewModelPool];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v7 = [(MUIMailboxFilterPersistedStore *)self _filterViewModelForContext:v4];
    id v8 = [(MUIMailboxFilterPersistedStore *)self viewModelPool];
    [v8 setObject:v7 forKeyedSubscript:v5];
  }
  [v7 setFilterContext:v4];

  return v7;
}

- (NSMutableDictionary)viewModelPool
{
  return self->_viewModelPool;
}

- (id)_filterViewModelForContext:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(-[MUIMailboxFilterPersistedStore filterProviderClass](self, "filterProviderClass")), "initWithFilterContext:mailboxFilterClass:", v4, -[MUIMailboxFilterPersistedStore mailboxFilterClass](self, "mailboxFilterClass"));
  v6 = objc_alloc_init(MUIMailboxFiltersFormatter);
  v7 = [(MUIMailboxFilterPersistedStore *)self _filtersForContext:v4 provider:v5];
  id v8 = -[MUIMailboxFilterViewModel initWithProvider:formatter:selectedFilters:isFilteringAvailable:]([MUIMailboxFilterViewModel alloc], "initWithProvider:formatter:selectedFilters:isFilteringAvailable:", v5, v6, v7, [v4 isFilteringAvailable]);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9 = [(MUIMailboxFilterViewModel *)v8 observableSelectedFilters];
  v10 = (void *)MEMORY[0x1E4F60DE0];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __61__MUIMailboxFilterPersistedStore__filterViewModelForContext___block_invoke;
  uint64_t v20 = &unk_1E6D12EB0;
  objc_copyWeak(&v23, &location);
  id v11 = v4;
  id v21 = v11;
  id v12 = v5;
  id v22 = v12;
  id v13 = [v10 observerWithResultBlock:&v17];
  id v14 = objc_msgSend(v9, "subscribe:", v13, v17, v18, v19, v20);

  v15 = [(MUIMailboxFilterPersistedStore *)self cancelationToken];
  [v15 addCancelable:v14];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v8;
}

- (Class)mailboxFilterClass
{
  return self->_mailboxFilterClass;
}

- (Class)filterProviderClass
{
  return self->_filterProviderClass;
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (id)_filtersForContext:(id)a3 provider:(id)a4
{
  id v6 = a4;
  v7 = NSStringKeyForStorageFromContext(a3);
  id v8 = [(MUIMailboxFilterPersistedStore *)self filterRepresentationProvider];
  v9 = [(MUIMailboxFilterPersistedStore *)self storage];
  v10 = [v9 objectForKeyedSubscript:v7];
  id v11 = ((void (**)(void, void *, id))v8)[2](v8, v10, v6);

  return v11;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (id)filterRepresentationProvider
{
  return self->_filterRepresentationProvider;
}

uint64_t ___ef_log_MUIMailboxFilterPersistedStore_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MUIMailboxFilterPersistedStore");
  uint64_t v1 = _ef_log_MUIMailboxFilterPersistedStore_log;
  _ef_log_MUIMailboxFilterPersistedStore_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_cancelationToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)MUIMailboxFilterPersistedStore;
  [(MUIMailboxFilterPersistedStore *)&v3 dealloc];
}

void __61__MUIMailboxFilterPersistedStore__filterViewModelForContext___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _setFilters:v4 forContext:*(void *)(a1 + 32) provider:*(void *)(a1 + 40)];
}

- (void)_setFilters:(id)a3 forContext:(id)a4 provider:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  NSStringKeyForStorageFromContext(v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = [(MUIMailboxFilterPersistedStore *)self defaultsRepresentationProvider];
  v10 = ((void (**)(void, id))v9)[2](v9, v8);

  id v11 = [(MUIMailboxFilterPersistedStore *)self storage];
  [v11 setObject:v10 forKeyedSubscript:v13];

  id v12 = [v7 focus];

  if (!v12) {
    [(MUIMailboxFilterPersistedStore *)self _write];
  }
}

- (void)_write
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a1, "ef_publicDescription");
  id v6 = objc_msgSend(a2, "ef_publicDescription");
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "error while saving filter preference: %{public}@ - %{public}@", (uint8_t *)&v7, 0x16u);
}

- (id)_cleanStorageToWrite
{
  v2 = [(MUIMailboxFilterPersistedStore *)self storage];
  objc_super v3 = objc_msgSend(v2, "ef_filter:", &__block_literal_global_26);

  return v3;
}

BOOL __54__MUIMailboxFilterPersistedStore__cleanStorageToWrite__block_invoke(uint64_t a1, void *a2)
{
  return [a2 rangeOfString:@"Focus"] == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setStorage:(id)a3
{
}

- (id)defaultsRepresentationProvider
{
  return self->_defaultsRepresentationProvider;
}

- (void)setDefaultsRepresentationProvider:(id)a3
{
}

- (void)setFilterRepresentationProvider:(id)a3
{
}

- (void)setMailboxFilterClass:(Class)a3
{
}

- (void)setFilterProviderClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterProviderClass, 0);
  objc_storeStrong((id *)&self->_mailboxFilterClass, 0);
  objc_storeStrong(&self->_filterRepresentationProvider, 0);
  objc_storeStrong(&self->_defaultsRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_viewModelPool, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
}

@end