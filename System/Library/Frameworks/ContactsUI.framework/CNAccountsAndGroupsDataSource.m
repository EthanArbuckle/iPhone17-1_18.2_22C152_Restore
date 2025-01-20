@interface CNAccountsAndGroupsDataSource
- (BOOL)hasChanges;
- (BOOL)hidesSearchableSources;
- (BOOL)isFilterShowingItem:(id)a3;
- (BOOL)isTrivial;
- (BOOL)onlyShowsGroupsInSections;
- (BOOL)shouldShowAccount:(id)a3;
- (CNAccountsAndGroupsDataSource)initWithStore:(id)a3;
- (CNAccountsAndGroupsItem)currentlyEditingGroupItem;
- (CNAccountsAndGroupsItem)rootItem;
- (CNAccountsAndGroupsItem)showAllSectionItem;
- (CNContactStore)store;
- (CNContactStoreFilter)filter;
- (CNContactStoreFilter)serverFilter;
- (CNManagedConfiguration)managedConfiguration;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (NSArray)sections;
- (NSSet)sourceAccountExternalIdentifiers;
- (NSSet)targetAccountExternalIdentifiers;
- (NSString)currentlyEditingGroupIdentifier;
- (id)allContactsForItem:(id)a3 keysToFetch:(id)a4;
- (id)allContactsForMainItem:(id)a3 keysToFetch:(id)a4;
- (id)containerIdentifierForItem:(id)a3;
- (id)groupIdentifierForGroupItem:(id)a3;
- (id)multiSelectFilter;
- (id)sectionForIdentifier:(id)a3;
- (id)sectionIdentifierForItem:(id)a3;
- (int64_t)contactCountForItem:(id)a3;
- (int64_t)contactCountForMainItem:(id)a3;
- (void)_applyFilter;
- (void)_reloadSections;
- (void)reload;
- (void)removeServerFilter;
- (void)setCurrentlyEditingGroupIdentifier:(id)a3;
- (void)setCurrentlyEditingGroupItem:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilterForItem:(id)a3;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setHidesSearchableSources:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setOnlyShowsGroupsInSections:(BOOL)a3;
- (void)setRootItem:(id)a3;
- (void)setSections:(id)a3;
- (void)setServerFilterForItem:(id)a3;
- (void)setSourceAccountExternalIdentifiers:(id)a3;
- (void)setStore:(id)a3;
- (void)setTargetAccountExternalIdentifiers:(id)a3;
- (void)updateRootItemSelection;
@end

@implementation CNAccountsAndGroupsDataSource

- (CNAccountsAndGroupsDataSource)initWithStore:(id)a3
{
  v4 = (CNContactStore *)a3;
  v19.receiver = self;
  v19.super_class = (Class)CNAccountsAndGroupsDataSource;
  v5 = [(CNAccountsAndGroupsDataSource *)&v19 init];
  store = v5->_store;
  v5->_store = v4;
  v7 = v4;

  v8 = [[CNAccountsAndGroupsItem alloc] initWithType:0 nameProvider:0];
  rootItem = v5->_rootItem;
  v5->_rootItem = v8;

  v10 = [[CNUIGroupsAndContainersSaveManager alloc] initWithContactStore:v7];
  groupsAndContainersSaveManager = v5->_groupsAndContainersSaveManager;
  v5->_groupsAndContainersSaveManager = v10;

  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 bundleIdentifier];

  id v14 = objc_alloc(MEMORY[0x1E4F5A440]);
  v15 = [MEMORY[0x1E4F5A448] sharedConnection];
  uint64_t v16 = [v14 initWithBundleIdentifier:v13 managedProfileConnection:v15];
  managedConfiguration = v5->_managedConfiguration;
  v5->_managedConfiguration = (CNManagedConfiguration *)v16;

  return v5;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setSections:(id)a3
{
}

- (void)setFilter:(id)a3
{
  v8 = (CNContactStoreFilter *)a3;
  serverFilter = self->_serverFilter;
  self->_serverFilter = 0;

  v5 = v8;
  if (self->_filter != v8)
  {
    v6 = (CNContactStoreFilter *)[(CNContactStoreFilter *)v8 copy];
    filter = self->_filter;
    self->_filter = v6;

    v5 = v8;
  }
}

- (void)reload
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyEditingGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_rootItem, 0);
  objc_storeStrong((id *)&self->_currentlyEditingGroupItem, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sourceAccountExternalIdentifiers, 0);
  objc_storeStrong((id *)&self->_targetAccountExternalIdentifiers, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_serverFilter, 0);

  objc_storeStrong((id *)&self->_filter, 0);
}

- (void)setCurrentlyEditingGroupIdentifier:(id)a3
{
}

