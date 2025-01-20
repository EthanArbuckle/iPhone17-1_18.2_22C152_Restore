@interface CNCustomIndexedContactsStore
+ (id)log;
- (BOOL)isFilterActive;
- (CNContactStore)contactStore;
- (CNCustomIndexedContactsStore)initWithContactIdentifiers:(id)a3;
- (NSArray)filteredIndexTitles;
- (NSArray)filteredSortedContacts;
- (NSArray)indexTitles;
- (NSArray)sortedContacts;
- (NSMutableDictionary)indexedContactsAndItsSegments;
- (NSString)filterString;
- (id)contactAt:(int64_t)a3 section:(int64_t)a4;
- (id)fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:(id)a3;
- (id)getNameFromContactAccordingToUserPrefferedSortOrder:(id)a3;
- (id)sectionIndexTitles;
- (id)titleForSection:(int64_t)a3;
- (int64_t)numberOFItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)preferredSortOrder;
- (void)createIndexedContacts:(id)a3;
- (void)filterContactsForString:(id)a3;
- (void)setFilterString:(id)a3;
- (void)setFilteredIndexTitles:(id)a3;
- (void)setFilteredSortedContacts:(id)a3;
- (void)setIndexTitles:(id)a3;
- (void)setIndexedContactsAndItsSegments:(id)a3;
- (void)setIsFilterActive:(BOOL)a3;
- (void)setPreferredSortOrder:(int64_t)a3;
- (void)setSortedContacts:(id)a3;
- (void)updateStoreWithContactIdentifiers:(id)a3;
@end

@implementation CNCustomIndexedContactsStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredSortedContacts, 0);
  objc_storeStrong((id *)&self->_sortedContacts, 0);
  objc_storeStrong((id *)&self->_filteredIndexTitles, 0);
  objc_storeStrong((id *)&self->_indexTitles, 0);
  objc_storeStrong((id *)&self->_indexedContactsAndItsSegments, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_filterString, 0);
}

- (void)setIsFilterActive:(BOOL)a3
{
  self->_isFilterActive = a3;
}

- (BOOL)isFilterActive
{
  return self->_isFilterActive;
}

- (void)setFilteredSortedContacts:(id)a3
{
}

- (NSArray)filteredSortedContacts
{
  return self->_filteredSortedContacts;
}

- (void)setSortedContacts:(id)a3
{
}

- (NSArray)sortedContacts
{
  return self->_sortedContacts;
}

- (void)setFilteredIndexTitles:(id)a3
{
}

- (NSArray)filteredIndexTitles
{
  return self->_filteredIndexTitles;
}

- (void)setIndexTitles:(id)a3
{
}

- (NSArray)indexTitles
{
  return self->_indexTitles;
}

- (void)setIndexedContactsAndItsSegments:(id)a3
{
}

- (NSMutableDictionary)indexedContactsAndItsSegments
{
  return self->_indexedContactsAndItsSegments;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setPreferredSortOrder:(int64_t)a3
{
  self->_preferredSortOrder = a3;
}

- (int64_t)preferredSortOrder
{
  return self->_preferredSortOrder;
}

- (NSString)filterString
{
  return self->_filterString;
}

- (void)filterContactsForString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 localizedLowercaseString];
  v6 = [(id)v5 componentsSeparatedByString:@" "];
  v7 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_127);

  LOBYTE(v5) = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))();
  if ((v5 & 1) != 0 || ![v7 count])
  {
    objc_storeStrong((id *)&self->_filteredSortedContacts, self->_sortedContacts);
    objc_storeStrong((id *)&self->_filteredIndexTitles, self->_indexTitles);
  }
  else
  {
    sortedContacts = self->_sortedContacts;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke_2;
    v12[3] = &unk_1E549C040;
    id v13 = v7;
    v9 = [(NSArray *)sortedContacts _cn_filter:v12];
    v10 = (NSArray *)[v9 copy];
    filteredSortedContacts = self->_filteredSortedContacts;
    self->_filteredSortedContacts = v10;
  }
}

