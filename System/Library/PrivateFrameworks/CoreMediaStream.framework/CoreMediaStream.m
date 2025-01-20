id MSMMCSHashForData(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t vars8;

  v1 = a1;
  v2 = MMCSSignatureGeneratorCreate();
  v3 = v1;
  v4 = [v3 bytes];
  v5 = [v3 length];

  MEMORY[0x1E019E020](v2, v4, v5, 1);
  v6 = MMCSSignatureGeneratorFinish();
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:MEMORY[0x1E019DFF0](v6) freeWhenDone:1];
  return v7;
}

id MSMMCSHashForFileAtPath(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v5 = a1;
  v6 = (void *)[[v4 alloc] initWithContentsOfFile:v5 options:1 error:0];

  if (v6)
  {
    v7 = MSMMCSHashForData(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void MSCoreMediaStreamInitialize(id obj)
{
}

void _commitMasterManifest()
{
  v0 = [(id)__masterManifest objectForKey:@"nextActivityDateByPersonIDKey"];
  uint64_t v1 = [v0 count];

  if (v1)
  {
    v2 = (void *)__masterManifest;
    MSPathPublishMasterManifest();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v3 = MSPathPublishMasterManifest();
    [v4 removeItemAtPath:v3 error:0];
  }
}

id _masterNextActivityDateByPersonID()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v0 = (void *)__masterManifest;
  if (!__masterManifest)
  {
    uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
    v2 = MSPathPublishDir();
    [v1 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];

    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v4 = MSPathPublishMasterManifest();
    int v5 = [v3 fileExistsAtPath:v4];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F28F98];
      v7 = (void *)MEMORY[0x1E4F1C9B8];
      v8 = MSPathPublishMasterManifest();
      v9 = [v7 dataWithContentsOfFile:v8];
      id v18 = 0;
      uint64_t v10 = [v6 propertyListWithData:v9 options:1 format:0 error:&v18];
      id v11 = v18;
      v12 = (void *)__masterManifest;
      __masterManifest = v10;

      if (!__masterManifest && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v11;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to deserialize publisher master manifest: %{public}@", buf, 0xCu);
      }
    }
    v0 = (void *)__masterManifest;
    if (!__masterManifest)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v14 = (void *)__masterManifest;
      __masterManifest = (uint64_t)v13;

      v0 = (void *)__masterManifest;
    }
  }
  id v15 = v0;
  v16 = [v15 objectForKey:@"nextActivityDateByPersonIDKey"];
  if (!v16)
  {
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [v15 setObject:v16 forKey:@"nextActivityDateByPersonIDKey"];
  }

  return v16;
}

void _commitMasterManifest_265()
{
  v0 = [(id)__masterManifest_266 objectForKey:@"nextActivityDateByPersonID"];
  uint64_t v1 = [v0 count];

  if (v1)
  {
    v2 = (void *)__masterManifest_266;
    MSPathSubscribeMasterManifest();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v3 = MSPathSubscribeMasterManifest();
    [v4 removeItemAtPath:v3 error:0];
  }
}

id _masterNextActivityDateByPersonID_292()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v0 = (void *)__masterManifest_266;
  if (!__masterManifest_266)
  {
    uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
    v2 = MSPathSubscribeDir();
    [v1 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];

    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v4 = MSPathSubscribeMasterManifest();
    int v5 = [v3 fileExistsAtPath:v4];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F28F98];
      v7 = (void *)MEMORY[0x1E4F1C9B8];
      v8 = MSPathSubscribeMasterManifest();
      v9 = [v7 dataWithContentsOfFile:v8];
      id v18 = 0;
      uint64_t v10 = [v6 propertyListWithData:v9 options:1 format:0 error:&v18];
      id v11 = v18;
      v12 = (void *)__masterManifest_266;
      __masterManifest_266 = v10;

      if (!__masterManifest_266 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v11;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to deserialize subscriber master manifest: %{public}@", buf, 0xCu);
      }
    }
    v0 = (void *)__masterManifest_266;
    if (!__masterManifest_266)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v14 = (void *)__masterManifest_266;
      __masterManifest_266 = (uint64_t)v13;

      v0 = (void *)__masterManifest_266;
    }
  }
  id v15 = v0;
  v16 = [v15 objectForKey:@"nextActivityDateByPersonID"];
  if (!v16)
  {
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [v15 setObject:v16 forKey:@"nextActivityDateByPersonID"];
  }

  return v16;
}

void sub_1DC447848(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC447924(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC447F90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MSMediaStreamDir()
{
  v0 = MSPlatform();
  uint64_t v1 = [v0 pathMediaStreamDir];

  return v1;
}

id MSPathPublishDir()
{
  if (MSPathPublishDir_once != -1) {
    dispatch_once(&MSPathPublishDir_once, &__block_literal_global_527);
  }
  v0 = (void *)MSPathPublishDir_path;
  return v0;
}

void __MSPathPublishDir_block_invoke()
{
  MSPlatform();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v3 pathMediaStreamDir];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"pub"];
  v2 = (void *)MSPathPublishDir_path;
  MSPathPublishDir_path = v1;
}

id MSPathPublishDirForPersonID(void *a1)
{
  id v1 = a1;
  v2 = MSPathPublishDir();
  id v3 = _sanitizeString(v1);

  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

id _sanitizeString(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 alphanumericCharacterSet];
  id v4 = [v3 invertedSet];
  int v5 = [v2 componentsSeparatedByCharactersInSet:v4];
  v6 = [v5 componentsJoinedByString:@"_"];

  v7 = NSString;
  uint64_t v8 = [v2 hash];

  v9 = [v7 stringWithFormat:@"%@+%lu", v6, v8];

  return v9;
}

id MSPathPublishMasterManifest()
{
  if (MSPathPublishMasterManifest_once != -1) {
    dispatch_once(&MSPathPublishMasterManifest_once, &__block_literal_global_3);
  }
  v0 = (void *)MSPathPublishMasterManifest_path;
  return v0;
}

void __MSPathPublishMasterManifest_block_invoke()
{
  MSPathPublishDir();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"manifest.plist"];
  id v1 = (void *)MSPathPublishMasterManifest_path;
  MSPathPublishMasterManifest_path = v0;
}

id MSPathPublishManifestForPersonID(void *a1)
{
  id v1 = MSPathPublishDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"manifest.plist"];

  return v2;
}

id MSPathPublishQueueForPersonID(void *a1)
{
  id v1 = MSPathPublishDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"queue.sqlite3"];

  return v2;
}

id MSPathPublishDerivativesQueueForPersonID(void *a1)
{
  id v1 = MSPathPublishDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"derivatives.sqlite3"];

  return v2;
}

id MSPathPublishDiscardedQueueForPersonID(void *a1)
{
  id v1 = MSPathPublishDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"quarantine.sqlite3"];

  return v2;
}

id MSPathSubscribeDir()
{
  if (MSPathSubscribeDir_once != -1) {
    dispatch_once(&MSPathSubscribeDir_once, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)MSPathSubscribeDir_path;
  return v0;
}

void __MSPathSubscribeDir_block_invoke()
{
  MSPlatform();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 pathMediaStreamDir];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"sub"];
  id v2 = (void *)MSPathSubscribeDir_path;
  MSPathSubscribeDir_path = v1;
}

id MSPathSubscribeDirForPersonID(void *a1)
{
  id v1 = a1;
  id v2 = MSPathSubscribeDir();
  id v3 = _sanitizeString(v1);

  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

id MSPathSubscribeMasterManifest()
{
  if (MSPathSubscribeMasterManifest_once != -1) {
    dispatch_once(&MSPathSubscribeMasterManifest_once, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)MSPathSubscribeMasterManifest_path;
  return v0;
}

void __MSPathSubscribeMasterManifest_block_invoke()
{
  MSPathSubscribeDir();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"manifest.plist"];
  id v1 = (void *)MSPathSubscribeMasterManifest_path;
  MSPathSubscribeMasterManifest_path = v0;
}

id MSPathSubscriberManifestForPersonID(void *a1)
{
  id v1 = MSPathSubscribeDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"manifest.plist"];

  return v2;
}

id MSPathSubscribeProtocolDirForPersonID(void *a1)
{
  id v1 = MSPathSubscribeDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"protocol"];

  return v2;
}

id MSPathSubscriberRetrievalQueueForPersonID(void *a1)
{
  id v1 = MSPathSubscribeDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"queue.sqlite3"];

  return v2;
}

id MSPathShareDir()
{
  if (MSPathShareDir_once != -1) {
    dispatch_once(&MSPathShareDir_once, &__block_literal_global_27);
  }
  uint64_t v0 = (void *)MSPathShareDir_path;
  return v0;
}

void __MSPathShareDir_block_invoke()
{
  MSPlatform();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 pathMediaStreamDir];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"share"];
  id v2 = (void *)MSPathShareDir_path;
  MSPathShareDir_path = v1;
}

id MSPathShareDirForPersonID(void *a1)
{
  id v1 = a1;
  id v2 = MSPathShareDir();
  id v3 = _sanitizeString(v1);

  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

id MSPathShareManifestForPersonID(void *a1)
{
  id v1 = MSPathShareDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"manifest.plist"];

  return v2;
}

id MSPathDeleteDir()
{
  if (MSPathDeleteDir_once != -1) {
    dispatch_once(&MSPathDeleteDir_once, &__block_literal_global_32);
  }
  uint64_t v0 = (void *)MSPathDeleteDir_path;
  return v0;
}

void __MSPathDeleteDir_block_invoke()
{
  MSPlatform();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 pathMediaStreamDir];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"del"];
  id v2 = (void *)MSPathDeleteDir_path;
  MSPathDeleteDir_path = v1;
}

id MSPathDeleteDirForPersonID(void *a1)
{
  id v1 = a1;
  id v2 = MSPathDeleteDir();
  id v3 = _sanitizeString(v1);

  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

id MSPathDeleteMasterManifest()
{
  if (MSPathDeleteMasterManifest_once != -1) {
    dispatch_once(&MSPathDeleteMasterManifest_once, &__block_literal_global_37);
  }
  uint64_t v0 = (void *)MSPathDeleteMasterManifest_path;
  return v0;
}

void __MSPathDeleteMasterManifest_block_invoke()
{
  MSPathDeleteDir();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"manifest.plist"];
  id v1 = (void *)MSPathDeleteMasterManifest_path;
  MSPathDeleteMasterManifest_path = v0;
}

id MSPathDeleteManifestForPersonID(void *a1)
{
  id v1 = MSPathDeleteDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"manifest.plist"];

  return v2;
}

id MSPathDeleteQueueForPersonID(void *a1)
{
  id v1 = MSPathDeleteDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"queue.sqlite3"];

  return v2;
}

id MSPathMMCSLibraryDir()
{
  if (MSPathMMCSLibraryDir_once != -1) {
    dispatch_once(&MSPathMMCSLibraryDir_once, &__block_literal_global_39);
  }
  uint64_t v0 = (void *)MSPathMMCSLibraryDir_path;
  return v0;
}

void __MSPathMMCSLibraryDir_block_invoke()
{
  MSPlatform();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 pathMediaStreamDir];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"mmcs"];
  id v2 = (void *)MSPathMMCSLibraryDir_path;
  MSPathMMCSLibraryDir_path = v1;
}

id MSPathMMCSMasterManifest()
{
  uint64_t v0 = MSPathMMCSLibraryDir();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"manifest.plist"];

  return v1;
}

id MSPathPublishMMCSLibraryForPersonID(void *a1)
{
  id v1 = a1;
  id v2 = MSPathMMCSLibraryDir();
  id v3 = [v2 stringByAppendingPathComponent:@"pub"];
  id v4 = _sanitizeString(v1);

  int v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

id MSPathSubscribeMMCSLibraryForPersonID(void *a1)
{
  id v1 = a1;
  id v2 = MSPathMMCSLibraryDir();
  id v3 = [v2 stringByAppendingPathComponent:@"sub"];
  id v4 = _sanitizeString(v1);

  int v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

id MSPathConfigDir()
{
  if (MSPathConfigDir_once != -1) {
    dispatch_once(&MSPathConfigDir_once, &__block_literal_global_44);
  }
  uint64_t v0 = (void *)MSPathConfigDir_path;
  return v0;
}

void __MSPathConfigDir_block_invoke()
{
  MSPlatform();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 pathMediaStreamDir];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"config"];
  id v2 = (void *)MSPathConfigDir_path;
  MSPathConfigDir_path = v1;
}

id MSPathConfigDirForPersonID(void *a1)
{
  id v1 = a1;
  id v2 = MSPathConfigDir();
  id v3 = _sanitizeString(v1);

  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

id MSPathServerSideConfigPathForPersonID(void *a1)
{
  id v1 = MSPathConfigDirForPersonID(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"serverconfig.plist"];

  return v2;
}

id MSPathAlbumSharingDir()
{
  if (MSPathAlbumSharingDir_once != -1) {
    dispatch_once(&MSPathAlbumSharingDir_once, &__block_literal_global_52);
  }
  uint64_t v0 = (void *)MSPathAlbumSharingDir_path;
  return v0;
}

void __MSPathAlbumSharingDir_block_invoke()
{
  uint64_t v0 = MSASPlatform();
  uint64_t v1 = [v0 pathAlbumSharingDir];
  id v2 = (void *)MSPathAlbumSharingDir_path;
  MSPathAlbumSharingDir_path = v1;

  if (!MSPathAlbumSharingDir_path)
  {
    MSPlatform();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [v6 pathMediaStreamDir];
    uint64_t v4 = [v3 stringByAppendingPathComponent:@"albumshare"];
    int v5 = (void *)MSPathAlbumSharingDir_path;
    MSPathAlbumSharingDir_path = v4;
  }
}

id MSPathAlbumSharingDaemonPersistentStore()
{
  if (MSPathAlbumSharingDaemonPersistentStore_onceToken != -1) {
    dispatch_once(&MSPathAlbumSharingDaemonPersistentStore_onceToken, &__block_literal_global_57);
  }
  uint64_t v0 = (void *)MSPathAlbumSharingDaemonPersistentStore_path;
  return v0;
}

void __MSPathAlbumSharingDaemonPersistentStore_block_invoke()
{
  MSPathAlbumSharingDir();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"Daemon.sqlite"];
  uint64_t v1 = (void *)MSPathAlbumSharingDaemonPersistentStore_path;
  MSPathAlbumSharingDaemonPersistentStore_path = v0;
}

id MSPathAlbumSharingDirForPersonID(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingDirForPersonID_block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v7 = v1;
  uint64_t v2 = MSPathAlbumSharingDirForPersonID_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&MSPathAlbumSharingDirForPersonID_onceToken, block);
  }
  id v4 = (id)MSPathAlbumSharingDirForPersonID_path;

  return v4;
}

void __MSPathAlbumSharingDirForPersonID_block_invoke(uint64_t a1)
{
  MSPathAlbumSharingDir();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = _sanitizeString(*(void **)(a1 + 32));
  uint64_t v3 = [v5 stringByAppendingPathComponent:v2];
  id v4 = (void *)MSPathAlbumSharingDirForPersonID_path;
  MSPathAlbumSharingDirForPersonID_path = v3;
}

id MSPathAlbumSharingAssetsDirForPersonID(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingAssetsDirForPersonID_block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v7 = v1;
  uint64_t v2 = MSPathAlbumSharingAssetsDirForPersonID_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&MSPathAlbumSharingAssetsDirForPersonID_onceToken, block);
  }
  id v4 = (id)MSPathAlbumSharingAssetsDirForPersonID_path;

  return v4;
}

void __MSPathAlbumSharingAssetsDirForPersonID_block_invoke(uint64_t a1)
{
  id v1 = MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 32));
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"assets"];
  id v3 = (void *)MSPathAlbumSharingAssetsDirForPersonID_path;
  MSPathAlbumSharingAssetsDirForPersonID_path = v2;

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:MSPathAlbumSharingAssetsDirForPersonID_path];

  if ((v5 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 createDirectoryAtPath:MSPathAlbumSharingAssetsDirForPersonID_path withIntermediateDirectories:1 attributes:0 error:0];
  }
}

id MSPathAlbumSharingPersistentStoreForPersonID(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingPersistentStoreForPersonID_block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v7 = v1;
  uint64_t v2 = MSPathAlbumSharingPersistentStoreForPersonID_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&MSPathAlbumSharingPersistentStoreForPersonID_onceToken, block);
  }
  id v4 = (id)MSPathAlbumSharingPersistentStoreForPersonID_path;

  return v4;
}

void __MSPathAlbumSharingPersistentStoreForPersonID_block_invoke(uint64_t a1)
{
  MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"PersonID.sqlite"];
  uint64_t v2 = (void *)MSPathAlbumSharingPersistentStoreForPersonID_path;
  MSPathAlbumSharingPersistentStoreForPersonID_path = v1;
}

id MSPathAlbumSharingPublishMMCSLibraryForPersonID(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingPublishMMCSLibraryForPersonID_block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v7 = v1;
  uint64_t v2 = MSPathAlbumSharingPublishMMCSLibraryForPersonID_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&MSPathAlbumSharingPublishMMCSLibraryForPersonID_onceToken, block);
  }
  id v4 = (id)MSPathAlbumSharingPublishMMCSLibraryForPersonID_path;

  return v4;
}

void __MSPathAlbumSharingPublishMMCSLibraryForPersonID_block_invoke(uint64_t a1)
{
  id v1 = MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 32));
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"mmcs-pub"];
  id v3 = (void *)MSPathAlbumSharingPublishMMCSLibraryForPersonID_path;
  MSPathAlbumSharingPublishMMCSLibraryForPersonID_path = v2;

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:MSPathAlbumSharingPublishMMCSLibraryForPersonID_path];

  if ((v5 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 createDirectoryAtPath:MSPathAlbumSharingPublishMMCSLibraryForPersonID_path withIntermediateDirectories:1 attributes:0 error:0];
  }
}

id MSPathAlbumSharingModelForPersonID(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingModelForPersonID_block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v7 = v1;
  uint64_t v2 = MSPathAlbumSharingModelForPersonID_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&MSPathAlbumSharingModelForPersonID_onceToken, block);
  }
  id v4 = (id)MSPathAlbumSharingModelForPersonID_path;

  return v4;
}

void __MSPathAlbumSharingModelForPersonID_block_invoke(uint64_t a1)
{
  MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"Model.sqlite"];
  uint64_t v2 = (void *)MSPathAlbumSharingModelForPersonID_path;
  MSPathAlbumSharingModelForPersonID_path = v1;
}

id MSPathAlbumSharingSubscribeMMCSLibraryForPersonID(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v7 = v1;
  uint64_t v2 = MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_onceToken, block);
  }
  id v4 = (id)MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_path;

  return v4;
}

void __MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_block_invoke(uint64_t a1)
{
  id v1 = MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 32));
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"mmcs-sub"];
  id v3 = (void *)MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_path;
  MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_path = v2;

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_path];

  if ((v5 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 createDirectoryAtPath:MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_path withIntermediateDirectories:1 attributes:0 error:0];
  }
}

