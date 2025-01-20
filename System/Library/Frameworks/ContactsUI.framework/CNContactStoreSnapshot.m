@interface CNContactStoreSnapshot
- (CNContactDataSourceLIFOScheduler)summarizationQueue;
- (CNContactStoreDataSource)dataSource;
- (CNContactStoreFilter)filter;
- (CNContactStoreSnapshot)init;
- (CNManagedConfiguration)managedConfiguration;
- (NSArray)contacts;
- (NSArray)indexSections;
- (NSArray)sections;
- (NSMapTable)identifiersToIndexPath;
- (NSMutableArray)batchContactIdentifiers;
- (NSMutableDictionary)contactMatchInfos;
- (NSPointerArray)summarizationFutures;
- (id)_keysToFetch;
- (id)objectIn_contactsAtIndex:(unint64_t)a3;
- (unint64_t)countOf_contacts;
- (void)_generateExcerptsInRange:(_NSRange)a3;
- (void)_loadAllContacts;
- (void)_loadContactsInRange:(_NSRange)a3 inBackground:(BOOL)a4;
- (void)dealloc;
- (void)prepareAllContacts;
- (void)prepareEnoughContacts;
- (void)setDataSource:(id)a3;
- (void)setFilter:(id)a3;
- (void)setManagedConfiguration:(id)a3;
@end

@implementation CNContactStoreSnapshot

uint64_t __60__CNContactStoreSnapshot__loadContactsInRange_inBackground___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSArray)indexSections
{
  v2 = self;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  indexSections = self->_indexSections;
  if (!indexSections)
  {
    v4 = [(CNContactStoreSnapshot *)self sections];
    id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
    v6 = [(CNContactStoreSnapshot *)v2 dataSource];
    v7 = [v6 indexSectionsArray];
    uint64_t v8 = [v5 initWithArray:v7 copyItems:1];
    v9 = v2->_indexSections;
    v2->_indexSections = (NSArray *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v35 + 1) + 8 * i) identifier];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v13);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v30 = v2;
    v17 = v2->_indexSections;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      uint64_t v21 = -1;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          v24 = [v23 identifier];
          unsigned int v25 = [v10 containsObject:v24];

          v21 += v25;
          objc_msgSend(v23, "setRange:", v21 & ~(v21 >> 63), 0);
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v19);
    }

    v2 = v30;
    indexSections = v30->_indexSections;
  }
  v26 = [MEMORY[0x1E4F1CA98] null];
  if (indexSections == v26) {
    v27 = 0;
  }
  else {
    v27 = v2->_indexSections;
  }
  v28 = v27;

  return v28;
}

- (NSArray)sections
{
  v2 = self;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (![(CNContactStoreFilter *)self->_filter showsEverything]) {
    [(CNContactStoreSnapshot *)v2 _loadAllContacts];
  }
  if (!v2->_sections)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
    sections = v2->_sections;
    v2->_sections = (NSArray *)v3;

    if ([(CNContactStoreFilter *)v2->_filter supportsSections])
    {
      id v5 = [(CNContactStoreSnapshot *)v2 contacts];
      unint64_t v6 = [v5 count];

      if (v6 >= 6)
      {
        v7 = [(CNContactStoreSnapshot *)v2 dataSource];
        v52 = [v7 sectionHeadersDictionary];

        uint64_t v8 = [(CNContactStoreSnapshot *)v2 dataSource];
        v51 = [v8 localizedSectionHeaders];

        v9 = [(CNContactStoreSnapshot *)v2 dataSource];
        v10 = [v9 store];
        id v11 = [(CNContactStoreSnapshot *)v2 dataSource];
        uint64_t v12 = objc_msgSend(v10, "sectionListOffsetsForSortOrder:error:", objc_msgSend(v11, "sortOrder"), 0);

        if (v12)
        {
          v49 = v2;
          objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
          v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          obuint64_t j = v12;
          uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
          v48 = v12;
          if (v13)
          {
            uint64_t v14 = v13;
            v15 = 0;
            uint64_t v54 = *(void *)v56;
            v16 = v52;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v56 != v54) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                uint64_t v19 = [v18 first];
                uint64_t v20 = [v16 objectForKeyedSubscript:v19];
                uint64_t v21 = (void *)v20;
                v22 = @"#";
                if (v20) {
                  v22 = (__CFString *)v20;
                }
                v23 = v22;

                uint64_t v24 = [(CNContactSection *)v15 sortKey];
                if (v19 | v24
                  && (unsigned int v25 = (void *)v24,
                      [(CNContactSection *)v15 sortKey],
                      v26 = objc_claimAutoreleasedReturnValue(),
                      int v27 = [v26 isEqual:v19],
                      v26,
                      v25,
                      !v27))
                {
                  if (v15)
                  {
                    uint64_t v31 = [(CNContactSection *)v15 range];
                    uint64_t v28 = v31 + v32;
                  }
                  else
                  {
                    uint64_t v28 = 0;
                  }
                  uint64_t v33 = [v51 objectForKeyedSubscript:v23];
                  long long v34 = (void *)v33;
                  if (v33) {
                    long long v35 = (void *)v33;
                  }
                  else {
                    long long v35 = v23;
                  }
                  id v36 = v35;

                  long long v37 = objc_alloc_init(CNContactSection);
                  [(CNContactSection *)v37 setSortKey:v19];
                  [(CNContactSection *)v37 setTitle:v36];
                  [(CNContactSection *)v37 setIdentifier:v23];
                  long long v38 = v37;

                  [(NSArray *)v50 addObject:v38];
                  uint64_t v30 = 0;
                  v15 = v38;
                  v16 = v52;
                }
                else
                {
                  uint64_t v28 = [(CNContactSection *)v15 range];
                  uint64_t v30 = v29;
                  v15 = v15;
                }
                v39 = [v18 second];
                uint64_t v40 = [v39 integerValue] + v30;

                -[CNContactSection setRange:](v15, "setRange:", v28, v40);
              }
              uint64_t v14 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
            }
            while (v14);
          }
          else
          {
            v15 = 0;
          }

          v2 = v49;
          uint64_t v41 = v49->_sections;
          v49->_sections = v50;
          v42 = v50;

          uint64_t v12 = v48;
        }
      }
    }
  }
  v43 = v2->_sections;
  v44 = [MEMORY[0x1E4F1CA98] null];
  if (v43 == v44) {
    v45 = 0;
  }
  else {
    v45 = v2->_sections;
  }
  v46 = v45;

  return v46;
}