uint64_t __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke_3;
  v8[3] = &unk_1E549A598;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "_cn_any:", v8);

  return v6;
}

uint64_t __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) givenName];
  id v5 = [v4 localizedLowercaseString];
  if ([v5 hasPrefix:v3])
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [*(id *)(a1 + 32) familyName];
    v8 = [v7 localizedLowercaseString];
    uint64_t v6 = [v8 hasPrefix:v3];
  }
  return v6;
}

uint64_t __56__CNCustomIndexedContactsStore_filterContactsForString___block_invoke()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))() ^ 1;
}

- (void)setFilterString:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_filterString, "isEqualToString:"))
  {
    if ([v7 length])
    {
      self->_isFilterActive = 1;
      id v4 = (NSString *)[v7 copy];
      filterString = self->_filterString;
      self->_filterString = v4;

      [(CNCustomIndexedContactsStore *)self filterContactsForString:v7];
    }
    else
    {
      self->_isFilterActive = 0;
      uint64_t v6 = self->_filterString;
      self->_filterString = 0;
    }
  }
}

- (void)createIndexedContacts:(id)a3
{
  id v15 = a3;
  id v4 = self->_indexedContactsAndItsSegments;
  if ([v15 count])
  {
    id v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      v8 = [v15 objectAtIndexedSubscript:v7];
      id v9 = [(CNCustomIndexedContactsStore *)self getNameFromContactAccordingToUserPrefferedSortOrder:v8];
      v10 = [v9 substringToIndex:1];
      v11 = v10;
      if (v10 && [(__CFString *)v10 length])
      {
        if (v5) {
          goto LABEL_6;
        }
      }
      else
      {

        v11 = @"#";
        if (v5)
        {
LABEL_6:
          if (([(__CFString *)v11 isEqualToString:v5] & 1) == 0)
          {
            v12 = [[CNSegment alloc] initWithStart:v6 end:v7 - 1];
            [(NSMutableDictionary *)v4 setObject:v12 forKeyedSubscript:v5];
            id v13 = v11;

            uint64_t v6 = v7;
            id v5 = v13;
          }
          goto LABEL_10;
        }
      }
      id v5 = v11;
LABEL_10:

      if (++v7 >= (unint64_t)[v15 count])
      {
        v14 = -[CNSegment initWithStart:end:]([CNSegment alloc], "initWithStart:end:", v6, [v15 count] - 1);
        [(NSMutableDictionary *)v4 setObject:v14 forKeyedSubscript:v5];

        break;
      }
    }
  }
}

- (id)sectionIndexTitles
{
  if ([(CNCustomIndexedContactsStore *)self isFilterActive])
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v3 = [(CNCustomIndexedContactsStore *)self indexTitles];
  }

  return v3;
}

- (id)titleForSection:(int64_t)a3
{
  if ([(CNCustomIndexedContactsStore *)self isFilterActive])
  {
    id v5 = [(CNCustomIndexedContactsStore *)self filteredIndexTitles];
  }
  else
  {
    id v5 = self->_indexTitles;
  }
  uint64_t v6 = v5;
  if ([(CNCustomIndexedContactsStore *)self isFilterActive])
  {
    uint64_t v7 = @"MATCHES";
  }
  else if ([(NSArray *)v6 count] <= a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(NSArray *)v6 objectAtIndexedSubscript:a3];
  }

  return v7;
}

