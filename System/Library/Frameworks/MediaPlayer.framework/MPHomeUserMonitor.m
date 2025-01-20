@interface MPHomeUserMonitor
+ (BOOL)isExplicitSettingEnabledForCurrentUser;
+ (BOOL)isPrivateListeningEnabledForCurrentUserAndAccessory;
+ (MPHomeUserMonitor)monitorForCurrentUser;
+ (MPHomeUserMonitor)userMonitorWithHomeIdentifier:(id)a3;
+ (MPHomeUserMonitor)userMonitorWithHomeIdentifiers:(id)a3;
+ (MPHomeUserMonitor)userMonitorWithUserIdentity:(id)a3 fromUserIdentityStore:(id)a4;
+ (void)setExplicitSettingEnabledForCurrentUser:(BOOL)a3;
+ (void)setPrivateListeningEnabledForCurrentUserAndAccessory:(BOOL)a3;
- (BOOL)hasAccessoryWithRouteID:(id)a3;
- (BOOL)isExplicitSettingEnabled;
- (BOOL)isPrivateListeningEnabledForCurrentAccessory;
- (BOOL)privateListeningEnabledForAccessoryWithRouteID:(id)a3;
- (MPHomeUserMonitor)initWithUser:(id)a3 homeManager:(id)a4;
- (id)_homeAccesssoryWithRouteID:(id)a3;
- (id)privateListeningEnabledForGroupWithRouteIDs:(id)a3;
- (void)_loadAllowExplicitValue;
- (void)_loadCurrentAccessoryPrivateListening;
- (void)_notifyAllowExplicitUpdated;
- (void)_notifyPrivateListeningUpdated;
- (void)_postNotificationWithName:(id)a3;
- (void)_update;
- (void)_updateUserListeningHistoryControlForAccessory:(id)a3 enable:(BOOL)a4;
- (void)setExplicitSettingEnabled:(BOOL)a3;
- (void)setPrivateListeningEnabledForAccessoryWithRouteID:(id)a3 enabled:(BOOL)a4;
- (void)setPrivateListeningEnabledForCurrentAccessory:(BOOL)a3;
- (void)settingsDidUpdate:(id)a3;
- (void)user:(id)a3 didUpdateUserListeningHistoryUpdateControl:(id)a4 forHome:(id)a5;
@end

@implementation MPHomeUserMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_sharedSettings, 0);
  objc_storeStrong((id *)&self->_privateHomeSettings, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)user:(id)a3 didUpdateUserListeningHistoryUpdateControl:(id)a4 forHome:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v17 = self;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "<MPHomeUserMonitor %p> HMUserDelegatePrivate user:didUpdateUserListeningHistoryUpdateControl:forHome:", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MPHomeUserMonitor_user_didUpdateUserListeningHistoryUpdateControl_forHome___block_invoke;
  block[3] = &unk_1E57FA038;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(accessQueue, block);
}

void __77__MPHomeUserMonitor_user_didUpdateUserListeningHistoryUpdateControl_forHome___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(*(void *)(a1 + 32) + 48) currentAccessory];
  id v2 = *(id *)(a1 + 40);
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  if (v2 == v3)
  {
  }
  else
  {
    v4 = v3;
    id v5 = v2;
    int v6 = [v5 isEqual:v4];

    if (!v6) {
      goto LABEL_11;
    }
  }
  id v7 = *(void **)(a1 + 48);
  id v8 = [*(id *)(*(void *)(a1 + 32) + 48) currentHome];
  if (v7 == v8) {
    int v9 = 1;
  }
  else {
    int v9 = [v7 isEqual:v8];
  }

  if (v9 && v10) {
    [*(id *)(a1 + 32) _loadCurrentAccessoryPrivateListening];
  }
LABEL_11:
}

- (void)settingsDidUpdate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = self;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeUserMonitor %p> HMSettingsDelegate settingsDidUpdate", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__MPHomeUserMonitor_settingsDidUpdate___block_invoke;
  v8[3] = &unk_1E57F9F98;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(accessQueue, v8);
}