- (NSArray)contacts
{
  return (NSArray *)[(CNContactStoreSnapshot *)self valueForKey:@"_contacts"];
}

- (unint64_t)countOf_contacts
{
  uint64_t v3 = [(CNContactStoreSnapshot *)self dataSource];
  if (self->_contactsCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(CNContactStoreFilter *)self->_filter showsEverything])
    {
      v4 = [v3 store];
      id v5 = [v4 unifiedContactCountWithError:0];
      self->_unint64_t contactsCount = [v5 unsignedIntegerValue];
    }
    else
    {
      [(CNContactStoreSnapshot *)self _loadAllContacts];
    }
  }
  unint64_t contactsCount = self->_contactsCount;

  return contactsCount;
}

- (CNContactStoreDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CNContactStoreDataSource *)WeakRetained;
}

- (id)objectIn_contactsAtIndex:(unint64_t)a3
{
  unint64_t contactsCount = self->_contactsCount;
  if (contactsCount <= a3)
  {
    uint64_t v20 = 0;
    goto LABEL_45;
  }
  if (a3 >= 0x32) {
    unint64_t v6 = a3 - 50;
  }
  else {
    unint64_t v6 = 0;
  }
  if (v6 + 100 <= contactsCount) {
    uint64_t v7 = 100;
  }
  else {
    uint64_t v7 = contactsCount - v6;
  }
  unint64_t lastRequestedIndex = self->_lastRequestedIndex;
  NSUInteger v9 = v7 + v6;
  uint64_t v10 = 100;
  if (v7 + v6 + 100 > contactsCount) {
    uint64_t v10 = contactsCount - (v7 + v6);
  }
  if (lastRequestedIndex >= a3)
  {
    NSUInteger v9 = 0;
    uint64_t v10 = 0;
  }
  if ((uint64_t)(v6 - 100) >= 0) {
    NSUInteger v11 = v6 - 99;
  }
  else {
    NSUInteger v11 = 0;
  }
  uint64_t v12 = contactsCount - v11;
  BOOL v13 = v11 + 100 > contactsCount;
  uint64_t v14 = 100;
  if (v13) {
    uint64_t v14 = v12;
  }
  if (lastRequestedIndex > a3) {
    unint64_t v15 = v6;
  }
  else {
    unint64_t v15 = v9;
  }
  if (lastRequestedIndex > a3) {
    NSUInteger v16 = v14;
  }
  else {
    NSUInteger v16 = v10;
  }
  if (lastRequestedIndex > a3) {
    NSUInteger v17 = v11;
  }
  else {
    NSUInteger v17 = v9;
  }
  self->_unint64_t lastRequestedIndex = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v18 = (const void *)(a3 + 1);
  uint64_t v19 = NSMapGet(self->_contactsCache, (const void *)(a3 + 1));
  uint64_t v20 = (void *)v19;
  if (self->_currentlyLoadingBackgroundRange.length)
  {
    BOOL v21 = 0;
    if (v19) {
      goto LABEL_32;
    }
  }
  else
  {
    BOOL v21 = NSMapGet(self->_contactsCache, (const void *)(v15 + 1)) == 0;
    if (v20) {
      goto LABEL_32;
    }
  }
  NSUInteger location = self->_currentlyLoadingBackgroundRange.location;
  if (location > a3)
  {
LABEL_32:
    BOOL v23 = 0;
    if (!v21) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  BOOL v23 = self->_currentlyLoadingBackgroundRange.length + location >= a3;
  if (v21)
  {
LABEL_33:
    self->_currentlyLoadingBackgroundRange.NSUInteger location = v17;
    self->_currentlyLoadingBackgroundRange.length = v16;
  }
LABEL_34:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_cacheAccessSemaphore);
  if (v20) {
    goto LABEL_37;
  }
  if (v23)
  {
    do
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v20 = NSMapGet(self->_contactsCache, v18);
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_cacheAccessSemaphore);
    }
    while (!v20);
