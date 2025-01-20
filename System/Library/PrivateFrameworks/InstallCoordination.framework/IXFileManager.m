@interface IXFileManager
+ (id)defaultManager;
- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6;
- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6;
- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5;
- (BOOL)_traverseDirectory:(id)a3 ignoringFTSErrors:(BOOL)a4 error:(id *)a5 withBlock:(id)a6;
- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5;
- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 error:(id *)a5;
- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 ignoringCopyErrors:(BOOL)a5 error:(id *)a6;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5;
- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5;
- (BOOL)itemDoesNotExistAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemExistsAtURL:(id)a3 isDirectory:(BOOL *)a4 error:(id *)a5;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5;
- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6;
- (BOOL)setPermissions:(unsigned __int16)a3 onAllChildrenOfPath:(id)a4 error:(id *)a5;
- (BOOL)setPermissionsOfItemAtURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5;
- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4;
- (id)_realPathWhatExistsInPath:(id)a3;
- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4;
- (id)createTemporaryExtractionDirectoryWithError:(id *)a3;
- (id)createTemporaryIconsDirectoryWithError:(id *)a3;
- (id)debugDescriptionOfItemAtURL:(id)a3;
- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4;
- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4;
- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5;
- (unint64_t)_diskUsageForDirectoryURL:(id)a3;
- (unint64_t)diskUsageForURL:(id)a3;
@end

@implementation IXFileManager

+ (id)defaultManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__IXFileManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, block);
  }
  v2 = (void *)defaultManager_defaultInstance;

  return v2;
}

uint64_t __31__IXFileManager_defaultManager__block_invoke()
{
  defaultManager_defaultInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  return [(IXFileManager *)self removeItemAtURL:a3 keepParent:0 error:a4];
}

- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5
{
  return IXRemoveItemAtURL(a3, a4, a5);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7
{
  return IXCreateDirectoryAtURL(a3, a4, a5, *(uint64_t *)&a6, a7);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  return [(IXFileManager *)self createDirectoryAtURL:a3 withIntermediateDirectories:a4 mode:a5 class:0xFFFFFFFFLL error:a6];
}

- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  return IXCopyItemAtURL(a3, a4, a5, a6);
}

- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!a5)
  {
    memset(&v38, 0, sizeof(v38));
    id v12 = v10;
    if (lstat((const char *)[v12 fileSystemRepresentation], &v38))
    {
      int v13 = *__error();
      BOOL v14 = v13 == 2;
      if (v13 == 2)
      {
        v15 = 0;
        if (!a6) {
          goto LABEL_22;
        }
      }
      else
      {
        v31 = (void *)*MEMORY[0x1E4F28798];
        unint64_t v32 = *__error();
        v33 = __error();
        strerror(*v33);
        v15 = _CreateError((uint64_t)"-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 83, v31, v32, 0, 0, @"stat of %@ failed: %s", v34, (uint64_t)v12);
        if (!a6) {
          goto LABEL_22;
        }
      }
LABEL_20:
      if (!v14)
      {
        id v25 = v15;
        BOOL v14 = 0;
        *a6 = v25;
        goto LABEL_23;
      }
LABEL_22:
      id v25 = v15;
      goto LABEL_23;
    }
  }
  id v16 = v10;
  v17 = (const std::__fs::filesystem::path *)[v16 fileSystemRepresentation];
  id v18 = v11;
  v19 = (const std::__fs::filesystem::path *)[v18 fileSystemRepresentation];
  rename(v17, v19, v20);
  if (v21)
  {
    if (*__error() == 18)
    {
      id v37 = 0;
      BOOL v22 = [(IXFileManager *)self _copyItemAtURL:v16 toURL:v18 failIfSrcMissing:1 error:&v37];
      id v23 = v37;
      v15 = v23;
      if (v22)
      {
        id v36 = v23;
        BOOL v24 = [(IXFileManager *)self removeItemAtURL:v16 error:&v36];
        id v25 = v36;

        if (!v24)
        {
          v26 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:](v16, (uint64_t)v25, v26);
          }
        }
        goto LABEL_15;
      }
    }
    else
    {
      v27 = (void *)*MEMORY[0x1E4F28798];
      unint64_t v28 = *__error();
      v29 = __error();
      strerror(*v29);
      v15 = _CreateError((uint64_t)"-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 98, v27, v28, 0, 0, @"rename of %@ to %@ failed: %s", v30, (uint64_t)v16);
    }
    BOOL v14 = 0;
    if (!a6) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  id v25 = 0;
LABEL_15:
  BOOL v14 = 1;
LABEL_23:

  return v14;
}

- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(IXFileManager *)self _copyItemAtURL:a3 toURL:a4 failIfSrcMissing:0 error:a5];
}

- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(IXFileManager *)self _moveItemAtURL:a3 toURL:a4 failIfSrcMissing:0 error:a5];
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(IXFileManager *)self _copyItemAtURL:a3 toURL:a4 failIfSrcMissing:1 error:a5];
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [(IXFileManager *)self _moveItemAtURL:a3 toURL:a4 failIfSrcMissing:1 error:a5];
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4
{
  return IXCreateTemporaryDirectoryInDirectoryURL(a3, a4);
}