- (NSString)currentlyEditingGroupIdentifier
{
  return self->_currentlyEditingGroupIdentifier;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setRootItem:(id)a3
{
}

- (CNAccountsAndGroupsItem)rootItem
{
  return self->_rootItem;
}

- (void)setCurrentlyEditingGroupItem:(id)a3
{
}

- (CNAccountsAndGroupsItem)currentlyEditingGroupItem
{
  return self->_currentlyEditingGroupItem;
}

- (CNContactStoreFilter)filter
{
  return self->_filter;
}

- (void)setSourceAccountExternalIdentifiers:(id)a3
{
}

- (NSSet)sourceAccountExternalIdentifiers
{
  return self->_sourceAccountExternalIdentifiers;
}

- (void)setTargetAccountExternalIdentifiers:(id)a3
{
}

- (NSSet)targetAccountExternalIdentifiers
{
  return self->_targetAccountExternalIdentifiers;
}

- (void)setOnlyShowsGroupsInSections:(BOOL)a3
{
  self->_onlyShowsGroupsInSections = a3;
}

- (BOOL)onlyShowsGroupsInSections
{
  return self->_onlyShowsGroupsInSections;
}

- (BOOL)hidesSearchableSources
{
  return self->_hidesSearchableSources;
}

- (void)setStore:(id)a3
{
}

- (BOOL)isFilterShowingItem:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  switch([v4 type])
  {
    case 0:
      v5 = [(CNContactStoreFilter *)self->_filter containerIdentifiers];
      if (v5) {
        goto LABEL_3;
      }
      objc_super v19 = [(CNContactStoreFilter *)self->_filter groupIdentifiers];
      char v6 = v19 == 0;

      goto LABEL_19;
    case 1:
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v5 = objc_msgSend(v4, "childItems", 0);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v7) {
        goto LABEL_12;
      }
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      break;
    case 2:
      filter = self->_filter;
      goto LABEL_15;
    case 3:
      filter = self->_serverFilter;
      if (!filter) {
        goto LABEL_16;
      }
LABEL_15:
      uint64_t v16 = [(CNContactStoreFilter *)filter containerIdentifiers];
LABEL_18:
      v5 = (void *)v16;
      v17 = [v4 identifier];
      char v6 = [v5 containsObject:v17];

      goto LABEL_19;
    case 4:
      uint64_t v16 = [(CNContactStoreFilter *)self->_filter groupIdentifiers];
      goto LABEL_18;
    default:
LABEL_16:
      char v6 = 0;
      goto LABEL_20;
  }
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      v12 = [(CNContactStoreFilter *)self->_filter containerIdentifiers];
      v13 = [v11 identifier];
      int v14 = [v12 containsObject:v13];

      if (!v14)
      {
LABEL_3:
        char v6 = 0;
        goto LABEL_19;
      }
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v8);
LABEL_12:
  char v6 = 1;
LABEL_19:

LABEL_20:
  return v6;
}

- (int64_t)contactCountForMainItem:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 type] == 1)
  {
    v5 = (void *)MEMORY[0x1E4F1B9B0];
    char v6 = [v4 identifier];
    uint64_t v7 = [v5 predicateForContainersInAccountWithIdentifier:v6];

    uint64_t v8 = [(CNAccountsAndGroupsDataSource *)self store];
    id v37 = 0;
    uint64_t v9 = [v8 containersMatchingPredicate:v7 error:&v37];
    id v10 = v37;

    if (v9)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        v28 = v9;
        id v29 = v10;
        v30 = v7;
        id v31 = v4;
        int64_t v14 = 0;
        uint64_t v15 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v11);
            }
            v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            id v18 = objc_alloc(MEMORY[0x1E4F1B908]);
            objc_super v19 = (void *)[v18 initWithKeysToFetch:MEMORY[0x1E4F1CBF0]];
            long long v20 = (void *)MEMORY[0x1E4F1B8F8];
            long long v21 = [v17 identifier];
            long long v22 = [v20 predicateForContactsInContainerWithIdentifier:v21];
            [v19 setPredicate:v22];

            long long v23 = [(CNAccountsAndGroupsDataSource *)self store];
            id v32 = 0;
            v24 = [v23 contactCountForFetchRequest:v19 error:&v32];
            id v25 = v32;

            if (v24)
            {
              v14 += [v24 integerValue];
            }
            else
            {
              v26 = CNUILogAccountsAndGroupsList();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v40 = v31;
                __int16 v41 = 2112;
                id v42 = v25;
                _os_log_impl(&dword_18B625000, v26, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@ with error: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v13);
        id v4 = v31;
        id v10 = v29;
        uint64_t v7 = v30;
        uint64_t v9 = v28;
        goto LABEL_20;
      }
    }
    else
    {
      v11 = CNUILogAccountsAndGroupsList();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v4;
        __int16 v41 = 2112;
        id v42 = v10;
        _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting containers for item: %@ with error: %@", buf, 0x16u);
      }
    }
    int64_t v14 = 0;
LABEL_20:

    goto LABEL_21;
  }
  int64_t v14 = 0;
LABEL_21:

  return v14;
}

- (int64_t)contactCountForItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 type]) {
    goto LABEL_9;
  }
  if ([v4 type] == 1)
  {
    int64_t v5 = [(CNAccountsAndGroupsDataSource *)self contactCountForMainItem:v4];
    goto LABEL_16;
  }
  if ([v4 type] != 2)
  {
    if ([v4 type] == 4)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1B8F8];
      uint64_t v7 = [v4 identifier];
      uint64_t v8 = [v9 predicateForContactsInGroupWithIdentifier:v7];
      goto LABEL_8;
    }
LABEL_9:
    id v10 = 0;
    goto LABEL_10;
  }
  char v6 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v7 = [v4 identifier];
  uint64_t v8 = [v6 predicateForContactsInContainerWithIdentifier:v7];
LABEL_8:
  id v10 = (void *)v8;

LABEL_10:
  id v11 = objc_alloc(MEMORY[0x1E4F1B908]);
  uint64_t v12 = (void *)[v11 initWithKeysToFetch:MEMORY[0x1E4F1CBF0]];
  [v12 setPredicate:v10];
  uint64_t v13 = [(CNAccountsAndGroupsDataSource *)self store];
  id v18 = 0;
  int64_t v14 = [v13 contactCountForFetchRequest:v12 error:&v18];
  id v15 = v18;

  if (v14)
  {
    int64_t v5 = [v14 integerValue];
  }
  else
  {
    uint64_t v16 = CNUILogAccountsAndGroupsList();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v15;
      _os_log_impl(&dword_18B625000, v16, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@ with error: %@", buf, 0x16u);
    }

    int64_t v5 = 0;
  }

LABEL_16:
  return v5;
}