LABEL_37:
    if (!v21) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  -[CNContactStoreSnapshot _loadContactsInRange:inBackground:](self, "_loadContactsInRange:inBackground:", v6, v7, 0);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v20 = NSMapGet(self->_contactsCache, v18);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_cacheAccessSemaphore);
  if (v21)
  {
LABEL_38:
    uint64_t v24 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__CNContactStoreSnapshot_objectIn_contactsAtIndex___block_invoke;
    block[3] = &unk_1E549A968;
    block[4] = self;
    block[5] = v17;
    block[6] = v16;
    dispatch_async(v24, block);
  }
LABEL_39:
  if ([(NSMutableDictionary *)self->_contactMatchInfos count])
  {
    contactMatchInfos = self->_contactMatchInfos;
    v26 = [v20 identifier];
    int v27 = [(NSMutableDictionary *)contactMatchInfos objectForKey:v26];

    if (v27)
    {
      uint64_t v28 = [v27 excerpt];
      if (!v28) {
        goto LABEL_43;
      }
      uint64_t v29 = (void *)v28;
      uint64_t v30 = [v27 excerpt];
      uint64_t v31 = [v30 future];
      char v32 = [v31 isFinished];

      if ((v32 & 1) == 0) {
LABEL_43:
      }
        -[CNContactStoreSnapshot _generateExcerptsInRange:](self, "_generateExcerptsInRange:", v6, v7);
    }
  }
LABEL_45:

  return v20;
}

- (NSMutableDictionary)contactMatchInfos
{
  return self->_contactMatchInfos;
}

