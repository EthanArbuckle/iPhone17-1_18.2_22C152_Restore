@interface FMKeychainManager
+ (id)sharedInstance;
- (BOOL)deleteDataForAccount:(id)a3 service:(id)a4;
- (BOOL)setData:(id)a3 forAccount:(id)a4 service:(id)a5;
- (BOOL)setData:(id)a3 forAccount:(id)a4 service:(id)a5 synchronizable:(int64_t)a6 dataProtectionClass:(int64_t)a7 migratable:(int64_t)a8;
- (BOOL)setPassword:(id)a3 forAccount:(id)a4 service:(id)a5;
- (BOOL)setPassword:(id)a3 forAccount:(id)a4 service:(id)a5 synchronizable:(int64_t)a6 dataProtectionClass:(int64_t)a7 migratable:(int64_t)a8;
- (id)_accessibilityForDataProtectionClass:(int64_t)a3 migratable:(BOOL)a4;
- (id)_query:(id)a3 error:(id *)a4;
- (id)allAccountsForService:(id)a3;
- (id)allRecords;
- (id)allServices;
- (id)dataForAccount:(id)a3 service:(id)a4;
- (id)itemForAccount:(id)a3 service:(id)a4 error:(id *)a5;
- (id)passwordForAccount:(id)a3 service:(id)a4;
- (int)_add:(id)a3;
- (int)_delete:(id)a3;
- (int)_updateWithQuery:(id)a3 attributes:(id)a4;
- (void)_migrateToValueDataIfNeeded:(id)a3 account:(id)a4 service:(id)a5;
@end

@implementation FMKeychainManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FMKeychainManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, block);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __35__FMKeychainManager_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (BOOL)deleteDataForAccount:(id)a3 service:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionary];
  [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B850]];

  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  LOBYTE(v8) = [(FMKeychainManager *)self _delete:v9] == 0;

  return (char)v8;
}

- (BOOL)setData:(id)a3 forAccount:(id)a4 service:(id)a5 synchronizable:(int64_t)a6 dataProtectionClass:(int64_t)a7 migratable:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v17 = *MEMORY[0x1E4F3B850];
  [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  uint64_t v18 = *MEMORY[0x1E4F3B5C0];
  [v16 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  uint64_t v19 = *MEMORY[0x1E4F3BD38];
  v28 = v13;
  [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  if (a6 != 2)
  {
    v20 = [MEMORY[0x1E4F28ED0] numberWithBool:a6 == 1];
    [v16 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F3B878]];
  }
  if (a8 != 2)
  {
    v21 = [(FMKeychainManager *)self _accessibilityForDataProtectionClass:a7 migratable:a8 == 1];
    if (v21) {
      [v16 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F3B558]];
    }
  }
  int v22 = -[FMKeychainManager _add:](self, "_add:", v16, a7);
  if (v22 == -25299)
  {
    v23 = [MEMORY[0x1E4F1CA60] dictionary];
    v24 = (void *)[v16 mutableCopy];
    [v24 removeObjectForKey:*MEMORY[0x1E4F3B978]];
    [v23 setObject:v15 forKeyedSubscript:v17];
    [v23 setObject:v14 forKeyedSubscript:v18];
    [v24 setObject:v28 forKeyedSubscript:v19];
    v25 = objc_opt_new();
    [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F3B688]];

    int v22 = [(FMKeychainManager *)self _updateWithQuery:v23 attributes:v24];
  }

  return v22 == 0;
}

- (BOOL)setData:(id)a3 forAccount:(id)a4 service:(id)a5
{
  return [(FMKeychainManager *)self setData:a3 forAccount:a4 service:a5 synchronizable:2 dataProtectionClass:0 migratable:2];
}

- (id)dataForAccount:(id)a3 service:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  id v8 = [(FMKeychainManager *)self itemForAccount:v6 service:v7 error:&v16];
  id v9 = v16;
  v10 = [v8 rawData];

  if (v9)
  {
    v11 = LogCategory_Unspecified();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl(&dword_1D0EC4000, v11, OS_LOG_TYPE_ERROR, "dataForAccount a: %@, s: %@ error: %@", buf, 0x20u);
    }
LABEL_11:

    id v14 = 0;
    goto LABEL_12;
  }
  v12 = objc_opt_new();

  id v13 = LogCategory_Unspecified();
  v11 = v13;
  if (!v10 || v10 == v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FMKeychainManager dataForAccount:service:]((uint64_t)v6, (uint64_t)v7, v11);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1D0EC4000, v11, OS_LOG_TYPE_DEFAULT, "dataForAccount a: %@, s: %@.", buf, 0x16u);
  }

  id v14 = v10;
LABEL_12:

  return v14;
}