- (id)createTemporaryExtractionDirectoryWithError:(id *)a3
{
  v5 = +[IXGlobalConfiguration sharedInstance];
  id v14 = 0;
  v6 = [v5 extractedInstallableStagingDirectory:&v14];
  id v7 = v14;

  if (v6)
  {
    id v13 = v7;
    BOOL v8 = [(IXFileManager *)self createDirectoryAtURL:v6 withIntermediateDirectories:0 mode:493 error:&v13];
    id v9 = v13;

    if (v8)
    {
      id v12 = v9;
      id v10 = [(IXFileManager *)self createTemporaryDirectoryInDirectoryURL:v6 error:&v12];
      id v7 = v12;

      if (!a3) {
        goto LABEL_10;
      }
    }
    else
    {
      id v10 = 0;
      id v7 = v9;
      if (!a3) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v10 = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }
  if (!v10) {
    *a3 = v7;
  }
LABEL_10:

  return v10;
}

- (id)createTemporaryIconsDirectoryWithError:(id *)a3
{
  v5 = +[IXGlobalConfiguration sharedInstance];
  id v14 = 0;
  v6 = [v5 iconStagingDirectoryWithError:&v14];
  id v7 = v14;

  if (v6)
  {
    id v13 = v7;
    BOOL v8 = [(IXFileManager *)self createDirectoryAtURL:v6 withIntermediateDirectories:0 mode:493 error:&v13];
    id v9 = v13;

    if (v8)
    {
      id v12 = v9;
      id v10 = [(IXFileManager *)self createTemporaryDirectoryInDirectoryURL:v6 error:&v12];
      id v7 = v12;

      if (!a3) {
        goto LABEL_10;
      }
    }
    else
    {
      id v10 = 0;
      id v7 = v9;
      if (!a3) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v10 = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }
  if (!v10) {
    *a3 = v7;
  }
LABEL_10:

  return v10;
}

- (BOOL)_traverseDirectory:(id)a3 ignoringFTSErrors:(BOOL)a4 error:(id *)a5 withBlock:(id)a6
{
  v38[2] = *(char **)MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (uint64_t (**)(void))a6;
  id v11 = v9;
  id v12 = (char *)[v11 fileSystemRepresentation];
  v38[0] = v12;
  v38[1] = 0;
  id v13 = fts_open(v38, 84, 0);
  if (!v13)
  {
    BOOL v24 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v25 = *__error();
    v26 = __error();
    strerror(*v26);
    _CreateError((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 206, v24, v25, 0, 0, @"fts_open failed for %s with error %s", v27, (uint64_t)v12);
    goto LABEL_21;
  }
  id v14 = v13;
  v15 = fts_read(v13);
  if (!v15)
  {
    if (fts_close(v14)) {
      goto LABEL_20;
    }
    BOOL v23 = 0;
    v17 = 0;
    goto LABEL_23;
  }
  id v16 = v15;
  v17 = 0;
  while (1)
  {
    unsigned int fts_info = v16->fts_info;
    BOOL v19 = fts_info > 0xA;
    int v20 = (1 << fts_info) & 0x490;
    if (!v19 && v20 != 0) {
      break;
    }
    char v22 = v10[2](v10);
    id v32 = v17;

    if ((v22 & 1) == 0) {
      goto LABEL_17;
    }
    v17 = v32;
LABEL_12:
    id v16 = fts_read(v14);
    if (!v16)
    {
      BOOL v23 = 1;
      goto LABEL_18;
    }
  }
  if (a4) {
    goto LABEL_12;
  }
  unint64_t v28 = (void *)*MEMORY[0x1E4F28798];
  int fts_errno = v16->fts_errno;
  unint64_t v30 = fts_errno;
  strerror(fts_errno);
  _CreateError((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 218, v28, v30, 0, 0, @"Error for path %s: %s", v31, (uint64_t)v12);
  id v32 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  BOOL v23 = 0;
  v17 = v32;
LABEL_18:
  if (fts_close(v14))
  {
    if (!v17)
    {
LABEL_20:
      v33 = (void *)*MEMORY[0x1E4F28798];
      unint64_t v34 = *__error();
      v35 = __error();
      strerror(*v35);
      _CreateError((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 235, v33, v34, 0, 0, @"fts_close failed for %s with error %s", v36, (uint64_t)v12);
      v17 = LABEL_21:;
    }
    BOOL v23 = 0;
  }
LABEL_23:
  if (a5 && !v23) {
    *a5 = v17;
  }

  return v23;
}

- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  acl_t v8 = acl_init(0);
  if (v8)
  {
    acl_t v9 = v8;
    if (v6)
    {
      id v10 = opendir(a3);
      if (v10)
      {
        id v11 = v10;
        if (dirfd(v10) < 0)
        {
          v58 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
          v60 = (void *)*MEMORY[0x1E4F28798];
          if (v59) {
            -[IXFileManager _removeACLAtPath:isDir:error:]();
          }

          unint64_t v61 = *__error();
          v62 = __error();
          strerror(*v62);
          BOOL v19 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 270, v60, v61, 0, 0, @"dirfd of %s failed: %s", v63, (uint64_t)a3);
          uint64_t v20 = 270;
        }
        else
        {
          if (!MEMORY[0x1AD0D43B0]())
          {
            unint64_t v30 = 0;
            BOOL v31 = 1;
            goto LABEL_32;
          }
          id v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
          id v14 = (void *)*MEMORY[0x1E4F28798];
          if (v13) {
            -[IXFileManager _removeACLAtPath:isDir:error:].cold.4();
          }

          unint64_t v15 = *__error();
          id v16 = __error();
          strerror(*v16);
          BOOL v19 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 275, v14, v15, 0, 0, @"Failed to set ACL on dir %s: %s", v17, (uint64_t)a3);
          uint64_t v20 = 275;
        }
        unint64_t v30 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", v20, @"IXErrorDomain", 1uLL, v19, 0, @"Failed to remove ACL", v18, v65);

        BOOL v31 = 0;
LABEL_32:
        closedir(v11);
        goto LABEL_33;
      }
      v43 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
      v45 = (void *)*MEMORY[0x1E4F28798];
      if (v44) {
        -[IXFileManager _removeACLAtPath:isDir:error:]();
      }

      unint64_t v46 = *__error();
      v47 = __error();
      strerror(*v47);
      v50 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 264, v45, v46, 0, 0, @"opendir of %s failed: %s", v48, (uint64_t)a3);
      uint64_t v51 = 264;
    }
    else
    {
      int v32 = open(a3, 2097154);
      if ((v32 & 0x80000000) == 0)
      {
        int v33 = v32;
        int v34 = MEMORY[0x1AD0D43B0]();
        BOOL v31 = v34 == 0;
        if (v34)
        {
          v35 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
          id v37 = (void *)*MEMORY[0x1E4F28798];
          if (v36) {
            -[IXFileManager _removeACLAtPath:isDir:error:].cold.6();
          }

          unint64_t v38 = *__error();
          v39 = __error();
          strerror(*v39);
          v41 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 286, v37, v38, 0, 0, @"Failed to set ACL on %s: %s", v40, (uint64_t)a3);
          unint64_t v30 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 286, @"IXErrorDomain", 1uLL, v41, 0, @"Failed to remove ACL", v42, v67);
        }
        else
        {
          unint64_t v30 = 0;
        }
        close(v33);
LABEL_33:
        acl_free(v9);
        if (!a5) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }
      v52 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
      v54 = (void *)*MEMORY[0x1E4F28798];
      if (v53) {
        -[IXFileManager _removeACLAtPath:isDir:error:].cold.5();
      }

      unint64_t v55 = *__error();
      v56 = __error();
      strerror(*v56);
      v50 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 281, v54, v55, 0, 0, @"open of %s failed: %s", v57, (uint64_t)a3);
      uint64_t v51 = 281;
    }
    unint64_t v30 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", v51, @"IXErrorDomain", 1uLL, v50, 0, @"Failed to remove ACL", v49, v68);

    BOOL v31 = 0;
    goto LABEL_33;
  }
  int v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
  BOOL v23 = (void *)*MEMORY[0x1E4F28798];
  if (v22) {
    -[IXFileManager _removeACLAtPath:isDir:error:]((void *)*MEMORY[0x1E4F28798]);
  }

  unint64_t v24 = *__error();
  unint64_t v25 = __error();
  v26 = strerror(*v25);
  unint64_t v28 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, v23, v24, 0, 0, @"acl_init() failed: %s", v27, (uint64_t)v26);
  unint64_t v30 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, @"IXErrorDomain", 1uLL, v28, 0, @"Failed to remove ACL", v29, v66);

  BOOL v31 = 0;
  if (a5)
  {
LABEL_34:
    if (!v31) {
      *a5 = v30;
    }
  }