- (void)_loadContactsInRange:(_NSRange)a3 inBackground:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  int64_t location = a3.location;
  uint64_t v7 = self;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(CNContactStoreSnapshot *)self dataSource];
  if ([(CNContactStoreFilter *)v7->_filter showsEverything])
  {
    BOOL v42 = v4;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1B8F8], "predicateForPreferredNameInRange:", location, length);
    id v10 = objc_alloc(MEMORY[0x1E4F1B908]);
    NSUInteger v11 = [(CNContactStoreSnapshot *)v7 _keysToFetch];
    uint64_t v12 = (void *)[v10 initWithKeysToFetch:v11];

    objc_msgSend(v12, "setSortOrder:", objc_msgSend(v8, "sortOrder"));
    v43 = (void *)v9;
    [v12 setPredicate:v9];
    objc_msgSend(v12, "setUnifyResults:", objc_msgSend(v8, "fetchUnified"));
    BOOL v13 = [MEMORY[0x1E4F1CA48] array];
    v45 = v8;
    uint64_t v14 = [v8 store];
    id v62 = 0;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __60__CNContactStoreSnapshot__loadContactsInRange_inBackground___block_invoke;
    v60[3] = &unk_1E549A990;
    id v15 = v13;
    id v61 = v15;
    uint64_t v41 = v12;
    char v40 = [v14 enumerateContactsAndMatchInfoWithFetchRequest:v12 error:&v62 usingBlock:v60];
    id v44 = v62;

    dispatch_semaphore_wait((dispatch_semaphore_t)v7->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    NSUInteger v16 = [(CNContactStoreSnapshot *)v7 sections];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v57;
      v48 = v16;
      v49 = v7;
      uint64_t v46 = *(void *)v57;
      id v47 = v17;
      do
      {
        uint64_t v21 = 0;
        uint64_t v50 = v19;
        do
        {
          if (*(void *)v57 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v56 + 1) + 8 * v21);
          identifiersToIndexPath = v7->_identifiersToIndexPath;
          uint64_t v24 = [v22 identifier];
          unsigned int v25 = [(NSMapTable *)identifiersToIndexPath objectForKey:v24];

          if (v25)
          {
            ++location;
          }
          else
          {
            if (v16)
            {
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v26 = v16;
              uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v65 count:16];
              int64_t v51 = location;
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = 0;
                uint64_t v30 = *(void *)v53;
                int64_t v31 = location;
                while (2)
                {
                  uint64_t v32 = 0;
                  uint64_t v33 = v29 + v28;
                  int64_t location = v31;
                  do
                  {
                    if (*(void *)v53 != v30) {
                      objc_enumerationMutation(v26);
                    }
                    [*(id *)(*((void *)&v52 + 1) + 8 * v32) range];
                    int64_t v31 = location - v34;
                    if (location < v34)
                    {
                      uint64_t v33 = v29 + v32;
                      goto LABEL_22;
                    }
                    ++v32;
                    location -= v34;
                  }
                  while (v28 != v32);
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v52 objects:v65 count:16];
                  uint64_t v29 = v33;
                  if (v28) {
                    continue;
                  }
                  break;
                }
              }
              else
              {
                uint64_t v33 = 0;
LABEL_22:
                int64_t v31 = location;
              }

              long long v35 = [MEMORY[0x1E4F28D58] indexPathForItem:v31 inSection:v33];
              NSUInteger v16 = v48;
              uint64_t v7 = v49;
              int64_t location = v51;
              uint64_t v20 = v46;
              id v17 = v47;
            }
            else
            {
              long long v35 = [MEMORY[0x1E4F28D58] indexPathForItem:location inSection:0];
            }
            id v36 = v7->_identifiersToIndexPath;
            long long v37 = [v22 identifier];
            [(NSMapTable *)v36 setObject:v35 forKey:v37];

            NSMapInsert(v7->_contactsCache, (const void *)++location, v22);
            uint64_t v19 = v50;
          }
          ++v21;
        }
        while (v21 != v19);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v19);
    }

    if (v42)
    {
      v7->_currentlyLoadingBackgroundRange.int64_t location = 0;
      v7->_currentlyLoadingBackgroundRange.NSUInteger length = 0;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v7->_cacheAccessSemaphore);

    char v38 = v40;
    if (!v44) {
      char v38 = 1;
    }
    if ((v38 & 1) == 0)
    {
      v39 = CNUILogContactStoreDataSource();
      uint64_t v8 = v45;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v64 = v44;
        _os_log_error_impl(&dword_18B625000, v39, OS_LOG_TYPE_ERROR, "Error fetching contacts: %@", buf, 0xCu);
      }
      goto LABEL_37;
    }
    uint64_t v8 = v45;
    if (v44)
    {
      v39 = CNUILogContactStoreDataSource();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v64 = v44;
        _os_log_impl(&dword_18B625000, v39, OS_LOG_TYPE_INFO, "Non fatal error during contacts fetching: %@", buf, 0xCu);
      }
LABEL_37:
    }
  }
}

- (id)_keysToFetch
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(CNContactStoreSnapshot *)self dataSource];
  id v5 = [v4 keysToFetch];

  if (v5)
  {
    unint64_t v6 = [v4 keysToFetch];
    [v3 addObjectsFromArray:v6];
  }
  uint64_t v7 = [v4 contactFormatter];

  if (v7)
  {
    uint64_t v8 = [v4 contactFormatter];
    uint64_t v9 = [v8 descriptorForRequiredKeys];
    [v3 addObject:v9];
  }
  if (![v3 count])
  {
    id v10 = +[CNContactViewController descriptorForRequiredKeys];
    [v3 addObject:v10];
  }

  return v3;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setFilter:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)prepareEnoughContacts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CNUILogContactStoreDataSource();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134217984;
    uint64_t v8 = 100;
    _os_log_debug_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEBUG, "preparationSize: %ld", (uint8_t *)&v7, 0xCu);
  }

  BOOL v4 = [(CNContactStoreSnapshot *)self contacts];
  unint64_t v5 = [v4 count];

  if (v5 >= 0x64) {
    uint64_t v6 = 100;
  }
  else {
    uint64_t v6 = v5;
  }
  -[CNContactStoreSnapshot _loadContactsInRange:inBackground:](self, "_loadContactsInRange:inBackground:", 0, v6, 0);
}