- (BOOL)setPassword:(id)a3 forAccount:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 dataUsingEncoding:4];
  LOBYTE(self) = [(FMKeychainManager *)self setData:v10 forAccount:v9 service:v8];

  return (char)self;
}

- (BOOL)setPassword:(id)a3 forAccount:(id)a4 service:(id)a5 synchronizable:(int64_t)a6 dataProtectionClass:(int64_t)a7 migratable:(int64_t)a8
{
  id v14 = a5;
  id v15 = a4;
  id v16 = [a3 dataUsingEncoding:4];
  LOBYTE(a8) = [(FMKeychainManager *)self setData:v16 forAccount:v15 service:v14 synchronizable:a6 dataProtectionClass:a7 migratable:a8];

  return a8;
}

- (id)passwordForAccount:(id)a3 service:(id)a4
{
  v4 = [(FMKeychainManager *)self itemForAccount:a3 service:a4 error:0];
  v5 = [v4 password];

  return v5;
}

- (id)itemForAccount:(id)a3 service:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  [v10 setObject:*MEMORY[0x1E4F3BB90] forKeyedSubscript:*MEMORY[0x1E4F3BB80]];
  [v10 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F3BC70]];
  v11 = [(FMKeychainManager *)self _query:v10 error:a5];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = [[FMInternalKeychainItem alloc] initWithResults:v11];
    [(FMKeychainManager *)self _migrateToValueDataIfNeeded:v11 account:v8 service:v9];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)allServices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(FMKeychainManager *)self _query:v4 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = *MEMORY[0x1E4F3B850];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKeyedSubscript:v9];
        [v3 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  v12 = [v3 allObjects];

  return v12;
}

- (id)allAccountsForService:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  uint64_t v7 = [(FMKeychainManager *)self _query:v6 error:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    uint64_t v11 = *MEMORY[0x1E4F3B5C0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKeyedSubscript:v11];
        [v5 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  long long v14 = [v5 allObjects];

  return v14;
}

- (id)allRecords
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(FMKeychainManager *)self _query:v3 error:0];

  return v4;
}

- (int)_add:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F3B978];
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];

  if (!v5) {
    [v3 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:v4];
  }
  OSStatus v6 = SecItemAdd((CFDictionaryRef)v3, 0);
  int v7 = v6;
  if (v6 != -25299 && v6)
  {
    uint64_t v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FMKeychainManager _add:]();
    }
  }
  return v7;
}

- (int)_updateWithQuery:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  CFDictionaryRef v6 = (const __CFDictionary *)a4;
  uint64_t v7 = *MEMORY[0x1E4F3B978];
  uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];

  if (!v8) {
    [v5 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:v7];
  }
  OSStatus v9 = SecItemUpdate((CFDictionaryRef)v5, v6);
  if (v9)
  {
    uint64_t v10 = LogCategory_Unspecified();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FMKeychainManager _updateWithQuery:attributes:]();
    }
  }
  return v9;
}

- (int)_delete:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F3B978];
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];

  if (!v5) {
    [v3 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:v4];
  }
  OSStatus v6 = SecItemDelete((CFDictionaryRef)v3);
  int v7 = v6;
  if (v6)
  {
    if (v6 == -25300)
    {
      uint64_t v8 = LogCategory_Unspecified();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FMKeychainManager _delete:](v8);
      }
    }
    else
    {
      uint64_t v8 = LogCategory_Unspecified();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[FMKeychainManager _delete:]();
      }
    }
  }
  return v7;
}

- (id)_query:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v19 = 0;
  uint64_t v6 = *MEMORY[0x1E4F3B978];
  int v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];

  if (!v7) {
    [v5 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:v6];
  }
  uint64_t v8 = *MEMORY[0x1E4F3BB80];
  OSStatus v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3BB80]];

  if (!v9) {
    [v5 setObject:*MEMORY[0x1E4F3BB88] forKeyedSubscript:v8];
  }
  uint64_t v10 = *MEMORY[0x1E4F3BC68];
  uint64_t v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3BC68]];

  if (!v11) {
    [v5 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:v10];
  }
  OSStatus v12 = SecItemCopyMatching((CFDictionaryRef)v5, (CFTypeRef *)&v19);
  if (v12)
  {
    if (a4)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F61540];
      BOOL v15 = v12 != -25300;
      uint64_t v20 = *MEMORY[0x1E4F28A50];
      long long v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v12 userInfo:0];
      v21[0] = v16;
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a4 = [v13 errorWithDomain:v14 code:v15 userInfo:v17];

      a4 = 0;
    }
  }
  else
  {
    a4 = v19;
  }

  return a4;
}

