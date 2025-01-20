@interface MPHomeManagerObserver
+ (id)sharedObserver;
- (BOOL)hasCurrentAccessory;
- (BOOL)hasCurrentHome;
- (BOOL)hasCurrentUser;
- (BOOL)isSoundCheckEnabled;
- (BOOL)setupDidComplete;
- (HMAccessory)currentAccessory;
- (HMHome)currentHome;
- (HMUser)currentUser;
- (MPHomeManagerObserver)init;
- (MPHomeManagerObserverDelegate)delegate;
- (MPHomeUserMonitor)monitorForCurrentUser;
- (id)_userMonitorWithHomeIdentifiers:(id)a3;
- (id)homeAccesssoryWithRouteID:(id)a3;
- (id)userMonitorWithHomeIdentifier:(id)a3;
- (id)userMonitorWithHomeIdentifiers:(id)a3;
- (void)_currentHomeDidChange;
- (void)_currentUserDidChange;
- (void)_soundCheckDidChange;
- (void)_update;
- (void)_updateAsyncOnQueue;
- (void)_updateSoundCheck;
- (void)_usersDidChange;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3;
- (void)homeDidUpdateSoundCheck:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidRemoveCurrentAccessory:(id)a3;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)homeManagerDidUpdatePrimaryHome:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSoundCheckEnabled:(BOOL)a3;
@end

@implementation MPHomeManagerObserver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userMonitorMap, 0);
  objc_storeStrong((id *)&self->_homeUsers, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (MPHomeManagerObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPHomeManagerObserverDelegate *)WeakRetained;
}

- (void)homeManagerDidRemoveCurrentAccessory:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManagerDidRemoveCurrentAccessory:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218498;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManager:%{public}@ didRemoveHome:%{public}@", (uint8_t *)&v9, 0x20u);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218498;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManager:%{public}@ didAddHome:%{public}@", (uint8_t *)&v9, 0x20u);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)homeManagerDidUpdatePrimaryHome:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManagerDidUpdatePrimaryHome:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218242;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManagerDidUpdateHomes:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  int v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
  id v7 = v6;
  os_signpost_id_t homekitInitSignpostId = self->_homekitInitSignpostId;
  if (homekitInitSignpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1952E8000, v7, OS_SIGNPOST_INTERVAL_END, homekitInitSignpostId, "homekitInitialization", (const char *)&unk_1956A9243, (uint8_t *)&v9, 2u);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218498;
    int v9 = self;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManager:%{public}@ didUpdateStatus:%lu", (uint8_t *)&v8, 0x20u);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManager:%{public}@ homeManagerDidUpdateCurrentHome:", (uint8_t *)&v6, 0x16u);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134217984;
    int v6 = self;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeDelegatePrivate homeDidUpdateAccessControlForCurrentUser", (uint8_t *)&v5, 0xCu);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)homeDidUpdateSoundCheck:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v8 = self;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeDelegatePrivate homeDidUpdateSoundCheck", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MPHomeManagerObserver_homeDidUpdateSoundCheck___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __49__MPHomeManagerObserver_homeDidUpdateSoundCheck___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSoundCheck];
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeDelegate home:didRemoveUser:", (uint8_t *)&v6, 0xCu);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeDelegate home:didAddUser:", (uint8_t *)&v6, 0xCu);
  }

  [(MPHomeManagerObserver *)self _updateAsyncOnQueue];
}

- (void)_soundCheckDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    BOOL soundCheckCachedValue = self->_soundCheckCachedValue;
    calloutQueue = self->_calloutQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__MPHomeManagerObserver__soundCheckDidChange__block_invoke;
    v6[3] = &unk_1E57F9E08;
    v6[4] = self;
    BOOL v7 = soundCheckCachedValue;
    dispatch_async(calloutQueue, v6);
  }
}

void __45__MPHomeManagerObserver__soundCheckDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained soundCheckSettingDidUpdate:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_usersDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MPHomeManagerObserver__usersDidChange__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

void __40__MPHomeManagerObserver__usersDidChange__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> homeUsersDidChange:", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained homeUsersDidChange];
}

- (void)_currentUserDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__MPHomeManagerObserver__currentUserDidChange__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

void __46__MPHomeManagerObserver__currentUserDidChange__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> currentUserDidChange:", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained currentUserDidChange];
}

- (void)_currentHomeDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__MPHomeManagerObserver__currentHomeDidChange__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

void __46__MPHomeManagerObserver__currentHomeDidChange__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> currentHomeDidChange:", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained currentHomeDidChange];
}