id MSPathPerfDir()
{
  if (MSPathPerfDir_once != -1) {
    dispatch_once(&MSPathPerfDir_once, &__block_literal_global_77);
  }
  uint64_t v0 = (void *)MSPathPerfDir_path;
  return v0;
}

void __MSPathPerfDir_block_invoke()
{
  MSPlatform();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 pathMediaStreamDir];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"perf"];
  uint64_t v2 = (void *)MSPathPerfDir_path;
  MSPathPerfDir_path = v1;
}

id MSPathPerfDB()
{
  if (MSPathPerfDB_onceToken != -1) {
    dispatch_once(&MSPathPerfDB_onceToken, &__block_literal_global_82);
  }
  uint64_t v0 = (void *)MSPathPerfDB_path;
  return v0;
}

void __MSPathPerfDB_block_invoke()
{
  MSPathPerfDir();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"perf.sqlite"];
  uint64_t v1 = (void *)MSPathPerfDB_path;
  MSPathPerfDB_path = v0;
}

void CreateDirectoryAtPathIfNonNil(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v5 = 0;
    char v3 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v5];
    id v4 = v5;

    if ((v3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v7 = v1;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to create directory at %@: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "cannot create directory at nil path", buf, 2u);
  }
}

void MSPathCreateDirectories()
{
  uint64_t v0 = MSPlatform();
  id v1 = [v0 pathMediaStreamDir];
  CreateDirectoryAtPathIfNonNil(v1);

  id v2 = MSPathPublishDir();
  CreateDirectoryAtPathIfNonNil(v2);

  char v3 = MSPathSubscribeDir();
  CreateDirectoryAtPathIfNonNil(v3);

  id v4 = MSPathShareDir();
  CreateDirectoryAtPathIfNonNil(v4);

  id v5 = MSPathMMCSLibraryDir();
  CreateDirectoryAtPathIfNonNil(v5);

  id v6 = MSPathAlbumSharingDir();
  CreateDirectoryAtPathIfNonNil(v6);

  MSPathPerfDir();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  CreateDirectoryAtPathIfNonNil(v7);
}

BOOL _pointerComparisonCallback(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

id MSSHA1HashForFileAtPath(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = open((const char *)[v1 fileSystemRepresentation], 0);
  if (v2 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v1;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The file at %@ could not be opened for hashing.", (uint8_t *)&v6, 0xCu);
    }
    id v4 = 0;
  }
  else
  {
    int v3 = v2;
    id v4 = MSSHA1HashForFileDescriptor(v2);
    close(v3);
  }

  return v4;
}

id MSSHA1HashForFileDescriptor(int a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = malloc_type_malloc(0x3E8uLL, 0xCB57FD6EuLL);
  memset(&v6, 0, sizeof(v6));
  CC_SHA1_Init(&v6);
  lseek(a1, 0, 0);
  while (1)
  {
    unint64_t v3 = read(a1, v2, 0x3E8uLL);
    if (!v3) {
      break;
    }
    if (HIDWORD(v3)) {
      __assert_rtn("MSSHA1HashForFileDescriptor", "MSUtilities.m", 41, "size <= UINT32_MAX");
    }
    CC_SHA1_Update(&v6, v2, v3);
  }
  CC_SHA1_Final(md, &v6);
  free(v2);
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
  return v4;
}

id MSSHA1HashForData(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  unint64_t v2 = [v1 length];
  if (v2 >= 0xFFFFFFFF) {
    __assert_rtn("MSSHA1HashForData", "MSUtilities.m", 54, "length < UINT32_MAX");
  }
  CC_LONG v3 = v2;
  id v4 = v1;
  CC_SHA1_Update(&v7, (const void *)[v4 bytes], v3);
  CC_SHA1_Final(md, &v7);
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];

  return v5;
}

BOOL MSObjectsAreEquivalent(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  id v5 = (void *)v4;
  BOOL v6 = !(v3 | v4) || v3 && v4 && ([(id)v3 isEqual:v4] & 1) != 0;

  return v6;
}

void sub_1DC44B8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1DC44BB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC44BCBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC44BE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC44BF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC44C144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC44C364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC44C4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC44C6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _logRecursiveError()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v0 = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Not logging any more underlying errors.", v0, 2u);
  }
}

id MSPlatform()
{
  uint64_t v0 = (void *)_platform;
  if (!_platform)
  {
    [MEMORY[0x1E4F1CA00] raise:@"MSCoreMediaStreamNotInitializedException" format:@"CoreMediaStream framework has not been initialized before use."];
    uint64_t v0 = (void *)_platform;
  }
  return v0;
}

id MSPURLConnectionProperties()
{
  if (MSPURLConnectionProperties_once != -1) {
    dispatch_once(&MSPURLConnectionProperties_once, &__block_literal_global_837);
  }
  uint64_t v0 = (void *)MSPURLConnectionProperties_dict;
  return v0;
}

void __MSPURLConnectionProperties_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  MSPlatform();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [v4 socketOptions];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F19160], 0);
  unint64_t v3 = (void *)MSPURLConnectionProperties_dict;
  MSPURLConnectionProperties_dict = v2;
}

id MSPMMCSConnectionProperties()
{
  if (MSPMMCSConnectionProperties_once != -1) {
    dispatch_once(&MSPMMCSConnectionProperties_once, &__block_literal_global_7);
  }
  id v0 = (void *)MSPMMCSConnectionProperties_dict;
  return v0;
}

void __MSPMMCSConnectionProperties_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  MSPlatform();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [v4 socketOptions];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F739B8], 0);
  unint64_t v3 = (void *)MSPMMCSConnectionProperties_dict;
  MSPMMCSConnectionProperties_dict = v2;
}

uint64_t _protocolDidReceiveServerSideConfigurationVersionUC(id *a1, uint64_t a2)
{
  return [*a1 _didFindServerSideConfigurationVersion:a2];
}

uint64_t _protocolDidFailAuthenticationUC(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidFailAuthenticationError:a2];
}

uint64_t _protocolDidFinishUC(id *a1, uint64_t a2, uint64_t a3)
{
  return [*a1 _coreProtocolDidFinishUCResults:a2 error:a3];
}

uint64_t _protocolDidReceiveServerSideConfigurationVersion(id *a1, uint64_t a2)
{
  return [*a1 _didFindServerSideConfigurationVersion:a2];
}

uint64_t _protocolDidReceiveRetryAfterDate(id *a1, uint64_t a2)
{
  return [*a1 _didReceiveRetryAfterDate:a2];
}

uint64_t _protocolDidFailAuthentication(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidFailAuthenticationError:a2];
}

uint64_t _protocolDidFinish(id *a1, uint64_t a2, uint64_t a3)
{
  return [*a1 _coreProtocolDidFinishResponse:a2 error:a3];
}

uint64_t _chunkSubscriptionSourceTemporarilyUnavailableCallback(id *a1, uint64_t a2)
{
  return [*a1 _chunkDidFindSubscriptionTemporarilyUnavailableForPersonID:a2];
}

uint64_t _chunkSubscriptionSourceGoneCallback(id *a1, uint64_t a2)
{
  return [*a1 _chunkDidFindSubscriptionGoneForPersonID:a2];
}

uint64_t _chunkEndStreamCallback(id *a1, uint64_t a2, uint64_t a3)
{
  return [*a1 _chunkDidEndStreamForPersonID:a2 ctag:a3];
}

uint64_t _chunkAssetCollectionsCallback(id *a1, uint64_t a2, uint64_t a3)
{
  return [*a1 _chunkDidParseAssetCollections:a3 forPersonID:a2];
}

uint64_t _chunkBeginStreamCallback(id *a1, uint64_t a2, int a3, uint64_t a4)
{
  return [*a1 _chunkDidBeginStreamForPersonID:a2 wasReset:a3 != 0 metadata:a4];
}

uint64_t _didReceiveServerSideConfigurationVersion(id *a1, uint64_t a2)
{
  return [*a1 _didFindServerSideConfigurationVersion:a2];
}

uint64_t _protocolDidReceiveRetryAfterDate_981(id *a1, uint64_t a2)
{
  return [*a1 _didReceiveRetryAfterDate:a2];
}

uint64_t _authenticationFailedCallback(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidFailAuthentication:a2];
}

uint64_t _gotDataChunkCallback(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidGetDataChunk:a2];
}

uint64_t _finishedCallback(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidFinishError:a2];
}

uint64_t _putItemDoneCallback(void *a1, const char *a2)
{
  return objc_msgSend(a1, "_putItemDone:putReceipt:error:", a2);
}

void _putItemProgressCallback(double a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = [a7 MSVerboseDescription];
    int v13 = 138543362;
    v14 = v12;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MMCS reported an error during upload: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v11 = +[MMCSEngine logStringForPutItemState:a5];
    int v13 = 134218498;
    v14 = a3;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2048;
    double v18 = a1;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "MMCS uploading callback for itemID: %llu state: %{public}@ progress: %.2f", (uint8_t *)&v13, 0x20u);
  }
}

void _getItemDoneCallback(void *a1, uint64_t a2, uint64_t a3, const char *a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = [a5 MSVerboseDescription];
    int v14 = 138543362;
    __int16 v15 = v13;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MMCS reported an error: %{public}@", (uint8_t *)&v14, 0xCu);

    if (a4) {
      goto LABEL_4;
    }
LABEL_6:
    id v11 = a1;
    [v11 _getItemDone:a2 path:0 error:a5];
    goto LABEL_7;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v9 = (void *)MEMORY[0x1E4F28CB8];
  id v10 = a1;
  id v11 = [v9 defaultManager];
  v12 = [v11 stringWithFileSystemRepresentation:a4 length:strlen(a4)];
  [v10 _getItemDone:a2 path:v12 error:a5];

LABEL_7:
}

void _getItemProgressCallback(double a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v11 = [a6 MSVerboseDescription];
    int v12 = 138543362;
    int v13 = v11;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MMCS reported an error during download: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v10 = +[MMCSEngine logStringForGetItemState:a5];
    int v12 = 134218498;
    int v13 = a3;
    __int16 v14 = 2114;
    __int16 v15 = v10;
    __int16 v16 = 2048;
    double v17 = a1;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "MMCS downloading callback for itemID: %llu state: %{public}@ progress: %.2f", (uint8_t *)&v12, 0x20u);
  }
}

uint64_t _getFileDescriptorFromItemCallback(void *a1, uint64_t a2, _DWORD *a3, uint64_t *a4)
{
  id v7 = a1;
  uint64_t v8 = v7;
  if (a3) {
    *a3 = [v7 _getFileDescriptorFromItem:a2];
  }
  if (a4)
  {
    *a4 = [v8 _getUTIFromItem:a2];
  }

  return 1;
}

void MSPSPCSendMetadataAsync(void *a1, uint64_t a2, const __CFDictionary *a3, CFArrayRef theArray)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  a1[6] = 0;
  a1[7] = _didFinish;
  a1[8] = _didFailAuthentication;
  a1[10] = _didReceiveRetryAfter;
  a1[9] = _didReceiveServerSideConfigurationVersion_1472;
  uint64_t Count = CFArrayGetCount(theArray);
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Count, MEMORY[0x1E4F1D510]);
  uint64_t v27 = Count;
  if (Count >= 1)
  {
    CFIndex v6 = 0;
    id v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    uint64_t v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    do
    {
      uint64_t v9 = CFDictionaryCreateMutable(v5, 0, v7, v8);
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v6);
      if (CFDictionaryContainsKey(ValueAtIndex, @"fileName"))
      {
        Value = CFDictionaryGetValue(ValueAtIndex, @"fileName");
        CFDictionarySetValue(v9, @"filename", Value);
      }
      if (CFDictionaryContainsKey(ValueAtIndex, @"collId"))
      {
        int v12 = CFDictionaryGetValue(ValueAtIndex, @"collId");
        CFDictionarySetValue(v9, @"assetcollid", v12);
      }
      CFDictionaryRef v13 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"masterAsset");
      _insertMessageAsset(v9, v13);
      if (CFDictionaryContainsKey(ValueAtIndex, @"derivedAssets"))
      {
        theDict = v9;
        CFArrayRef v14 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"derivedAssets");
        uint64_t v15 = CFArrayGetCount(v14);
        __int16 v16 = CFArrayCreateMutable(v5, v15, MEMORY[0x1E4F1D510]);
        if (v15 >= 1)
        {
          for (CFIndex i = 0; i != v15; ++i)
          {
            CFDictionaryRef v18 = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, i);
            uint64_t v19 = CFDictionaryCreateMutable(v5, 0, v7, v8);
            _insertMessageAsset(v19, v18);
            CFArrayAppendValue(v16, v19);
            CFRelease(v19);
          }
        }
        uint64_t v9 = theDict;
        if (CFArrayGetCount(v16)) {
          CFDictionaryAddValue(theDict, @"derivatives", v16);
        }
        CFRelease(v16);
      }
      CFArrayAppendValue(Mutable, v9);
      CFRelease(v9);
      ++v6;
    }
    while (v6 != v27);
  }
  if (!Mutable) {
    __assert_rtn("MSPSPCSendMetadataAsync", "MSPublishStreamsProtocolCore.m", 44, "messageAssetCollectionsArray");
  }
  id v20 = CFDictionaryCreateMutable(v5, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v20) {
    __assert_rtn("MSPSPCSendMetadataAsync", "MSPublishStreamsProtocolCore.m", 47, "messageDict");
  }
  uint64_t v21 = v20;
  CFDictionaryAddValue(v20, @"assets", Mutable);
  CFRelease(Mutable);
  CFErrorRef error = 0;
  CFDataRef v22 = CFPropertyListCreateData(v5, v21, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (v22)
  {
    CFDataRef v23 = v22;
    CFRelease(v21);
    MSSPCStartHTTPTransaction((uint64_t)a1, @"POST", a2, a3, v23, 1, 0);
    CFRelease(v23);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v33 = error;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize metadata: %{public}@", buf, 0xCu);
    }
    if (error) {
      CFRelease(error);
    }
    CFRelease(v21);
    MSSPCStartHTTPTransaction((uint64_t)a1, @"POST", a2, a3, 0, 1, 0);
  }
}

void _insertMessageAsset(__CFDictionary *a1, CFDictionaryRef theDict)
{
  if (CFDictionaryContainsKey(theDict, @"fileHash"))
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, @"fileHash");
    CFStringRef v5 = MSSPCCreateHexStringFromData(Value);
    if (v5)
    {
      CFStringRef v6 = v5;
      CFDictionarySetValue(a1, @"checksum", v5);
      CFRelease(v6);
    }
  }
  if (CFDictionaryContainsKey(theDict, @"type"))
  {
    id v7 = CFDictionaryGetValue(theDict, @"type");
    CFDictionarySetValue(a1, @"type", v7);
  }
  int v8 = CFDictionaryContainsKey(theDict, @"protocolFileSize");
  uint64_t v9 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (v8)
  {
    CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"protocolFileSize");
    uint64_t valuePtr = 0;
    CFNumberGetValue(v10, kCFNumberLongLongType, &valuePtr);
    CFStringRef v11 = CFStringCreateWithFormat(*v9, 0, @"%llu", valuePtr);
    if (v11)
    {
      CFStringRef v12 = v11;
      CFDictionarySetValue(a1, @"size", v11);
      CFRelease(v12);
    }
  }
  if (CFDictionaryContainsKey(theDict, @"metadata"))
  {
    CFDictionaryRef v13 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"metadata");
    if (CFDictionaryContainsKey(v13, @"fileSize"))
    {
      CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v13, @"fileSize");
      uint64_t valuePtr = 0;
      CFNumberGetValue(v14, kCFNumberLongLongType, &valuePtr);
      CFStringRef v15 = CFStringCreateWithFormat(*v9, 0, @"%llu", valuePtr);
      if (v15)
      {
        CFStringRef v16 = v15;
        CFDictionarySetValue(a1, @"bytecount", v15);
        CFRelease(v16);
      }
    }
    if (CFDictionaryContainsKey(v13, @"pixelWidth"))
    {
      CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(v13, @"pixelWidth");
      uint64_t valuePtr = 0;
      CFNumberGetValue(v17, kCFNumberLongLongType, &valuePtr);
      CFStringRef v18 = CFStringCreateWithFormat(*v9, 0, @"%llu", valuePtr);
      if (v18)
      {
        CFStringRef v19 = v18;
        CFDictionarySetValue(a1, @"width", v18);
        CFRelease(v19);
      }
    }
    if (CFDictionaryContainsKey(v13, @"pixelHeight"))
    {
      CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(v13, @"pixelHeight");
      uint64_t valuePtr = 0;
      CFNumberGetValue(v20, kCFNumberLongLongType, &valuePtr);
      CFStringRef v21 = CFStringCreateWithFormat(*v9, 0, @"%llu", valuePtr);
      if (v21)
      {
        CFStringRef v22 = v21;
        CFDictionarySetValue(a1, @"height", v21);
        CFRelease(v22);
      }
    }
    if (CFDictionaryContainsKey(v13, @"SHA1"))
    {
      CFDataRef v23 = (const __CFData *)CFDictionaryGetValue(v13, @"SHA1");
      CFStringRef v24 = MSSPCCreateHexStringFromData(v23);
      if (v24)
      {
        CFStringRef v25 = v24;
        CFDictionarySetValue(a1, @"sha1", v24);
        CFRelease(v25);
      }
    }
    if (CFDictionaryContainsKey(v13, @"dateContentModified"))
    {
      v26 = CFDictionaryGetValue(v13, @"dateContentModified");
      double v27 = MEMORY[0x1E019DBC0](v26);
      CFStringRef v28 = CFStringCreateWithFormat(0, 0, @"%lf", *(void *)&v27);
      CFDictionarySetValue(a1, @"dateContentModified", v28);
      CFRelease(v28);
    }
    if (CFDictionaryContainsKey(v13, @"dateContentCreated"))
    {
      v29 = CFDictionaryGetValue(v13, @"dateContentCreated");
      double v30 = MEMORY[0x1E019DBC0](v29);
      CFStringRef v31 = CFStringCreateWithFormat(0, 0, @"%lf", *(void *)&v30);
      CFDictionarySetValue(a1, @"dateContentCreated", v31);
      CFRelease(v31);
    }
    if (CFDictionaryContainsKey(v13, @"sourceLibraryID"))
    {
      v32 = CFDictionaryGetValue(v13, @"sourceLibraryID");
      CFDictionarySetValue(a1, @"sourceLibraryID", v32);
    }
    if (CFDictionaryContainsKey(v13, @"sourceItemID"))
    {
      CFErrorRef v33 = CFDictionaryGetValue(v13, @"sourceItemID");
      CFDictionarySetValue(a1, @"sourceItemID", v33);
    }
    if (CFDictionaryContainsKey(v13, @"sourceContainerType"))
    {
      uint64_t v34 = CFDictionaryGetValue(v13, @"sourceContainerType");
      CFDictionarySetValue(a1, @"sourceContainerType", v34);
    }
    if (CFDictionaryContainsKey(v13, @"sourceContainerID"))
    {
      v35 = CFDictionaryGetValue(v13, @"sourceContainerID");
      CFDictionarySetValue(a1, @"sourceContainerID", v35);
    }
    if (CFDictionaryContainsKey(v13, @"sourceContainerDisplayName"))
    {
      v36 = CFDictionaryGetValue(v13, @"sourceContainerDisplayName");
      CFDictionarySetValue(a1, @"sourceContainerDisplayName", v36);
    }
    if (CFDictionaryContainsKey(v13, @"deviceDisplayName"))
    {
      v37 = CFDictionaryGetValue(v13, @"deviceDisplayName");
      CFDictionarySetValue(a1, @"deviceDisplayName", v37);
    }
    if (CFDictionaryContainsKey(v13, @"rasterToDisplayRotationAngle"))
    {
      CFNumberRef v38 = (const __CFNumber *)CFDictionaryGetValue(v13, @"rasterToDisplayRotationAngle");
      uint64_t valuePtr = 0;
      CFNumberGetValue(v38, kCFNumberLongLongType, &valuePtr);
      CFStringRef v39 = CFStringCreateWithFormat(*v9, 0, @"%llu", valuePtr);
      if (v39)
      {
        CFStringRef v40 = v39;
        CFDictionarySetValue(a1, @"rasterToDisplayRotationAngle", v39);
        CFRelease(v40);
      }
    }
    if (CFDictionaryContainsKey(v13, @"sourceiCloudPhotoLibraryEnabled"))
    {
      CFNumberRef v41 = (const __CFNumber *)CFDictionaryGetValue(v13, @"sourceiCloudPhotoLibraryEnabled");
      uint64_t valuePtr = 0;
      CFNumberGetValue(v41, kCFNumberLongLongType, &valuePtr);
      CFStringRef v42 = CFStringCreateWithFormat(*v9, 0, @"%llu", valuePtr);
      if (v42)
      {
        CFStringRef v43 = v42;
        CFDictionarySetValue(a1, @"sourceiCloudPhotoLibraryEnabled", v42);
        CFRelease(v43);
      }
    }
  }
}

