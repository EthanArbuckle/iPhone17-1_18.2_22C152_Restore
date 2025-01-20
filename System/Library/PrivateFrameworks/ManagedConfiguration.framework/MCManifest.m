@interface MCManifest
+ (id)installedProfileDataWithIdentifier:(id)a3;
+ (id)installedProfileWithIdentifier:(id)a3;
+ (id)installedSystemProfileDataWithIdentifier:(id)a3;
+ (id)installedSystemProfileWithIdentifier:(id)a3;
+ (id)installedUserProfileDataWithIdentifier:(id)a3;
+ (id)installedUserProfileWithIdentifier:(id)a3;
+ (id)sharedManifest;
+ (void)_setSystemManifestPath:(id)a3 userManifestPath:(id)a4;
- (MCManifest)init;
- (id)_systemManifest;
- (id)_userManifest;
- (id)allInstalledPayloadsOfClass:(Class)a3;
- (id)allInstalledProfileIdentifiers;
- (id)allInstalledSystemProfileIdentifiers;
- (id)allInstalledUserProfileIdentifiers;
- (id)allProfileIdentifiersInstalledNonInteractivelyWithFilterFlags:(int)a3;
- (id)identifiersOfProfilesWithFilterFlags:(int)a3;
- (id)installedMDMProfile;
- (id)installedProfileDataWithIdentifier:(id)a3;
- (id)installedProfileWithIdentifier:(id)a3;
- (id)installedProfileWithIdentifier:(id)a3 filterFlags:(int)a4;
- (id)installedSystemProfileWithIdentifier:(id)a3;
- (id)installedUserProfileWithIdentifier:(id)a3;
- (id)systemManifest;
- (id)userManifest;
- (void)_adjustManifestIdentifier:(id)a3 isUserInstall:(BOOL)a4 flag:(int)a5 addingIdentifier:(BOOL)a6;
- (void)_setSystemManifest:(id)a3 userManifest:(id)a4;
- (void)addIdentifierToSystemManifest:(id)a3 flag:(int)a4;
- (void)addIdentifierToUserManifest:(id)a3 flag:(int)a4;
- (void)dealloc;
- (void)invalidateCache;
- (void)removeIdentifierFromSystemManifest:(id)a3 flag:(int)a4;
- (void)removeIdentifierFromUserManifest:(id)a3 flag:(int)a4;
@end

@implementation MCManifest

+ (void)_setSystemManifestPath:(id)a3 userManifestPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)__systemManifestFilePath;
  __systemManifestFilePath = (uint64_t)v5;
  id v9 = v5;

  v8 = (void *)__userManifestFilePath;
  __userManifestFilePath = (uint64_t)v6;
}

+ (id)sharedManifest
{
  if (sharedManifest_once != -1) {
    dispatch_once(&sharedManifest_once, &__block_literal_global_7);
  }
  v2 = (void *)sharedManifest_obj;
  return v2;
}

uint64_t __28__MCManifest_sharedManifest__block_invoke()
{
  sharedManifest_obj = objc_alloc_init(MCManifest);
  return MEMORY[0x1F41817F8]();
}

