@interface _DAContactsAccountContactsProvider
- (CNContactStore)contactStore;
- (_DAContactsAccountContactsProvider)initWithContactStore:(id)a3;
- (id)accountForContainerWithIdentifier:(id)a3;
- (id)accountWithExternalIdentifier:(id)a3 createIfNecessary:(BOOL)a4;
- (id)allAccounts;
@end

@implementation _DAContactsAccountContactsProvider

- (_DAContactsAccountContactsProvider)initWithContactStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DAContactsAccountContactsProvider;
  v6 = [(_DAContactsAccountContactsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactStore, a3);
  }

  return v7;
}

- (id)accountWithExternalIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1B8A8] predicateForAccountWithExternalIdentifier:v6];
  v8 = [(_DAContactsAccountContactsProvider *)self contactStore];
  uint64_t v15 = 0;
  objc_super v9 = [v8 accountsMatchingPredicate:v7 error:&v15];
  v10 = [v9 firstObject];

  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = !v4;
  }
  if (v11)
  {
    if (v10) {
      v13 = [[DAContactsBasedAccount alloc] initWithAccount:v10];
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1B8A8]) initWithExternalIdentifier:v6];
    v13 = [[DAContactsBasedAccount alloc] initWithAccount:v12];
  }
  return v13;
}

- (id)allAccounts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(_DAContactsAccountContactsProvider *)self contactStore];
  id v19 = 0;
  v3 = [v2 accountsMatchingPredicate:0 error:&v19];
  id v4 = v19;

  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [DAContactsBasedAccount alloc];
        v13 = -[DAContactsBasedAccount initWithAccount:](v12, "initWithAccount:", v11, (void)v15);
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)accountForContainerWithIdentifier:(id)a3
{
  id v4 = [MEMORY[0x1E4F1B8A8] predicateForAccountForContainerWithIdentifier:a3];
  id v5 = [(_DAContactsAccountContactsProvider *)self contactStore];
  uint64_t v10 = 0;
  id v6 = [v5 accountsMatchingPredicate:v4 error:&v10];
  uint64_t v7 = [v6 firstObject];

  if (v7) {
    uint64_t v8 = [[DAContactsBasedAccount alloc] initWithAccount:v7];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end