void __39__MPHomeUserMonitor_settingsDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rootGroup];
  _findSettingWithKeyPath(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3) {
    [*(id *)(a1 + 40) _loadAllowExplicitValue];
  }
}

- (void)_postNotificationWithName:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MPHomeUserMonitor__postNotificationWithName___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, v7);
}

void __47__MPHomeUserMonitor__postNotificationWithName___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "[<MPHomeUserMonitor %p> posting notification: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*(void *)(a1 + 40) object:*(void *)(a1 + 32)];
}

- (void)_notifyAllowExplicitUpdated
{
}

- (void)_notifyPrivateListeningUpdated
{
}

- (void)_updateUserListeningHistoryControlForAccessory:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v6)
  {
    user = self->_user;
    __int16 v8 = [(HMHomeManager *)self->_homeManager currentHome];
    uint64_t v9 = [(HMUser *)user userListeningHistoryUpdateControlForHome:v8];
    uint64_t v10 = (void *)[v9 mutableCopy];

    if (v4) {
      [v10 removeAccessory:v6];
    }
    else {
      [v10 addAccessory:v6];
    }
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218240;
      uint64_t v13 = self;
      __int16 v14 = 1024;
      BOOL v15 = v4;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "[<MPHomeUserMonitor %p> _updateUserListeningHistoryControlForAccessory:] failed to set enable=%{BOOL}u [accessory=nil]", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (void)_loadCurrentAccessoryPrivateListening
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v3 = [(HMHomeManager *)self->_homeManager currentAccessory];
  user = self->_user;
  id v5 = [(HMHomeManager *)self->_homeManager currentHome];
  id v6 = [(HMUser *)user userListeningHistoryUpdateControlForHome:v5];

  if (v3)
  {
    if (v6)
    {
      uint64_t v7 = [v6 accessories];
      int v8 = [v7 containsObject:v3] ^ 1;

      goto LABEL_10;
    }
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134217984;
      __int16 v14 = self;
      uint64_t v10 = "[<MPHomeUserMonitor %p> _loadCurrentAccessoryPrivateListening:] failed to fetch privateListeningSetting [use"
            "rListeningControl=nil]";
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134217984;
      __int16 v14 = self;
      uint64_t v10 = "[<MPHomeUserMonitor %p> _loadCurrentAccessoryPrivateListening:] failed to fetch privateListeningSetting [cur"
            "rentAccessory=nil]";
LABEL_8:
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0xCu);
    }
  }

  int v8 = 1;
LABEL_10:
  if (self->_currentAccessoryPrivateListeningCachedValue != v8)
  {
    self->_currentAccessoryPrivateListeningCachedValue = v8;
    id v11 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(HMUser *)self->_user userID];
      int v13 = 134218499;
      __int16 v14 = self;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 2113;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "[<MPHomeUserMonitor %p> _loadCurrentAccessoryPrivateListening:] updating value privateListeningEnabled=%{BOOL}u for userID=%{private}@", (uint8_t *)&v13, 0x1Cu);
    }
    [(MPHomeUserMonitor *)self _notifyPrivateListeningUpdated];
  }
}

- (void)_loadAllowExplicitValue
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v3 = [(HMSettings *)self->_sharedSettings rootGroup];
  BOOL v4 = _findSettingWithKeyPath(v3);

  id v5 = (__CFString *)objc_opt_class();
  if (_isValidSetting(v4, v5))
  {
    id v6 = [v4 value];
    int v7 = [v6 BOOLValue];
  }
  else
  {
    int v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134217984;
      int v13 = self;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "<MPHomeUserMonitor %p> _loadAllowExplicitValueFromSetting: failed [invalid setting]", (uint8_t *)&v12, 0xCu);
    }

    int v7 = 1;
  }
  if (self->_allowExplicitCachedValue != v7)
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(HMUser *)self->_user userID];
      BOOL allowExplicitCachedValue = self->_allowExplicitCachedValue;
      int v12 = 134218755;
      int v13 = self;
      __int16 v14 = 2113;
      __int16 v15 = v10;
      __int16 v16 = 1024;
      BOOL v17 = allowExplicitCachedValue;
      __int16 v18 = 1024;
      int v19 = v7;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "<MPHomeUserMonitor %p> _loadAllowExplicitValueFromSetting: userID=%{private}@ cachedValue=%{BOOL}u newValue=%{BOOL}u", (uint8_t *)&v12, 0x22u);
    }
    self->_BOOL allowExplicitCachedValue = v7;
    [(MPHomeUserMonitor *)self _notifyAllowExplicitUpdated];
  }
}

