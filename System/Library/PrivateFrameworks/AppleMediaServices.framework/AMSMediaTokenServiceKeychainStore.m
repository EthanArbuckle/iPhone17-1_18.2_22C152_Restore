@interface AMSMediaTokenServiceKeychainStore
- (AMSMediaTokenServiceKeychainStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4;
- (BOOL)_removeTokenFromKeychain;
- (BOOL)storeToken:(id)a3;
- (NSString)clientIdentifier;
- (NSString)keychainAccessGroup;
- (__CFDictionary)_copyKeychainQuery;
- (id)retrieveToken;
- (void)setKeychainAccessGroup:(id)a3;
@end

@implementation AMSMediaTokenServiceKeychainStore

- (AMSMediaTokenServiceKeychainStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSMediaTokenServiceKeychainStore;
  v8 = [(AMSMediaTokenServiceKeychainStore *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    keychainAccessGroup = v8->_keychainAccessGroup;
    v8->_keychainAccessGroup = (NSString *)v11;
  }
  return v8;
}

- (id)retrieveToken
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSMediaTokenServiceKeychainStore *)self _copyKeychainQuery];
  v4 = (const void *)*MEMORY[0x1E4F3BC70];
  CFDictionaryAddValue(v3, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFTypeRef result = 0;
  if (!SecItemCopyMatching(v3, &result))
  {
LABEL_19:
    uint64_t v6 = 0;
    goto LABEL_20;
  }
  v5 = (const void *)*MEMORY[0x1E4F3B558];
  CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B5B0]);
  uint64_t v6 = SecItemCopyMatching(v3, &result);
  if (!v6)
  {
    id v7 = +[AMSLogConfig sharedMediaConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = (uint64_t)v9;
      __int16 v57 = 2114;
      v58 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Media token previously stored with 'when unlocked' attribute found, attempting to re-save with 'after first unlock' and then return it.", buf, 0x16u);
    }
    CFDictionaryRemoveValue(v3, v4);
    uint64_t v12 = SecItemDelete(v3);
    if (v12)
    {
      v13 = +[AMSLogConfig sharedMediaConfig];
      if (!v13)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      objc_super v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        id v16 = v15;
        v17 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
        v18 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];
        *(_DWORD *)buf = 138543874;
        uint64_t v56 = (uint64_t)v15;
        __int16 v57 = 2114;
        v58 = v17;
        __int16 v59 = 2114;
        v60 = v18;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to delete media token previously stored with 'when unlocked' attribute. Status: %{public}@", buf, 0x20u);
      }
    }
    CFDictionarySetValue(v3, v5, (const void *)*MEMORY[0x1E4F3B570]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x1E4F3BD38], result);
    if (SecItemAdd(v3, 0))
    {
      v19 = +[AMSLogConfig sharedMediaConfig];
      if (!v19)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        id v22 = v21;
        v23 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
        v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];
        *(_DWORD *)buf = 138543874;
        uint64_t v56 = (uint64_t)v21;
        __int16 v57 = 2114;
        v58 = v23;
        __int16 v59 = 2114;
        v60 = v24;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to re-save media token data with 'after first unlock' attribute. Status: %{public}@", buf, 0x20u);
      }
    }
    goto LABEL_19;
  }
