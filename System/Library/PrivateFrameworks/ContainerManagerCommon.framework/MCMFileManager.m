@interface MCMFileManager
+ (id)defaultManager;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)diskUsageForURL:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)fastDiskUsageForURL:(id)a3;
- (BOOL)_CreateSystemUserACEInACL:(_acl *)a3 withPermissions:(int)a4 andFlags:(int)a5 withError:(id *)a6;
- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6;
- (BOOL)_enumeratePOSIX1eACLEntriesAtURL:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)_fixACLOnFD:(int)a3 removeACLFilesec:(_filesec *)a4 denyDeleteFilesec:(_filesec *)a5 denyDeleteText:(const char *)a6 path:(const char *)a7 error:(id *)a8;
- (BOOL)_fixFlagsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6;
- (BOOL)_fixOwnershipOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 statfs:(statfs *)a6 uid:(unsigned int)a7 gid:(unsigned int)a8 error:(id *)a9;
- (BOOL)_fixPOSIXBitsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6;
- (BOOL)_fixPOSIXPermsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6;
- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6;
- (BOOL)_traverseDirectory:(id)a3 error:(id *)a4 withBlock:(id)a5;
- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5;
- (BOOL)_withEveryoneDenyDeleteACLDoBlock:(id)a3;
- (BOOL)checkFileSystemAtURL:(id)a3 isCaseSensitive:(BOOL *)a4 canAtomicSwap:(BOOL *)a5 error:(id *)a6;
- (BOOL)checkFileSystemAtURL:(id)a3 supportsPerFileKeys:(BOOL *)a4 error:(id *)a5;
- (BOOL)compareVolumeForURL:(id)a3 versusURL:(id)a4 isSameVolume:(BOOL *)a5 error:(id *)a6;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 dataProtectionClass:(int)a6 error:(id *)a7;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 dataProtectionClass:(int)a7 error:(id *)a8;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 dataProtectionClass:(int)a7 fsNode:(id *)a8 error:(id *)a9;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 error:(id *)a7;
- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 dataProtectionClass:(int *)a4 error:(id *)a5;
- (BOOL)enableFastDiskUsageForURL:(id)a3 error:(id *)a4;
- (BOOL)fixUserPermissionsAtURL:(id)a3 limitToTopLevelURL:(id)a4 error:(id *)a5;
- (BOOL)itemAtURL:(id)a3 exists:(BOOL *)a4 error:(id *)a5;
- (BOOL)itemAtURL:(id)a3 exists:(BOOL *)a4 isDirectory:(BOOL *)a5 error:(id *)a6;
- (BOOL)itemAtURL:(id)a3 followSymlinks:(BOOL)a4 exists:(BOOL *)a5 isDirectory:(BOOL *)a6 error:(id *)a7;
- (BOOL)itemAtURL:(id)a3 followSymlinks:(BOOL)a4 exists:(BOOL *)a5 isDirectory:(BOOL *)a6 fsNode:(id *)a7 error:(id *)a8;
- (BOOL)itemDoesNotExistAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3 isDirectory:(BOOL *)a4;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeExclusionFromBackupFromURL:(id)a3 error:(id *)a4;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (BOOL)repairPermissionsAtURL:(id)a3 uid:(unsigned int)a4 gid:(unsigned int)a5 options:(unint64_t)a6 error:(id *)a7;
- (BOOL)replaceItemAtDestinationURL:(id)a3 withSourceURL:(id)a4 swapped:(BOOL *)a5 error:(id *)a6;
- (BOOL)setDataProtectionAtURL:(id)a3 toDataProtectionClass:(int)a4 directoriesOnly:(BOOL)a5 recursive:(BOOL)a6 error:(id *)a7;
- (BOOL)setTopLevelSystemContainerACLAtURL:(id)a3 error:(id *)a4;
- (BOOL)standardizeACLsAtURL:(id)a3 isSystemContainer:(BOOL)a4 error:(id *)a5;
- (BOOL)standardizeACLsForSystemContainerAtURL:(id)a3 error:(id *)a4;
- (BOOL)standardizeAllSystemContainerACLsAtURL:(id)a3 error:(id *)a4;
- (BOOL)standardizeOwnershipAtURL:(id)a3 toPOSIXUser:(id)a4 error:(id *)a5;
- (BOOL)stripACLFromURL:(id)a3 error:(id *)a4;
- (BOOL)symbolicallyLinkURL:(id)a3 toSymlinkTarget:(id)a4 error:(id *)a5;
- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 mode:(unsigned __int16)a6 error:(id *)a7;
- (_acl)_CopySystemContainerACLWithNumACEs:(int)a3 isDir:(BOOL)a4 inheritOnly:(BOOL)a5 withError:(id *)a6;
- (_acl)_CopyTopLevelSystemContainerACLWithError:(id *)a3;
- (_filesec)_denyDeleteACLFilesecWithACLText:(char *)a3;
- (_filesec)_removeACLFilesec;
- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4;
- (id)_realPathWhatExistsInPath:(id)a3;
- (id)copyDescriptionOfURL:(id)a3;
- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4;
- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 withNamePrefix:(id)a4 error:(id *)a5;
- (id)fsNodeOfURL:(id)a3 followSymlinks:(BOOL)a4 error:(id *)a5;
- (id)fsSanitizedStringFromString:(id)a3 allowSpaces:(BOOL)a4;
- (id)readDataFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)readDataFromURL:(id)a3 options:(unint64_t)a4 fsNode:(id *)a5 error:(id *)a6;
- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4;
- (id)realPathForURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5;
- (id)targetOfSymbolicLinkAtURL:(id)a3 error:(id *)a4;
- (id)urlsForItemsInDirectoryAtURL:(id)a3 error:(id *)a4;
- (unint64_t)dataWritingOptionsForFileAtURL:(id)a3;
- (void)printDirectoryStructureAtURL:(id)a3;
@end

@implementation MCMFileManager

+ (id)defaultManager
{
  if (containermanager_copy_default_file_manager_onceToken != -1) {
    dispatch_once(&containermanager_copy_default_file_manager_onceToken, &__block_literal_global_1156);
  }
  v2 = (void *)gMCMDefaultFileManager;

  return v2;
}

- (BOOL)itemAtURL:(id)a3 followSymlinks:(BOOL)a4 exists:(BOOL *)a5 isDirectory:(BOOL *)a6 fsNode:(id *)a7 error:(id *)a8
{
  BOOL v12 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v13 = (const char *)[a3 fileSystemRepresentation];
  v14 = v13;
  memset(&v38, 0, sizeof(v38));
  if (v12) {
    int v15 = stat(v13, &v38);
  }
  else {
    int v15 = lstat(v13, &v38);
  }
  int v16 = v15;
  if (!v15)
  {
    BOOL v17 = (v38.st_mode & 0xF000) == 0x4000;
    if (a7)
    {
      v18 = [[MCMFSNode alloc] initWithStat:&v38];
LABEL_10:
      v19 = container_log_handle_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = v14;
        __int16 v30 = 1024;
        BOOL v31 = v16 == 0;
        __int16 v32 = 1024;
        *(_DWORD *)v33 = v17;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v38.st_mode & 0x1FF;
        __int16 v34 = 1024;
        uid_t st_uid = v38.st_uid;
        __int16 v36 = 1024;
        gid_t st_gid = v38.st_gid;
        _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEFAULT, "stat [%s]: %d/%d/0%03o/%d/%d", buf, 0x2Au);
      }

      if (a5) {
        *a5 = v16 == 0;
      }
      if (a6) {
        *a6 = v17;
      }
      if (a7)
      {
        v18 = v18;
        id v20 = 0;
        *a7 = v18;
      }
      else
      {
        id v20 = 0;
      }
      BOOL v22 = 1;
      goto LABEL_24;
    }
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  if (*__error() == 2)
  {
    BOOL v17 = 0;
    goto LABEL_9;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__MCMFileManager_itemAtURL_followSymlinks_exists_isDirectory_fsNode_error___block_invoke;
  v27[3] = &__block_descriptor_40_e14___NSError_8__0l;
  v27[4] = v14;
  __75__MCMFileManager_itemAtURL_followSymlinks_exists_isDirectory_fsNode_error___block_invoke((uint64_t)v27);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = container_log_handle_for_category();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v24 = *__error();
    v25 = __error();
    v26 = strerror(*v25);
    *(_DWORD *)buf = 136315650;
    v29 = v14;
    __int16 v30 = 1024;
    BOOL v31 = v24;
    __int16 v32 = 2080;
    *(void *)v33 = v26;
    _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Failed to determine if [%s] exists: (%d) %s", buf, 0x1Cu);
  }

  if (a8)
  {
    id v20 = v20;
    BOOL v22 = 0;
    v18 = 0;
    *a8 = v20;
  }
  else
  {
    BOOL v22 = 0;
    v18 = 0;
  }
LABEL_24:

  return v22;
}

- (id)urlsForItemsInDirectoryAtURL:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  id v7 = v5;
  v8 = (const char *)[v7 fileSystemRepresentation];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v35 = __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke;
  __int16 v36 = &unk_1E6A7F5E0;
  id v9 = v6;
  id v37 = v9;
  id v10 = v7;
  id v38 = v10;
  v11 = v34;
  BOOL v12 = opendir(v8);
  if (v12)
  {
    v13 = v12;
    id v30 = v10;
    v14 = readdir(v12);
    if (v14)
    {
      int v15 = v14;
      while (1)
      {
        uint64_t d_type = v15->d_type;
        if (!v15->d_type) {
          break;
        }
LABEL_8:
        int v19 = v15->d_name[0];
        d_name = v15->d_name;
        if (v19 == 46 || v35((uint64_t)v11, d_type, (uint64_t)d_name))
        {
          int v15 = readdir(v13);
          if (v15) {
            continue;
          }
        }
        goto LABEL_18;
      }
      memset(&v39, 0, sizeof(v39));
      objc_msgSend(NSString, "stringWithFormat:", @"%s/%s", v8, v15->d_name);
      id v17 = objc_claimAutoreleasedReturnValue();
      if (stat((const char *)[v17 fileSystemRepresentation], &v39)) {
        goto LABEL_6;
      }
      int v20 = v39.st_mode & 0xF000;
      if (v20 == 0x4000)
      {
        uint64_t d_type = 4;
        goto LABEL_7;
      }
      if (v20 == 0x8000)
      {
        uint64_t d_type = 8;
        goto LABEL_7;
      }
      if (v20 != 40960) {
LABEL_6:
      }
        uint64_t d_type = 0;
      else {
        uint64_t d_type = 10;
      }
LABEL_7:

      goto LABEL_8;
    }
LABEL_18:
    closedir(v13);

    id v10 = v30;
  }
  else
  {
    if (*__error() != 2)
    {
      v23 = container_log_handle_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v28 = __error();
        v29 = strerror(*v28);
        v39.st_dev = 136315394;
        *(void *)&v39.st_mode = v8;
        WORD2(v39.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v39.st_ino + 6) = (__darwin_ino64_t)v29;
        _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "opendir of %s failed: %s", (uint8_t *)&v39, 0x16u);
      }
    }
    int v24 = *__error();

    if (v24)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke_2;
      v31[3] = &unk_1E6A7F568;
      id v32 = v10;
      int v33 = v24;
      BOOL v22 = __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke_2((uint64_t)v31);

      id v21 = 0;
      if (!a4) {
        goto LABEL_29;
      }
      goto LABEL_27;
    }
  }
  id v21 = v9;
  BOOL v22 = 0;
  if (!a4) {
    goto LABEL_29;
  }
LABEL_27:
  if (!v21) {
    *a4 = v22;
  }
LABEL_29:
  v25 = v38;
  id v26 = v21;

  return v26;
}

uint64_t __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:a3 isDirectory:a2 == 4 relativeToURL:*(void *)(a1 + 40)];
  id v5 = [v4 absoluteURL];
  [v3 addObject:v5];

  return 1;
}

- (BOOL)_fixOwnershipOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 statfs:(statfs *)a6 uid:(unsigned int)a7 gid:(unsigned int)a8 error:(id *)a9
{
  *(void *)&v34[9] = *MEMORY[0x1E4F143B8];
  if ((a6->f_flags & 0x200000) != 0)
  {
    id v11 = 0;
    BOOL v13 = 1;
  }
  else
  {
    id v11 = 0;
    uid_t st_uid = a5->st_uid;
    BOOL v13 = 1;
    if (st_uid != a7 && st_uid != 99)
    {
      if ((*(unsigned int (**)(void, void, void))(*MEMORY[0x1E4F14868] + 224))(*(void *)&a3, *(void *)&a7, *(void *)&a8))
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __69__MCMFileManager__fixOwnershipOnFD_FTSENT_stat_statfs_uid_gid_error___block_invoke;
        v24[3] = &__block_descriptor_48_e14___NSError_8__0l;
        unsigned int v25 = a7;
        unsigned int v26 = a8;
        v24[4] = a4;
        __69__MCMFileManager__fixOwnershipOnFD_FTSENT_stat_statfs_uid_gid_error___block_invoke((uint64_t)v24);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        int v16 = container_log_handle_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v22 = *__error();
          fts_path = a4->fts_path;
          *(_DWORD *)buf = 67109890;
          unsigned int v28 = a7;
          __int16 v29 = 1024;
          unsigned int v30 = a8;
          __int16 v31 = 1026;
          unsigned int v32 = v22;
          __int16 v33 = 2080;
          *(void *)__int16 v34 = fts_path;
          _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "fchown(uid=%u, gid=%u) failed (%{darwin.errno, public}d) on path [%s]", buf, 0x1Eu);
        }

        if (a9)
        {
          id v11 = v11;
          BOOL v13 = 0;
          *a9 = v11;
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        v18 = container_log_handle_for_category();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uid_t v19 = a5->st_uid;
          gid_t st_gid = a5->st_gid;
          id v21 = a4->fts_path;
          *(_DWORD *)buf = 67110146;
          unsigned int v28 = v19;
          __int16 v29 = 1024;
          unsigned int v30 = st_gid;
          __int16 v31 = 1024;
          unsigned int v32 = a7;
          __int16 v33 = 1024;
          *(_DWORD *)__int16 v34 = a8;
          void v34[2] = 2080;
          *(void *)&v34[3] = v21;
          _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEFAULT, "REPAIR: fchown (%d:%d → %d:%d) on [%s]", buf, 0x24u);
        }

        id v11 = 0;
      }
    }
  }

  return v13;
}

id __69__MCMFileManager__fixOwnershipOnFD_FTSENT_stat_statfs_uid_gid_error___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"fchown(uid=%u, gid=%u) failed on path [%s]", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(void *)(*(void *)(a1 + 32) + 48)];
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixOwnershipOnFD:FTSENT:stat:statfs:uid:gid:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11960;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (BOOL)_fixFlagsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6
{
  *(void *)&v24[7] = *MEMORY[0x1E4F143B8];
  __uint32_t st_flags = a5->st_flags;
  if ((st_flags & 2) == 0)
  {
LABEL_10:
    id v11 = 0;
    BOOL v13 = 1;
    goto LABEL_11;
  }
  uint64_t v10 = st_flags & 0xFFFFFFFD;
  if (!(*(unsigned int (**)(void, uint64_t))(*MEMORY[0x1E4F14868] + 200))(*(void *)&a3, v10))
  {
    v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __uint32_t v15 = a5->st_flags;
      fts_path = a4->fts_path;
      *(_DWORD *)buf = 67109634;
      __uint32_t v22 = v15;
      __int16 v23 = 1024;
      *(_DWORD *)int v24 = v10;
      v24[2] = 2080;
      *(void *)&v24[3] = fts_path;
      _os_log_impl(&dword_1D7739000, v14, OS_LOG_TYPE_DEFAULT, "REPAIR: fchflags -UF_IMMUTABLE (0x%x → 0x%x) on [%s]", buf, 0x18u);
    }

    goto LABEL_10;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__MCMFileManager__fixFlagsOnFD_FTSENT_stat_error___block_invoke;
  v20[3] = &__block_descriptor_40_e14___NSError_8__0l;
  v20[4] = a4;
  __50__MCMFileManager__fixFlagsOnFD_FTSENT_stat_error___block_invoke((uint64_t)v20);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v12 = container_log_handle_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v18 = *__error();
    uid_t v19 = a4->fts_path;
    *(_DWORD *)buf = 67240450;
    __uint32_t v22 = v18;
    __int16 v23 = 2080;
    *(void *)int v24 = v19;
    _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "fchflags failed (%{darwin.errno, public}d) on open fd for path [%s]", buf, 0x12u);
  }

  if (a6)
  {
    id v11 = v11;
    BOOL v13 = 0;
    *a6 = v11;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_11:

  return v13;
}

id __50__MCMFileManager__fixFlagsOnFD_FTSENT_stat_error___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fchflags failed on open fd for path [%s]", *(void *)(*(void *)(a1 + 32) + 48));
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixFlagsOnFD:FTSENT:stat:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11948;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (BOOL)_fixPOSIXBitsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6
{
  *(void *)&v21[7] = *MEMORY[0x1E4F143B8];
  int st_mode = a5->st_mode;
  if ((st_mode & 0xE00) == 0)
  {
LABEL_10:
    id v9 = 0;
    BOOL v11 = 1;
    goto LABEL_11;
  }
  if (!(*(unsigned int (**)(void, void))(*MEMORY[0x1E4F14868] + 208))(*(void *)&a3, st_mode & 0xFFFFF1FF))
  {
    BOOL v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      fts_path = a4->fts_path;
      *(_DWORD *)buf = 67109634;
      int v19 = st_mode;
      __int16 v20 = 1024;
      *(_DWORD *)id v21 = st_mode & 0xF1FF;
      v21[2] = 2080;
      *(void *)&v21[3] = fts_path;
      _os_log_impl(&dword_1D7739000, v12, OS_LOG_TYPE_DEFAULT, "REPAIR: fchmod -setuid, -setgid, -sticky (0%o → 0%o) on [%s]", buf, 0x18u);
    }

    goto LABEL_10;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__MCMFileManager__fixPOSIXBitsOnFD_FTSENT_stat_error___block_invoke;
  v17[3] = &__block_descriptor_40_e14___NSError_8__0l;
  v17[4] = a4;
  __54__MCMFileManager__fixPOSIXBitsOnFD_FTSENT_stat_error___block_invoke((uint64_t)v17);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v15 = *__error();
    int v16 = a4->fts_path;
    *(_DWORD *)buf = 67240450;
    int v19 = v15;
    __int16 v20 = 2080;
    *(void *)id v21 = v16;
    _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "fchmod (un-setuid) failed (%{darwin.errno, public}d) on path [%s]", buf, 0x12u);
  }

  if (a6)
  {
    id v9 = v9;
    BOOL v11 = 0;
    *a6 = v9;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

id __54__MCMFileManager__fixPOSIXBitsOnFD_FTSENT_stat_error___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fchmod (un-setuid) failed on path [%s]", *(void *)(*(void *)(a1 + 32) + 48));
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixPOSIXBitsOnFD:FTSENT:stat:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11930;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (BOOL)_fixPOSIXPermsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  *(void *)&v28[7] = *MEMORY[0x1E4F143B8];
  int st_mode = a5->st_mode;
  int fts_info = a4->fts_info;
  if (fts_info == 1)
  {
    if ((~st_mode & 0x1C0) == 0)
    {
LABEL_19:
      id v11 = 0;
      BOOL v17 = 1;
      goto LABEL_20;
    }
    if ((*(unsigned int (**)(void, void))(*MEMORY[0x1E4F14868] + 208))(*(void *)&a3, st_mode | 0x1C0u))
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke;
      v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v24[4] = a4;
      __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke((uint64_t)v24);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v12 = container_log_handle_for_category();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      int v13 = *__error();
      fts_path = a4->fts_path;
      *(_DWORD *)buf = 67240450;
      int v26 = v13;
      __int16 v27 = 2080;
      *(void *)unsigned int v28 = fts_path;
      goto LABEL_22;
    }
    int v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = a4->fts_path;
      *(_DWORD *)buf = 67109634;
      int v26 = st_mode;
      __int16 v27 = 1024;
      *(_DWORD *)unsigned int v28 = st_mode | 0x1C0;
      v28[2] = 2080;
      *(void *)&v28[3] = v16;
      _os_log_impl(&dword_1D7739000, v15, OS_LOG_TYPE_DEFAULT, "REPAIR: fchmod u+rwx (0%o → 0%o) on [%s]", buf, 0x18u);
    }

    int fts_info = a4->fts_info;
  }
  if (fts_info != 8 || (~st_mode & 0x180) == 0) {
    goto LABEL_19;
  }
  if (!(*(unsigned int (**)(uint64_t, void))(*MEMORY[0x1E4F14868] + 208))(v8, st_mode | 0x180u))
  {
    int v18 = container_log_handle_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = a4->fts_path;
      *(_DWORD *)buf = 67109634;
      int v26 = st_mode;
      __int16 v27 = 1024;
      *(_DWORD *)unsigned int v28 = st_mode | 0x180;
      v28[2] = 2080;
      *(void *)&v28[3] = v19;
      _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEFAULT, "REPAIR: fchmod u+rw (0%o → 0%o) on [%s]", buf, 0x18u);
    }

    goto LABEL_19;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke_619;
  v23[3] = &__block_descriptor_40_e14___NSError_8__0l;
  v23[4] = a4;
  __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke_619((uint64_t)v23);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v12 = container_log_handle_for_category();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    goto LABEL_13;
  }
  int v21 = *__error();
  __uint32_t v22 = a4->fts_path;
  *(_DWORD *)buf = 67240450;
  int v26 = v21;
  __int16 v27 = 2080;
  *(void *)unsigned int v28 = v22;
