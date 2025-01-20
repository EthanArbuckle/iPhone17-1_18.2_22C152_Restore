@interface CNContactStoreDataSource
+ (BOOL)isErrorPossiblyRelatedToExtraStores:(id)a3;
+ (id)keyPathsForValuesAffectingEffectiveFilter;
- (BOOL)canReload;
- (BOOL)canUseTitleForAccount:(id)a3;
- (BOOL)doesFilterShowAllContainersForAccount:(id)a3;
- (BOOL)fetchUnified;
- (BOOL)filterShowsSingleExchangeFolder;
- (BOOL)filterShowsSingleGroup;
- (BOOL)isLoading;
- (BOOL)meContactNeedsUpdate;
- (BOOL)setMeContact:(id)a3 error:(id *)a4;
- (BOOL)shouldRevalidateFilterOnStoreChange;
- (CNCoalescingTimer)contactStoreDidChangeCoalescer;
- (CNContact)meContact;
- (CNContactDataSourceDelegate)delegate;
- (CNContactFilter)effectiveFilter;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)store;
- (CNContactStoreDataSource)initWithStore:(id)a3;
- (CNContactStoreFilter)filter;
- (CNContactStoreSnapshot)currentSnapshot;
- (CNContainer)filteredContainer;
- (CNGroup)filteredGroup;
- (CNManagedConfiguration)managedConfiguration;
- (NSArray)contacts;
- (NSArray)indexSections;
- (NSArray)indexSectionsArray;
- (NSArray)keysToFetch;
- (NSArray)sections;
- (NSDictionary)contactMatchInfos;
- (NSDictionary)localizedSectionHeaders;
- (NSDictionary)localizedSectionIndices;
- (NSDictionary)sectionHeadersDictionary;
- (NSString)displayName;
- (id)accountForContainerIdentifier:(id)a3;
- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForContact:(id)a3;
- (id)preferredForNameMeContactIdentifier;
- (id)preferredForNameMeContactWithKeysToFetch:(id)a3;
- (id)titleForContainer:(id)a3;
- (id)withReloadLock_prepareNewSnapshot;
- (int64_t)sortOrder;
- (void)_reloadWithSchedulingMethod:(unint64_t)a3;
- (void)contactStoreDidChange:(id)a3;
- (void)contactStoreDidChangeHandler;
- (void)contactStoreMeContactDidChange:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerForRelevantChangeNotifications;
- (void)reload;
- (void)reloadAsynchronously;
- (void)reset;
- (void)setContactFormatter:(id)a3;
- (void)setContactStoreDidChangeCoalescer:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchUnified:(BOOL)a3;
- (void)setFilter:(id)a3;
- (void)setFilteredContainer:(id)a3;
- (void)setFilteredGroup:(id)a3;
- (void)setKeysToFetch:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setMeContactNeedsUpdate:(BOOL)a3;
- (void)setShouldRevalidateFilterOnStoreChange:(BOOL)a3;
- (void)setStore:(id)a3;
- (void)validateFilter;
@end

@implementation CNContactStoreDataSource

- (NSArray)indexSections
{
  v2 = [(CNContactStoreDataSource *)self currentSnapshot];
  v3 = [v2 indexSections];

  return (NSArray *)v3;
}

- (NSArray)sections
{
  v2 = [(CNContactStoreDataSource *)self currentSnapshot];
  v3 = [v2 sections];

  return (NSArray *)v3;
}

- (NSArray)contacts
{
  v2 = [(CNContactStoreDataSource *)self currentSnapshot];
  v3 = [v2 contacts];

  return (NSArray *)v3;
}

- (CNContactStoreSnapshot)currentSnapshot
{
  currentSnapshot = self->_currentSnapshot;
  if (!currentSnapshot)
  {
    if (self->_loadingSnapshot)
    {
      currentSnapshot = 0;
    }
    else
    {
      [(CNContactStoreDataSource *)self reload];
      currentSnapshot = self->_currentSnapshot;
    }
  }

  return currentSnapshot;
}

- (BOOL)isLoading
{
  return self->_loadingSnapshot;
}

- (CNContactStore)store
{
  return self->_store;
}

- (NSDictionary)sectionHeadersDictionary
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = +[CNUIContactsEnvironment currentEnvironment];
  v3 = [v2 collation];

  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v19 = v3;
  obuint64_t j = [v3 headerLanguages];
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v10 = [v9 sections];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              v16 = [v15 ICUSortKey];
              if (v16)
              {
                v17 = [v15 key];
                [v4 setObject:v17 forKey:v16];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v4;
}

- (void)reload
{
}

- (NSDictionary)contactMatchInfos
{
  v2 = [(CNContactStoreDataSource *)self currentSnapshot];
  v3 = [v2 contactMatchInfos];

  return (NSDictionary *)v3;
}

- (int64_t)sortOrder
{
  v2 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  int64_t v3 = [v2 sortOrder];

  return v3;
}

