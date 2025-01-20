@interface CNContactCustomDataSource
- (BOOL)autoUpdateContacts;
- (BOOL)canReload;
- (BOOL)observingContacts;
- (CNContactCustomDataSource)initWithContacts:(id)a3;
- (CNContactCustomDataSource)initWithContacts:(id)a3 keysToFetch:(id)a4;
- (CNContactCustomDataSource)initWithContacts:(id)a3 keysToFetch:(id)a4 filter:(id)a5;
- (CNContactDataSourceDelegate)delegate;
- (CNContactFilter)filter;
- (CNContactFormatter)contactFormatterImpl;
- (NSArray)filteredContacts;
- (NSArray)indexSections;
- (NSArray)keysToFetch;
- (NSArray)sections;
- (NSDictionary)contactMatchInfos;
- (NSMapTable)identifiersToIndexes;
- (NSMutableArray)allContacts;
- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForContact:(id)a3;
- (id)preferredForNameMeContactIdentifier;
- (void)_sendDataSourceDidChange;
- (void)_startObservingContacts;
- (void)_stopObservingContacts;
- (void)_updateContactsObserving;
- (void)_updateFilter;
- (void)contactDidChange:(id)a3;
- (void)dealloc;
- (void)setAllContacts:(id)a3;
- (void)setAutoUpdateContacts:(BOOL)a3;
- (void)setContactFormatterImpl:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilteredContacts:(id)a3;
- (void)setIdentifiersToIndexes:(id)a3;
- (void)setKeysToFetch:(id)a3;
- (void)setObservingContacts:(BOOL)a3;
@end

@implementation CNContactCustomDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatterImpl, 0);
  objc_storeStrong((id *)&self->_filteredContacts, 0);
  objc_storeStrong((id *)&self->_identifiersToIndexes, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_allContacts, 0);
  objc_storeStrong((id *)&self->_filter, 0);

  objc_destroyWeak((id *)&self->delegate);
}

- (void)setContactFormatterImpl:(id)a3
{
}

- (CNContactFormatter)contactFormatterImpl
{
  return self->_contactFormatterImpl;
}

- (void)setObservingContacts:(BOOL)a3
{
  self->_observingContacts = a3;
}

- (BOOL)observingContacts
{
  return self->_observingContacts;
}

- (void)setFilteredContacts:(id)a3
{
}

- (NSArray)filteredContacts
{
  return self->_filteredContacts;
}

- (void)setIdentifiersToIndexes:(id)a3
{
}

- (NSMapTable)identifiersToIndexes
{
  return self->_identifiersToIndexes;
}

- (void)setKeysToFetch:(id)a3
{
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void)setAllContacts:(id)a3
{
}

- (NSMutableArray)allContacts
{
  return self->_allContacts;
}

- (BOOL)autoUpdateContacts
{
  return self->_autoUpdateContacts;
}

- (CNContactFilter)filter
{
  return self->_filter;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (CNContactDataSourceDelegate *)WeakRetained;
}

- (void)_sendDataSourceDidChange
{
  id v3 = [(CNContactCustomDataSource *)self delegate];
  [v3 contactDataSourceDidChange:self];
}

- (void)contactDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactCustomDataSource *)self delegate];

  if (v5)
  {
    value = 0;
    v6 = [(CNContactCustomDataSource *)self identifiersToIndexes];
    v7 = [v4 identifier];
    BOOL v8 = NSMapMember(v6, v7, 0, &value);

    if (v8)
    {
      value = (char *)value - 1;
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_allContacts, "replaceObjectAtIndex:withObject:");
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__sendDataSourceDidChange object:0];
    [(CNContactCustomDataSource *)self performSelector:sel__sendDataSourceDidChange withObject:0 afterDelay:0.0];
  }
}

- (void)_updateContactsObserving
{
  if (self->_autoUpdateContacts != self->_observingContacts)
  {
    if (self->_autoUpdateContacts) {
      [(CNContactCustomDataSource *)self _startObservingContacts];
    }
    else {
      [(CNContactCustomDataSource *)self _stopObservingContacts];
    }
    self->_observingContacts = self->_autoUpdateContacts;
  }
}