uint64_t _didReceiveServerSideConfigurationVersion_1472(uint64_t result)
{
  id v1 = *(uint64_t (**)(void))(result + 144);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didReceiveRetryAfter(uint64_t result)
{
  id v1 = *(uint64_t (**)(void))(result + 152);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didFailAuthentication(uint64_t result)
{
  id v1 = *(uint64_t (**)(void))(result + 136);
  if (v1) {
    return v1();
  }
  return result;
}

void _didFinish(uint64_t a1, CFDataRef theData, __CFError *a3)
{
  if (theData && CFDataGetLength(theData))
  {
    CFErrorRef error = 0;
    CFPropertyListRef v6 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theData, 0, 0, &error);
    if (error) {
      BOOL v7 = a3 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      CFErrorRef v8 = error;
    }
    else {
      CFErrorRef v8 = a3;
    }
    if (error)
    {
      if (a3)
      {
        CFRelease(error);
        CFErrorRef v8 = a3;
      }
    }
    if (v6)
    {
      CFTypeID v9 = CFGetTypeID(v6);
      if (v9 == CFDictionaryGetTypeID())
      {
        (*(void (**)(uint64_t, CFPropertyListRef, CFErrorRef))(a1 + 128))(a1, v6, v8);
        CFRelease(v6);
        return;
      }
      CFRelease(v6);
    }
    (*(void (**)(uint64_t, void, CFErrorRef))(a1 + 128))(a1, 0, v8);
  }
  else
  {
    CFNumberRef v10 = *(void (**)(uint64_t, void, __CFError *))(a1 + 128);
    v10(a1, 0, a3);
  }
}

void MSPSPCUCSendUploadCompleteAsync(void *a1, uint64_t a2, const __CFDictionary *a3, CFArrayRef theArray)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  a1[6] = 0;
  a1[7] = _didFinishUC;
  a1[8] = _didFailAuthenticationUC;
  a1[9] = _didReceiveServerSideConfigurationVersionUC;
  uint64_t Count = CFArrayGetCount(theArray);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E4F1D510]);
  if (!Mutable) {
    __assert_rtn("MSPSPCUCSendUploadCompleteAsync", "MSPublishStreamsProtocolCore.m", 226, "outputArray");
  }
  CFTypeID v9 = Mutable;
  uint64_t v51 = (uint64_t)a1;
  uint64_t v52 = a2;
  CFDictionaryRef v53 = a3;
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef v10 = theArray;
  if (Count >= 1)
  {
    uint64_t v11 = Count;
    CFIndex v12 = 0;
    CFDictionaryRef v13 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    CFNumberRef v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    uint64_t v54 = Count;
    v55 = Mutable;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v12);
      CFMutableDictionaryRef v16 = CFDictionaryCreateMutable(0, 0, v13, v14);
      if (v16)
      {
        CFNumberRef v17 = v16;
        CFDataRef Value = CFDictionaryGetValue(ValueAtIndex, @"collId");
        CFDictionarySetValue(v17, @"assetcollid", Value);
        CFStringRef v19 = CFDictionaryGetValue(ValueAtIndex, @"mediaAssetType");
        if (v19) {
          CFDictionarySetValue(v17, @"mediaAssetType", v19);
        }
        CFMutableArrayRef v20 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        if (v20)
        {
          CFStringRef v21 = v20;
          theDict = v17;
          CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, @"masterAsset");
          if (v22)
          {
            CFDictionaryRef v23 = v22;
            CFMutableDictionaryRef v24 = CFDictionaryCreateMutable(0, 0, v13, v14);
            if (v24)
            {
              CFStringRef v25 = v24;
              CFDataRef v26 = (const __CFData *)CFDictionaryGetValue(v23, @"fileHash");
              CFStringRef v27 = MSSPCCreateHexStringFromData(v26);
              if (v27)
              {
                CFStringRef v28 = v27;
                CFDictionarySetValue(v25, @"checksum", v27);
                CFRelease(v28);
              }
              CFDictionaryRef v29 = (const __CFDictionary *)CFDictionaryGetValue(v23, @"metadata");
              if (v29)
              {
                double v30 = CFDictionaryGetValue(v29, @"fileSize");
                if (v30)
                {
                  CFStringRef v31 = CFStringCreateWithFormat(alloc, 0, @"%@", v30);
                  CFDictionarySetValue(v25, @"size", v31);
                  CFRelease(v31);
                }
              }
              v32 = CFDictionaryGetValue(v23, @"MMCSReceipt");
              if (v32)
              {
                CFDictionarySetValue(v25, @"receipt", v32);
                CFArrayAppendValue(v21, v25);
              }
              CFRelease(v25);
            }
          }
          CFArrayRef v33 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"derivedAssets");
          if (v33)
          {
            CFArrayRef v34 = v33;
            CFIndex v35 = CFArrayGetCount(v33);
            if (v35 >= 1)
            {
              CFIndex v36 = v35;
              for (CFIndex i = 0; i != v36; ++i)
              {
                CFDictionaryRef v38 = (const __CFDictionary *)CFArrayGetValueAtIndex(v34, i);
                CFMutableDictionaryRef v39 = CFDictionaryCreateMutable(0, 0, v13, v14);
                if (v39)
                {
                  CFStringRef v40 = v39;
                  CFNumberRef v41 = v13;
                  CFDataRef v42 = (const __CFData *)CFDictionaryGetValue(v38, @"fileHash");
                  CFStringRef v43 = MSSPCCreateHexStringFromData(v42);
                  if (v43)
                  {
                    CFStringRef v44 = v43;
                    CFDictionarySetValue(v40, @"checksum", v43);
                    CFRelease(v44);
                  }
                  CFDictionaryRef v45 = (const __CFDictionary *)CFDictionaryGetValue(v38, @"metadata");
                  if (v45)
                  {
                    v46 = CFDictionaryGetValue(v45, @"fileSize");
                    if (v46)
                    {
                      CFStringRef v47 = CFStringCreateWithFormat(alloc, 0, @"%@", v46);
                      CFDictionarySetValue(v40, @"size", v47);
                      CFRelease(v47);
                    }
                  }
                  v48 = CFDictionaryGetValue(v38, @"MMCSReceipt");
                  if (v48)
                  {
                    CFDictionarySetValue(v40, @"receipt", v48);
                    CFArrayAppendValue(v21, v40);
                  }
                  CFRelease(v40);
                  CFDictionaryRef v13 = v41;
                }
              }
            }
          }
          CFNumberRef v17 = theDict;
          CFDictionarySetValue(theDict, @"assets", v21);
          CFRelease(v21);
          CFTypeID v9 = v55;
          CFArrayRef v10 = theArray;
          uint64_t v11 = v54;
        }
        CFArrayAppendValue(v9, v17);
        CFRelease(v17);
      }
      ++v12;
    }
    while (v12 != v11);
  }
  CFErrorRef error = 0;
  CFDataRef v49 = CFPropertyListCreateData(alloc, v9, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (v49)
  {
    CFDataRef v50 = v49;
    CFRelease(v9);
    MSSPCStartHTTPTransaction(v51, @"POST", v52, v53, v50, 1, 0);
    CFRelease(v50);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v61 = error;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize upload complete data: %{public}@", buf, 0xCu);
    }
    if (error) {
      CFRelease(error);
    }
    CFRelease(v9);
    MSSPCStartHTTPTransaction(v51, @"POST", v52, v53, 0, 1, 0);
  }
}

uint64_t _didReceiveServerSideConfigurationVersionUC(uint64_t result)
{
  id v1 = *(uint64_t (**)(void))(result + 144);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didFailAuthenticationUC(uint64_t result)
{
  id v1 = *(uint64_t (**)(void))(result + 136);
  if (v1) {
    return v1();
  }
  return result;
}

void _didFinishUC(uint64_t a1, CFDataRef theData, __CFError *a3)
{
  id v4 = 0;
  CFErrorRef error = a3;
  if (!theData || a3) {
    goto LABEL_8;
  }
  if (CFDataGetLength(theData))
  {
    CFPropertyListRef v6 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theData, 0, 0, &error);
    id v4 = v6;
    if (!v6) {
      goto LABEL_8;
    }
    CFTypeID v7 = CFGetTypeID(v6);
    if (v7 == CFDictionaryGetTypeID()) {
      goto LABEL_8;
    }
    CFRelease(v4);
  }
  id v4 = 0;
LABEL_8:
  (*(void (**)(uint64_t, const void *, CFErrorRef))(a1 + 128))(a1, v4, error);
  if (v4) {
    CFRelease(v4);
  }
}

void MSSSPCGetMetadataAsync(void *a1, uint64_t a2, const __CFDictionary *a3, const void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  a1[13] = 0;
  a1[23] = 0;
  a1[24] = 0;
  _resetContext(a1);
  a1[6] = _didReceiveData;
  a1[7] = _didFinish_1514;
  a1[8] = _didFailAuthentication_1513;
  a1[10] = _didReceiveRetryAfter_1512;
  a1[9] = _didReceiveServerSideConfigurationVersion_1511;
  CFErrorRef error = 0;
  CFDataRef v8 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (v8)
  {
    CFDataRef v9 = v8;
    MSSPCStartHTTPTransaction((uint64_t)a1, @"POST", a2, a3, v8, 0, 1);
    CFRelease(v9);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v12 = error;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize get metadata request data: %{public}@", buf, 0xCu);
    }
    if (error) {
      CFRelease(error);
    }
    MSSPCStartHTTPTransaction((uint64_t)a1, @"POST", a2, a3, 0, 0, 1);
  }
}

void _resetContext(void *a1)
{
  a1[22] = 0;
  a1[25] = 0;
  uint64_t v2 = (const void *)a1[23];
  if (v2)
  {
    CFRelease(v2);
    a1[23] = 0;
  }
  unint64_t v3 = (const void *)a1[24];
  if (v3)
  {
    CFRelease(v3);
    a1[24] = 0;
  }
}

uint64_t _didReceiveServerSideConfigurationVersion_1511(uint64_t result)
{
  id v1 = *(uint64_t (**)(void))(result + 152);
  if (v1) {
    return v1();
  }
  return result;
}

void _didReceiveRetryAfter_1512(void *a1, uint64_t a2)
{
  _resetContext(a1);
  id v4 = (void (*)(void *, uint64_t))a1[20];
  if (v4)
  {
    v4(a1, a2);
  }
}

void _didFailAuthentication_1513(void *a1, uint64_t a2)
{
  _resetContext(a1);
  id v4 = (void (*)(void *, uint64_t))a1[18];
  if (v4)
  {
    v4(a1, a2);
  }
}

void _didFinish_1514(uint64_t a1, int a2, __CFError *cf)
{
  if (cf)
  {
    CFErrorRef v4 = cf;
    CFRetain(cf);
  }
  else if (*(void *)(a1 + 200))
  {
    CFErrorRef v4 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 4, @"ERROR_GET_CORE_CONNECTION_BLOCK_SHORT");
  }
  else
  {
    CFErrorRef v4 = 0;
  }
  _resetContext((void *)a1);
  (*(void (**)(uint64_t, CFErrorRef))(a1 + 128))(a1, v4);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t _didReceiveData(uint64_t a1, CFDataRef theData, CFErrorRef *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  CFIndex Length = CFDataGetLength(theData);
  BytePtr = CFDataGetBytePtr(theData);
  if (!Length) {
    return 1;
  }
  CFDataRef v8 = BytePtr;
  CFDataRef v9 = &BytePtr[Length];
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  while (2)
  {
    switch(*(void *)(a1 + 176))
    {
      case 0:
        int v11 = *v8;
        if (v11 == 13 || v11 == 10) {
          goto LABEL_41;
        }
        *(void *)(a1 + 176) = 1;
        goto LABEL_50;
      case 1:
        CFDataRef Mutable = *(const __CFData **)(a1 + 184);
        if (!Mutable)
        {
          CFDataRef Mutable = CFDataCreateMutable(v10, 10);
          *(void *)(a1 + 184) = Mutable;
        }
        int v14 = *v8;
        if (v14 == 10 || v14 == 13)
        {
          CFMutableDictionaryRef v16 = CFDataGetBytePtr(Mutable);
          CFIndex v17 = CFDataGetLength(Mutable);
          if (v17)
          {
            unint64_t v18 = 0;
            while (1)
            {
              int v19 = *v16;
              unsigned __int8 v20 = v19 - 48;
              if ((v19 - 48) >= 0xA)
              {
                if ((v19 - 65) > 5)
                {
                  if ((v19 - 97) > 5)
                  {
                    CFErrorRef v21 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 2, @"ERROR_GET_CORE_CONNECTION_INVALID_CHUNK_SIZE");
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      CFErrorRef v32 = v21;
                      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
                    }
                    goto LABEL_45;
                  }
                  unsigned __int8 v20 = v19 - 87;
                }
                else
                {
                  unsigned __int8 v20 = v19 - 55;
                }
              }
              ++v16;
              unint64_t v18 = v20 | (16 * v18);
              if (!--v17)
              {
                CFErrorRef v21 = 0;
                goto LABEL_46;
              }
            }
          }
          CFErrorRef v21 = 0;
LABEL_45:
          unint64_t v18 = 0;
LABEL_46:
          *(void *)(a1 + 200) = v18;
          CFDictionaryRef v29 = *(const void **)(a1 + 184);
          if (v29)
          {
            CFRelease(v29);
            *(void *)(a1 + 184) = 0;
          }
          if (v21) {
            goto LABEL_53;
          }
          *(void *)(a1 + 176) = 2;
LABEL_50:
          if (v8 == v9) {
            return 1;
          }
          continue;
        }
        if (CFDataGetLength(Mutable) <= 9)
        {
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 184), v8, 1);
LABEL_41:
          ++v8;
          goto LABEL_50;
        }
        CFErrorRef v21 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 2, @"ERROR_GET_CORE_CONNECTION_INVALID_CHUNK_SIZE");
        if (!v21) {
          return 1;
        }
LABEL_53:
        if (a3)
        {
          uint64_t result = 0;
          *a3 = v21;
        }
        else
        {
          CFRelease(v21);
          return 0;
        }
        return result;
      case 2:
        int v22 = *v8;
        if (v22 == 13 || v22 == 10) {
          goto LABEL_41;
        }
        *(void *)(a1 + 176) = 3;
        goto LABEL_50;
      case 3:
        CFMutableDictionaryRef v24 = *(__CFData **)(a1 + 192);
        unint64_t v25 = *(void *)(a1 + 200);
        if (!v24)
        {
          CFMutableDictionaryRef v24 = CFDataCreateMutable(v10, v25);
          *(void *)(a1 + 192) = v24;
          unint64_t v25 = *(void *)(a1 + 200);
        }
        if (v25 >= v9 - v8) {
          CFIndex v26 = v9 - v8;
        }
        else {
          CFIndex v26 = v25;
        }
        CFDataAppendBytes(v24, v8, v26);
        v8 += v26;
        CFIndex v27 = *(void *)(a1 + 200) - v26;
        *(void *)(a1 + 200) = v27;
        if (!v27)
        {
          (*(void (**)(uint64_t, void))(a1 + 136))(a1, *(void *)(a1 + 192));
          CFStringRef v28 = *(const void **)(a1 + 192);
          if (v28)
          {
            CFRelease(v28);
            *(void *)(a1 + 192) = 0;
          }
          *(void *)(a1 + 176) = 0;
        }
        goto LABEL_50;
      default:
        __assert_rtn("_didReceiveData", "MSSubscribeStreamProtocolCore.m", 189, "0");
    }
  }
}

double MSSSPCChunkParsingInitialize(uint64_t a1)
{
  *(_DWORD *)(a1 + 80) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  return result;
}

void _resetChunkContext(void *a1)
{
  uint64_t v2 = (const void *)a1[6];
  if (v2)
  {
    CFRelease(v2);
    a1[6] = 0;
  }
  unint64_t v3 = (const void *)a1[7];
  if (v3)
  {
    CFRelease(v3);
    a1[7] = 0;
  }
  CFErrorRef v4 = (const void *)a1[8];
  if (v4)
  {
    CFRelease(v4);
    a1[8] = 0;
  }
  CFStringRef v5 = (const void *)a1[9];
  if (v5)
  {
    CFRelease(v5);
    a1[9] = 0;
  }
}

uint64_t MSSSPCChunkParsingParseNextChunk(void *a1, const __CFData *a2, CFErrorRef *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Parsing next chunk.", buf, 2u);
  }
  CFErrorRef error = 0;
  CFDictionaryRef v6 = (const __CFDictionary *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0, 0, &error);
  CFDictionaryRef v7 = v6;
  CFDataRef v8 = error;
  if (error)
  {
    if (!v6) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
  if (v6)
  {
    CFTypeID v10 = CFGetTypeID(v6);
    if (v10 == CFDictionaryGetTypeID())
    {
      _performNextStateAction((uint64_t)a1, v7, a3);
      goto LABEL_14;
    }
  }
  CFDataRef v8 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 5, @"ERROR_GET_CORE_CONNECTION_BAD_CHUNK_TYPE");
  CFErrorRef error = v8;
  if (v7)
  {
LABEL_14:
    CFRelease(v7);
    CFDataRef v8 = error;
    if (error) {
      goto LABEL_6;
    }
    return 1;
  }