+ (id)installedProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 installedSystemProfileDataWithIdentifier:v4];
  if (v5
    || ([a1 installedUserProfileDataWithIdentifier:v4],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = +[MCProfile profileWithData:v5 outError:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)installedSystemProfileWithIdentifier:(id)a3
{
  v3 = [a1 installedSystemProfileDataWithIdentifier:a3];
  if (v3)
  {
    id v4 = +[MCProfile profileWithData:v3 outError:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)installedUserProfileWithIdentifier:(id)a3
{
  v3 = [a1 installedUserProfileDataWithIdentifier:a3];
  if (v3)
  {
    id v4 = +[MCProfile profileWithData:v3 outError:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)installedProfileWithIdentifier:(id)a3
{
  return +[MCManifest installedProfileWithIdentifier:a3];
}

- (id)installedProfileWithIdentifier:(id)a3 filterFlags:(int)a4
{
  char v4 = a4;
  id v5 = a3;
  if ((v4 & 0x18) == 0)
  {
    uint64_t v6 = +[MCManifest installedProfileWithIdentifier:v5];
    goto LABEL_7;
  }
  if ((v4 & 8) == 0)
  {
    uint64_t v6 = +[MCManifest installedSystemProfileWithIdentifier:v5];
LABEL_7:
    v7 = (void *)v6;
    goto LABEL_8;
  }
  if ((v4 & 0x10) == 0)
  {
    uint64_t v6 = +[MCManifest installedUserProfileWithIdentifier:v5];
    goto LABEL_7;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)installedSystemProfileWithIdentifier:(id)a3
{
  return +[MCManifest installedSystemProfileWithIdentifier:a3];
}

- (id)installedUserProfileWithIdentifier:(id)a3
{
  return +[MCManifest installedUserProfileWithIdentifier:a3];
}

- (id)installedMDMProfile
{
  v3 = [MEMORY[0x1E4F73170] sharedConfiguration];
  char v4 = [v3 memberQueueManagingProfileIdentifier];

  if (v4)
  {
    id v5 = [(MCManifest *)self installedProfileWithIdentifier:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)installedProfileDataWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 installedSystemProfileDataWithIdentifier:v4];
  if (!v5)
  {
    id v5 = [a1 installedUserProfileDataWithIdentifier:v4];
  }

  return v5;
}

+ (id)installedSystemProfileDataWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = MCSystemProfileStorageDirectory();
  id v5 = [v3 MCHashedFilenameWithExtension:@"stub"];

  uint64_t v6 = [v4 stringByAppendingPathComponent:v5];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v5) = [v7 fileExistsAtPath:v6];

  if (v5)
  {
    v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)installedUserProfileDataWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = MCUserProfileStorageDirectory();
  id v5 = [v3 MCHashedFilenameWithExtension:@"stub"];

  uint64_t v6 = [v4 stringByAppendingPathComponent:v5];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v5) = [v7 fileExistsAtPath:v6];

  if (v5)
  {
    v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)installedProfileDataWithIdentifier:(id)a3
{
  return +[MCManifest installedProfileDataWithIdentifier:a3];
}

- (MCManifest)init
{
  v12.receiver = self;
  v12.super_class = (Class)MCManifest;
  v2 = [(MCManifest *)&v12 init];
  if (v2)
  {
    id v3 = (void *)__systemManifestFilePath;
    if (!__systemManifestFilePath)
    {
      uint64_t v4 = MCSystemManifestPath();
      id v5 = (void *)__systemManifestFilePath;
      __systemManifestFilePath = v4;

      id v3 = (void *)__systemManifestFilePath;
    }
    objc_storeStrong((id *)&v2->_systemFilePath, v3);
    uint64_t v6 = (void *)__userManifestFilePath;
    if (!__userManifestFilePath)
    {
      uint64_t v7 = MCUserManifestPath();
      v8 = (void *)__userManifestFilePath;
      __userManifestFilePath = v7;

      uint64_t v6 = (void *)__userManifestFilePath;
    }
    objc_storeStrong((id *)&v2->_userFilePath, v6);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.managedconfiguration.MCManifest._syncQueue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.ManagedConfiguration.profileListChanged", 0);
  dispatch_suspend((dispatch_object_t)self->_syncQueue);
  v4.receiver = self;
  v4.super_class = (Class)MCManifest;
  [(MCManifest *)&v4 dealloc];
}

- (id)_systemManifest
{
  systemManifest = self->_systemManifest;
  if (!systemManifest)
  {
    objc_super v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:self->_systemFilePath];
    id v5 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v4 options:1 format:0 error:0];
    uint64_t v6 = self->_systemManifest;
    self->_systemManifest = v5;

    uint64_t v7 = self->_systemManifest;
    if (!v7)
    {
      v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
      dispatch_queue_t v9 = self->_systemManifest;
      self->_systemManifest = v8;

      uint64_t v7 = self->_systemManifest;
    }
    _populateMissingManifestDictionaries(v7);

    systemManifest = self->_systemManifest;
  }
  return systemManifest;
}

- (id)_userManifest
{
  userManifest = self->_userManifest;
  if (!userManifest)
  {
    objc_super v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:self->_userFilePath];
    id v5 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v4 options:1 format:0 error:0];
    uint64_t v6 = self->_userManifest;
    self->_userManifest = v5;

    uint64_t v7 = self->_userManifest;
    if (!v7)
    {
      v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
      dispatch_queue_t v9 = self->_userManifest;
      self->_userManifest = v8;

      uint64_t v7 = self->_userManifest;
    }
    _populateMissingManifestDictionaries(v7);

    userManifest = self->_userManifest;
  }
  return userManifest;
}

- (id)systemManifest
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__MCManifest_systemManifest__block_invoke;
  v5[3] = &unk_1E5A65D90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __28__MCManifest_systemManifest__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _systemManifest];
  return MEMORY[0x1F41817F8]();
}