- (id)allContactsForItem:(id)a3 keysToFetch:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 type])
  {
    if ([v6 type] == 1)
    {
      uint64_t v8 = [(CNAccountsAndGroupsDataSource *)self allContactsForMainItem:v6 keysToFetch:v7];
      goto LABEL_20;
    }
    if ([v6 type] == 2)
    {
      id v10 = (void *)MEMORY[0x1E4F1B8F8];
      id v11 = [v6 identifier];
      uint64_t v12 = [v10 predicateForContactsInContainerWithIdentifier:v11];
    }
    else
    {
      if ([v6 type] != 4) {
        goto LABEL_13;
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F1B8F8];
      id v11 = [v6 identifier];
      uint64_t v12 = [v13 predicateForContactsInGroupWithIdentifier:v11];
    }
    uint64_t v9 = (void *)v12;

    if (v9) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1B8F8] predicateForAllContacts];
    if (v9)
    {
LABEL_11:
      int64_t v14 = [(CNAccountsAndGroupsDataSource *)self store];
      id v20 = 0;
      uint64_t v8 = [v14 unifiedContactsMatchingPredicate:v9 keysToFetch:v7 error:&v20];
      id v15 = v20;

      if (v8)
      {
        id v16 = v8;
      }
      else
      {
        id v18 = CNUILogAccountsAndGroupsList();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v6;
          __int16 v23 = 2112;
          id v24 = v15;
          _os_log_impl(&dword_18B625000, v18, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@ with error: %@", buf, 0x16u);
        }
      }
      goto LABEL_20;
    }
  }
LABEL_13:
  v17 = CNUILogAccountsAndGroupsList();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl(&dword_18B625000, v17, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@, unknown item type", buf, 0xCu);
  }

  uint64_t v8 = 0;
LABEL_20:

  return v8;
}

- (id)allContactsForMainItem:(id)a3 keysToFetch:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 1)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1B9B0];
    uint64_t v9 = [v6 identifier];
    id v10 = [v8 predicateForContainersInAccountWithIdentifier:v9];

    id v11 = [(CNAccountsAndGroupsDataSource *)self store];
    id v37 = 0;
    uint64_t v12 = [v11 containersMatchingPredicate:v10 error:&v37];
    id v13 = v37;

    if (v12)
    {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      int64_t v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        v27 = v12;
        id v28 = v13;
        id v29 = v10;
        id v30 = v6;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_super v19 = (void *)MEMORY[0x1E4F1B8F8];
            id v20 = [*(id *)(*((void *)&v33 + 1) + 8 * i) identifier];
            __int16 v21 = [v19 predicateForContactsInContainerWithIdentifier:v20];

            id v22 = [(CNAccountsAndGroupsDataSource *)self store];
            id v32 = 0;
            __int16 v23 = [v22 unifiedContactsMatchingPredicate:v21 keysToFetch:v7 error:&v32];
            id v24 = v32;

            if (v23)
            {
              [v31 addObjectsFromArray:v23];
            }
            else
            {
              uint64_t v25 = CNUILogAccountsAndGroupsList();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v40 = v30;
                __int16 v41 = 2112;
                id v42 = v24;
                _os_log_impl(&dword_18B625000, v25, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting contacts for item: %@ with error: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v16);
        id v6 = v30;
        id v13 = v28;
        id v10 = v29;
        uint64_t v12 = v27;
      }
    }
    else
    {
      int64_t v14 = CNUILogAccountsAndGroupsList();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v6;
        __int16 v41 = 2112;
        id v42 = v13;
        _os_log_impl(&dword_18B625000, v14, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting containers for item: %@ with error: %@", buf, 0x16u);
      }
      id v31 = 0;
    }
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (id)sectionForIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNAccountsAndGroupsDataSource *)self sections];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CNAccountsAndGroupsDataSource_sectionForIdentifier___block_invoke;
  v9[3] = &unk_1E549A5C0;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __54__CNAccountsAndGroupsDataSource_sectionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)sectionIdentifierForItem:(id)a3
{
  uint64_t v4 = [(CNAccountsAndGroupsDataSource *)self containerIdentifierForItem:a3];
  if (v4)
  {
    int64_t v5 = [(CNAccountsAndGroupsDataSource *)self groupsAndContainersSaveManager];
    id v6 = [v5 accountForContainerIdentifier:v4];

    if (v6)
    {
      id v7 = [v6 identifier];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)containerIdentifierForItem:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 4 || objc_msgSend(v3, "type") == 1)
  {
    uint64_t v4 = [v3 containerIdentifier];
LABEL_4:
    int64_t v5 = (void *)v4;
    goto LABEL_5;
  }
  if ([v3 type] == 2)
  {
    uint64_t v4 = [v3 identifier];
    goto LABEL_4;
  }
  int64_t v5 = 0;
LABEL_5:

  return v5;
}

- (id)groupIdentifierForGroupItem:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 4)
  {
    uint64_t v4 = [v3 identifier];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)updateRootItemSelection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(CNAccountsAndGroupsItem *)self->_rootItem childItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * v7) isSelected])
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_11:

  if (v8 != [(CNAccountsAndGroupsItem *)self->_rootItem isSelected]) {
    [(CNAccountsAndGroupsItem *)self->_rootItem setSelected:v8 affectingChildren:0];
  }
}

- (BOOL)isTrivial
{
  v2 = [(CNAccountsAndGroupsDataSource *)self store];
  char v3 = [v2 hasMultipleGroupsOrAccounts] ^ 1;

  return v3;
}

- (void)setHidesSearchableSources:(BOOL)a3
{
  if (self->_hidesSearchableSources != a3)
  {
    self->_hidesSearchableSources = a3;
    [(CNAccountsAndGroupsDataSource *)self reload];
  }
}

- (NSArray)sections
{
  sections = self->_sections;
  if (!sections)
  {
    [(CNAccountsAndGroupsDataSource *)self _reloadSections];
    sections = self->_sections;
  }

  return sections;
}

- (CNContactStoreFilter)serverFilter
{
  return self->_serverFilter;
}