LABEL_5:
  if (!v8) {
    return 1;
  }
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v8;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error encountered during chunk parsing: %{public}@", buf, 0xCu);
  }
  _resetChunkContext(a1);
  if (a3)
  {
    uint64_t result = 0;
    *a3 = error;
  }
  else
  {
    CFRelease(error);
    return 0;
  }
  return result;
}

void _performNextStateAction(uint64_t a1, const __CFDictionary *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  CFTypeRef v31 = 0;
  switch(*(_DWORD *)(a1 + 80))
  {
    case 0:
      goto LABEL_44;
    case 1:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(void *)&value[4] = a2;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_parseSharingStatus: %{public}@", value, 0xCu);
      }
      *(void *)value = 0;
      CFDictionaryGetValueIfPresent(a2, @"parttype", (const void **)value);
      if (!*(void *)value || !CFEqual(*(CFTypeRef *)value, @"sharing-status")) {
        goto LABEL_52;
      }
      goto LABEL_40;
    case 2:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(void *)&value[4] = a2;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_parseBegin: %{public}@", value, 0xCu);
      }
      *(void *)value = 0;
      CFDictionaryGetValueIfPresent(a2, @"parttype", (const void **)value);
      if (!*(void *)value || !CFEqual(*(CFTypeRef *)value, @"stream-metadata-begin")) {
        goto LABEL_52;
      }
      CFTypeRef cf = 0;
      CFDictionaryRef v7 = @"ctag";
      CFDictionaryGetValueIfPresent(a2, @"ctag", &cf);
      if (!cf) {
        goto LABEL_19;
      }
      CFTypeID v8 = CFGetTypeID(cf);
      if (v8 != CFStringGetTypeID()) {
        goto LABEL_41;
      }
      CFTypeRef v9 = cf;
      if (cf)
      {
        if (*(void *)(a1 + 64))
        {
          CFRelease(*(CFTypeRef *)(a1 + 64));
          CFTypeRef v9 = cf;
        }
        *(void *)(a1 + 64) = CFRetain(v9);
      }
LABEL_19:
      CFTypeRef cf1 = 0;
      CFDictionaryRef v7 = @"reset";
      CFDictionaryGetValueIfPresent(a2, @"reset", &cf1);
      if (!cf1) {
        goto LABEL_69;
      }
      CFTypeID v10 = CFGetTypeID(cf1);
      if (v10 == CFStringGetTypeID())
      {
        if (cf1 && CFEqual(cf1, @"1"))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Subscription stream was reset by the server.", buf, 2u);
          }
          uint64_t v11 = 1;
        }
        else
        {
LABEL_69:
          uint64_t v11 = 0;
        }
        *(void *)buf = 0;
        CFDictionaryGetValueIfPresent(a2, @"streamid", (const void **)buf);
        if (*(void *)buf)
        {
          CFTypeID v19 = CFGetTypeID(*(CFTypeRef *)buf);
          if (v19 == CFStringGetTypeID())
          {
            unsigned __int8 v20 = *(const void **)(a1 + 72);
            if (v20) {
              CFRelease(v20);
            }
            *(void *)(a1 + 72) = CFRetain(*(CFTypeRef *)buf);
            CFDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
            if (CFDictionaryContainsKey(a2, @"devices"))
            {
              int v22 = CFDictionaryGetValue(a2, @"devices");
              CFDictionarySetValue(Mutable, @"devices", v22);
            }
            (*(void (**)(uint64_t, void, uint64_t, __CFDictionary *))(a1 + 8))(a1, *(void *)buf, v11, Mutable);
            *(_DWORD *)(a1 + 80) = 3;
            if (Mutable) {
              CFRelease(Mutable);
            }
            goto LABEL_99;
          }
        }
        double v30 = @"streamid";
      }
      else
      {
LABEL_41:
        double v30 = v7;
      }
      CFDictionaryRef v6 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 8, @"ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD", v30);
      goto LABEL_53;
    case 3:
      CFTypeRef cf = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(void *)&value[4] = a2;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_parseAssets: %{public}@", value, 0xCu);
      }
      CFTypeRef cf1 = 0;
      CFDictionaryGetValueIfPresent(a2, @"parttype", &cf1);
      if (!cf1 || !CFEqual(cf1, @"asset-metadata") && !CFEqual(cf1, @"stream-metadata-end"))
      {
        uint64_t v14 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 7, @"ERROR_GET_CORE_CONNECTION_BAD_PART_TYPE");
        goto LABEL_56;
      }
      if (CFEqual(cf1, @"stream-metadata-end"))
      {
        int v12 = 4;
        goto LABEL_51;
      }
      *(void *)buf = 0;
      CFStringRef v15 = @"streamid";
      CFDictionaryGetValueIfPresent(a2, @"streamid", (const void **)buf);
      if (!*(void *)buf) {
        goto LABEL_96;
      }
      CFTypeID v16 = CFGetTypeID(*(CFTypeRef *)buf);
      if (v16 != CFStringGetTypeID() || !*(void *)buf || !CFEqual(*(CFTypeRef *)buf, *(CFTypeRef *)(a1 + 72))) {
        goto LABEL_96;
      }
      CFTypeRef v34 = 0;
      CFStringRef v15 = @"errorcode";
      CFDictionaryGetValueIfPresent(a2, @"errorcode", &v34);
      if (v34)
      {
        CFTypeID v17 = CFGetTypeID(v34);
        if (v17 != CFStringGetTypeID())
        {
LABEL_96:
          CFTypeRef cf = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 8, @"ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD", v15);
LABEL_97:
          uint64_t v14 = cf;
          if (!cf) {
            goto LABEL_99;
          }
LABEL_98:
          CFTypeRef v31 = v14;
LABEL_99:
          CFDictionaryRef v6 = v31;
          if (!v31) {
            return;
          }
          goto LABEL_100;
        }
        CFTypeRef v18 = v34;
        if (v34)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)value = 138543618;
            *(void *)&value[4] = *(void *)buf;
            __int16 v39 = 2114;
            CFTypeRef v40 = v18;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Stream %{public}@ is not available. Status: %{public}@", value, 0x16u);
            CFTypeRef v18 = v34;
          }
          if (CFEqual(v18, @"404")) {
            (*(void (**)(uint64_t, void))(a1 + 32))(a1, *(void *)buf);
          }
          else {
            (*(void (**)(uint64_t, void))(a1 + 40))(a1, *(void *)buf);
          }
          goto LABEL_97;
        }
      }
      *(void *)value = 0;
      CFDictionaryGetValueIfPresent(a2, @"mmcsurl", (const void **)value);
      if (*(void *)value)
      {
        CFTypeID v23 = CFGetTypeID(*(CFTypeRef *)value);
        if (v23 == CFStringGetTypeID())
        {
          CFMutableDictionaryRef v24 = *(const void **)(a1 + 48);
          if (v24)
          {
            if (CFEqual(*(CFTypeRef *)value, v24)) {
              goto LABEL_88;
            }
            unint64_t v25 = *(const void **)(a1 + 48);
            if (v25) {
              CFRelease(v25);
            }
          }
          *(void *)(a1 + 48) = CFRetain(*(CFTypeRef *)value);
          CFIndex v26 = *(const void **)(a1 + 56);
          if (v26) {
            CFRelease(v26);
          }
          *(void *)(a1 + 56) = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFStringRef *)value, 0);
LABEL_88:
          CFTypeRef v33 = 0;
          CFStringRef v15 = @"mmcsheaders";
          CFDictionaryGetValueIfPresent(a2, @"mmcsheaders", &v33);
          if (v33)
          {
            CFTypeID v27 = CFGetTypeID(v33);
            if (v27 == CFDictionaryGetTypeID())
            {
              CFTypeRef v32 = 0;
              CFStringRef v15 = @"assets";
              CFDictionaryGetValueIfPresent(a2, @"assets", &v32);
              if (v32)
              {
                CFTypeID v28 = CFGetTypeID(v32);
                if (v28 == CFArrayGetTypeID())
                {
                  CFDictionaryRef v29 = _createAssetCollections((const __CFArray *)v32, *(const void **)(a1 + 72), (const __CFDictionary *)v33, *(const void **)(a1 + 56), &cf);
                  if (!cf) {
                    (*(void (**)(uint64_t, void, __CFArray *))(a1 + 16))(a1, *(void *)buf, v29);
                  }
                  if (v29) {
                    CFRelease(v29);
                  }
                  goto LABEL_97;
                }
              }
            }
          }
          goto LABEL_96;
        }
      }
      uint64_t v14 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 8, @"ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD", @"mmcsurl");
LABEL_56:
      if (!v14) {
        goto LABEL_99;
      }
      goto LABEL_98;
    case 4:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(void *)&value[4] = a2;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_parseEnd: %{public}@", value, 0xCu);
      }
      *(void *)value = 0;
      CFDictionaryRef v7 = @"streamid";
      CFDictionaryGetValueIfPresent(a2, @"streamid", (const void **)value);
      if (!*(void *)value) {
        goto LABEL_41;
      }
      CFTypeID v13 = CFGetTypeID(*(CFTypeRef *)value);
      if (v13 != CFStringGetTypeID() || !*(void *)value || !CFEqual(*(CFTypeRef *)value, *(CFTypeRef *)(a1 + 72))) {
        goto LABEL_41;
      }
      (*(void (**)(uint64_t, void, void))(a1 + 24))(a1, *(void *)value, *(void *)(a1 + 64));
LABEL_40:
      *(_DWORD *)(a1 + 80) = 0;
      goto LABEL_99;
    case 5:
      _resetChunkContext((void *)a1);
      *(_DWORD *)(a1 + 80) = 0;
LABEL_44:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(void *)&value[4] = a2;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_parseAny: %{public}@", value, 0xCu);
      }
      *(void *)value = 0;
      CFDictionaryGetValueIfPresent(a2, @"parttype", (const void **)value);
      if (!*(void *)value) {
        goto LABEL_52;
      }
      if (CFEqual(*(CFTypeRef *)value, @"stream-metadata-begin"))
      {
        int v12 = 2;
LABEL_51:
        *(_DWORD *)(a1 + 80) = v12;
        _performNextStateAction(a1, a2, &v31);
        goto LABEL_99;
      }
      if (CFEqual(*(CFTypeRef *)value, @"sharing-status"))
      {
        int v12 = 1;
        goto LABEL_51;
      }
LABEL_52:
      CFDictionaryRef v6 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 7, @"ERROR_GET_CORE_CONNECTION_BAD_PART_TYPE");
LABEL_53:
      if (!v6) {
        goto LABEL_99;
      }
      CFTypeRef v31 = v6;
LABEL_100:
      if (a3) {
        *a3 = v6;
      }
      else {
        CFRelease(v6);
      }
      return;
    default:
      CFDictionaryRef v6 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 6, @"ERROR_GET_CORE_CONNECTION_BAD_STATE");
      CFTypeRef v31 = v6;
      if (!v6) {
        return;
      }
      goto LABEL_100;
  }
}

__CFArray *_createAssetCollections(const __CFArray *a1, const void *a2, const __CFDictionary *a3, const void *a4, CFTypeRef *a5)
{
  CFArrayRef v8 = a1;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  CFTypeRef v44 = 0;
  uint64_t Count = CFArrayGetCount(a1);
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Count, MEMORY[0x1E4F1D510]);
  if (Count < 1) {
    return Mutable;
  }
  CFIndex v35 = a5;
  CFIndex v10 = 0;
  uint64_t v11 = @"filename";
  CFArrayRef v36 = v8;
  __int16 v39 = a2;
  do
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v8, v10);
    CFTypeID v13 = CFGetTypeID(ValueAtIndex);
    if (v13 != CFDictionaryGetTypeID())
    {
      CFErrorRef v25 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 8, @"ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD", @"assets");
      CFTypeRef v44 = v25;
      if (!v25) {
        goto LABEL_50;
      }
      CFTypeRef v24 = v25;
      uint64_t v14 = 0;
      goto LABEL_46;
    }
    uint64_t v14 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, v11))
    {
      CFStringRef v15 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v11);
      CFDictionarySetValue(v14, @"fileName", v15);
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, @"assetcollid"))
    {
      CFTypeID v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"assetcollid");
      CFDictionarySetValue(v14, @"collId", v16);
    }
    CFTypeID v17 = v11;
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, @"server-uploadeddate"))
    {
      CFTypeRef v18 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"server-uploadeddate");
      CFDictionarySetValue(v14, @"serverUploadedDate", v18);
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, @"delete"))
    {
      CFStringRef v19 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"delete");
      if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
      }
      CFNumberRef NumberFromString = CFNumberFormatterCreateNumberFromString(allocator, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v19, 0, 0);
      if (NumberFromString)
      {
        CFNumberRef v21 = NumberFromString;
        CFDictionarySetValue(v14, @"deleted", NumberFromString);
        CFRelease(v21);
      }
    }
    int v22 = _createAsset((const __CFDictionary *)ValueAtIndex, a3, a4, a2, &v44);
    CFDictionaryRef v23 = v22;
    CFTypeRef v24 = v44;
    if (v44)
    {
      if (v22)
      {
        CFRelease(v22);
LABEL_18:
        uint64_t v11 = v17;
        goto LABEL_45;
      }
      uint64_t v11 = v17;
LABEL_46:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        CFTypeRef v46 = v24;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Rejecting asset collection because of error: %{public}@", buf, 0xCu);
        CFTypeRef v24 = v44;
      }
      CFRelease(v24);
      CFTypeRef v44 = 0;
      if (v14) {
        goto LABEL_49;
      }
      goto LABEL_50;
    }
    CFDictionaryAddValue(v14, @"masterAsset", v22);
    value = 0;
    CFDictionaryGetValueIfPresent(v23, @"fileHash", (const void **)&value);
    if (value) {
      CFDictionarySetValue(v23, @"masterAssetHash", value);
    }
    CFRelease(v23);
    CFTypeRef cf = 0;
    CFDictionaryGetValueIfPresent((CFDictionaryRef)ValueAtIndex, @"derivatives", &cf);
    uint64_t v11 = v17;
    if (cf)
    {
      CFTypeID v26 = CFGetTypeID(cf);
      if (v26 == CFArrayGetTypeID())
      {
        if (cf)
        {
          uint64_t v27 = CFArrayGetCount((CFArrayRef)cf);
          CFMutableArrayRef theArray = CFArrayCreateMutable(allocator, v27, MEMORY[0x1E4F1D510]);
          if (v27 < 1)
          {
LABEL_54:
            if (CFArrayGetCount(theArray)) {
              CFDictionarySetValue(v14, @"derivedAssets", theArray);
            }
            CFRelease(theArray);
            a2 = v39;
            CFArrayRef v8 = v36;
            goto LABEL_18;
          }
          CFIndex v28 = 0;
          while (1)
          {
            CFDictionaryRef v29 = CFArrayGetValueAtIndex((CFArrayRef)cf, v28);
            CFTypeID v30 = CFGetTypeID(v29);
            if (v30 == CFDictionaryGetTypeID())
            {
              CFTypeRef v31 = _createAsset((const __CFDictionary *)v29, a3, a4, v39, &v44);
              CFTypeRef v32 = v31;
              CFTypeRef v33 = v44;
              if (v44)
              {
                if (!v31) {
                  goto LABEL_38;
                }
              }
              else
              {
                if (value) {
                  CFDictionarySetValue(v31, @"masterAssetHash", value);
                }
                CFArrayAppendValue(theArray, v32);
              }
              CFRelease(v32);
              CFTypeRef v33 = v44;
              if (v44)
              {
LABEL_38:
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  CFTypeRef v46 = v33;
                  _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Rejecting derived asset because of error: %{public}@", buf, 0xCu);
                  CFTypeRef v33 = v44;
                }
                CFRelease(v33);
                CFTypeRef v44 = 0;
              }
            }
            else
            {
              CFTypeRef v33 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 8, @"ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD", @"derivatives");
              CFTypeRef v44 = v33;
              if (v33) {
                goto LABEL_38;
              }
            }
            if (v27 == ++v28) {
              goto LABEL_54;
            }
          }
        }
      }
      else
      {
        CFTypeRef v44 = MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 8, @"ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD", @"derivatives");
      }
    }
LABEL_45:
    CFTypeRef v24 = v44;
    if (v44) {
      goto LABEL_46;
    }
    if (v14)
    {
      CFArrayAppendValue(Mutable, v14);
LABEL_49:
      CFRelease(v14);
    }
LABEL_50:
    ++v10;
  }
  while (v10 != Count);
  if (v44)
  {
    CFRelease(Mutable);
    if (v35)
    {
      CFDataRef Mutable = 0;
      CFTypeRef *v35 = v44;
    }
    else
    {
      CFRelease(v44);
      return 0;
    }
  }
  return Mutable;
}