- (id)contactAt:(int64_t)a3 section:(int64_t)a4
{
  if ([(CNCustomIndexedContactsStore *)self isFilterActive])
  {
    uint64_t v7 = [(CNCustomIndexedContactsStore *)self filteredIndexTitles];
  }
  else
  {
    uint64_t v7 = self->_indexTitles;
  }
  v8 = v7;
  id v9 = [(NSArray *)v7 objectAtIndexedSubscript:a4];
  if ([(CNCustomIndexedContactsStore *)self isFilterActive])
  {
    v10 = [(CNCustomIndexedContactsStore *)self filteredSortedContacts];
    v11 = [v10 objectAtIndexedSubscript:a3];
  }
  else
  {
    v12 = [(CNCustomIndexedContactsStore *)self indexedContactsAndItsSegments];
    v10 = [v12 objectForKeyedSubscript:v9];

    if ([v10 isValid])
    {
      uint64_t v13 = [v10 indexOffsetFrom:a3];
      v14 = [(CNCustomIndexedContactsStore *)self sortedContacts];
      v11 = [v14 objectAtIndexedSubscript:v13];
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (int64_t)numberOFItemsInSection:(int64_t)a3
{
  if ([(CNCustomIndexedContactsStore *)self isFilterActive])
  {
    id v5 = [(CNCustomIndexedContactsStore *)self filteredSortedContacts];
    int64_t v6 = [(NSArray *)v5 count];
  }
  else
  {
    id v5 = self->_indexTitles;
    if ([(NSArray *)v5 count] <= a3)
    {
      int64_t v6 = 0;
    }
    else
    {
      uint64_t v7 = [(NSArray *)v5 objectAtIndex:a3];
      v8 = [(CNCustomIndexedContactsStore *)self indexedContactsAndItsSegments];
      id v9 = [v8 objectForKeyedSubscript:v7];

      if (v9 && [v9 isValid]) {
        int64_t v6 = [v9 count];
      }
      else {
        int64_t v6 = 0;
      }
    }
  }

  return v6;
}

- (int64_t)numberOfSections
{
  if ([(CNCustomIndexedContactsStore *)self isFilterActive]) {
    return 1;
  }
  id v4 = [(CNCustomIndexedContactsStore *)self indexTitles];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)getNameFromContactAccordingToUserPrefferedSortOrder:(id)a3
{
  id v4 = a3;
  if ([(CNCustomIndexedContactsStore *)self preferredSortOrder] == 2)
  {
    uint64_t v5 = [v4 firstName];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      uint64_t v7 = [v4 firstName];
      uint64_t v8 = [v7 length];

      if (v8)
      {
        id v9 = [v4 firstName];
        uint64_t v10 = [v4 lastName];
        if (v10)
        {
          v11 = (void *)v10;
          v12 = [v4 lastName];
          uint64_t v13 = [v12 length];

          if (v13)
          {
            v14 = NSString;
            uint64_t v15 = [v4 lastName];
LABEL_12:
            v24 = (void *)v15;
            uint64_t v25 = [v14 stringWithFormat:@"%@%@", v9, v15];

            id v9 = (void *)v25;
            goto LABEL_16;
          }
        }
        goto LABEL_16;
      }
    }
    uint64_t v26 = [v4 lastName];
LABEL_15:
    id v9 = (void *)v26;
    goto LABEL_16;
  }
  uint64_t v16 = [v4 lastName];
  if (!v16
    || (v17 = (void *)v16,
        [v4 lastName],
        v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 length],
        v18,
        v17,
        !v19))
  {
    uint64_t v26 = [v4 firstName];
    goto LABEL_15;
  }
  id v9 = [v4 lastName];
  uint64_t v20 = [v4 firstName];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [v4 firstName];
    uint64_t v23 = [v22 length];

    if (v23)
    {
      v14 = NSString;
      uint64_t v15 = [v4 firstName];
      goto LABEL_12;
    }
  }
LABEL_16:

  return v9;
}

