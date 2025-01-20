@interface MCHoldingTankManifest
+ (id)sharedManifest;
- (BOOL)_adjustManifestForDevice:(unint64_t)a3 withIdentifier:(id)a4 addingIdentifier:(BOOL)a5 outError:(id *)a6;
- (BOOL)addPurgatoryProfileData:(id)a3 identifier:(id)a4 targetDevice:(unint64_t)a5 outError:(id *)a6;
- (MCHoldingTankManifest)init;
- (id)_manifestForDevice:(unint64_t)a3 createIfNil:(BOOL)a4;
- (id)_pathToHoldingTankDirectoryForDevice:(unint64_t)a3;
- (id)_pathToHoldingTankManifestForDevice:(unint64_t)a3;
- (id)_profileDataFileNameForProfileIdentifier:(id)a3;
- (id)pathToHoldingTankProfileDataForIdentifier:(id)a3 targetDevice:(unint64_t)a4 createDirectory:(BOOL)a5;
- (id)uninstalledProfileDataWithIdentifier:(id)a3 targetDevice:(unint64_t)a4;
- (id)uninstalledProfileIdentifiersForDevice:(unint64_t)a3;
- (id)uninstalledProfileWithIdentifier:(id)a3 targetDevice:(unint64_t)a4;
- (void)_createDirectory:(id)a3 withIntermediateDirectories:(BOOL)a4;
- (void)dealloc;
- (void)removeProfileDataWithIdentifier:(id)a3 fromHoldingTankForDevice:(unint64_t)a4;
@end

@implementation MCHoldingTankManifest

- (MCHoldingTankManifest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MCHoldingTankManifest;
  v2 = [(MCHoldingTankManifest *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.managedconfiguration.MCHoldingTankManifest._syncQueue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_suspend((dispatch_object_t)self->_syncQueue);
  v3.receiver = self;
  v3.super_class = (Class)MCHoldingTankManifest;
  [(MCHoldingTankManifest *)&v3 dealloc];
}

+ (id)sharedManifest
{
  if (sharedManifest_once_0 != -1) {
    dispatch_once(&sharedManifest_once_0, &__block_literal_global_24);
  }
  v2 = (void *)sharedManifest_obj_0;
  return v2;
}

uint64_t __39__MCHoldingTankManifest_sharedManifest__block_invoke()
{
  sharedManifest_obj_0 = objc_alloc_init(MCHoldingTankManifest);
  return MEMORY[0x1F41817F8]();
}

- (id)_profileDataFileNameForProfileIdentifier:(id)a3
{
  return (id)[a3 MCHashedFilenameWithExtension:@"pdata"];
}

- (id)_pathToHoldingTankDirectoryForDevice:(unint64_t)a3
{
  v4 = MCSystemProfileStorageDirectory();
  v5 = +[MCProfile stringForDeviceType:a3];
  objc_super v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

- (id)_pathToHoldingTankManifestForDevice:(unint64_t)a3
{
  objc_super v3 = [(MCHoldingTankManifest *)self _pathToHoldingTankDirectoryForDevice:a3];
  v4 = MCHoldingTankManifestName();
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)pathToHoldingTankProfileDataForIdentifier:(id)a3 targetDevice:(unint64_t)a4 createDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(MCHoldingTankManifest *)self _pathToHoldingTankDirectoryForDevice:a4];
  if (v5) {
    [(MCHoldingTankManifest *)self _createDirectory:v9 withIntermediateDirectories:1];
  }
  v10 = [(MCHoldingTankManifest *)self _profileDataFileNameForProfileIdentifier:v8];
  v11 = [v9 stringByAppendingPathComponent:v10];

  return v11;
}

- (void)_createDirectory:(id)a3 withIntermediateDirectories:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v6 fileExistsAtPath:v5 isDirectory:0] & 1) == 0)
  {
    id v9 = 0;
    [v6 createDirectoryAtPath:v5 withIntermediateDirectories:v4 attributes:0 error:&v9];
    id v7 = v9;
    if (v7)
    {
      id v8 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v11 = v5;
        __int16 v12 = 2114;
        id v13 = v7;
        _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (id)_manifestForDevice:(unint64_t)a3 createIfNil:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = +[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:");
  id v8 = [(MCHoldingTankManifest *)self _pathToHoldingTankManifestForDevice:a3];
  if (!self->_universalManifest)
  {
    id v9 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    universalManifest = self->_universalManifest;
    self->_universalManifest = v9;
  }
  id v23 = 0;
  id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8 options:0 error:&v23];
  id v12 = v23;
  if (v12)
  {
    if (!v4)
    {
      id v13 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v25 = v8;
        __int16 v26 = 2114;
        id v27 = v12;
        _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_DEFAULT, "Failed to pull manifest data from path (this might be normal): %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }

  id v22 = 0;
  uint64_t v14 = [MEMORY[0x1E4F28F98] MCSafePropertyListWithData:v11 options:1 format:0 error:&v22];
  id v15 = v22;
  [(NSMutableDictionary *)self->_universalManifest setObject:v14 forKeyedSubscript:v7];

  if (v15)
  {
    v16 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v15;
      _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_ERROR, "Failed to serialize manifest data with error: %{public}@", buf, 0xCu);
    }
  }
  v17 = [(NSMutableDictionary *)self->_universalManifest objectForKeyedSubscript:v7];

  if (!v17 && v4)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    [(NSMutableDictionary *)self->_universalManifest setObject:v18 forKeyedSubscript:v7];

    v19 = [(NSMutableDictionary *)self->_universalManifest objectForKeyedSubscript:v7];
    [v19 MCWriteToBinaryFile:v8];
  }
  v20 = [(NSMutableDictionary *)self->_universalManifest objectForKeyedSubscript:v7];

  return v20;
}