- (CNContactStoreSnapshot)init
{
  v16.receiver = self;
  v16.super_class = (Class)CNContactStoreSnapshot;
  v2 = [(CNContactStoreSnapshot *)&v16 init];
  v2->_unint64_t contactsCount = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
  contactsCache = v2->_contactsCache;
  v2->_contactsCache = (NSMapTable *)v3;

  uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  identifiersToIndexPath = v2->_identifiersToIndexPath;
  v2->_identifiersToIndexPath = (NSMapTable *)v5;

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1ED8AC728 attributes:0];
  emptyExcerptInstanceMarker = v2->_emptyExcerptInstanceMarker;
  v2->_emptyExcerptInstanceMarker = (NSMutableAttributedString *)v7;

  dispatch_semaphore_t v9 = dispatch_semaphore_create(1);
  cacheAccessSemaphore = v2->_cacheAccessSemaphore;
  v2->_cacheAccessSemaphore = (OS_dispatch_semaphore *)v9;

  NSUInteger v11 = objc_alloc_init(CNContactDataSourceLIFOScheduler);
  summarizationQueue = v2->_summarizationQueue;
  v2->_summarizationQueue = v11;

  uint64_t v13 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  summarizationFutures = v2->_summarizationFutures;
  v2->_summarizationFutures = (NSPointerArray *)v13;

  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_summarizationFutures;
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)CNContactStoreSnapshot;
  [(CNContactStoreSnapshot *)&v8 dealloc];
}

uint64_t __51__CNContactStoreSnapshot_objectIn_contactsAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadContactsInRange:inBackground:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersToIndexPath, 0);
  objc_storeStrong((id *)&self->_summarizationFutures, 0);
  objc_storeStrong((id *)&self->_summarizationQueue, 0);
  objc_storeStrong((id *)&self->_contactMatchInfos, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_emptyExcerptInstanceMarker, 0);
  objc_storeStrong((id *)&self->_summarizer, 0);
  objc_storeStrong((id *)&self->_indexSections, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_cacheAccessSemaphore, 0);

  objc_storeStrong((id *)&self->_contactsCache, 0);
}

- (NSMutableArray)batchContactIdentifiers
{
  return self->_batchContactIdentifiers;
}

- (NSMapTable)identifiersToIndexPath
{
  return self->_identifiersToIndexPath;
}

- (NSPointerArray)summarizationFutures
{
  return self->_summarizationFutures;
}