- (id)_homeAccesssoryWithRouteID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHomeManager *)self->_homeManager currentHome];
  id v6 = v5;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__51845;
  int v19 = __Block_byref_object_dispose__51846;
  id v20 = 0;
  if (!v5) {
    goto LABEL_3;
  }
  int v7 = [v5 accessories];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__MPHomeUserMonitor__homeAccesssoryWithRouteID___block_invoke;
  v12[3] = &unk_1E57F8FB0;
  id v13 = v4;
  __int16 v14 = &v15;
  [v7 enumerateObjectsUsingBlock:v12];

  int v8 = (void *)v16[5];
  if (!v8)
  {
LABEL_3:
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v22 = self;
      __int16 v23 = 2114;
      id v24 = v4;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> homeAccesssoryWithRouteID: No homeAccessory with routeID=%{public}@", buf, 0x16u);
    }

    int v8 = (void *)v16[5];
  }
  id v10 = v8;
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __48__MPHomeUserMonitor__homeAccesssoryWithRouteID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  int v8 = *(void **)(a1 + 32);
  id v10 = v7;
  uint64_t v9 = [v7 deviceIdentifier];
  LODWORD(v8) = [v8 isEqualToString:v9];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)privateListeningEnabledForGroupWithRouteIDs:(id)a3
{
  id v4 = a3;
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = __Block_byref_object_copy__51845;
    int v12 = __Block_byref_object_dispose__51846;
    id v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__MPHomeUserMonitor_privateListeningEnabledForGroupWithRouteIDs___block_invoke;
    v7[3] = &unk_1E57F8FD8;
    v7[4] = self;
    void v7[5] = &v8;
    [v4 enumerateObjectsUsingBlock:v7];
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __65__MPHomeUserMonitor_privateListeningEnabledForGroupWithRouteIDs___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  int v3 = [*(id *)(a1 + 32) hasAccessoryWithRouteID:v11];
  id v4 = v11;
  if (v3)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v6 = NSNumber;
    if (v5)
    {
      if ([v5 BOOLValue]) {
        uint64_t v7 = [*(id *)(a1 + 32) privateListeningEnabledForAccessoryWithRouteID:v11];
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = [v6 numberWithInt:v7];
    }
    else
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "privateListeningEnabledForAccessoryWithRouteID:", v11));
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v4 = v11;
  }
}

- (BOOL)privateListeningEnabledForAccessoryWithRouteID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MPHomeUserMonitor_privateListeningEnabledForAccessoryWithRouteID___block_invoke;
  block[3] = &unk_1E57F9F48;
  id v9 = v4;
  uint64_t v10 = self;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)accessQueue;
}