__CFDictionary *_createAsset(const __CFDictionary *a1, const __CFDictionary *a2, const void *a3, const void *a4, void *a5)
{
  uint64_t v57 = 0;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFIndex v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  uint64_t v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  CFDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeID v13 = CFDictionaryCreateMutable(v9, 0, v10, v11);
  if (CFDictionaryContainsKey(a1, @"width"))
  {
    CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(a1, @"width");
    if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
      dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
    }
    CFNumberRef NumberFromString = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v14, 0, 0);
    if (NumberFromString)
    {
      CFNumberRef v16 = NumberFromString;
      CFDictionarySetValue(v13, @"pixelWidth", NumberFromString);
      CFRelease(v16);
    }
  }
  if (CFDictionaryContainsKey(a1, @"height"))
  {
    CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(a1, @"height");
    if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
      dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
    }
    CFNumberRef v18 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v17, 0, 0);
    if (v18)
    {
      CFNumberRef v19 = v18;
      CFDictionarySetValue(v13, @"pixelHeight", v18);
      CFRelease(v19);
    }
  }
  if (CFDictionaryContainsKey(a1, @"deviceid"))
  {
    unsigned __int8 v20 = CFDictionaryGetValue(a1, @"deviceid");
    CFDictionarySetValue(v13, @"deviceID", v20);
  }
  if (CFDictionaryContainsKey(a1, @"bytecount"))
  {
    CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(a1, @"bytecount");
    if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
      dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
    }
    CFNumberRef v22 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v21, 0, 0);
    if (v22)
    {
      CFNumberRef v23 = v22;
      CFDictionarySetValue(v13, @"fileSize", v22);
      CFRelease(v23);
    }
  }
  if (!CFDictionaryContainsKey(a1, @"sha1"))
  {
LABEL_24:
    if (CFDictionaryContainsKey(a1, @"dateContentCreated"))
    {
      CFStringRef v25 = (const __CFString *)CFDictionaryGetValue(a1, @"dateContentCreated");
      if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
      }
      CFNumberRef v26 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v25, 0, 0);
      if (v26)
      {
        CFNumberRef v27 = v26;
        value = 0;
        CFNumberGetValue(v26, kCFNumberDoubleType, &value);
        CFRelease(v27);
        CFDateRef v28 = CFDateCreate(0, *(CFAbsoluteTime *)&value);
        if (v28)
        {
          CFDateRef v29 = v28;
          CFDictionarySetValue(v13, @"dateContentCreated", v28);
          CFRelease(v29);
        }
      }
    }
    if (CFDictionaryContainsKey(a1, @"dateContentModified"))
    {
      CFStringRef v30 = (const __CFString *)CFDictionaryGetValue(a1, @"dateContentModified");
      if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
      }
      CFNumberRef v31 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v30, 0, 0);
      if (v31)
      {
        CFNumberRef v32 = v31;
        value = 0;
        CFNumberGetValue(v31, kCFNumberDoubleType, &value);
        CFRelease(v32);
        CFDateRef v33 = CFDateCreate(0, *(CFAbsoluteTime *)&value);
        if (v33)
        {
          CFDateRef v34 = v33;
          CFDictionarySetValue(v13, @"dateContentModified", v33);
          CFRelease(v34);
        }
      }
    }
    if (CFDictionaryContainsKey(a1, @"sourceLibraryID"))
    {
      CFIndex v35 = CFDictionaryGetValue(a1, @"sourceLibraryID");
      CFDictionarySetValue(v13, @"sourceLibraryID", v35);
    }
    if (CFDictionaryContainsKey(a1, @"sourceItemID"))
    {
      CFArrayRef v36 = CFDictionaryGetValue(a1, @"sourceItemID");
      CFDictionarySetValue(v13, @"sourceItemID", v36);
    }
    if (CFDictionaryContainsKey(a1, @"sourceContainerType"))
    {
      v37 = CFDictionaryGetValue(a1, @"sourceContainerType");
      CFDictionarySetValue(v13, @"sourceContainerType", v37);
    }
    if (CFDictionaryContainsKey(a1, @"sourceContainerID"))
    {
      CFDictionaryRef v38 = CFDictionaryGetValue(a1, @"sourceContainerID");
      CFDictionarySetValue(v13, @"sourceContainerID", v38);
    }
    if (CFDictionaryContainsKey(a1, @"sourceContainerDisplayName"))
    {
      __int16 v39 = CFDictionaryGetValue(a1, @"sourceContainerDisplayName");
      CFDictionarySetValue(v13, @"sourceContainerDisplayName", v39);
    }
    if (CFDictionaryContainsKey(a1, @"deviceDisplayName"))
    {
      CFTypeRef v40 = CFDictionaryGetValue(a1, @"deviceDisplayName");
      CFDictionarySetValue(v13, @"deviceDisplayName", v40);
    }
    if (CFDictionaryContainsKey(a1, @"rasterToDisplayRotationAngle"))
    {
      CFStringRef v41 = (const __CFString *)CFDictionaryGetValue(a1, @"rasterToDisplayRotationAngle");
      if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
      }
      CFNumberRef v42 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v41, 0, 0);
      if (v42)
      {
        CFNumberRef v43 = v42;
        CFDictionarySetValue(v13, @"rasterToDisplayRotationAngle", v42);
        CFRelease(v43);
      }
    }
    if (CFDictionaryContainsKey(a1, @"sourceiCloudPhotoLibraryEnabled"))
    {
      CFStringRef v44 = (const __CFString *)CFDictionaryGetValue(a1, @"sourceiCloudPhotoLibraryEnabled");
      if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
      }
      CFNumberRef v45 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v44, 0, 0);
      if (v45)
      {
        CFNumberRef v46 = v45;
        CFDictionarySetValue(v13, @"sourceiCloudPhotoLibraryEnabled", v45);
        CFRelease(v46);
      }
    }
    CFDictionarySetValue(v13, @"streamID", a4);
    CFDictionarySetValue(Mutable, @"metadata", v13);
    if (v13) {
      CFRelease(v13);
    }
    if (CFDictionaryContainsKey(a1, @"size"))
    {
      CFStringRef v47 = (const __CFString *)CFDictionaryGetValue(a1, @"size");
      if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
      }
      CFNumberRef v48 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v47, 0, 0);
      if (v48)
      {
        CFNumberRef v49 = v48;
        CFDictionarySetValue(Mutable, @"protocolFileSize", v48);
        CFRelease(v49);
      }
    }
    if (CFDictionaryContainsKey(a1, @"type"))
    {
      CFDataRef v50 = CFDictionaryGetValue(a1, @"type");
      CFTypeID v51 = CFGetTypeID(v50);
      if (v51 == CFStringGetTypeID()) {
        CFDictionarySetValue(Mutable, @"type", v50);
      }
    }
    value = 0;
    CFDictionaryGetValueIfPresent(a1, @"checksum", (const void **)&value);
    if (value)
    {
      CFTypeRef cf = 0;
      MSPCUCreateDataFromHexString((const __CFString *)value, @"checksum", (__CFData **)&cf, &v57, (uint64_t (*)(uint64_t))_createBadFieldError);
      if (v57) {
        goto LABEL_74;
      }
      CFDictionarySetValue(Mutable, @"fileHash", cf);
      CFRelease(cf);
      uint64_t v54 = 0;
      CFDictionaryGetValueIfPresent(a2, value, (const void **)&v54);
      if (v54) {
        CFDictionarySetValue(Mutable, @"MMCSAccessHeader", v54);
      }
    }
    CFDictionaryGetValueIfPresent(a1, @"sha1", 0);
    if (a3) {
      CFDictionarySetValue(Mutable, @"MMCSURL", a3);
    }
LABEL_74:
    if (!v57) {
      return Mutable;
    }
    goto LABEL_75;
  }
  CFStringRef v24 = (const __CFString *)CFDictionaryGetValue(a1, @"sha1");
  value = 0;
  MSPCUCreateDataFromHexString(v24, @"sha1", (__CFData **)&value, &v57, (uint64_t (*)(uint64_t))_createBadFieldError);
  if (!v57)
  {
    if (value)
    {
      CFDictionarySetValue(v13, @"SHA1", value);
      CFRelease(value);
    }
    goto LABEL_24;
  }
  if (v13)
  {
    CFRelease(v13);
    goto LABEL_74;
  }
LABEL_75:
  if (Mutable) {
    CFRelease(Mutable);
  }
  CFDataRef Mutable = 0;
  if (a5) {
    *a5 = v57;
  }
  return Mutable;
}

CFErrorRef _createBadFieldError(uint64_t a1)
{
  return MSPCUCreateError(@"MSSubscribeStreamsProtocolCoreErrorDomain", 8, @"ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD", a1);
}

CFStringRef MSCFCopyLocalizedString(CFStringRef key)
{
  uint64_t v2 = (__CFBundle *)__bundle_bundle;
  if (!__bundle_bundle)
  {
    __bundle_bundle = (uint64_t)CFBundleGetBundleWithIdentifier(@"com.apple.CoreMediaStream");
    CFRetain((CFTypeRef)__bundle_bundle);
    uint64_t v2 = (__CFBundle *)__bundle_bundle;
  }
  return CFBundleCopyLocalizedString(v2, key, key, @"CoreMediaStream");
}

CFStringRef MSCFCreateLocalizedFormat(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v9 = MSCFCopyLocalizedString(a1);
  CFStringRef v10 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v9, &a9);
  CFRelease(v9);
  return v10;
}

uint64_t MPSStateResponseReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  CFErrorRef v4 = (int *)MEMORY[0x1E4F940E0];
  CFStringRef v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    CFDictionaryRef v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_50;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_52;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_52:
          uint64_t v40 = 8;
          goto LABEL_66;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 32) |= 8u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_56:
          uint64_t v41 = 28;
          goto LABEL_61;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
              *(void *)(a2 + v32) = v33 + 1;
              v26 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v14 = v31++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_60:
          uint64_t v41 = 24;
LABEL_61:
          *(_DWORD *)(a1 + v41) = v26;
          continue;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v3;
        unint64_t v38 = *(void *)(a2 + v37);
        if (v38 == -1 || v38 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
        *(void *)(a2 + v37) = v38 + 1;
        v19 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0) {
          goto LABEL_63;
        }
        v35 += 7;
        BOOL v14 = v36++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_65;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_63:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_65:
      uint64_t v40 = 16;
LABEL_66:
      *(void *)(a1 + v40) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void MSSPCStartHTTPTransaction(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, const __CFData *a5, int a6, int a7)
{
  userInfoKeys[1] = *(void **)MEMORY[0x1E4F143B8];
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef Mutable = (const void *)CFURLRequestCreateMutable();
  if (a3)
  {
    if (!a2) {
      __assert_rtn("MSSPCStartHTTPTransaction", "MSStreamsProtocolCore.m", 215, "method");
    }
    int v68 = a7;
    uint64_t v62 = a3;
    CFAllocatorRef v70 = v14;
    CFURLRequestSetHTTPRequestMethod();
    CFDictionaryRef v16 = *(const __CFDictionary **)(a1 + 24);
    uint64_t v66 = *(void *)(a1 + 8);
    uint64_t v67 = *(void *)(a1 + 16);
    CFDictionaryRef v17 = *(const __CFDictionary **)(a1 + 32);
    if (!v17)
    {
      CFURLRequestSetHTTPHeaderFieldValue();
      goto LABEL_20;
    }
    CFDataRef v63 = a5;
    CFDictionaryRef v18 = a4;
    CFIndex Count = CFDictionaryGetCount(v17);
    uint64_t v20 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    unint64_t v21 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    char v22 = v21;
    if (v20 && v21)
    {
      CFDictionaryGetKeysAndValues(v17, v20, v21);
      if (Count >= 1)
      {
        CFNumberRef v23 = v20;
        char v24 = v22;
        do
        {
          ++v23;
          ++v24;
          CFURLRequestSetHTTPHeaderFieldValue();
          --Count;
        }
        while (Count);
      }
    }
    else if (!v20)
    {
      goto LABEL_18;
    }
    free(v20);
LABEL_18:
    a4 = v18;
    a5 = v63;
    if (v22) {
      free(v22);
    }
LABEL_20:
    if (CFDictionaryContainsKey(v16, @"pushToken"))
    {
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v16, @"pushToken");
      CFStringRef v28 = MSSPCCreateHexStringFromData(Value);
      if (v28)
      {
        CFStringRef v29 = v28;
        CFURLRequestSetHTTPHeaderFieldValue();
        CFRelease(v29);
      }
    }
    if (CFDictionaryContainsKey(v16, @"UDID"))
    {
      CFStringRef v30 = (const __CFString *)CFDictionaryGetValue(v16, @"UDID");
      CFStringRef SHA1StringOfUDID = createSHA1StringOfUDID(v30);
      if (SHA1StringOfUDID)
      {
        CFStringRef v32 = SHA1StringOfUDID;
        CFURLRequestSetHTTPHeaderFieldValue();
        CFRelease(v32);
      }
    }
    unint64_t v33 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v34 = [v33 integerForKey:@"AKAddTestApplicationHeader"];

    if (v34 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)userInfoValues = 0;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Setting X-APPLE-TEST-APPLICATION header to true", userInfoValues, 2u);
      }
      CFURLRequestSetHTTPHeaderFieldValue();
    }
    if (CFDictionaryContainsKey(v16, @"clientInfo"))
    {
      CFDictionaryGetValue(v16, @"clientInfo");
      CFURLRequestSetHTTPHeaderFieldValue();
    }
    if (!v67) {
      goto LABEL_48;
    }
    CFStringRef v35 = CFStringCreateWithFormat(v70, 0, @"%@:%@", v66, v67);
    if (!v35)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)userInfoValues = 0;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not create authentication string.", userInfoValues, 2u);
      }
      goto LABEL_48;
    }
    CFStringRef v36 = v35;
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v70, v35, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      CFDataRef v38 = ExternalRepresentation;
      CFStringRef v39 = MSPCUCreateBase64StringFromData(ExternalRepresentation);
      CFRelease(v38);
      if (v39)
      {
        CFStringRef v40 = CFStringCreateWithFormat(v70, 0, @"X-MobileMe-AuthToken %@", v39);
        CFRelease(v39);
        if (v40)
        {
          CFURLRequestSetHTTPHeaderFieldValue();
          CFRelease(v40);
LABEL_47:
          CFRelease(v36);
LABEL_48:
          if (v68) {
            CFURLRequestAppendHTTPHeaderFieldValue();
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            if (a5)
            {
              BytePtr = CFDataGetBytePtr(a5);
              CFIndex Length = CFDataGetLength(a5);
              CFStringRef v45 = CFStringCreateWithBytes(v70, BytePtr, Length, 0x8000100u, 0);
            }
            else
            {
              CFStringRef v45 = 0;
            }
            CFDictionaryRef v46 = (const __CFDictionary *)CFURLRequestCopyAllHTTPHeaderFields();
            if (v46)
            {
              CFDictionaryRef v47 = v46;
              CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v46);
              CFRelease(v47);
              if (MutableCopy)
              {
                CFIndex v49 = CFDictionaryGetCount(MutableCopy);
                CFDataRef v50 = (const void **)malloc_type_malloc(8 * v49, 0x80040B8603338uLL);
                if (v50)
                {
                  CFDataRef v64 = a5;
                  int v65 = a6;
                  v69 = v50;
                  CFDictionaryGetKeysAndValues(MutableCopy, v50, 0);
                  if (v49 >= 1)
                  {
                    CFTypeID v51 = (CFStringRef *)v69;
                    do
                    {
                      CFStringRef v52 = *v51;
                      if (CFStringCompare(*v51, @"x-apple-mme-streams-client-token", 1uLL) == kCFCompareEqualTo
                        || CFStringCompare(v52, @"x-apple-mme-streams-client-udid", 1uLL) == kCFCompareEqualTo
                        || CFStringCompare(v52, @"authorization", 1uLL) == kCFCompareEqualTo)
                      {
                        CFDictionarySetValue(MutableCopy, v52, @"[present]");
                      }
                      ++v51;
                      --v49;
                    }
                    while (v49);
                  }
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)userInfoValues = 138543874;
                    *(void *)&userInfoValues[4] = v62;
                    __int16 v72 = 2112;
                    CFDictionaryRef v73 = MutableCopy;
                    __int16 v74 = 2112;
                    CFStringRef v75 = v45;
                    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "About to send to URL: %{public}@\nHeaders: %@\n%@", userInfoValues, 0x20u);
                  }
                  free(v69);
                  a6 = v65;
                  a5 = v64;
                }
                CFRelease(MutableCopy);
              }
            }
            if (v45) {
              CFRelease(v45);
            }
          }
          if (a5) {
            CFURLRequestSetHTTPRequestBody();
          }
          *(void *)(a1 + 104) = 0;
          *(void *)(a1 + 112) = 0;
          *(void *)(a1 + 120) = 0;
          if (a6) {
            *(void *)(a1 + 104) = CFDataCreateMutable(v70, 0);
          }
          CFDictionaryRef v53 = malloc_type_calloc(1uLL, 0x68uLL, 0x10C0040EDE68F84uLL);
          *(void *)(a1 + 88) = v53;
          *CFDictionaryRef v53 = 1;
          v53[1] = a1;
          v53[10] = _didFailCallback;
          v53[9] = _didFinishLoadingCallback;
          v53[6] = _didReceiveResponseCallback;
          v53[7] = _didReceiveDataCallback;
          uint64_t v54 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          if (!v54) {
            __assert_rtn("MSSPCStartHTTPTransaction", "MSStreamsProtocolCore.m", 285, "properties");
          }
          v55 = v54;
          CFDictionarySetValue(v54, (const void *)*MEMORY[0x1E4F19158], (const void *)*MEMORY[0x1E4F1CFD0]);
          if (a4)
          {
            CFIndex v56 = CFDictionaryGetCount(a4);
            if (v56 >= 1)
            {
              CFIndex v57 = v56;
              size_t v58 = 8 * v56;
              v59 = (const void **)malloc_type_malloc(8 * v56, 0xC0040B8AA526DuLL);
              v60 = (const void **)malloc_type_malloc(v58, 0xC0040B8AA526DuLL);
              CFDictionaryGetKeysAndValues(a4, v59, v60);
              for (uint64_t i = 0; i != v57; ++i)
                CFDictionarySetValue(v55, v59[i], v60[i]);
              free(v59);
              free(v60);
            }
          }
          *(void *)(a1 + 96) = CFURLConnectionCreateWithProperties();
          CFRelease(v55);
          CFRelease(Mutable);
          CFRunLoopGetCurrent();
          CFURLConnectionScheduleWithRunLoop();
          CFURLConnectionStart();
          return;
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_47;
        }
        *(_WORD *)userInfoValues = 0;
        uint64_t v41 = MEMORY[0x1E4F14500];
        CFNumberRef v42 = "Could not format auth string.";
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_47;
        }
        *(_WORD *)userInfoValues = 0;
        uint64_t v41 = MEMORY[0x1E4F14500];
        CFNumberRef v42 = "Could not base64-encode auth string.";
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_WORD *)userInfoValues = 0;
      uint64_t v41 = MEMORY[0x1E4F14500];
      CFNumberRef v42 = "Could not create data representation of auth string.";
    }
    _os_log_error_impl(&dword_1DC434000, v41, OS_LOG_TYPE_ERROR, v42, userInfoValues, 2u);
    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)userInfoValues = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error: No URL provided for HTTP transaction.", userInfoValues, 2u);
  }
  if (*(void *)(a1 + 56))
  {
    CFStringRef v25 = MSCFCopyLocalizedString(@"ERROR_CONNECTION_CORE_NO_URL_ERROR");
    *(void *)userInfoValues = v25;
    userInfoKeys[0] = *(void **)MEMORY[0x1E4F1D170];
    CFErrorRef v26 = CFErrorCreateWithUserInfoKeysAndValues(0, @"streamsProtocolCoreErrorDomain", 4, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, 1);
    (*(void (**)(uint64_t, void, CFErrorRef))(a1 + 56))(a1, 0, v26);
    CFRelease(v25);
    CFRelease(v26);
  }
  CFRelease(Mutable);
}

CFStringRef MSSPCCreateHexStringFromData(const __CFData *a1)
{
  CFIndex Length = CFDataGetLength(a1);
  BytePtr = CFDataGetBytePtr(a1);
  CFErrorRef v4 = (const UInt8 *)malloc_type_malloc((2 * Length) | 1, 0x7525B103uLL);
  if (!v4) {
    __assert_rtn("MSSPCCreateHexStringFromData", "MSStreamsProtocolCore.m", 596, "hex");
  }
  CFStringRef v5 = (UInt8 *)v4;
  CFIndex v6 = 2 * Length;
  CFDictionaryRef v7 = v4;
  if (Length >= 1)
  {
    char v8 = (UInt8 *)v4;
    do
    {
      unsigned int v9 = *BytePtr++;
      UInt8 *v8 = a0123456789abcd[(unint64_t)v9 >> 4];
      CFDictionaryRef v7 = v8 + 2;
      v8[1] = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --Length;
    }
    while (Length);
  }
  const UInt8 *v7 = 0;
  CFStringRef v10 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, v6, 0x600u, 0);
  free(v5);
  return v10;
}