- (BOOL)fetchUnified
{
  return self->_fetchUnified;
}

- (CNContactFormatter)contactFormatter
{
  return self->contactFormatter;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

uint64_t __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke_186(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "withReloadLock_prepareNewSnapshot");
}

- (id)preferredForNameMeContactWithKeysToFetch:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ([(CNContactStoreDataSource *)v5 meContactNeedsUpdate]
    || ([(CNContactStoreDataSource *)v5 meContact], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([(CNContactStoreDataSource *)v5 meContact],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 areKeysAvailable:v4],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = v9;
    if (v4) {
      [v9 addObjectsFromArray:v4];
    }
    uint64_t v11 = [(CNContactStoreDataSource *)v5 meContact];

    if (v11)
    {
      uint64_t v12 = [(CNContactStoreDataSource *)v5 meContact];
      uint64_t v13 = [v12 availableKeyDescriptor];
      [v10 addObject:v13];
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v10];
    v15 = [MEMORY[0x1E4F1B8F8] predicateForMeContact];
    [v14 setPredicate:v15];

    [v14 setUnifyResults:0];
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    long long v27 = __Block_byref_object_copy__54888;
    long long v28 = __Block_byref_object_dispose__54889;
    id v29 = 0;
    v16 = [(CNContactStoreDataSource *)v5 store];
    v22[4] = &v24;
    id v23 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__CNContactStoreDataSource_preferredForNameMeContactWithKeysToFetch___block_invoke;
    v22[3] = &unk_1E549B878;
    char v17 = [v16 enumerateNonUnifiedContactsWithFetchRequest:v14 error:&v23 usingBlock:v22];
    id v18 = v23;

    if (v17)
    {
      [(CNContactStoreDataSource *)v5 setMeContactNeedsUpdate:0];
      [(CNContactStoreDataSource *)v5 setMeContact:v25[5]];
    }
    else
    {
      v19 = CNUILogContactStoreDataSource();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v18;
        _os_log_error_impl(&dword_18B625000, v19, OS_LOG_TYPE_ERROR, "Error fetching the me card: %@", buf, 0xCu);
      }
    }
    _Block_object_dispose(&v24, 8);
  }
  v20 = [(CNContactStoreDataSource *)v5 meContact];
  objc_sync_exit(v5);

  return v20;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (BOOL)meContactNeedsUpdate
{
  return self->_meContactNeedsUpdate;
}

- (void)setMeContactNeedsUpdate:(BOOL)a3
{
  self->_meContactNeedsUpdate = a3;
}

- (void)setMeContact:(id)a3
{
}

