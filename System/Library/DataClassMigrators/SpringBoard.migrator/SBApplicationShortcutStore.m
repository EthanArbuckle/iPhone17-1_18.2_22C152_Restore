@interface SBApplicationShortcutStore
+ (void)clearStore;
- (BOOL)_stateLock_truncateIfNeeded:(id)a3;
- (NSArray)applicationShortcutItems;
- (NSArray)languages;
- (NSString)bundleIdentifier;
- (SBApplicationShortcutStore)initWithBundleIdentifier:(id)a3;
- (id)_applicationShortcutItemsFromPlistArray:(id)a3;
- (id)_plistArrayFromApplicationShortcutItems:(id)a3;
- (id)description;
- (unint64_t)version;
- (void)_saveQueue_save;
- (void)_stateLock_loadFromStoreIfNeeded;
- (void)_stateLock_markDirty;
- (void)invalidateCache;
- (void)saveSynchronously;
- (void)setApplicationShortcutItems:(id)a3 withLanguages:(id)a4 version:(unint64_t)a5;
- (void)truncateIfNecessary;
@end

@implementation SBApplicationShortcutStore

+ (void)clearStore
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = +[FBSApplicationDataStore applicationsWithAvailableStores];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = +[FBSApplicationDataStore storeForApplication:*(void *)(*((void *)&v8 + 1) + 8 * (void)v6)];
        [v7 removeObjectForKey:@"SBApplicationShortcutItems"];

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (SBApplicationShortcutStore)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBApplicationShortcutStore;
  uint64_t v5 = [(SBApplicationShortcutStore *)&v15 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;

    uint64_t v8 = +[FBSApplicationDataStore storeForApplication:v5->_bundleIdentifier];
    dataStore = v5->_dataStore;
    v5->_dataStore = (FBSApplicationDataStore *)v8;

    long long v10 = (NSLock *)objc_alloc_init((Class)NSLock);
    stateLock = v5->_stateLock;
    v5->_stateLock = v10;

    [(NSLock *)v5->_stateLock setName:@"com.apple.springboard.sbapplicationshortcutstore"];
    uint64_t Serial = BSDispatchQueueCreateSerial();
    saveQueue = v5->_saveQueue;
    v5->_saveQueue = (OS_dispatch_queue *)Serial;
  }
  return v5;
}

- (id)description
{
  id v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [(SBApplicationShortcutStore *)self bundleIdentifier];
  id v5 = [v3 appendObject:v4 withName:@"bundleIdentifier"];

  if (self->_isLoaded)
  {
    id v6 = [v3 appendObject:self->_cachedLanguages withName:@"languages"];
    id v7 = [v3 appendObject:self->_cachedApplicationShortcutItems withName:@"applicationShortcutItems"];
    id v8 = [v3 appendInteger:self->_cachedVersion withName:@"version"];
    id v9 = [v3 appendBool:self->_isDirty withName:@"isDirty"];
  }
  long long v10 = [v3 build];

  return v10;
}

- (NSArray)applicationShortcutItems
{
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  id v3 = [(NSArray *)self->_cachedApplicationShortcutItems copy];
  [(NSLock *)self->_stateLock unlock];

  return (NSArray *)v3;
}

- (NSArray)languages
{
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  id v3 = [(NSArray *)self->_cachedLanguages copy];
  [(NSLock *)self->_stateLock unlock];

  return (NSArray *)v3;
}

- (unint64_t)version
{
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  unint64_t cachedVersion = self->_cachedVersion;
  [(NSLock *)self->_stateLock unlock];
  return cachedVersion;
}

- (void)setApplicationShortcutItems:(id)a3 withLanguages:(id)a4 version:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  if (self->_isLoaded) {
    goto LABEL_7;
  }
  long long v11 = SBLogAppShortcuts();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10DF8(self);
  }

  if (self->_isLoaded)
  {
LABEL_7:
    if (![v9 isEqualToArray:self->_cachedApplicationShortcutItems]
      || ![v10 isEqualToArray:self->_cachedLanguages]
      || self->_cachedVersion != a5)
    {
      objc_storeStrong((id *)&self->_cachedApplicationShortcutItems, a3);
      objc_storeStrong((id *)&self->_cachedLanguages, a4);
      self->_unint64_t cachedVersion = a5;
      v12 = SBLogAppShortcuts();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(SBApplicationShortcutStore *)self bundleIdentifier];
        int v14 = 138543362;
        objc_super v15 = v13;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating app shortcut store...", (uint8_t *)&v14, 0xCu);
      }
      [(SBApplicationShortcutStore *)self _stateLock_markDirty];
    }
  }
  [(NSLock *)self->_stateLock unlock];
}