void __68__MPHomeUserMonitor_privateListeningEnabledForAccessoryWithRouteID___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v3 = *(void **)(v2 + 24);
    id v4 = [*(id *)(v2 + 48) currentHome];
    id v5 = [v3 userListeningHistoryUpdateControlForHome:v4];

    if (v5)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      id v6 = [v5 accessories];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      int v19 = __68__MPHomeUserMonitor_privateListeningEnabledForAccessoryWithRouteID___block_invoke_17;
      id v20 = &unk_1E57F8FB0;
      uint64_t v7 = *(id *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 48);
      v21 = v7;
      uint64_t v22 = v8;
      [v6 enumerateObjectsUsingBlock:&v17];

      id v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        id v11 = objc_msgSend(*(id *)(v10 + 24), "userID", v17, v18, v19, v20);
        uint64_t v12 = *(void *)(a1 + 32);
        int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 134218755;
        uint64_t v24 = v10;
        __int16 v25 = 2113;
        v26 = v11;
        __int16 v27 = 2114;
        uint64_t v28 = v12;
        __int16 v29 = 1024;
        int v30 = v13;
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "<MPHomeUserMonitor %p> privateListeningEnabledForAccessoryWithRouteID userID=%{private}@ routeID=%{public}@ privateListening=%{BOOL}u", buf, 0x26u);
      }
      uint64_t v14 = v21;
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "[<MPHomeUserMonitor %p> privateListeningEnabledForAccessoryWithRouteID:] failed to fetch privateListeningSetting [userListeningControl=nil]", buf, 0xCu);
      }
    }
  }
  else
  {
    id v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "[<MPHomeUserMonitor %p> privateListeningEnabledForAccessoryWithRouteID:] failed to fetch privateListeningSetting [routeID=nil]", buf, 0xCu);
    }
  }
}

void __68__MPHomeUserMonitor_privateListeningEnabledForAccessoryWithRouteID___block_invoke_17(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 deviceIdentifier];
  LODWORD(v6) = [v6 isEqualToString:v7];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)hasAccessoryWithRouteID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHomeManager *)self->_homeManager currentHome];
  id v6 = v5;
  if (v5)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v7 = [v5 accessories];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__MPHomeUserMonitor_hasAccessoryWithRouteID___block_invoke;
    v10[3] = &unk_1E57F8FB0;
    id v11 = v4;
    uint64_t v12 = &v13;
    [v7 enumerateObjectsUsingBlock:v10];

    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __45__MPHomeUserMonitor_hasAccessoryWithRouteID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 deviceIdentifier];
  LODWORD(v6) = [v6 isEqualToString:v7];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setPrivateListeningEnabledForAccessoryWithRouteID:(id)a3 enabled:(BOOL)a4
{
  id v6 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MPHomeUserMonitor_setPrivateListeningEnabledForAccessoryWithRouteID_enabled___block_invoke;
  block[3] = &unk_1E57F8F88;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

void __79__MPHomeUserMonitor_setPrivateListeningEnabledForAccessoryWithRouteID_enabled___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(v3 + 24) userID];
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = *(unsigned __int8 *)(a1 + 48);
    int v8 = 134218755;
    uint64_t v9 = v3;
    __int16 v10 = 2113;
    BOOL v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    __int16 v14 = 1024;
    int v15 = v6;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "<MPHomeUserMonitor %p> Setting privateListening for accessory. userID=%{private}@ routID=%{public}@ enabled=%{BOOL}u", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) _homeAccesssoryWithRouteID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateUserListeningHistoryControlForAccessory:v7 enable:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setPrivateListeningEnabledForCurrentAccessory:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__MPHomeUserMonitor_setPrivateListeningEnabledForCurrentAccessory___block_invoke;
  v4[3] = &unk_1E57F9E08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(accessQueue, v4);
}

void __67__MPHomeUserMonitor_setPrivateListeningEnabledForCurrentAccessory___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v1 + 57) != *(unsigned __int8 *)(a1 + 40))
  {
    uint64_t v3 = [*(id *)(v1 + 48) currentAccessory];
    if (v3)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 57) = *(unsigned char *)(a1 + 40);
      id v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = [*(id *)(v5 + 24) userID];
        int v7 = *(unsigned __int8 *)(a1 + 40);
        int v11 = 134218499;
        uint64_t v12 = v5;
        __int16 v13 = 2113;
        __int16 v14 = v6;
        __int16 v15 = 1024;
        int v16 = v7;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "<MPHomeUserMonitor %p> Setting privateListening for currentAccessory. userID=%{private}@ enabled=%{BOOL}u", (uint8_t *)&v11, 0x1Cu);
      }
      [*(id *)(a1 + 32) _updateUserListeningHistoryControlForAccessory:v3 enable:*(unsigned __int8 *)(a1 + 40)];
    }
    else
    {
      int v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = *(unsigned __int8 *)(a1 + 40);
        int v11 = 134218240;
        uint64_t v12 = v9;
        __int16 v13 = 1024;
        LODWORD(v14) = v10;
        _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "[<MPHomeUserMonitor %p> setPrivateListeningEnabledForCurrentAccessory:] failed to set enabled=%{BOOL}u [currentAccessory=nil]", (uint8_t *)&v11, 0x12u);
      }
    }
  }
}

