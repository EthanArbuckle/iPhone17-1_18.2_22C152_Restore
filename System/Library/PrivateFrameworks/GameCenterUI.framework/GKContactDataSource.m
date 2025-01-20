@interface GKContactDataSource
- (CNContactStore)store;
- (GKContactDataSource)init;
- (NSArray)contacts;
- (NSDictionary)contactLookup;
- (id)fetchContactWithID:(id)a3;
- (id)fullContactWithIdentifier:(id)a3;
- (id)keysToFetch;
- (void)loadContactsWithHandler:(id)a3;
- (void)setContactLookup:(id)a3;
- (void)setContacts:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation GKContactDataSource

- (GKContactDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKContactDataSource;
  v2 = [(GKContactDataSource *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    [(GKContactDataSource *)v2 setStore:v3];
  }
  return v2;
}

- (id)keysToFetch
{
  v16[14] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v3 = *MEMORY[0x1E4F1AE08];
  v16[0] = v2;
  v16[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEE0];
  v16[2] = *MEMORY[0x1E4F1ADC8];
  v16[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1ADF0];
  v16[4] = *MEMORY[0x1E4F1AEB0];
  v16[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1ADE0];
  v16[6] = *MEMORY[0x1E4F1AEA0];
  v16[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AEB8];
  v16[8] = *MEMORY[0x1E4F1AF30];
  v16[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AFA8];
  v16[10] = *MEMORY[0x1E4F1AEC0];
  v16[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1AF98];
  v16[12] = *MEMORY[0x1E4F1AE28];
  v16[13] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:14];

  uint64_t v11 = *MEMORY[0x1E4F1AF58];
  v15[0] = *MEMORY[0x1E4F1AF60];
  v15[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v13 = [v10 arrayByAddingObjectsFromArray:v12];

  return v13;
}

- (void)loadContactsWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, id, id))a3;
  uint64_t v5 = [(GKContactDataSource *)self keysToFetch];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v5];
  [v6 setSortOrder:1];
  uint64_t v7 = [(CNContactStore *)self->_store _crossPlatformUnifiedMeContactWithKeysToFetch:v5 error:0];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  store = self->_store;
  id v22 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __47__GKContactDataSource_loadContactsWithHandler___block_invoke;
  v18 = &unk_1E5F64450;
  id v11 = v7;
  id v19 = v11;
  id v12 = v8;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  [(CNContactStore *)store enumerateContactsWithFetchRequest:v6 error:&v22 usingBlock:&v15];
  id v14 = v22;
  -[GKContactDataSource setContacts:](self, "setContacts:", v12, v15, v16, v17, v18);
  [(GKContactDataSource *)self setContactLookup:v13];
  if (v4) {
    v4[2](v4, v12, v14);
  }
}

uint64_t __47__GKContactDataSource_loadContactsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v4 = [v17 contactType];
  id v5 = v17;
  if (!v4)
  {
    uint64_t v6 = [v17 identifier];
    uint64_t v7 = [*(id *)(a1 + 32) identifier];
    if ([v6 isEqualToString:v7])
    {
LABEL_3:

LABEL_15:
      id v5 = v17;
      goto LABEL_16;
    }
    uint64_t v8 = [v17 givenName];
    uint64_t v9 = [v8 length];
    v10 = v17;
    uint64_t v11 = v9;
    if (!v9)
    {
      v2 = [v17 familyName];
      if (![v2 length])
      {

        goto LABEL_3;
      }
      v10 = v17;
    }
    id v12 = [v10 emailAddresses];
    if ([v12 count])
    {

      if (!v11) {
      id v5 = v17;
      }
LABEL_14:
      [*(id *)(a1 + 40) addObject:v5];
      uint64_t v15 = *(void **)(a1 + 48);
      uint64_t v6 = [v17 identifier];
      [v15 setObject:v17 forKeyedSubscript:v6];
      goto LABEL_15;
    }
    id v13 = [v17 phoneNumbers];
    uint64_t v14 = [v13 count];

    if (!v11) {
    id v5 = v17;
    }
    if (v14) {
      goto LABEL_14;
    }
  }
LABEL_16:

  return MEMORY[0x1F41817F8](v4, v5);
}

- (id)fetchContactWithID:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GKContactDataSource *)self keysToFetch];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v5];
  uint64_t v7 = (void *)MEMORY[0x1E4F1B8F8];
  v21[0] = v4;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v9 = [v7 predicateForContactsWithIdentifiers:v8];
  [v6 setPredicate:v9];

  v10 = [(GKContactDataSource *)self store];
  id v20 = 0;
  uint64_t v11 = [v10 enumeratorForContactFetchRequest:v6 error:&v20];
  id v12 = v20;

  id v13 = [v11 value];

  if (!v13 || v12)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v17 = (id)GKOSLoggers();
    }
    v18 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      -[GKContactDataSource fetchContactWithID:](v18);
    }
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v14 = [v11 value];
    uint64_t v15 = [v14 allObjects];
    uint64_t v16 = [v15 firstObject];
  }

  return v16;
}

- (id)fullContactWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(GKContactDataSource *)self contactLookup];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (NSDictionary)contactLookup
{
  return self->_contactLookup;
}

- (void)setContactLookup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactLookup, 0);
  objc_storeStrong((id *)&self->_contacts, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (void)fetchContactWithID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "Error retrieving enumerator for contact fetch request", v1, 2u);
}

@end