LABEL_22:
  _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "fchmod failed (%{darwin.errno, public}d) on path [%s]", buf, 0x12u);
LABEL_13:

  if (a6)
  {
    id v11 = v11;
    BOOL v17 = 0;
    *a6 = v11;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_20:

  return v17;
}

id __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fchmod failed on directory [%s]", *(void *)(*(void *)(a1 + 32) + 48));
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixPOSIXPermsOnFD:FTSENT:stat:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11900;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke_619(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fchmod failed on file [%s]", *(void *)(*(void *)(a1 + 32) + 48));
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixPOSIXPermsOnFD:FTSENT:stat:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11918;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (BOOL)_fixACLOnFD:(int)a3 removeACLFilesec:(_filesec *)a4 denyDeleteFilesec:(_filesec *)a5 denyDeleteText:(const char *)a6 path:(const char *)a7 error:(id *)a8
{
  uint64_t v13 = *(void *)&a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = 0;
  memset(v44, 0, sizeof(v44));
  memset(v43, 0, sizeof(v43));
  uint64_t v14 = MEMORY[0x1E4F14868];
  uint64_t v15 = (*(uint64_t (**)(MCMFileManager *, SEL))(*MEMORY[0x1E4F14868] + 288))(self, a2);
  if (v15)
  {
    uint64_t v16 = v15;
    if ((*(unsigned int (**)(uint64_t, _OWORD *, uint64_t))(*(void *)v14 + 360))(v13, v44, v15))
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_584;
      v41[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v41[4] = a7;
      BOOL v17 = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_584((uint64_t)v41);
      int v18 = container_log_handle_for_category();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        int v19 = 0;
        goto LABEL_5;
      }
      int v34 = *__error();
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = a7;
      unsigned int v32 = "fstatx_np failed (%{darwin.errno, public}d) on path [%s]";
LABEL_40:
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, v32, buf, 0x12u);
      goto LABEL_4;
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v14 + 280))(v16, 5, &v42))
    {
      if (*__error() != 2)
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_590;
        v40[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v40[4] = a7;
        BOOL v17 = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_590((uint64_t)v40);
        int v18 = container_log_handle_for_category();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_4;
        }
        int v31 = *__error();
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = a7;
        unsigned int v32 = "filesec_get_property(..., FILESEC_ACL, ...) failed (%{darwin.errno, public}d) on path [%s]";
        goto LABEL_40;
      }
      int v19 = 0;
      a4 = 0;
    }
    else
    {
      unsigned int v28 = (const char *)(*(uint64_t (**)(uint64_t, void))(*(void *)v14 + 128))(v42, 0);
      int v19 = v28;
      if (a5 && a6 && v28 && !strcmp(a6, v28))
      {
        a5 = 0;
        a4 = 0;
      }
    }
    if ((unint64_t)a5 | (unint64_t)a4)
    {
      if ((*(unsigned int (**)(uint64_t, _OWORD *))(*(void *)v14 + 336))(v13, v43))
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_596;
        v39[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v39[4] = a7;
        BOOL v17 = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_596((uint64_t)v39);
        int v18 = container_log_handle_for_category();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_5;
        }
        int v29 = *__error();
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = a7;
        unsigned int v30 = "fstat(...) failed (%{darwin.errno, public}d) on [%s]";
        goto LABEL_32;
      }
      if (a4)
      {
        if ((*(unsigned int (**)(uint64_t, _filesec *))(*(void *)v14 + 216))(v13, a4))
        {
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_602;
          v38[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v38[4] = a7;
          BOOL v17 = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_602((uint64_t)v38);
          int v18 = container_log_handle_for_category();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            goto LABEL_5;
          }
          int v33 = *__error();
          *(_DWORD *)buf = 67240450;
          *(_DWORD *)&uint8_t buf[4] = v33;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = a7;
          unsigned int v30 = "fchmodx_np() failed (%{darwin.errno, public}d) when removing ACLs on path [%s]";
          goto LABEL_32;
        }
        v35 = container_log_handle_for_category();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = a7;
          _os_log_impl(&dword_1D7739000, v35, OS_LOG_TYPE_DEFAULT, "REPAIR: removed ACL (%s) from [%s]", buf, 0x16u);
        }
      }
      if (a5)
      {
        if (!(*(unsigned int (**)(uint64_t, _filesec *))(*(void *)v14 + 216))(v13, a5))
        {
          int v18 = container_log_handle_for_category();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = a6;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = a7;
            _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_DEFAULT, "REPAIR: added default ACL (%s) on [%s]", buf, 0x16u);
          }
          BOOL v17 = 0;
          BOOL v20 = 1;
          goto LABEL_6;
        }
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_608;
        v37[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v37[4] = a7;
        BOOL v17 = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_608((uint64_t)v37);
        int v18 = container_log_handle_for_category();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
LABEL_5:
          BOOL v20 = 0;
LABEL_6:

          goto LABEL_7;
        }
        int v36 = *__error();
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = a7;
        unsigned int v30 = "fchmodx_np() failed (%{darwin.errno, public}d) when setting default ACL on path [%s]";
LABEL_32:
        _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, v30, buf, 0x12u);
        goto LABEL_5;
      }
    }
    BOOL v17 = 0;
    BOOL v20 = 1;
LABEL_7:
    (*(void (**)(uint64_t))(*(void *)v14 + 272))(v16);
    if (v19) {
      (*(void (**)(const char *))(*(void *)v14 + 32))(v19);
    }
    goto LABEL_12;
  }
  int v21 = (void *)[[NSString alloc] initWithFormat:@"filesec_init failed"];
  v45[0] = @"FunctionName";
  __uint32_t v22 = [NSString stringWithUTF8String:"-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke"];
  *(void *)buf = v22;
  *(void *)&buf[8] = &unk_1F2F11870;
  uint64_t v23 = *MEMORY[0x1E4F28568];
  v45[1] = @"SourceFileLine";
  v45[2] = v23;
  *(void *)&buf[16] = v21;
  int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v45 count:3];

  BOOL v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v24];

  unsigned int v25 = container_log_handle_for_category();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "filesec_init failed", buf, 2u);
  }

  BOOL v20 = 0;
LABEL_12:
  if (v42) {
    (*(void (**)(void))(*(void *)v14 + 32))();
  }
  if (a8) {
    char v26 = v20;
  }
  else {
    char v26 = 1;
  }
  if ((v26 & 1) == 0) {
    *a8 = v17;
  }

  return v20;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_584(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fstatx_np failed on path [%s]", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11888;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_590(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[[NSString alloc] initWithFormat:@"filesec_get_property(..., FILESEC_ACL, ...) failed on path [%s]", *(void *)(a1 + 32)];
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F118A0;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_596(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fstat(...) failed on [%s]", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F118B8;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_602(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fchmodx_np() failed when removing ACLs on path [%s]", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F118D0;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_608(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fchmodx_np() failed when setting default ACL on path [%s]", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  v2 = [NSString stringWithUTF8String:"-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F118E8;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (BOOL)_withEveryoneDenyDeleteACLDoBlock:(id)a3
{
  identifier[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (uint64_t (**)(id, uint64_t))a3;
  strcpy((char *)identifier, "everyone");
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  memset(uu, 0, sizeof(uu));
  int v4 = mbr_identifier_to_uuid(5, identifier, 9uLL, uu);
  uint64_t v5 = MEMORY[0x1E4F14868];
  if (v4)
  {
    int v6 = v4;
    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v6;
      uint64_t v8 = "mbr_identifier_to_uuid(group, everyone) failed (%d)";
LABEL_19:
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, v8, buf, 8u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*MEMORY[0x1E4F14868] + 80))(1);
  if (!v15
    || (*(unsigned int (**)(uint64_t *, uint64_t *))(*(void *)v5 + 16))(&v15, &v14)
    || (*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)v5 + 64))(v14, &v13)
    || (*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)v5 + 56))(v14, &v12)
    || (*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v5 + 120))(v14, 2)
    || (*(unsigned int (**)(uint64_t, unsigned __int8 *))(*(void *)v5 + 112))(v14, uu)
    || (*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v5 + 8))(v13, 16)
    || (*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v5 + 104))(v14, v13)
    || (*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v5 + 96))(v14, v12))
  {
    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = *__error();
      *(_DWORD *)buf = 67109120;
      int v17 = v11;
      uint64_t v8 = "acl creation failed (%{darwin.errno}d)";
      goto LABEL_19;
    }
LABEL_14:

    char v9 = 0;
    goto LABEL_15;
  }
  char v9 = v3[2](v3, v15);
LABEL_15:
  if (v15) {
    (*(void (**)(void))(*(void *)v5 + 32))();
  }

  return v9;
}

- (_filesec)_denyDeleteACLFilesecWithACLText:(char *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (*(uint64_t (**)(MCMFileManager *, SEL))(*MEMORY[0x1E4F14868] + 288))(self, a2);
  int v6 = (_filesec *)v5;
  if (a3 && v5)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__MCMFileManager__denyDeleteACLFilesecWithACLText___block_invoke;
    v8[3] = &unk_1E6A7F6E8;
    void v8[4] = &v9;
    v8[5] = v5;
    [(MCMFileManager *)self _withEveryoneDenyDeleteACLDoBlock:v8];
    *a3 = (char *)v10[3];
    _Block_object_dispose(&v9, 8);
  }
  return v6;
}

BOOL __51__MCMFileManager__denyDeleteACLFilesecWithACLText___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a2;
  uint64_t v3 = MEMORY[0x1E4F14868];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(uint64_t, void))(*MEMORY[0x1E4F14868] + 128))(a2, 0);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v4 = container_log_handle_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = *__error();
      *(_DWORD *)buf = 67240192;
      int v12 = v9;
      _os_log_error_impl(&dword_1D7739000, v4, OS_LOG_TYPE_ERROR, "acl_to_text() failed (%{darwin.errno, public}d)", buf, 8u);
    }
  }
  int v5 = (*(uint64_t (**)(void, uint64_t, uint64_t *))(*(void *)v3 + 296))(*(void *)(a1 + 40), 5, &v10);
  if (v5)
  {
    int v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = *__error();
      *(_DWORD *)buf = 67240192;
      int v12 = v8;
      _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "filesec_set_property() for default ACL failed (%{darwin.errno, public}d)", buf, 8u);
    }
  }
  return v5 == 0;
}

- (_filesec)_removeACLFilesec
{
  uint64_t v2 = MEMORY[0x1E4F14868];
  uint64_t v3 = (*(uint64_t (**)(MCMFileManager *, SEL))(*MEMORY[0x1E4F14868] + 288))(self, a2);
  int v4 = (_filesec *)v3;
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v2 + 296))(v3, 5, 1);
  }
  return v4;
}

- (BOOL)setDataProtectionAtURL:(id)a3 toDataProtectionClass:(int)a4 directoriesOnly:(BOOL)a5 recursive:(BOOL)a6 error:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x3032000000;
  unsigned int v28 = __Block_byref_object_copy__1077;
  int v29 = __Block_byref_object_dispose__1078;
  id v30 = 0;
  int v24 = 0;
  id v10 = a3;
  [v10 fileSystemRepresentation];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  int v19 = __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke;
  BOOL v20 = &unk_1E6A7F6C0;
  BOOL v23 = a5;
  int v22 = a4;
  int v21 = &v25;
  if ((container_traverse_directory() & 1) == 0)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_570;
    v15[3] = &__block_descriptor_36_e14___NSError_8__0l;
    int v16 = v24;
    uint64_t v11 = __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_570((uint64_t)v15);
    int v12 = (void *)v26[5];
    v26[5] = v11;
  }
  uint64_t v13 = (void *)v26[5];
  if (a7 && v13) {
    *a7 = v13;
  }
  _Block_object_dispose(&v25, 8);

  return v13 == 0;
}

uint64_t __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int is_directory = container_traverse_node_is_directory();
  if (*(unsigned char *)(a1 + 44)) {
    BOOL v3 = is_directory == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    return 1;
  }
  int v4 = is_directory;
  unsigned int v5 = *(_DWORD *)(a1 + 40);
  unsigned int optional_dp_class = container_traverse_node_get_optional_dp_class();
  uint64_t name = container_traverse_node_get_name();
  if (v4) {
    int v8 = 0;
  }
  else {
    int v8 = 3;
  }
  if (!v5) {
    unsigned int v5 = v8;
  }
  if (v4)
  {
    int optional_parent_fd = container_traverse_node_get_optional_parent_fd();
  }
  else
  {
    if ((optional_dp_class | v5) > 7
      || v5 - 5 < 2
      || ((int v12 = MCMCompareDataProtectionClassTarget_kDataProtectionClassPrecedence[v5], optional_dp_class - 5 >= 2)
        ? (int v13 = MCMCompareDataProtectionClassTarget_kDataProtectionClassPrecedence[optional_dp_class])
        : (int v13 = 2),
          v12 < v13))
    {
      container_traverse_node_get_optional_parent_fd();
      return 1;
    }
    int optional_parent_fd = container_traverse_node_get_optional_parent_fd();
    if (v12 <= v13) {
      return 1;
    }
  }
  if (optional_parent_fd < 0)
  {
    uint64_t path = container_traverse_node_get_path();
    long long v23 = xmmword_1D7815A78;
    uint64_t v24 = 0;
    unsigned int v22 = v5;
    if (!path)
    {
      uint64_t result = _os_crash();
      __break(1u);
      return result;
    }
    int v11 = (*(uint64_t (**)(uint64_t, long long *, unsigned int *, uint64_t, uint64_t))(*MEMORY[0x1E4F14868] + 648))(path, &v23, &v22, 4, 2048);
  }
  else
  {
    uint64_t v24 = 0;
    long long v23 = xmmword_1D7815A78;
    unsigned int v22 = v5;
    uint64_t v10 = *MEMORY[0x1E4F14868];
    if (name) {
      int v11 = (*(uint64_t (**)(void))(v10 + 656))();
    }
    else {
      int v11 = (*(uint64_t (**)(void))(v10 + 320))();
    }
  }
  if (v11 == -1)
  {
    int v16 = *__error();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_2;
    v20[3] = &__block_descriptor_36_e14___NSError_8__0l;
    int v21 = v16;
    uint64_t v17 = __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_2((uint64_t)v20);
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
    int v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    return 0;
  }
  return 1;
}

id __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_570(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"container_traverse_directory() failed"];
  v8[0] = @"FunctionName";
  BOOL v3 = [NSString stringWithUTF8String:"-[MCMFileManager setDataProtectionAtURL:toDataProtectionClass:directoriesOnly:recursive:error:]_block_invoke"];
  v9[0] = v3;
  v9[1] = &unk_1F2F11858;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  unsigned int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 32) userInfo:v5];

  return v6;
}

id __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_2(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"MCMSetDataProtectionClass() failed"];
  v8[0] = @"FunctionName";
  BOOL v3 = [NSString stringWithUTF8String:"-[MCMFileManager setDataProtectionAtURL:toDataProtectionClass:directoriesOnly:recursive:error:]_block_invoke_2"];
  v9[0] = v3;
  v9[1] = &unk_1F2F11840;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  unsigned int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 32) userInfo:v5];

  return v6;
}

- (BOOL)repairPermissionsAtURL:(id)a3 uid:(unsigned int)a4 gid:(unsigned int)a5 options:(unint64_t)a6 error:(id *)a7
{
  __int16 v8 = a6;
  v75[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  int v13 = 0;
  v75[0] = [v12 fileSystemRepresentation];
  v75[1] = 0;
  __s = 0;
  if (v8)
  {
    int v13 = [(MCMFileManager *)self _removeACLFilesec];
    if (!v13)
    {
      char v46 = 0;
      uint64_t v18 = 0;
      goto LABEL_62;
    }
  }
  uint64_t v14 = MEMORY[0x1E4F14868];
  if ((v8 & 2) != 0)
  {
    uint64_t v15 = [(MCMFileManager *)self _denyDeleteACLFilesecWithACLText:&__s];
    if (!v15)
    {
      uint64_t v18 = 0;
      char v46 = 0;
      if (v13) {
        goto LABEL_59;
      }
      goto LABEL_62;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  v55 = self;
  v56 = v15;
  unsigned int v53 = a4;
  uint64_t v16 = (*(uint64_t (**)(void *, uint64_t, void))(*(void *)v14 + 384))(v75, 84, 0);
  if (!v16)
  {
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke;
    v65[3] = &unk_1E6A80A30;
    id v47 = v12;
    id v66 = v47;
    uint64_t v18 = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke((uint64_t)v65);
    v48 = container_log_handle_for_category();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      int v50 = *__error();
      v51 = [v47 path];
      *(_DWORD *)v70 = 67240450;
      int v71 = v50;
      __int16 v72 = 2112;
      v73 = v51;
      _os_log_error_impl(&dword_1D7739000, v48, OS_LOG_TYPE_ERROR, "fts_open() failed (%{darwin.errno, public}d) on [%@]", v70, 0x12u);
    }
    char v46 = 0;
    goto LABEL_56;
  }
  uint64_t v17 = v16;
  unsigned int v52 = a5;
  uint64_t v18 = 0;
  v54 = a7;
  while (1)
  {
    uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 392))(v17);
    if (!v19) {
      break;
    }
    uint64_t v20 = v19;
    uint64_t v21 = (*(uint64_t (**)(void, uint64_t))(*(void *)v14 + 512))(*(void *)(v19 + 48), 0x200000);
    if ((v21 & 0x80000000) != 0)
    {
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_545;
      v64[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v64[4] = v20;
      uint64_t v30 = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_545((uint64_t)v64);

      uint64_t v31 = container_log_handle_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v37 = *__error();
        id v38 = *(void **)(v20 + 48);
        *(_DWORD *)v70 = 67240450;
        int v71 = v37;
        __int16 v72 = 2080;
        v73 = v38;
        _os_log_error_impl(&dword_1D7739000, v31, OS_LOG_TYPE_ERROR, "open() failed (%{darwin.errno, public}d) on path [%s]", v70, 0x12u);
      }

      int v32 = 2;
      uint64_t v18 = v30;
      goto LABEL_28;
    }
    uint64_t v22 = v21;
    memset(v74, 0, sizeof(v74));
    if ((*(unsigned int (**)(void))(*(void *)v14 + 336))())
    {
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_551;
      v63[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v63[4] = v20;
      long long v23 = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_551((uint64_t)v63);

      uint64_t v24 = container_log_handle_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = *__error();
        char v26 = *(void **)(v20 + 48);
        *(_DWORD *)v70 = 67240450;
        int v71 = v25;
        __int16 v72 = 2080;
        v73 = v26;
        uint64_t v27 = v70;
        unsigned int v28 = v24;
        int v29 = "fstat failed (%{darwin.errno, public}d) on open fd for path [%s]";
        goto LABEL_47;
      }
      goto LABEL_18;
    }
    bzero(v70, 0x878uLL);
    if ((*(unsigned int (**)(uint64_t, uint8_t *))(*(void *)v14 + 352))(v22, v70))
    {
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_557;
      v62[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v62[4] = v20;
      long long v23 = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_557((uint64_t)v62);

      uint64_t v24 = container_log_handle_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v43 = *__error();
        uint64_t v44 = *(void *)(v20 + 48);
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v69 = v43;
        *(_WORD *)&v69[4] = 2080;
        *(void *)&v69[6] = v44;
        uint64_t v27 = buf;
        unsigned int v28 = v24;
        int v29 = "fstatfs failed (%{darwin.errno, public}d) on open fd for path [%s]";
LABEL_47:
        _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, v29, v27, 0x12u);
      }
LABEL_18:
      int v33 = 0;
LABEL_19:

LABEL_20:
      uint64_t v18 = v23;
      goto LABEL_21;
    }
    v61 = v18;
    BOOL v35 = [(MCMFileManager *)v55 _fixFlagsOnFD:v22 FTSENT:v20 stat:v74 error:&v61];
    long long v23 = v61;

    if (!v35)
    {
      int v33 = 0;
      goto LABEL_20;
    }
    if ((WORD2(v74[0]) & 0xF000) != 0x4000 && WORD3(v74[0]) >= 2u)
    {
      uint64_t v24 = container_log_handle_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = *(void *)(v20 + 48);
        *(_DWORD *)buf = 136315394;
        *(void *)v69 = v45;
        *(_WORD *)&v69[8] = 1024;
        *(_DWORD *)&v69[10] = WORD3(v74[0]);
        _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "path [%s] is hardlinked [nlink: %d], skipping", buf, 0x12u);
      }
      int v33 = 1;
      goto LABEL_19;
    }
    if ((v8 & 3) != 0)
    {
      uint64_t v39 = *(void *)(v20 + 48);
      v60 = v23;
      BOOL v40 = [(MCMFileManager *)v55 _fixACLOnFD:v22 removeACLFilesec:v13 denyDeleteFilesec:v56 denyDeleteText:__s path:v39 error:&v60];
      uint64_t v18 = v60;

      if (!v40) {
        goto LABEL_45;
      }
      long long v23 = v18;
    }
    v59 = v23;
    BOOL v41 = [(MCMFileManager *)v55 _fixPOSIXPermsOnFD:v22 FTSENT:v20 stat:v74 error:&v59];
    uint64_t v18 = v59;

    if (!v41)
    {
LABEL_45:
      int v33 = 0;
      goto LABEL_21;
    }
    v58 = v18;
    BOOL v42 = [(MCMFileManager *)v55 _fixOwnershipOnFD:v22 FTSENT:v20 stat:v74 statfs:v70 uid:v53 gid:v52 error:&v58];
    uint64_t v24 = v58;

    if (v42)
    {
      v57 = v24;
      int v33 = [(MCMFileManager *)v55 _fixPOSIXBitsOnFD:v22 FTSENT:v20 stat:v74 error:&v57];
      long long v23 = v57;
      goto LABEL_19;
    }
    int v33 = 0;
    uint64_t v18 = v24;