- (void)setServerFilterForItem:(id)a3
{
  uint64_t v4 = [a3 identifier];
  if (v4)
  {
    serverFilter = self->_serverFilter;
    id v13 = v4;
    if (!serverFilter) {
      goto LABEL_4;
    }
    uint64_t v6 = [(CNContactStoreFilter *)serverFilter containerIdentifiers];
    uint64_t v7 = [v6 allObjects];
    uint64_t v8 = [v7 firstObject];
    char v9 = [v8 isEqual:v13];

    uint64_t v4 = v13;
    if ((v9 & 1) == 0)
    {
LABEL_4:
      long long v10 = objc_alloc_init(CNContactStoreFilter);
      long long v11 = self->_serverFilter;
      self->_serverFilter = v10;

      long long v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
      [(CNContactStoreFilter *)self->_serverFilter setContainerIdentifiers:v12];

      [(CNContactStoreFilter *)self->_serverFilter setGroupIdentifiers:0];
      [(CNContactStoreFilter *)self->_serverFilter setIsServerFilter:1];
      uint64_t v4 = v13;
    }
  }
}

- (id)multiSelectFilter
{
  if ([(CNAccountsAndGroupsItem *)self->_rootItem isSelected])
  {
    [(CNContactStoreFilter *)self->_filter setContainerIdentifiers:0];
    [(CNContactStoreFilter *)self->_filter setGroupIdentifiers:0];
    goto LABEL_7;
  }
  char v3 = [(CNAccountsAndGroupsItem *)self->_rootItem arrayForDisplay:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__CNAccountsAndGroupsDataSource_multiSelectFilter__block_invoke;
  aBlock[3] = &unk_1E549A780;
  id v4 = v3;
  id v14 = v4;
  uint64_t v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v6 = v5[2](v5, 2);
  [(CNContactStoreFilter *)self->_filter setContainerIdentifiers:v6];

  uint64_t v7 = v5[2](v5, 4);
  [(CNContactStoreFilter *)self->_filter setGroupIdentifiers:v7];

  uint64_t v8 = [(CNContactStoreFilter *)self->_filter containerIdentifiers];
  if (!v8)
  {
    char v9 = [(CNContactStoreFilter *)self->_filter groupIdentifiers];

    if (v9) {
      goto LABEL_6;
    }
    long long v12 = [MEMORY[0x1E4F1CAD0] set];
    [(CNContactStoreFilter *)self->_filter setGroupIdentifiers:v12];

    uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
    [(CNContactStoreFilter *)self->_filter setContainerIdentifiers:v8];
  }

LABEL_6:
LABEL_7:
  filter = self->_filter;

  return filter;
}

id __50__CNAccountsAndGroupsDataSource_multiSelectFilter__block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__CNAccountsAndGroupsDataSource_multiSelectFilter__block_invoke_2;
  v10[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24l;
  v10[4] = a2;
  id v4 = [v3 indexesOfObjectsPassingTest:v10];
  uint64_t v5 = [*(id *)(a1 + 32) objectsAtIndexes:v4];
  if ([v5 count])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = [v5 valueForKeyPath:@"identifier"];
    uint64_t v8 = [v6 setWithArray:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __50__CNAccountsAndGroupsDataSource_multiSelectFilter__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 32)) {
    uint64_t v4 = [v3 isSelected];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)removeServerFilter
{
  serverFilter = self->_serverFilter;
  self->_serverFilter = 0;
}

- (void)setFilterForItem:(id)a3
{
  id v13 = a3;
  uint64_t v4 = objc_alloc_init(CNContactStoreFilter);
  switch([v13 type])
  {
    case 1:
      uint64_t v5 = *MEMORY[0x1E4F5A258];
      uint64_t v6 = [v13 childItems];
      LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      if (v5) {
        break;
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = [v13 childItems];
      char v9 = [v8 valueForKeyPath:@"identifier"];
      long long v10 = [v7 setWithArray:v9];
      [(CNContactStoreFilter *)v4 setContainerIdentifiers:v10];

      goto LABEL_7;
    case 2:
      long long v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = [v13 identifier];
      char v9 = [v12 setWithObject:v8];
      [(CNContactStoreFilter *)v4 setContainerIdentifiers:v9];
      goto LABEL_7;
    case 3:
      [(CNAccountsAndGroupsDataSource *)self setServerFilterForItem:v13];
      goto LABEL_9;
    case 4:
      long long v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = [v13 identifier];
      char v9 = [v11 setWithObject:v8];
      [(CNContactStoreFilter *)v4 setGroupIdentifiers:v9];
LABEL_7:

      break;
    default:
      break;
  }
  [(CNAccountsAndGroupsDataSource *)self setFilter:v4];
LABEL_9:
}

- (void)_applyFilter
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactStoreFilter *)self->_filter groupIdentifiers];
  if (v3)
  {

LABEL_4:
    uint64_t v5 = [(CNAccountsAndGroupsItem *)self->_rootItem arrayForDisplay:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v6) {
      goto LABEL_17;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [v10 type];
        if (v11 == 4)
        {
          uint64_t v17 = [(CNContactStoreFilter *)self->_filter groupIdentifiers];
          id v18 = [v10 identifier];
          objc_msgSend(v10, "setSelected:affectingChildren:", objc_msgSend(v17, "containsObject:", v18), 0);

          goto LABEL_14;
        }
        if (v11 == 2)
        {
          long long v12 = [(CNContactStoreFilter *)self->_filter containerIdentifiers];
          id v13 = [v10 identifier];
          uint64_t v14 = [v12 containsObject:v13];

          [v10 setSelected:v14 affectingChildren:0];
          uint64_t v15 = [v10 parentItem];
          uint64_t v16 = [v15 type];

          if (v16 == 1)
          {
            uint64_t v17 = [v10 parentItem];
            [v17 setSelected:v14 affectingChildren:0];
LABEL_14:

            continue;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v7)
      {
LABEL_17:

        return;
      }
    }
  }
  uint64_t v4 = [(CNContactStoreFilter *)self->_filter containerIdentifiers];

  if (v4) {
    goto LABEL_4;
  }
  rootItem = self->_rootItem;

  [(CNAccountsAndGroupsItem *)rootItem setSelected:1 affectingChildren:1];
}

- (CNAccountsAndGroupsItem)showAllSectionItem
{
  return self->_rootItem;
}