- (id)uninstalledProfileIdentifiersForDevice:(unint64_t)a3
{
  objc_super v3 = [(MCHoldingTankManifest *)self _manifestForDevice:a3 createIfNil:0];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 allKeys];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)uninstalledProfileWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  BOOL v4 = [(MCHoldingTankManifest *)self uninstalledProfileDataWithIdentifier:a3 targetDevice:a4];
  if (v4)
  {
    id v5 = +[MCProfile profileWithData:v4 outError:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)uninstalledProfileDataWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(MCHoldingTankManifest *)self pathToHoldingTankProfileDataForIdentifier:a3 targetDevice:a4 createDirectory:0];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v11 = 0;
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:0 error:&v11];
    id v8 = v11;
    if (v8)
    {
      id v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v13 = v4;
        __int16 v14 = 2114;
        id v15 = v8;
        _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_ERROR, "Failed to read profile data from path: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)addPurgatoryProfileData:(id)a3 identifier:(id)a4 targetDevice:(unint64_t)a5 outError:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  id v12 = [(MCHoldingTankManifest *)self pathToHoldingTankProfileDataForIdentifier:v10 targetDevice:a5 createDirectory:1];
  id v18 = 0;
  char v13 = [v11 writeToFile:v12 options:0x20000000 error:&v18];

  id v14 = v18;
  if (v13)
  {
    BOOL v15 = [(MCHoldingTankManifest *)self _adjustManifestForDevice:a5 withIdentifier:v10 addingIdentifier:1 outError:a6];
  }
  else
  {
    uint64_t v16 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v20 = v10;
      __int16 v21 = 2114;
      id v22 = v12;
      __int16 v23 = 2114;
      id v24 = v14;
      _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_ERROR, "Failed to add profile data with identifier: %{public}@ to path: %{public}@ with error: %{public}@", buf, 0x20u);
    }
    MCCheckSystemGroupContainerFileReadability(0, 0);
    BOOL v15 = 0;
    if (a6) {
      *a6 = v14;
    }
  }

  return v15;
}

- (void)removeProfileDataWithIdentifier:(id)a3 fromHoldingTankForDevice:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MCHoldingTankManifest *)self pathToHoldingTankProfileDataForIdentifier:v6 targetDevice:a4 createDirectory:1];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  [v8 removeItemAtPath:v7 error:&v11];
  id v9 = v11;

  if (v9)
  {
    id v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v13 = v6;
      __int16 v14 = 2114;
      BOOL v15 = v7;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl(&dword_1A13F0000, v10, OS_LOG_TYPE_ERROR, "Failed to remove profile data with identifier: %{public}@ from path: %{public}@ with error: %{public}@", buf, 0x20u);
    }
  }
  [(MCHoldingTankManifest *)self _adjustManifestForDevice:a4 withIdentifier:v6 addingIdentifier:0 outError:0];
}

- (BOOL)_adjustManifestForDevice:(unint64_t)a3 withIdentifier:(id)a4 addingIdentifier:(BOOL)a5 outError:(id *)a6
{
  id v10 = a4;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MCHoldingTankManifest__adjustManifestForDevice_withIdentifier_addingIdentifier_outError___block_invoke;
  block[3] = &unk_1E5A67FD0;
  block[4] = self;
  unint64_t v18 = a3;
  BOOL v19 = a5;
  id v12 = v10;
  id v16 = v12;
  id v17 = &v20;
  dispatch_sync(syncQueue, block);
  if (a6) {
    *a6 = (id) v21[5];
  }
  BOOL v13 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __91__MCHoldingTankManifest__adjustManifestForDevice_withIdentifier_addingIdentifier_outError___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _manifestForDevice:*(void *)(a1 + 56) createIfNil:*(unsigned __int8 *)(a1 + 64)];
  objc_super v3 = v2;
  if (v2)
  {
    [v2 removeObjectForKey:*(void *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 64))
    {
      BOOL v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
      [v3 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    id v5 = [*(id *)(a1 + 32) _pathToHoldingTankManifestForDevice:*(void *)(a1 + 56)];
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v7 + 40);
    [v3 writeToURL:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v8 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        id v12 = v5;
        __int16 v13 = 2114;
        uint64_t v14 = v9;
        _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Failed to write manifest to path: %{public}@ with error: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_universalManifest, 0);
}

@end