- (id)userManifest
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__MCManifest_userManifest__block_invoke;
  v5[3] = &unk_1E5A65D90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __26__MCManifest_userManifest__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _userManifest];
  return MEMORY[0x1F41817F8]();
}

- (void)_setSystemManifest:(id)a3 userManifest:(id)a4
{
  id v8 = a4;
  uint64_t v6 = (void *)[a3 MCMutableDeepCopy];
  _populateMissingManifestDictionaries(v6);
  if (([(NSMutableDictionary *)self->_systemManifest isEqualToDictionary:v6] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_systemManifest, v6);
    [(NSMutableDictionary *)self->_systemManifest MCWriteToBinaryFile:self->_systemFilePath];
  }
  uint64_t v7 = (void *)[v8 MCMutableDeepCopy];
  _populateMissingManifestDictionaries(v7);
  if (([(NSMutableDictionary *)self->_userManifest isEqualToDictionary:v7] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userManifest, v7);
    [(NSMutableDictionary *)self->_userManifest MCWriteToBinaryFile:self->_userFilePath];
  }
}

- (id)identifiersOfProfilesWithFilterFlags:(int)a3
{
  char v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(MCManifest *)self systemManifest];
  uint64_t v7 = [(MCManifest *)self userManifest];
  if (v3)
  {
    if ((v3 & 8) == 0)
    {
      id v8 = [v6 objectForKey:@"OrderedProfiles"];
      [v5 addObjectsFromArray:v8];
    }
    if ((v3 & 0x10) == 0)
    {
      dispatch_queue_t v9 = [v7 objectForKey:@"OrderedProfiles"];
      [v5 addObjectsFromArray:v9];
    }
  }
  if ((v3 & 2) != 0)
  {
    if ((v3 & 8) == 0)
    {
      v10 = [v6 objectForKey:@"HiddenProfiles"];
      [v5 addObjectsFromArray:v10];
    }
    if ((v3 & 0x10) == 0)
    {
      id v11 = [v7 objectForKey:@"HiddenProfiles"];
      [v5 addObjectsFromArray:v11];
    }
  }

  return v5;
}

- (id)allInstalledProfileIdentifiers
{
  return [(MCManifest *)self identifiersOfProfilesWithFilterFlags:3];
}

- (id)allInstalledUserProfileIdentifiers
{
  return [(MCManifest *)self identifiersOfProfilesWithFilterFlags:9];
}

- (id)allInstalledSystemProfileIdentifiers
{
  return [(MCManifest *)self identifiersOfProfilesWithFilterFlags:19];
}