- (BOOL)shouldShowAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNAccountsAndGroupsDataSource *)self managedConfiguration];
  int v6 = [v5 deviceHasManagementRestrictions];

  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = *MEMORY[0x1E4F5A290];
  uint64_t v8 = [(CNAccountsAndGroupsDataSource *)self targetAccountExternalIdentifiers];
  char v9 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((v9 & 1) == 0)
  {
    long long v10 = [(CNAccountsAndGroupsDataSource *)self targetAccountExternalIdentifiers];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__CNAccountsAndGroupsDataSource_shouldShowAccount___block_invoke;
    v20[3] = &unk_1E549A6F8;
    v20[4] = self;
    id v21 = v4;
    char v11 = objc_msgSend(v10, "_cn_any:", v20);

    if (v11) {
      goto LABEL_6;
    }
  }
  long long v12 = [(CNAccountsAndGroupsDataSource *)self sourceAccountExternalIdentifiers];
  char v13 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v12);

  if (v13) {
    goto LABEL_7;
  }
  uint64_t v14 = [(CNAccountsAndGroupsDataSource *)self sourceAccountExternalIdentifiers];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__CNAccountsAndGroupsDataSource_shouldShowAccount___block_invoke_2;
  v18[3] = &unk_1E549A6F8;
  v18[4] = self;
  id v19 = v4;
  char v15 = objc_msgSend(v14, "_cn_any:", v18);

  if (v15) {
LABEL_6:
  }
    BOOL v16 = 0;
  else {
LABEL_7:
  }
    BOOL v16 = 1;

  return v16;
}

uint64_t __51__CNAccountsAndGroupsDataSource_shouldShowAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 managedConfiguration];
  int v6 = [*(id *)(a1 + 40) externalIdentifierString];
  int v7 = [v5 canWriteToAccountWithIdentifier:v4 fromSourceAccountIdentifier:v6];

  return v7 ^ 1u;
}

uint64_t __51__CNAccountsAndGroupsDataSource_shouldShowAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 managedConfiguration];
  int v6 = [*(id *)(a1 + 40) externalIdentifierString];
  int v7 = [v5 canWriteToAccountWithIdentifier:v6 fromSourceAccountIdentifier:v4];

  return v7 ^ 1u;
}

- (void)_reloadSections
{
  v77[1] = *MEMORY[0x1E4F143B8];
  v2 = CNUILogAccountsAndGroupsList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v2, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Reloading sections", buf, 2u);
  }

  [(CNAccountsAndGroupsDataSource *)self setCurrentlyEditingGroupItem:0];
  *(void *)buf = 0;
  v60 = buf;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__52245;
  v63 = __Block_byref_object_dispose__52246;
  id v64 = [MEMORY[0x1E4F1CA48] array];
  [(CNAccountsAndGroupsItem *)self->_rootItem setContactCount:[(CNAccountsAndGroupsDataSource *)self contactCountForItem:self->_rootItem]];
  id v40 = objc_alloc_init(CNAccountsAndGroupsSection);
  [(CNAccountsAndGroupsSection *)v40 setIsAllContactsGlobalSection:1];
  v77[0] = self->_rootItem;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
  [(CNAccountsAndGroupsSection *)v40 setItems:v3];

  [(CNAccountsAndGroupsSection *)v40 setIdentifier:@"CNAccountsAndGroupsSectionGlobal"];
  id v4 = [(CNAccountsAndGroupsDataSource *)self store];
  id v58 = 0;
  v39 = [v4 accountsMatchingPredicate:0 error:&v58];
  id v5 = v58;

  if (!v39)
  {
    int v6 = CNUILogAccountsAndGroupsList();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v72) = 138412290;
      *(void *)((char *)&v72 + 4) = v5;
      _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting accounts: %@", (uint8_t *)&v72, 0xCu);
    }
  }
  v38 = [MEMORY[0x1E4F1B9B0] predicateForContainersWithType:1003];
  int v7 = [(CNAccountsAndGroupsDataSource *)self store];
  id v57 = 0;
  id v43 = [v7 containersMatchingPredicate:v38 error:&v57];
  id v36 = v57;

  if (!v43)
  {
    uint64_t v8 = CNUILogAccountsAndGroupsList();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v72) = 138412290;
      *(void *)((char *)&v72 + 4) = v36;
      _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting provider containers: %@", (uint8_t *)&v72, 0xCu);
    }
  }
  if (objc_msgSend(v39, "count", v36) || objc_msgSend(v43, "count"))
  {
    *(void *)&long long v72 = 0;
    *((void *)&v72 + 1) = &v72;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__52245;
    v75 = __Block_byref_object_dispose__52246;
    id v76 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke;
    aBlock[3] = &unk_1E549A688;
    void aBlock[4] = self;
    aBlock[5] = &v72;
    aBlock[6] = buf;
    char v9 = (void (**)(void *, void *, void *, void *))_Block_copy(aBlock);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obuint64_t j = v39;
    uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v71 count:16];
    if (v10)
    {
      char v41 = 0;
      uint64_t v11 = *(void *)v53;
      uint64_t v12 = *MEMORY[0x1E4F5A258];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if ([(CNAccountsAndGroupsDataSource *)self shouldShowAccount:v14])
          {
            char v15 = (void *)MEMORY[0x1E4F1B9B0];
            BOOL v16 = [v14 identifier];
            uint64_t v17 = [v15 predicateForContainersInAccountWithIdentifier:v16];

            id v18 = [(CNAccountsAndGroupsDataSource *)self store];
            id v51 = 0;
            id v19 = [v18 containersMatchingPredicate:v17 error:&v51];
            id v20 = v51;

            if ((*(unsigned int (**)(uint64_t, void *))(v12 + 16))(v12, v19))
            {
              id v21 = CNUILogAccountsAndGroupsList();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v67 = 138412546;
                uint64_t v68 = (uint64_t)v14;
                __int16 v69 = 2112;
                id v70 = v20;
                _os_log_impl(&dword_18B625000, v21, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] 0 containers fetched for account: %@ with error: %@", v67, 0x16u);
              }
            }
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_82;
            v50[3] = &unk_1E549A6B0;
            v50[4] = v14;
            long long v22 = _Block_copy(v50);
            long long v23 = [v14 identifier];
            v9[2](v9, v23, v22, v19);
          }
          else
          {
            char v41 = 1;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v71 count:16];
      }
      while (v10);
    }
    else
    {
      char v41 = 0;
    }

    id v24 = objc_msgSend(v43, "_cn_safeSortedArrayUsingComparator:", &__block_literal_global_52252);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v43 = v24;
    uint64_t v25 = [v43 countByEnumeratingWithState:&v46 objects:v66 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v47 != v26) {
            objc_enumerationMutation(v43);
          }
          id v28 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          id v29 = [v28 identifier];
          id v30 = [@"ProviderContainer:" stringByAppendingString:v29];

          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_3_85;
          v45[3] = &unk_1E549A6B0;
          v45[4] = v28;
          id v31 = _Block_copy(v45);
          v65 = v28;
          id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
          v9[2](v9, v30, v31, v32);
        }
        uint64_t v25 = [v43 countByEnumeratingWithState:&v46 objects:v66 count:16];
      }
      while (v25);
    }

    [(CNAccountsAndGroupsItem *)self->_rootItem setChildItems:*(void *)(*((void *)&v72 + 1) + 40)];
    if (([*(id *)(*((void *)&v72 + 1) + 40) count] != 1) | v41 & 1
      && ![(CNAccountsAndGroupsDataSource *)self onlyShowsGroupsInSections])
    {
      [*((id *)v60 + 5) insertObject:v40 atIndex:0];
    }
    long long v33 = CNUILogAccountsAndGroupsList();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [*((id *)v60 + 5) count];
      long long v35 = [*((id *)v60 + 5) description];
      *(_DWORD *)v67 = 134218242;
      uint64_t v68 = v34;
      __int16 v69 = 2112;
      id v70 = v35;
      _os_log_impl(&dword_18B625000, v33, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] finished fetching %lu sections: %@", v67, 0x16u);
    }
    [(CNAccountsAndGroupsDataSource *)self setSections:*((void *)v60 + 5)];

    _Block_object_dispose(&v72, 8);
  }
  else if (![(CNAccountsAndGroupsDataSource *)self onlyShowsGroupsInSections])
  {
    [*((id *)v60 + 5) addObject:v40];
    [(CNAccountsAndGroupsDataSource *)self setSections:*((void *)v60 + 5)];
  }

  _Block_object_dispose(buf, 8);
}

