@interface _DAContactsAccountABLegacyProvider
- (_DAContactsAccountABLegacyProvider)initWithAddressBook:(void *)a3;
- (id)accountForContainerWithIdentifier:(id)a3;
- (id)accountWithExternalIdentifier:(id)a3 createIfNecessary:(BOOL)a4;
- (id)allAccounts;
- (void)addressBook;
- (void)dealloc;
@end

@implementation _DAContactsAccountABLegacyProvider

- (_DAContactsAccountABLegacyProvider)initWithAddressBook:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_DAContactsAccountABLegacyProvider;
  v4 = [(_DAContactsAccountABLegacyProvider *)&v6 init];
  if (v4) {
    v4->_addressBook = (void *)CFRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  CFRetain(self->_addressBook);
  v3.receiver = self;
  v3.super_class = (Class)_DAContactsAccountABLegacyProvider;
  [(_DAContactsAccountABLegacyProvider *)&v3 dealloc];
}

- (id)accountWithExternalIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(_DAContactsAccountABLegacyProvider *)self addressBook];
  uint64_t v7 = ABAddressBookCopyAccountWithIdentifier();
  v8 = (const void *)v7;
  if (!v7 && v4)
  {
    v9 = (const void *)ABAccountCreate();
    ABAccountSetIdentifier();
    ABAddressBookAddRecord([(_DAContactsAccountABLegacyProvider *)self addressBook], v9, 0);
    [(_DAContactsAccountABLegacyProvider *)self addressBook];
    ABAddressBookProcessAddedRecords();
    [(_DAContactsAccountABLegacyProvider *)self addressBook];
    ABDatabaseIntegrityCheckWithAddressBook();
    v10 = [DAABLegacyAccount alloc];
    v11 = v9;
LABEL_6:
    v12 = [(DAABLegacyAccount *)v10 initWithABAccout:CFAutorelease(v11)];
    goto LABEL_8;
  }
  if (v7)
  {
    v10 = [DAABLegacyAccount alloc];
    v11 = v8;
    goto LABEL_6;
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (id)allAccounts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(_DAContactsAccountABLegacyProvider *)self addressBook];
  v2 = (void *)ABAddressBookCopyArrayOfAllAccounts();
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [DAABLegacyAccount alloc];
        v11 = -[DAABLegacyAccount initWithABAccout:](v10, "initWithABAccout:", v9, (void)v13);
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)accountForContainerWithIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_DAContactsAccountABLegacyProvider *)self addressBook];
  v9[0] = v4;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v5 = (void *)ABAddressBookCopySourcesWithUUIDs();
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    [(_DAContactsAccountABLegacyProvider *)self addressBook];
    AccountForSource = (DAABLegacyAccount *)ABAddressBookGetAccountForSource();
    if (AccountForSource) {
      AccountForSource = [[DAABLegacyAccount alloc] initWithABAccout:AccountForSource];
    }
  }
  else
  {
    AccountForSource = 0;
  }

  return AccountForSource;
}

- (void)addressBook
{
  return self->_addressBook;
}

@end