- (void)invalidateCache
{
  [(NSLock *)self->_stateLock lock];
  self->_isLoaded = 0;
  cachedApplicationShortcutItems = self->_cachedApplicationShortcutItems;
  self->_cachedApplicationShortcutItems = 0;

  cachedLanguages = self->_cachedLanguages;
  self->_cachedLanguages = 0;

  self->_unint64_t cachedVersion = 0;
  stateLock = self->_stateLock;

  [(NSLock *)stateLock unlock];
}

- (void)saveSynchronously
{
  saveQueue = self->_saveQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D79C;
  block[3] = &unk_197B0;
  block[4] = self;
  dispatch_sync(saveQueue, block);
}

- (void)truncateIfNecessary
{
  [(NSLock *)self->_stateLock lock];
  [(SBApplicationShortcutStore *)self _stateLock_loadFromStoreIfNeeded];
  if ([(SBApplicationShortcutStore *)self _stateLock_truncateIfNeeded:@"truncateIfNeeded"])
  {
    [(SBApplicationShortcutStore *)self _stateLock_markDirty];
  }
  stateLock = self->_stateLock;

  [(NSLock *)stateLock unlock];
}

- (id)_applicationShortcutItemsFromPlistArray:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  BSSerializeCFValueToXPCDictionaryWithKey();

  id v5 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)_plistArrayFromApplicationShortcutItems:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

  id v5 = BSDeserializeCFValueFromXPCDictionaryWithKey();

  return v5;
}

- (void)_stateLock_loadFromStoreIfNeeded
{
  if (!self->_isLoaded)
  {
    id v3 = [(FBSApplicationDataStore *)self->_dataStore safeArchivedObjectForKey:@"SBApplicationShortcutItems" ofType:objc_opt_class()];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 objectForKeyedSubscript:@"applicationShortcutItems"];
      id v5 = [v3 objectForKeyedSubscript:@"languages"];
      id v6 = [v3 objectForKeyedSubscript:@"version"];
      id v7 = [v6 unsignedIntegerValue];
    }
    else
    {
      id v4 = v3;
      id v7 = 0;
      id v5 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [(SBApplicationShortcutStore *)self _applicationShortcutItemsFromPlistArray:v4];
      if (v5)
      {
        id v9 = v5;
      }
      else
      {
        id v9 = +[NSLocale preferredLanguages];
      }
      v12 = v9;
      self->_isLoaded = 1;
    }
    else
    {
      id v10 = SBLogAppShortcuts();
      long long v11 = v10;
      if (v3)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10E88(self);
        }

        id v7 = 0;
        v12 = 0;
        id v8 = 0;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v13 = [(SBApplicationShortcutStore *)self bundleIdentifier];
          int v18 = 138543362;
          v19 = v13;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%{public}@: No saved data in store", (uint8_t *)&v18, 0xCu);
        }
        id v7 = 0;
        v12 = 0;
        id v8 = 0;
        self->_isLoaded = 1;
      }
    }
    cachedApplicationShortcutItems = self->_cachedApplicationShortcutItems;
    self->_cachedApplicationShortcutItems = v8;
    objc_super v15 = v8;

    cachedLanguages = self->_cachedLanguages;
    self->_cachedLanguages = v12;
    v17 = v12;

    self->_unint64_t cachedVersion = (unint64_t)v7;
  }
}

- (void)_stateLock_markDirty
{
  if (!self->_isDirty)
  {
    self->_isDirty = 1;
    id v3 = SBLogAppShortcuts();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(SBApplicationShortcutStore *)self bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: Marking as dirty...", buf, 0xCu);
    }
    saveQueue = self->_saveQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_DCC8;
    block[3] = &unk_197B0;
    block[4] = self;
    dispatch_async(saveQueue, block);
  }
}