- (BOOL)filterShowsSingleGroup
{
  int64_t v3 = [(CNContactStoreDataSource *)self filter];
  id v4 = [v3 groupIdentifiers];
  if ([v4 count] == 1)
  {
    uint64_t v5 = [(CNContactStoreDataSource *)self filter];
    uint64_t v6 = [v5 containerIdentifiers];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)filterShowsSingleExchangeFolder
{
  v2 = [(CNContactStoreDataSource *)self filteredContainer];
  int64_t v3 = v2;
  if (v2) {
    BOOL v4 = [v2 type] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (CNContainer)filteredContainer
{
  v26[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CNContactStoreDataSource *)self filter];
  BOOL v4 = [v3 containerIdentifiers];
  if ([v4 count] != 1)
  {

    goto LABEL_8;
  }
  uint64_t v5 = [(CNContactStoreDataSource *)self filter];
  uint64_t v6 = [v5 groupIdentifiers];
  uint64_t v7 = [v6 count];

  if (v7)
  {
LABEL_8:
    filteredContainer = self->_filteredContainer;
    self->_filteredContainer = 0;

    uint64_t v13 = 0;
    goto LABEL_9;
  }
  char v8 = [(CNContactStoreDataSource *)self filter];
  v9 = [v8 containerIdentifiers];
  v10 = [v9 allObjects];
  uint64_t v11 = [v10 firstObject];

  uint64_t v12 = self->_filteredContainer;
  if (v11)
  {
    uint64_t v13 = v12;
    v14 = self->_filteredContainer;
    if (!v14
      || ([(CNContainer *)v14 identifier],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 isEqualToString:v11],
          v15,
          (v16 & 1) == 0))
    {

      char v17 = (void *)MEMORY[0x1E4F1B9B0];
      v26[0] = v11;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      v19 = [v17 predicateForContainersWithIdentifiers:v18];

      v20 = [(CNContactStoreDataSource *)self store];
      long long v21 = [v20 containersMatchingPredicate:v19 error:0];

      long long v22 = [v21 firstObject];
      id v23 = self->_filteredContainer;
      self->_filteredContainer = v22;

      uint64_t v13 = self->_filteredContainer;
    }
  }
  else
  {
    self->_filteredContainer = 0;

    uint64_t v13 = 0;
  }

LABEL_9:

  return v13;
}

- (NSString)displayName
{
  int64_t v3 = [(CNContactStoreDataSource *)self filter];
  BOOL v4 = [v3 customDisplayName];

  uint64_t v5 = [(CNContactStoreDataSource *)self filter];
  uint64_t v6 = [v5 customDisplayName];

  if (!v6)
  {

    uint64_t v7 = CNContactsUIBundle();
    BOOL v4 = [v7 localizedStringForKey:@"SEARCH_NAV_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

    char v8 = [(CNContactStoreDataSource *)self filter];
    v9 = [v8 fullTextString];
    uint64_t v10 = [v9 length];

    if (!v10)
    {

      uint64_t v11 = CNContactsUIBundle();
      BOOL v4 = [v11 localizedStringForKey:@"ALL_CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];

      uint64_t v12 = [(CNContactStoreDataSource *)self filter];
      uint64_t v13 = [v12 containerIdentifiers];
      if (v13)
      {
      }
      else
      {
        v14 = [(CNContactStoreDataSource *)self filter];
        v15 = [v14 groupIdentifiers];

        if (!v15) {
          goto LABEL_17;
        }
      }

      char v16 = [(CNContactStoreDataSource *)self filteredGroup];
      char v17 = v16;
      if (v16)
      {
        uint64_t v18 = *MEMORY[0x1E4F5A2A0];
        v19 = [v16 name];
        if ((*(uint64_t (**)(uint64_t, void *))(v18 + 16))(v18, v19))
        {
          BOOL v4 = [v17 name];
        }
        else
        {
          long long v25 = CNContactsUIBundle();
          BOOL v4 = [v25 localizedStringForKey:@"CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
        }
        goto LABEL_16;
      }
      v19 = [(CNContactStoreDataSource *)self filteredContainer];
      v20 = [(CNContactStoreDataSource *)self titleForContainer:v19];
      BOOL v4 = v20;
      if (v19)
      {
LABEL_16:

        goto LABEL_17;
      }

      long long v21 = [(CNContactStoreDataSource *)self filter];
      long long v22 = [v21 containerIdentifiers];
      id v23 = [v22 anyObject];

      if (v23)
      {
        uint64_t v24 = [(CNContactStoreDataSource *)self accountForContainerIdentifier:v23];
        BOOL v4 = objc_msgSend(v24, "_cnui_displayName");
        if ([(CNContactStoreDataSource *)self canUseTitleForAccount:v24])
        {
LABEL_14:

          v19 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v24 = CNContactsUIBundle();
      BOOL v4 = [v24 localizedStringForKey:@"CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
      goto LABEL_14;
    }
  }
LABEL_17:

  return (NSString *)v4;
}

- (CNContactStoreFilter)filter
{
  return self->_filter;
}

- (void)setContactFormatter:(id)a3
{
}

- (id)withReloadLock_prepareNewSnapshot
{
  int64_t v3 = objc_alloc_init(CNContactStoreSnapshot);
  [(CNContactStoreSnapshot *)v3 setDataSource:self];
  [(CNContactStoreSnapshot *)v3 setFilter:self->_filter];
  [(CNContactStoreSnapshot *)v3 setManagedConfiguration:self->_managedConfiguration];
  [(CNContactStoreSnapshot *)v3 prepareEnoughContacts];

  return v3;
}

void __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke_189(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentSnapshot:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  v2 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v3 = 0;
    _os_log_impl(&dword_18B625000, v2, OS_LOG_TYPE_DEFAULT, "Did reload snapshot", v3, 2u);
  }
}

- (void)setCurrentSnapshot:(id)a3
{
  uint64_t v5 = (CNContactStoreSnapshot *)a3;
  if (self->_currentSnapshot != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_currentSnapshot, a3);
    uint64_t v6 = [(CNContactStoreDataSource *)self delegate];
    [v6 contactDataSourceDidChange:self];

    uint64_t v5 = v7;
  }
}

- (CNContactDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (CNContactDataSourceDelegate *)WeakRetained;
}

void __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18B625000, v2, OS_LOG_TYPE_DEBUG, "Will calculate snapshot", buf, 2u);
  }

  int64_t v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  BOOL v4 = [v3 timeProvider];
  [v4 timestamp];
  double v6 = v5;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  long long v21 = __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke_186;
  long long v22 = &unk_1E549AAD8;
  uint64_t v23 = v7;
  char v8 = CNResultWithLock();
  v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v10 = [v9 timeProvider];
  [v10 timestamp];
  double v12 = v11;

  uint64_t v13 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v12 - v6];
  v14 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    long long v25 = v13;
    _os_log_debug_impl(&dword_18B625000, v14, OS_LOG_TYPE_DEBUG, "Did calculate snapshot %{public}@", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke_189;
  v17[3] = &unk_1E549BF80;
  v15 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  id v18 = v8;
  id v16 = v8;
  [v15 performBlock:v17];
}

- (void)setShouldRevalidateFilterOnStoreChange:(BOOL)a3
{
  self->_shouldRevalidateFilterOnStoreChange = a3;
}

- (void)reset
{
  self->_loadingSnapshot = 1;
  [(CNContactStoreDataSource *)self setCurrentSnapshot:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double v5 = [(CNContactStoreDataSource *)self store];
  double v6 = (void *)[v4 initWithStore:v5];

  uint64_t v7 = [(CNContactStoreDataSource *)self contactFormatter];
  [v6 setContactFormatter:v7];

  char v8 = [(CNContactStoreDataSource *)self keysToFetch];
  [v6 setKeysToFetch:v8];

  v9 = [(CNContactStoreDataSource *)self filter];
  uint64_t v10 = (void *)[v9 copy];
  [v6 setFilter:v10];

  objc_msgSend(v6, "setFetchUnified:", -[CNContactStoreDataSource fetchUnified](self, "fetchUnified"));
  return v6;
}

- (void)setKeysToFetch:(id)a3
{
}

- (void)setFilter:(id)a3
{
  id v4 = a3;
  if (([v4 isEqual:self->_filter] & 1) == 0)
  {
    double v5 = (CNContactStoreFilter *)[v4 copy];
    filter = self->_filter;
    self->_filter = v5;

    if (!self->_filter)
    {
      uint64_t v7 = objc_alloc_init(CNContactStoreFilter);
      char v8 = self->_filter;
      self->_filter = v7;
    }
    v9 = [(CNContactStoreDataSource *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      mainThreadScheduler = self->_mainThreadScheduler;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __38__CNContactStoreDataSource_setFilter___block_invoke;
      v16[3] = &unk_1E549B488;
      v16[4] = self;
      [(CNScheduler *)mainThreadScheduler performBlock:v16];
    }
    double v12 = [(CNContactStoreDataSource *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = self->_mainThreadScheduler;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __38__CNContactStoreDataSource_setFilter___block_invoke_2;
      v15[3] = &unk_1E549B488;
      v15[4] = self;
      [(CNScheduler *)v14 performBlock:v15];
    }
  }
}

- (void)setFetchUnified:(BOOL)a3
{
  self->_fetchUnified = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)_reloadWithSchedulingMethod:(unint64_t)a3
{
  double v5 = CNUILogContactStoreDataSource();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "Will reload snapshot (asynchronously)", buf, 2u);
    }

    uint64_t v7 = self->_backgroundSnapshotScheduler;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEBUG, "Will reload snapshot (inline)", buf, 2u);
    }

    char v8 = +[CNUIContactsEnvironment currentEnvironment];
    v9 = [v8 defaultSchedulerProvider];
    uint64_t v7 = [v9 immediateScheduler];
  }
  char v10 = self->_mainThreadScheduler;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__CNContactStoreDataSource__reloadWithSchedulingMethod___block_invoke;
  v12[3] = &unk_1E549BF80;
  v12[4] = self;
  char v13 = v10;
  double v11 = v10;
  [(CNScheduler *)v7 performBlock:v12];
}