LABEL_21:
    if ((*(unsigned int (**)(uint64_t))(*(void *)v14 + 152))(v22))
    {
      int v34 = container_log_handle_for_category();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        int v36 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v69 = v36;
        _os_log_error_impl(&dword_1D7739000, v34, OS_LOG_TYPE_ERROR, "close() failed (%{darwin.errno}d) on file descriptor.", buf, 8u);
      }

      if ((v33 & 1) == 0)
      {
LABEL_27:
        int v32 = 2;
        goto LABEL_28;
      }
    }
    else if (!v33)
    {
      goto LABEL_27;
    }
    int v32 = 0;
LABEL_28:
    if ((v8 & 0x100) == 0) {
      int v32 = 4;
    }
    if (v32)
    {
      if (v32 != 4)
      {
        a7 = v54;
        char v46 = 0;
        goto LABEL_55;
      }
      break;
    }
  }
  char v46 = 1;
  a7 = v54;
LABEL_55:
  (*(void (**)(uint64_t))(*(void *)v14 + 376))(v17);
LABEL_56:
  if (v56) {
    (*(void (**)(void))(*(void *)v14 + 272))();
  }
  if (v13) {
LABEL_59:
  }
    (*(void (**)(_filesec *))(*(void *)v14 + 272))(v13);
LABEL_62:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  if (a7)
  {
    uint64_t v18 = v18;
    *a7 = v18;
  }

  return v46 & 1;
}

id __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  BOOL v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"fts_open() failed on [%@]", v3];

  v10[0] = @"FunctionName";
  unsigned int v5 = [NSString stringWithUTF8String:"-[MCMFileManager repairPermissionsAtURL:uid:gid:options:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F117E0;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  __int16 v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

id __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_545(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"open() failed on path [%s]", *(void *)(*(void *)(a1 + 32) + 48));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager repairPermissionsAtURL:uid:gid:options:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F117F8;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  unsigned int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_551(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fstat() failed on path [%s]", *(void *)(*(void *)(a1 + 32) + 48));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager repairPermissionsAtURL:uid:gid:options:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11810;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  unsigned int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_557(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"fstatfs() failed on path [%s]", *(void *)(*(void *)(a1 + 32) + 48));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager repairPermissionsAtURL:uid:gid:options:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11828;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  unsigned int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (id)fsSanitizedStringFromString:(id)a3 allowSpaces:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (fsSanitizedStringFromString_allowSpaces__onceToken != -1) {
    dispatch_once(&fsSanitizedStringFromString_allowSpaces__onceToken, &__block_literal_global_531);
  }
  id v6 = (id)fsSanitizedStringFromString_allowSpaces__forbiddenCharactersDisallowingSpace;
  if (v4)
  {
    id v7 = (id)fsSanitizedStringFromString_allowSpaces__forbiddenCharactersAllowingSpace;

    id v6 = v7;
  }
  __int16 v8 = [v5 dataUsingEncoding:1 allowLossyConversion:1];
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithData:v8 encoding:1];
  uint64_t v10 = [v9 rangeOfCharacterFromSet:v6];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v10; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v9 rangeOfCharacterFromSet:v6])
      objc_msgSend(v9, "replaceCharactersInRange:withString:", i, 1, @"-");
  }
  if (([v9 isEqualToString:@".."] & 1) != 0
    || [v9 isEqualToString:@"."])
  {

    int v9 = 0;
  }
  id v12 = (void *)[v9 copy];

  return v12;
}

void __58__MCMFileManager_fsSanitizedStringFromString_allowSpaces___block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_"];
  uint64_t v1 = [v0 invertedSet];
  id v2 = (void *)fsSanitizedStringFromString_allowSpaces__forbiddenCharactersDisallowingSpace;
  fsSanitizedStringFromString_allowSpaces__forbiddenCharactersDisallowingSpace = v1;

  id v6 = [@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_" stringByAppendingString:@" "];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:");
  uint64_t v4 = [v3 invertedSet];
  id v5 = (void *)fsSanitizedStringFromString_allowSpaces__forbiddenCharactersAllowingSpace;
  fsSanitizedStringFromString_allowSpaces__forbiddenCharactersAllowingSpace = v4;
}

- (id)fsNodeOfURL:(id)a3 followSymlinks:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(&v14, 0, sizeof(v14));
  id v7 = a3;
  __int16 v8 = (const char *)[v7 fileSystemRepresentation];
  if (v6)
  {
    if (stat(v8, &v14)) {
      goto LABEL_3;
    }
  }
  else if (lstat(v8, &v14))
  {
LABEL_3:
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__MCMFileManager_fsNodeOfURL_followSymlinks_error___block_invoke;
    v12[3] = &unk_1E6A80A30;
    id v13 = v7;
    int v9 = __51__MCMFileManager_fsNodeOfURL_followSymlinks_error___block_invoke((uint64_t)v12);

    uint64_t v10 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v10 = [[MCMFSNode alloc] initWithStat:&v14];
  int v9 = 0;
  if (!a5) {
    goto LABEL_9;
  }
LABEL_7:
  if (!v10) {
    *a5 = v9;
  }
LABEL_9:

  return v10;
}

id __51__MCMFileManager_fsNodeOfURL_followSymlinks_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not determine fsNode of path [%@]", v3];

  v10[0] = @"FunctionName";
  id v5 = [NSString stringWithUTF8String:"-[MCMFileManager fsNodeOfURL:followSymlinks:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F117C8;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  __int16 v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

- (id)copyDescriptionOfURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  bzero(&v12, 0x878uLL);
  memset(&v11, 0, sizeof(v11));
  uint64_t v4 = (const char *)[a3 fileSystemRepresentation];
  id v5 = [NSString string];
  if (lstat(v4, &v11))
  {
    uint64_t v6 = objc_msgSend(v5, "stringByAppendingFormat:", @"lstat error = %d ", *__error());

    id v5 = v6;
    if (!statfs(v4, &v12)) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (statfs(v4, &v12))
  {
LABEL_5:
    uint64_t v6 = objc_msgSend(v5, "stringByAppendingFormat:", @"statfs error = %d ", *__error());

    goto LABEL_6;
  }
  int v9 = fflagstostr(v11.st_flags);
  uint64_t v6 = objc_msgSend(v5, "stringByAppendingFormat:", @"%d/0%o/[%s]/[%s]/%08x/%llx/%x-%x/%d", v11.st_uid, v11.st_mode, v9, v12.f_fstypename, v12.f_flags, v11.st_ino, v12.f_fsid.val[0], v12.f_fsid.val[1], v12.f_owner, v9, *(void *)&v11.st_dev);

  if (v9)
  {
    free(v9);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
LABEL_6:
  id v7 = (void *)[v6 copy];

  return v7;
}

- (BOOL)removeExclusionFromBackupFromURL:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"Removing backup exclusion unimplemented"];
    uint64_t v16 = @"FunctionName";
    id v7 = [NSString stringWithUTF8String:"-[MCMFileManager removeExclusionFromBackupFromURL:error:]_block_invoke"];
    uint64_t v19 = v7;
    uint64_t v20 = &unk_1F2F117B0;
    uint64_t v8 = *MEMORY[0x1E4F28568];
    uint64_t v17 = @"SourceFileLine";
    uint64_t v18 = v8;
    uint64_t v21 = v6;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v16 count:3];

    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:v9];
  }
  else
  {
    stat v11 = (void *)[[NSString alloc] initWithFormat:@"nil path when trying to remove backup exclusion"];
    uint64_t v16 = @"FunctionName";
    statfs v12 = [NSString stringWithUTF8String:"-[MCMFileManager removeExclusionFromBackupFromURL:error:]_block_invoke"];
    uint64_t v19 = v12;
    uint64_t v20 = &unk_1F2F11798;
    uint64_t v13 = *MEMORY[0x1E4F28568];
    uint64_t v17 = @"SourceFileLine";
    uint64_t v18 = v13;
    uint64_t v21 = v11;
    stat v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v16 count:3];

    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v14];

    if (a4)
    {
      id v10 = v10;
      *a4 = v10;
    }
  }

  return v5 != 0;
}

- (BOOL)fixUserPermissionsAtURL:(id)a3 limitToTopLevelURL:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v24 = 0;
  int v9 = [v7 path];
  id v10 = [v8 path];
  char v11 = [v9 hasPrefix:v10];

  if (v11)
  {
    int v20 = 0;
    id v12 = v7;
    if (_fix_permissions_on_path((const char *)[v12 fileSystemRepresentation], (const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v24, &v20))
    {
      id v13 = 0;
      goto LABEL_9;
    }
    char v24 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke_492;
    v17[3] = &unk_1E6A7F568;
    stat v14 = &v18;
    id v18 = v12;
    int v19 = v20;
    __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke_492((uint64_t)v17);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke;
    v21[3] = &unk_1E6A80510;
    stat v14 = &v22;
    id v22 = v7;
    id v23 = v8;
    __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke((uint64_t)v21);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5 && v13)
  {
    id v13 = v13;
    *a5 = v13;
  }
LABEL_9:
  char v15 = v24;

  return v15;
}

id __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = [*(id *)(a1 + 40) path];
  id v5 = (void *)[v2 initWithFormat:@"provided path [%@] not beneath limit path [%@]", v3, v4];

  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager fixUserPermissionsAtURL:limitToTopLevelURL:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11768;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v8];

  return v9;
}

id __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke_492(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"could not fix permissions at [%@]", v3];

  v10[0] = @"FunctionName";
  id v5 = [NSString stringWithUTF8String:"-[MCMFileManager fixUserPermissionsAtURL:limitToTopLevelURL:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11780;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 40) userInfo:v7];

  return v8;
}

- (unint64_t)dataWritingOptionsForFileAtURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  __int16 v16 = 0;
  uint64_t v4 = +[MCMFileManager defaultManager];
  id v15 = 0;
  char v5 = [v4 checkFileSystemAtURL:v3 isCaseSensitive:0 canAtomicSwap:(char *)&v16 + 1 error:&v15];
  id v6 = v15;

  if (v5)
  {
    uint64_t v7 = +[MCMFileManager defaultManager];
    id v14 = v6;
    char v8 = [v7 checkFileSystemAtURL:v3 supportsPerFileKeys:&v16 error:&v14];
    id v9 = v14;

    if (v8)
    {
      if ((_BYTE)v16) {
        unint64_t v10 = HIBYTE(v16) | 0x10000000;
      }
      else {
        unint64_t v10 = HIBYTE(v16);
      }
    }
    else
    {
      id v12 = container_log_handle_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v3;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "Could not check fs capabilities for data protection at [%@]: %@", buf, 0x16u);
      }

      unint64_t v10 = 0;
    }
    id v6 = v9;
  }
  else
  {
    char v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v3;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Could not check fs capabilities for atomic swap at [%@]: %@", buf, 0x16u);
    }

    unint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)stripACLFromURL:(id)a3 error:(id *)a4
{
  return [(MCMFileManager *)self _enumeratePOSIX1eACLEntriesAtURL:a3 error:a4 usingBlock:&__block_literal_global_455];
}

uint64_t __40__MCMFileManager_stripACLFromURL_error___block_invoke(int a1, acl_entry_t entry_d, unsigned char *a3, void *a4)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  acl_tag_t tag_type_p = ACL_UNDEFINED_TAG;
  acl_permset_t permset_p = 0;
  if (acl_get_tag_type(entry_d, &tag_type_p))
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Could not get ACL tag type."];
    v17[0] = @"FunctionName";
    uint64_t v8 = [NSString stringWithUTF8String:"-[MCMFileManager stripACLFromURL:error:]_block_invoke_2"];
    id v9 = (void *)v8;
    unint64_t v10 = &unk_1F2F11708;
LABEL_5:
    v18[0] = v8;
    v18[1] = v10;
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v17[1] = @"SourceFileLine";
    v17[2] = v11;
    v18[2] = v7;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v12];

    goto LABEL_6;
  }
  if (acl_get_permset(entry_d, &permset_p))
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Could not get ACL permset."];
    v17[0] = @"FunctionName";
    uint64_t v8 = [NSString stringWithUTF8String:"-[MCMFileManager stripACLFromURL:error:]_block_invoke"];
    id v9 = (void *)v8;
    unint64_t v10 = &unk_1F2F11720;
    goto LABEL_5;
  }
  if (tag_type_p == ACL_EXTENDED_DENY)
  {
    if (acl_delete_perm(permset_p, ACL_DELETE))
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Could not delete ACL_DELETE permission from permset."];
      v17[0] = @"FunctionName";
      uint64_t v8 = [NSString stringWithUTF8String:"-[MCMFileManager stripACLFromURL:error:]_block_invoke"];
      id v9 = (void *)v8;
      unint64_t v10 = &unk_1F2F11738;
      goto LABEL_5;
    }
    if (acl_set_permset(entry_d, permset_p))
    {
      id v13 = __40__MCMFileManager_stripACLFromURL_error___block_invoke_479();
    }
    else
    {
      id v13 = 0;
      *a3 = 1;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_6:
  if (a4) {
    *a4 = v13;
  }

  return 0;
}

id __40__MCMFileManager_stripACLFromURL_error___block_invoke_479()
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Could not set new permset on ACL entry."];
  v6[0] = @"FunctionName";
  uint64_t v1 = [NSString stringWithUTF8String:"-[MCMFileManager stripACLFromURL:error:]_block_invoke"];
  v7[0] = v1;
  v7[1] = &unk_1F2F11750;
  uint64_t v2 = *MEMORY[0x1E4F28568];
  v6[1] = @"SourceFileLine";
  v6[2] = v2;
  v7[2] = v0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v3];

  return v4;
}

- (BOOL)_enumeratePOSIX1eACLEntriesAtURL:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  v27[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (uint64_t (**)(id, acl_entry_t, void *, id *))a5;
  uint64_t v8 = (const char *)[a3 fileSystemRepresentation];
  if (!v8)
  {
    id v14 = (void *)[[NSString alloc] initWithFormat:@"URL is nil"];
    v26[0] = @"FunctionName";
    id v15 = [NSString stringWithUTF8String:"-[MCMFileManager _enumeratePOSIX1eACLEntriesAtURL:error:usingBlock:]_block_invoke"];
    v27[0] = v15;
    v27[1] = &unk_1F2F116C0;
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v26[1] = @"SourceFileLine";
    v26[2] = v16;
    v27[2] = v14;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v17];

    goto LABEL_7;
  }
  id v9 = v8;
  file = acl_get_file(v8, ACL_TYPE_EXTENDED);
  if (!file)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_441;
    v25[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v25[4] = v9;
    id v12 = __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_441((uint64_t)v25);
LABEL_7:
    LOBYTE(v13) = 0;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  uint64_t v11 = file;
  acl_entry_t entry_p = 0;
  if (acl_get_entry(file, 0, &entry_p))
  {
    id v12 = 0;
    LOBYTE(v13) = 1;
  }
  else
  {
    char v18 = 0;
    id v12 = 0;
    do
    {
      LOBYTE(v27[0]) = 0;
      id v23 = v12;
      int v13 = v7[2](v7, entry_p, v27, &v23);
      id v19 = v23;

      id v12 = v19;
      v18 |= LOBYTE(v27[0]) != 0;
      if (!a4) {
        int v13 = 1;
      }
    }
    while (v13 == 1 && !acl_get_entry(v11, -1, &entry_p));
    if ((v18 & 1) != 0 && acl_set_file(v9, ACL_TYPE_EXTENDED, v11))
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_447;
      v22[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v22[4] = v9;
      uint64_t v20 = __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_447((uint64_t)v22);

      LOBYTE(v13) = 0;
      id v12 = (void *)v20;
    }
  }
  acl_free(v11);
  if (a4)
  {
LABEL_18:
    if ((v13 & 1) == 0) {
      *a4 = v12;
    }
  }
LABEL_20:

  return v13;
}

id __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_441(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Could not get ACL for [%s]", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  uint64_t v2 = [NSString stringWithUTF8String:"-[MCMFileManager _enumeratePOSIX1eACLEntriesAtURL:error:usingBlock:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F116D8;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  char v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_447(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Could not set ACL for [%s]", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  uint64_t v2 = [NSString stringWithUTF8String:"-[MCMFileManager _enumeratePOSIX1eACLEntriesAtURL:error:usingBlock:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F116F0;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  char v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (BOOL)checkFileSystemAtURL:(id)a3 supportsPerFileKeys:(BOOL *)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 hasDirectoryPath])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v7 URLByDeletingLastPathComponent];
  }
  id v9 = v8;
  bzero(&v16, 0x878uLL);
  id v10 = v9;
  int v11 = statfs((const char *)[v10 fileSystemRepresentation], &v16);
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__MCMFileManager_checkFileSystemAtURL_supportsPerFileKeys_error___block_invoke;
    v14[3] = &unk_1E6A80A30;
    id v15 = v10;
    __65__MCMFileManager_checkFileSystemAtURL_supportsPerFileKeys_error___block_invoke((uint64_t)v14);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v12 = v12;
      *a5 = v12;
    }
  }
  else
  {
    id v12 = 0;
    if (a4) {
      *a4 = (v16.f_flags & 0x80) != 0;
    }
  }

  return v11 == 0;
}

id __65__MCMFileManager_checkFileSystemAtURL_supportsPerFileKeys_error___block_invoke(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not get statfs at [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager checkFileSystemAtURL:supportsPerFileKeys:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F116A8;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

- (BOOL)checkFileSystemAtURL:(id)a3 isCaseSensitive:(BOOL *)a4 canAtomicSwap:(BOOL *)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  long long v22 = xmmword_1D7815A08;
  uint64_t v23 = 0;
  if ([v9 hasDirectoryPath])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [v9 URLByDeletingLastPathComponent];
  }
  id v11 = v10;
  if (getattrlist((const char *)[v11 fileSystemRepresentation], &v22, &v30, 0x38uLL, 0))
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_423;
    v18[3] = &unk_1E6A80A30;
    id v12 = &v19;
    id v19 = v11;
    uint64_t v13 = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_423((uint64_t)v18);
    goto LABEL_10;
  }
  if (v30 != 56)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_420;
    v24[3] = &unk_1E6A7F658;
    id v12 = &v25;
    id v14 = v11;
    long long v26 = v30;
    long long v27 = v31;
    long long v28 = v32;
    id v25 = v14;
    uint64_t v29 = v33;
    uint64_t v13 = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_420((uint64_t)v24);
LABEL_10:
    id v15 = (id)v13;

    if (a6)
    {
      id v15 = v15;
      BOOL v16 = 0;
      *a6 = v15;
    }
    else
    {
      BOOL v16 = 0;
    }
    goto LABEL_18;
  }
  if ((BYTE10(v30) & 2) == 0)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke;
    v20[3] = &unk_1E6A80A30;
    id v12 = &v21;
    id v21 = v11;
    uint64_t v13 = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke((uint64_t)v20);
    goto LABEL_10;
  }
  if (a4) {
    *a4 = ((unsigned __int16)(WORD4(v32) & WORD4(v31)) >> 8) & 1;
  }
  id v15 = 0;
  if (a5) {
    *a5 = (BYTE14(v32) & BYTE14(v31) & 4) != 0;
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

id __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"getattrlist did not return volume capabilities for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager checkFileSystemAtURL:isCaseSensitive:canAtomicSwap:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11660;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v7];

  return v8;
}

id __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_420(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"getattrlist did not return correctly sized attributes buffer for [%@]: expected = %lu, got = %d", v3, 56, *(unsigned int *)(a1 + 40)];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager checkFileSystemAtURL:isCaseSensitive:canAtomicSwap:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11678;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v7];

  return v8;
}