- (BOOL)isPrivateListeningEnabledForCurrentAccessory
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__MPHomeUserMonitor_isPrivateListeningEnabledForCurrentAccessory__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__MPHomeUserMonitor_isPrivateListeningEnabledForCurrentAccessory__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 57);
  return result;
}

- (void)setExplicitSettingEnabled:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke;
  v4[3] = &unk_1E57F9E08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(accessQueue, v4);
}

void __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 56) != v2)
  {
    *(unsigned char *)(v1 + 56) = v2;
    id v4 = [*(id *)(*(void *)(a1 + 32) + 40) rootGroup];
    BOOL v5 = _findSettingWithKeyPath(v4);

    uint64_t v6 = (__CFString *)objc_opt_class();
    if (_isValidSetting(v5, v6))
    {
      int v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke_2;
      v8[3] = &unk_1E57F8F60;
      void v8[4] = *(void *)(a1 + 32);
      char v9 = *(unsigned char *)(a1 + 40);
      [v5 updateValue:v7 completionHandler:v8];
    }
  }
}

void __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      __int16 v13 = @"root.music.allowExplicitContent";
      __int16 v14 = 1024;
      int v15 = v6;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "<MPHomeUserMonitor %p> HMSetting \"%{public}@\" failed to update. shouldAllowExplicit=%{BOOOL}u error=%{public}@", buf, 0x26u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke_14;
    block[3] = &unk_1E57F9EA8;
    void block[4] = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAllowExplicitValue];
}

- (BOOL)isExplicitSettingEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MPHomeUserMonitor_isExplicitSettingEnabled__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__MPHomeUserMonitor_isExplicitSettingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56);
  return result;
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  [(MPHomeUserMonitor *)self _loadAllowExplicitValue];

  [(MPHomeUserMonitor *)self _loadCurrentAccessoryPrivateListening];
}

- (MPHomeUserMonitor)initWithUser:(id)a3 homeManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MPHomeUserMonitor;
  uint64_t v8 = [(MPHomeUserMonitor *)&v19 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaplayer.MPHomeUserMonitor.accessQueue", 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mediaplayer.MPHomeUserMonitor.calloutQueue", MEMORY[0x1E4F14430]);
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v11;

    __int16 v13 = v8->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__MPHomeUserMonitor_initWithUser_homeManager___block_invoke;
    block[3] = &unk_1E57FA038;
    __int16 v16 = v8;
    id v17 = v7;
    id v18 = v6;
    dispatch_sync(v13, block);
  }
  return v8;
}

uint64_t __46__MPHomeUserMonitor_initWithUser_homeManager___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 48));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 24);
  id v4 = [*(id *)(v2 + 48) currentHome];
  uint64_t v5 = [v3 userSettingsForHome:v4];
  uint64_t v6 = [v5 settings];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setDelegate:");
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(void **)(v9 + 24);
  dispatch_queue_t v11 = [*(id *)(v9 + 48) currentHome];
  __int16 v12 = [v10 userSettingsForHome:v11];
  uint64_t v13 = [v12 privateSettings];
  uint64_t v14 = *(void *)(a1 + 32);
  int v15 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v13;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  __int16 v16 = *(void **)(a1 + 32);

  return [v16 _update];
}