- (CNContactDataSourceLIFOScheduler)summarizationQueue
{
  return self->_summarizationQueue;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (CNContactStoreFilter)filter
{
  return self->_filter;
}

- (void)prepareAllContacts
{
  id v3 = [(CNContactStoreSnapshot *)self contacts];
  -[CNContactStoreSnapshot _loadContactsInRange:inBackground:](self, "_loadContactsInRange:inBackground:", 0, [v3 count], 0);
}

- (void)_loadAllContacts
{
  v111[2] = *MEMORY[0x1E4F143B8];
  if (self->_contactsCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [(CNContactStoreSnapshot *)self dataSource];
    long long v54 = [(CNContactStoreSnapshot *)self _keysToFetch];
    if ([(CNContactStoreFilter *)self->_filter supportsSections])
    {
      uint64_t v4 = *MEMORY[0x1E4F1AF58];
      v111[0] = *MEMORY[0x1E4F1AF60];
      v111[1] = v4;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:2];
      uint64_t v6 = [v54 arrayByAddingObjectsFromArray:v5];

      long long v54 = (void *)v6;
    }
    if ([(CNContactStoreFilter *)self->_filter limitedAccessFilterMode] == 2)
    {
      uint64_t v7 = *MEMORY[0x1E4F1ADC8];
      v110[0] = *MEMORY[0x1E4F1AEE0];
      v110[1] = v7;
      objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
      uint64_t v9 = [v54 arrayByAddingObjectsFromArray:v8];

      long long v54 = (void *)v9;
    }
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v54];
    objc_msgSend(v10, "setUnifyResults:", objc_msgSend(v3, "fetchUnified"));
    objc_msgSend(v10, "setSortOrder:", objc_msgSend(v3, "sortOrder"));
    long long v11 = [(CNContactStoreFilter *)self->_filter predicate];
    [v10 setPredicate:v11];

    objc_msgSend(v10, "setRankSort:", -[CNContactFilter rankSortedResults](self->_filter, "rankSortedResults"));
    long long v12 = [(CNContactFilter *)self->_filter fullTextString];
    BOOL v13 = [v12 length] != 0;

    uint64_t v104 = 0;
    v105 = &v104;
    uint64_t v106 = 0x2020000000;
    uint64_t v107 = 0;
    uint64_t v100 = 0;
    v101 = &v100;
    uint64_t v102 = 0x2020000000;
    uint64_t v103 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x2020000000;
    uint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    char v95 = 0;
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x2020000000;
    char v91 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x2020000000;
    v87[3] = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x3032000000;
    v85[3] = __Block_byref_object_copy__54888;
    v85[4] = __Block_byref_object_dispose__54889;
    id v86 = 0;
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x2020000000;
    v84[3] = 0;
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x3032000000;
    v82[3] = __Block_byref_object_copy__54888;
    v82[4] = __Block_byref_object_dispose__54889;
    id v83 = 0;
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__54888;
    v80 = __Block_byref_object_dispose__54889;
    id v81 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    id v15 = [(CNContactStoreSnapshot *)self dataSource];
    objc_super v16 = [v15 sectionHeadersDictionary];

    id v17 = [(CNContactStoreSnapshot *)self dataSource];
    uint64_t v18 = [v17 localizedSectionHeaders];

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v20 = [(CNContactStoreSnapshot *)self filter];
    uint64_t v21 = [v20 limitedAccessIdentifiers];

    v22 = [v3 store];
    id v75 = 0;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __42__CNContactStoreSnapshot__loadAllContacts__block_invoke;
    v55[3] = &unk_1E549AA28;
    BOOL v73 = v21 != 0;
    id v50 = v3;
    id v56 = v50;
    BOOL v74 = v13;
    v63 = &v100;
    id v64 = &v104;
    v65 = &v88;
    v66 = &v96;
    id v52 = v21;
    id v57 = v52;
    long long v58 = self;
    uint64_t v67 = &v92;
    v68 = v85;
    v69 = v87;
    v70 = v82;
    id v51 = v14;
    id v59 = v51;
    id v23 = v16;
    id v60 = v23;
    id v24 = v18;
    id v61 = v24;
    v71 = v84;
    v72 = &v76;
    id v25 = v19;
    id v62 = v25;
    int v26 = [v22 enumerateContactsAndMatchInfoWithFetchRequest:v10 error:&v75 usingBlock:v55];
    id v53 = v75;

    if (!v26)
    {
      self->_unint64_t contactsCount = 0;
      uint64_t v28 = CNUILogContactStoreDataSource();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v109 = v53;
        _os_log_error_impl(&dword_18B625000, v28, OS_LOG_TYPE_ERROR, "Error fetching contacts: %@", buf, 0xCu);
      }
      goto LABEL_29;
    }
    self->_unint64_t contactsCount = v105[3];
    objc_storeStrong((id *)&self->_contactMatchInfos, v19);
    if ([(CNContactStoreFilter *)self->_filter supportsSections])
    {
      if (v105[3] < 6)
      {
        objc_storeStrong((id *)&self->_identifiersToIndexPath, (id)v77[5]);
        uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
        sections = self->_sections;
        self->_sections = v46;

        [MEMORY[0x1E4F1CA98] null];
      }
      else
      {
        objc_storeStrong((id *)&self->_sections, v14);
        [(CNContactStoreSnapshot *)self indexSections];
      }
      uint64_t v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
      indexSections = self->_indexSections;
      self->_indexSections = v27;
    }
    else
    {
      int v29 = *((unsigned __int8 *)v93 + 24);
      int v30 = *((unsigned __int8 *)v89 + 24);
      uint64_t v31 = v101[3];
      if (v31 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v32 = (v30 + v29);
      }
      else {
        uint64_t v32 = (v30 + v29) + 1;
      }
      if (!v32) {
        goto LABEL_26;
      }
      uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      unint64_t contactsCount = self->_contactsCount;
      obuint64_t j = (NSArray *)v33;
      if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v34 = objc_alloc_init(CNContactSection);
        [(CNContactSection *)v34 setIdentifier:@"suggested"];
        long long v35 = CNContactsUIBundle();
        id v36 = [v35 localizedStringForKey:@"SUGGESTIONS_SEARCH_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
        [(CNContactSection *)v34 setTitle:v36];

        -[CNContactSection setRange:](v34, "setRange:", v101[3], contactsCount - v101[3]);
        unint64_t contactsCount = v101[3];
        [(NSArray *)obj insertObject:v34 atIndex:0];
      }
      if (v30)
      {
        long long v37 = objc_alloc_init(CNContactSection);
        [(CNContactSection *)v37 setIdentifier:@"realOther"];
        char v38 = CNContactsUIBundle();
        v39 = [v38 localizedStringForKey:@"OTHER_LOCAL_SEARCH_MATCHES_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
        [(CNContactSection *)v37 setTitle:v39];

        -[CNContactSection setRange:](v37, "setRange:", v97[3], contactsCount - v97[3]);
        unint64_t contactsCount = v97[3];
        [(NSArray *)obj insertObject:v37 atIndex:0];
      }
      if (v29)
      {
        char v40 = objc_alloc_init(CNContactSection);
        [(CNContactSection *)v40 setIdentifier:@"realRelevancePromoted"];
        uint64_t v41 = CNContactsUIBundle();
        BOOL v42 = [v41 localizedStringForKey:@"RELEVANCE_RANKED_SECTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
        [(CNContactSection *)v40 setTitle:v42];

        -[CNContactSection setRange:](v40, "setRange:", 0, contactsCount);
        [(NSArray *)obj insertObject:v40 atIndex:0];
      }
      objc_storeStrong((id *)&self->_sections, obj);
      v43 = [MEMORY[0x1E4F1CA98] null];
      id v44 = self->_indexSections;
      self->_indexSections = v43;

      indexSections = obj;
    }

LABEL_26:
    if (!v53)
    {
LABEL_30:

      _Block_object_dispose(&v76, 8);
      _Block_object_dispose(v82, 8);

      _Block_object_dispose(v84, 8);
      _Block_object_dispose(v85, 8);

      _Block_object_dispose(v87, 8);
      _Block_object_dispose(&v88, 8);
      _Block_object_dispose(&v92, 8);
      _Block_object_dispose(&v96, 8);
      _Block_object_dispose(&v100, 8);
      _Block_object_dispose(&v104, 8);

      return;
    }
    uint64_t v28 = CNUILogContactStoreDataSource();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v109 = v53;
      _os_log_impl(&dword_18B625000, v28, OS_LOG_TYPE_INFO, "Non fatal error during contacts fetching: %@", buf, 0xCu);
    }
LABEL_29:

    goto LABEL_30;
  }
}

