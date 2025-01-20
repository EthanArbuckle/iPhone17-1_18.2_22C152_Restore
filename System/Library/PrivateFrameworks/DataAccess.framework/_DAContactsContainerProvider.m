@interface _DAContactsContainerProvider
- (BOOL)setLastSyncDateForContainer:(id)a3;
- (CNContactStore)contactStore;
- (_DAContactsContainerProvider)initWithContactStore:(id)a3;
- (id)allContainers;
- (id)allContainersForAccountWithExternalIdentifier:(id)a3;
- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4;
- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10;
- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5;
@end

@implementation _DAContactsContainerProvider

- (_DAContactsContainerProvider)initWithContactStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DAContactsContainerProvider;
  v6 = [(_DAContactsContainerProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactStore, a3);
  }

  return v7;
}

- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1B8A8] predicateForAccountWithExternalIdentifier:a4];
  v8 = [(_DAContactsContainerProvider *)self contactStore];
  id v35 = 0;
  objc_super v9 = [v8 accountsMatchingPredicate:v7 error:&v35];
  id v10 = v35;
  v11 = [v9 firstObject];

  v12 = (void *)MEMORY[0x1E4F1B9B0];
  v13 = [v11 identifier];
  v14 = [v12 predicateForContainersInAccountWithIdentifier:v13 includingDisabledContainers:1];

  v15 = [(_DAContactsContainerProvider *)self contactStore];
  id v34 = 0;
  v16 = [v15 containersMatchingPredicate:v14 error:&v34];
  id v17 = v34;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = v16;
  v19 = (DAContactsContainer *)[v18 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v19)
  {
    id v27 = v17;
    id v28 = v10;
    v29 = v7;
    uint64_t v20 = *(void *)v31;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v31 != v20) {
        objc_enumerationMutation(v18);
      }
      v22 = *(void **)(*((void *)&v30 + 1) + 8 * v21);
      v23 = [v22 externalIdentifier];
      char v24 = [v23 isEqualToString:v6];

      if (v24) {
        break;
      }
      if (v19 == (DAContactsContainer *)++v21)
      {
        v19 = (DAContactsContainer *)[v18 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v19) {
          goto LABEL_3;
        }
        id v25 = v18;
        goto LABEL_12;
      }
    }
    id v25 = v22;

    if (v25)
    {
      v19 = [[DAContactsContainer alloc] initWithCNContainer:v25];
LABEL_12:
      id v10 = v28;
      v7 = v29;
      id v17 = v27;
      goto LABEL_14;
    }
    v19 = 0;
    id v10 = v28;
    v7 = v29;
    id v17 = v27;
  }
  else
  {
    id v25 = v18;
LABEL_14:
  }
  return v19;
}

- (id)allContainers
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1B9B0] predicateForContainersIncludingDisabled:1];
  v4 = [(_DAContactsContainerProvider *)self contactStore];
  id v21 = 0;
  id v5 = [v4 containersMatchingPredicate:v3 error:&v21];
  id v6 = v21;

  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [DAContactsContainer alloc];
        v15 = -[DAContactsContainer initWithCNContainer:](v14, "initWithCNContainer:", v13, (void)v17);
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)allContainersForAccountWithExternalIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1B8A8] predicateForAccountWithExternalIdentifier:a3];
  id v5 = [(_DAContactsContainerProvider *)self contactStore];
  id v29 = 0;
  uint64_t v23 = (void *)v4;
  id v6 = [v5 accountsMatchingPredicate:v4 error:&v29];
  id v22 = v29;
  v7 = [v6 firstObject];

  id v8 = (void *)MEMORY[0x1E4F1B9B0];
  uint64_t v9 = [v7 identifier];
  uint64_t v10 = [v8 predicateForContainersInAccountWithIdentifier:v9 includingDisabledContainers:1];

  uint64_t v11 = [(_DAContactsContainerProvider *)self contactStore];
  id v28 = 0;
  v12 = [v11 containersMatchingPredicate:v10 error:&v28];
  id v13 = v28;

  v14 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = [[DAContactsContainer alloc] initWithCNContainer:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v17);
  }

  return v14;
}

- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10
{
  BOOL v10 = a8;
  uint64_t v16 = (objc_class *)MEMORY[0x1E4F1BA48];
  id v17 = a10;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = objc_alloc_init(v16);
  [v22 setType:a3];
  [v22 setName:v21];

  [v22 setExternalIdentifier:v20];
  [v22 setConstraintsPath:v19];

  [v22 setExternalSyncData:v18];
  uint64_t v23 = [v17 identifier];

  [v22 setAccountIdentifier:v23];
  long long v24 = [[DAContactsContainer alloc] initWithCNContainer:v22];
  [(DAContactsContainer *)v24 setContentReadonly:v10];
  [(DAContactsContainer *)v24 setArePropertiesReadonly:a9];

  return v24;
}

- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5
{
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BA384000, v5, v6, "Setting default container is not implemented yet. <rdar://problem/40239535>", v7, 2u);
  }
}

- (BOOL)setLastSyncDateForContainer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BA384000, v4, v5, "Setting last sync date on container is not implemented yet.", v7, 2u);
  }

  id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"setLastSyncDateForContainer" userInfo:0];
  objc_exception_throw(v6);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end