- (NSArray)indexSectionsArray
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = +[CNUIContactsEnvironment currentEnvironment];
  int64_t v3 = [v2 collation];

  id v4 = (void *)MEMORY[0x1E4F1CA48];
  double v5 = [v3 indexSections];
  BOOL v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v3, "indexSections", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = objc_alloc_init(CNContactSection);
        v14 = [v12 localizedName];
        [(CNContactSection *)v13 setTitle:v14];

        v15 = [v12 key];
        [(CNContactSection *)v13 setIdentifier:v15];

        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v16 = objc_alloc_init(CNContactSection);
  [(CNContactSection *)v16 setTitle:@"#"];
  [v6 addObject:v16];

  return (NSArray *)v6;
}

- (NSDictionary)localizedSectionHeaders
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = +[CNUIContactsEnvironment currentEnvironment];
  int64_t v3 = [v2 collation];

  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v19 = v3;
  obuint64_t j = [v3 headerLanguages];
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v10 = [v9 sections];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              id v16 = [v15 localizedName];
              if (v16)
              {
                char v17 = [v15 key];
                [v4 setObject:v16 forKey:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v4;
}

- (CNContactStoreDataSource)initWithStore:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  if (([v4 isMainThread] & 1) == 0)
  {
    uint64_t v6 = CNUILogContactStoreDataSource();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "Don't call +[CNContactStoreDataSource initWithStore:] from non main thread, this will throw in the near future", buf, 2u);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)CNContactStoreDataSource;
  uint64_t v7 = [(CNContactStoreDataSource *)&v21 init];
  uint64_t v8 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v9 = [v8 defaultSchedulerProvider];

  uint64_t v10 = [v9 mainThreadScheduler];
  mainThreadScheduler = v7->_mainThreadScheduler;
  v7->_mainThreadScheduler = (CNScheduler *)v10;

  uint64_t v12 = [v9 newSerialSchedulerWithName:@"ContactStoreDidChange preprocessor"];
  databaseChangePreprocessor = v7->_databaseChangePreprocessor;
  v7->_databaseChangePreprocessor = (CNScheduler *)v12;

  [(CNContactStoreDataSource *)v7 setStore:v5];
  [(CNContactStoreDataSource *)v7 registerForRelevantChangeNotifications];
  v14 = objc_alloc_init(CNContactStoreFilter);
  filter = v7->_filter;
  v7->_filter = v14;

  uint64_t v16 = [v9 newSerialSchedulerWithName:@"com.apple.contacts.ui.store-snapshotting"];
  backgroundSnapshotScheduler = v7->_backgroundSnapshotScheduler;
  v7->_backgroundSnapshotScheduler = (CNScheduler *)v16;

  long long v18 = (NSLocking *)objc_alloc_init(MEMORY[0x1E4F5A558]);
  reloadLock = v7->_reloadLock;
  v7->_reloadLock = v18;

  v7->_meContactNeedsUpdate = 1;
  return v7;
}