id __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_423(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not get volume capabilities for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager checkFileSystemAtURL:isCaseSensitive:canAtomicSwap:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11690;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

- (BOOL)compareVolumeForURL:(id)a3 versusURL:(id)a4 isSameVolume:(BOOL *)a5 error:(id *)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  memset(v53, 0, sizeof(v53));
  memset(v52, 0, 36);
  long long v40 = xmmword_1D78159F0;
  uint64_t v41 = 0;
  long long v38 = xmmword_1D78159F0;
  uint64_t v39 = 0;
  if ([v9 hasDirectoryPath])
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v9 URLByDeletingLastPathComponent];
  }
  id v12 = v11;
  if ([v10 hasDirectoryPath])
  {
    id v13 = v10;
  }
  else
  {
    id v13 = [v10 URLByDeletingLastPathComponent];
  }
  id v14 = v13;
  id v15 = v12;
  if (getattrlist((const char *)[v15 fileSystemRepresentation], &v40, v53, 0x24uLL, 0))
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_397;
    v32[3] = &unk_1E6A80A30;
    BOOL v16 = &v33;
    id v33 = v15;
    uint64_t v17 = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_397((uint64_t)v32);
    goto LABEL_23;
  }
  if (*(_DWORD *)v53 != 36)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_391;
    v47[3] = &unk_1E6A7F630;
    BOOL v16 = &v48;
    id v48 = v15;
    long long v49 = *(_OWORD *)v53;
    long long v50 = *(_OWORD *)&v53[16];
    int v51 = *(_DWORD *)&v53[32];
    uint64_t v17 = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_391((uint64_t)v47);
    goto LABEL_23;
  }
  if ((v53[4] & 2) == 0)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke;
    v36[3] = &unk_1E6A80A30;
    BOOL v16 = &v37;
    id v37 = v15;
    uint64_t v17 = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke((uint64_t)v36);
    goto LABEL_23;
  }
  if ((v53[4] & 4) == 0)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    void v34[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_388;
    v34[3] = &unk_1E6A80A30;
    BOOL v16 = &v35;
    id v35 = v15;
    uint64_t v17 = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_388((uint64_t)v34);
    goto LABEL_23;
  }
  int v18 = *(_DWORD *)&v53[24];
  uint64_t v19 = *(void *)&v53[28];
  id v20 = v14;
  if (getattrlist((const char *)[v20 fileSystemRepresentation], &v38, v52, 0x24uLL, 0))
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_412;
    void v26[3] = &unk_1E6A80A30;
    BOOL v16 = &v27;
    id v27 = v20;
    uint64_t v17 = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_412((uint64_t)v26);
    goto LABEL_23;
  }
  if (LODWORD(v52[0]) != 36)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_409;
    v42[3] = &unk_1E6A7F630;
    BOOL v16 = &v43;
    id v43 = v20;
    long long v44 = v52[0];
    long long v45 = v52[1];
    int v46 = v52[2];
    uint64_t v17 = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_409((uint64_t)v42);
    goto LABEL_23;
  }
  if ((BYTE4(v52[0]) & 2) == 0)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_403;
    v30[3] = &unk_1E6A80A30;
    BOOL v16 = &v31;
    id v31 = v20;
    uint64_t v17 = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_403((uint64_t)v30);
    goto LABEL_23;
  }
  if ((BYTE4(v52[0]) & 4) == 0)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_406;
    v28[3] = &unk_1E6A80A30;
    BOOL v16 = &v29;
    id v29 = v20;
    uint64_t v17 = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_406((uint64_t)v28);
LABEL_23:
    id v21 = (id)v17;

    if (a6)
    {
      id v21 = v21;
      BOOL v22 = 0;
      *a6 = v21;
    }
    else
    {
      BOOL v22 = 0;
    }
    goto LABEL_26;
  }
  id v21 = 0;
  if (a5)
  {
    BOOL v25 = v18 == DWORD2(v52[1]) && v19 == *(void *)((char *)&v52[1] + 12);
    *a5 = v25;
  }
  BOOL v22 = 1;
LABEL_26:

  return v22;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"getattrlist did not return device ID for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F115A0;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v7];

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_388(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"getattrlist did not return device ID for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F115B8;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v7];

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_391(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"getattrlist did not return correctly sized attributes buffer for [%@]: expected = %lu, got = %d", v3, 36, *(unsigned int *)(a1 + 40)];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F115D0;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v7];

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_397(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not get attributes for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F115E8;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_403(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"getattrlist did not return device ID for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11600;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v7];

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_406(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"getattrlist did not return device ID for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11618;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v7];

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_409(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"getattrlist did not return correctly sized attributes buffer for [%@]: expected = %lu, got = %d", v3, 36, *(unsigned int *)(a1 + 40)];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11630;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v7];

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_412(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not get attributes for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11648;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 mode:(unsigned __int16)a6 error:(id *)a7
{
  int v8 = a6;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = v11;
  uint64_t v14 = [v13 bytes];
  uint64_t __s = 0;
  container_seam_fs_ensure_lazy_loaded();
  id v15 = (uint64_t *)MEMORY[0x1E4F14868];
  if ((a5 & 0xFFFFFFFF8FFFFFFELL) != 0)
  {
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke;
    v67[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v67[4] = a5 & 0xFFFFFFFF8FFFFFFELL;
    uint64_t v16 = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke((uint64_t)v67);
LABEL_3:
    uint64_t v17 = (void *)v16;
LABEL_4:
    id v18 = 0;
    BOOL v19 = 0;
    goto LABEL_5;
  }
  uint64_t v21 = *MEMORY[0x1E4F14868];
  unint64_t v22 = (a5 & 0xF0000000) - 0x10000000;
  if (v22 >> 28 > 4) {
    uint64_t v23 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v23 = *(unsigned int *)((char *)&unk_1D7815A20 + (v22 >> 26));
  }
  uint64_t v24 = *(void *)(v21 + 504);
  if ((a5 & 1) == 0)
  {
    id v18 = 0;
    uint64_t v25 = 1793;
    int v26 = -1;
    goto LABEL_22;
  }
  id v27 = v12;
  if (asprintf(&__s, "%s.atomic.XXXXXX", (const char *)[v27 fileSystemRepresentation]) < 0)
  {
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_347;
    v65[3] = &unk_1E6A80A30;
    id v66 = v27;
    uint64_t v17 = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_347((uint64_t)v65);

    goto LABEL_4;
  }
  uint64_t v28 = *v15;
  if (!v24)
  {
    int v29 = (*(uint64_t (**)(char *))(v28 + 496))(__s);
    if ((v29 & 0x80000000) == 0) {
      goto LABEL_21;
    }
LABEL_45:
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_353;
    v64[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v64[4] = __s;
    uint64_t v16 = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_353((uint64_t)v64);
    goto LABEL_3;
  }
  int v29 = (*(uint64_t (**)(char *, uint64_t, void))(v28 + 504))(__s, v23, 0);
  if (v29 < 0) {
    goto LABEL_45;
  }
LABEL_21:
  id v49 = v12;
  int v30 = v8;
  id v31 = a7;
  int v32 = v29;
  id v18 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:__s isDirectory:0 relativeToURL:0];
  int v26 = v32;
  a7 = v31;
  int v8 = v30;
  id v12 = v49;
  uint64_t v21 = *v15;
  uint64_t v25 = 256;
LABEL_22:
  unsigned int v50 = v26;
  if (v24) {
    uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v21 + 520))([v12 fileSystemRepresentation], v25, v23, 0);
  }
  else {
    uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 512))([v12 fileSystemRepresentation], v25);
  }
  uint64_t v34 = v33;
  int v35 = *__error();
  BOOL v37 = (a5 & 1) == 0 || v35 != 2;
  if ((v34 & 0x80000000) == 0 || !v37)
  {
    if (a5) {
      uint64_t v38 = v50;
    }
    else {
      uint64_t v38 = v34;
    }
    uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F14868] + 704))(v38, v14, [v13 length]);
    if (v39 == [v13 length])
    {
      if (a5)
      {
        id v15 = (uint64_t *)MEMORY[0x1E4F14868];
        int v40 = (*(uint64_t (**)(uint64_t))(*MEMORY[0x1E4F14868] + 688))(18);
        (*(void (**)(void))(*v15 + 688))();
        uint64_t v41 = v8 & ~v40;
        if (((*(uint64_t (**)(void, uint64_t))(*v15 + 208))(v50, v41) & 0x80000000) != 0)
        {
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_371;
          v55[3] = &unk_1E6A7F608;
          v56 = v18;
          __int16 v57 = v41;
          uint64_t v17 = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_371((uint64_t)v55);
          BOOL v19 = 0;
          BOOL v42 = v56;
          goto LABEL_54;
        }
        if ((v34 & 0x80000000) != 0)
        {
          unsigned int v48 = 4;
        }
        else
        {
          (*(void (**)(uint64_t))(*v15 + 152))(v34);
          unsigned int v48 = 2;
          uint64_t v34 = 0xFFFFFFFFLL;
        }
        (*(void (**)(void))(*v15 + 152))(v50);
        id v43 = *(uint64_t (**)(uint64_t, uint64_t, void))(*v15 + 640);
        id v51 = v18;
        uint64_t v44 = [v51 fileSystemRepresentation];
        id v45 = v12;
        if ((v43(v44, [v45 fileSystemRepresentation], v48) & 0x80000000) != 0)
        {
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_377;
          _OWORD v52[3] = &unk_1E6A80510;
          id v18 = v51;
          id v53 = v18;
          id v54 = v45;
          uint64_t v17 = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_377((uint64_t)v52);

          BOOL v19 = 0;
          id v15 = (uint64_t *)MEMORY[0x1E4F14868];
          goto LABEL_5;
        }
        unsigned int v50 = -1;
      }
      BOOL v42 = container_log_handle_for_category();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = [v12 path];
        uint64_t v47 = [v13 length];
        *(_DWORD *)buf = 138544130;
        v70 = v46;
        __int16 v71 = 2050;
        uint64_t v72 = v47;
        __int16 v73 = 2050;
        unint64_t v74 = a5;
        __int16 v75 = 1026;
        int v76 = v8;
        _os_log_impl(&dword_1D7739000, v42, OS_LOG_TYPE_DEFAULT, "Wrote [%{public}@], length = %{public}lu, options = 0x%{public}lx, mode = 0%{public}o", buf, 0x26u);
      }
      uint64_t v17 = 0;
      BOOL v19 = 1;
    }
    else
    {
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_365;
      v58[3] = &unk_1E6A80A30;
      v59 = v12;
      uint64_t v17 = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_365((uint64_t)v58);
      BOOL v19 = 0;
      BOOL v42 = v59;
    }
    id v15 = (uint64_t *)MEMORY[0x1E4F14868];
LABEL_54:

    if ((v34 & 0x80000000) == 0) {
      (*(void (**)(uint64_t))(*v15 + 152))(v34);
    }
    goto LABEL_56;
  }
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_359;
  v60[3] = &unk_1E6A7FFA0;
  id v61 = v12;
  id v62 = v18;
  int v63 = v35;
  uint64_t v17 = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_359((uint64_t)v60);

  BOOL v19 = 0;
  id v15 = (uint64_t *)MEMORY[0x1E4F14868];
LABEL_56:
  if ((v50 & 0x80000000) == 0) {
    (*(void (**)(void))(*v15 + 152))();
  }
LABEL_5:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  if (v18) {
    (*(void (**)(uint64_t))(*v15 + 696))([v18 fileSystemRepresentation]);
  }
  if (a7 && v17) {
    *a7 = v17;
  }

  return v19;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unsupported data writing options: 0x%lx", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F114F8;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  char v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:v4];

  return v5;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_347(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not allocate memory for temporary filename for [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11510;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_353(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Could not open temp [%s] for create+writing", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11528;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  char v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_359(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = [*(id *)(a1 + 40) path];
  char v5 = (void *)[v2 initWithFormat:@"Could not open [%@] -> [%@] for create+writing", v3, v4];

  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11540;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 48) userInfo:v8];

  return v9;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_365(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not write to [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11558;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_371(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not chmod temp file [%@] to 0%o", v3, *(unsigned __int16 *)(a1 + 40)];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11570;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_377(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = [*(id *)(a1 + 40) path];
  char v5 = (void *)[v2 initWithFormat:@"Could not swap temp file [%@] with destination file [%@]", v3, v4];

  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11588;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

- (id)readDataFromURL:(id)a3 options:(unint64_t)a4 fsNode:(id *)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = v9;
  uint64_t __s = 0;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke;
    v50[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v50[4] = a4 & 0xFFFFFFFFFFFFFFFDLL;
    id v11 = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke((uint64_t)v50);
    id v12 = 0;
    id v13 = 0;
    int v14 = -1;
    goto LABEL_33;
  }
  id v15 = v9;
  int v16 = open((const char *)[v15 fileSystemRepresentation], 256);
  int v14 = v16;
  if (v16 < 0)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_307;
    v48[3] = &unk_1E6A80A30;
    id v49 = v15;
    id v11 = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_307((uint64_t)v48);
    int v26 = v49;
LABEL_18:

    id v12 = 0;
    id v13 = 0;
    goto LABEL_33;
  }
  if ((a4 & 2) != 0) {
    fcntl(v16, 48, 1);
  }
  uint64_t v17 = (char *)malloc_type_calloc(1uLL, 0x4000uLL, 0xB296B477uLL);
  uint64_t __s = v17;
  if (!v17)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_313;
    void v45[3] = &unk_1E6A80498;
    uint64_t v47 = 0x4000;
    id v46 = v15;
    id v11 = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_313((uint64_t)v45);
    int v26 = v46;
    goto LABEL_18;
  }
  id v18 = v17;
  uint64_t v34 = v15;
  int v35 = v10;
  uint64_t v19 = 0;
  unint64_t v20 = 0x4000;
  size_t v21 = 0x4000;
  do
  {
    unint64_t v22 = read(v14, &v18[v19], v21);
    if ((v22 & 0x8000000000000000) != 0)
    {
      uint64_t __s = v18;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_319;
      v43[3] = &unk_1E6A80A30;
      id v44 = v34;
      id v11 = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_319((uint64_t)v43);
      id v27 = v44;
      goto LABEL_21;
    }
    unint64_t v23 = v22;
    size_t v24 = v21 - v22;
    v19 += v22;
    if (v22 < v21 - v22) {
      break;
    }
    if (v20 > 0x9FC000)
    {
      uint64_t __s = v18;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_325;
      v41[3] = &unk_1E6A80A30;
      id v42 = v34;
      id v11 = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_325((uint64_t)v41);
      id v27 = v42;
LABEL_21:

      id v13 = 0;
      id v10 = v35;
LABEL_32:
      free(v18);
      memset_s(&__s, 8uLL, 0, 8uLL);
      id v12 = 0;
      goto LABEL_33;
    }
    uint64_t v25 = (char *)malloc_type_realloc(v18, v20 + 0x4000, 0x9DCD03D8uLL);
    if (!v25)
    {
      uint64_t __s = 0;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_331;
      v38[3] = &unk_1E6A80498;
      unint64_t v40 = v20 + 0x4000;
      id v39 = v34;
      id v11 = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_331((uint64_t)v38);

      id v12 = 0;
      id v13 = 0;
      id v10 = v35;
      goto LABEL_33;
    }
    id v18 = v25;
    size_t v21 = v24 + 0x4000;
    v20 += 0x4000;
  }
  while (v23);
  uint64_t __s = v18;
  if (a5)
  {
    memset(&v58, 0, sizeof(v58));
    id v10 = v35;
    if (fstat(v14, &v58))
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_334;
      v36[3] = &unk_1E6A80A30;
      id v37 = v34;
      id v11 = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_334((uint64_t)v36);

      id v13 = 0;
      goto LABEL_32;
    }
    if (v19 != v58.st_size)
    {
      uint64_t v28 = container_log_handle_for_category();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = [v34 path];
        *(_DWORD *)buf = 134218498;
        uint64_t v53 = v19;
        __int16 v54 = 2112;
        v55 = v33;
        __int16 v56 = 2048;
        off_t st_size = v58.st_size;
        _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Read size (%zd) of file [%@] did not match its length (%llu). Possibly a concurrent write+read.", buf, 0x20u);

        id v10 = v35;
      }
    }
    id v13 = [[MCMFSNode alloc] initWithStat:&v58];
  }
  else
  {
    id v13 = 0;
    id v10 = v35;
  }
  id v12 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v18 length:v19];
  int v29 = container_log_handle_for_category();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = [v34 path];
    __darwin_ino64_t v31 = [v12 length];
    v58.st_dev = 138543874;
    *(void *)&v58.int st_mode = v30;
    WORD2(v58.st_ino) = 2050;
    *(__darwin_ino64_t *)((char *)&v58.st_ino + 6) = v31;
    HIWORD(v58.st_gid) = 2050;
    *(void *)&v58.st_rdev = a4;
    _os_log_impl(&dword_1D7739000, v29, OS_LOG_TYPE_DEFAULT, "Read [%{public}@], length = %{public}lu, options = 0x%{public}lx", (uint8_t *)&v58, 0x20u);
  }
  id v11 = 0;
  id v18 = __s;
  if (!v12) {
    goto LABEL_32;
  }
LABEL_33:
  close(v14);
  if (a6 && v11) {
    *a6 = v11;
  }
  if (a5 && v12) {
    *a5 = v13;
  }

  return v12;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unsupported data reading options: 0x%lx", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11450;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  char v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:v4];

  return v5;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_307(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not open [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11468;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_313(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) path];
  char v5 = (void *)[v2 initWithFormat:@"Could not allocate %zu bytes for [%@]", v3, v4];

  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11480;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:v8];

  return v9;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_319(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not read [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11498;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_325(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"File [%@] is too large: >%llu", v3, 10485760];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F114B0;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:v7];

  return v8;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_331(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) path];
  char v5 = (void *)[v2 initWithFormat:@"Could not allocate %zu bytes for [%@]", v3, v4];

  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F114C8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:v8];

  return v9;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_334(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"Could not stat [%@]", v3];

  v10[0] = @"FunctionName";
  char v5 = [NSString stringWithUTF8String:"-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F114E0;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v7];

  return v8;
}

- (id)readDataFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return [(MCMFileManager *)self readDataFromURL:a3 options:a4 fsNode:0 error:a5];
}

- (id)realPathForURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  bzero(v18, 0x401uLL);
  uint64_t v8 = [a3 fileSystemRepresentation];
  if (container_realpath())
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__MCMFileManager_realPathForURL_isDirectory_error___block_invoke;
    v13[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v13[4] = v8;
    id v9 = __51__MCMFileManager_realPathForURL_isDirectory_error___block_invoke((uint64_t)v13);
    id v10 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v11 = container_log_handle_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = v8;
    __int16 v16 = 2080;
    uint64_t v17 = v18;
    _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, "container_realpath([%s]) → [%s]", buf, 0x16u);
  }

  id v10 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v18 isDirectory:v6 relativeToURL:0];
  id v9 = 0;
  if (a5)
  {
LABEL_7:
    if (!v10) {
      *a5 = v9;
    }
  }
LABEL_9:

  return v10;
}