LABEL_20:
  CFRelease(v3);
  if (v6 || (v25 = (void *)result) == 0)
  {
    v35 = +[AMSLogConfig sharedMediaConfig];
    if (!v35)
    {
      v35 = +[AMSLogConfig sharedConfig];
    }
    v36 = [v35 OSLogObject];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_opt_class();
      id v38 = v37;
      v39 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
      v40 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
      *(_DWORD *)buf = 138543874;
      uint64_t v56 = (uint64_t)v37;
      __int16 v57 = 2114;
      v58 = v39;
      __int16 v59 = 2114;
      v60 = v40;
      _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to fetch media token data from keychain. Status: %{public}@", buf, 0x20u);
    }
    if (soft_MKBDeviceUnlockedSinceBoot())
    {
      id v34 = 0;
      goto LABEL_52;
    }
    BOOL v41 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v42 = +[AMSLogConfig sharedMediaConfig];
    v25 = (void *)v42;
    if (v41)
    {
      if (!v42)
      {
        v25 = +[AMSLogConfig sharedConfig];
      }
      v43 = [v25 OSLogObject];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = objc_opt_class();
        v45 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v56 = v44;
        __int16 v57 = 2114;
        v58 = v45;
        _os_log_impl(&dword_18D554000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected attempt to retrieve token before first unlock", buf, 0x16u);
      }
      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v27 = +[AMSLogConfig sharedMediaConfig];
      [v25 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v27 userInfo:0];
    }
    else
    {
      if (!v42)
      {
        v25 = +[AMSLogConfig sharedConfig];
      }
      v27 = [v25 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        uint64_t v50 = objc_opt_class();
        v51 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v56 = v50;
        __int16 v57 = 2114;
        v58 = v51;
        _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Unexpected attempt to retrieve token before first unlock", buf, 0x16u);
      }
    }
    id v34 = 0;
  }
  else
  {
    id v53 = 0;
    v26 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:result error:&v53];
    v27 = v53;
    uint64_t v28 = +[AMSLogConfig sharedMediaConfig];
    v29 = (void *)v28;
    if (v27)
    {
      if (!v28)
      {
        v29 = +[AMSLogConfig sharedConfig];
      }
      v30 = [v29 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = objc_opt_class();
        id v32 = v31;
        v33 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v56 = (uint64_t)v31;
        __int16 v57 = 2114;
        v58 = v33;
        __int16 v59 = 2114;
        v60 = v27;
        _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to unarchive media token data. Error: %{public}@", buf, 0x20u);
      }
      id v34 = 0;
    }
    else
    {
      if (!v28)
      {
        v29 = +[AMSLogConfig sharedConfig];
      }
      v46 = [v29 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = objc_opt_class();
        id v48 = v47;
        v49 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v56 = (uint64_t)v47;
        __int16 v57 = 2114;
        v58 = v49;
        _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieved media token data from keychain", buf, 0x16u);
      }
      id v34 = v26;
    }
  }
LABEL_52:
  return v34;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (__CFDictionary)_copyKeychainQuery
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  v4 = (const void *)*MEMORY[0x1E4F3B5C0];
  v5 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
  CFDictionaryAddValue(Mutable, v4, v5);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD08], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], @"com.apple.AppleMediaServices.mediaToken");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B570]);
  uint64_t v6 = [(AMSMediaTokenServiceKeychainStore *)self keychainAccessGroup];

  if (v6)
  {
    id v7 = (const void *)*MEMORY[0x1E4F3B550];
    v8 = [(AMSMediaTokenServiceKeychainStore *)self keychainAccessGroup];
    CFDictionaryAddValue(Mutable, v7, v8);
  }
  return Mutable;
}

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (BOOL)storeToken:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AMSMediaTokenServiceKeychainStore *)self _removeTokenFromKeychain];
  if (v4)
  {
    id v38 = 0;
    v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v38];
    id v6 = v38;
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (v7)
    {
      v8 = +[AMSLogConfig sharedMediaConfig];
      if (!v8)
      {
        v8 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = objc_opt_class();
        id v11 = v10;
        uint64_t v12 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v40 = (uint64_t)v10;
        __int16 v41 = 2114;
        uint64_t v42 = v12;
        __int16 v43 = 2114;
        id v44 = v6;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive media token. Error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      objc_super v14 = [(AMSMediaTokenServiceKeychainStore *)self _copyKeychainQuery];
      CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E4F3BD38], v5);
      uint64_t v15 = SecItemAdd(v14, 0);
      CFRelease(v14);
      uint64_t v16 = +[AMSLogConfig sharedMediaConfig];
      v17 = (void *)v16;
      if (!v15)
      {
        if (!v16)
        {
          v17 = +[AMSLogConfig sharedConfig];
        }
        v29 = [v17 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_opt_class();
          id v31 = v30;
          id v32 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = (uint64_t)v30;
          __int16 v41 = 2114;
          uint64_t v42 = v32;
          _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Saved media token data to keychain.", buf, 0x16u);
        }
        BOOL v13 = 1;
        goto LABEL_39;
      }
      if (!v16)
      {
        v17 = +[AMSLogConfig sharedConfig];
      }
      v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        id v36 = v19;
        v20 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
        v21 = [MEMORY[0x1E4F28ED0] numberWithInt:v15];
        *(_DWORD *)buf = 138543874;
        uint64_t v40 = (uint64_t)v19;
        __int16 v41 = 2114;
        uint64_t v42 = v20;
        __int16 v43 = 2114;
        id v44 = v21;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to save media token data to keychain. Status: %{public}@", buf, 0x20u);
      }
      if (!soft_MKBDeviceUnlockedSinceBoot())
      {
        BOOL v22 = +[AMSUnitTests isRunningUnitTests];
        uint64_t v23 = +[AMSLogConfig sharedMediaConfig];
        v24 = (void *)v23;
        if (v22)
        {
          if (!v23)
          {
            v24 = +[AMSLogConfig sharedConfig];
          }
          v25 = [v24 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = objc_opt_class();
            v27 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v40 = v26;
            __int16 v41 = 2114;
            uint64_t v42 = v27;
            _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected attempt to store token before first unlock", buf, 0x16u);
          }
          v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v28 = +[AMSLogConfig sharedMediaConfig];
          [v24 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v28 userInfo:0];
        }
        else
        {
          if (!v23)
          {
            v24 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v28 = [v24 OSLogObject];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            uint64_t v33 = objc_opt_class();
            id v34 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v40 = v33;
            __int16 v41 = 2114;
            uint64_t v42 = v34;
            _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Unexpected attempt to store token before first unlock", buf, 0x16u);
          }
        }
      }
      if (v15 == -34018)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __48__AMSMediaTokenServiceKeychainStore_storeToken___block_invoke;
        block[3] = &unk_1E559EA90;
        block[4] = self;
        if (storeToken__logOnceToken__COUNTER__ != -1) {
          dispatch_once(&storeToken__logOnceToken__COUNTER__, block);
        }
      }
    }
    BOOL v13 = 0;