LABEL_36:

  return v31;
}

- (BOOL)setPermissions:(unsigned __int16)a3 onAllChildrenOfPath:(id)a4 error:(id *)a5
{
  id v12 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__IXFileManager_setPermissions_onAllChildrenOfPath_error___block_invoke;
  v10[3] = &__block_descriptor_34_e79_B24__0___ftsent____ftsent____ftsent____ftsent_q_v__iiSSQiSsSSS__stat__1c__8__16l;
  unsigned __int16 v11 = a3;
  BOOL v6 = [(IXFileManager *)self _traverseDirectory:a4 ignoringFTSErrors:0 error:&v12 withBlock:v10];
  id v7 = v12;
  acl_t v8 = v7;
  if (a5 && !v6) {
    *a5 = v7;
  }

  return v6;
}

uint64_t __58__IXFileManager_setPermissions_onAllChildrenOfPath_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(unsigned __int16 *)(a2 + 88);
  uint64_t result = 1;
  BOOL v6 = v4 > 0xC;
  int v7 = (1 << v4) & 0x110A;
  if (!v6 && v7 != 0)
  {
    id v10 = *(const char **)(a2 + 48);
    if (lchmod(v10, *(_WORD *)(a1 + 32)))
    {
      int v11 = *__error();
      id v12 = (void *)*MEMORY[0x1E4F28798];
      unint64_t v13 = *__error();
      strerror(v11);
      _CreateError((uint64_t)"-[IXFileManager setPermissions:onAllChildrenOfPath:error:]_block_invoke", 325, v12, v13, 0, 0, @"Failed to lchmod %s to mode 0%o : %s", v14, (uint64_t)v10);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t result = 0;
      *a3 = v15;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 error:(id *)a5
{
  return [(IXFileManager *)self copyACLFrom:a3 toAllChildrenOfPath:a4 ignoringCopyErrors:0 error:a5];
}

- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 ignoringCopyErrors:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  unint64_t v13 = (const char *)[v12 fileSystemRepresentation];
  acl_t link_np = acl_get_link_np(v13, ACL_TYPE_EXTENDED);
  if (link_np)
  {
    acl_t v15 = link_np;
    id v23 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__IXFileManager_copyACLFrom_toAllChildrenOfPath_ignoringCopyErrors_error___block_invoke;
    v21[3] = &__block_descriptor_41_e79_B24__0___ftsent____ftsent____ftsent____ftsent_q_v__iiSSQiSsSSS__stat__1c__8__16l;
    v21[4] = link_np;
    BOOL v22 = v7;
    BOOL v16 = [(IXFileManager *)self _traverseDirectory:v11 ignoringFTSErrors:v7 error:&v23 withBlock:v21];
    id v17 = v23;
    acl_free(v15);
    if (!a6) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  unint64_t v19 = *__error();
  if (v19 == 2 && [(IXFileManager *)self itemExistsAtURL:v12]) {
    _CreateError((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]", 361, (void *)*MEMORY[0x1E4F28798], 0x5DuLL, 0, 0, @"acl_get_link_np found no ACLs on %s", v18, (uint64_t)v13);
  }
  else {
    _CreateError((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]", 366, (void *)*MEMORY[0x1E4F28798], v19, 0, 0, @"acl_get_link_np failed for %s", v18, (uint64_t)v13);
  }
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v16 = 0;
  if (a6)
  {
LABEL_9:
    if (!v16) {
      *a6 = v17;
    }
  }
LABEL_11:

  return v16;
}

uint64_t __74__IXFileManager_copyACLFrom_toAllChildrenOfPath_ignoringCopyErrors_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = *(unsigned __int16 *)(a2 + 88);
  uint64_t result = 1;
  BOOL v6 = v4 >= 8;
  BOOL v8 = v4 == 8;
  int v7 = (1 << v4) & 0x10A;
  BOOL v8 = !v8 && v6 || v7 == 0;
  if (!v8)
  {
    id v10 = *(const char **)(a2 + 48);
    id v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __74__IXFileManager_copyACLFrom_toAllChildrenOfPath_ignoringCopyErrors_error___block_invoke_cold_1((uint64_t)v10, v11);
    }

    if (!acl_set_link_np(v10, ACL_TYPE_EXTENDED, *(acl_t *)(a1 + 32))) {
      return 1;
    }
    unint64_t v13 = *__error();
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v17 = "-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke";
        __int16 v18 = 2080;
        unint64_t v19 = strerror(v13);
        __int16 v20 = 2080;
        int v21 = v10;
        _os_log_impl(&dword_1A7B2D000, v14, OS_LOG_TYPE_DEFAULT, "%s: Ignoring error %s from acl_set_link_np for %s", buf, 0x20u);
      }

      return 1;
    }
    _CreateError((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke", 384, (void *)*MEMORY[0x1E4F28798], v13, 0, 0, @"acl_set_link_np for %s failed", v12, (uint64_t)v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t result = 0;
    *a3 = v15;
  }
  return result;
}

- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5
{
  return IXUrlsForItemsInDirectoryAtURL(a3, a4, a5);
}

- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  acl_t v9 = (const char *)[v8 fileSystemRepresentation];
  id v10 = v7;
  int v11 = symlink(v9, (const char *)[v10 fileSystemRepresentation]);
  if (v11)
  {
    uint64_t v12 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v13 = *__error();
    uint64_t v14 = [v8 fileSystemRepresentation];
    [v10 fileSystemRepresentation];
    id v15 = __error();
    strerror(*v15);
    _CreateError((uint64_t)"-[IXFileManager createSymbolicLinkAtURL:withDestinationURL:error:]", 418, v12, v13, 0, 0, @"Could not create symlink containing %s at %s: %s", v16, v14);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v17 = v17;
      *a5 = v17;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v11 == 0;
}

- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  ssize_t v6 = readlink((const char *)[v5 fileSystemRepresentation], v17, 0x400uLL);
  if (v6 < 0)
  {
    int v11 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v12 = *__error();
    uint64_t v13 = [v5 fileSystemRepresentation];
    uint64_t v14 = __error();
    strerror(*v14);
    id v10 = _CreateError((uint64_t)"-[IXFileManager destinationOfSymbolicLinkAtURL:error:]", 438, v11, v12, 0, 0, @"Could not readlink %s : %s", v15, v13);
    acl_t v9 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v17[v6] = 0;
    id v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = [NSString stringWithFileSystemRepresentation:v17 length:v6];
    acl_t v9 = [v7 fileURLWithPath:v8];

    id v10 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v9) {
    *a4 = v10;
  }
LABEL_7:

  return v9;
}

- (BOOL)itemExistsAtURL:(id)a3 isDirectory:(BOOL *)a4 error:(id *)a5
{
  return IXItemExistsAtURL(a3, a4, a5);
}

- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4
{
  return [(IXFileManager *)self itemExistsAtURL:a3 isDirectory:0 error:a4];
}

- (BOOL)itemExistsAtURL:(id)a3
{
  return [(IXFileManager *)self itemExistsAtURL:a3 error:0];
}

- (BOOL)itemDoesNotExistAtURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(&v9, 0, sizeof(v9));
  id v3 = a3;
  if (!lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0,
                          0),
          &v9))
  {
LABEL_7:
    BOOL v4 = 0;
    goto LABEL_8;
  }
  if (*__error() != 2)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      ssize_t v6 = __error();
      id v7 = strerror(*v6);
      *(_DWORD *)buf = 136315650;
      int v11 = "-[IXFileManager itemDoesNotExistAtURL:]";
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2080;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to determine if %@ exists: %s", buf, 0x20u);
    }

    goto LABEL_7;
  }
  BOOL v4 = 1;