- (void)setStore:(id)a3
{
}

- (void)registerForRelevantChangeNotifications
{
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_contactStoreDidChange_ name:*MEMORY[0x1E4F1AF80] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_contactStoreMeContactDidChange_ name:*MEMORY[0x1E4F1AF88] object:0];

  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 addObserver:self selector:sel_contactStoreMeContactDidChange_ name:*MEMORY[0x1E4F5A180] object:0];

  uint64_t v6 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  [v6 addObserver:self forKeyPath:@"sortOrder" options:0 context:0];

  uint64_t v7 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v8 = [v7 defaultSchedulerProvider];

  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x1E4F5A370]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __66__CNContactStoreDataSource_registerForRelevantChangeNotifications__block_invoke;
  v14 = &unk_1E549B600;
  objc_copyWeak(&v15, &location);
  uint64_t v10 = (void *)[v9 initWithDelay:1 options:&v11 block:v8 schedulerProvider:self->_databaseChangePreprocessor downstreamScheduler:2.0];
  -[CNContactStoreDataSource setContactStoreDidChangeCoalescer:](self, "setContactStoreDidChangeCoalescer:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)setContactStoreDidChangeCoalescer:(id)a3
{
}

void __69__CNContactStoreDataSource_preferredForNameMeContactWithKeysToFetch___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeCoalescer, 0);
  objc_storeStrong((id *)&self->_localizedSectionIndices, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_filteredContainer, 0);
  objc_storeStrong((id *)&self->_filteredGroup, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->contactFormatter, 0);
  objc_storeStrong((id *)&self->_databaseChangePreprocessor, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_reloadLock, 0);
  objc_storeStrong((id *)&self->_backgroundSnapshotScheduler, 0);
  objc_storeStrong((id *)&self->_sectionHeadersDictionary, 0);

  objc_storeStrong((id *)&self->_currentSnapshot, 0);
}

- (CNCoalescingTimer)contactStoreDidChangeCoalescer
{
  return self->_contactStoreDidChangeCoalescer;
}

- (NSDictionary)localizedSectionIndices
{
  return self->_localizedSectionIndices;
}

- (void)setFilteredContainer:(id)a3
{
}

- (void)setFilteredGroup:(id)a3
{
}

- (void)setManagedConfiguration:(id)a3
{
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (BOOL)shouldRevalidateFilterOnStoreChange
{
  return self->_shouldRevalidateFilterOnStoreChange;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"sortOrder"])
  {
    [(CNContactStoreDataSource *)self reloadAsynchronously];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CNContactStoreDataSource;
    [(CNContactStoreDataSource *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (CNContactFilter)effectiveFilter
{
  v2 = [(CNContactStoreDataSource *)self currentSnapshot];
  int64_t v3 = [v2 filter];

  return (CNContactFilter *)v3;
}

void __38__CNContactStoreDataSource_setFilter___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 contactDataSourceDisplayNameDidChange:*(void *)(a1 + 32)];
}

void __38__CNContactStoreDataSource_setFilter___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 contactDataSourceDidChangeDisplayName:*(void *)(a1 + 32)];
}

- (void)invalidate
{
  id v3 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  [v3 removeObserver:self forKeyPath:@"sortOrder"];
}

- (void)reloadAsynchronously
{
}

- (BOOL)canReload
{
  return 1;
}

- (void)contactStoreMeContactDidChange:(id)a3
{
  id v4 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Received me contact change notification", buf, 2u);
  }

  id v5 = self->_mainThreadScheduler;
  databaseChangePreprocessor = self->_databaseChangePreprocessor;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CNContactStoreDataSource_contactStoreMeContactDidChange___block_invoke;
  v8[3] = &unk_1E549BF80;
  v8[4] = self;
  id v9 = v5;
  uint64_t v7 = v5;
  [(CNScheduler *)databaseChangePreprocessor performBlock:v8];
}