void __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x3032000000;
  v135 = __Block_byref_object_copy__52245;
  v136 = __Block_byref_object_dispose__52246;
  v137 = objc_alloc_init(CNAccountsAndGroupsSection);
  [(id)v133[5] setIdentifier:v7];
  uint64_t v10 = (void *)v133[5];
  id v11 = objc_initWeak(&location, v10);
  [v10 setTitleProvider:v8];

  uint64_t v12 = [CNAccountsAndGroupsItem alloc];
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_2;
  v129[3] = &unk_1E549A610;
  id v67 = v8;
  id v130 = v67;
  char v13 = [(CNAccountsAndGroupsItem *)v12 initWithType:1 nameProvider:v129];
  [(CNAccountsAndGroupsItem *)v13 setIdentifier:v7];
  -[CNAccountsAndGroupsItem setShouldHide:](v13, "setShouldHide:", [*(id *)(a1 + 32) onlyShowsGroupsInSections]);
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x2020000000;
  char v128 = 1;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  char v124 = 0;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x3032000000;
  v118 = __Block_byref_object_copy__52245;
  v119 = __Block_byref_object_dispose__52246;
  id v120 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v74 = *MEMORY[0x1E4F5A258];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    uint64_t v14 = [v9 firstObject];
    char v15 = [v14 identifier];
    [(CNAccountsAndGroupsItem *)v13 setContainerIdentifier:v15];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_3;
  aBlock[3] = &unk_1E549A638;
  uint64_t v16 = *(void *)(a1 + 32);
  v109 = &v115;
  void aBlock[4] = v16;
  v110 = &v121;
  v111 = &v125;
  id v17 = v7;
  uint64_t v18 = *(void *)(a1 + 40);
  id v70 = v17;
  id v107 = v17;
  uint64_t v112 = v18;
  __int16 v69 = v13;
  v108 = v69;
  v113 = &v132;
  uint64_t v114 = *(void *)(a1 + 48);
  uint64_t v68 = (void (**)(void))_Block_copy(aBlock);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v9;
  uint64_t v19 = [obj countByEnumeratingWithState:&v102 objects:v144 count:16];
  if (v19)
  {
    uint64_t v77 = 0;
    uint64_t v73 = *(void *)v103;
    uint64_t v72 = *MEMORY[0x1E4F5A298];
    do
    {
      uint64_t v81 = 0;
      uint64_t v75 = v19;
      do
      {
        if (*(void *)v103 != v73) {
          objc_enumerationMutation(obj);
        }
        id v87 = *(id *)(*((void *)&v102 + 1) + 8 * v81);
        id v20 = [[CNAccountsAndGroupsItem alloc] initWithType:2 nameProvider:0];
        -[CNAccountsAndGroupsItem setContainerType:](v20, "setContainerType:", [v87 type]);
        [(CNAccountsAndGroupsItem *)v20 setBypassIfUnique:1];
        -[CNAccountsAndGroupsItem setShouldHide:](v20, "setShouldHide:", [*(id *)(a1 + 32) onlyShowsGroupsInSections]);
        id v21 = [v87 identifier];
        long long v22 = [*(id *)(a1 + 32) currentlyEditingGroupIdentifier];
        int v23 = [v21 isEqualToString:v22];
        v85 = v20;

        id v24 = v20;
        if (v23) {
          [*(id *)(a1 + 32) setCurrentlyEditingGroupItem:v20];
        }
        uint64_t v25 = [v87 name];
        if ((*(unsigned int (**)(uint64_t, void *))(v72 + 16))(v72, v25))
        {
          uint64_t v26 = NSString;
          v27 = CNContactsUIBundle();
          id v28 = [v27 localizedStringForKey:@"NO_NAME" value:&stru_1ED8AC728 table:@"Localized"];
          uint64_t v29 = [v26 stringWithFormat:v28];

          id v30 = (void *)v29;
          id v24 = v85;
        }
        else
        {
          id v30 = v25;
        }
        id v76 = v30;
        -[CNAccountsAndGroupsItem setName:](v24, "setName:");
        id v31 = [v87 identifier];
        [(CNAccountsAndGroupsItem *)v24 setIdentifier:v31];

        uint64_t v80 = [*(id *)(a1 + 32) contactCountForItem:v85];
        [(CNAccountsAndGroupsItem *)v85 setContactCount:v80];
        AddAtSortedIndex_block_invoke((uint64_t)&__block_literal_global_89, (void *)v116[5], v85);
        id v32 = [MEMORY[0x1E4F1CA48] array];
        long long v33 = (void *)MEMORY[0x1E4F1BA00];
        uint64_t v34 = [v87 identifier];
        v79 = [v33 predicateForGroupsInContainerWithIdentifier:v34];

        long long v35 = [*(id *)(a1 + 32) store];
        id v101 = 0;
        v83 = [v35 groupsMatchingPredicate:v79 error:&v101];
        id v78 = v101;

        if (!v83)
        {
          id v36 = CNUILogAccountsAndGroupsList();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v141 = v87;
            __int16 v142 = 2112;
            id v143 = v78;
            _os_log_impl(&dword_18B625000, v36, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting groups for container:%@ with error: %@", buf, 0x16u);
          }
        }
        if (((*(uint64_t (**)(void))(v74 + 16))() & 1) == 0)
        {
          *((unsigned char *)v122 + 24) = 1;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          id v37 = v83;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v97 objects:v139 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v98;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v98 != v39) {
                  objc_enumerationMutation(v37);
                }
                char v41 = *(void **)(*((void *)&v97 + 1) + 8 * i);
                id v42 = [[CNAccountsAndGroupsItem alloc] initWithType:4 nameProvider:0];
                id v43 = [v41 name];
                [(CNAccountsAndGroupsItem *)v42 setName:v43];

                v44 = [v41 identifier];
                [(CNAccountsAndGroupsItem *)v42 setIdentifier:v44];

                v45 = [v87 identifier];
                [(CNAccountsAndGroupsItem *)v42 setContainerIdentifier:v45];

                [(CNAccountsAndGroupsItem *)v42 setGroup:v41];
                -[CNAccountsAndGroupsItem setContactCount:](v42, "setContactCount:", [*(id *)(a1 + 32) contactCountForItem:v42]);
                long long v46 = [v41 identifier];
                long long v47 = [*(id *)(a1 + 32) currentlyEditingGroupIdentifier];
                int v48 = [v46 isEqualToString:v47];

                if (v48) {
                  [*(id *)(a1 + 32) setCurrentlyEditingGroupItem:v42];
                }
                AddAtSortedIndex_block_invoke((uint64_t)&__block_literal_global_89, v32, v42);
              }
              uint64_t v38 = [v37 countByEnumeratingWithState:&v97 objects:v139 count:16];
            }
            while (v38);
          }

          [(CNAccountsAndGroupsItem *)v85 setChildItems:v32];
        }

        v77 += v80;
        ++v81;
      }
      while (v81 != v75);
      uint64_t v19 = [obj countByEnumeratingWithState:&v102 objects:v144 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v77 = 0;
  }

  [(CNAccountsAndGroupsItem *)v69 setContactCount:v77];
  long long v49 = v68;
  if ((objc_msgSend(v70, "_cn_hasPrefix:", @"ProviderContainer:") & 1) == 0
    && ([*(id *)(a1 + 32) hidesSearchableSources] & 1) == 0
    && ([*(id *)(a1 + 32) onlyShowsGroupsInSections] & 1) == 0)
  {
    v84 = [MEMORY[0x1E4F1B9B0] predicateForContainersInAccountWithIdentifier:v70];
    v50 = [*(id *)(a1 + 32) store];
    id v96 = 0;
    v86 = [v50 serverSearchContainersMatchingPredicate:v84 error:&v96];
    id v82 = v96;

    if (!v86)
    {
      id v51 = CNUILogAccountsAndGroupsList();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v141 = v82;
        _os_log_impl(&dword_18B625000, v51, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] Error getting server search containers: %@", buf, 0xCu);
      }
    }
    if (((*(uint64_t (**)(void))(v74 + 16))() & 1) == 0)
    {
      if ([obj count])
      {
        v68[2](v68);
        *((unsigned char *)v126 + 24) = 0;
        uint64_t v52 = [MEMORY[0x1E4F1CA48] array];
        long long v53 = (void *)v116[5];
        v116[5] = v52;

        long long v54 = objc_alloc_init(CNAccountsAndGroupsSection);
        long long v55 = (void *)v133[5];
        v133[5] = (uint64_t)v54;

        v56 = [v86 firstObject];
        id v57 = [v56 identifier];
        [(id)v133[5] setIdentifier:v57];
      }
      else
      {
        *((unsigned char *)v126 + 24) = 0;
      }
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v88 = v86;
      uint64_t v58 = [v88 countByEnumeratingWithState:&v92 objects:v138 count:16];
      if (v58)
      {
        uint64_t v59 = *(void *)v93;
        do
        {
          for (uint64_t j = 0; j != v58; ++j)
          {
            if (*(void *)v93 != v59) {
              objc_enumerationMutation(v88);
            }
            uint64_t v61 = *(void **)(*((void *)&v92 + 1) + 8 * j);
            v62 = [v61 name];
            v63 = [CNAccountsAndGroupsItem alloc];
            v89[0] = MEMORY[0x1E4F143A8];
            v89[1] = 3221225472;
            v89[2] = __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_77;
            v89[3] = &unk_1E549A660;
            id v64 = v62;
            id v90 = v64;
            objc_copyWeak(&v91, &location);
            v65 = [(CNAccountsAndGroupsItem *)v63 initWithType:3 nameProvider:v89];
            -[CNAccountsAndGroupsItem setContainerType:](v65, "setContainerType:", [v61 type]);
            [(CNAccountsAndGroupsItem *)v65 setSoloSelect:1];
            v66 = [v61 identifier];
            [(CNAccountsAndGroupsItem *)v65 setIdentifier:v66];

            AddAtSortedIndex_block_invoke((uint64_t)&__block_literal_global_89, (void *)v116[5], v65);
            objc_destroyWeak(&v91);
          }
          uint64_t v58 = [v88 countByEnumeratingWithState:&v92 objects:v138 count:16];
        }
        while (v58);
      }
    }
    long long v49 = v68;
  }
  v49[2](v49);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(&v125, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v132, 8);
}