LABEL_8:

  return v4;
}

- (id)debugDescriptionOfItemAtURL:(id)a3
{
  memset(&v12, 0, sizeof(v12));
  int v3 = lstat((const char *)[a3 fileSystemRepresentation], &v12);
  BOOL v4 = NSString;
  if (v3)
  {
    id v5 = __error();
    id v8 = strerror(*v5);
    objc_msgSend(v4, "stringWithFormat:", @"<lstat error: %s>", v8, v9, v10, v11, *(void *)&v12.st_dev, v12.st_ino);
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<uid:%u gid:%u mode:0%ho flags:0x%x>", v12.st_uid, v12.st_gid, v12.st_mode, v12.st_flags, *(void *)&v12.st_dev, v12.st_ino);
  ssize_t v6 = };

  return v6;
}

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 256);
  int v9 = v8;
  if (v8 < 0)
  {
    id v13 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v14 = *__error();
    uint64_t v15 = [v7 fileSystemRepresentation];
    uint64_t v16 = __error();
    strerror(*v16);
    _CreateError((uint64_t)"-[IXFileManager dataProtectionClassOfItemAtURL:class:error:]", 498, v13, v14, 0, 0, @"Failed to open %s : %s", v17, v15);
  }
  else
  {
    int v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0)
    {
      uint64_t v11 = 0;
      *a4 = v10;
      char v12 = 1;
LABEL_9:
      close(v9);
      BOOL v24 = v12;
      goto LABEL_10;
    }
    uint64_t v18 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v19 = *__error();
    uint64_t v20 = [v7 fileSystemRepresentation];
    int v21 = __error();
    strerror(*v21);
    _CreateError((uint64_t)"-[IXFileManager dataProtectionClassOfItemAtURL:class:error:]", 504, v18, v19, 0, 0, @"Failed to getclass of file %s: %s", v22, v20);
  id v23 = };
  uint64_t v11 = v23;
  if (a5) {
    *a5 = v23;
  }
  char v12 = 0;
  BOOL v24 = 0;
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_9;
  }
LABEL_10:

  return v24;
}

- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  int v10 = (unsigned int (**)(id, void))a5;
  id v11 = v9;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 256);
  int v13 = v12;
  if (v12 < 0)
  {
    unint64_t v19 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v20 = *__error();
    uint64_t v21 = [v11 fileSystemRepresentation];
    uint64_t v22 = __error();
    uint64_t v33 = v21;
    strerror(*v22);
    BOOL v24 = @"Failed to open %s : %s";
    uint64_t v25 = 530;
  }
  else
  {
    if (!v10)
    {
LABEL_5:
      if (fcntl(v13, 64, v8))
      {
        uint64_t v15 = (void *)*MEMORY[0x1E4F28798];
        unint64_t v16 = *__error();
        [v11 fileSystemRepresentation];
        uint64_t v17 = __error();
        strerror(*v17);
        _CreateError((uint64_t)"-[IXFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", 547, v15, v16, 0, 0, @"Failed to setclass(%d) on file %s: %s", v18, v8);
        goto LABEL_11;
      }
LABEL_8:
      v26 = 0;
      char v27 = 1;
LABEL_14:
      close(v13);
      BOOL v31 = v27;
      goto LABEL_15;
    }
    uint64_t v14 = fcntl(v12, 63);
    if ((v14 & 0x80000000) == 0)
    {
      if (!v10[2](v10, v14)) {
        goto LABEL_8;
      }
      goto LABEL_5;
    }
    unint64_t v19 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v20 = *__error();
    uint64_t v28 = [v11 fileSystemRepresentation];
    uint64_t v29 = __error();
    uint64_t v33 = v28;
    strerror(*v29);
    BOOL v24 = @"Failed to getclass of file %s: %s";
    uint64_t v25 = 538;
  }
  _CreateError((uint64_t)"-[IXFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", v25, v19, v20, 0, 0, v24, v23, v33);
  unint64_t v30 = LABEL_11:;
  v26 = v30;
  if (a6) {
    *a6 = v30;
  }
  char v27 = 0;
  BOOL v31 = 0;
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_14;
  }