- (void)_updateAsyncOnQueue
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MPHomeManagerObserver__updateAsyncOnQueue__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __44__MPHomeManagerObserver__updateAsyncOnQueue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_update
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v3 = [(HMHomeManager *)self->_homeManager currentHome];
  p_currentHome = &self->_currentHome;
  int v5 = self->_currentHome;
  if (v5 == v3)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(HMHome *)v5 isEqual:v3];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        currentHome = self->_currentHome;
        *(_DWORD *)buf = 134218496;
        v26 = self;
        __int16 v27 = 2048;
        v28 = currentHome;
        __int16 v29 = 2048;
        v30 = (HMUser *)v3;
        _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> currentHomeDidChange from %p to %p", buf, 0x20u);
      }

      [(HMHome *)self->_currentHome setDelegate:0];
      objc_storeStrong((id *)&self->_currentHome, v3);
      [(HMHome *)self->_currentHome setDelegate:self];
      [(MPHomeManagerObserver *)self _currentHomeDidChange];
    }
  }
  uint64_t v10 = [(HMHome *)self->_currentHome currentUser];
  id v11 = self->_currentUser;
  if (v11 == v10)
  {
  }
  else
  {
    __int16 v12 = v11;
    char v13 = [(HMUser *)v11 isEqual:v10];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        currentUser = self->_currentUser;
        *(_DWORD *)buf = 134218496;
        v26 = self;
        __int16 v27 = 2048;
        v28 = currentUser;
        __int16 v29 = 2048;
        v30 = v10;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> currentUserDidChange from %p to %p", buf, 0x20u);
      }

      objc_storeStrong((id *)&self->_currentUser, v10);
      [(MPHomeManagerObserver *)self _currentUserDidChange];
    }
  }
  v16 = *p_currentHome;
  if (*p_currentHome)
  {
    self->_setupDidComplete = 1;
    v17 = (void *)MEMORY[0x1E4F1CA80];
    v18 = [(HMHome *)v16 users];
    v19 = [v17 setWithArray:v18];

    [v19 addObject:self->_currentUser];
    if ([v19 count])
    {
      if ([(NSSet *)self->_homeUsers isEqualToSet:v19])
      {
LABEL_20:
        [(MPHomeManagerObserver *)self _updateSoundCheck];

        goto LABEL_21;
      }
      os_log_t v20 = (os_log_t)[(NSSet *)self->_homeUsers mutableCopy];
      [v20 minusSet:v19];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __32__MPHomeManagerObserver__update__block_invoke;
      v24[3] = &unk_1E57EF260;
      v24[4] = self;
      [v20 enumerateObjectsUsingBlock:v24];
      v21 = (void *)[v19 mutableCopy];
      [v21 minusSet:self->_homeUsers];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __32__MPHomeManagerObserver__update__block_invoke_12;
      v23[3] = &unk_1E57EF260;
      v23[4] = self;
      [v21 enumerateObjectsUsingBlock:v23];
      objc_storeStrong((id *)&self->_homeUsers, v19);
      [(MPHomeManagerObserver *)self _usersDidChange];
    }
    else
    {
      os_log_t v20 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = self->_currentHome;
        *(_DWORD *)buf = 134218240;
        v26 = self;
        __int16 v27 = 2048;
        v28 = v22;
        _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> currentUsers.count=0 in currentHome=%p", buf, 0x16u);
      }
    }

    goto LABEL_20;
  }
LABEL_21:
}

void __32__MPHomeManagerObserver__update__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 userID];
    char v7 = [v3 uniqueIdentifier];
    int v10 = 134218499;
    uint64_t v11 = v5;
    __int16 v12 = 2113;
    char v13 = v6;
    __int16 v14 = 2113;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> Removing MPHomeUserMonitor userID=%{private}@ uniqueIdentifier=%{private}@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v9 = [v3 uniqueIdentifier];
  [v8 removeObjectForKey:v9];
}

void __32__MPHomeManagerObserver__update__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [[MPHomeUserMonitor alloc] initWithUser:v3 homeManager:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    char v7 = [v3 userID];
    uint64_t v8 = [v3 uniqueIdentifier];
    int v11 = 134218755;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    __int16 v14 = v4;
    __int16 v15 = 2113;
    uint64_t v16 = v7;
    __int16 v17 = 2113;
    v18 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> Adding <MPHomeUserMonitor %p> userID=%{private}@ uniqueIdentifier=%{private}@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 56);
  int v10 = [v3 uniqueIdentifier];
  [v9 setObject:v4 forKeyedSubscript:v10];
}

