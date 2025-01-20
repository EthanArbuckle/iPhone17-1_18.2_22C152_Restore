@interface VSKeychainStore
- (BOOL)_fixUpdateConflictForItemWithAttributes:(id)a3 andAttributesToUpdate:(id)a4;
- (BOOL)deleteItemsMatchingQuery:(id)a3 error:(id *)a4;
- (BOOL)updateAttributes:(id)a3 ofItemsMatchingQuery:(id)a4 attemptCount:(int64_t)a5 error:(id *)a6;
- (BOOL)updateAttributes:(id)a3 ofItemsMatchingQuery:(id)a4 error:(id *)a5;
- (id)addItem:(id)a3 error:(id *)a4;
- (id)findItemsMatchingQuery:(id)a3 error:(id *)a4;
@end

@implementation VSKeychainStore

- (id)addItem:(id)a3 error:(id *)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  CFTypeRef result = 0;
  OSStatus v7 = SecItemAdd(v6, &result);
  if (v7 != -25299)
  {
    if (!v7)
    {
      v8 = (void *)result;
      if (result) {
        goto LABEL_19;
      }
      v9 = VSErrorLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[VSKeychainStore addItem:error:](v9);
      }

      goto LABEL_15;
    }
    if (a4)
    {
      uint64_t v14 = *MEMORY[0x1E4F28760];
      uint64_t v15 = v7;
      v13 = (void *)MEMORY[0x1E4F28C58];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  OSStatus v10 = SecItemDelete(v6);
  if (v10)
  {
    int v11 = v10;
    v12 = VSErrorLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VSKeychainStore addItem:error:](v11, v12);
    }

    if (a4)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28760];
      uint64_t v15 = -25299;
LABEL_14:
      [v13 errorWithDomain:v14 code:v15 userInfo:0];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_19;
  }
  v16 = VSDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1DA674000, v16, OS_LOG_TYPE_DEFAULT, "Successfully deleted conflicting item, re-attempting insertion.", v18, 2u);
  }

  v8 = [(VSKeychainStore *)self addItem:v6 error:a4];
LABEL_19:

  return v8;
}

- (id)findItemsMatchingQuery:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5 == -25300)
  {
    CFDictionaryRef v6 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
  if (v5)
  {
    if (a4)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
      CFDictionaryRef v6 = 0;
      *a4 = v8;
      goto LABEL_11;
    }
  }
  else
  {
    CFDictionaryRef v6 = (void *)result;
    if (result) {
      goto LABEL_11;
    }
    OSStatus v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VSKeychainStore findItemsMatchingQuery:error:](v7);
    }
  }
  CFDictionaryRef v6 = 0;
LABEL_11:

  return v6;
}

- (BOOL)updateAttributes:(id)a3 ofItemsMatchingQuery:(id)a4 error:(id *)a5
{
  return [(VSKeychainStore *)self updateAttributes:a3 ofItemsMatchingQuery:a4 attemptCount:1 error:a5];
}

- (BOOL)updateAttributes:(id)a3 ofItemsMatchingQuery:(id)a4 attemptCount:(int64_t)a5 error:(id *)a6
{
  CFDictionaryRef v10 = (const __CFDictionary *)a3;
  CFDictionaryRef v11 = (const __CFDictionary *)a4;
  OSStatus v12 = SecItemUpdate(v11, v10);
  if (!v12)
  {
    BOOL v14 = 1;
    goto LABEL_17;
  }
  if (v12 != -25299)
  {
    if (a6)
    {
      uint64_t v15 = *MEMORY[0x1E4F28760];
      uint64_t v16 = v12;
      v17 = (void *)MEMORY[0x1E4F28C58];
LABEL_9:
      [v17 errorWithDomain:v15 code:v16 userInfo:0];
      BOOL v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  BOOL v13 = [(VSKeychainStore *)self _fixUpdateConflictForItemWithAttributes:v11 andAttributesToUpdate:v10];
  if (a5 > 4 || !v13)
  {
    if (a5 >= 5)
    {
      v18 = VSErrorLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[VSKeychainStore updateAttributes:ofItemsMatchingQuery:attemptCount:error:](v18);
      }

      goto LABEL_16;
    }
    if (a6)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28760];
      uint64_t v16 = -25299;
      goto LABEL_9;
    }
    goto LABEL_16;
  }
  BOOL v14 = [(VSKeychainStore *)self updateAttributes:v10 ofItemsMatchingQuery:v11 attemptCount:a5 + 1 error:a6];
LABEL_17:

  return v14;
}

- (BOOL)deleteItemsMatchingQuery:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  OSStatus v6 = SecItemDelete(v5);
  OSStatus v7 = v6;
  if (v6 && v6 != -25300)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v6 userInfo:0];
    }
  }
  else if (v6 == -25300)
  {
    id v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      CFDictionaryRef v13 = v5;
      _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Failed to find item to delete with query %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (v7) {
    BOOL v9 = v7 == -25300;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = v9;

  return v10;
}

- (BOOL)_fixUpdateConflictForItemWithAttributes:(id)a3 andAttributesToUpdate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  OSStatus v7 = (void *)[a3 mutableCopy];
  [v7 addEntriesFromDictionary:v6];

  [v7 removeObjectForKey:*MEMORY[0x1E4F3B668]];
  [v7 removeObjectForKey:*MEMORY[0x1E4F3B790]];
  [v7 removeObjectForKey:*MEMORY[0x1E4F3BD38]];
  id v16 = 0;
  BOOL v8 = [(VSKeychainStore *)self deleteItemsMatchingQuery:v7 error:&v16];
  id v9 = v16;
  if (v8)
  {
    BOOL v10 = VSDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFDictionaryRef v11 = "Tried to fix an update conflict in Keychain and succeeded.";
LABEL_9:
      CFDictionaryRef v13 = v10;
      uint32_t v14 = 2;
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v10 = VSDefaultLogObject();
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v9;
        CFDictionaryRef v11 = "Tried to fix an update conflict in Keychain and failed with error: %@";
        CFDictionaryRef v13 = v10;
        uint32_t v14 = 12;
LABEL_10:
        _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, v11, buf, v14);
      }
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      CFDictionaryRef v11 = "Tried to fix an update conflict in Keychain and failed.";
      goto LABEL_9;
    }
  }

  return v8;
}

- (void)addItem:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "SecItemAdd() returned errSecSuccess, but the result out-param is NULL.", v1, 2u);
}

- (void)addItem:(int)a1 error:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "SecItemDelete() returned %d attempting to delete conflicting duplicate item.", (uint8_t *)v2, 8u);
}

- (void)findItemsMatchingQuery:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "SecItemCopyMatching() returned errSecSuccess, but the result out-param is NULL.", v1, 2u);
}

- (void)updateAttributes:(os_log_t)log ofItemsMatchingQuery:attemptCount:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DA674000, log, OS_LOG_TYPE_FAULT, "Attempted to update attribute more than max allowed times recursively!", v1, 2u);
}

@end