LABEL_15:

  return v31;
}

- (BOOL)setPermissionsOfItemAtURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = (const char *)[a3 fileSystemRepresentation];
  int v8 = lchmod(v7, a4);
  if (v8)
  {
    id v9 = (void *)*MEMORY[0x1E4F28798];
    unint64_t v10 = *__error();
    id v11 = __error();
    strerror(*v11);
    int v13 = _CreateError((uint64_t)"-[IXFileManager setPermissionsOfItemAtURL:toMode:error:]", 567, v9, v10, 0, 0, @"Failed to lchmod %s to mode 0%o : %s", v12, (uint64_t)v7);
    uint64_t v14 = v13;
    if (a5) {
      *a5 = v13;
    }
  }
  return v8 == 0;
}

- (id)_realPathWhatExistsInPath:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
      int v8 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v7];
      id v9 = 0;
      if ([(IXFileManager *)self itemExistsAtURL:v8])
      {
        unint64_t v10 = [(IXFileManager *)self _realPathForURL:v8 allowNonExistentPathComponents:0];
        if (v10)
        {
          id v11 = objc_msgSend(v4, "subarrayWithRange:", v6 + 1, objc_msgSend(v4, "count") - (v6 + 1));
          uint64_t v12 = [NSString pathWithComponents:v11];
          int v13 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v15 = [v10 path];
            *(_DWORD *)buf = 136315650;
            uint64_t v17 = "-[IXFileManager _realPathWhatExistsInPath:]";
            __int16 v18 = 2112;
            unint64_t v19 = v15;
            __int16 v20 = 2112;
            uint64_t v21 = v12;
            _os_log_debug_impl(&dword_1A7B2D000, v13, OS_LOG_TYPE_DEBUG, "%s: Realpathed %@ ; appending non-existing components %@",
              buf,
              0x20u);
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

- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  bzero(v24, 0x400uLL);
  id v7 = [a3 path];
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], v24))
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v24 isDirectory:0 relativeToURL:0];
LABEL_11:
    uint64_t v14 = (void *)v8;
    goto LABEL_12;
  }
  if (*__error() == 2 && v4)
  {
    uint64_t v8 = [(IXFileManager *)self _realPathWhatExistsInPath:v7];
    goto LABEL_11;
  }
  unint64_t v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 fileSystemRepresentation];
    uint64_t v12 = __error();
    int v13 = strerror(*v12);
    int v16 = 136315906;
    uint64_t v17 = "-[IXFileManager _realPathForURL:allowNonExistentPathComponents:]";
    __int16 v18 = 2080;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    uint64_t v21 = v13;
    __int16 v22 = 2080;
    uint64_t v23 = v24;
    _os_log_impl(&dword_1A7B2D000, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to realpath %s : %s at %s", (uint8_t *)&v16, 0x2Au);
  }

  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    __int16 v18 = a5;
    [v7 pathComponents];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      signed int v13 = a4;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v15 isEqualToString:@".."])
          {
            --v13;
          }
          else if (([v15 isEqualToString:&stru_1EFDF6C00] & 1) == 0 {
                 && ([v15 isEqualToString:@"."] & 1) == 0)
          }
          {
            v13 += [v15 isEqualToString:@"/"] ^ 1;
          }
          if (v13 < (int)a4)
          {

            goto LABEL_18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      signed int v13 = a4;
    }

    if (v18) {
      *__int16 v18 = v13;
    }
    BOOL v16 = 1;
  }
  else
  {
    id v9 = 0;
LABEL_18:
    BOOL v16 = 0;
  }

  return v16;
}

- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  id v7 = a4;
  bzero(v104, 0x400uLL);
  if (!v6 || !v7)
  {
    uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315650;
    v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    __int16 v92 = 2112;
    id v93 = v7;
    __int16 v94 = 2112;
    v95 = v6;
    unint64_t v30 = "%s: The base path %@ and/or suspicious path %@ were nil";
    BOOL v31 = v25;
    uint32_t v32 = 32;
    goto LABEL_14;
  }
  uint64_t v8 = [v7 path];
  int v9 = [v8 hasPrefix:@"/private/"];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v11 = [v7 path];
    uint64_t v12 = [v11 substringFromIndex:objc_msgSend(@"/private", "length")];
    uint64_t v13 = [v10 fileURLWithPath:v12];

    id v7 = (id)v13;
  }
  uint64_t v14 = [v6 path];
  int v15 = [v14 hasPrefix:@"/private/"];

  if (v15)
  {
    BOOL v16 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v17 = [v6 path];
    __int16 v18 = [v17 substringFromIndex:objc_msgSend(@"/private", "length")];
    uint64_t v19 = [v16 fileURLWithPath:v18];

    uint64_t v6 = (char *)v19;
  }
  long long v20 = [v6 path];
  long long v21 = [v7 path];
  char v22 = [v20 hasPrefix:v21];

  if ((v22 & 1) == 0)
  {
    uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v6 path];
      uint64_t v33 = [v7 path];
      *(_DWORD *)buf = 136315650;
      v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v92 = 2112;
      id v93 = v26;
      __int16 v94 = 2112;
      v95 = v33;
      _os_log_impl(&dword_1A7B2D000, v25, OS_LOG_TYPE_DEFAULT, "%s: supiscious path %@ does not contain base path %@ as a prefix", buf, 0x20u);

LABEL_22:
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  uint64_t v23 = [v6 pathComponents];
  int v24 = [v23 containsObject:@".."];

  if (v24)
  {
    uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v6 path];
      *(_DWORD *)buf = 136315394;
      v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v92 = 2112;
      id v93 = v26;
      char v27 = "%s: The suspicious path %@ contains '..' paths, which are invalid";
LABEL_11:
      uint64_t v28 = v25;
      uint32_t v29 = 22;
LABEL_21:
      _os_log_impl(&dword_1A7B2D000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      goto LABEL_22;
    }
LABEL_23:

    v35 = 0;
    BOOL v36 = 0;