void __42__CNContactStoreSnapshot__loadAllContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 168))
  {
    uint64_t v7 = [*(id *)(a1 + 32) filter];
    if ([v7 limitedAccessFilterMode] == 1)
    {
      objc_super v8 = *(void **)(a1 + 40);
      uint64_t v9 = [v5 identifier];
      LODWORD(v8) = [v8 containsObject:v9];

      if (!v8) {
        goto LABEL_55;
      }
    }
    else
    {
    }
    long long v10 = [*(id *)(a1 + 32) filter];
    if ([v10 limitedAccessFilterMode] == 2)
    {
      long long v11 = *(void **)(a1 + 40);
      long long v12 = [v5 identifier];
      LOBYTE(v11) = [v11 containsObject:v12];

      if (v11) {
        goto LABEL_55;
      }
    }
    else
    {
    }
  }
  int v13 = [v5 isSuggested];
  int v14 = v13;
  if (*(unsigned char *)(a1 + 169))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__CNContactStoreSnapshot__loadAllContacts__block_invoke_2;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    char v51 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (v14)
  {
    uint64_t v15 = *(void *)(a1 + 88);
  }
  else
  {
    uint64_t v17 = [v6 relevanceScore];
    if (!v17
      || (uint64_t v18 = (void *)v17,
          [v6 relevanceScore],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          uint64_t v20 = [v19 integerValue],
          v19,
          v18,
          v20))
    {
      uint64_t v21 = [v6 relevanceScore];
      uint64_t v22 = [v21 integerValue];

      if (v22 >= 1) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 1;
      }
      goto LABEL_20;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
    uint64_t v15 = *(void *)(a1 + 112);
  }
  uint64_t v16 = *(void *)(v15 + 8);
  if (*(void *)(v16 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(v16 + 24) = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  }
LABEL_20:
  if ([*(id *)(*(void *)(a1 + 48) + 96) supportsSections])
  {
    if ([*(id *)(a1 + 32) sortOrder] == 3) {
      [v5 sectionForSortingByFamilyName];
    }
    else {
    uint64_t v23 = [v5 sectionForSortingByGivenName];
    }
    id v25 = (void *)v23;
    if (v23 | *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40)
      && (objc_msgSend((id)v23, "isEqual:") & 1) == 0)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40)) {
        ++*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
      }
      int v26 = objc_alloc_init(CNContactSection);
      uint64_t v27 = *(void *)(*(void *)(a1 + 144) + 8);
      uint64_t v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;

      [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 40)];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "setRange:", *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 0);
      [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setSortKey:v25];
      uint64_t v29 = [*(id *)(a1 + 64) objectForKeyedSubscript:v25];
      int v30 = (void *)v29;
      if (v29) {
        uint64_t v31 = (__CFString *)v29;
      }
      else {
        uint64_t v31 = @"#";
      }
      [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setIdentifier:v31];

      uint64_t v32 = *(void **)(a1 + 72);
      uint64_t v33 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) identifier];
      uint64_t v34 = [v32 objectForKeyedSubscript:v33];
      long long v35 = v34;
      if (!v34)
      {
        long long v35 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) identifier];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setTitle:v35];
      if (!v34) {

      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40), v25);
      *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                               + 24);
    }
    uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) range];
    [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) range];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "setRange:", v36, v37 + 1);
    char v38 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)- *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) inSection:*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24)];
  }
  else
  {
    if ([v5 isSuggested])
    {
      unint64_t v24 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
          + (unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
    }
    else
    {
      v39 = [v6 relevanceScore];
      if ([v39 integerValue]) {
        unint64_t v24 = 0;
      }
      else {
        unint64_t v24 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
      }
    }
    if ([v5 isSuggested])
    {
      uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)
          - *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    }
    else
    {
      uint64_t v41 = [v6 relevanceScore];
      uint64_t v42 = [v41 integerValue];
      uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      if (v42 <= 0) {
        v40 -= *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
      }
    }
    char v38 = [MEMORY[0x1E4F28D58] indexPathForItem:v40 inSection:v24];
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 48) + 24), 0xFFFFFFFFFFFFFFFFLL);
  NSMapInsert(*(NSMapTable **)(*(void *)(a1 + 48) + 16), (const void *)(*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + 1), v5);
  v43 = *(void **)(*(void *)(a1 + 48) + 136);
  id v44 = [v5 identifier];
  [v43 setObject:v38 forKey:v44];

  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) <= 6)
  {
    v45 = *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40);
    uint64_t v46 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:");
    id v47 = [v5 identifier];
    [v45 setObject:v46 forKey:v47];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 48) + 24));
  if (v6)
  {
    v48 = *(void **)(a1 + 80);
    v49 = [v5 identifier];
    [v48 setObject:v6 forKey:v49];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);

