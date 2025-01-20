@interface ACAccountStore(ContactsFoundation)
- (id)_cn_canSaveAccount:()ContactsFoundation;
- (id)_cn_removeAccount:()ContactsFoundation;
- (id)_cn_saveVerifiedAccount:()ContactsFoundation;
- (id)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:;
@end

@implementation ACAccountStore(ContactsFoundation)

- (id)_cn_canSaveAccount:()ContactsFoundation
{
  id v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  v6 = [(CNPromise *)v5 BOOLErrorCompletionHandlerAdapter];
  [a1 canSaveAccount:v4 withCompletionHandler:v6];

  v7 = [(CNPromise *)v5 future];

  return v7;
}

- (id)_cn_saveVerifiedAccount:()ContactsFoundation
{
  id v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  v6 = [(CNPromise *)v5 BOOLErrorCompletionHandlerAdapter];
  [a1 saveVerifiedAccount:v4 withCompletionHandler:v6];

  v7 = [(CNPromise *)v5 future];

  return v7;
}

- (id)_cn_removeAccount:()ContactsFoundation
{
  id v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  v6 = [(CNPromise *)v5 BOOLErrorCompletionHandlerAdapter];
  [a1 removeAccount:v4 withCompletionHandler:v6];

  v7 = [(CNPromise *)v5 future];

  return v7;
}

- (id)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:
{
  id v6 = a3;
  v7 = a4;
  v8 = [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17778]];
  v9 = [a1 accountsWithAccountType:v8];
  if ([v9 count])
  {
    v10 = objc_msgSend(v9, "_cn_firstObjectPassingTest:", &__block_literal_global_0);
    v11 = v10;
    if (v10)
    {
      v12 = [v10 parentAccount];
      v13 = objc_msgSend(v12, "_cn_appleAccountAppleID");
      int v14 = [v13 isEqualToString:v6];

      if (v14)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[ACAccountStore(ContactsFoundation) cardDAVAccountForPrimaryAppleAccountWithAppleID:logger:]((uint64_t)v6, v7);
        }
LABEL_14:
        id v15 = v11;
LABEL_16:

        goto LABEL_17;
      }
      v16 = [v11 parentAccount];
      v17 = objc_msgSend(v16, "_cn_appleAccountAppleIDAliases");
      int v18 = [v17 containsObject:v6];

      if (v18)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[ACAccountStore(ContactsFoundation) cardDAVAccountForPrimaryAppleAccountWithAppleID:logger:].cold.4((uint64_t)v6, v7);
        }
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[ACAccountStore(ContactsFoundation) cardDAVAccountForPrimaryAppleAccountWithAppleID:logger:](v7);
    }
    id v15 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ACAccountStore(ContactsFoundation) cardDAVAccountForPrimaryAppleAccountWithAppleID:logger:](v7);
  }
  id v15 = 0;
LABEL_17:

  return v15;
}

- (void)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "No CardDAV ACAccounts found", v1, 2u);
}

- (void)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "No primary iCloud ACAccount found", v1, 2u);
}

- (void)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Found primary iCloud ACAccount with appleID: %@", (uint8_t *)&v2, 0xCu);
}

- (void)cardDAVAccountForPrimaryAppleAccountWithAppleID:()ContactsFoundation logger:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Found primary iCloud ACAccount with alias appleID: %@", (uint8_t *)&v2, 0xCu);
}

@end