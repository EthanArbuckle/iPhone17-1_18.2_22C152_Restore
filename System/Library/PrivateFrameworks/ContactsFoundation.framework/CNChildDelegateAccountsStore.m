@interface CNChildDelegateAccountsStore
+ (id)os_log;
+ (void)configureChildAccount:(id)a3 withSettingsFromDelegateInfo:(id)a4 parent:(id)a5;
- (ACAccount)parentAccount;
- (ACAccountStore)accountStore;
- (BOOL)updateAccounts:(id)a3 error:(id *)a4;
- (CNChildDelegateAccountsStore)initWithParentAccount:(id)a3 accountStore:(id)a4;
- (NSString)description;
- (id)addChildWithDelegateInfo:(id)a3;
- (id)delegateAccounts;
- (id)primaryAccount;
- (id)removeAccount:(id)a3;
- (id)updateAccount:(id)a3;
@end

@implementation CNChildDelegateAccountsStore

+ (id)os_log
{
  if (os_log_cn_once_token_1_11 != -1) {
    dispatch_once(&os_log_cn_once_token_1_11, &__block_literal_global_55);
  }
  v2 = (void *)os_log_cn_once_object_1_11;

  return v2;
}

uint64_t __38__CNChildDelegateAccountsStore_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "child-delegate-accounts-store");
  uint64_t v1 = os_log_cn_once_object_1_11;
  os_log_cn_once_object_1_11 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNChildDelegateAccountsStore)initWithParentAccount:(id)a3 accountStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNChildDelegateAccountsStore;
  v9 = [(CNChildDelegateAccountsStore *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentAccount, a3);
    objc_storeStrong((id *)&v10->_accountStore, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"parentAccount" object:self->_parentAccount];
  id v5 = (id)[v3 appendName:@"accountStore" object:self->_accountStore];
  v6 = [v3 build];

  return (NSString *)v6;
}

- (id)delegateAccounts
{
  v2 = [(ACAccount *)self->_parentAccount childAccounts];
  v3 = objc_msgSend(v2, "_cn_map:", CNCoreDelegateInfoFromACAccount);

  return v3;
}

- (id)primaryAccount
{
  return (*((CNCoreDelegateInfo *(**)(uint64_t, void *))CNCoreDelegateInfoFromACAccount + 2))((uint64_t)CNCoreDelegateInfoFromACAccount, self->_parentAccount);
}

- (BOOL)updateAccounts:(id)a3 error:(id *)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = [(CNChildDelegateAccountsStore *)self parentAccount];
    v9 = [v8 childAccounts];
    v10 = objc_msgSend(v9, "_cn_indexBy:", &__block_literal_global_11_0);
    v11 = (void *)[v10 mutableCopy];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v45 = v6;
    obuint64_t j = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (!v12) {
      goto LABEL_18;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v58;
    id v46 = v7;
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v47 = v13;
      do
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v57 + 1) + 8 * v15);
        v17 = [v16 principalPath];
        if (v17)
        {
          v18 = [v11 objectForKeyedSubscript:v17];
          if (v18)
          {
            v19 = v18;
            v20 = [v18 accountProperties];
            uint64_t v21 = v14;
            v22 = v11;
            v23 = (void *)[v20 copy];

            uint64_t v24 = objc_opt_class();
            uint64_t v25 = [(CNChildDelegateAccountsStore *)self parentAccount];
            v26 = (void *)v24;
            id v7 = v46;
            [v26 configureChildAccount:v19 withSettingsFromDelegateInfo:v16 parent:v25];

            v27 = [v19 accountProperties];
            LOBYTE(v25) = [v23 isEqualToDictionary:v27];

            v11 = v22;
            uint64_t v14 = v21;
            uint64_t v13 = v47;
            if (v25) {
              goto LABEL_15;
            }
          }
          else
          {
            v19 = [(CNChildDelegateAccountsStore *)self addChildWithDelegateInfo:v16];
          }
          v29 = [(CNChildDelegateAccountsStore *)self updateAccount:v19];
          [v7 addObject:v29];

LABEL_15:
          [v11 removeObjectForKey:v17];
          goto LABEL_16;
        }
        v19 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v28 = [v16 dsid];
          *(_DWORD *)buf = 138543618;
          v64 = v28;
          __int16 v65 = 2112;
          v66 = v16;
          _os_log_error_impl(&dword_19091D000, v19, OS_LOG_TYPE_ERROR, "Unexpected condition updating accounts - no principal path for delegateInfo: %{public}@ %@", buf, 0x16u);

          id v7 = v46;
        }
LABEL_16:

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (!v13)
      {
LABEL_18:

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v30 = [v11 allValues];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v54 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = [(CNChildDelegateAccountsStore *)self removeAccount:*(void *)(*((void *)&v53 + 1) + 8 * i)];
              [v7 addObject:v35];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v62 count:16];
          }
          while (v32);
        }

        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v36 = v7;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v49 objects:v61 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v50 != v39) {
                objc_enumerationMutation(v36);
              }
              id v41 = (id)[*(id *)(*((void *)&v49 + 1) + 8 * j) result:0];
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v49 objects:v61 count:16];
          }
          while (v38);
        }

        id v6 = v45;
        goto LABEL_37;
      }
    }
  }
  v42 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
    -[CNChildDelegateAccountsStore updateAccounts:error:](v42);
  }

  v43 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:9 userInfo:0];
  id v36 = v43;
  if (a4)
  {
    id v36 = v43;
    *a4 = v36;
  }