uint64_t __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_82(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cnui_displayName");
}

uint64_t __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_3_85(uint64_t a1)
{
  return [*(id *)(a1 + 32) name];
}

uint64_t __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_2_83(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  int v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

id __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_2(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = NSString;
  id v3 = CNContactsUIBundle();
  id v4 = [v3 localizedStringForKey:@"ALL_CONTACTS_FOR_ACCOUNT-%@" value:&stru_1ED8AC728 table:@"Localized"];
  id v5 = objc_msgSend(v2, "stringWithFormat:", v4, v1);

  return v5;
}

uint64_t __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) onlyShowsGroupsInSections];
    if (!result || *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        id v3 = CNUILogAccountsAndGroupsList();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v4 = *(void *)(a1 + 40);
          int v8 = 138412290;
          uint64_t v9 = v4;
          _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] including root item for account identifier: %@", (uint8_t *)&v8, 0xCu);
        }

        AddAtSortedIndex_block_invoke((uint64_t)&__block_literal_global_89, *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(void **)(a1 + 48));
        [*(id *)(a1 + 48) setChildItems:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        id v5 = [*(id *)(a1 + 48) arrayForDisplay:1];
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setItems:v5];
      }
      else
      {
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setItems:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      }
      int v6 = CNUILogAccountsAndGroupsList();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        int v8 = 138412290;
        uint64_t v9 = v7;
        _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEFAULT, "[CNAccountsAndGroupsDataSource] adding accountSection: %@", (uint8_t *)&v8, 0xCu);
      }

      return [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    }
  }
  return result;
}