- (id)_accessibilityForDataProtectionClass:(int64_t)a3 migratable:(BOOL)a4
{
  if ((unint64_t)(a3 - 1) > 5)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = (id **)&unk_1E689ED50;
    if (!a4) {
      id v5 = (id **)&unk_1E689ED80;
    }
    id v6 = *v5[a3 - 1];
  }
  return v6;
}

- (void)_migrateToValueDataIfNeeded:(id)a3 account:(id)a4 service:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  id v33 = a5;
  uint64_t v7 = *MEMORY[0x1E4F3B688];
  id v8 = a3;
  OSStatus v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = *MEMORY[0x1E4F3BD38];
  uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];

  OSStatus v12 = objc_opt_new();
  int v13 = [v9 isEqualToData:v12];

  uint64_t v14 = [v9 length];
  uint64_t v15 = v14;
  int v16 = v13 ^ 1;
  if (v9) {
    int v17 = v13 ^ 1;
  }
  else {
    int v17 = 0;
  }
  if (v14) {
    int v18 = v17;
  }
  else {
    int v18 = 0;
  }
  long long v19 = objc_opt_new();
  int v20 = [v11 isEqualToData:v19];

  if (!v11)
  {
    if (!v18) {
      goto LABEL_17;
    }
LABEL_13:
    uint64_t v21 = objc_opt_new();
    [v21 setObject:v9 forKeyedSubscript:v10];
    v29 = objc_opt_new();
    [v21 setObject:v29 forKeyedSubscript:v7];

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    v24 = v33;
    [v23 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F3B850]];
    v25 = v34;
    [v23 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
    int v30 = [(FMKeychainManager *)self _updateWithQuery:v23 attributes:v21];
    v27 = LogCategory_Unspecified();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v36 = (id)v30;
      __int16 v37 = 2112;
      id v38 = v34;
      __int16 v39 = 2112;
      *(void *)v40 = v33;
      v28 = "Migration of keychain item result: %ld, a: %@, s: %@";
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_20;
  }
  if (v20 & v18) {
    goto LABEL_13;
  }
  if (v18)
  {
    uint64_t v21 = objc_opt_new();
    [v21 setObject:v11 forKeyedSubscript:v10];
    id v22 = objc_opt_new();
    [v21 setObject:v22 forKeyedSubscript:v7];

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    v24 = v33;
    [v23 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F3B850]];
    v25 = v34;
    [v23 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
    int v26 = [(FMKeychainManager *)self _updateWithQuery:v23 attributes:v21];
    v27 = LogCategory_Unspecified();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v36 = (id)v26;
      __int16 v37 = 2112;
      id v38 = v34;
      __int16 v39 = 2112;
      *(void *)v40 = v33;
      v28 = "Removing any remaining generic attribute of keychain item result: %ld, a: %@, s: %@";
LABEL_15:
      _os_log_impl(&dword_1D0EC4000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x20u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v21 = LogCategory_Unspecified();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138414338;
    BOOL v31 = v15 != 0;
    v24 = v33;
    v25 = v34;
    id v36 = v34;
    __int16 v37 = 2112;
    id v38 = v33;
    __int16 v39 = 1024;
    *(_DWORD *)v40 = v9 != 0;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = v16;
    __int16 v41 = 1024;
    int v42 = *(_DWORD *)v40;
    __int16 v43 = 1024;
    BOOL v44 = v31;
    __int16 v45 = 1024;
    BOOL v46 = v11 == 0;
    __int16 v47 = 1024;
    int v48 = v20;
    __int16 v49 = 1024;
    BOOL v50 = v46;
    _os_log_impl(&dword_1D0EC4000, v21, OS_LOG_TYPE_INFO, "No migration of keychain item required. a: %@, s: %@. notNil: %i, notNewData: %i, notNull: %i, greaterThanZero: %i, dataIsNil: %i, dataIsNewData: %i, dataIsNull: %i.", buf, 0x40u);
  }
  else
  {
    v24 = v33;
    v25 = v34;
  }
LABEL_20:
}

- (void)dataForAccount:(os_log_t)log service:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "dataForAccount is empty a: %@, s: %@!", (uint8_t *)&v3, 0x16u);
}

- (void)_add:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_3(&dword_1D0EC4000, v0, v1, "SecItemAdd error: %ld", v2, v3, v4, v5, v6);
}

- (void)_updateWithQuery:attributes:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_3(&dword_1D0EC4000, v0, v1, "SecItemUpdate error: %ld", v2, v3, v4, v5, v6);
}

- (void)_delete:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_3(&dword_1D0EC4000, v0, v1, "SecItemDelete error: %ld", v2, v3, v4, v5, v6);
}

- (void)_delete:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "SecItemDelete error: The specified item could not be found in the keychain", v1, 2u);
}

@end