LABEL_39:

    goto LABEL_40;
  }
  BOOL v13 = 1;
LABEL_40:

  return v13;
}

void __48__AMSMediaTokenServiceKeychainStore_storeToken___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedMediaConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = [*(id *)(a1 + 32) clientIdentifier];
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Failed to save media token to keychain, it will be refetched for every request (performance concern)", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)_removeTokenFromKeychain
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedMediaConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    uint64_t v7 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
    *(_DWORD *)buf = 138543618;
    v27 = v5;
    __int16 v28 = 2114;
    v29 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Trying to remove media token data from keychain", buf, 0x16u);
  }
  __int16 v8 = [(AMSMediaTokenServiceKeychainStore *)self _copyKeychainQuery];
  uint64_t v9 = SecItemDelete(v8);
  CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B5B0]);
  uint64_t v10 = SecItemDelete(v8);
  CFRelease(v8);
  if (v9 != -25303 && v9 != -25300 && v9)
  {
    id v11 = +[AMSLogConfig sharedMediaConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = objc_opt_class();
      id v25 = v13;
      objc_super v14 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
      uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      __int16 v28 = 2114;
      v29 = v14;
      __int16 v30 = 2114;
      id v31 = v15;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove media token data stored with 'after first unlock' attribute from keychain. Status: %{public}@", buf, 0x20u);
    }
  }
  if (v10 != -25303 && v10 != -25300 && v10)
  {
    uint64_t v16 = +[AMSLogConfig sharedMediaConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    v21 = objc_opt_class();
    id v19 = v21;
    v20 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
    BOOL v22 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    *(_DWORD *)buf = 138543874;
    v27 = v21;
    __int16 v28 = 2114;
    v29 = v20;
    __int16 v30 = 2114;
    id v31 = v22;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove media token data stored with 'when unlocked' attribute from keychain. Status: %{public}@", buf, 0x20u);

    goto LABEL_27;
  }
  if (v9 != -25303 && v9 && v9 != -25300) {
    return !v9 || v10 == 0;
  }
  uint64_t v16 = +[AMSLogConfig sharedMediaConfig];
  if (!v16)
  {
    uint64_t v16 = +[AMSLogConfig sharedConfig];
  }
  v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    id v19 = v18;
    v20 = [(AMSMediaTokenServiceKeychainStore *)self clientIdentifier];
    *(_DWORD *)buf = 138543618;
    v27 = v18;
    __int16 v28 = 2114;
    v29 = v20;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removed media token data from keychain", buf, 0x16u);
LABEL_27:
  }
LABEL_28:

  return !v9 || v10 == 0;
}

- (void)setKeychainAccessGroup:(id)a3
{
}

@end