void __59__CNContactStoreDataSource_contactStoreMeContactDidChange___block_invoke(uint64_t a1)
{
  id v2 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v2, OS_LOG_TYPE_DEFAULT, "Will handle me contact change notification", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  [*(id *)(a1 + 32) setMeContactNeedsUpdate:1];
  [*(id *)(a1 + 32) setMeContact:0];
  objc_sync_exit(v3);

  id v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__CNContactStoreDataSource_contactStoreMeContactDidChange___block_invoke_184;
    v8[3] = &unk_1E549B488;
    uint64_t v6 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    [v6 performBlock:v8];
  }
  [*(id *)(a1 + 32) reloadAsynchronously];
  uint64_t v7 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEFAULT, "Did handle me contact change notification (async work continues)", buf, 2u);
  }
}

void __59__CNContactStoreDataSource_contactStoreMeContactDidChange___block_invoke_184(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 contactDataSourceMeContactDidChange:*(void *)(a1 + 32)];
}

- (void)contactStoreDidChangeHandler
{
  id v3 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEFAULT, "Will handle contacts change notification", buf, 2u);
  }

  filteredGroup = self->_filteredGroup;
  self->_filteredGroup = 0;

  if ([(CNContactStoreDataSource *)self shouldRevalidateFilterOnStoreChange])
  {
    [(CNContactStoreDataSource *)self validateFilter];
    [(CNContactStoreDataSource *)self setShouldRevalidateFilterOnStoreChange:0];
  }
  [(CNContactStoreDataSource *)self reloadAsynchronously];
  char v5 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEFAULT, "Did handle contacts change notification (async work continues)", v6, 2u);
  }
}

- (void)contactStoreDidChange:(id)a3
{
  id v4 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "Received contacts change notification", v6, 2u);
  }

  char v5 = [(CNContactStoreDataSource *)self contactStoreDidChangeCoalescer];
  [v5 handleEvent];
}

- (void)validateFilter
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactStoreDataSource *)self filter];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = *MEMORY[0x1E4F5A290];
  uint64_t v6 = [v4 containerIdentifiers];
  char v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [(CNContactStoreDataSource *)self store];
    id v33 = 0;
    id v9 = [v8 containersMatchingPredicate:0 error:&v33];
    id v10 = v33;

    if (!v9)
    {
      long long v18 = CNUILogContactStoreDataSource();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v10;
        _os_log_error_impl(&dword_18B625000, v18, OS_LOG_TYPE_ERROR, "Error fetching containers for filter validation: %@", buf, 0xCu);
      }

      goto LABEL_20;
    }
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = objc_msgSend(v9, "_cn_map:", &__block_literal_global_177);
    objc_super v13 = [v11 setWithArray:v12];

    v14 = (void *)MEMORY[0x1E4F1CA80];
    id v15 = [v4 containerIdentifiers];
    uint64_t v16 = [v14 setWithSet:v15];

    [v16 intersectSet:v13];
    if ([v16 count])
    {
      char v17 = (void *)[v16 copy];
      [v4 setContainerIdentifiers:v17];
    }
    else
    {
      [v4 setContainerIdentifiers:0];
    }
  }
  long long v19 = [v4 groupIdentifiers];
  char v20 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v19);

  if (v20)
  {
LABEL_19:
    [(CNContactStoreDataSource *)self setFilter:v4];
    goto LABEL_20;
  }
  objc_super v21 = [(CNContactStoreDataSource *)self store];
  id v32 = 0;
  long long v22 = [v21 groupsMatchingPredicate:0 error:&v32];
  id v23 = v32;

  if (v22)
  {
    long long v24 = (void *)MEMORY[0x1E4F1CAD0];
    long long v25 = objc_msgSend(v22, "_cn_map:", &__block_literal_global_181);
    long long v26 = [v24 setWithArray:v25];

    long long v27 = (void *)MEMORY[0x1E4F1CA80];
    long long v28 = [v4 groupIdentifiers];
    id v29 = [v27 setWithSet:v28];

    [v29 intersectSet:v26];
    if ([v29 count])
    {
      v30 = (void *)[v29 copy];
      [v4 setGroupIdentifiers:v30];
    }
    else
    {
      [v4 setGroupIdentifiers:0];
    }

    goto LABEL_19;
  }
  uint64_t v31 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v23;
    _os_log_error_impl(&dword_18B625000, v31, OS_LOG_TYPE_ERROR, "Error fetching groups for filter validation: %@", buf, 0xCu);
  }

LABEL_20:
}