- (id)allProfileIdentifiersInstalledNonInteractivelyWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v19 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = +[MCManifest sharedManifest];
  id v5 = [v4 identifiersOfProfilesWithFilterFlags:v3];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x1A6232D90]();
        objc_super v12 = +[MCManifest sharedManifest];
        v13 = [v12 installedProfileWithIdentifier:v10];

        if (v13)
        {
          v14 = [v13 installOptions];
          v15 = [v14 objectForKey:@"isInstalledInteractively"];
          char v16 = [v15 BOOLValue];

          if ((v16 & 1) == 0) {
            [v19 addObject:v10];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  v17 = (void *)[v19 copy];
  return v17;
}

- (id)allInstalledPayloadsOfClass:(Class)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  v18 = self;
  [(MCManifest *)self allInstalledProfileIdentifiers];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x1A6232D90]();
        uint64_t v8 = [(MCManifest *)v18 installedProfileWithIdentifier:v6];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        dispatch_queue_t v9 = [v8 payloads];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * j);
              if (objc_opt_isKindOfClass()) {
                [v4 addObject:v14];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v11);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  return v4;
}

- (void)addIdentifierToSystemManifest:(id)a3 flag:(int)a4
{
}

- (void)addIdentifierToUserManifest:(id)a3 flag:(int)a4
{
}

- (void)removeIdentifierFromSystemManifest:(id)a3 flag:(int)a4
{
}

- (void)removeIdentifierFromUserManifest:(id)a3 flag:(int)a4
{
}

- (void)_adjustManifestIdentifier:(id)a3 isUserInstall:(BOOL)a4 flag:(int)a5 addingIdentifier:(BOOL)a6
{
  id v10 = a3;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MCManifest__adjustManifestIdentifier_isUserInstall_flag_addingIdentifier___block_invoke;
  block[3] = &unk_1E5A67988;
  BOOL v16 = a4;
  int v15 = a5;
  BOOL v17 = a6;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_sync(syncQueue, block);
}

void __76__MCManifest__adjustManifestIdentifier_isUserInstall_flag_addingIdentifier___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 52);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _userManifest];
  }
  else {
  objc_super v4 = [v3 _systemManifest];
  }
  id v21 = (id)[v4 MCMutableDeepCopy];

  int v5 = *(_DWORD *)(a1 + 48);
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v7 = [v21 objectForKeyedSubscript:@"OrderedProfiles"];
    uint64_t v8 = [v6 setWithArray:v7];

    uint64_t v9 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 53)) {
      [v8 addObject:v9];
    }
    else {
      [v8 removeObject:v9];
    }
    id v10 = [v8 allObjects];
    [v21 setObject:v10 forKeyedSubscript:@"OrderedProfiles"];

    int v5 = *(_DWORD *)(a1 + 48);
  }
  if ((v5 & 2) != 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
    id v12 = [v21 objectForKeyedSubscript:@"HiddenProfiles"];
    v13 = [v11 setWithArray:v12];

    uint64_t v14 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 53)) {
      [v13 addObject:v14];
    }
    else {
      [v13 removeObject:v14];
    }
    int v15 = [v13 allObjects];
    [v21 setObject:v15 forKeyedSubscript:@"HiddenProfiles"];
  }
  BOOL v16 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 52))
  {
    BOOL v17 = [v16 _systemManifest];
    v18 = v16;
    id v19 = v17;
    id v20 = v21;
  }
  else
  {
    BOOL v17 = [v16 _userManifest];
    v18 = v16;
    id v19 = v21;
    id v20 = v17;
  }
  [v18 _setSystemManifest:v19 userManifest:v20];
}

- (void)invalidateCache
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__MCManifest_invalidateCache__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

void __29__MCManifest_invalidateCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_userManifest, 0);
  objc_storeStrong((id *)&self->_systemManifest, 0);
  objc_storeStrong((id *)&self->_userFilePath, 0);
  objc_storeStrong((id *)&self->_systemFilePath, 0);
}

@end