LABEL_37:

  return v6 != 0;
}

uint64_t __53__CNChildDelegateAccountsStore_updateAccounts_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_principalPath");
}

- (id)addChildWithDelegateInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChildDelegateAccountsStore *)self accountStore];
  id v6 = [v5 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17778]];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v6];
  id v8 = objc_opt_class();
  v9 = [(CNChildDelegateAccountsStore *)self parentAccount];
  [v8 configureChildAccount:v7 withSettingsFromDelegateInfo:v4 parent:v9];

  v10 = objc_msgSend(v7, "_cn_principalPath");
  [v7 setObject:v10 forKeyedSubscript:@"serverRootPath"];

  v11 = [(CNChildDelegateAccountsStore *)self parentAccount];
  [v7 setParentAccount:v11];

  [v7 setAuthenticationType:@"parent"];

  return v7;
}

+ (void)configureChildAccount:(id)a3 withSettingsFromDelegateInfo:(id)a4 parent:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  [v7 setPropertiesFromDelegateInfo:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [&unk_1EE04A8D0 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(&unk_1EE04A8D0);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = [v7 objectForKeyedSubscript:v13];

        if (!v14)
        {
          uint64_t v15 = [v8 objectForKeyedSubscript:v13];
          [v7 setObject:v15 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [&unk_1EE04A8D0 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (id)updateAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChildDelegateAccountsStore *)self accountStore];
  id v6 = objc_msgSend(v5, "_cn_canSaveAccount:", v4);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke;
  v16[3] = &unk_1E569FB88;
  v16[4] = self;
  id v7 = v4;
  id v17 = v7;
  [v6 addFailureBlock:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_26;
  v14[3] = &unk_1E56A0518;
  v14[4] = self;
  id v8 = v7;
  id v15 = v8;
  [v6 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_28;
  v12[3] = &unk_1E56A1868;
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = [v6 flatMap:v12];

  return v10;
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_cold_1(a1);
  }
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_26(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_26_cold_1(a1);
  }
}

id __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_28(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accountStore];
  id v3 = objc_msgSend(v2, "_cn_saveVerifiedAccount:", *(void *)(a1 + 40));

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_2;
  v9[3] = &unk_1E569FB88;
  id v4 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v4;
  [v3 addFailureBlock:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_29;
  v7[3] = &unk_1E56A0518;
  id v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  [v3 addSuccessBlock:v7];

  return v3;
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_2_cold_1(a1);
  }
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_29(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_29_cold_1(a1);
  }
}

- (id)removeAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChildDelegateAccountsStore *)self accountStore];
  id v6 = objc_msgSend(v5, "_cn_removeAccount:", v4);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__CNChildDelegateAccountsStore_removeAccount___block_invoke;
  v12[3] = &unk_1E569FB88;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  [v6 addFailureBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_31;
  v10[3] = &unk_1E56A0518;
  v10[4] = self;
  id v11 = v7;
  id v8 = v7;
  [v6 addSuccessBlock:v10];

  return v6;
}

void __46__CNChildDelegateAccountsStore_removeAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_cold_1(a1);
  }
}

void __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_31(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_31_cold_1(a1);
  }
}

- (ACAccount)parentAccount
{
  return self->_parentAccount;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_parentAccount, 0);
}

- (void)updateAccounts:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "Cannot update delegate accounts without a valid input set of delegates. Aborting -updateAcconuts:error:", v1, 2u);
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_3_3(a1) identifier];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1(&dword_19091D000, v2, v3, "Delegate with account ID %@ cannot be saved, error %{public}@", v4, v5, v6, v7, v8);
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_26_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_3_3(a1) identifier];
  OUTLINED_FUNCTION_2_3(&dword_19091D000, v2, v3, "Delegate with account ID %@ can be saved", v4, v5, v6, v7, 2u);
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_3_3(a1) identifier];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1(&dword_19091D000, v2, v3, "Delegate with account ID %@ save failed, error %{public}@", v4, v5, v6, v7, v8);
}

void __46__CNChildDelegateAccountsStore_updateAccount___block_invoke_29_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_3_3(a1) identifier];
  OUTLINED_FUNCTION_2_3(&dword_19091D000, v2, v3, "Delegate with account ID %@ saved", v4, v5, v6, v7, 2u);
}

void __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_3_3(a1) identifier];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1(&dword_19091D000, v2, v3, "Delegate with account ID %@ failed to be removed, error %{public}@", v4, v5, v6, v7, v8);
}

void __46__CNChildDelegateAccountsStore_removeAccount___block_invoke_31_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_3_3(a1) identifier];
  OUTLINED_FUNCTION_2_3(&dword_19091D000, v2, v3, "Delegate with account ID %@ was successfully removed", v4, v5, v6, v7, 2u);
}

@end