uint64_t __42__CNContactStoreDataSource_validateFilter__block_invoke_178(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __42__CNContactStoreDataSource_validateFilter__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = self;
  objc_sync_enter(v7);
  [(CNContactStoreDataSource *)v7 setMeContact:0];
  objc_sync_exit(v7);

  uint64_t v8 = [(CNContactStoreDataSource *)v7 store];
  LOBYTE(a4) = [v8 setMeContact:v6 error:a4];

  return (char)a4;
}

- (id)preferredForNameMeContactIdentifier
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F1AE08];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [(CNContactStoreDataSource *)self preferredForNameMeContactWithKeysToFetch:v3];
  uint64_t v5 = [v4 identifier];

  return v5;
}

- (id)indexPathForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactStoreDataSource *)self currentSnapshot];
  id v6 = [v5 identifiersToIndexPath];
  if (![v4 isUnified]) {
    goto LABEL_6;
  }
  char v7 = [v4 mainStoreLinkedContacts];
  if ((unint64_t)[v7 count] < 2) {
    [v7 firstObject];
  }
  else {
  uint64_t v8 = objc_msgSend(v7, "_cn_firstObjectPassingTest:", &__block_literal_global_174_55118);
  }
  id v9 = [v8 identifier];

  if (!v9)
  {
LABEL_6:
    id v9 = [v4 identifier];
  }
  uint64_t v10 = [v6 objectForKey:v9];
  if (v10)
  {
    id v11 = (void *)v10;
  }
  else
  {
    [v5 prepareAllContacts];
    id v12 = [v5 identifiersToIndexPath];

    objc_super v13 = [v4 identifier];
    id v11 = [v12 objectForKey:v13];

    id v6 = v12;
  }

  return v11;
}

uint64_t __48__CNContactStoreDataSource_indexPathForContact___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPreferredForName];
}

- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5
{
  BOOL v6 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if ([v8 isUnknown] && (objc_msgSend(v8, "isSuggestedMe") & 1) == 0)
    {
      id v17 = v8;
    }
    else
    {
      uint64_t v10 = [v8 identifier];
      id v11 = [(CNContactStoreDataSource *)self preferredForNameMeContactIdentifier];
      char v12 = [v10 isEqual:v11];

      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__54888;
      v42 = __Block_byref_object_dispose__54889;
      id v43 = 0;
      uint64_t v32 = 0;
      id v33 = &v32;
      uint64_t v34 = 0x3032000000;
      id v35 = __Block_byref_object_copy__54888;
      uint64_t v36 = __Block_byref_object_dispose__54889;
      id v37 = 0;
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__CNContactStoreDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke;
      aBlock[3] = &unk_1E549AA70;
      id v21 = v9;
      char v27 = v12;
      id v13 = v10;
      id v22 = v13;
      id v23 = self;
      long long v24 = &v28;
      long long v25 = &v32;
      long long v26 = &v38;
      v14 = (void (**)(void *, BOOL))_Block_copy(aBlock);
      v14[2](v14, v6);
      if (!*((unsigned char *)v29 + 24))
      {
        id v15 = CNUILogContactStoreDataSource();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = v33[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v19;
          _os_log_error_impl(&dword_18B625000, v15, OS_LOG_TYPE_ERROR, "Error completing contact: %@", buf, 0xCu);
        }

        if ([(id)objc_opt_class() isErrorPossiblyRelatedToExtraStores:v33[5]])
        {
          uint64_t v16 = CNUILogContactStoreDataSource();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "Will re-fetch from main store", buf, 2u);
          }

          v14[2](v14, 1);
        }
      }
      id v17 = (id)v39[5];

      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v32, 8);

      _Block_object_dispose(&v38, 8);
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __85__CNContactStoreDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:*(void *)(a1 + 32)];
  uint64_t v5 = (void *)MEMORY[0x1E4F1B8F8];
  if (*(unsigned char *)(a1 + 80))
  {
    BOOL v6 = [MEMORY[0x1E4F1B8F8] predicateForMeContact];
    [v4 setPredicate:v6];
  }
  else
  {
    v19[0] = *(void *)(a1 + 40);
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v8 = [v5 predicateForContactsWithIdentifiers:v7];
    [v4 setPredicate:v8];
  }
  [v4 setUnifyResults:1];
  [v4 setOnlyMainStore:a2];
  id v9 = [*(id *)(a1 + 48) store];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(void **)(v10 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__CNContactStoreDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke_2;
  v15[3] = &unk_1E549B878;
  v15[4] = *(void *)(a1 + 72);
  obuint64_t j = v11;
  char v12 = [v9 enumerateContactsWithFetchRequest:v4 error:&obj usingBlock:v15];
  objc_storeStrong((id *)(v10 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v13 = CNUILogContactStoreDataSource();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v14;
      _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Error completing contact: %@", buf, 0xCu);
    }
  }
}

void __85__CNContactStoreDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  if (v9)
  {
    uint64_t v10 = CNUILogContactStoreDataSource();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "Error: got more than one contact instead of a unified one", v13, 2u);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    char v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v8, a2);
  }
}