id __51__MCMFileManager_realPathForURL_isDirectory_error___block_invoke(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"container_realpath([%s]) failed", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager realPathForURL:isDirectory:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F11438;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  char v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (char *)a3;
  uint64_t v7 = (char *)a4;
  bzero(v98, 0x401uLL);
  if (!v6 || !v7)
  {
    uint64_t v25 = container_log_handle_for_category();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412546;
    v87 = v7;
    __int16 v88 = 2112;
    v89 = v6;
    int v30 = "The base path %@ and/or suspicious path %@ were nil";
    __darwin_ino64_t v31 = v25;
    uint32_t v32 = 22;
    goto LABEL_14;
  }
  uint64_t v8 = [v7 path];
  int v9 = [v8 hasPrefix:@"/private/"];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    id v11 = [v7 path];
    id v12 = [v11 substringFromIndex:objc_msgSend(@"/private", "length")];
    uint64_t v13 = [v10 fileURLWithPath:v12];

    uint64_t v7 = (char *)v13;
  }
  int v14 = [v6 path];
  int v15 = [v14 hasPrefix:@"/private/"];

  if (v15)
  {
    __int16 v16 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v17 = [v6 path];
    id v18 = [v17 substringFromIndex:objc_msgSend(@"/private", "length")];
    uint64_t v19 = [v16 fileURLWithPath:v18];

    BOOL v6 = (char *)v19;
  }
  unint64_t v20 = [v6 path];
  size_t v21 = [v7 path];
  char v22 = [v20 hasPrefix:v21];

  if ((v22 & 1) == 0)
  {
    uint64_t v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = [v6 path];
      id v51 = [v7 path];
      *(_DWORD *)buf = 138412546;
      v87 = v26;
      __int16 v88 = 2112;
      v89 = v51;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "supiscious path %@ does not contain base path %@ as a prefix", buf, 0x16u);

      goto LABEL_42;
    }
    goto LABEL_16;
  }
  unint64_t v23 = [v6 pathComponents];
  int v24 = [v23 containsObject:@".."];

  if (v24)
  {
    uint64_t v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = [v6 path];
      *(_DWORD *)buf = 138412290;
      v87 = v26;
      id v27 = "The suspicious path %@ contains '..' paths, which are invalid";
LABEL_11:
      uint64_t v28 = v25;
      uint32_t v29 = 12;
LABEL_27:
      _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
LABEL_42:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  BOOL v6 = v6;
  ssize_t v40 = readlink((const char *)[v6 fileSystemRepresentation], v98, 0x400uLL);
  if (v40 == -1)
  {
    if (*__error() == 22 || *__error() == 2)
    {
      uint64_t v34 = [v6 path];
      uint64_t v33 = 0;
      goto LABEL_33;
    }
    uint64_t v25 = container_log_handle_for_category();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    unsigned int v52 = __error();
    uint64_t v53 = strerror(*v52);
    *(_DWORD *)buf = 136315138;
    v87 = v53;
    int v30 = "Readlink failed: %s";
    __darwin_ino64_t v31 = v25;
    uint32_t v32 = 12;
LABEL_14:
    _os_log_error_impl(&dword_1D7739000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
    goto LABEL_16;
  }
  if (v98[0] == 47)
  {
    uint64_t v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = [v6 path];
      *(_DWORD *)buf = 138412546;
      v87 = v26;
      __int16 v88 = 2080;
      v89 = v98;
      id v27 = "Rejecting %@ -> %s, as absolute symlinks are not allowed";
      uint64_t v28 = v25;
      uint32_t v29 = 22;
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  unsigned int v85 = 0;
  uint64_t v41 = [v7 path];
  BOOL v42 = [(MCMFileManager *)self _validateSymlink:v41 withStartingDepth:0 andEndingDepth:&v85];

  if (!v42)
  {
    uint64_t v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = [v7 path];
      *(_DWORD *)buf = 138412290;
      v87 = v26;
      id v27 = "Failed to retrieve depth of %@";
      goto LABEL_11;
    }
LABEL_16:

    uint64_t v33 = 0;
    uint64_t v34 = 0;
LABEL_17:
    int v35 = 0;
LABEL_18:
    id v36 = 0;
LABEL_19:
    id v37 = 0;
    goto LABEL_20;
  }
  id v43 = [v6 path];
  id v44 = [v7 path];
  id v45 = objc_msgSend(v43, "substringFromIndex:", objc_msgSend(v44, "length"));

  uint64_t v33 = [v45 stringByDeletingLastPathComponent];

  id v46 = [NSString stringWithFileSystemRepresentation:v98 length:v40];
  uint64_t v34 = [v33 stringByAppendingPathComponent:v46];

  if (![(MCMFileManager *)self _validateSymlink:v34 withStartingDepth:v85 andEndingDepth:0])
  {
    id v49 = container_log_handle_for_category();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      unsigned int v50 = [v6 path];
      uint64_t v72 = [v7 path];
      *(_DWORD *)buf = 138412802;
      v87 = v50;
      __int16 v88 = 2112;
      v89 = v34;
      __int16 v90 = 2112;
      v91 = v72;
      _os_log_error_impl(&dword_1D7739000, v49, OS_LOG_TYPE_ERROR, "Rejecting %@ -> %@, as it is points outside or to the base %@", buf, 0x20u);

      goto LABEL_67;
    }
LABEL_49:

    goto LABEL_17;
  }
LABEL_33:
  uint64_t v47 = [(MCMFileManager *)self _realPathForURL:v7 allowNonExistentPathComponents:0];
  if (!v47)
  {
    id v49 = container_log_handle_for_category();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      unsigned int v50 = [v7 path];
      *(_DWORD *)buf = 138412290;
      v87 = v50;
      _os_log_error_impl(&dword_1D7739000, v49, OS_LOG_TYPE_ERROR, "Failed to retrieve realpath for base path %@ ", buf, 0xCu);
LABEL_67:

      goto LABEL_49;
    }
    goto LABEL_49;
  }
  int v35 = (void *)v47;
  unsigned int v48 = [(MCMFileManager *)self _realPathForURL:v6 allowNonExistentPathComponents:1];
  if (!v48)
  {
    __int16 v54 = container_log_handle_for_category();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      __int16 v71 = [v6 path];
      *(_DWORD *)buf = 138412290;
      v87 = v71;
      _os_log_error_impl(&dword_1D7739000, v54, OS_LOG_TYPE_ERROR, "Failed to retrieve realpath for suspicious path %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  id v36 = v48;
  if (v40 == -1)
  {
    v55 = [v48 pathComponents];
    v83 = [v35 pathComponents];
    unint64_t v56 = [v83 count];
    v84 = v55;
    unint64_t v57 = [v55 count];
    if (v57 < 2 || v56 <= 1)
    {
      int v63 = container_log_handle_for_category();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v81 = [v6 path];
        v64 = [v7 path];
        v65 = [v36 path];
        uint64_t v77 = [v35 path];
        *(_DWORD *)buf = 138413058;
        v87 = v81;
        __int16 v88 = 2112;
        v89 = v64;
        __int16 v90 = 2112;
        v91 = v65;
        __int16 v92 = 2112;
        uint64_t v93 = v77;
        v67 = (void *)v77;
        v68 = "Rejecting %@ with base %@ because real component counts don't make sense (reals %@ ; %@)";
        goto LABEL_71;
      }
    }
    else
    {
      unint64_t v58 = v57;
      unint64_t v59 = 1;
      v60 = [v83 objectAtIndexedSubscript:1];
      if ([v60 isEqualToString:@"private"]) {
        unint64_t v59 = 2;
      }

      [v84 objectAtIndexedSubscript:1];
      id v61 = v79 = v56;
      if ([v61 isEqualToString:@"private"]) {
        uint64_t v62 = 2;
      }
      else {
        uint64_t v62 = 1;
      }

      if (v79 - v59 <= v58 - v62)
      {
        if (v79 <= v59)
        {
LABEL_65:

          goto LABEL_36;
        }
        while (1)
        {
          v69 = [v83 objectAtIndexedSubscript:v59];
          v70 = [v84 objectAtIndexedSubscript:v62];
          char v82 = [v69 isEqualToString:v70];

          if ((v82 & 1) == 0) {
            break;
          }
          ++v59;
          ++v62;
          if (v79 == v59) {
            goto LABEL_65;
          }
        }
        uint64_t v73 = v62;
        int v63 = container_log_handle_for_category();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v81 = [v6 path];
          v80 = [v7 path];
          v78 = [v36 path];
          unint64_t v74 = [v35 path];
          __int16 v75 = [v83 objectAtIndexedSubscript:v59];
          int v76 = [v84 objectAtIndexedSubscript:v73];
          *(_DWORD *)buf = 138413570;
          v87 = v81;
          __int16 v88 = 2112;
          v89 = v80;
          __int16 v90 = 2112;
          v91 = v78;
          __int16 v92 = 2112;
          uint64_t v93 = (uint64_t)v74;
          __int16 v94 = 2112;
          v95 = v75;
          __int16 v96 = 2112;
          v97 = v76;
          _os_log_error_impl(&dword_1D7739000, v63, OS_LOG_TYPE_ERROR, "Rejecting %@ with base %@ (reals %@ ; %@) because components diverge at %@ != %@",
            buf,
            0x3Eu);

LABEL_72:
        }
      }
      else
      {
        int v63 = container_log_handle_for_category();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v81 = [v6 path];
          v64 = [v7 path];
          v65 = [v36 path];
          uint64_t v66 = [v35 path];
          *(_DWORD *)buf = 138413058;
          v87 = v81;
          __int16 v88 = 2112;
          v89 = v64;
          __int16 v90 = 2112;
          v91 = v65;
          __int16 v92 = 2112;
          uint64_t v93 = v66;
          v67 = (void *)v66;
          v68 = "Rejecting %@ with base %@ because base component count is greater than child component count (reals %@ ; %@)";
LABEL_71:
          _os_log_error_impl(&dword_1D7739000, v63, OS_LOG_TYPE_ERROR, v68, buf, 0x2Au);

          goto LABEL_72;
        }
      }
    }

    goto LABEL_19;
  }
LABEL_36:
  id v36 = v36;
  id v37 = v36;
LABEL_20:
  id v38 = v37;

  return v38;
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v19 = a5;
    id v20 = v7;
    [v7 pathComponents];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      signed int v13 = a4;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        int v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
        if ([v15 isEqualToString:@".."]) {
          break;
        }
        if (([v15 isEqualToString:&stru_1F2EF6598] & 1) == 0
          && ([v15 isEqualToString:@"."] & 1) == 0)
        {
          int v16 = [v15 isEqualToString:@"/"] ^ 1;
LABEL_12:
          v13 += v16;
          if (v13 < (int)a4)
          {

            BOOL v17 = 0;
            goto LABEL_22;
          }
        }
        if (v11 == ++v14)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v21 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_19;
        }
      }
      int v16 = -1;
      goto LABEL_12;
    }
    signed int v13 = a4;
LABEL_19:

    if (v19) {
      unsigned int *v19 = v13;
    }
    BOOL v17 = 1;
LABEL_22:
    uint64_t v8 = v20;
  }
  else
  {
    id v9 = 0;
    BOOL v17 = 0;
  }

  return v17;
}

- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v17 = 0;
  id v7 = -[MCMFileManager realPathForURL:isDirectory:error:](self, "realPathForURL:isDirectory:error:", v6, [v6 hasDirectoryPath], &v17);
  id v8 = v17;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v10 = [v8 domain];
    if ([v10 isEqualToString:*MEMORY[0x1E4F28798]] && objc_msgSend(v9, "code") == 2)
    {

      if (v4)
      {
        uint64_t v11 = [v6 path];
        id v12 = [(MCMFileManager *)self _realPathWhatExistsInPath:v11];

        goto LABEL_11;
      }
    }
    else
    {
    }
    signed int v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v6 path];
      uint64_t v16 = [v15 fileSystemRepresentation];
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      size_t v21 = v9;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Failed to realpath [%s] : %@", buf, 0x16u);
    }
  }
  id v12 = v7;
LABEL_11:

  return v12;
}

- (id)_realPathWhatExistsInPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 pathComponents];
  uint64_t v5 = [v4 count];
  uint64_t v6 = v5 - 1;
  if (v5 == 1)
  {
    id v9 = 0;
  }
  else
  {
    do
    {
      id v7 = objc_msgSend(v4, "subarrayWithRange:", 0, v6 + 1);
      id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v7];
      id v9 = 0;
      if ([(MCMFileManager *)self itemExistsAtURL:v8])
      {
        uint64_t v10 = [(MCMFileManager *)self _realPathForURL:v8 allowNonExistentPathComponents:0];
        if (v10)
        {
          uint64_t v11 = objc_msgSend(v4, "subarrayWithRange:", v6 + 1, objc_msgSend(v4, "count") - (v6 + 1));
          id v12 = [NSString pathWithComponents:v11];
          signed int v13 = container_log_handle_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            id v15 = [v10 path];
            *(_DWORD *)buf = 138412546;
            id v17 = v15;
            __int16 v18 = 2112;
            uint64_t v19 = v12;
            _os_log_debug_impl(&dword_1D7739000, v13, OS_LOG_TYPE_DEBUG, "Realpathed %@ ; appending non-existing components %@",
              buf,
              0x16u);
          }
          id v9 = [v10 URLByAppendingPathComponent:v12 isDirectory:0];
        }
        else
        {
          id v9 = 0;
        }
      }
      if (v9) {
        break;
      }
      --v6;
    }
    while (v6);
  }

  return v9;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)diskUsageForURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 path];
  uint64_t v5 = [v4 fileSystemRepresentation];
  uint64_t v6 = container_log_handle_for_category();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v3);

  id v8 = container_log_handle_for_category();
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v30 = (uint64_t)v4;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CalculatingDiskUsage", " path=%{private, signpost.description:attribute}@ ", buf, 0xCu);
  }

  if (!v5)
  {
    uint64_t v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = (uint64_t)v3;
      uint64_t v14 = "Failed to get path to url %@";
      id v15 = v10;
      uint32_t v16 = 12;
      goto LABEL_20;
    }
    goto LABEL_9;
  }
  unint64_t v27 = 0;
  unint64_t v28 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, unint64_t *, uint64_t))(*MEMORY[0x1E4F14868] + 184))(v5, 2, &v27, 16))
  {
    uint64_t v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = *__error();
      id v12 = __error();
      signed int v13 = strerror(*v12);
      *(_DWORD *)buf = 136446722;
      uint64_t v30 = v5;
      __int16 v31 = 1024;
      *(_DWORD *)uint32_t v32 = v11;
      *(_WORD *)&void v32[4] = 2080;
      *(void *)&v32[6] = v13;
      uint64_t v14 = "Failed to get dirstats on %{public}s using fallback: (err %d) %s";
      id v15 = v10;
      uint32_t v16 = 28;
LABEL_20:
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  unint64_t v18 = v27;
  if ((v27 & 0x8000000000000000) != 0)
  {
    uint64_t v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t v23 = v27;
      int v24 = *__error();
      long long v25 = __error();
      uint64_t v26 = strerror(*v25);
      *(_DWORD *)buf = 134218754;
      uint64_t v30 = v23;
      __int16 v31 = 2082;
      *(void *)uint32_t v32 = v5;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = v24;
      *(_WORD *)&v32[14] = 2080;
      *(void *)&v32[16] = v26;
      uint64_t v14 = "Invalid size (%lld) from dirstats on %{public}s using fallback: (err %d) %s";
      id v15 = v10;
      uint32_t v16 = 38;
      goto LABEL_20;
    }
LABEL_9:
    unint64_t v17 = 0;
    unint64_t v18 = 0;
    goto LABEL_10;
  }
  unint64_t v17 = v28;
  uint64_t v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v30 = v5;
    __int16 v31 = 2048;
    *(void *)uint32_t v32 = v17;
    *(_WORD *)&v32[8] = 2048;
    *(void *)&v32[10] = v18;
    _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s]: descendants: %llu, total size: %llu, using fallback", buf, 0x20u);
  }
LABEL_10:

  uint64_t v19 = container_log_handle_for_category();
  uint64_t v20 = v19;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138478339;
    uint64_t v30 = (uint64_t)v4;
    __int16 v31 = 2050;
    *(void *)uint32_t v32 = v17;
    *(_WORD *)&v32[8] = 2049;
    *(void *)&v32[10] = v18;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v20, OS_SIGNPOST_INTERVAL_END, v7, "CalculatingDiskUsage", " path=%{private, signpost.description:attribute}@  numNodes=%{public, signpost.description:attribute}llu  size=%{private, signpost.description:attribute}llu ", buf, 0x20u);
  }

  unint64_t v21 = v18;
  unint64_t v22 = v17;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)fastDiskUsageForURL:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_os_feature_enabled_impl())
  {
LABEL_42:
    uint64_t v31 = -[MCMFileManager diskUsageForURL:](self, "diskUsageForURL:", v4, v41, v42);
    unint64_t v29 = v36;
    goto LABEL_43;
  }
  uint64_t v44 = 0;
  id v5 = [v4 path];
  uint64_t v6 = [v5 fileSystemRepresentation];
  os_signpost_id_t v7 = container_log_handle_for_category();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v4);

  id v9 = container_log_handle_for_category();
  uint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138477827;
    *(void *)&uint8_t buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CalculatingDiskUsage", " path=%{private, signpost.description:attribute}@ ", buf, 0xCu);
  }

  if (_os_feature_enabled_impl())
  {
    *(void *)id v45 = 0;
    *(void *)&v45[8] = 0;
    uint64_t v12 = MEMORY[0x1E4F14868];
    int v13 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, uint64_t))(*MEMORY[0x1E4F14868] + 184))(v6, 1, v45, 16);
    int v14 = *__error();
    if (_os_feature_enabled_impl() && v13 && v14 == 45)
    {
      *(void *)id v45 = 0;
      *(void *)&v45[8] = 0;
      int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, void))(*(void *)v12 + 312))(v6, 2148026882, &v44, 0);
      int v16 = *__error();
      unint64_t v17 = container_log_handle_for_category();
      unint64_t v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v16;
          _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "[%{public}s] Failed to set maintain-dir-stats: %{darwin.errno}d", buf, 0x12u);
        }
        unint64_t v11 = v8 - 1;
        goto LABEL_32;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_impl(&dword_1D7739000, v18, OS_LOG_TYPE_INFO, "[%{public}s] Enabled APFSIOC_MAINTAIN_DIR_STATS", buf, 0xCu);
      }

      int v13 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, uint64_t))(*(void *)v12 + 184))(v6, 1, v45, 16);
      int v14 = *__error();
      unint64_t v11 = v8 - 1;
    }
    if (v13)
    {
      unint64_t v18 = container_log_handle_for_category();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14;
      long long v25 = "[%{public}s] Failed to get dirstats: %{darwin.errno}d";
      uint64_t v26 = buf;
LABEL_47:
      id v39 = v18;
      uint32_t v40 = 18;
      goto LABEL_48;
    }
    uint64_t v31 = *(void *)v45;
    if ((*(void *)v45 & 0x8000000000000000) != 0)
    {
      unint64_t v18 = container_log_handle_for_category();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = *(void *)v45;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = v14;
      long long v25 = "[%{public}s] Invalid size (%lld) from dirstats: %{darwin.errno}d";
      uint64_t v26 = buf;
      id v39 = v18;
      uint32_t v40 = 28;
LABEL_48:
      _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, v25, v26, v40);
      goto LABEL_32;
    }
    os_signpost_id_t v41 = v11;
    os_signpost_id_t v42 = v8;
    uint64_t v28 = 0;
    uint64_t v30 = 0;
    uint64_t v27 = 0;
    unint64_t v29 = *(void *)&v45[8];
  }
  else
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v47 = 0u;
    memset(buf, 0, sizeof(buf));
    memset_s(buf, 0x110uLL, 0, 0x110uLL);
    *(void *)buf = 1;
    *(void *)&buf[8] = 1;
    uint64_t v19 = MEMORY[0x1E4F14868];
    int v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint8_t *, void))(*MEMORY[0x1E4F14868] + 312))(v6, 3239070321, buf, 0);
    int v21 = *__error();
    if (_os_feature_enabled_impl() && v20 && v21 == 45)
    {
      id v43 = 0;
      BOOL v22 = [(MCMFileManager *)self enableFastDiskUsageForURL:v4 error:&v43];
      unint64_t v18 = v43;
      unint64_t v23 = container_log_handle_for_category();
      int v24 = v23;
      if (!v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v45 = 136446466;
          *(void *)&void v45[4] = v6;
          *(_WORD *)&v45[12] = 2112;
          *(void *)&v45[14] = v18;
          _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "[%{public}s] Enabling fast disk sizing failed: %@", v45, 0x16u);
        }

        goto LABEL_32;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v45 = 136446210;
        *(void *)&void v45[4] = v6;
        _os_log_impl(&dword_1D7739000, v24, OS_LOG_TYPE_INFO, "[%{public}s] Enabled APFSIOC_DIR_STATS_OP", v45, 0xCu);
      }

      memset_s(buf, 0x110uLL, 0, 0x110uLL);
      *(void *)buf = 1;
      *(void *)&buf[8] = 1;
      int v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint8_t *, void))(*(void *)v19 + 312))(v6, 3239070321, buf, 0);
      int v21 = *__error();
    }
    if (v20)
    {
      unint64_t v18 = container_log_handle_for_category();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_32:

        char v32 = 0;
        unint64_t v29 = 0;
        uint64_t v31 = 0;
        goto LABEL_38;
      }
      *(_DWORD *)id v45 = 136446466;
      *(void *)&void v45[4] = v6;
      *(_WORD *)&v45[12] = 1024;
      *(_DWORD *)&v45[14] = v21;
      long long v25 = "[%{public}s] Fast disk sizing failed: %{darwin.errno}d";
      uint64_t v26 = v45;
      goto LABEL_47;
    }
    os_signpost_id_t v41 = v8 - 1;
    os_signpost_id_t v42 = v8;
    uint64_t v27 = *((void *)&v47 + 1);
    uint64_t v28 = v48;
    unint64_t v29 = *(void *)&buf[56];
    uint64_t v30 = v47;
    uint64_t v31 = *((void *)&v47 + 1) + v47 + v48;
  }
  uint64_t v33 = container_log_handle_for_category();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&unsigned char buf[24] = v31;
    *(_WORD *)&buf[32] = 2048;
    *(void *)&buf[34] = v30;
    *(_WORD *)&buf[42] = 2048;
    *(void *)&buf[44] = v27;
    *(_WORD *)&buf[52] = 2048;
    *(void *)&buf[54] = v28;
    _os_log_impl(&dword_1D7739000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}s]: descendants: %llu, total size: %llu [ph%llu; cl%llu; pu%llu]",
      buf,
      0x3Eu);
  }

  char v32 = 1;
  unint64_t v11 = v41;
  os_signpost_id_t v8 = v42;
LABEL_38:
  uint64_t v34 = container_log_handle_for_category();
  int v35 = v34;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 138478339;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2049;
    *(void *)&unsigned char buf[24] = v31;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v35, OS_SIGNPOST_INTERVAL_END, v8, "CalculatingDiskUsage", " path=%{private, signpost.description:attribute}@  numNodes=%{public, signpost.description:attribute}llu  size=%{private, signpost.description:attribute}llu ", buf, 0x20u);
  }

  if ((v32 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_43:

  unint64_t v37 = v31;
  unint64_t v38 = v29;
  result.var1 = v38;
  result.var0 = v37;
  return result;
}

- (BOOL)enableFastDiskUsageForURL:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 fileSystemRepresentation];
  memset(__s, 0, sizeof(__s));
  memset_s(__s, 0x110uLL, 0, 0x110uLL);
  *(void *)&__s[0] = 0x100000001;
  *((void *)&__s[0] + 1) = 28;
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t, _OWORD *, void))(*MEMORY[0x1E4F14868] + 312))(v5, 3239070321, __s, 0);
  if (v6)
  {
    int v7 = *__error();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__MCMFileManager_enableFastDiskUsageForURL_error___block_invoke;
    void v11[3] = &__block_descriptor_44_e14___NSError_8__0l;
    void v11[4] = v5;
    int v12 = v7;
    __50__MCMFileManager_enableFastDiskUsageForURL_error___block_invoke((uint64_t)v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
  }
  else
  {
    id v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v14 = v5;
      _os_log_debug_impl(&dword_1D7739000, v9, OS_LOG_TYPE_DEBUG, "[%{public}s] Enabled APFSIOC_DIR_STATS_OP", buf, 0xCu);
    }

    id v8 = 0;
  }

  return v6 == 0;
}