- (id)fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[CNContactViewController descriptorForRequiredKeys];
  v20[0] = v5;
  int64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  uint64_t v7 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v4];

  contactStore = self->_contactStore;
  id v17 = 0;
  id v9 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v7 keysToFetch:v6 error:&v17];
  id v10 = v17;
  v11 = v10;
  if (v9)
  {
    v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v9 count];
      *(_DWORD *)buf = 134349056;
      uint64_t v19 = v13;
      _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_INFO, "Fetched %{public}ld contacts", buf, 0xCu);
    }
  }
  else
  {
    if (!v10) {
      goto LABEL_8;
    }
    v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = (uint64_t)v11;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "Encountered Error while fetching Error: %{public}@", buf, 0xCu);
    }
  }

LABEL_8:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__CNCustomIndexedContactsStore_fetchAndSortContactsByUserPreferredSortOrderForIdentifiers___block_invoke;
  v16[3] = &unk_1E549A550;
  v16[4] = self;
  v14 = [v9 sortedArrayUsingComparator:v16];

  return v14;
}

uint64_t __91__CNCustomIndexedContactsStore_fetchAndSortContactsByUserPreferredSortOrderForIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  id v10 = v6;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [*(id *)(a1 + 32) getNameFromContactAccordingToUserPrefferedSortOrder:v9];
  uint64_t v14 = [*(id *)(a1 + 32) getNameFromContactAccordingToUserPrefferedSortOrder:v12];
  uint64_t v15 = (void *)v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (v13) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = -1;
    }
  }
  else
  {
    uint64_t v17 = [v13 localizedCaseInsensitiveCompare:v14];
  }

  return v17;
}

- (void)updateStoreWithContactIdentifiers:(id)a3
{
  id v4 = [(CNCustomIndexedContactsStore *)self fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:a3];
  [(CNCustomIndexedContactsStore *)self setSortedContacts:v4];

  sortedContacts = self->_sortedContacts;

  [(CNCustomIndexedContactsStore *)self createIndexedContacts:sortedContacts];
}

- (CNCustomIndexedContactsStore)initWithContactIdentifiers:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CNCustomIndexedContactsStore;
  id v5 = [(CNCustomIndexedContactsStore *)&v31 init];
  if (v5)
  {
    uint64_t v26 = +[CNUIContactsEnvironment currentEnvironment];
    uint64_t v6 = [v26 contactStore];
    contactStore = v5->_contactStore;
    v5->_contactStore = (CNContactStore *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
    uint64_t v9 = [v8 sortOrder];

    uint64_t v10 = 2;
    if (v9 == 3) {
      uint64_t v10 = 3;
    }
    v5->_preferredSortOrder = v10;
    uint64_t v11 = [(CNCustomIndexedContactsStore *)v5 fetchAndSortContactsByUserPreferredSortOrderForIdentifiers:v4];
    sortedContacts = v5->_sortedContacts;
    v5->_sortedContacts = (NSArray *)v11;

    indexTitles = v5->_indexTitles;
    v5->_indexTitles = (NSArray *)&unk_1ED915BC0;

    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    indexedContactsAndItsSegments = v5->_indexedContactsAndItsSegments;
    v5->_indexedContactsAndItsSegments = v14;

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = v5->_indexTitles;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * v21);
          uint64_t v23 = [[CNSegment alloc] initWithStart:-1 end:-1];
          [(NSMutableDictionary *)v5->_indexedContactsAndItsSegments setObject:v23 forKeyedSubscript:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v19);
    }

    [(CNCustomIndexedContactsStore *)v5 createIndexedContacts:v5->_sortedContacts];
    v24 = v5;
  }
  return v5;
}

+ (id)log
{
  if (log_cn_once_token_1_52024 != -1) {
    dispatch_once(&log_cn_once_token_1_52024, &__block_literal_global_52025);
  }
  v2 = (void *)log_cn_once_object_1_52026;

  return v2;
}

void __35__CNCustomIndexedContactsStore_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "CNCustomIndexedContactsStore");
  v1 = (void *)log_cn_once_object_1_52026;
  log_cn_once_object_1_52026 = (uint64_t)v0;
}

@end