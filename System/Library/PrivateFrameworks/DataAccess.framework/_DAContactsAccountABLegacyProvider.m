@interface _DAContactsAccountABLegacyProvider
- (_DAContactsAccountABLegacyProvider)initWithAddressBook:(void *)a3;
- (id)accountByCreatingAccountWithExternalIdentifier:(id)a3;
- (id)accountForContainerWithIdentifier:(id)a3;
- (id)allAccounts;
- (id)fetchedAccountWithExternalIdentifier:(id)a3;
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
  addressBook = self->_addressBook;
  if (addressBook)
  {
    CFRelease(addressBook);
    self->_addressBook = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_DAContactsAccountABLegacyProvider;
  [(_DAContactsAccountABLegacyProvider *)&v4 dealloc];
}

- (id)fetchedAccountWithExternalIdentifier:(id)a3
{
  id v4 = a3;
  [(_DAContactsAccountABLegacyProvider *)self addressBook];
  v5 = (const void *)ABAddressBookCopyAccountWithIdentifier();

  if (v5) {
    objc_super v6 = [[DAABLegacyAccount alloc] initWithABAccout:CFAutorelease(v5)];
  }
  else {
    objc_super v6 = 0;
  }
  return v6;
}

- (id)accountByCreatingAccountWithExternalIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (DAABLegacyAccount *)ABAccountCreate();
  if (v5)
  {
    ABAccountSetIdentifier();
    ABAddressBookAddRecord([(_DAContactsAccountABLegacyProvider *)self addressBook], v5, 0);
    [(_DAContactsAccountABLegacyProvider *)self addressBook];
    ABAddressBookProcessAddedRecords();
    [(_DAContactsAccountABLegacyProvider *)self addressBook];
    ABDatabaseIntegrityCheckWithAddressBook();
    v5 = [[DAABLegacyAccount alloc] initWithABAccout:CFAutorelease(v5)];
  }

  return v5;
}

- (id)allAccounts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(_DAContactsAccountABLegacyProvider *)self addressBook];
  v2 = (void *)ABAddressBookCopyArrayOfAllAccounts();
  v3 = [MEMORY[0x1E4F1CA48] array];
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