- (void)_saveQueue_save
{
  [(NSLock *)self->_stateLock lock];
  id v4 = SBLogAppShortcuts();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SBApplicationShortcutStore *)self bundleIdentifier];
    int v17 = 138543362;
    int v18 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving...", (uint8_t *)&v17, 0xCu);
  }
  if (self->_isDirty && self->_isLoaded)
  {
    id v6 = NSStringFromSelector(a2);
    [(SBApplicationShortcutStore *)self _stateLock_truncateIfNeeded:v6];

    id v7 = [(SBApplicationShortcutStore *)self _plistArrayFromApplicationShortcutItems:self->_cachedApplicationShortcutItems];
    if ([v7 count])
    {
      v23[1] = @"version";
      v24[0] = v7;
      v23[0] = @"applicationShortcutItems";
      id v8 = +[NSNumber numberWithUnsignedInteger:self->_cachedVersion];
      v24[1] = v8;
      id v9 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

      cachedLanguages = self->_cachedLanguages;
      if (cachedLanguages)
      {
        CFStringRef v21 = @"languages";
        v22 = cachedLanguages;
        long long v11 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        uint64_t v12 = objc_msgSend(v9, "bs_dictionaryByAddingEntriesFromDictionary:", v11);

        id v9 = (void *)v12;
      }
      v13 = SBLogAppShortcuts();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = [(SBApplicationShortcutStore *)self bundleIdentifier];
        NSUInteger v15 = [(NSArray *)self->_cachedApplicationShortcutItems count];
        int v17 = 138543618;
        int v18 = v14;
        __int16 v19 = 2048;
        NSUInteger v20 = v15;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%{public}@: Committing app shortcut store w/ %lu shortcuts", (uint8_t *)&v17, 0x16u);
      }
      [(FBSApplicationDataStore *)self->_dataStore setArchivedObject:v9 forKey:@"SBApplicationShortcutItems"];
      +[FBSApplicationDataStore synchronize];
    }
    self->_isDirty = 0;
  }
  else
  {
    id v7 = SBLogAppShortcuts();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(SBApplicationShortcutStore *)self bundleIdentifier];
      int v17 = 138543362;
      int v18 = v16;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring save request because not dirty", (uint8_t *)&v17, 0xCu);
    }
  }

  [(NSLock *)self->_stateLock unlock];
}

- (BOOL)_stateLock_truncateIfNeeded:(id)a3
{
  id v4 = a3;
  if (!self->_isLoaded)
  {
    p_super = SBLogAppShortcuts();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(SBApplicationShortcutStore *)self bundleIdentifier];
      int v19 = 138543362;
      NSUInteger v20 = v10;
      _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore cannot truncate; data isn't loaded.",
        (uint8_t *)&v19,
        0xCu);
    }
    goto LABEL_15;
  }
  unint64_t v5 = [(NSArray *)self->_cachedApplicationShortcutItems count];
  p_super = SBLogAppShortcuts();
  BOOL v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (v5 <= 0xA)
  {
    if (v7)
    {
      id v8 = [(SBApplicationShortcutStore *)self bundleIdentifier];
      NSUInteger v9 = [(NSArray *)self->_cachedApplicationShortcutItems count];
      int v19 = 138543874;
      NSUInteger v20 = v8;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2048;
      NSUInteger v24 = v9;
      _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore doesn't need truncation (truncation reason: %@); there are %ld applicatio"
        "n shortcut items.",
        (uint8_t *)&v19,
        0x20u);
    }
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_19;
  }
  if (v7)
  {
    long long v11 = [(SBApplicationShortcutStore *)self bundleIdentifier];
    NSUInteger v12 = [(NSArray *)self->_cachedApplicationShortcutItems count];
    int v19 = 138543874;
    NSUInteger v20 = v11;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2048;
    NSUInteger v24 = v12;
    _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@: SBApplicationShortcutStore needs truncation (truncation reason: %@); there are %ld application shortcut items.",
      (uint8_t *)&v19,
      0x20u);
  }
  if (qword_1DC50 != -1) {
    dispatch_once(&qword_1DC50, &stru_197D0);
  }
  if (byte_1DC48)
  {
    v13 = +[NSUserDefaults standardUserDefaults];
    unsigned int v14 = [v13 BOOLForKey:@"SBSuppressAppShortcutTruncation"];

    if (v14)
    {
      p_super = SBLogAppShortcuts();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        sub_10FD4(self, p_super);
      }
      goto LABEL_15;
    }
  }
  v16 = SBLogAppShortcuts();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10F18(self, v5, v16);
  }

  -[NSArray subarrayWithRange:](self->_cachedApplicationShortcutItems, "subarrayWithRange:", 0, 10);
  int v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  p_super = &self->_cachedApplicationShortcutItems->super;
  self->_cachedApplicationShortcutItems = v17;
  BOOL v15 = 1;
LABEL_19:

  return v15;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_cachedLanguages, 0);
  objc_storeStrong((id *)&self->_cachedApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);

  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end