- (void)_stopObservingContacts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(CNContactCustomDataSource *)self allContacts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        v9 = +[CNUIContactsEnvironment currentEnvironment];
        v10 = [v9 contactChangesNotifier];
        [v10 unregisterObserver:self forContact:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_startObservingContacts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(CNContactCustomDataSource *)self allContacts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        v9 = +[CNUIContactsEnvironment currentEnvironment];
        v10 = [v9 contactChangesNotifier];
        long long v11 = [(CNContactCustomDataSource *)self keysToFetch];
        [v10 registerObserver:self forContact:v8 keysToFetch:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)setAutoUpdateContacts:(BOOL)a3
{
  if (self->_autoUpdateContacts != a3)
  {
    self->_autoUpdateContacts = a3;
    [(CNContactCustomDataSource *)self _updateContactsObserving];
  }
}

- (BOOL)canReload
{
  return 0;
}

- (void)_updateFilter
{
  id v3 = [(CNContactFilter *)self->_filter predicate];
  uint64_t v4 = v3;
  allContacts = self->_allContacts;
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__CNContactCustomDataSource__updateFilter__block_invoke;
    v8[3] = &unk_1E5499598;
    id v9 = v3;
    uint64_t v6 = [(NSMutableArray *)allContacts indexesOfObjectsPassingTest:v8];
    if ([v6 count])
    {
      uint64_t v7 = [(NSMutableArray *)self->_allContacts objectsAtIndexes:v6];
      [(CNContactCustomDataSource *)self setFilteredContacts:v7];
    }
    else
    {
      [(CNContactCustomDataSource *)self setFilteredContacts:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    [(CNContactCustomDataSource *)self setFilteredContacts:self->_allContacts];
  }
}

uint64_t __42__CNContactCustomDataSource__updateFilter__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

- (void)setFilter:(id)a3
{
  uint64_t v5 = (CNContactFilter *)a3;
  if (self->_filter != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_filter, a3);
    [(CNContactCustomDataSource *)self _updateFilter];
    uint64_t v6 = [(CNContactCustomDataSource *)self delegate];
    [v6 contactDataSourceDidChange:self];

    uint64_t v5 = v7;
  }
}

- (id)indexPathForContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 identifier];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(CNContactCustomDataSource *)self contacts];
  uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      id v9 = 0;
      v10 = &v6[(void)v7];
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) identifier];
        char v12 = [v4 isEqual:v11];

        if (v12)
        {
          uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:&v9[(void)v7] inSection:0];
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5
{
  id v5 = a3;

  return v5;
}

- (NSDictionary)contactMatchInfos
{
  return 0;
}

- (NSArray)indexSections
{
  return 0;
}

- (NSArray)sections
{
  return 0;
}

- (id)preferredForNameMeContactIdentifier
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(CNContactCustomDataSource *)self contacts];
  uint64_t v6 = (void *)[v5 copy];
  uint64_t v7 = [(CNContactCustomDataSource *)self keysToFetch];
  uint64_t v8 = (void *)[v7 copy];
  id v9 = [(CNContactCustomDataSource *)self filter];
  v10 = (void *)[v9 copy];
  long long v11 = (void *)[v4 initWithContacts:v6 keysToFetch:v8 filter:v10];

  char v12 = [(CNContactCustomDataSource *)self contactFormatter];
  [v11 setContactFormatter:v12];

  return v11;
}

- (void)dealloc
{
  [(CNContactCustomDataSource *)self _stopObservingContacts];
  v3.receiver = self;
  v3.super_class = (Class)CNContactCustomDataSource;
  [(CNContactCustomDataSource *)&v3 dealloc];
}

- (CNContactCustomDataSource)initWithContacts:(id)a3 keysToFetch:(id)a4 filter:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CNContactCustomDataSource;
  long long v11 = [(CNContactCustomDataSource *)&v29 init];
  char v12 = (void *)[v8 mutableCopy];
  [(CNContactCustomDataSource *)v11 setAllContacts:v12];

  v24 = v9;
  [(CNContactCustomDataSource *)v11 setKeysToFetch:v9];
  if (v10)
  {
    [(CNContactCustomDataSource *)v11 setFilter:v10];
  }
  else
  {
    long long v13 = objc_alloc_init(CNContactFilter);
    [(CNContactCustomDataSource *)v11 setFilter:v13];
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [(CNContactCustomDataSource *)v11 setContactFormatterImpl:v14];

  long long v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:1282];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v26;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = [*(id *)(*((void *)&v25 + 1) + 8 * v21) identifier];
        ++v21;
        NSMapInsert(v15, v22, (const void *)(v19 + v21));
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
      v19 += v21;
    }
    while (v18);
  }

  [(CNContactCustomDataSource *)v11 setIdentifiersToIndexes:v15];
  [(CNContactCustomDataSource *)v11 setAutoUpdateContacts:1];

  return v11;
}

- (CNContactCustomDataSource)initWithContacts:(id)a3 keysToFetch:(id)a4
{
  return [(CNContactCustomDataSource *)self initWithContacts:a3 keysToFetch:a4 filter:0];
}

- (CNContactCustomDataSource)initWithContacts:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1B910];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setStyle:1001];
  [v6 setFallbackStyle:-1];
  uint64_t v7 = (void *)MEMORY[0x1E4F1B8F8];
  id v8 = [v6 descriptorForRequiredKeys];
  v17[0] = v8;
  id v9 = +[CNAvatarView descriptorForRequiredKeys];
  v17[1] = v9;
  id v10 = +[CNQuickActionsView descriptorForRequiredKeys];
  v17[2] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  char v12 = [v7 descriptorWithKeyDescriptors:v11 description:@"Temporary Descriptor"];

  id v16 = v12;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  id v14 = [(CNContactCustomDataSource *)self initWithContacts:v5 keysToFetch:v13 filter:0];

  return v14;
}

@end