LABEL_24:
    id v37 = 0;
LABEL_25:
    id v38 = 0;
LABEL_26:
    v39 = 0;
    goto LABEL_27;
  }
  uint64_t v6 = v6;
  ssize_t v34 = readlink((const char *)[v6 fileSystemRepresentation], v104, 0x400uLL);
  if (v34 < 0)
  {
    if (*__error() == 22 || *__error() == 2)
    {
      BOOL v36 = [v6 path];
      v35 = 0;
      goto LABEL_35;
    }
    uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v52 = __error();
    BOOL v53 = strerror(*v52);
    *(_DWORD *)buf = 136315394;
    v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    __int16 v92 = 2080;
    id v93 = v53;
    unint64_t v30 = "%s: Readlink failed: %s";
    BOOL v31 = v25;
    uint32_t v32 = 22;
LABEL_14:
    _os_log_impl(&dword_1A7B2D000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_23;
  }
  if (v104[0] == 47)
  {
    uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v6 path];
      *(_DWORD *)buf = 136315650;
      v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v92 = 2112;
      id v93 = v26;
      __int16 v94 = 2080;
      v95 = v104;
      char v27 = "%s: Rejecting %@ -> %s, as absolute symlinks are not allowed";
      uint64_t v28 = v25;
      uint32_t v29 = 32;
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  unsigned int v89 = 0;
  uint64_t v42 = [v7 path];
  BOOL v43 = [(IXFileManager *)self _validateSymlink:v42 withStartingDepth:0 andEndingDepth:&v89];

  if (!v43)
  {
    uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v26 = [v7 path];
    *(_DWORD *)buf = 136315394;
    v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    __int16 v92 = 2112;
    id v93 = v26;
    char v27 = "%s: Failed to retrieve depth of %@";
    goto LABEL_11;
  }
  BOOL v44 = [v6 path];
  v45 = [v7 path];
  unint64_t v46 = objc_msgSend(v44, "substringFromIndex:", objc_msgSend(v45, "length"));

  v35 = [v46 stringByDeletingLastPathComponent];

  v47 = [NSString stringWithFileSystemRepresentation:v104 length:v34];
  BOOL v36 = [v35 stringByAppendingPathComponent:v47];

  if (![(IXFileManager *)self _validateSymlink:v36 withStartingDepth:v89 andEndingDepth:0])
  {
    v50 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = [v6 path];
      v56 = [v7 path];
      *(_DWORD *)buf = 136315906;
      v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v92 = 2112;
      id v93 = v51;
      __int16 v94 = 2112;
      v95 = v36;
      __int16 v96 = 2112;
      v97 = v56;
      _os_log_impl(&dword_1A7B2D000, v50, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ -> %@, as it is points outside or to the base %@", buf, 0x2Au);

      goto LABEL_50;
    }
LABEL_51:

    goto LABEL_24;
  }
LABEL_35:
  uint64_t v48 = [(IXFileManager *)self _realPathForURL:v7 allowNonExistentPathComponents:0];
  if (!v48)
  {
    v50 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = [v7 path];
      *(_DWORD *)buf = 136315394;
      v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v92 = 2112;
      id v93 = v51;
      _os_log_impl(&dword_1A7B2D000, v50, OS_LOG_TYPE_DEFAULT, "%s: Failed to retrieve realpath for base path %@ ", buf, 0x16u);
LABEL_50:

      goto LABEL_51;
    }
    goto LABEL_51;
  }
  id v37 = (void *)v48;
  uint64_t v49 = [(IXFileManager *)self _realPathForURL:v6 allowNonExistentPathComponents:1];
  if (!v49)
  {
    v54 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v55 = [v6 path];
      *(_DWORD *)buf = 136315394;
      v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v92 = 2112;
      id v93 = v55;
      _os_log_impl(&dword_1A7B2D000, v54, OS_LOG_TYPE_DEFAULT, "%s: Failed to retrieve realpath for suspicious path %@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  id v38 = v49;
  if (v34 < 0)
  {
    uint64_t v57 = [v49 pathComponents];
    v87 = [v37 pathComponents];
    unint64_t v58 = [v87 count];
    v88 = v57;
    unint64_t v59 = [v57 count];
    if (v59 < 2 || v58 <= 1)
    {
      uint64_t v65 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        [v6 path];
        v70 = loga = v65;
        v71 = [v7 path];
        v72 = [v38 path];
        v73 = [v37 path];
        *(_DWORD *)buf = 136316162;
        v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
        __int16 v92 = 2112;
        id v93 = v70;
        __int16 v94 = 2112;
        v95 = v71;
        __int16 v96 = 2112;
        v97 = v72;
        __int16 v98 = 2112;
        uint64_t v99 = (uint64_t)v73;
        _os_log_impl(&dword_1A7B2D000, loga, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ because real component counts don't make sense (reals %@ ; %@)",
          buf,
          0x34u);

        uint64_t v65 = loga;
      }
    }
    else
    {
      unint64_t v60 = v59;
      unint64_t v61 = 1;
      v62 = [v87 objectAtIndexedSubscript:1];
      if ([v62 isEqualToString:@"private"]) {
        unint64_t v61 = 2;
      }

      [v88 objectAtIndexedSubscript:1];
      uint64_t v63 = v82 = v58;
      if ([v63 isEqualToString:@"private"]) {
        uint64_t v64 = 2;
      }
      else {
        uint64_t v64 = 1;
      }

      if (v82 - v61 <= v60 - v64)
      {
        if (v82 <= v61)
        {
LABEL_67:

          goto LABEL_38;
        }
        while (1)
        {
          v74 = [v87 objectAtIndexedSubscript:v61];
          v75 = [v88 objectAtIndexedSubscript:v64];
          char logb = [v74 isEqualToString:v75];

          if ((logb & 1) == 0) {
            break;
          }
          ++v61;
          ++v64;
          if (v82 == v61) {
            goto LABEL_67;
          }
        }
        uint64_t v65 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t logc = [v6 path];
          v81 = [v7 path];
          v80 = [v38 path];
          v79 = [v37 path];
          v76 = [v87 objectAtIndexedSubscript:v61];
          uint64_t v77 = [v88 objectAtIndexedSubscript:v64];
          *(_DWORD *)buf = 136316674;
          v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
          __int16 v92 = 2112;
          id v93 = logc;
          __int16 v94 = 2112;
          v95 = v81;
          __int16 v96 = 2112;
          v97 = v80;
          __int16 v98 = 2112;
          uint64_t v99 = (uint64_t)v79;
          __int16 v100 = 2112;
          v101 = v76;
          __int16 v102 = 2112;
          uint64_t v103 = v77;
          v78 = (void *)v77;
          _os_log_impl(&dword_1A7B2D000, v65, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ (reals %@ ; %@) because components diverge at %@ != %@",
            buf,
            0x48u);
        }
      }
      else
      {
        uint64_t v65 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t log = [v6 path];
          uint64_t v66 = [v7 path];
          uint64_t v67 = [v38 path];
          uint64_t v68 = [v37 path];
          *(_DWORD *)buf = 136316162;
          v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
          __int16 v92 = 2112;
          id v93 = log;
          __int16 v94 = 2112;
          v95 = v66;
          __int16 v96 = 2112;
          v97 = v67;
          __int16 v98 = 2112;
          uint64_t v99 = v68;
          v69 = (void *)v68;
          _os_log_impl(&dword_1A7B2D000, v65, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ because base component count is greater than child component count (reals %@ ; %@)",
            buf,
            0x34u);
        }
      }
    }

    goto LABEL_26;
  }
