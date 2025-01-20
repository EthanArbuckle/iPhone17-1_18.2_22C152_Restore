@interface CNiOSABUtilities
- (CNiOSABUtilities)initWithAddressBook:(void *)a3;
- (id)allAccountIdentifiers;
- (id)filterPeople:(id)a3 matchingAccountIdentifiers:(id)a4;
- (void)dealloc;
@end

@implementation CNiOSABUtilities

- (CNiOSABUtilities)initWithAddressBook:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABUtilities;
  v4 = [(CNiOSABUtilities *)&v8 init];
  if (v4)
  {
    if (a3) {
      v5 = (void *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_addressBook = v5;
    v6 = v4;
  }

  return v4;
}

- (id)allAccountIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_addressBook)
  {
    v2 = (void *)ABAddressBookCopyArrayOfAllAccounts();
    v3 = [MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = (const void *)ABAccountCopyIdentifier();
          objc_msgSend(v3, "addObject:", v9, v11);
          if (v9) {
            CFRelease(v9);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    if (v4) {
      CFRelease(v4);
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)filterPeople:(id)a3 matchingAccountIdentifiers:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_addressBook)
  {
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
    {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1CA48] array];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v18 = v6;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(const void **)(*((void *)&v19 + 1) + 8 * i);
            ABRecordRef v15 = ABPersonCopySource(v14);
            uint64_t v16 = (const void *)ABAddressBookCopyAccountIdentifierForSource();
            if ([v7 containsObject:v16]) {
              [v8 addObject:v14];
            }
            if (v16) {
              CFRelease(v16);
            }
            if (v15) {
              CFRelease(v15);
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      id v6 = v18;
    }
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNiOSABUtilities;
  [(CNiOSABUtilities *)&v4 dealloc];
}

@end