- (void)_updateSoundCheck
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  currentHome = self->_currentHome;
  if (currentHome)
  {
    uint64_t v4 = [(HMHome *)currentHome soundCheckEnabled];
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218240;
      uint64_t v12 = self;
      __int16 v13 = 1024;
      BOOL v14 = 0;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> _updateSoundCheck: _currentHome=nil using fallback value=%{BOOL}u", (uint8_t *)&v11, 0x12u);
    }

    uint64_t v4 = 0;
  }
  uint64_t v6 = +[MPPlaybackUserDefaults standardUserDefaults];
  int v7 = [v6 soundCheckEnabled];

  if (v4 != v7)
  {
    uint64_t v8 = +[MPPlaybackUserDefaults standardUserDefaults];
    [v8 setSoundCheckEnabled:v4];
  }
  if (self->_soundCheckCachedValue != v4)
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL soundCheckCachedValue = self->_soundCheckCachedValue;
      int v11 = 134218496;
      uint64_t v12 = self;
      __int16 v13 = 1024;
      BOOL v14 = soundCheckCachedValue;
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> _updateSoundCheck: cachedValue=%{BOOL}u currentValue=%{BOOL}u", (uint8_t *)&v11, 0x18u);
    }

    self->_BOOL soundCheckCachedValue = v4;
    [(MPHomeManagerObserver *)self _soundCheckDidChange];
  }
}

- (id)_userMonitorWithHomeIdentifiers:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  userMonitorMap = self->_userMonitorMap;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__MPHomeManagerObserver__userMonitorWithHomeIdentifiers___block_invoke;
  v11[3] = &unk_1E57EF238;
  id v12 = v4;
  id v6 = v4;
  int v7 = [(NSMutableDictionary *)userMonitorMap msv_firstWhere:v11];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 second];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __57__MPHomeManagerObserver__userMonitorWithHomeIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)homeAccesssoryWithRouteID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHomeManager *)self->_homeManager currentHome];
  id v6 = v5;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10504;
  uint64_t v19 = __Block_byref_object_dispose__10505;
  id v20 = 0;
  if (!v5) {
    goto LABEL_3;
  }
  int v7 = [v5 accessories];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__MPHomeManagerObserver_homeAccesssoryWithRouteID___block_invoke;
  v12[3] = &unk_1E57F8FB0;
  id v13 = v4;
  BOOL v14 = &v15;
  [v7 enumerateObjectsUsingBlock:v12];

  uint64_t v8 = (void *)v16[5];
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

    uint64_t v8 = (void *)v16[5];
  }
  id v10 = v8;
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __51__MPHomeManagerObserver_homeAccesssoryWithRouteID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v10 = v7;
  uint64_t v9 = [v7 deviceIdentifier];
  LODWORD(v8) = [v8 isEqualToString:v9];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)userMonitorWithHomeIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v13 = 0x3032000000;
    BOOL v14 = __Block_byref_object_copy__10504;
    uint64_t v15 = __Block_byref_object_dispose__10505;
    id v16 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MPHomeManagerObserver_userMonitorWithHomeIdentifiers___block_invoke;
    block[3] = &unk_1E57F9F48;
    p_long long buf = &buf;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(accessQueue, block);
    id v6 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> userMonitorWithHomeIdentifiers: returning nil [identifiers.count=0]", (uint8_t *)&buf, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

void __56__MPHomeManagerObserver_userMonitorWithHomeIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _userMonitorWithHomeIdentifiers:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = [*(id *)(a1 + 40) description];
      int v14 = 134218243;
      uint64_t v15 = v6;
      __int16 v16 = 2113;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> userMonitorWithHomeIdentifiers: forcing update [no monitor found] homeIdentifiers=%{private}@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 32) _update];
    uint64_t v8 = [*(id *)(a1 + 32) _userMonitorWithHomeIdentifiers:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      int v11 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v14 = 134218242;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> userMonitorWithHomeIdentifiers: homeUser found after forced update. monitor=%@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (id)userMonitorWithHomeIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[MPHomeManagerObserver userMonitorWithHomeIdentifiers:](self, "userMonitorWithHomeIdentifiers:", v6, v9, v10);

  return v7;
}

- (MPHomeUserMonitor)monitorForCurrentUser
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__10504;
  uint64_t v10 = __Block_byref_object_dispose__10505;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MPHomeManagerObserver_monitorForCurrentUser__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPHomeUserMonitor *)v3;
}

void __46__MPHomeManagerObserver_monitorForCurrentUser__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) currentUser];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = (void *)v3[7];
    id v11 = [v3 currentUser];
    id v5 = [v11 uniqueIdentifier];
    uint64_t v6 = [v4 objectForKeyedSubscript:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> monitorForCurrentUser: currentUser=nil", buf, 0xCu);
    }
  }
}

- (void)setSoundCheckEnabled:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke;
  v4[3] = &unk_1E57F9E08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(accessQueue, v4);
}

uint64_t __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 64) != v2)
  {
    *(unsigned char *)(v1 + 64) = v2;
    uint64_t v3 = *(void *)(result + 32);
    id v4 = *(void **)(v3 + 32);
    LOBYTE(v5) = *(unsigned char *)(result + 40);
    return objc_msgSend(v4, "updateSoundCheckEnabled:completion:", MEMORY[0x1E4F143A8], 3221225472, __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke_2, &unk_1E57F8F60, v3, v5);
  }
  return result;
}