id __50__MCMFileManager_enableFastDiskUsageForURL_error___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"[%s] APFSIOC_DIR_STATS_OP: DIR_STATS_OP_SET failed: (%d) %s", *(void *)(a1 + 32), *(unsigned int *)(a1 + 40), strerror(*(_DWORD *)(a1 + 40)));
  v8[0] = @"FunctionName";
  id v3 = [NSString stringWithUTF8String:"-[MCMFileManager enableFastDiskUsageForURL:error:]_block_invoke"];
  v9[0] = v3;
  v9[1] = &unk_1F2F11420;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 40) userInfo:v5];

  return v6;
}

- (void)printDirectoryStructureAtURL:(id)a3
{
  v23[2] = *(char **)MEMORY[0x1E4F143B8];
  id v3 = a3;
  v23[0] = (char *)[v3 fileSystemRepresentation];
  v23[1] = 0;
  uint64_t v4 = fts_open(v23, 84, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    while (1)
    {
      do
      {
        int v6 = fts_read(v5);
        if (!v6)
        {
          fts_close(v5);
          goto LABEL_17;
        }
        int v7 = v6;
        unsigned int fts_info = v6->fts_info;
        if (fts_info > 0xD) {
          break;
        }
        if (((1 << fts_info) & 0x310A) != 0)
        {
          id v9 = container_log_handle_for_category();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            goto LABEL_7;
          }
          fts_uint64_t path = v7->fts_path;
          *(_DWORD *)buf = 136315138;
          int v20 = fts_path;
          int v12 = v9;
          int v13 = "\tOrphaned File: %s";
          uint32_t v14 = 12;
          goto LABEL_12;
        }
      }
      while (fts_info == 6);
      id v9 = container_log_handle_for_category();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v10 = v7->fts_path;
      unint64_t v11 = strerror(v7->fts_errno);
      *(_DWORD *)buf = 136315394;
      int v20 = v10;
      __int16 v21 = 2080;
      BOOL v22 = v11;
      int v12 = v9;
      int v13 = "FTS returned error for %s : %s";
      uint32_t v14 = 22;
LABEL_12:
      _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, v13, buf, v14);
LABEL_7:
    }
  }
  uint64_t v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    unint64_t v17 = __error();
    unint64_t v18 = strerror(*v17);
    *(_DWORD *)buf = 138412546;
    int v20 = (char *)v3;
    __int16 v21 = 2080;
    BOOL v22 = v18;
    _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "fts_open failed for %@ : %s", buf, 0x16u);
  }

LABEL_17:
}

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 dataProtectionClass:(int *)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 256);
  int v9 = v8;
  if (v8 < 0)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke;
    v19[3] = &unk_1E6A80A30;
    int v13 = (id *)v20;
    v20[0] = v7;
    uint64_t v14 = __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke((uint64_t)v19);
  }
  else
  {
    int v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0 || *__error() == 45)
    {
      unint64_t v11 = 0;
      *a4 = v10;
      char v12 = 1;
LABEL_10:
      close(v9);
      BOOL v15 = v12;
      goto LABEL_11;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke_261;
    void v17[3] = &unk_1E6A80A30;
    int v13 = &v18;
    id v18 = v7;
    uint64_t v14 = __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke_261((uint64_t)v17);
  }
  unint64_t v11 = (void *)v14;

  if (a5) {
    *a5 = v11;
  }
  char v12 = 0;
  BOOL v15 = 0;
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_10;
  }
LABEL_11:

  return v15;
}

id __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) fileSystemRepresentation];
  uint64_t v4 = __error();
  uint64_t v5 = objc_msgSend(v2, "initWithFormat:", @"Failed to open %s : %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  int v6 = [NSString stringWithUTF8String:"-[MCMFileManager dataProtectionClassOfItemAtURL:dataProtectionClass:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F113F0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

id __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke_261(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) fileSystemRepresentation];
  uint64_t v4 = __error();
  uint64_t v5 = objc_msgSend(v2, "initWithFormat:", @"Failed to getclass of file %s: %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  int v6 = [NSString stringWithUTF8String:"-[MCMFileManager dataProtectionClassOfItemAtURL:dataProtectionClass:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11408;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

- (BOOL)itemDoesNotExistAtURL:(id)a3
{
  return ![(MCMFileManager *)self itemExistsAtURL:a3];
}

id __75__MCMFileManager_itemAtURL_followSymlinks_exists_isDirectory_fsNode_error___block_invoke(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to determine if [%s] exists.", *(void *)(a1 + 32));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager itemAtURL:followSymlinks:exists:isDirectory:fsNode:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F113D8;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (BOOL)itemAtURL:(id)a3 followSymlinks:(BOOL)a4 exists:(BOOL *)a5 isDirectory:(BOOL *)a6 error:(id *)a7
{
  return [(MCMFileManager *)self itemAtURL:a3 followSymlinks:a4 exists:a5 isDirectory:a6 fsNode:0 error:a7];
}

- (BOOL)itemAtURL:(id)a3 exists:(BOOL *)a4 isDirectory:(BOOL *)a5 error:(id *)a6
{
  return [(MCMFileManager *)self itemAtURL:a3 followSymlinks:0 exists:a4 isDirectory:a5 error:a6];
}

- (BOOL)itemExistsAtURL:(id)a3 isDirectory:(BOOL *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v5 = 0;
  [(MCMFileManager *)self itemAtURL:a3 exists:&v5 isDirectory:a4 error:0];
  return v5;
}

- (BOOL)itemAtURL:(id)a3 exists:(BOOL *)a4 error:(id *)a5
{
  return [(MCMFileManager *)self itemAtURL:a3 exists:a4 isDirectory:0 error:a5];
}

- (BOOL)itemExistsAtURL:(id)a3
{
  return [(MCMFileManager *)self itemExistsAtURL:a3 isDirectory:0];
}

id __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke_2(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = __error();
  BOOL v5 = (void *)[v2 initWithFormat:@"_IterateDirectory for %@ returned %s", v3, strerror(*v4)];

  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager urlsForItemsInDirectoryAtURL:error:]_block_invoke_2"];
  v12[0] = v6;
  v12[1] = &unk_1F2F113C0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 40) userInfo:v8];

  return v9;
}

- (BOOL)standardizeOwnershipAtURL:(id)a3 toPOSIXUser:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  memset(&v30, 0, sizeof(v30));
  id v9 = a3;
  int v10 = (char *)[v9 fileSystemRepresentation];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke;
  v24[3] = &unk_1E6A7F5B8;
  id v11 = v8;
  id v25 = v11;
  BOOL v12 = [(MCMFileManager *)self _traverseDirectory:v9 error:a5 withBlock:v24];

  if (lstat(v10, &v30) == -1)
  {
    if (a5)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke_238;
      v23[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v23[4] = v10;
      __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke_238((uint64_t)v23);
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else if (!strstr(v10, ".com.apple.mobile_container_manager.metadata.plist"))
  {
    uid_t st_uid = v30.st_uid;
    if (st_uid != [v11 UID]
      && lchown(v10, [v11 UID], objc_msgSend(v11, "primaryGID")) == -1)
    {
      uint64_t v14 = container_log_handle_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = __error();
        BOOL v22 = strerror(*v21);
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = v10;
        __int16 v28 = 2080;
        unint64_t v29 = v22;
        _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Could not chown %s: %s", buf, 0x16u);
      }
    }
    if ((v30.st_mode & 0x49) != 0) {
      __int16 v15 = 493;
    }
    else {
      __int16 v15 = 420;
    }
    if ((v30.st_mode & 0xF000) == 0x4000) {
      mode_t v16 = 493;
    }
    else {
      mode_t v16 = v15;
    }
    if (lchmod(v10, v16) == -1)
    {
      unint64_t v17 = container_log_handle_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = __error();
        int v20 = strerror(*v19);
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = v10;
        __int16 v28 = 2080;
        unint64_t v29 = v20;
        _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Could not chmod %s: %s", buf, 0x16u);
      }
    }
  }

  return v12;
}

uint64_t __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!strstr(*(char **)(a2 + 48), ".com.apple.mobile_container_manager.metadata.plist"))
  {
    int v4 = *(_DWORD *)(*(void *)(a2 + 96) + 16);
    if (v4 != [*(id *)(a1 + 32) UID]
      || (int v5 = *(_DWORD *)(*(void *)(a2 + 96) + 20), v5 != [*(id *)(a1 + 32) primaryGID]))
    {
      if (lchown(*(const char **)(a2 + 48), [*(id *)(a1 + 32) UID], objc_msgSend(*(id *)(a1 + 32), "primaryGID")) == -1)
      {
        uint64_t v6 = container_log_handle_for_category();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = *(void *)(a2 + 48);
          __int16 v15 = __error();
          mode_t v16 = strerror(*v15);
          int v17 = 136315394;
          uint64_t v18 = v14;
          __int16 v19 = 2080;
          int v20 = v16;
          _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "Could not chown %s: %s", (uint8_t *)&v17, 0x16u);
        }
      }
    }
    if ((*(_WORD *)(*(void *)(a2 + 96) + 4) & 0x49) != 0) {
      __int16 v7 = 493;
    }
    else {
      __int16 v7 = 420;
    }
    if ((*(_WORD *)(*(void *)(a2 + 96) + 4) & 0xF000) == 0x4000) {
      mode_t v8 = 493;
    }
    else {
      mode_t v8 = v7;
    }
    if (lchmod(*(const char **)(a2 + 48), v8) == -1)
    {
      id v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a2 + 48);
        BOOL v12 = __error();
        int v13 = strerror(*v12);
        int v17 = 136315394;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        int v20 = v13;
        _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Could not chmod %s: %s", (uint8_t *)&v17, 0x16u);
      }
    }
  }
  return 1;
}

id __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke_238(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = __error();
  int v5 = objc_msgSend(v2, "initWithFormat:", @"Could not stat %s: %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager standardizeOwnershipAtURL:toPOSIXUser:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F113A8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  mode_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

- (BOOL)standardizeAllSystemContainerACLsAtURL:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[MCMFileManager defaultManager];
  id v32 = 0;
  mode_t v8 = [v7 urlsForItemsInDirectoryAtURL:v6 error:&v32];
  id v9 = v32;

  if (!v8)
  {
    BOOL v22 = [v9 domain];
    if ([v22 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v23 = [v9 code];

      if (v23 == 2) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v6 path];
      *(_DWORD *)buf = 138412546;
      id v39 = v27;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Failed to get items at URL%@ : %@", buf, 0x16u);
    }
    BOOL v24 = 0;
    if (a4) {
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  if (![v8 count])
  {
LABEL_19:
    BOOL v24 = 1;
    goto LABEL_29;
  }
  int v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v8;
    _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "Potential containers requiring ACL migration: %@", buf, 0xCu);
  }
  __int16 v28 = a4;
  id v30 = v6;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v29 = v8;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    char v15 = 1;
    do
    {
      uint64_t v16 = 0;
      int v17 = v9;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * v16);
        id v31 = v17;
        BOOL v19 = [(MCMFileManager *)self standardizeACLsForSystemContainerAtURL:v18 error:&v31];
        id v9 = v31;

        if (!v19)
        {
          int v20 = container_log_handle_for_category();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = [v18 path];
            *(_DWORD *)buf = 138412546;
            id v39 = v21;
            __int16 v40 = 2112;
            id v41 = v9;
            _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Failed to set system container ACL at %@: %@", buf, 0x16u);
          }
          char v15 = 0;
        }
        ++v16;
        int v17 = v9;
      }
      while (v13 != v16);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v13);
  }
  else
  {
    char v15 = 1;
  }

  BOOL v24 = v15 & 1;
  mode_t v8 = v29;
  id v6 = v30;
  a4 = v28;
  if (v28)
  {
LABEL_27:
    if (!v24)
    {
      id v9 = v9;
      BOOL v24 = 0;
      *a4 = v9;
    }
  }
LABEL_29:

  return v24;
}

- (BOOL)standardizeACLsForSystemContainerAtURL:(id)a3 error:(id *)a4
{
  return [(MCMFileManager *)self standardizeACLsAtURL:a3 isSystemContainer:1 error:a4];
}

- (BOOL)standardizeACLsAtURL:(id)a3 isSystemContainer:(BOOL)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v37 = 0;
  unint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  id v9 = +[MCMPOSIXUser nobody];
  int v10 = [v9 UID];
  int v11 = [v9 primaryGID];
  id v32 = 0;
  uint64_t v12 = [(MCMFileManager *)self _CopyTopLevelSystemContainerACLWithError:&v32];
  id v13 = v32;
  id v14 = v13;
  v42[3] = (uint64_t)v12;
  if (!v12)
  {
LABEL_5:
    BOOL v18 = 0;
    goto LABEL_7;
  }
  id v31 = v13;
  char v15 = [(MCMFileManager *)self _CopySystemContainerACLWithNumACEs:1 isDir:1 inheritOnly:0 withError:&v31];
  id v16 = v31;

  v38[3] = (uint64_t)v15;
  if (v15)
  {
    id v30 = v16;
    int v17 = [(MCMFileManager *)self _CopySystemContainerACLWithNumACEs:1 isDir:0 inheritOnly:0 withError:&v30];
    id v14 = v30;

    v34[3] = (uint64_t)v17;
    if (v17)
    {
      id v29 = v14;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __63__MCMFileManager_standardizeACLsAtURL_isSystemContainer_error___block_invoke;
      v25[3] = &unk_1E6A7F590;
      BOOL v28 = a4;
      v25[4] = &v41;
      void v25[5] = &v37;
      v25[6] = &v33;
      int v26 = v10;
      int v27 = v11;
      BOOL v18 = [(MCMFileManager *)self _traverseDirectory:v8 error:&v29 withBlock:v25];
      id v19 = v29;

      id v14 = v19;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  BOOL v18 = 0;
  id v14 = v16;
LABEL_7:
  int v20 = (void *)v42[3];
  if (v20) {
    acl_free(v20);
  }
  uint64_t v21 = (void *)v38[3];
  if (v21) {
    acl_free(v21);
  }
  BOOL v22 = (void *)v34[3];
  if (v22) {
    acl_free(v22);
  }
  if (a5) {
    char v23 = v18;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) == 0) {
    *a5 = v14;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v18;
}

uint64_t __63__MCMFileManager_standardizeACLsAtURL_isSystemContainer_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v4 = *(char **)(a2 + 48);
  if (strstr(v4, ".com.apple.mobile_container_manager.metadata.plist")) {
    return 1;
  }
  if ((*(_WORD *)(*(void *)(a2 + 96) + 4) & 0xF000) == 0x4000)
  {
    if (*(unsigned char *)(a1 + 64) && !*(_WORD *)(a2 + 86))
    {
      if (!acl_set_file(v4, ACL_TYPE_EXTENDED, *(acl_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))) {
        goto LABEL_11;
      }
      int v5 = container_log_handle_for_category();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      uint64_t v9 = *(void *)(a2 + 48);
      int v10 = __error();
      int v11 = strerror(*v10);
      int v22 = 136315394;
      uint64_t v23 = v9;
      __int16 v24 = 2080;
      id v25 = v11;
      uint64_t v12 = "Failed to set top level ACL on dir %s: %s";
      goto LABEL_26;
    }
    if (acl_set_file(v4, ACL_TYPE_EXTENDED, *(acl_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)))
    {
      int v5 = container_log_handle_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      goto LABEL_10;
    }
  }
  else if (acl_set_file(v4, ACL_TYPE_EXTENDED, *(acl_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
  {
    int v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_25:
      uint64_t v13 = *(void *)(a2 + 48);
      id v14 = __error();
      char v15 = strerror(*v14);
      int v22 = 136315394;
      uint64_t v23 = v13;
      __int16 v24 = 2080;
      id v25 = v15;
      uint64_t v12 = "Failed to set ACL on dir %s: %s";
LABEL_26:
      _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v22, 0x16u);
    }
LABEL_10:
  }
LABEL_11:
  if (!*(unsigned char *)(a1 + 64) || *(_WORD *)(a2 + 86))
  {
    if (lchmod(*(const char **)(a2 + 48), 0) == -1)
    {
      id v6 = container_log_handle_for_category();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a2 + 48);
        int v17 = __error();
        BOOL v18 = strerror(*v17);
        int v22 = 136315394;
        uint64_t v23 = v16;
        __int16 v24 = 2080;
        id v25 = v18;
        _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "Could not chmod %s: %s", (uint8_t *)&v22, 0x16u);
      }
    }
    if (lchown(*(const char **)(a2 + 48), *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60)) == -1)
    {
      uint64_t v7 = container_log_handle_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a2 + 48);
        int v20 = __error();
        uint64_t v21 = strerror(*v20);
        int v22 = 136315394;
        uint64_t v23 = v19;
        __int16 v24 = 2080;
        id v25 = v21;
        _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "Could not chown %s: %s", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  return 1;
}

- (BOOL)setTopLevelSystemContainerACLAtURL:(id)a3 error:(id *)a4
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17[0] = 0;
  uint64_t v7 = [(MCMFileManager *)self _CopyTopLevelSystemContainerACLWithError:v17];
  id v8 = v17[0];
  if (!v7)
  {
    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v9 = [v6 path];
  int v10 = acl_set_file((const char *)[v9 UTF8String], ACL_TYPE_EXTENDED, v7);
  BOOL v11 = v10 == 0;

  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__MCMFileManager_setTopLevelSystemContainerACLAtURL_error___block_invoke;
    v14[3] = &unk_1E6A80510;
    id v15 = v6;
    id v16 = v8;
    id v12 = v8;
    __59__MCMFileManager_setTopLevelSystemContainerACLAtURL_error___block_invoke((uint64_t)v14);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  acl_free(v7);
  if (a4)
  {
LABEL_7:
    if (!v11) {
      *a4 = v8;
    }
  }
LABEL_9:

  return v11;
}

id __59__MCMFileManager_setTopLevelSystemContainerACLAtURL_error___block_invoke(uint64_t a1)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  int v4 = __error();
  int v5 = (void *)[v2 initWithFormat:@"Failed to set ACL on %@: %s", v3, strerror(*v4)];

  v22[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMFileManager setTopLevelSystemContainerACLAtURL:error:]_block_invoke"];
  v23[0] = v6;
  v23[1] = &unk_1F2F11390;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v22[1] = @"SourceFileLine";
  v22[2] = v7;
  v23[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  if (*(void *)(a1 + 40))
  {
    id v9 = (void *)[v8 mutableCopy];
    [v9 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    int v10 = (void *)[v9 copy];

    if (*(void *)(a1 + 40))
    {
      BOOL v11 = container_log_handle_for_category();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      uint64_t v13 = "%{public}@ (%{public}@)";
      id v14 = v11;
      uint32_t v15 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    int v10 = v8;
  }
  BOOL v11 = container_log_handle_for_category();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v19 = v5;
  uint64_t v13 = "%{public}@";
  id v14 = v11;
  uint32_t v15 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
LABEL_7:

  id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v10];

  return v16;
}

- (_acl)_CopyTopLevelSystemContainerACLWithError:(id *)a3
{
  obj_p[1] = *(void **)MEMORY[0x1E4F143B8];
  id v12 = 0;
  int v5 = [(MCMFileManager *)self _CopySystemContainerACLWithNumACEs:2 isDir:1 inheritOnly:1 withError:&v12];
  id v6 = v12;
  uint64_t v7 = v6;
  obj_p[0] = v5;
  if (!v5)
  {
    id v9 = 0;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  id v11 = v6;
  [(MCMFileManager *)self _CreateSystemUserACEInACL:obj_p withPermissions:1572 andFlags:0 withError:&v11];
  id v8 = v11;

  id v9 = (_acl *)obj_p[0];
  if (v8 && obj_p[0])
  {
    acl_free(obj_p[0]);
    id v9 = 0;
    obj_p[0] = 0;
  }
  uint64_t v7 = v8;
  if (a3)
  {
LABEL_8:
    if (!v9)
    {
      *a3 = v7;
      id v9 = (_acl *)obj_p[0];
    }
  }
LABEL_10:

  return v9;
}

- (_acl)_CopySystemContainerACLWithNumACEs:(int)a3 isDir:(BOOL)a4 inheritOnly:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  obj_p[1] = *(void **)MEMORY[0x1E4F143B8];
  obj_p[0] = acl_init(a3);
  if (!obj_p[0])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v17[2] = __81__MCMFileManager__CopySystemContainerACLWithNumACEs_isDir_inheritOnly_withError___block_invoke;
    void v17[3] = &unk_1E6A80A30;
    id v18 = 0;
    __81__MCMFileManager__CopySystemContainerACLWithNumACEs_isDir_inheritOnly_withError___block_invoke((uint64_t)v17);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    id v14 = 0;
    if (!a6) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (v7) {
    unsigned int v10 = 352;
  }
  else {
    unsigned int v10 = 96;
  }
  if (v8) {
    uint64_t v11 = 16382;
  }
  else {
    uint64_t v11 = 16318;
  }
  if (v8) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 16;
  }
  id v16 = 0;
  [(MCMFileManager *)self _CreateSystemUserACEInACL:obj_p withPermissions:v11 andFlags:v12 withError:&v16];
  id v13 = v16;
  id v14 = (_acl *)obj_p[0];
  if (v13 && obj_p[0])
  {
    acl_free(obj_p[0]);
    id v14 = 0;
    obj_p[0] = 0;
  }
  if (a6)
  {
LABEL_17:
    if (!v14)
    {
      *a6 = v13;
      id v14 = (_acl *)obj_p[0];
    }
  }
LABEL_19:

  return v14;
}