CFStringRef createSHA1StringOfUDID(const __CFString *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buffer = 0;
      _os_log_fault_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unable to create SHA1 string of NULL UDID", buffer, 2u);
    }
    return 0;
  }
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, &createSHA1StringOfUDID__prepend, 3u);
  if (!CFStringGetCString(a1, (char *)buffer, 120, 0x600u)) {
    return 0;
  }
  CC_LONG v2 = strlen((const char *)buffer);
  CC_SHA1_Update(&v7, buffer, v2);
  CC_SHA1_Final(md, &v7);
  CFDataRef v3 = CFDataCreateWithBytesNoCopy(0, md, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (!v3) {
    return 0;
  }
  CFDataRef v4 = v3;
  CFStringRef v5 = MSSPCCreateHexStringFromData(v3);
  CFRelease(v4);
  return v5;
}

void _didReceiveDataCallback(int a1, CFDataRef theData, uint64_t a3, void *a4)
{
  CFIndex v6 = (__CFData *)a4[13];
  if (v6)
  {
    BytePtr = CFDataGetBytePtr(theData);
    CFIndex Length = CFDataGetLength(theData);
    CFDataAppendBytes(v6, BytePtr, Length);
  }
  uint64_t v10 = 0;
  unsigned int v9 = (unsigned int (*)(void *, CFDataRef, uint64_t *))a4[6];
  if (v9)
  {
    if (!v9(a4, theData, &v10))
    {
      a4[15] = v10;
      CFURLConnectionCancel();
      _scheduleTimer(a4);
    }
  }
}

void _scheduleTimer(void *a1)
{
  v6.version = 0;
  memset(&v6.retain, 0, 24);
  v6.info = a1;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerRef v3 = CFRunLoopTimerCreate(v1, Current, 0.0, 0, 0, (CFRunLoopTimerCallBack)__didFinish, &v6);
  if (!v3) {
    __assert_rtn("_scheduleTimer", "MSStreamsProtocolCore.m", 173, "timer");
  }
  CFDataRef v4 = v3;
  CFStringRef v5 = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(v5, v4, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  CFRelease(v4);
}

void __didFinish(uint64_t a1, uint64_t a2)
{
  CFRunLoopTimerRef v3 = *(__CFError **)(a2 + 120);
  if (v3) {
    CFRetain(*(CFTypeRef *)(a2 + 120));
  }
  CFDataRef v4 = *(const void **)(a2 + 104);
  if (v4) {
    CFRetain(*(CFTypeRef *)(a2 + 104));
  }
  __resetContext(a2);
  if (v3
    && (CFErrorDomain Domain = CFErrorGetDomain(v3),
        CFIndex Code = CFErrorGetCode(v3),
        CFEqual(Domain, @"streamsProtocolCoreErrorDomain"))
    && Code == 2)
  {
    CC_SHA1_CTX v7 = *(void (**)(uint64_t, __CFError *))(a2 + 64);
    if (v7) {
      v7(a2, v3);
    }
  }
  else
  {
    char v8 = *(void (**)(uint64_t, const void *, __CFError *))(a2 + 56);
    if (v8) {
      v8(a2, v4, v3);
    }
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

void __resetContext(uint64_t a1)
{
  CC_LONG v2 = *(const void **)(a1 + 96);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 96) = 0;
  }
  CFRunLoopTimerRef v3 = *(const void **)(a1 + 104);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 104) = 0;
  }
  CFDataRef v4 = *(const void **)(a1 + 112);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 112) = 0;
  }
  CFStringRef v5 = *(const void **)(a1 + 120);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 120) = 0;
  }
  free(*(void **)(a1 + 88));
  *(void *)(a1 + 88) = 0;
}

void _didReceiveResponseCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  HTTPResponse = (const void *)CFURLResponseGetHTTPResponse();
  *(void *)(a3 + 112) = HTTPResponse;
  CFRetain(HTTPResponse);
  ResponseStatusCFIndex Code = CFHTTPMessageGetResponseStatusCode(*(CFHTTPMessageRef *)(a3 + 112));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)CFStringRef v28 = ResponseStatusCode;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Received response status: %ld", buf, 0xCu);
  }
  CFDictionaryRef v6 = CFHTTPMessageCopyAllHeaderFields(*(CFHTTPMessageRef *)(a3 + 112));
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)CFStringRef v28 = v7;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Headers: %@", buf, 0xCu);
    }
    value = 0;
    if (CFDictionaryGetValueIfPresent(v7, @"x-apple-mme-streams-config-version", (const void **)&value))
    {
      if (value)
      {
        CFTypeID v8 = CFGetTypeID(value);
        if (v8 == CFStringGetTypeID())
        {
          unsigned int v9 = *(void (**)(uint64_t, void *))(a3 + 72);
          if (v9) {
            v9(a3, value);
          }
        }
      }
    }
    CFTypeRef cf = 0;
    if (!CFDictionaryGetValueIfPresent(v7, @"Retry-After", &cf)) {
      goto LABEL_33;
    }
    if (cf)
    {
      CFTypeID v10 = CFGetTypeID(cf);
      if (v10 == CFStringGetTypeID())
      {
        CFStringRef v11 = (const __CFString *)cf;
        if (!_nonNumericNonSpaceCharacterSet_charSet)
        {
          CFCharacterSetRef v12 = CFCharacterSetCreateWithCharactersInString(0, @"0123456789 ");
          if (v12)
          {
            CFCharacterSetRef v13 = v12;
            _nonNumericNonSpaceCharacterSet_charSet = (uint64_t)CFCharacterSetCreateInvertedSet(0, v12);
            CFRelease(v13);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not create character set for date matching.", buf, 2u);
          }
        }
        CFCharacterSetRef v14 = (const __CFCharacterSet *)_nonNumericNonSpaceCharacterSet_charSet;
        v30.length = CFStringGetLength((CFStringRef)cf);
        v30.location = 0;
        if (CFStringFindCharacterFromSet(v11, v14, v30, 0, 0))
        {
          if (_retryAfterDateFormatter_once != -1) {
            dispatch_once_f(&_retryAfterDateFormatter_once, &_retryAfterDateFormatter_df, (dispatch_function_t)_dateFormatter);
          }
          CFDateRef DateFromString = CFDateFormatterCreateDateFromString(0, (CFDateFormatterRef)_retryAfterDateFormatter_df, (CFStringRef)cf, 0);
          if (DateFromString)
          {
            CFDateRef v16 = DateFromString;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)CFStringRef v28 = cf;
              *(_WORD *)&v28[8] = 2114;
              *(void *)&v28[10] = v16;
              CFDictionaryRef v17 = MEMORY[0x1E4F14500];
              CFDictionaryRef v18 = "Found a retry-after header with an date string: %{public}@. Date: %{public}@";
              uint32_t v19 = 22;
LABEL_36:
              _os_log_debug_impl(&dword_1DC434000, v17, OS_LOG_TYPE_DEBUG, v18, buf, v19);
              goto LABEL_28;
            }
            goto LABEL_28;
          }
        }
        IntCFDataRef Value = CFStringGetIntValue((CFStringRef)cf);
        if (IntValue >= 1)
        {
          int v21 = IntValue;
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFDateRef v23 = CFDateCreate(0, Current + (double)v21);
          if (v23)
          {
            CFDateRef v16 = v23;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)CFStringRef v28 = v21;
              *(_WORD *)&v28[4] = 2114;
              *(void *)&v28[6] = v16;
              CFDictionaryRef v17 = MEMORY[0x1E4F14500];
              CFDictionaryRef v18 = "Found a retry-after header with a relative interval of %d seconds. Date: %{public}@";
              uint32_t v19 = 18;
              goto LABEL_36;
            }
LABEL_28:
            char v24 = *(void (**)(uint64_t, CFDateRef))(a3 + 80);
            if (v24) {
              v24(a3, v16);
            }
            CFRelease(v16);
LABEL_33:
            CFRelease(v7);
            return;
          }
        }
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)CFStringRef v28 = cf;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Found a retry-after header that could not be parsed: %{public}@", buf, 0xCu);
    }
    goto LABEL_33;
  }
}

void _dateFormatter(__CFDateFormatter **a1)
{
  CC_LONG v2 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (v2)
  {
    CFRunLoopTimerRef v3 = v2;
    CFDateFormatterSetProperty(v2, (CFStringRef)*MEMORY[0x1E4F1D088], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
    *a1 = v3;
  }
}

void _didFinishLoadingCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  ResponseStatusCFIndex Code = CFHTTPMessageGetResponseStatusCode(*(CFHTTPMessageRef *)(a2 + 112));
  CFIndex valuePtr = ResponseStatusCode;
  CFDataRef v4 = *(const __CFData **)(a2 + 104);
  if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    BytePtr = CFDataGetBytePtr(v4);
    CFIndex Length = CFDataGetLength(*(CFDataRef *)(a2 + 104));
    CFStringRef v8 = CFStringCreateWithBytes(v5, BytePtr, Length, 0x8000100u, 0);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = (uint64_t)v8;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Received response: %@", buf, 0xCu);
    }
    CFRelease(v8);
  }
  if (ResponseStatusCode > 400)
  {
    if (ResponseStatusCode != 401)
    {
      if (ResponseStatusCode == 403)
      {
        int v15 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_CONNECTION_CORE_FORBIDDEN_ERROR");
        userInfoKeys = (void *)*MEMORY[0x1E4F1D170];
        userInfoValues = v15;
        CFErrorRef v16 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"streamsProtocolCoreErrorDomain", 3, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
        CFRelease(v15);
        *(void *)(a2 + 120) = v16;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v32 = 403;
        CFStringRef v11 = MEMORY[0x1E4F14500];
        CFCharacterSetRef v12 = "Transaction forbidden. Code: %ld.";
      }
      else
      {
        if (ResponseStatusCode != 500) {
          goto LABEL_22;
        }
        unsigned int v9 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_CONNECTION_CORE_FAILED_SERVER_ERROR");
        userInfoKeys = (void *)*MEMORY[0x1E4F1D170];
        userInfoValues = v9;
        CFErrorRef v10 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"streamsProtocolCoreErrorDomain", 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
        CFRelease(v9);
        *(void *)(a2 + 120) = v10;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v32 = 500;
        CFStringRef v11 = MEMORY[0x1E4F14500];
        CFCharacterSetRef v12 = "Transaction failed. A server error has been reported. Code: %ld.";
      }
LABEL_24:
      _os_log_error_impl(&dword_1DC434000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
      goto LABEL_25;
    }
LABEL_18:
    CFCharacterSetRef v13 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_CONNECTION_CORE_AUTH_FAILED_ERROR");
    userInfoKeys = (void *)*MEMORY[0x1E4F1D170];
    userInfoValues = v13;
    CFErrorRef v14 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"streamsProtocolCoreErrorDomain", 2, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(v13);
    *(void *)(a2 + 120) = v14;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = ResponseStatusCode;
    CFStringRef v11 = MEMORY[0x1E4F14500];
    CFCharacterSetRef v12 = "Authentication failed. Code: %ld.";
    goto LABEL_24;
  }
  if (ResponseStatusCode == 200 || ResponseStatusCode == 207)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = ResponseStatusCode;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Transaction completed. Code: %ld.", buf, 0xCu);
    }
    goto LABEL_25;
  }
  if (ResponseStatusCode == 330) {
    goto LABEL_18;
  }
LABEL_22:
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNumberRef v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCFIndexType, &valuePtr);
  CFErrorRef v26 = (__CFString *)MSCFCreateLocalizedFormat(@"ERROR_CONNECTION_CORE_FATAL_P_RESPONSE", v19, v20, v21, v22, v23, v24, v25, (char)v18);
  CFRelease(v18);
  userInfoValues = v26;
  userInfoKeys = (void *)*MEMORY[0x1E4F1D170];
  CFErrorRef v27 = CFErrorCreateWithUserInfoKeysAndValues(v17, @"streamsProtocolCoreErrorDomain", 1, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
  CFRelease(v26);
  *(void *)(a2 + 120) = v27;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = (uint64_t)v27;
    CFStringRef v11 = MEMORY[0x1E4F14500];
    CFCharacterSetRef v12 = "Transaction failed. Error: %{public}@";
    goto LABEL_24;
  }
LABEL_25:
  _scheduleTimer((void *)a2);
}

void _didFailCallback(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    CFDictionaryRef v6 = a2;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Connection failed. Error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  a3[15] = a2;
  if (a2) {
    CFRetain(a2);
  }
  _scheduleTimer(a3);
}

void MSSPCCancelHTTPTransaction(uint64_t a1)
{
  if (*(void *)(a1 + 96))
  {
    CFRunLoopGetCurrent();
    CFURLConnectionUnscheduleFromRunLoop();
    CFURLConnectionCancel();
    __resetContext(a1);
  }
}

__CFData *MSSPCCreateDataFromHexString(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
  if (!Mutable)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MSSPCCreateDataFromHexString Could not create data object.", buf, 2u);
    }
    return 0;
  }
  CFRunLoopTimerRef v3 = Mutable;
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = Length;
  if (Length) {
    __assert_rtn("MSSPCCreateDataFromHexString", "MSStreamsProtocolCore.m", 631, "(length & 1) == 0");
  }
  UInt8 bytes = 0;
  if (Length >= 1)
  {
    CFIndex v6 = 0;
    int v7 = 1;
    do
    {
      int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
      char v9 = CharacterAtIndex - 48;
      if ((CharacterAtIndex - 65) <= 5) {
        char v10 = CharacterAtIndex - 55;
      }
      else {
        char v10 = 0;
      }
      if ((CharacterAtIndex - 97) <= 5) {
        char v11 = CharacterAtIndex - 87;
      }
      else {
        char v11 = v10;
      }
      if ((unsigned __int16)(CharacterAtIndex - 48) > 9u) {
        char v9 = v11;
      }
      if (v7)
      {
        UInt8 bytes = 16 * v9;
      }
      else
      {
        bytes |= v9;
        CFDataAppendBytes(v3, &bytes, 1);
      }
      v7 ^= 1u;
      ++v6;
    }
    while (v5 != v6);
  }
  return v3;
}

uint64_t MSShouldLogAtLevel(uint64_t a1)
{
  CC_LONG v2 = MSPlatform();
  uint64_t v3 = [v2 shouldLogAtLevel:a1];

  return v3;
}

void MSLog(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  CFCharacterSetRef v12 = MSPlatform();
  [v12 logFacility:a1 level:a2 format:v11 args:&a9];
}

void MSLogFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v15 = MSPlatform();
  [v15 logFile:a1 func:a2 line:a3 facility:a4 level:a5 format:a6 args:&a9];
}

void sub_1DC45BF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__2001(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2002(uint64_t a1)
{
}

void sub_1DC45C2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFErrorRef MSPCUCreateError(const __CFString *a1, CFIndex a2, CFStringRef key, ...)
{
  va_start(va, key);
  userInfoValues[1] = *(void **)MEMORY[0x1E4F143B8];
  CFStringRef v5 = MSCFCopyLocalizedString(key);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v7 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v5, va);
  CFRelease(v5);
  userInfoValues[0] = (void *)v7;
  userInfoKeys = (void *)*MEMORY[0x1E4F1D170];
  CFErrorRef v8 = CFErrorCreateWithUserInfoKeysAndValues(v6, a1, a2, (const void *const *)&userInfoKeys, (const void *const *)userInfoValues, 1);
  CFRelease(v7);
  return v8;
}

CFStringRef MSPCUCreateBase64StringFromData(const __CFData *a1)
{
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v3 = 4 * (Length / 3);
  CFIndex v4 = v3 + 4 * (Length % 3 > 0);
  if (v4 < Length) {
    __assert_rtn("MSPCUCreateBase64StringFromData", "MSProtocolCoreUtilities.m", 43, "encodedLength >= length");
  }
  uint64_t v5 = Length;
  CFAllocatorRef v6 = (UInt8 *)malloc_type_malloc(v3 + 4 * (Length % 3 > 0), 0xC33B896AuLL);
  if (!v6) {
    __assert_rtn("MSPCUCreateBase64StringFromData", "MSProtocolCoreUtilities.m", 46, "destBuf");
  }
  CFStringRef v7 = v6;
  BytePtr = CFDataGetBytePtr(a1);
  if (v5 < 1) {
    goto LABEL_19;
  }
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  id v11 = BytePtr - 1;
  uint64_t v12 = v5;
  do
  {
    unint64_t v13 = v10 % 3;
    if (v10 % 3 == 2)
    {
      uint64_t v15 = v9 + 1;
      v7[v9] = MSPCUCreateBase64StringFromData_DataEncodeTable[((unint64_t)(v11[1] | (*v11 << 8)) >> 6) & 0x3F];
      unint64_t v14 = v11[1] & 0x3F;
      uint64_t v16 = 2;
    }
    else
    {
      if (v13 == 1)
      {
        unint64_t v14 = ((unint64_t)(v11[1] | (*v11 << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v13) {
          goto LABEL_13;
        }
        unint64_t v14 = (unint64_t)v11[1] >> 2;
      }
      uint64_t v16 = 1;
      uint64_t v15 = v9;
    }
    v9 += v16;
    v7[v15] = MSPCUCreateBase64StringFromData_DataEncodeTable[v14];
LABEL_13:
    ++v10;
    ++v11;
    --v12;
  }
  while (v12);
  if (v5 % 3uLL == 2)
  {
    char v18 = MSPCUCreateBase64StringFromData_DataEncodeTable[4 * (*v11 & 0xF)];
    uint64_t v19 = 1;
    uint64_t v17 = v9;
LABEL_18:
    v7[v17] = v18;
    v7[v9 + v19] = 61;
  }
  else if (v5 % 3uLL == 1)
  {
    uint64_t v17 = v9 + 1;
    v7[v9] = MSPCUCreateBase64StringFromData_DataEncodeTable[16 * (*v11 & 3)];
    char v18 = 61;
    uint64_t v19 = 2;
    goto LABEL_18;
  }
LABEL_19:
  CFStringRef v20 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, v4, 0x600u, 0);
  free(v7);
  return v20;
}

uint64_t MSPCUNumberFormatterWithSystemLocale()
{
  if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
    dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
  }
  return MSPCUNumberFormatterWithSystemLocale_nf;
}

CFNumberFormatterRef __MSPCUNumberFormatterWithSystemLocale_block_invoke()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFLocaleRef System = CFLocaleGetSystem();
  CFNumberFormatterRef result = CFNumberFormatterCreate(v0, System, kCFNumberFormatterDecimalStyle);
  MSPCUNumberFormatterWithSystemLocale_nf = (uint64_t)result;
  return result;
}

uint64_t MSPCUCreateDataFromHexString(const __CFString *a1, uint64_t a2, __CFData **a3, void *a4, uint64_t (*a5)(uint64_t))
{
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v9 = Length;
  if (Length >= 0) {
    uint64_t v10 = Length;
  }
  else {
    uint64_t v10 = Length + 1;
  }
  CFIndex v11 = v10 >> 1;
  uint64_t v12 = (UInt8 *)malloc_type_malloc(v10 >> 1, 0x86C2760FuLL);
  unint64_t v13 = (char *)malloc_type_malloc(v9 + 1, 0x599E8A94uLL);
  if (!CFStringGetCString(a1, v13, v9 + 1, 0x600u))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not parse file hash.", buf, 2u);
      if (a4) {
        goto LABEL_15;
      }
      goto LABEL_17;
    }