LABEL_38:
  id v38 = v38;
  v39 = v38;
LABEL_27:
  id v40 = v39;

  return v40;
}

- (unint64_t)_diskUsageForDirectoryURL:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  int v3 = (char *)a3;
  BOOL v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  int v58 = 0;
  int v60 = 0;
  unint64_t v57 = 0xA200000900000005;
  uint64_t v59 = 0x500000002;
  uint64_t v6 = (int *)malloc_type_malloc(0x8000uLL, 0xD1AD82F4uLL);
  uint64_t v49 = v3;
  uint64_t v7 = [v3 path];
  uint64_t v48 = (void *)v7;
  if (v7)
  {
    [v5 addObject:v7];
  }
  else
  {
    uint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
      __int16 v63 = 2112;
      uint64_t v64 = v49;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get path to url %@", buf, 0x16u);
    }
  }
  if ([v5 count])
  {
    unint64_t v55 = 0;
    BOOL v53 = v4;
    v50 = v6;
    while (1)
    {
      int v9 = (void *)MEMORY[0x1AD0D4670]();
      uint64_t v10 = [v5 objectAtIndex:0];
      [v5 removeObjectAtIndex:0];
      id v56 = v10;
      int v11 = open((const char *)[v56 fileSystemRepresentation], 1048832);
      if (v11 < 0)
      {
        v41 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v42 = __error();
          BOOL v43 = strerror(*v42);
          *(_DWORD *)buf = 136315650;
          v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
          __int16 v63 = 2112;
          uint64_t v64 = (char *)v56;
          __int16 v65 = 2080;
          uint64_t v66 = v43;
          _os_log_impl(&dword_1A7B2D000, v41, OS_LOG_TYPE_DEFAULT, "%s: Failed to open directory %@ : %s", buf, 0x20u);
        }
      }
      else
      {
        int v52 = v11;
        uint64_t v51 = v9;
        uint64_t v12 = 0;
LABEL_10:
        uint64_t v6 = v50;
        while (1)
        {
          int v13 = getattrlistbulk(v52, &v57, v50, 0x8000uLL, 0);
          if (v13 == -1) {
            break;
          }
          int v14 = v13;
          if (!v13) {
            goto LABEL_64;
          }
          if (v13 >= 1)
          {
            while (1)
            {
              uint64_t v16 = *v6;
              unsigned int v15 = v6[1];
              unsigned int v17 = v6[4];
              if ((v15 & 0x20000000) != 0)
              {
                if (v6[6])
                {
                  uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    v26 = __error();
                    char v27 = strerror(*v26);
                    *(_DWORD *)buf = 136315906;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2080;
                    uint64_t v64 = v27;
                    __int16 v65 = 2048;
                    uint64_t v66 = v12;
                    __int16 v67 = 2112;
                    uint64_t v68 = (char *)v56;
                    uint64_t v28 = v25;
                    uint32_t v29 = "%s: Got error %s while processing entry %llu in %@";
                    uint32_t v30 = 42;
                    goto LABEL_45;
                  }
LABEL_55:

                  goto LABEL_56;
                }
                __int16 v18 = v6 + 7;
                if ((v15 & 1) == 0)
                {
LABEL_16:
                  int v19 = 0;
                  long long v20 = 0;
                  if ((v15 & 8) != 0) {
                    goto LABEL_17;
                  }
                  goto LABEL_24;
                }
              }
              else
              {
                __int16 v18 = v6 + 6;
                if ((v15 & 1) == 0) {
                  goto LABEL_16;
                }
              }
              int v19 = v18[1];
              long long v20 = (char *)v18 + *v18;
              v18 += 2;
              if ((v15 & 8) != 0)
              {
LABEL_17:
                int v22 = *v18++;
                int v21 = v22;
                if ((v15 & 0x2000000) != 0) {
                  goto LABEL_18;
                }
                goto LABEL_25;
              }
LABEL_24:
              int v21 = 0;
              if ((v15 & 0x2000000) != 0)
              {
LABEL_18:
                uint64_t v24 = *(void *)v18;
                v18 += 2;
                uint64_t v23 = v24;
                goto LABEL_26;
              }
LABEL_25:
              uint64_t v23 = 0;
LABEL_26:
              if (v21 == 2)
              {
                if ((v6[3] & 2) != 0 && !*v18)
                {
                  uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2112;
                    uint64_t v64 = (char *)v56;
                    __int16 v65 = 2080;
                    uint64_t v66 = v20;
                    _os_log_debug_impl(&dword_1A7B2D000, v25, OS_LOG_TYPE_DEBUG, "%s: skipping empty directory at %@/%s", buf, 0x20u);
                  }
                  goto LABEL_55;
                }
                if (!v20)
                {
                  uint64_t v25 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2048;
                    uint64_t v64 = v12;
                    __int16 v65 = 2112;
                    uint64_t v66 = (char *)v56;
                    uint64_t v28 = v25;
                    uint32_t v29 = "%s: Failed to get name for directory item %llu in %@; not counting its children";
                    uint32_t v30 = 32;
LABEL_45:
                    _os_log_impl(&dword_1A7B2D000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
                  }
                  goto LABEL_55;
                }
                uint64_t v31 = MEMORY[0x1AD0D4670]();
                uint32_t v32 = [NSString stringWithFileSystemRepresentation:v20 length:(v19 - 1)];
                uint64_t v33 = [v56 stringByAppendingPathComponent:v32];

                if (v33)
                {
                  [v5 addObject:v33];
                }
                else
                {
                  id v40 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2080;
                    uint64_t v64 = v20;
                    __int16 v65 = 2112;
                    uint64_t v66 = (char *)v56;
                    _os_log_impl(&dword_1A7B2D000, v40, OS_LOG_TYPE_DEFAULT, "%s: Failed to create path to child directory by appending \"%s\" to %@", buf, 0x20u);
                  }
                }
                v39 = (void *)v31;
                goto LABEL_52;
              }
              if (v17)
              {
                int v36 = *v18++;
                int v34 = v36;
                if ((v17 & 4) != 0)
                {
LABEL_34:
                  uint64_t v35 = *(void *)v18;
                  goto LABEL_37;
                }
              }
              else
              {
                int v34 = 0;
                if ((v17 & 4) != 0) {
                  goto LABEL_34;
                }
              }
              uint64_t v35 = 0;
LABEL_37:
              if (v34 != 1)
              {
                uint64_t v54 = MEMORY[0x1AD0D4670]();
                id v37 = [NSNumber numberWithUnsignedLongLong:v23];
                if ([v53 containsObject:v37])
                {
                  id v38 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2112;
                    uint64_t v64 = (char *)v56;
                    __int16 v65 = 2080;
                    uint64_t v66 = v20;
                    _os_log_debug_impl(&dword_1A7B2D000, v38, OS_LOG_TYPE_DEBUG, "%s: Skipping hardlinked file at %@/%s", buf, 0x20u);
                  }
                }
                else
                {
                  v55 += v35;
                  [v53 addObject:v37];
                }

                v39 = (void *)v54;
LABEL_52:
                goto LABEL_56;
              }
              v55 += v35;
LABEL_56:
              uint64_t v6 = (int *)((char *)v6 + v16);
              ++v12;
              if (!--v14) {
                goto LABEL_10;
              }
            }
          }
        }
        BOOL v44 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = __error();
          unint64_t v46 = strerror(*v45);
          *(_DWORD *)buf = 136315906;
          v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
          __int16 v63 = 2048;
          uint64_t v64 = v12;
          __int16 v65 = 2112;
          uint64_t v66 = (char *)v56;
          __int16 v67 = 2080;
          uint64_t v68 = v46;
          _os_log_impl(&dword_1A7B2D000, v44, OS_LOG_TYPE_DEFAULT, "%s: getattrlistbulk on entry %llu in %@ returned error %s", buf, 0x2Au);
        }