id __81__MCMFileManager__CopySystemContainerACLWithNumACEs_isDir_inheritOnly_withError___block_invoke(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"acl_init() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CopySystemContainerACLWithNumACEs:isDir:inheritOnly:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F11378;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  id v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint32_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

- (BOOL)_CreateSystemUserACEInACL:(_acl *)a3 withPermissions:(int)a4 andFlags:(int)a5 withError:(id *)a6
{
  entry_p[1] = *(acl_entry_t *)MEMORY[0x1E4F143B8];
  acl_permset_t permset_p = 0;
  entry_p[0] = 0;
  uint64_t __s = 0;
  acl_flagset_t flagset_p = 0;
  if (acl_create_entry(a3, entry_p))
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke;
    v39[3] = &unk_1E6A80A30;
    uint64_t v40 = 0;
    id v9 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke((uint64_t)v39);
    unsigned int v10 = v40;
    goto LABEL_3;
  }
  uint64_t v12 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  uint64_t __s = v12;
  if (v12)
  {
    id v13 = v12;
    if (mbr_identifier_to_uuid(5, "systemusers", 0xBuLL, v12))
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_172;
      v35[3] = &unk_1E6A80A30;
      uint32_t v14 = (id *)&v36;
      uint64_t v36 = 0;
      uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_172((uint64_t)v35);
    }
    else
    {
      if (a4)
      {
        if (acl_get_permset(entry_p[0], &permset_p))
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_178;
          v33[3] = &unk_1E6A80A30;
          uint32_t v14 = (id *)&v34;
          uint64_t v34 = 0;
          uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_178((uint64_t)v33);
          goto LABEL_8;
        }
        if (acl_add_perm(permset_p, (acl_perm_t)a4))
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_184;
          v30[3] = &unk_1E6A7F568;
          int v32 = a4;
          uint32_t v14 = (id *)&v31;
          uint64_t v31 = 0;
          uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_184((uint64_t)v30);
          goto LABEL_8;
        }
        if (acl_set_permset(entry_p[0], permset_p))
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_190;
          v28[3] = &unk_1E6A80A30;
          uint32_t v14 = (id *)&v29;
          uint64_t v29 = 0;
          uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_190((uint64_t)v28);
          goto LABEL_8;
        }
      }
      if (a5)
      {
        if (acl_get_flagset_np(entry_p[0], &flagset_p))
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_196;
          void v26[3] = &unk_1E6A80A30;
          uint32_t v14 = (id *)&v27;
          uint64_t v27 = 0;
          uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_196((uint64_t)v26);
          goto LABEL_8;
        }
        if (acl_add_flag_np(flagset_p, (acl_flag_t)a5))
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_202;
          v23[3] = &unk_1E6A7F568;
          int v25 = a5;
          uint32_t v14 = (id *)&v24;
          uint64_t v24 = 0;
          uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_202((uint64_t)v23);
          goto LABEL_8;
        }
        if (acl_set_flagset_np(entry_p[0], flagset_p))
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_208;
          void v21[3] = &unk_1E6A80A30;
          uint32_t v14 = (id *)&v22;
          uint64_t v22 = 0;
          uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_208((uint64_t)v21);
          goto LABEL_8;
        }
      }
      if (acl_set_tag_type(entry_p[0], ACL_EXTENDED_ALLOW))
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_214;
        v19[3] = &unk_1E6A80A30;
        uint32_t v14 = (id *)&v20;
        uint64_t v20 = 0;
        uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_214((uint64_t)v19);
      }
      else
      {
        if (!acl_set_qualifier(entry_p[0], v13))
        {
          id v9 = 0;
          BOOL v11 = 1;
LABEL_9:
          free(v13);
          memset_s(&__s, 8uLL, 0, 8uLL);
          if (!a6) {
            goto LABEL_12;
          }
          goto LABEL_10;
        }
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        id v17[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_220;
        void v17[3] = &unk_1E6A80A30;
        uint32_t v14 = (id *)&v18;
        uint64_t v18 = 0;
        uint64_t v15 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_220((uint64_t)v17);
      }
    }
LABEL_8:
    id v9 = (void *)v15;

    BOOL v11 = 0;
    goto LABEL_9;
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_166;
  v37[3] = &unk_1E6A80A30;
  unint64_t v38 = 0;
  id v9 = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_166((uint64_t)v37);
  unsigned int v10 = v38;
LABEL_3:

  BOOL v11 = 0;
  if (!a6) {
    goto LABEL_12;
  }
LABEL_10:
  if (!v11) {
    *a6 = v9;
  }
LABEL_12:

  return v11;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"acl_create_entry() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F11270;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_166(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"failed to calloc nameUUID: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F11288;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_172(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"mbr_identifier_to_uuid() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F112A0;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_178(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"acl_get_permset() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F112B8;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_184(uint64_t a1)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  int v4 = __error();
  int v5 = objc_msgSend(v2, "initWithFormat:", @"acl_add_perm() failed to set perms %x: %s", v3, strerror(*v4));
  v22[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v23[0] = v6;
  v23[1] = &unk_1F2F112D0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v22[1] = @"SourceFileLine";
  v22[2] = v7;
  v23[2] = v5;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  if (*(void *)(a1 + 32))
  {
    id v9 = (void *)[v8 mutableCopy];
    [v9 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    unsigned int v10 = (void *)[v9 copy];

    if (*(void *)(a1 + 32))
    {
      uint64_t v11 = container_log_handle_for_category();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      id v13 = "%{public}@ (%{public}@)";
      uint32_t v14 = v11;
      uint32_t v15 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v10 = v8;
  }
  uint64_t v11 = container_log_handle_for_category();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  __int16 v19 = v5;
  id v13 = "%{public}@";
  uint32_t v14 = v11;
  uint32_t v15 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
LABEL_7:

  id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v10];

  return v16;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_190(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"acl_set_permset() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F112E8;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint32_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_196(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"acl_get_flagset_np() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F11300;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint32_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_202(uint64_t a1)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  int v4 = __error();
  int v5 = objc_msgSend(v2, "initWithFormat:", @"acl_add_flag_np() failed to set flags %x: %s", v3, strerror(*v4));
  v22[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v23[0] = v6;
  v23[1] = &unk_1F2F11318;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v22[1] = @"SourceFileLine";
  v22[2] = v7;
  v23[2] = v5;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  if (*(void *)(a1 + 32))
  {
    id v9 = (void *)[v8 mutableCopy];
    [v9 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    unsigned int v10 = (void *)[v9 copy];

    if (*(void *)(a1 + 32))
    {
      uint64_t v11 = container_log_handle_for_category();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      id v13 = "%{public}@ (%{public}@)";
      uint32_t v14 = v11;
      uint32_t v15 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v10 = v8;
  }
  uint64_t v11 = container_log_handle_for_category();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  __int16 v19 = v5;
  id v13 = "%{public}@";
  uint32_t v14 = v11;
  uint32_t v15 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
LABEL_7:

  id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v10];

  return v16;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_208(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"acl_set_flagset_np() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F11330;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint32_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_214(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"acl_set_tag_type() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F11348;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint32_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_220(uint64_t a1)
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = __error();
  int v4 = objc_msgSend(v2, "initWithFormat:", @"acl_set_qualifier() failed: %s", strerror(*v3));
  v21[0] = @"FunctionName";
  int v5 = [NSString stringWithUTF8String:"-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke"];
  v22[0] = v5;
  v22[1] = &unk_1F2F11360;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  if (*(void *)(a1 + 32))
  {
    BOOL v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 32))
    {
      unsigned int v10 = container_log_handle_for_category();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      uint64_t v12 = "%{public}@ (%{public}@)";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  unsigned int v10 = container_log_handle_for_category();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    goto LABEL_7;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v18 = v4;
  uint64_t v12 = "%{public}@";
  id v13 = v10;
  uint32_t v14 = 12;
LABEL_11:
  _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
LABEL_7:

  uint32_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:63 userInfo:v9];

  return v15;
}

- (BOOL)_traverseDirectory:(id)a3 error:(id *)a4 withBlock:(id)a5
{
  v42[2] = *(char **)MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (uint64_t (**)(id, FTSENT *, id *))a5;
  id v9 = v7;
  unsigned int v10 = (char *)[v9 fileSystemRepresentation];
  uint64_t v11 = container_log_handle_for_category();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v9);

  id v13 = container_log_handle_for_category();
  uint32_t v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    id v16 = [v9 path];
    *(_DWORD *)buf = 138477827;
    uint64_t v39 = v16;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "TraversingDirectory", " path=%{private, signpost.description:attribute}@ ", buf, 0xCu);
  }
  os_signpost_id_t spid = v12;

  v42[0] = v10;
  v42[1] = 0;
  int v17 = fts_open(v42, 84, 0);
  if (v17)
  {
    unint64_t v32 = v12 - 1;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    int v20 = 0;
    while (1)
    {
      uint64_t v21 = fts_read(v17);
      if (!v21) {
        break;
      }
      int fts_info = v21->fts_info;
      if (fts_info == 10 || fts_info == 7)
      {
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_148;
        v36[3] = &__block_descriptor_48_e14___NSError_8__0l;
        void v36[4] = v10;
        v36[5] = v21;
        __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_148((uint64_t)v36);
        id v25 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
        int v20 = 0;
        goto LABEL_17;
      }
      ++v19;
      id v35 = v18;
      char v24 = v8[2](v8, v21, &v35);
      id v25 = v35;

      int v20 = 1;
      uint64_t v18 = v25;
      if ((v24 & 1) == 0) {
        goto LABEL_15;
      }
    }
    id v25 = v18;
LABEL_17:
    int v26 = fts_close(v17);
    LOBYTE(v17) = v20 != 0;
    if (v26)
    {
      unint64_t v15 = v32;
      if (!v25)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        void v34[2] = __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_154;
        v34[3] = &__block_descriptor_40_e14___NSError_8__0l;
        void v34[4] = v10;
        __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_154((uint64_t)v34);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      LOBYTE(v17) = 0;
    }
    else
    {
      unint64_t v15 = v32;
    }
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke;
    v37[3] = &__block_descriptor_40_e14___NSError_8__0l;
    void v37[4] = v10;
    __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke((uint64_t)v37);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = 0;
  }
  uint64_t v27 = container_log_handle_for_category();
  BOOL v28 = v27;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    uint64_t v29 = [v9 path];
    *(_DWORD *)buf = 138478083;
    uint64_t v39 = v29;
    __int16 v40 = 2050;
    uint64_t v41 = v19;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v28, OS_SIGNPOST_INTERVAL_END, spid, "TraversingDirectory", " path=%{private, signpost.description:attribute}@  numNodes=%{public, signpost.description:attribute}llu ", buf, 0x16u);
  }
  if (a4) {
    char v30 = (char)v17;
  }
  else {
    char v30 = 1;
  }
  if ((v30 & 1) == 0) {
    *a4 = v25;
  }

  return (char)v17;
}

id __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = __error();
  int v5 = objc_msgSend(v2, "initWithFormat:", @"fts_open failed for %s with error %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager _traverseDirectory:error:withBlock:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11228;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

id __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_148(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"Error for path %s: %s", *(void *)(a1 + 32), strerror(*(_DWORD *)(*(void *)(a1 + 40) + 56)));
  v8[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMFileManager _traverseDirectory:error:withBlock:]_block_invoke"];
  v9[0] = v3;
  v9[1] = &unk_1F2F11240;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(*(void *)(a1 + 40) + 56) userInfo:v5];

  return v6;
}

id __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_154(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = __error();
  int v5 = objc_msgSend(v2, "initWithFormat:", @"fts_close failed for %s with error %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager _traverseDirectory:error:withBlock:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11258;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4
{
  return [(MCMFileManager *)self createTemporaryDirectoryInDirectoryURL:a3 withNamePrefix:@"temp." error:a4];
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 withNamePrefix:(id)a4 error:(id *)a5
{
  __s[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  __s[0] = 0;
  if (v7)
  {
    unsigned int v10 = [NSString stringWithFormat:@"%@XXXXXX", v8];
    id v11 = [v7 URLByAppendingPathComponent:v10 isDirectory:1];
    os_signpost_id_t v12 = strdup((const char *)[v11 fileSystemRepresentation]);
    __s[0] = v12;
    if (mkdtemp(v12))
    {
      id v13 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v12 isDirectory:1 relativeToURL:0];
      uint32_t v14 = 0;
      if (!v12) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v17[2] = __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke_133;
    void v17[3] = &__block_descriptor_40_e14___NSError_8__0l;
    void v17[4] = v12;
    uint32_t v14 = __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke_133((uint64_t)v17);
    id v13 = 0;
    if (v12)
    {
LABEL_7:
      free(v12);
      memset_s(__s, 8uLL, 0, 8uLL);
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke;
    v18[3] = &unk_1E6A80A30;
    id v19 = v8;
    uint32_t v14 = __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke((uint64_t)v18);

    id v11 = 0;
    unsigned int v10 = 0;
    id v13 = 0;
  }
LABEL_8:
  if (a5 && !v13) {
    *a5 = v14;
  }
  id v15 = v13;

  return v15;
}

id __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)[[NSString alloc] initWithFormat:@"nil base directory when trying to create temporary directory for %@", *(void *)(a1 + 32)];
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager createTemporaryDirectoryInDirectoryURL:withNamePrefix:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F111F8;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v4];

  return v5;
}

id __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke_133(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = __error();
  int v5 = objc_msgSend(v2, "initWithFormat:", @"Failed to create temp dir at path %s : %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager createTemporaryDirectoryInDirectoryURL:withNamePrefix:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11210;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

- (BOOL)replaceItemAtDestinationURL:(id)a3 withSourceURL:(id)a4 swapped:(BOOL *)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 fileSystemRepresentation];
  id v12 = v10;
  uint64_t v13 = [v12 fileSystemRepresentation];

  uint64_t v14 = MEMORY[0x1E4F14868];
  int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F14868] + 640))(v11, v13, 2);
  if (v15 < 0
    && (*__error() != 45
     || ((*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v14 + 640))(v11, v13, 0) & 0x80000000) != 0))
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__MCMFileManager_replaceItemAtDestinationURL_withSourceURL_swapped_error___block_invoke;
    void v21[3] = &__block_descriptor_48_e14___NSError_8__0l;
    void v21[4] = v13;
    v21[5] = v11;
    __74__MCMFileManager_replaceItemAtDestinationURL_withSourceURL_swapped_error___block_invoke((uint64_t)v21);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      id v18 = v18;
      BOOL v19 = 0;
      *a6 = v18;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    if (a5) {
      *a5 = v15 >= 0;
    }
    id v16 = container_log_handle_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = "Replaced";
      *(_DWORD *)buf = 136315650;
      if (v15 >= 0) {
        int v17 = "Swapped";
      }
      uint64_t v23 = v17;
      __int16 v24 = 2080;
      uint64_t v25 = v13;
      __int16 v26 = 2080;
      uint64_t v27 = v11;
      _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_INFO, "%s [%s] <-> [%s].", buf, 0x20u);
    }

    id v18 = 0;
    BOOL v19 = 1;
  }

  return v19;
}

id __74__MCMFileManager_replaceItemAtDestinationURL_withSourceURL_swapped_error___block_invoke(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Could not replace [%s] with file [%s]", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v7[0] = @"FunctionName";
  id v2 = [NSString stringWithUTF8String:"-[MCMFileManager replaceItemAtDestinationURL:withSourceURL:swapped:error:]_block_invoke"];
  v8[0] = v2;
  v8[1] = &unk_1F2F111E0;
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v4];

  return v5;
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MCMFileManager *)self _moveItemAtURL:a3 toURL:a4 failIfSrcMissing:1 error:a5];
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MCMFileManager *)self _copyItemAtURL:a3 toURL:a4 failIfSrcMissing:1 error:a5];
}

- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MCMFileManager *)self _moveItemAtURL:a3 toURL:a4 failIfSrcMissing:0 error:a5];
}

- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(MCMFileManager *)self _copyItemAtURL:a3 toURL:a4 failIfSrcMissing:0 error:a5];
}

- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  uint64_t v13 = (const std::__fs::filesystem::path *)[v12 fileSystemRepresentation];
  id v14 = v11;
  id v16 = (const std::__fs::filesystem::path *)[v14 fileSystemRepresentation];
  if (!a5)
  {
    memset(&v34, 0, sizeof(v34));
    if (lstat((const char *)v13, &v34))
    {
      if (*__error() != 2)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke;
        v33[3] = &__block_descriptor_40_e14___NSError_8__0l;
        void v33[4] = v13;
        uint64_t v17 = __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke((uint64_t)v33);
        goto LABEL_18;
      }
      goto LABEL_13;
    }
  }
  rename(v13, v16, v15);
  if (!v18)
  {
LABEL_13:
    id v23 = 0;
    uint64_t v25 = "";
    goto LABEL_14;
  }
  if (*__error() != 18)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke_109;
    v32[3] = &__block_descriptor_48_e14___NSError_8__0l;
    void v32[4] = v13;
    v32[5] = v16;
    uint64_t v17 = __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke_109((uint64_t)v32);
LABEL_18:
    id v23 = (id)v17;
    if (a6)
    {
LABEL_19:
      id v23 = v23;
      BOOL v27 = 0;
      *a6 = v23;
      goto LABEL_22;
    }
LABEL_21:
    BOOL v27 = 0;
    goto LABEL_22;
  }
  id v31 = 0;
  BOOL v19 = [(MCMFileManager *)self _copyItemAtURL:v12 toURL:v14 failIfSrcMissing:1 error:&v31];
  id v20 = v31;
  uint64_t v21 = v20;
  if (!v19)
  {
    id v23 = v20;
    if (a6) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  id v30 = v20;
  BOOL v22 = [(MCMFileManager *)self removeItemAtURL:v12 error:&v30];
  id v23 = v30;

  if (!v22)
  {
    __int16 v24 = container_log_handle_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [v12 path];
      v34.st_dev = 138412546;
      *(void *)&v34.int st_mode = v29;
      WORD2(v34.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v34.st_ino + 6) = (__darwin_ino64_t)v23;
      _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "Failed to remove move source after copy at %@ : %@", (uint8_t *)&v34, 0x16u);
    }
  }
  uint64_t v25 = "(using copy-delete) ";
LABEL_14:
  __int16 v26 = container_log_handle_for_category();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v34.st_dev = 136315650;
    *(void *)&v34.int st_mode = v25;
    WORD2(v34.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v34.st_ino + 6) = (__darwin_ino64_t)v13;
    HIWORD(v34.st_gid) = 2080;
    *(void *)&v34.st_rdev = v16;
    _os_log_impl(&dword_1D7739000, v26, OS_LOG_TYPE_INFO, "Moved %s[%s] → [%s].", (uint8_t *)&v34, 0x20u);
  }

  BOOL v27 = 1;
LABEL_22:

  return v27;
}

id __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke_109(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v5 = __error();
  uint64_t v6 = objc_msgSend(v2, "initWithFormat:", @"rename of [%s] to [%s] failed: %s", v4, v3, strerror(*v5));
  v12[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]_block_invoke"];
  v13[0] = v7;
  v13[1] = &unk_1F2F111C8;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v9];

  return v10;
}

id __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = __error();
  int v5 = objc_msgSend(v2, "initWithFormat:", @"stat of [%s] failed: %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F111B0;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (a5
    || (memset(&v24, 0, sizeof(v24)),
        id v11 = v9,
        !lstat((const char *)[v11 fileSystemRepresentation], &v24)))
  {
    id v14 = v9;
    int v15 = (const char *)[v14 fileSystemRepresentation];
    id v16 = v10;
    if (!copyfile(v15, (const char *)[v16 fileSystemRepresentation], 0, 0x10C800Fu))
    {
      id v17 = 0;
      BOOL v13 = 1;
      goto LABEL_14;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke_98;
    v19[3] = &unk_1E6A80510;
    id v20 = v14;
    id v21 = v16;
    __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke_98((uint64_t)v19);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v13 = 0;
    if (!a6) {
      goto LABEL_14;
    }
  }
  else
  {
    int v12 = *__error();
    BOOL v13 = v12 == 2;
    if (v12 == 2)
    {
      id v17 = 0;
      if (!a6) {
        goto LABEL_14;
      }
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke;
      void v22[3] = &unk_1E6A80A30;
      id v23 = v11;
      __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke((uint64_t)v22);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      if (!a6) {
        goto LABEL_14;
      }
    }
  }
  if (!v13)
  {
    id v17 = v17;
    BOOL v13 = 0;
    *a6 = v17;
  }
LABEL_14:

  return v13;
}