+ (void)setPrivateListeningEnabledForCurrentUserAndAccessory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = +[MPHomeUserMonitor monitorForCurrentUser];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 setPrivateListeningEnabledForCurrentAccessory:v3];
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "[MPHomeUserMonitor setPrivateListeningEnabledForCurrentUserAndAccessory:] failed to set privateListeningEnabled=%{BOOL}u [monitorForCurrentUser=nil]", (uint8_t *)v7, 8u);
    }
  }
}

+ (BOOL)isPrivateListeningEnabledForCurrentUserAndAccessory
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MPHomeUserMonitor monitorForCurrentUser];
  BOOL v3 = v2;
  if (v2)
  {
    char v4 = [v2 isPrivateListeningEnabledForCurrentAccessory];
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = 1;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "MPHomeUserMonitor.isPrivateListeningEnabledForCurrentUserAndAccessory returning fallback value=%{BOOL}u [monitorForCurrentUser=nil]", (uint8_t *)v7, 8u);
    }

    char v4 = 1;
  }

  return v4;
}

+ (void)setExplicitSettingEnabledForCurrentUser:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v4 = +[MPHomeUserMonitor monitorForCurrentUser];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 setExplicitSettingEnabled:v3];
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "[MPHomeUserMonitor setExplicitSettingEnabledForCurrentUser:] failed to set explicitSettingEnabled=%{BOOL}u [monitorForCurrentUser=nil]", (uint8_t *)v7, 8u);
    }
  }
}

+ (BOOL)isExplicitSettingEnabledForCurrentUser
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MPHomeUserMonitor monitorForCurrentUser];
  BOOL v3 = v2;
  if (v2)
  {
    char v4 = [v2 isExplicitSettingEnabled];
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = 1;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "MPHomeUserMonitor.isExplicitSettingEnabledForCurrentUser returning fallback value=%{BOOL}u [monitorForCurrentUser=nil]", (uint8_t *)v7, 8u);
    }

    char v4 = 1;
  }

  return v4;
}

+ (MPHomeUserMonitor)monitorForCurrentUser
{
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
  {
    uint64_t v2 = +[MPHomeManagerObserver sharedObserver];
    BOOL v3 = [v2 monitorForCurrentUser];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (MPHomeUserMonitor *)v3;
}

+ (MPHomeUserMonitor)userMonitorWithUserIdentity:(id)a3 fromUserIdentityStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
  {
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  }
  uint64_t v9 = v7;
  int v10 = [v7 getPropertiesForUserIdentity:v5 error:0];
  dispatch_queue_t v11 = v10;
  if (!v10)
  {
    uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "[MPHomeUserMonitor userMonitorWithUserIdentity:fromUserIdentityStore:] identityProperties=nil", buf, 2u);
    }
    goto LABEL_14;
  }
  __int16 v12 = [v10 homeUserIdentifiers];
  uint64_t v13 = +[MPHomeUserMonitor userMonitorWithHomeIdentifiers:v12];

  if (!v13)
  {
    int v15 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "[MPHomeUserMonitor userMonitorWithUserIdentity:fromUserIdentityStore:] userMonitor=nil", v17, 2u);
    }

    uint64_t v14 = 0;
LABEL_14:
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  uint64_t v14 = v13;
  uint64_t v8 = v14;
LABEL_15:

LABEL_16:

  return (MPHomeUserMonitor *)v8;
}

+ (MPHomeUserMonitor)userMonitorWithHomeIdentifiers:(id)a3
{
  id v3 = a3;
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
  {
    char v4 = +[MPHomeManagerObserver sharedObserver];
    id v5 = [v4 userMonitorWithHomeIdentifiers:v3];
  }
  else
  {
    id v5 = 0;
  }

  return (MPHomeUserMonitor *)v5;
}

+ (MPHomeUserMonitor)userMonitorWithHomeIdentifier:(id)a3
{
  id v3 = a3;
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
  {
    char v4 = +[MPHomeManagerObserver sharedObserver];
    id v5 = [v4 userMonitorWithHomeIdentifier:v3];
  }
  else
  {
    id v5 = 0;
  }

  return (MPHomeUserMonitor *)v5;
}

@end