void __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)long long buf = 134218498;
      uint64_t v11 = v5;
      __int16 v12 = 1024;
      int v13 = v6;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> updateSoundCheckEnabled. shouldEnable=%{BOOL}u error=%{public}@", buf, 0x1Cu);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke_4;
    block[3] = &unk_1E57F9EA8;
    block[4] = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSoundCheck];
}

- (BOOL)isSoundCheckEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MPHomeManagerObserver_isSoundCheckEnabled__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__MPHomeManagerObserver_isSoundCheckEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 64);
  return result;
}

- (HMAccessory)currentAccessory
{
  return (HMAccessory *)[(HMHomeManager *)self->_homeManager currentAccessory];
}

- (HMHome)currentHome
{
  return (HMHome *)[(HMHomeManager *)self->_homeManager currentHome];
}

- (HMUser)currentUser
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMHomeManager *)self->_homeManager currentHome];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 currentUser];
    if (v5) {
      goto LABEL_9;
    }
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      uint64_t v10 = self;
      uint64_t v7 = "<MPHomeManagerObserver %p> failed to fetch currentUser [HMHomeManager.currentHome.currentUser=nil]";
LABEL_7:
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      uint64_t v10 = self;
      uint64_t v7 = "<MPHomeManagerObserver %p> failed to fetch currentUser [HMHomeManager.currentHome=nil]";
      goto LABEL_7;
    }
  }

  uint64_t v5 = 0;
LABEL_9:

  return (HMUser *)v5;
}

- (BOOL)hasCurrentAccessory
{
  int v2 = [(MPHomeManagerObserver *)self currentAccessory];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasCurrentHome
{
  int v2 = [(MPHomeManagerObserver *)self currentHome];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasCurrentUser
{
  int v2 = [(MPHomeManagerObserver *)self currentUser];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)setupDidComplete
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MPHomeManagerObserver_setupDidComplete__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__MPHomeManagerObserver_setupDidComplete__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 65);
  return result;
}

- (MPHomeManagerObserver)init
{
  v22.receiver = self;
  v22.super_class = (Class)MPHomeManagerObserver;
  int v2 = [(MPHomeManagerObserver *)&v22 init];
  char v3 = v2;
  if (v2)
  {
    v2->_setupDidComplete = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaplayer.MPHomeManagerObserver.accessQueue", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaplayer.MPHomeManagerObserver.calloutQueue", MEMORY[0x1E4F14430]);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
    v3->_os_signpost_id_t homekitInitSignpostId = os_signpost_id_make_with_pointer(v8, v3);

    char v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
    uint64_t v10 = v9;
    os_signpost_id_t homekitInitSignpostId = v3->_homekitInitSignpostId;
    if (homekitInitSignpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1952E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, homekitInitSignpostId, "homekitInitialization", (const char *)&unk_1956A9243, buf, 2u);
    }

    uint64_t v28 = 0;
    __int16 v29 = &v28;
    uint64_t v30 = 0x2050000000;
    __int16 v12 = (void *)getHMHomeManagerClass_softClass;
    uint64_t v31 = getHMHomeManagerClass_softClass;
    if (!getHMHomeManagerClass_softClass)
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __getHMHomeManagerClass_block_invoke;
      v26 = &unk_1E57FA300;
      __int16 v27 = &v28;
      __getHMHomeManagerClass_block_invoke((uint64_t)buf);
      __int16 v12 = (void *)v29[3];
    }
    int v13 = v12;
    _Block_object_dispose(&v28, 8);
    uint64_t v14 = [[v13 alloc] initWithOptions:24];
    homeManager = v3->_homeManager;
    v3->_homeManager = (HMHomeManager *)v14;

    [(HMHomeManager *)v3->_homeManager setDelegate:v3];
    v3->_BOOL soundCheckCachedValue = 0;
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    userMonitorMap = v3->_userMonitorMap;
    v3->_userMonitorMap = (NSMutableDictionary *)v16;

    uint64_t v18 = v3->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__MPHomeManagerObserver_init__block_invoke;
    block[3] = &unk_1E57F9EA8;
    v21 = v3;
    dispatch_async(v18, block);
  }
  return v3;
}

uint64_t __29__MPHomeManagerObserver_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_10538);
  }
  int v2 = (void *)sharedObserver___sharedObserver;

  return v2;
}

void __39__MPHomeManagerObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(MPHomeManagerObserver);
  uint64_t v1 = (void *)sharedObserver___sharedObserver;
  sharedObserver___sharedObserver = (uint64_t)v0;
}

@end