LABEL_55:
}

void __42__CNContactStoreSnapshot__loadAllContacts__block_invoke_2(uint64_t a1)
{
  id v2 = +[CNUIDataCollectionSearchSession currentSession];
  [v2 didFetchResultSuggested:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_generateExcerptsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v32 = objc_opt_new();
  uint64_t v33 = objc_opt_new();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_cacheAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (location < location + length)
  {
    uint64_t v7 = (char *)(location + 1);
    do
    {
      objc_super v8 = NSMapGet(self->_contactsCache, v7);
      contactMatchInfos = self->_contactMatchInfos;
      long long v10 = [v8 identifier];
      long long v11 = [(NSMutableDictionary *)contactMatchInfos objectForKey:v10];

      if (v11)
      {
        uint64_t v12 = [v11 excerpt];
        if (!v12) {
          goto LABEL_6;
        }
        int v13 = (void *)v12;
        int v14 = [v11 excerpt];
        uint64_t v15 = [v14 future];
        char v16 = [v15 isFinished];

        if ((v16 & 1) == 0)
        {
LABEL_6:
          uint64_t v17 = objc_msgSend(v8, "identifier", v32);
          [v6 addObject:v17];

          uint64_t v18 = [v8 identifier];
          [v32 setObject:v8 forKey:v18];

          uint64_t v19 = [v11 excerpt];

          if (!v19)
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
            [v11 setExcerpt:v20];
          }
          uint64_t v21 = [v8 identifier];
          [v33 setObject:v11 forKey:v21];
        }
      }

      ++v7;
      --length;
    }
    while (length);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_cacheAccessSemaphore);
  if ([v6 count])
  {
    summarizer = self->_summarizer;
    if (!summarizer)
    {
      uint64_t v23 = (CNContactMatchSummarizer *)objc_alloc_init(MEMORY[0x1E4F1B940]);
      unint64_t v24 = self->_summarizer;
      self->_summarizer = v23;

      summarizer = self->_summarizer;
    }
    id v25 = self->_contactMatchInfos;
    int v26 = [(CNContactStoreSnapshot *)self dataSource];
    uint64_t v27 = [v26 store];
    uint64_t v28 = [(CNContactMatchSummarizer *)summarizer summariesFutureForContactsIdentifiers:v6 matchInfos:v25 contactStore:v27 scheduler:self->_summarizationQueue];

    uint64_t v29 = self->_emptyExcerptInstanceMarker;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __51__CNContactStoreSnapshot__generateExcerptsInRange___block_invoke;
    v34[3] = &unk_1E549A9E0;
    id v35 = v33;
    uint64_t v36 = v29;
    int v30 = v29;
    [v28 addSuccessBlock:v34];
    uint64_t v31 = [(CNContactStoreSnapshot *)self summarizationFutures];
    [v31 addPointer:v28];
  }
}

void __51__CNContactStoreSnapshot__generateExcerptsInRange___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CNContactStoreSnapshot__generateExcerptsInRange___block_invoke_2;
  v4[3] = &unk_1E549A9B8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __51__CNContactStoreSnapshot__generateExcerptsInRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v10 = [v5 objectForKey:a2];
  uint64_t v7 = [v10 excerpt];
  uint64_t v8 = [v6 length];
  id v9 = v6;
  if (!v8) {
    id v9 = *(id *)(a1 + 40);
  }
  [v7 finishWithResult:v9];
}

@end