- (CNGroup)filteredGroup
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactStoreDataSource *)self filterShowsSingleGroup])
  {
    id v3 = [(CNContactStoreDataSource *)self filter];
    id v4 = [v3 groupIdentifiers];
    uint64_t v5 = [v4 allObjects];
    id v6 = [v5 firstObject];

    filteredGroup = self->_filteredGroup;
    if (v6)
    {
      id v8 = filteredGroup;
      uint64_t v9 = self->_filteredGroup;
      if (!v9
        || ([(CNGroup *)v9 identifier],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v10 isEqualToString:v6],
            v10,
            (v11 & 1) == 0))
      {

        char v12 = (void *)MEMORY[0x1E4F1BA00];
        v21[0] = v6;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
        uint64_t v14 = [v12 predicateForGroupsWithIdentifiers:v13];

        id v15 = [(CNContactStoreDataSource *)self store];
        uint64_t v16 = [v15 groupsMatchingPredicate:v14 error:0];

        id v17 = [v16 firstObject];
        uint64_t v18 = self->_filteredGroup;
        self->_filteredGroup = v17;

        id v8 = self->_filteredGroup;
      }
    }
    else
    {
      self->_filteredGroup = 0;

      id v8 = 0;
    }
  }
  else
  {
    uint64_t v19 = self->_filteredGroup;
    self->_filteredGroup = 0;

    id v8 = 0;
  }

  return v8;
}

- (id)accountForContainerIdentifier:(id)a3
{
  id v4 = [MEMORY[0x1E4F1B8A8] predicateForAccountForContainerWithIdentifier:a3];
  uint64_t v5 = [(CNContactStoreDataSource *)self store];
  id v6 = [v5 accountsMatchingPredicate:v4 error:0];

  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (BOOL)doesFilterShowAllContainersForAccount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1B9B0];
  uint64_t v5 = [a3 identifier];
  id v6 = [v4 predicateForContainersInAccountWithIdentifier:v5];

  uint64_t v7 = [(CNContactStoreDataSource *)self store];
  id v8 = [v7 containersMatchingPredicate:v6 error:0];

  uint64_t v9 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_55125);
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  char v11 = [(CNContactStoreDataSource *)self filter];
  char v12 = [v11 containerIdentifiers];
  char v13 = [v10 isEqualToSet:v12];

  return v13;
}

uint64_t __66__CNContactStoreDataSource_doesFilterShowAllContainersForAccount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)canUseTitleForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "_cnui_displayName");
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()) {
      BOOL v7 = [(CNContactStoreDataSource *)self doesFilterShowAllContainersForAccount:v5];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)titleForContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  uint64_t v6 = *MEMORY[0x1E4F5A2A0];
  if (((*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A2A0] + 16))(*MEMORY[0x1E4F5A2A0], v5) & 1) == 0)
  {
    BOOL v7 = CNContactsUIBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];

    uint64_t v5 = (void *)v8;
  }
  uint64_t v9 = [v4 identifier];

  uint64_t v10 = [(CNContactStoreDataSource *)self accountForContainerIdentifier:v9];

  if (v10
    && ([v10 identifier],
        char v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v11),
        v11,
        (v12 & 1) != 0))
  {
    char v13 = objc_msgSend(v10, "_cnui_displayName");
    uint64_t v14 = (void *)MEMORY[0x1E4F1B9B0];
    id v15 = [v10 identifier];
    uint64_t v16 = [v14 predicateForContainersInAccountWithIdentifier:v15];

    id v17 = [(CNContactStoreDataSource *)self store];
    uint64_t v18 = [v17 containersMatchingPredicate:v16 error:0];

    if ([v18 count] != 1
      || (char v19 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v13), v20 = v13, (v19 & 1) == 0))
    {
      char v20 = v5;
    }
    id v21 = v20;
  }
  else
  {
    id v21 = v5;
  }

  return v21;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  [v3 removeObserver:self forKeyPath:@"sortOrder"];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)CNContactStoreDataSource;
  [(CNContactStoreDataSource *)&v6 dealloc];
}

void __66__CNContactStoreDataSource_registerForRelevantChangeNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained contactStoreDidChangeHandler];
}

+ (id)keyPathsForValuesAffectingEffectiveFilter
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"currentSnapshot"];
}

+ (BOOL)isErrorPossiblyRelatedToExtraStores:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F281F8];
  if (([MEMORY[0x1E4F5A3F0] isError:v3 errorWithDomain:*MEMORY[0x1E4F281F8] code:4099] & 1) != 0
    || ([MEMORY[0x1E4F5A3F0] isError:v3 errorWithDomain:v4 code:4097] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [MEMORY[0x1E4F5A3F0] isError:v3 errorWithDomain:v4 code:4101];
  }

  return v5;
}

@end