id __48__CNAccountsAndGroupsDataSource__reloadSections__block_invoke_77(uint64_t a1)
{
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v2 = NSString;
    id v3 = CNContactsUIBundle();
    uint64_t v4 = [v3 localizedStringForKey:@"SERVER_SEARCH_TITLE_FORMAT-%@" value:&stru_1ED8AC728 table:@"Localized"];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = [WeakRetained title];
    objc_msgSend(v2, "stringWithFormat:", v4, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = *(id *)(a1 + 32);
  }

  return v7;
}

- (BOOL)hasChanges
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNAccountsAndGroupsDataSource *)self sections];
  uint64_t v4 = [(CNAccountsAndGroupsDataSource *)self showAllSectionItem];
  uint64_t v5 = [v4 contactCount];

  [(CNAccountsAndGroupsDataSource *)self reload];
  int v6 = [(CNAccountsAndGroupsDataSource *)self sections];
  id v7 = [(CNAccountsAndGroupsDataSource *)self showAllSectionItem];
  uint64_t v8 = [v7 contactCount];

  if (v5 == v8 && (uint64_t v9 = [v3 count], v9 == objc_msgSend(v6, "count")))
  {
    uint64_t v38 = v6;
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v53 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v17 = [v16 identifier];
          [v10 setObject:v16 forKeyedSubscript:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v13);
    }

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke;
    v50[3] = &unk_1E549A5C0;
    id v18 = v10;
    id v51 = v18;
    int v6 = v38;
    if (objc_msgSend(v38, "_cn_any:", v50))
    {
      char v19 = 1;
    }
    else
    {
      id v36 = v18;
      id v37 = v3;
      id v20 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = v11;
      uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            uint64_t v26 = [v25 items];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v56 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v43;
              do
              {
                for (uint64_t k = 0; k != v28; ++k)
                {
                  if (*(void *)v43 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  id v31 = *(void **)(*((void *)&v42 + 1) + 8 * k);
                  id v32 = [v31 identifier];

                  if (v32)
                  {
                    long long v33 = [v31 identifier];
                    [v20 setObject:v31 forKeyedSubscript:v33];
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v56 count:16];
              }
              while (v28);
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
        }
        while (v22);
      }

      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke_2;
      v40[3] = &unk_1E549A5C0;
      id v41 = v20;
      id v34 = v20;
      int v6 = v38;
      char v19 = objc_msgSend(v38, "_cn_any:", v40);

      id v18 = v36;
      id v3 = v37;
    }
  }
  else
  {
    char v19 = 1;
  }

  return v19;
}

BOOL __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    int v6 = v5;
    if (v5)
    {
      id v7 = [v5 items];
      uint64_t v8 = [v7 count];
      uint64_t v9 = [v3 items];
      BOOL v10 = v8 != [v9 count];
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 items];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke_3;
  v6[3] = &unk_1E549A5E8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "_cn_any:", v6);

  return v4;
}

BOOL __43__CNAccountsAndGroupsDataSource_hasChanges__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    int v6 = v5;
    if (v5
      && ([v5 name],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v3 name],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqualToString:v8],
          v8,
          v7,
          v9))
    {
      uint64_t v10 = [v6 contactCount];
      BOOL v11 = v10 != [v3 contactCount];
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end