LABEL_64:
        close(v52);
        BOOL v4 = v53;
        int v9 = v51;
      }

      if (![v5 count]) {
        goto LABEL_68;
      }
    }
  }
  unint64_t v55 = 0;
LABEL_68:
  free(v6);

  return v55;
}

- (unint64_t)diskUsageForURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(&v11, 0, sizeof(v11));
  id v4 = a3;
  if (lstat((const char *)objc_msgSend(v4, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v11))
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 fileSystemRepresentation];
      uint64_t v7 = __error();
      uint64_t v8 = strerror(*v7);
      *(_DWORD *)buf = 136315650;
      int v13 = "-[IXFileManager diskUsageForURL:]";
      __int16 v14 = 2080;
      uint64_t v15 = v6;
      __int16 v16 = 2080;
      unsigned int v17 = v8;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to stat %s : %s", buf, 0x20u);
    }

    unint64_t v9 = 0;
  }
  else if ((v11.st_mode & 0xF000) == 0x4000)
  {
    unint64_t v9 = [(IXFileManager *)self _diskUsageForDirectoryURL:v4];
  }
  else
  {
    unint64_t v9 = v11.st_blocks << 9;
  }

  return v9;
}

- (void)_moveItemAtURL:(NSObject *)a3 toURL:failIfSrcMissing:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 path];
  int v6 = 136315650;
  uint64_t v7 = "-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]";
  __int16 v8 = 2112;
  unint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_ERROR, "%s: Failed to remove move source after copy at %@ : %@", (uint8_t *)&v6, 0x20u);
}

- (void)_removeACLAtPath:(void *)a1 isDir:error:.cold.1(void *a1)
{
  unint64_t v2 = *__error();
  int v3 = __error();
  id v4 = strerror(*v3);
  __int16 v14 = _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, a1, v2, 0, 0, @"acl_init() failed: %s", v5, (uint64_t)v4);
  OUTLINED_FUNCTION_1(&dword_1A7B2D000, v6, v7, "%s: Failed to remove ACL : %@", v8, v9, v10, v11, v12, v13, 2u);
}

- (void)_removeACLAtPath:isDir:error:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  __error();
  v1 = __error();
  uint64_t v18 = strerror(*v1);
  OUTLINED_FUNCTION_2_0();
  int v10 = _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7B2D000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

- (void)_removeACLAtPath:isDir:error:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  __error();
  v1 = __error();
  uint64_t v18 = strerror(*v1);
  OUTLINED_FUNCTION_2_0();
  int v10 = _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7B2D000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

- (void)_removeACLAtPath:isDir:error:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  __error();
  v1 = __error();
  uint64_t v18 = strerror(*v1);
  OUTLINED_FUNCTION_2_0();
  int v10 = _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7B2D000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

- (void)_removeACLAtPath:isDir:error:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  __error();
  v1 = __error();
  uint64_t v18 = strerror(*v1);
  OUTLINED_FUNCTION_2_0();
  int v10 = _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7B2D000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

- (void)_removeACLAtPath:isDir:error:.cold.6()
{
  OUTLINED_FUNCTION_3_1();
  __error();
  v1 = __error();
  uint64_t v18 = strerror(*v1);
  OUTLINED_FUNCTION_2_0();
  int v10 = _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7B2D000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

void __74__IXFileManager_copyACLFrom_toAllChildrenOfPath_ignoringCopyErrors_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1A7B2D000, a2, OS_LOG_TYPE_DEBUG, "%s: Writing ACL to %s", (uint8_t *)&v2, 0x16u);
}

@end