LABEL_14:
    if (a4)
    {
LABEL_15:
      uint64_t v22 = 0;
      *a4 = a5(a2);
      goto LABEL_18;
    }
LABEL_17:
    uint64_t v22 = 0;
    goto LABEL_18;
  }
  if (v9 >= 2)
  {
    uint64_t v14 = 0;
    uint64_t v15 = v12;
    do
    {
      __darwin_ct_rune_t v16 = __tolower(v13[v14]);
      uint64_t v17 = memchr("0123456789abcdef", v16, 0x11uLL);
      if (!v17) {
        goto LABEL_14;
      }
      char v18 = (char)v17;
      __darwin_ct_rune_t v19 = __tolower(v13[v14 + 1]);
      CFStringRef v20 = memchr("0123456789abcdef", v19, 0x11uLL);
      if (!v20) {
        goto LABEL_14;
      }
      *v15++ = ((_BYTE)v20 - "0123456789abcdef") | (16 * (v18 - "0123456789abcdef"));
      v14 += 2;
    }
    while (v14 < v9 - 1);
  }
  if (a3)
  {
    CFMutableDataRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11);
    CFDataAppendBytes(Mutable, v12, v11);
    *a3 = Mutable;
  }
  uint64_t v22 = 1;
LABEL_18:
  free(v12);
  free(v13);
  return v22;
}

uint64_t MPSStateRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  CFIndex v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    CFStringRef v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_26;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_26;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_26;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_26;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_26:
          CFStringRef v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 6u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 56) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_37;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          uint64_t v23 = 0;
          goto LABEL_39;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_39:
      *(void *)(a1 + 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id MSMMCSHashForFD(int a1, void *a2)
{
  id v3 = a2;
  CFIndex v4 = malloc_type_malloc(0x20000uLL, 0x6BF6B9DAuLL);
  lseek(a1, 0, 0);
  for (uint64_t i = MMCSSignatureGeneratorCreate(); ; MEMORY[0x1E019E020](i, v4, v6, 1))
  {
    ssize_t v6 = read(a1, v4, 0x20000uLL);
    if (!v6) {
      break;
    }
    if (v6 == -1)
    {
      perror("Failed to read file for hashing.");
      if (v4) {
        free(v4);
      }
      MMCSSignatureGeneratorFinish();
      char v8 = 0;
      goto LABEL_8;
    }
  }
  if (v4) {
    free(v4);
  }
  uint64_t v7 = MMCSSignatureGeneratorFinish();
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v7 length:MEMORY[0x1E019DFF0](v7) freeWhenDone:1];
LABEL_8:

  return v8;
}

uint64_t _didFailAuthentication_2250(id *a1, uint64_t a2)
{
  return [*a1 _didFailAuthenticationWithError:a2];
}

uint64_t _didFinish_2251(id *a1, uint64_t a2, uint64_t a3)
{
  return [*a1 _didFinishWithResponse:a2 error:a3];
}

void MSSSCPCQueryConfiguration(void *a1, uint64_t a2, const __CFDictionary *a3)
{
  a1[6] = 0;
  a1[7] = _didFinish_2264;
  a1[8] = _didFailAuthentication_2263;
  CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  MSSPCStartHTTPTransaction((uint64_t)a1, @"GET", a2, a3, v6, 1, 0);
  CFRelease(v6);
}

uint64_t _didFailAuthentication_2263(uint64_t result)
{
  CFAllocatorRef v1 = *(uint64_t (**)(void))(result + 136);
  if (v1) {
    return v1();
  }
  return result;
}

void _didFinish_2264(uint64_t a1, CFDataRef theData, CFTypeRef cf)
{
  CFTypeRef cfa = cf;
  if (cf)
  {
    CFRetain(cf);
LABEL_3:
    CFDataRef v4 = 0;
    goto LABEL_4;
  }
  CFDataRef v4 = theData;
  if (theData)
  {
    if (!CFDataGetLength(theData)) {
      goto LABEL_3;
    }
    CFDataRef v5 = (const __CFData *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, 0, 0, (CFErrorRef *)&cfa);
    CFDataRef v4 = v5;
    if (v5)
    {
      CFTypeID v6 = CFGetTypeID(v5);
      if (v6 != CFDictionaryGetTypeID())
      {
        CFRelease(v4);
        CFDataRef v4 = 0;
        CFTypeRef cfa = MSPCUCreateError(@"MSServerSideConfigCoreErrorDomain", 0, @"SERVER_CONFIG_INVALID");
      }
    }
  }
LABEL_4:
  (*(void (**)(uint64_t, const __CFData *, CFTypeRef))(a1 + 128))(a1, v4, cfa);
  if (v4) {
    CFRelease(v4);
  }
  if (cfa) {
    CFRelease(cfa);
  }
}

void MSRSPCResetServerStateAsync(void *a1, uint64_t a2, const __CFDictionary *a3)
{
  a1[6] = 0;
  a1[7] = _didFinish_2484;
  a1[8] = _didFailAuthentication_2483;
  a1[9] = _didReceiveServerSideConfigurationVersion_2482;
  MSSPCStartHTTPTransaction((uint64_t)a1, @"POST", a2, a3, 0, 0, 0);
}

uint64_t _didReceiveServerSideConfigurationVersion_2482(uint64_t result)
{
  CFAllocatorRef v1 = *(uint64_t (**)(void))(result + 144);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didFailAuthentication_2483(uint64_t result)
{
  CFAllocatorRef v1 = *(uint64_t (**)(void))(result + 136);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didFinish_2484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a3;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Can't reset server state. Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 128))(a1, a3);
}

uint64_t _protocolDidReceiveServerSideConfigurationVersion_2559(id *a1, uint64_t a2)
{
  return [*a1 _didFindServerSideConfigurationVersion:a2];
}

uint64_t _protocolDidFailAuthentication_2560(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidFailAuthenticationError:a2];
}

uint64_t _protocolDidFinish_2561(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidFinishError:a2];
}

void MSRPCReauthorizeAsync(void *a1, uint64_t a2, const __CFDictionary *a3, const void *a4, const void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  a1[6] = 0;
  a1[7] = _didFinish_2670;
  a1[8] = _didFailAuthentication_2669;
  a1[10] = _didReceiveRetryAfter_2668;
  a1[9] = _didReceiveServerSideConfigurationVersion_2667;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    __assert_rtn("MSRPCReauthorizeAsync", "MSReauthorizeProtocolCore.m", 35, "messageDict");
  }
  unint64_t v12 = Mutable;
  CFDictionaryAddValue(Mutable, a4, a5);
  CFErrorRef error = 0;
  CFDataRef v13 = CFPropertyListCreateData(v10, v12, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (v13)
  {
    CFDataRef v14 = v13;
    CFRelease(v12);
    MSSPCStartHTTPTransaction((uint64_t)a1, @"POST", a2, a3, v14, 1, 0);
    CFRelease(v14);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v17 = error;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize reauthorize data: %{public}@", buf, 0xCu);
    }
    if (error) {
      CFRelease(error);
    }
    CFRelease(v12);
    MSSPCStartHTTPTransaction((uint64_t)a1, @"POST", a2, a3, 0, 1, 0);
  }
}

uint64_t _didReceiveServerSideConfigurationVersion_2667(uint64_t result)
{
  CFAllocatorRef v1 = *(uint64_t (**)(void))(result + 152);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didReceiveRetryAfter_2668(uint64_t result)
{
  CFAllocatorRef v1 = *(uint64_t (**)(void))(result + 144);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didFailAuthentication_2669(uint64_t result)
{
  CFAllocatorRef v1 = *(uint64_t (**)(void))(result + 136);
  if (v1) {
    return v1();
  }
  return result;
}

void _didFinish_2670(uint64_t a1, CFDataRef theData, __CFError *a3)
{
  CFErrorRef error = a3;
  if (theData && !a3 && CFDataGetLength(theData))
  {
    CFPropertyListRef v6 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theData, 0, 0, &error);
    (*(void (**)(uint64_t, CFPropertyListRef, CFErrorRef))(a1 + 128))(a1, v6, error);
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    uint64_t v7 = *(void (**)(uint64_t, void, __CFError *))(a1 + 128);
    v7(a1, 0, a3);
  }
}

uint64_t _protocolDidReceiveServerSideConfigurationVersion_2704(id *a1, uint64_t a2)
{
  return [*a1 _didFindServerSideConfigurationVersion:a2];
}

uint64_t _protocolDidReceiveRetryAfterDate_2705(id *a1, uint64_t a2)
{
  return [*a1 _didReceiveRetryAfterDate:a2];
}

uint64_t _protocolDidFailAuthentication_2706(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidFailAuthenticationError:a2];
}

uint64_t _protocolDidFinish_2707(id *a1, uint64_t a2, uint64_t a3)
{
  return [*a1 _coreProtocolDidFinishResponse:a2 error:a3];
}

void sub_1DC464368(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _commitMasterManifest_3247()
{
  CFAllocatorRef v0 = [(id)_internalMasterManifest objectForKey:@"nextActivityDateByPersonID"];
  uint64_t v1 = [v0 count];

  if (v1)
  {
    CC_LONG v2 = (void *)_internalMasterManifest;
    MSPathDeleteMasterManifest();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v3 = MSPathDeleteMasterManifest();
    [v4 removeItemAtPath:v3 error:0];
  }
}

id _masterNextActivityDateByPersonID_3272()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v0 = (void *)_internalMasterManifest;
  if (!_internalMasterManifest)
  {
    uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
    CC_LONG v2 = MSPathDeleteDir();
    [v1 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];

    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v4 = MSPathDeleteMasterManifest();
    int v5 = [v3 fileExistsAtPath:v4];

    if (v5)
    {
      CFPropertyListRef v6 = (void *)MEMORY[0x1E4F28F98];
      uint64_t v7 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v8 = MSPathDeleteMasterManifest();
      unsigned int v9 = [v7 dataWithContentsOfFile:v8];
      id v18 = 0;
      uint64_t v10 = [v6 propertyListWithData:v9 options:1 format:0 error:&v18];
      id v11 = v18;
      unint64_t v12 = (void *)_internalMasterManifest;
      _internalMasterManifest = v10;

      if (!_internalMasterManifest && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v11;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to deserialize delete master manifest: %{public}@", buf, 0xCu);
      }
    }
    CFAllocatorRef v0 = (void *)_internalMasterManifest;
    if (!_internalMasterManifest)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CFDataRef v14 = (void *)_internalMasterManifest;
      _internalMasterManifest = (uint64_t)v13;

      CFAllocatorRef v0 = (void *)_internalMasterManifest;
    }
  }
  id v15 = v0;
  __darwin_ct_rune_t v16 = [v15 objectForKey:@"nextActivityDateByPersonID"];
  if (!v16)
  {
    __darwin_ct_rune_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [v15 setObject:v16 forKey:@"nextActivityDateByPersonID"];
  }

  return v16;
}

uint64_t _protocolDidReceiveServerSideConfigurationVersion_3356(id *a1, uint64_t a2)
{
  return [*a1 _didFindServerSideConfigurationVersion:a2];
}

uint64_t _protocolDidReceiveRetryAfterDate_3357(id *a1, uint64_t a2)
{
  return [*a1 _didReceiveRetryAfterDate:a2];
}

uint64_t _protocolDidFailAuthentication_3358(id *a1, uint64_t a2)
{
  return [*a1 _coreProtocolDidFailAuthenticationError:a2];
}

uint64_t _protocolDidFinish_3359(id *a1, uint64_t a2, uint64_t a3)
{
  return [*a1 _coreProtocolDidFinishResponse:a2 error:a3];
}

void MSDSPCSendDeletionRequestAsync(void *a1, uint64_t a2, const __CFDictionary *a3, const __CFArray *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  a1[7] = _didFinish_3405;
  a1[8] = _didFailAuthentication_3404;
  a1[10] = _didReceiveRetryAfter_3403;
  a1[9] = _didReceiveServerSideConfigurationVersion_3402;
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  if (!Mutable) {
    __assert_rtn("MSDSPCSendDeletionRequestAsync", "MSDeleteStreamsProtocolCore.m", 40, "messageDeleteArray");
  }
  unsigned int v9 = Mutable;
  uint64_t v23 = (uint64_t)a1;
  CFDictionaryRef v24 = a3;
  CFIndex Count = CFArrayGetCount(a4);
  if (Count >= 1)
  {
    CFIndex v11 = Count;
    CFIndex v12 = 0;
    id v13 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    CFDataRef v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a4, v12);
      CFMutableDictionaryRef v16 = CFDictionaryCreateMutable(0, 0, v13, v14);
      if (v16)
      {
        CFErrorRef v17 = v16;
        value = 0;
        CFDictionaryGetValueIfPresent(ValueAtIndex, @"fileHash", (const void **)&value);
        if (value)
        {
          CFStringRef v18 = MSSPCCreateHexStringFromData((const __CFData *)value);
          if (v18)
          {
            CFStringRef v19 = v18;
            CFDictionarySetValue(v17, @"checksum", v18);
            CFRelease(v19);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            CFErrorRef v27 = value;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot convert file hash %{public}@ to string.", buf, 0xCu);
          }
        }
        if (CFDictionaryContainsKey(ValueAtIndex, @"UUID"))
        {
          id v20 = CFDictionaryGetValue(ValueAtIndex, @"UUID");
          CFDictionarySetValue(v17, @"assetcollid", v20);
        }
        CFArrayAppendValue(v9, v17);
        CFRelease(v17);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot create dictionary.", buf, 2u);
      }
      ++v12;
    }
    while (v11 != v12);
  }
  value = 0;
  CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, kCFPropertyListXMLFormat_v1_0, 0, (CFErrorRef *)&value);
  if (Data)
  {
    CFDataRef v22 = Data;
    CFRelease(v9);
    MSSPCStartHTTPTransaction(v23, @"POST", a2, v24, v22, 1, 0);
    CFRelease(v22);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFErrorRef v27 = value;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize delete request data: %{public}@", buf, 0xCu);
    }
    if (value) {
      CFRelease(value);
    }
    CFRelease(v9);
    MSSPCStartHTTPTransaction(v23, @"POST", a2, v24, 0, 1, 0);
  }
}

uint64_t _didReceiveServerSideConfigurationVersion_3402(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 144);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didReceiveRetryAfter_3403(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 152);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t _didFailAuthentication_3404(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 136);
  if (v1) {
    return v1();
  }
  return result;
}

void _didFinish_3405(uint64_t a1, CFDataRef theData, __CFError *a3)
{
  CFErrorRef error = a3;
  if (theData && CFDataGetLength(theData))
  {
    CFPropertyListRef v4 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theData, 0, 0, &error);
    int v5 = v4;
    if (!v4) {
      goto LABEL_7;
    }
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFArrayGetTypeID()) {
      goto LABEL_7;
    }
    CFRelease(v5);
  }
  int v5 = 0;
LABEL_7:
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  if (Mutable) {
    BOOL v8 = error == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)v5);
    if (Count <= 0)
    {
      (*(void (**)(uint64_t, __CFArray *, CFErrorRef))(a1 + 128))(a1, Mutable, error);
      goto LABEL_45;
    }
    CFIndex v10 = Count;
    CFIndex v11 = 0;
    CFIndex v12 = @"checksum";
    id v13 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    CFDataRef v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    unsigned int v31 = (const void *)*MEMORY[0x1E4F1CFC8];
    uint64_t v32 = (const void *)*MEMORY[0x1E4F1CFD0];
    while (1)
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v5, v11);
      CFTypeID v16 = CFGetTypeID(ValueAtIndex);
      if (v16 != CFDictionaryGetTypeID()) {
        break;
      }
      CFMutableDictionaryRef v17 = CFDictionaryCreateMutable(0, 0, v13, v14);
      if (v17)
      {
        CFStringRef v18 = v17;
        if (!CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, v12)) {
          goto LABEL_20;
        }
        CFStringRef v19 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v12);
        value = 0;
        MSPCUCreateDataFromHexString(v19, (uint64_t)v12, (__CFData **)&value, &error, (uint64_t (*)(uint64_t))_createBadFieldError_3411);
        if (!error)
        {
          if (value)
          {
            CFDictionarySetValue(v18, @"fileHash", value);
            CFRelease(value);
          }
LABEL_20:
          if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, @"assetcollid"))
          {
            uint64_t v33 = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"assetcollid");
            id v20 = v5;
            CFIndex v21 = v10;
            CFDataRef v22 = Mutable;
            uint64_t v23 = v12;
            CFDictionaryRef v24 = v14;
            unint64_t v25 = v13;
            CFTypeID v26 = CFGetTypeID(v33);
            BOOL v8 = v26 == CFStringGetTypeID();
            id v13 = v25;
            CFDataRef v14 = v24;
            CFIndex v12 = v23;
            CFMutableArrayRef Mutable = v22;
            CFIndex v10 = v21;
            int v5 = v20;
            if (v8) {
              CFDictionarySetValue(v18, @"UUID", v33);
            }
          }
          value = 0;
          CFDictionaryGetValueIfPresent((CFDictionaryRef)ValueAtIndex, @"success", (const void **)&value);
          if (value)
          {
            CFTypeID v27 = CFGetTypeID(value);
            if (v27 == CFStringGetTypeID())
            {
              if (MSPCUNumberFormatterWithSystemLocale_once != -1) {
                dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_2113);
              }
              CFNumberRef NumberFromString = CFNumberFormatterCreateNumberFromString(0, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, (CFStringRef)value, 0, 0);
              if (NumberFromString)
              {
                CFNumberRef v29 = NumberFromString;
                int valuePtr = 0;
                CFNumberGetValue(NumberFromString, kCFNumberIntType, &valuePtr);
                if (valuePtr) {
                  CFRange v30 = v32;
                }
                else {
                  CFRange v30 = v31;
                }
                CFDictionarySetValue(v18, @"deleteResult", v30);
                CFRelease(v29);
              }
            }
          }
          CFArrayAppendValue(Mutable, v18);
        }
        CFRelease(v18);
        if (error) {
          goto LABEL_40;
        }
        if (++v11 >= v10) {
          goto LABEL_40;
        }
      }
      else
      {
LABEL_39:
        if (++v11 >= v10) {
          goto LABEL_40;
        }
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LOWORD(value) = 0;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Response array element is not a dictionary.", (uint8_t *)&value, 2u);
    }
    goto LABEL_39;
  }
LABEL_40:
  (*(void (**)(uint64_t, __CFArray *))(a1 + 128))(a1, Mutable);
  if (!Mutable)
  {
    if (!v5) {
      return;
    }
    goto LABEL_42;
  }
LABEL_45:
  CFRelease(Mutable);
  if (!v5) {
    return;
  }
LABEL_42:
  CFRelease(v5);
}

CFErrorRef _createBadFieldError_3411(uint64_t a1)
{
  return MSPCUCreateError(@"MSDeleteStreamsProtocolCoreErrorDomain", 0, @"ERROR_DELETE_CORE_BAD_FIELD_P_FIELD", a1);
}