id __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = __error();
  int v5 = (void *)[v2 initWithFormat:@"stat of %@ failed: %s", v3, strerror(*v4)];

  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11180;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

id __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke_98(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = [*(id *)(a1 + 40) path];
  int v5 = __error();
  uint64_t v6 = (void *)[v2 initWithFormat:@"copyfile of %@ to %@ failed: %s", v3, v4, strerror(*v5)];

  v12[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:]_block_invoke"];
  v13[0] = v7;
  v13[1] = &unk_1F2F11198;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v9];

  return v10;
}

- (id)targetOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  memset(&v19, 0, sizeof(v19));
  bzero(v18, 0x401uLL);
  id v6 = v5;
  if (lstat((const char *)[v6 fileSystemRepresentation], &v19))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke;
    v16[3] = &unk_1E6A80A30;
    id v17 = v6;
    uint64_t v7 = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke((uint64_t)v16);
    uint64_t v8 = v17;
  }
  else if ((v19.st_mode & 0xF000) == 0xA000)
  {
    id v9 = v6;
    if (readlink((const char *)[v9 fileSystemRepresentation], v18, 0x400uLL) > 0)
    {
      id v10 = [NSString stringWithUTF8String:v18];
      uint64_t v7 = 0;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_87;
    void v12[3] = &unk_1E6A80A30;
    id v13 = v9;
    uint64_t v7 = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_87((uint64_t)v12);
    uint64_t v8 = v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_81;
    v14[3] = &unk_1E6A80A30;
    id v15 = v6;
    uint64_t v7 = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_81((uint64_t)v14);
    uint64_t v8 = v15;
  }

  id v10 = 0;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_10:
  if (!v10) {
    *a4 = v7;
  }
LABEL_12:

  return v10;
}

id __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = __error();
  id v5 = (void *)[v2 initWithFormat:@"fetching target of symlink from [%@] failed: file exists and lstat on it failed: %s", v3, strerror(*v4)];

  v11[0] = @"FunctionName";
  id v6 = [NSString stringWithUTF8String:"-[MCMFileManager targetOfSymbolicLinkAtURL:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11138;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

id __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_81(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"fetching target of symlink from [%@] failed: file exists and is not a symlink: %s", v3, strerror(17)];

  v10[0] = @"FunctionName";
  id v5 = [NSString stringWithUTF8String:"-[MCMFileManager targetOfSymbolicLinkAtURL:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11150;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:17 userInfo:v7];

  return v8;
}

id __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_87(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = __error();
  id v5 = (void *)[v2 initWithFormat:@"fetching target of symlink from [%@] failed: file exists, is a symlink, but its target could not be read: %s", v3, strerror(*v4)];

  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager targetOfSymbolicLinkAtURL:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11168;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

- (BOOL)symbolicallyLinkURL:(id)a3 toSymlinkTarget:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v8 path];
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = v11;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_INFO, "Creating symlink [%@] → [%@]", buf, 0x16u);
  }
  id v12 = v9;
  id v13 = (const char *)[v12 UTF8String];
  id v14 = v8;
  if (!symlink(v13, (const char *)[v14 fileSystemRepresentation])) {
    goto LABEL_8;
  }
  if (*__error() == 17)
  {
    id v32 = 0;
    id v15 = [(MCMFileManager *)self targetOfSymbolicLinkAtURL:v14 error:&v32];
    id v16 = v32;
    if (v15)
    {
      if ([v12 isEqualToString:v15])
      {

LABEL_8:
        id v17 = 0;
        BOOL v18 = 1;
        goto LABEL_16;
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_70;
      v24[3] = &unk_1E6A7FFC8;
      stat v19 = &v25;
      id v25 = v14;
      uint64_t v20 = &v26;
      id v26 = v12;
      id v21 = &v27;
      id v27 = v15;
      uint64_t v22 = __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_70((uint64_t)v24);
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_64;
      v28[3] = &unk_1E6A7FFC8;
      stat v19 = &v29;
      id v29 = v14;
      uint64_t v20 = &v30;
      id v30 = v12;
      id v21 = &v31;
      id v31 = v16;
      uint64_t v22 = __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_64((uint64_t)v28);
    }
    id v17 = (id)v22;
  }
  else
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke;
    v33[3] = &unk_1E6A80510;
    id v34 = v14;
    id v35 = v12;
    __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke((uint64_t)v33);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    id v16 = v34;
  }

  if (a5)
  {
    id v17 = v17;
    BOOL v18 = 0;
    *a5 = v17;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_16:

  return v18;
}

id __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = __error();
  uint64_t v6 = (void *)[v2 initWithFormat:@"symlink from [%@] → [%@] failed: %s", v3, v4, strerror(*v5)];

  v12[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMFileManager symbolicallyLinkURL:toSymlinkTarget:error:]_block_invoke"];
  v13[0] = v7;
  v13[1] = &unk_1F2F110F0;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v9];

  return v10;
}

id __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_64(uint64_t a1)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = (void *)[v2 initWithFormat:@"symlink from [%@] → [%@] failed: %@", v3, *(void *)(a1 + 40), *(void *)(a1 + 48)];

  v10[0] = @"FunctionName";
  id v5 = [NSString stringWithUTF8String:"-[MCMFileManager symbolicallyLinkURL:toSymlinkTarget:error:]_block_invoke"];
  v11[0] = v5;
  v11[1] = &unk_1F2F11108;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v10[1] = @"SourceFileLine";
  v10[2] = v6;
  v11[2] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:17 userInfo:v7];

  return v8;
}

id __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_70(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = __error();
  uint64_t v7 = (void *)[v2 initWithFormat:@"symlink from [%@] → [%@] failed: file exists, is a symlink, but its target is different [%@]: %s", v3, v5, v4, strerror(*v6)];

  v13[0] = @"FunctionName";
  uint64_t v8 = [NSString stringWithUTF8String:"-[MCMFileManager symbolicallyLinkURL:toSymlinkTarget:error:]_block_invoke"];
  v14[0] = v8;
  v14[1] = &unk_1F2F11120;
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v13[1] = @"SourceFileLine";
  v13[2] = v9;
  v14[2] = v7;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:17 userInfo:v10];

  return v11;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = +[MCMPOSIXUser currentPOSIXUser];
  LOBYTE(a6) = [(MCMFileManager *)self createDirectoryAtURL:v10 withIntermediateDirectories:v8 mode:v7 owner:v11 dataProtectionClass:0xFFFFFFFFLL error:a6];

  return (char)a6;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 dataProtectionClass:(int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = +[MCMPOSIXUser currentPOSIXUser];
  LOBYTE(a7) = [(MCMFileManager *)self createDirectoryAtURL:v12 withIntermediateDirectories:v10 mode:v9 owner:v13 dataProtectionClass:v8 error:a7];

  return (char)a7;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 error:(id *)a7
{
  return [(MCMFileManager *)self createDirectoryAtURL:a3 withIntermediateDirectories:a4 mode:a5 owner:a6 dataProtectionClass:0xFFFFFFFFLL error:a7];
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 dataProtectionClass:(int)a7 fsNode:(id *)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  int v11 = a5;
  gid_t v12 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = (const char *)[a3 fileSystemRepresentation];
  id v16 = v15;
  if (v12)
  {
    int v17 = mkpath_np(v15, v11);
    if (v17 != 17)
    {
      if (v17)
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke;
        v43[3] = &__block_descriptor_44_e14___NSError_8__0l;
        void v43[4] = v16;
        int v44 = v17;
        uint64_t v18 = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke((uint64_t)v43);
LABEL_33:
        id v24 = (id)v18;
        LOBYTE(v25) = 0;
        id v21 = 0;
        goto LABEL_58;
      }
      goto LABEL_8;
    }
  }
  else
  {
    if (!mkdir(v15, v11))
    {
LABEL_8:
      int v19 = 1;
      goto LABEL_9;
    }
    if (*__error() != 17)
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_26;
      v42[3] = &__block_descriptor_40_e14___NSError_8__0l;
      void v42[4] = v16;
      uint64_t v18 = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_26((uint64_t)v42);
      goto LABEL_33;
    }
  }
  int v19 = 0;
LABEL_9:
  if (v10 != -1 || a8)
  {
    id v26 = opendir(v16);
    id v21 = v26;
    if (!v26)
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_33;
      v41[3] = &__block_descriptor_40_e14___NSError_8__0l;
      void v41[4] = v16;
      __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_33((uint64_t)v41);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      if ((v19 & 1) == 0)
      {
        LOBYTE(v25) = 0;
        goto LABEL_58;
      }
      uint64_t v20 = 0;
      goto LABEL_36;
    }
    int v27 = dirfd(v26);
    int v28 = v27;
    if (a8)
    {
      memset(&v45, 0, sizeof(v45));
      if (fstat(v27, &v45))
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_40;
        v40[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v40[4] = v16;
        __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_40((uint64_t)v40);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = 0;
        if (v19) {
          goto LABEL_36;
        }
        goto LABEL_48;
      }
      uint64_t v20 = [[MCMFSNode alloc] initWithStat:&v45];
    }
    else
    {
      uint64_t v20 = 0;
    }
    if (v10 == -1 || !fcntl(v28, 64, v10) || *__error() == 45) {
      goto LABEL_12;
    }
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_46;
    v38[3] = &__block_descriptor_44_e14___NSError_8__0l;
    int v39 = v10;
    void v38[4] = v16;
    __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_46((uint64_t)v38);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v19) {
      goto LABEL_36;
    }
LABEL_48:
    BOOL v25 = 0;
    goto LABEL_53;
  }
  uint64_t v20 = 0;
  id v21 = 0;
LABEL_12:
  if (!v14
    || (uid_t v22 = geteuid(), v22 == [v14 UID])
    && (gid_t v23 = getegid(), v23 == [v14 primaryGID])
    || !chown(v16, [v14 UID], objc_msgSend(v14, "primaryGID")))
  {
    if (v19)
    {
      id v29 = container_log_handle_for_category();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
      if (v20)
      {
        if (v30)
        {
          v45.st_dev = 136316418;
          *(void *)&v45.int st_mode = v16;
          WORD2(v45.st_ino) = 1024;
          *(_DWORD *)((char *)&v45.st_ino + 6) = v11;
          HIWORD(v45.st_uid) = 1024;
          v45.gid_t st_gid = v12;
          LOWORD(v45.st_rdev) = 1024;
          *(dev_t *)((char *)&v45.st_rdev + 2) = v10;
          *((_WORD *)&v45.st_rdev + 3) = 2112;
          v45.st_atimespec.tv_sec = (__darwin_time_t)v14;
          LOWORD(v45.st_atimespec.tv_nsec) = 2112;
          *(uint64_t *)((char *)&v45.st_atimespec.tv_nsec + 2) = (uint64_t)v20;
          id v31 = "Created directory [%s] with mode: 0%o, w/intermediates: %d, DP class: %d, owner: %@, fsNode: %@";
          BOOL v25 = 1;
          id v32 = v29;
          uint32_t v33 = 50;
          goto LABEL_30;
        }
        id v24 = 0;
      }
      else
      {
        if (v30)
        {
          v45.st_dev = 136316162;
          *(void *)&v45.int st_mode = v16;
          WORD2(v45.st_ino) = 1024;
          *(_DWORD *)((char *)&v45.st_ino + 6) = v11;
          HIWORD(v45.st_uid) = 1024;
          v45.gid_t st_gid = v12;
          LOWORD(v45.st_rdev) = 1024;
          *(dev_t *)((char *)&v45.st_rdev + 2) = v10;
          *((_WORD *)&v45.st_rdev + 3) = 2112;
          v45.st_atimespec.tv_sec = (__darwin_time_t)v14;
          BOOL v25 = 1;
          _os_log_impl(&dword_1D7739000, v29, OS_LOG_TYPE_INFO, "Created directory [%s] with mode: 0%o, w/intermediates: %d, DP class: %d, owner: %@", (uint8_t *)&v45, 0x28u);
          id v24 = 0;
          uint64_t v20 = 0;
          goto LABEL_52;
        }
        id v24 = 0;
        uint64_t v20 = 0;
      }
      BOOL v25 = 1;
      goto LABEL_52;
    }
    id v29 = container_log_handle_for_category();
    BOOL v25 = 1;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
LABEL_31:
      id v24 = 0;
      goto LABEL_52;
    }
    v45.st_dev = 136316162;
    *(void *)&v45.int st_mode = v16;
    WORD2(v45.st_ino) = 1024;
    *(_DWORD *)((char *)&v45.st_ino + 6) = v11;
    HIWORD(v45.st_uid) = 1024;
    v45.gid_t st_gid = v12;
    LOWORD(v45.st_rdev) = 1024;
    *(dev_t *)((char *)&v45.st_rdev + 2) = v10;
    *((_WORD *)&v45.st_rdev + 3) = 2112;
    v45.st_atimespec.tv_sec = (__darwin_time_t)v14;
    id v31 = "Set directory [%s] with mode: 0%o, w/intermediates: %d, DP class: %d, owner: %@";
    id v32 = v29;
    uint32_t v33 = 40;
LABEL_30:
    _os_log_impl(&dword_1D7739000, v32, OS_LOG_TYPE_INFO, v31, (uint8_t *)&v45, v33);
    goto LABEL_31;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_52;
  v35[3] = &unk_1E6A80498;
  id v36 = v14;
  uint64_t v37 = v16;
  __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_52((uint64_t)v35);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
LABEL_36:
    id v29 = container_log_handle_for_category();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v45.st_dev = 136315394;
      *(void *)&v45.int st_mode = v16;
      WORD2(v45.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v45.st_ino + 6) = (__darwin_ino64_t)v24;
      _os_log_error_impl(&dword_1D7739000, v29, OS_LOG_TYPE_ERROR, "Created directory [%s] but could not complete its setup due to error: %@", (uint8_t *)&v45, 0x16u);
    }
    BOOL v25 = 0;
LABEL_52:

    if (!v21) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  BOOL v25 = 0;
  if (v21) {
LABEL_53:
  }
    closedir(v21);
LABEL_54:
  if (a8 && v25)
  {
    id v21 = v20;
    *a8 = v21;
    LOBYTE(v25) = 1;
    goto LABEL_61;
  }
  id v21 = (DIR *)v20;
LABEL_58:
  if (a9 && !v25)
  {
    id v24 = v24;
    LOBYTE(v25) = 0;
    *a9 = v24;
  }
LABEL_61:

  return v25;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_26(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = __error();
  uint64_t v5 = objc_msgSend(v2, "initWithFormat:", @"mkdir of %s failed: %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11078;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_33(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = __error();
  uint64_t v5 = objc_msgSend(v2, "initWithFormat:", @"opendir of %s failed: %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F11090;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_40(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = __error();
  uint64_t v5 = objc_msgSend(v2, "initWithFormat:", @"Failed to fstat() on directory %s: %s", v3, strerror(*v4));
  v11[0] = @"FunctionName";
  uint64_t v6 = [NSString stringWithUTF8String:"-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke"];
  v12[0] = v6;
  v12[1] = &unk_1F2F110A8;
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v8];

  return v9;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_46(uint64_t a1)
{
  void v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(a1 + 40);
  uint64_t v5 = __error();
  uint64_t v6 = objc_msgSend(v2, "initWithFormat:", @"Failed to setclass(%d) on directory %s: %s", v4, v3, strerror(*v5));
  v12[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke"];
  v13[0] = v7;
  v13[1] = &unk_1F2F110C0;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v9];

  return v10;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_52(uint64_t a1)
{
  void v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = __error();
  uint64_t v6 = (void *)[v2 initWithFormat:@"Failed to chown(%@) %s: %s", v4, v3, strerror(*v5)];
  v12[0] = @"FunctionName";
  uint64_t v7 = [NSString stringWithUTF8String:"-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke"];
  v13[0] = v7;
  v13[1] = &unk_1F2F110D8;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v9];

  return v10;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"mkpath_np of %s failed: %s", *(void *)(a1 + 32), strerror(*(_DWORD *)(a1 + 40)));
  v8[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke"];
  v9[0] = v3;
  v9[1] = &unk_1F2F11060;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 40) userInfo:v5];

  return v6;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 dataProtectionClass:(int)a7 error:(id *)a8
{
  return [(MCMFileManager *)self createDirectoryAtURL:a3 withIntermediateDirectories:a4 mode:a5 owner:a6 dataProtectionClass:*(void *)&a7 fsNode:0 error:a8];
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int value = 0;
  id v5 = a3;
  uint64_t v6 = [v5 fileSystemRepresentation];
  if (!v5)
  {
    int v19 = (void *)[[NSString alloc] initWithFormat:@"nil url passed to -removeItemAtURL:error:"];
    v33[0] = @"FunctionName";
    uint64_t v20 = [NSString stringWithUTF8String:"-[MCMFileManager removeItemAtURL:error:]_block_invoke"];
    *(void *)buf = v20;
    *(void *)&buf[8] = &unk_1F2F11018;
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v33[1] = @"SourceFileLine";
    v33[2] = v21;
    *(void *)&buf[16] = v19;
    uid_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v33 count:3];

    gid_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:v22];

    BOOL v24 = 0;
    goto LABEL_25;
  }
  uint64_t v7 = (const char *)v6;
  uint64_t v8 = 100;
  do
  {
    int value = 0;
    uint64_t v9 = removefile_state_alloc();
    if (removefile_state_set(v9, 3u, _removefile_error_callback))
    {
      uint64_t v10 = container_log_handle_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v14 = __error();
        id v15 = strerror(*v14);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s", buf, 0xCu);
      }
    }
    if (removefile_state_set(v9, 4u, &value))
    {
      int v11 = container_log_handle_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v16 = __error();
        int v17 = strerror(*v16);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s", buf, 0xCu);
      }
    }
    if (removefile(v7, v9, 1u)) {
      int v12 = *__error();
    }
    else {
      int v12 = 0;
    }
    removefile_state_free(v9);
    uint64_t v13 = v8 - 1;
    if (value != 35) {
      break;
    }
    --v8;
  }
  while (v8);
  if ((v12 & 0xFFFFFFFD) != 0)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __40__MCMFileManager_removeItemAtURL_error___block_invoke_9;
    v30[3] = &__block_descriptor_44_e14___NSError_8__0l;
    void v30[4] = v7;
    int v31 = v12;
    uint64_t v18 = __40__MCMFileManager_removeItemAtURL_error___block_invoke_9((uint64_t)v30);
    goto LABEL_21;
  }
  if ((value & 0xFFFFFFFD) != 0)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __40__MCMFileManager_removeItemAtURL_error___block_invoke_15;
    v28[3] = &__block_descriptor_44_e14___NSError_8__0l;
    void v28[4] = v7;
    int v29 = value;
    uint64_t v18 = __40__MCMFileManager_removeItemAtURL_error___block_invoke_15((uint64_t)v28);
LABEL_21:
    gid_t v23 = (void *)v18;
    BOOL v24 = 0;
    if (v13) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  int v27 = container_log_handle_for_category();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_1D7739000, v27, OS_LOG_TYPE_DEFAULT, "removefile([%s]) succeeded", buf, 0xCu);
  }

  gid_t v23 = 0;
  BOOL v24 = 1;
  if (!v13)
  {
LABEL_22:
    BOOL v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v12;
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = value;
      _os_log_fault_impl(&dword_1D7739000, v25, OS_LOG_TYPE_FAULT, "Hit maximum iterations trying to removefile([%s]); removefile error = %{public}d, recovery error = %{public}d",
        buf,
        0x18u);
    }
  }
LABEL_25:
  if (a4 && !v24) {
    *a4 = v23;
  }

  return v24;
}

id __40__MCMFileManager_removeItemAtURL_error___block_invoke_9(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"removefile of [%s] failed: (%d) %s", *(void *)(a1 + 32), *(unsigned int *)(a1 + 40), strerror(*(_DWORD *)(a1 + 40)));
  v8[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMFileManager removeItemAtURL:error:]_block_invoke"];
  v9[0] = v3;
  v9[1] = &unk_1F2F11030;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 40) userInfo:v5];

  return v6;
}

id __40__MCMFileManager_removeItemAtURL_error___block_invoke_15(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"removefile of [%s] failed", *(void *)(a1 + 32));
  v8[0] = @"FunctionName";
  uint64_t v3 = [NSString stringWithUTF8String:"-[MCMFileManager removeItemAtURL:error:]_block_invoke"];
  v9[0] = v3;
  v9[1] = &unk_1F2F11048;
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v8[1] = @"SourceFileLine";
  v8[2] = v4;
  v9[2] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*(int *)(a1 + 40) userInfo:v5];

  return v6;
}

@end