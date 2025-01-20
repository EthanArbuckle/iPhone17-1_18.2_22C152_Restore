@interface AMSMediaTokenServiceStore
+ (BOOL)_hasAppleGroupEnabled;
- (AMSMediaToken)memoryMediaToken;
- (AMSMediaTokenServiceKeychainStore)keychainStore;
- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4;
- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4 usingAccessControlIdentifier:(BOOL)a5;
- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainStore:(id)a4;
- (BOOL)usingAccessControlIdentifier;
- (NSString)clientIdentifier;
- (NSString)keychainAccessGroup;
- (NSString)notificationObject;
- (id)_keychainAccessGroup;
- (id)_mediaTokenChangedNotificationName;
- (id)_mediaTokenFromUserDefaults;
- (id)retrieveToken;
- (os_unfair_lock_s)accessLock;
- (void)_deleteMediaTokenFromUserDefaultsIfPresent;
- (void)_mediaTokenChanged:(id)a3;
- (void)_setupKeychainNotifications;
- (void)_teardownKeychainNotifications;
- (void)dealloc;
- (void)deleteToken;
- (void)setKeychainAccessGroup:(id)a3;
- (void)setMemoryMediaToken:(id)a3;
- (void)storeToken:(id)a3;
@end

@implementation AMSMediaTokenServiceStore

- (void)dealloc
{
  [(AMSMediaTokenServiceStore *)self _teardownKeychainNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AMSMediaTokenServiceStore;
  [(AMSMediaTokenServiceStore *)&v3 dealloc];
}

- (void)_teardownKeychainNotifications
{
  id v4 = [(AMSMediaTokenServiceStore *)self _mediaTokenChangedNotificationName];
  if (v4)
  {
    objc_super v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 removeObserver:self name:v4 object:0];
  }
}

- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4
{
  id v6 = a3;
  v7 = AMSMediaTokenServiceStoreEffectiveKeychainAccessGroup(a4);
  v8 = [[AMSMediaTokenServiceKeychainStore alloc] initWithClientIdentifier:v6 keychainAccessGroup:v7];
  v9 = [(AMSMediaTokenServiceStore *)self initWithClientIdentifier:v6 keychainStore:v8];

  return v9;
}

- (id)retrieveToken
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  id v4 = self->_memoryMediaToken;
  if (!v4)
  {
    id v4 = [(AMSMediaTokenServiceKeychainStore *)self->_keychainStore retrieveToken];
    if (!v4)
    {
      id v4 = [(AMSMediaTokenServiceStore *)self _mediaTokenFromUserDefaults];
      if (v4) {
        [(AMSMediaTokenServiceKeychainStore *)self->_keychainStore storeToken:v4];
      }
    }
    [(AMSMediaTokenServiceStore *)self _deleteMediaTokenFromUserDefaultsIfPresent];
    objc_storeStrong((id *)&self->_memoryMediaToken, v4);
  }
  os_unfair_lock_unlock(p_accessLock);
  return v4;
}

- (void)_deleteMediaTokenFromUserDefaultsIfPresent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)CFPreferencesCopyAppValue(@"AMSMediaTokens", @"com.apple.AppleMediaServices");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      v7 = +[AMSLogConfig sharedMediaConfig];
      if (!v7)
      {
        v7 = +[AMSLogConfig sharedConfig];
      }
      v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_opt_class();
        id v10 = v9;
        v11 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
        int v15 = 138543618;
        v16 = v9;
        __int16 v17 = 2114;
        v18 = v11;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing previously stored media token from user defaults.", (uint8_t *)&v15, 0x16u);
      }
      v12 = (void *)[v4 mutableCopy];
      v13 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
      [v12 setObject:0 forKeyedSubscript:v13];

      if ([v12 count]) {
        v14 = v12;
      }
      else {
        v14 = 0;
      }
      CFPreferencesSetAppValue(@"AMSMediaTokens", v14, @"com.apple.AppleMediaServices");
      CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
    }
  }
}

- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AMSMediaTokenServiceStore;
  v8 = [(AMSMediaTokenServiceStore *)&v18 init];
  v9 = v8;
  if (v8)
  {
    v8->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v6 copy];
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = (NSString *)v10;

    uint64_t v12 = [v7 keychainAccessGroup];
    keychainAccessGroup = v9->_keychainAccessGroup;
    v9->_keychainAccessGroup = (NSString *)v12;

    objc_storeStrong((id *)&v9->_keychainStore, a4);
    v14 = objc_opt_new();
    uint64_t v15 = [v14 UUIDString];
    notificationObject = v9->_notificationObject;
    v9->_notificationObject = (NSString *)v15;

    [(AMSMediaTokenServiceStore *)v9 _setupKeychainNotifications];
  }

  return v9;
}

- (void)_setupKeychainNotifications
{
  id v4 = [(AMSMediaTokenServiceStore *)self _mediaTokenChangedNotificationName];
  if (v4)
  {
    objc_super v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:self selector:sel__mediaTokenChanged_ name:v4 object:0 suspensionBehavior:2];
  }
}

- (id)_mediaTokenChangedNotificationName
{
  objc_super v3 = [(AMSMediaTokenServiceStore *)self _keychainAccessGroup];
  if (v3)
  {
    id v4 = NSString;
    v5 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
    id v6 = [v4 stringWithFormat:@"com.apple.AppleMediaServices.mediaTokenChanged.%@.%@", v3, v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)_keychainAccessGroup
{
  return AMSMediaTokenServiceStoreEffectiveKeychainAccessGroup(self->_keychainAccessGroup);
}

+ (BOOL)_hasAppleGroupEnabled
{
  if (qword_1EB38DCF8 != -1) {
    dispatch_once(&qword_1EB38DCF8, &__block_literal_global_80);
  }
  return _MergedGlobals_124;
}

void __50__AMSMediaTokenServiceStore__hasAppleGroupEnabled__block_invoke()
{
  v0 = +[AMSProcessInfo valueForEntitlement:@"keychain-access-groups"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v1 = v0;
  }
  else {
    id v1 = 0;
  }

  _MergedGlobals_124 = [v1 containsObject:@"apple"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObject, 0);
  objc_storeStrong((id *)&self->_keychainStore, 0);
  objc_storeStrong((id *)&self->_memoryMediaToken, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (AMSMediaTokenServiceStore)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4 usingAccessControlIdentifier:(BOOL)a5
{
  result = [(AMSMediaTokenServiceStore *)self initWithClientIdentifier:a3 keychainAccessGroup:a4];
  if (result) {
    result->_usingAccessControlIdentifier = a5;
  }
  return result;
}

- (void)setKeychainAccessGroup:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock_with_options();
  id v6 = [(AMSMediaTokenServiceStore *)self _keychainAccessGroup];
  [(AMSMediaTokenServiceStore *)self _teardownKeychainNotifications];
  id v7 = (NSString *)[v5 copy];

  keychainAccessGroup = self->_keychainAccessGroup;
  self->_keychainAccessGroup = v7;

  v9 = [(AMSMediaTokenServiceStore *)self _keychainAccessGroup];
  [(AMSMediaTokenServiceKeychainStore *)self->_keychainStore setKeychainAccessGroup:v9];
  memoryMediaToken = self->_memoryMediaToken;
  self->_memoryMediaToken = 0;

  [(AMSMediaTokenServiceStore *)self _setupKeychainNotifications];
  os_unfair_lock_unlock(p_accessLock);
  v11 = +[AMSLogConfig sharedMediaConfig];
  if (!v11)
  {
    v11 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    id v14 = v13;
    uint64_t v15 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
    int v16 = 138544130;
    __int16 v17 = v13;
    __int16 v18 = 2114;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Changed keychain access group from %@ to %@.", (uint8_t *)&v16, 0x2Au);
  }
}

- (void)storeToken:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  objc_storeStrong((id *)&self->_memoryMediaToken, a3);
  if ([(AMSMediaTokenServiceKeychainStore *)self->_keychainStore storeToken:v5])
  {
    [(AMSMediaTokenServiceStore *)self _deleteMediaTokenFromUserDefaultsIfPresent];
    id v6 = [(AMSMediaTokenServiceStore *)self _mediaTokenChangedNotificationName];
    os_unfair_lock_unlock(&self->_accessLock);
    if (v6)
    {
      id v7 = +[AMSLogConfig sharedMediaConfig];
      if (!v7)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_opt_class();
        id v10 = v9;
        v11 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
        int v13 = 138543618;
        id v14 = v9;
        __int16 v15 = 2114;
        int v16 = v11;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting media token changed notification.", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v12 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v12 postNotificationName:v6 object:self->_notificationObject];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

- (void)deleteToken
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  memoryMediaToken = self->_memoryMediaToken;
  self->_memoryMediaToken = 0;

  BOOL v5 = [(AMSMediaTokenServiceKeychainStore *)self->_keychainStore deleteToken];
  [(AMSMediaTokenServiceStore *)self _deleteMediaTokenFromUserDefaultsIfPresent];
  if (v5)
  {
    id v6 = [(AMSMediaTokenServiceStore *)self _mediaTokenChangedNotificationName];
    os_unfair_lock_unlock(p_accessLock);
    if (v6)
    {
      id v7 = +[AMSLogConfig sharedMediaConfig];
      if (!v7)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_opt_class();
        id v10 = v9;
        v11 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
        int v13 = 138543618;
        id v14 = v9;
        __int16 v15 = 2114;
        int v16 = v11;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting media token changed notification.", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v12 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v12 postNotificationName:v6 object:self->_notificationObject];
    }
  }
  else
  {
    os_unfair_lock_unlock(p_accessLock);
  }
}

- (id)_mediaTokenFromUserDefaults
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)CFPreferencesCopyAppValue(@"AMSMediaTokens", @"com.apple.AppleMediaServices");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    BOOL v5 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
    id v6 = [v4 objectForKeyedSubscript:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = 0;
      id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v22];
      id v8 = v22;
      if (!v7)
      {
        v9 = +[AMSLogConfig sharedMediaConfig];
        if (!v9)
        {
          v9 = +[AMSLogConfig sharedConfig];
        }
        id v10 = [v9 OSLogObject];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v21 = v8;
          v11 = objc_opt_class();
          id v20 = v11;
          uint64_t v12 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
          *(_DWORD *)buf = 138543874;
          uint64_t v24 = v11;
          id v8 = v21;
          __int16 v25 = 2114;
          v26 = v12;
          __int16 v27 = 2114;
          id v28 = v21;
          _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to unarchive media token data. Error: %{public}@", buf, 0x20u);
        }
      }
      int v13 = +[AMSLogConfig sharedMediaConfig];
      if (!v13)
      {
        int v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v8;
        int v16 = objc_opt_class();
        id v17 = v16;
        __int16 v18 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v16;
        id v8 = v15;
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Returning media token loaded from user defaults.", buf, 0x16u);
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_mediaTokenChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  id v6 = [v5 object];

  LOBYTE(v5) = [v6 isEqualToString:self->_notificationObject];
  if ((v5 & 1) == 0)
  {
    id v7 = +[AMSLogConfig sharedMediaConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      v11 = [(AMSMediaTokenServiceStore *)self clientIdentifier];
      int v13 = 138543618;
      id v14 = v9;
      __int16 v15 = 2114;
      int v16 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received media token changed notification.", (uint8_t *)&v13, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    memoryMediaToken = self->_memoryMediaToken;
    self->_memoryMediaToken = 0;

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (BOOL)usingAccessControlIdentifier
{
  return self->_usingAccessControlIdentifier;
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (AMSMediaToken)memoryMediaToken
{
  return self->_memoryMediaToken;
}

- (void)setMemoryMediaToken:(id)a3
{
}

- (AMSMediaTokenServiceKeychainStore)keychainStore
{
  return self->_keychainStore;
}

- (NSString)notificationObject
{
  return self->_notificationObject;
}

@end