id _copyAssetsIntoAssetCollection(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = +[MSAsset assetWithAsset:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        [v13 setAssetCollectionGUID:v7];
        CFDataRef v14 = [v6 metadata];
        id v15 = [v14 objectForKey:@"batchDateCreated"];
        [v13 setBatchCreationDate:v15];

        CFTypeID v16 = [v6 metadata];
        CFMutableDictionaryRef v17 = [v16 objectForKey:@"dateCreated"];
        [v13 setPhotoCreationDate:v17];

        [v8 addObject:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v8;
}

void sub_1DC46C248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3882(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3883(uint64_t a1)
{
}

void sub_1DC46C7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC46CBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC46CEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC46D918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC47217C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4725E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC47280C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MSASInitialize(id obj)
{
  objc_storeStrong((id *)&_thePlatform, obj);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "MSASPlatform initialized.", v1, 2u);
  }
}

id MSASPlatform()
{
  CFAllocatorRef v0 = (void *)_thePlatform;
  if (!_thePlatform) {
    __assert_rtn("MSASPlatform", "MSASPlatform.m", 22, "_thePlatform");
  }
  return v0;
}

uint64_t MSASPlatformIsDebugLoggingEnabled()
{
  uint64_t result = _thePlatform;
  if (_thePlatform) {
    return [(id)_thePlatform shouldLogAtLevel:7];
  }
  return result;
}

void sub_1DC474D14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1DC475B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_1DC4774D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1DC477944(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC477C88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC4784C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1DC478AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC478F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC479AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 160));
  _Unwind_Resume(a1);
}

void sub_1DC47A99C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1DC47AFEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC47B8BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1DC47BFA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC47C81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC47CFA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC47D63C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1DC47E510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(a9);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1DC47EBCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC47F4C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1DC480580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
}

void sub_1DC482E34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1DC4833AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC4839E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1DC483FB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC484798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 160));
  _Unwind_Resume(a1);
}

void sub_1DC484DE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC485628(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1DC485CC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC48647C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1DC4869D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC487130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v34 - 160));
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4547(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4548(uint64_t a1)
{
}

void sub_1DC487FB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1DC488CF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1DC4891CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC489BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 128));
  _Unwind_Resume(a1);
}

void sub_1DC48A3C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC48A668(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC48B050(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1DC48B770(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC48C390(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1DC48C750(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC48CE7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1DC48D274(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC48D9C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1DC48DF38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC48E5AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1DC48EB04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC48F2B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1DC48F874(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC4904AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v34 - 112));
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1DC491068(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC491A70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1DC4924A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DC495718(_Unwind_Exception *exception_object)
{
}

void sub_1DC495A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC495EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4964AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DC49675C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DC49749C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4975CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC499BF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DC49AA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 128));
  _Unwind_Resume(a1);
}

void sub_1DC49B350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49B498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49B620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49BD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4868(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4869(uint64_t a1)
{
}

void sub_1DC49C2B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49C5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49C6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49D500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49D8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49DE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49E3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49E4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49EC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49FB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49FC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC49FF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4A0E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 216), 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1DC4A3AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5139(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5140(uint64_t a1)
{
}

void sub_1DC4A3EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4A56E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5291(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5292(uint64_t a1)
{
}

void sub_1DC4A597C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4A5AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4A6BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _pointerComparisonCallback_5341(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t __Block_byref_object_copy__5529(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5530(uint64_t a1)
{
}

void sub_1DC4A92F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _requestCompletedCallback_5607(void *a1)
{
  id v1 = a1;
  id v2 = [v1 engine];
  [v2 _requestCompletedRequestorContext:v1];
}

void _putItemDoneCallback_5608(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = a1;
  id v9 = [v8 engine];
  [v9 _putItemDoneItemID:a2 requestorContext:v8 putReceipt:a4 error:a5];
}

void _putItemProgressCallback_5609(void *a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v11 = a1;
  id v12 = [v11 engine];
  [v12 _putItemProgressItemID:a2 state:a5 progress:v11 requestorContext:a7 error:a3];
}

void _getItemDoneCallback_5610(void *a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  id v10 = a1;
  if (a4)
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    a4 = [v8 stringWithFileSystemRepresentation:a4 length:strlen(a4)];
  }
  id v9 = [v10 engine];
  [v9 _getItemDoneItemID:a2 path:a4 requestorContext:v10 error:a5];
}

void _getItemProgressCallback_5611(void *a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10 = a1;
  id v11 = [v10 engine];
  [v11 _getItemProgressItemID:a2 state:a5 progress:v10 requestorContext:a6 error:a3];
}

uint64_t _getFileDescriptorAndContentTypeFromItemCallback(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v11 = 0;
  id v12 = 0;
  uint64_t v7 = [a1 _getFileDescriptorAndContentTypeFromItemID:a2 outFD:a3 outItemType:&v12 outError:&v11];
  id v8 = v12;
  id v9 = v11;
  if (v7)
  {
    if (a4) {
      *a4 = v8;
    }
    if (a5) {
      *a5 = v9;
    }
  }

  return v7;
}

void sub_1DC4AAE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5670(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5671(uint64_t a1)
{
}

void sub_1DC4AB10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4AB280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4AB3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4AB610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKContainerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  CFAllocatorRef v0 = (void *)getCKContainerClass_softClass;
  uint64_t v7 = getCKContainerClass_softClass;
  if (!getCKContainerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKContainerClass_block_invoke;
    v3[3] = &unk_1E6C3CF00;
    v3[4] = &v4;
    __getCKContainerClass_block_invoke((uint64_t)v3);
    CFAllocatorRef v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DC4B5EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKContainerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __CloudKitLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E6C3CF20;
    uint64_t v8 = 0;
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"MSProtocolUtilities.m", 23, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CKContainer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getCKContainerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"MSProtocolUtilities.m", 24, @"Unable to find class %s", "CKContainer");

LABEL_10:
    __break(1u);
  }
  getCKContainerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary = result;
  return result;
}

void ___retryAfterDateFormatter_block_invoke()
{
  CFAllocatorRef v0 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  _retryAfterDateFormatter_df_6335 = (uint64_t)v0;
  if (v0)
  {
    CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1D088];
    id v2 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDateFormatterSetProperty(v0, v1, v2);
  }
}

void ___nonNumericNonSpaceCharacterSet_block_invoke()
{
  CFCharacterSetRef v0 = CFCharacterSetCreateWithCharactersInString(0, @"0123456789 ");
  if (v0)
  {
    CFCharacterSetRef v1 = v0;
    _nonNumericNonSpaceCharacterSet_charSet_6333 = (uint64_t)CFCharacterSetCreateInvertedSet(0, v0);
    CFRelease(v1);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v2 = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not create character set for date matching.", v2, 2u);
  }
}

id _errorWithException(void *a1)
{
  CFCharacterSetRef v1 = (void *)MEMORY[0x1E4F28C58];
  id v2 = [a1 reason];
  uint64_t v3 = [v1 MSErrorWithDomain:@"MSArchiverUtilitiesErrorDomain" code:0 description:v2];

  return v3;
}

void sub_1DC4B82DC(_Unwind_Exception *a1)
{
}

void sub_1DC4B93F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6799(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6800(uint64_t a1)
{
}

void sub_1DC4BC2BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DC4BE370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4BE524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6923(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6924(uint64_t a1)
{
}

void sub_1DC4BE6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4BE898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4BEA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4C5CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4C5FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4C6AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4C6C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4C6DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4C6F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D0740(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DC4D0E3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DC4D4974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D4C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D5464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D58C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D5D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D6180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D65E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D6A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D6C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D6EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D70BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D7334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D750C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D7BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D7DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D7F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D8124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D8324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D8594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D882C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D8A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D8BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4D8D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4DA8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DC4DABCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MSLogSqliteError(sqlite3 *a1, uint64_t a2, int a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543874;
    uint64_t v7 = a2;
    __int16 v8 = 1024;
    int v9 = a3;
    __int16 v10 = 2082;
    uint64_t v11 = sqlite3_errmsg(a1);
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: %d: SQL operation failed: %{public}s", (uint8_t *)&v6, 0x1Cu);
  }
}

uint64_t MSSqliteBindDataOrNull(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 length];
    if (v7 >> 31) {
      __assert_rtn("MSSqliteBindDataOrNull", "MSSqliteUtilities.m", 21, "dataLength <= INT_MAX");
    }
    uint64_t v8 = sqlite3_bind_blob(a1, a2, (const void *)[v6 bytes], v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v8 = sqlite3_bind_null(a1, a2);
  }
  uint64_t v9 = v8;

  return v9;
}

uint64_t MSSqliteBindStringOrNull(sqlite3_stmt *a1, int a2, id a3)
{
  if (a3)
  {
    id v5 = (const char *)[a3 UTF8String];
    return sqlite3_bind_text(a1, a2, v5, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    return sqlite3_bind_null(a1, a2);
  }
}

uint64_t MSSqliteBindTimeIntervalSinceReferenceDateOrNull(sqlite3_stmt *a1, int a2, void *a3)
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    return sqlite3_bind_double(a1, a2, v5);
  }
  else
  {
    return sqlite3_bind_null(a1, a2);
  }
}

id MSSqliteStringFromStatementColumn(sqlite3_stmt *a1, int a2)
{
  uint64_t v2 = (void *)sqlite3_column_text(a1, a2);
  if (v2)
  {
    uint64_t v2 = [NSString stringWithUTF8String:v2];
  }
  return v2;
}

id MSSqliteDataFromStatementColumn(sqlite3_stmt *a1, int a2)
{
  uint64_t v4 = sqlite3_column_blob(a1, a2);
  int v5 = sqlite3_column_bytes(a1, a2);
  if (v4)
  {
    int v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:v5];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

id MSSqliteObjectFromStatementColumn(sqlite3_stmt *a1, int a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v3 = MSSqliteDataFromStatementColumn(a1, a2);
  uint64_t v4 = [v2 MSSafeUnarchiveObjectWithData:v3 outError:0];

  return v4;
}

id MSSqliteDateFromTimeIntervalStatementColumn(sqlite3_stmt *a1, int a2)
{
  if (sqlite3_column_double(a1, a2) == 0.0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  return v2;
}

uint64_t MSSqliteTrapForDBLockError(uint64_t result)
{
  if (result == 5)
  {
    uint64_t v4 = v1;
    uint64_t v5 = v2;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "sqlite3 operation failed with a SQLITE_BUSY. Please grab the crash report and attach to <rdar://problem/11375454>!.", v3, 2u);
    }
    __assert_rtn("MSSqliteTrapForDBLockError", "MSSqliteUtilities.m", 72, "0");
  }
  return result;
}

void sub_1DC4DBAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DC4DBDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DC4DBEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4DC19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DC4DC494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DC4E2B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__7582(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7583(uint64_t a1)
{
}

void sub_1DC4E61B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1DC4E8358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4EA9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4ECA90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1DC4ED0B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t _setFieldsInSharingRelationship(void *a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 objectForKey:@"invitationguid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [v4 objectForKey:@"invitationguid"];
    [v3 setGUID:v6];
  }
  else
  {
    [v3 setGUID:0];
  }

  unint64_t v7 = [v4 objectForKey:@"email"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v4 objectForKey:@"email"];

    if (!v8) {
      goto LABEL_8;
    }
    [v3 setEmail:v8];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
    [v3 setEmails:v9];

    unint64_t v7 = (void *)v8;
  }

LABEL_8:
  uint64_t v10 = [v4 objectForKey:@"firstname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v4 objectForKey:@"firstname"];
    [v3 setFirstName:v11];
  }
  else
  {
    [v3 setFirstName:0];
  }

  uint64_t v12 = [v4 objectForKey:@"lastname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v4 objectForKey:@"lastname"];
    [v3 setLastName:v13];
  }
  else
  {
    [v3 setLastName:0];
  }

  uint64_t v14 = [v4 objectForKey:@"fullname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [v4 objectForKey:@"fullname"];
    [v3 setFullName:v15];
  }
  else
  {
    [v3 setFullName:0];
  }

  uint64_t v16 = [v4 objectForKey:@"personid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = [v4 objectForKey:@"personid"];
    [v3 setPersonID:v17];
  }
  else
  {
    [v3 setPersonID:0];
  }

  CFStringRef v18 = [v4 objectForKey:@"albumguid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v19 = [v4 objectForKey:@"albumguid"];
    [v3 setAlbumGUID:v19];
  }
  else
  {
    [v3 setAlbumGUID:0];
  }

  long long v20 = [v4 objectForKey:@"requestedbyme"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = [v4 objectForKey:@"requestedbyme"];

    if (v21 && [v21 isEqualToString:@"1"]) {
      [v3 setIsMine:1];
    }
  }
  else
  {

    long long v21 = 0;
  }
  long long v22 = [v4 objectForKey:@"phonenumbers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = [v4 objectForKey:@"phonenumbers"];

    if (v23 && [v23 count])
    {
      CFDictionaryRef v46 = v21;
      CFDictionaryRef v47 = v3;
      CFDictionaryRef v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v23 = v23;
      uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v49 != v27) {
              objc_enumerationMutation(v23);
            }
            CFNumberRef v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            CFRange v30 = [v29 objectForKey:@"phonenumber"];
            uint64_t v31 = [v29 objectForKey:@"invitationtoken"];
            uint64_t v32 = (void *)v31;
            if (v30) {
              BOOL v33 = v31 == 0;
            }
            else {
              BOOL v33 = 1;
            }
            if (!v33) {
              [v24 addObject:v30];
            }
          }
          uint64_t v26 = [v23 countByEnumeratingWithState:&v48 objects:v54 count:16];
        }
        while (v26);
      }

      id v3 = v47;
      if ([v24 count]) {
        [v47 setPhones:v24];
      }

      long long v21 = v46;
    }
  }
  else
  {

    id v23 = 0;
  }
  uint64_t v34 = [v4 objectForKey:@"subscriptiondate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = [v4 objectForKey:@"subscriptiondate"];

    if (!v35) {
      goto LABEL_51;
    }
    id v36 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v36 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    uint64_t v37 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v36 setTimeZone:v37];

    CFDataRef v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
    [v36 setLocale:v38];
    CFStringRef v39 = [v36 dateFromString:v35];
    [v3 setSubscriptionDate:v39];

    uint64_t v34 = (void *)v35;
  }

LABEL_51:
  CFStringRef v40 = [v4 objectForKey:@"sharingtype"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v42 = 1;
LABEL_69:

    goto LABEL_70;
  }
  uint64_t v41 = [v4 objectForKey:@"sharingtype"];

  if (v41)
  {
    if ([v41 isEqualToString:@"pending"])
    {
      uint64_t v42 = 1;
      [v3 setState:1];
    }
    else
    {
      if ([v41 isEqualToString:@"declined"])
      {
        CFNumberRef v43 = v3;
        uint64_t v44 = 4;
      }
      else if ([v41 isEqualToString:@"subscribed"])
      {
        CFNumberRef v43 = v3;
        uint64_t v44 = 2;
      }
      else if ([v41 isEqualToString:@"unsubscribed"])
      {
        CFNumberRef v43 = v3;
        uint64_t v44 = 3;
      }
      else if ([v41 isEqualToString:@"owned"])
      {
        CFNumberRef v43 = v3;
        uint64_t v44 = 0;
      }
      else
      {
        if (![v41 isEqualToString:@"unshared"])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            CFDictionaryRef v53 = v41;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown sharing relationship: %@, skipping.", buf, 0xCu);
          }
          uint64_t v42 = 0;
          goto LABEL_68;
        }
        CFNumberRef v43 = v3;
        uint64_t v44 = 5;
      }
      [v43 setState:v44];
      uint64_t v42 = 1;
    }
LABEL_68:
    CFStringRef v40 = v41;
    goto LABEL_69;
  }
  uint64_t v42 = 1;
LABEL_70:

  return v42;
}

void sub_1DC4F54F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4F5A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4F5C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC4F5DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7710](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return (CFDateRef)MEMORY[0x1F40D78C8](allocator, formatter, string, rangep);
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x1F40D5288](message);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x1F40D52E8](response);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7C38]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1F40D7D98](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x1F40D7DA0](allocator, formatter, string, rangep, options);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1F40D8180](allocator, flags, order, callout, context, fireDate, interval);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CFURLConnectionCancel()
{
  return MEMORY[0x1F40D53C8]();
}

uint64_t CFURLConnectionCreateWithProperties()
{
  return MEMORY[0x1F40D53D8]();
}

uint64_t CFURLConnectionScheduleWithRunLoop()
{
  return MEMORY[0x1F40D53E8]();
}

uint64_t CFURLConnectionStart()
{
  return MEMORY[0x1F40D53F0]();
}

uint64_t CFURLConnectionUnscheduleFromRunLoop()
{
  return MEMORY[0x1F40D53F8]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

uint64_t CFURLRequestAppendHTTPHeaderFieldValue()
{
  return MEMORY[0x1F40D5430]();
}

uint64_t CFURLRequestCopyAllHTTPHeaderFields()
{
  return MEMORY[0x1F40D5438]();
}

uint64_t CFURLRequestCreateMutable()
{
  return MEMORY[0x1F40D5458]();
}

uint64_t CFURLRequestSetHTTPHeaderFieldValue()
{
  return MEMORY[0x1F40D5488]();
}

uint64_t CFURLRequestSetHTTPRequestBody()
{
  return MEMORY[0x1F40D5490]();
}

uint64_t CFURLRequestSetHTTPRequestMethod()
{
  return MEMORY[0x1F40D54A0]();
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return MEMORY[0x1F40D54F8]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

uint64_t IDSCopyIDForPhoneNumberWithOptions()
{
  return MEMORY[0x1F4122BE8]();
}

uint64_t MMCSEngineCancelRequests()
{
  return MEMORY[0x1F412C348]();
}

uint64_t MMCSEngineCreate()
{
  return MEMORY[0x1F412C358]();
}

uint64_t MMCSEngineDestroy()
{
  return MEMORY[0x1F412C368]();
}

uint64_t MMCSEngineGetRequestMetrics()
{
  return MEMORY[0x1F412C370]();
}

uint64_t MMCSEngineIsActive()
{
  return MEMORY[0x1F412C378]();
}

uint64_t MMCSEngineSetMetricsEnabled()
{
  return MEMORY[0x1F412C380]();
}

uint64_t MMCSGetItems()
{
  return MEMORY[0x1F412C390]();
}

uint64_t MMCSMetricsRequestCopyDescription()
{
  return MEMORY[0x1F412C3D8]();
}

uint64_t MMCSPutItems()
{
  return MEMORY[0x1F412C408]();
}

uint64_t MMCSRegisterFile()
{
  return MEMORY[0x1F412C428]();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x1F412C440]();
}

uint64_t MMCSSignatureGeneratorCreate()
{
  return MEMORY[0x1F412C458]();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return MEMORY[0x1F412C478]();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return MEMORY[0x1F412C488]();
}

uint64_t MMCSSignatureIsValid()
{
  return MEMORY[0x1F412C490]();
}

uint64_t MMCSUnregisterFile()
{
  return MEMORY[0x1F412C4A0]();
}

uint64_t MMCSUnregisterFiles()
{
  return MEMORY[0x1F412C4A8]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CC830](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_trace_get_mode()
{
  return MEMORY[0x1F40CD588]();
}

void perror(const char *a1)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1F4182278](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}