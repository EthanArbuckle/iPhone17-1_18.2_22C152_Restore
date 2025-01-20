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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003DBC4;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109F10 != -1) {
    dispatch_once(&qword_100109F10, block);
  }
  v2 = (void *)qword_100109F08;

  return v2;
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
    memset(&v36, 0, sizeof(v36));
    id v12 = v10;
    if (lstat((const char *)[v12 fileSystemRepresentation], &v36))
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
        unint64_t v30 = *__error();
        v31 = __error();
        strerror(*v31);
        v15 = sub_10003DAE4((uint64_t)"-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 83, NSPOSIXErrorDomain, v30, 0, 0, @"stat of %@ failed: %s", v32, (uint64_t)v12);
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
      id v35 = 0;
      unsigned int v22 = [(IXFileManager *)self _copyItemAtURL:v16 toURL:v18 failIfSrcMissing:1 error:&v35];
      id v23 = v35;
      v15 = v23;
      if (v22)
      {
        id v34 = v23;
        unsigned __int8 v24 = [(IXFileManager *)self removeItemAtURL:v16 error:&v34];
        id v25 = v34;

        if ((v24 & 1) == 0)
        {
          v26 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_100091EB8(v16, (uint64_t)v25, v26);
          }
        }
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v27 = *__error();
      v28 = __error();
      strerror(*v28);
      v15 = sub_10003DAE4((uint64_t)"-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 98, NSPOSIXErrorDomain, v27, 0, 0, @"rename of %@ to %@ failed: %s", v29, (uint64_t)v16);
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
    unsigned int v8 = [(IXFileManager *)self createDirectoryAtURL:v6 withIntermediateDirectories:0 mode:493 error:&v13];
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
    unsigned int v8 = [(IXFileManager *)self createDirectoryAtURL:v6 withIntermediateDirectories:0 mode:493 error:&v13];
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
  id v9 = a3;
  id v10 = (uint64_t (**)(void))a6;
  id v11 = v9;
  id v12 = (char *)[v11 fileSystemRepresentation];
  v35[0] = v12;
  v35[1] = 0;
  id v13 = fts_open(v35, 84, 0);
  if (!v13)
  {
    unint64_t v24 = *__error();
    id v25 = __error();
    strerror(*v25);
    sub_10003DAE4((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 206, NSPOSIXErrorDomain, v24, 0, 0, @"fts_open failed for %s with error %s", v26, (uint64_t)v12);
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
    id v30 = v17;

    if ((v22 & 1) == 0) {
      goto LABEL_17;
    }
    v17 = v30;
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
  int fts_errno = v16->fts_errno;
  unint64_t v28 = fts_errno;
  strerror(fts_errno);
  sub_10003DAE4((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 218, NSPOSIXErrorDomain, v28, 0, 0, @"Error for path %s: %s", v29, (uint64_t)v12);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  BOOL v23 = 0;
  v17 = v30;
LABEL_18:
  if (fts_close(v14))
  {
    if (!v17)
    {
LABEL_20:
      unint64_t v31 = *__error();
      uint64_t v32 = __error();
      strerror(*v32);
      sub_10003DAE4((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 235, NSPOSIXErrorDomain, v31, 0, 0, @"fts_close failed for %s with error %s", v33, (uint64_t)v12);
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
    id v9 = v8;
    if (v6)
    {
      id v10 = opendir(a3);
      if (v10)
      {
        id v11 = v10;
        int v12 = dirfd(v10);
        if (v12 < 0)
        {
          v49 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_100092118();
          }

          unint64_t v50 = *__error();
          v51 = __error();
          strerror(*v51);
          id v18 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 270, NSPOSIXErrorDomain, v50, 0, 0, @"dirfd of %s failed: %s", v52, (uint64_t)a3);
          uint64_t v19 = 270;
        }
        else
        {
          if (!acl_set_fd(v12, v9))
          {
            unint64_t v27 = 0;
            BOOL v28 = 1;
            goto LABEL_32;
          }
          id v13 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_1000921D8();
          }

          unint64_t v14 = *__error();
          v15 = __error();
          strerror(*v15);
          id v18 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 275, NSPOSIXErrorDomain, v14, 0, 0, @"Failed to set ACL on dir %s: %s", v16, (uint64_t)a3);
          uint64_t v19 = 275;
        }
        unint64_t v27 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", v19, @"IXErrorDomain", 1uLL, v18, 0, @"Failed to remove ACL", v17, v54);

        BOOL v28 = 0;
LABEL_32:
        closedir(v11);
        goto LABEL_33;
      }
      v38 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100092058();
      }

      unint64_t v39 = *__error();
      v40 = __error();
      strerror(*v40);
      v43 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 264, NSPOSIXErrorDomain, v39, 0, 0, @"opendir of %s failed: %s", v41, (uint64_t)a3);
      uint64_t v44 = 264;
    }
    else
    {
      int v29 = open(a3, 2097154);
      if ((v29 & 0x80000000) == 0)
      {
        int v30 = v29;
        int v31 = acl_set_fd(v29, v9);
        BOOL v28 = v31 == 0;
        if (v31)
        {
          uint64_t v32 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_100092358();
          }

          unint64_t v33 = *__error();
          id v34 = __error();
          strerror(*v34);
          stat v36 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 286, NSPOSIXErrorDomain, v33, 0, 0, @"Failed to set ACL on %s: %s", v35, (uint64_t)a3);
          unint64_t v27 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 286, @"IXErrorDomain", 1uLL, v36, 0, @"Failed to remove ACL", v37, v56);
        }
        else
        {
          unint64_t v27 = 0;
        }
        close(v30);
LABEL_33:
        acl_free(v9);
        if (!a5) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }
      v45 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_100092298();
      }

      unint64_t v46 = *__error();
      v47 = __error();
      strerror(*v47);
      v43 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 281, NSPOSIXErrorDomain, v46, 0, 0, @"open of %s failed: %s", v48, (uint64_t)a3);
      uint64_t v44 = 281;
    }
    unint64_t v27 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", v44, @"IXErrorDomain", 1uLL, v43, 0, @"Failed to remove ACL", v42, v57);

    BOOL v28 = 0;
    goto LABEL_33;
  }
  int v20 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_100091F78(NSPOSIXErrorDomain);
  }

  unint64_t v21 = *__error();
  char v22 = __error();
  BOOL v23 = strerror(*v22);
  id v25 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, NSPOSIXErrorDomain, v21, 0, 0, @"acl_init() failed: %s", v24, (uint64_t)v23);
  unint64_t v27 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, @"IXErrorDomain", 1uLL, v25, 0, @"Failed to remove ACL", v26, v55);

  BOOL v28 = 0;
  if (a5)
  {
LABEL_34:
    if (!v28) {
      *a5 = v27;
    }
  }
LABEL_36:

  return v28;
}

- (BOOL)setPermissions:(unsigned __int16)a3 onAllChildrenOfPath:(id)a4 error:(id *)a5
{
  id v12 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003EA50;
  v10[3] = &unk_1000EA378;
  unsigned __int16 v11 = a3;
  BOOL v6 = [(IXFileManager *)self _traverseDirectory:a4 ignoringFTSErrors:0 error:&v12 withBlock:v10];
  id v7 = v12;
  acl_t v8 = v7;
  if (a5 && !v6) {
    *a5 = v7;
  }

  return v6;
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
  id v13 = (const char *)[v12 fileSystemRepresentation];
  acl_t link_np = acl_get_link_np(v13, ACL_TYPE_EXTENDED);
  if (link_np)
  {
    acl_t v15 = link_np;
    id v23 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003ECF8;
    v21[3] = &unk_1000EA398;
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
    sub_10003DAE4((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]", 361, NSPOSIXErrorDomain, 0x5DuLL, 0, 0, @"acl_get_link_np found no ACLs on %s", v18, (uint64_t)v13);
  }
  else {
    sub_10003DAE4((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]", 366, NSPOSIXErrorDomain, v19, 0, 0, @"acl_get_link_np failed for %s", v18, (uint64_t)v13);
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

- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5
{
  return IXUrlsForItemsInDirectoryAtURL(a3, a4, a5);
}

- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (const char *)[v8 fileSystemRepresentation];
  id v10 = v7;
  int v11 = symlink(v9, (const char *)[v10 fileSystemRepresentation]);
  if (v11)
  {
    unint64_t v12 = *__error();
    id v13 = [v8 fileSystemRepresentation];
    [v10 fileSystemRepresentation];
    unint64_t v14 = __error();
    strerror(*v14);
    sub_10003DAE4((uint64_t)"-[IXFileManager createSymbolicLinkAtURL:withDestinationURL:error:]", 418, NSPOSIXErrorDomain, v12, 0, 0, @"Could not create symlink containing %s at %s: %s", v15, (uint64_t)v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v16 = v16;
      *a5 = v16;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v11 == 0;
}

- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  ssize_t v6 = readlink((const char *)[v5 fileSystemRepresentation], v15, 0x400uLL);
  if (v6 < 0)
  {
    unint64_t v10 = *__error();
    id v11 = [v5 fileSystemRepresentation];
    unint64_t v12 = __error();
    strerror(*v12);
    id v9 = sub_10003DAE4((uint64_t)"-[IXFileManager destinationOfSymbolicLinkAtURL:error:]", 438, NSPOSIXErrorDomain, v10, 0, 0, @"Could not readlink %s : %s", v13, (uint64_t)v11);
    id v8 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v15[v6] = 0;
    id v7 = +[NSString stringWithFileSystemRepresentation:v15 length:v6];
    id v8 = +[NSURL fileURLWithPath:v7];

    id v9 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a4 = v9;
  }
LABEL_7:

  return v8;
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
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      ssize_t v6 = __error();
      id v7 = strerror(*v6);
      *(_DWORD *)buf = 136315650;
      id v11 = "-[IXFileManager itemDoesNotExistAtURL:]";
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2080;
      uint64_t v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to determine if %@ exists: %s", buf, 0x20u);
    }

    goto LABEL_7;
  }
  BOOL v4 = 1;
LABEL_8:

  return v4;
}

- (id)debugDescriptionOfItemAtURL:(id)a3
{
  memset(&v10, 0, sizeof(v10));
  if (lstat((const char *)[a3 fileSystemRepresentation], &v10))
  {
    id v3 = __error();
    ssize_t v6 = strerror(*v3);
    +[NSString stringWithFormat:@"<lstat error: %s>", v6, v7, v8, v9, *(void *)&v10.st_dev, v10.st_ino];
  }
  else
  {
    +[NSString stringWithFormat:@"<uid:%u gid:%u mode:0%ho flags:0x%x>", v10.st_uid, v10.st_gid, v10.st_mode, v10.st_flags, *(void *)&v10.st_dev, v10.st_ino];
  BOOL v4 = };

  return v4;
}

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 256);
  int v9 = v8;
  if (v8 < 0)
  {
    unint64_t v13 = *__error();
    id v14 = [v7 fileSystemRepresentation];
    uint64_t v15 = __error();
    strerror(*v15);
    sub_10003DAE4((uint64_t)"-[IXFileManager dataProtectionClassOfItemAtURL:class:error:]", 498, NSPOSIXErrorDomain, v13, 0, 0, @"Failed to open %s : %s", v16, (uint64_t)v14);
  }
  else
  {
    int v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0)
    {
      id v11 = 0;
      *a4 = v10;
      char v12 = 1;
LABEL_9:
      close(v9);
      BOOL v22 = v12;
      goto LABEL_10;
    }
    unint64_t v17 = *__error();
    id v18 = [v7 fileSystemRepresentation];
    unint64_t v19 = __error();
    strerror(*v19);
    sub_10003DAE4((uint64_t)"-[IXFileManager dataProtectionClassOfItemAtURL:class:error:]", 504, NSPOSIXErrorDomain, v17, 0, 0, @"Failed to getclass of file %s: %s", v20, (uint64_t)v18);
  unint64_t v21 = };
  id v11 = v21;
  if (a5) {
    *a5 = v21;
  }
  char v12 = 0;
  BOOL v22 = 0;
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_9;
  }
LABEL_10:

  return v22;
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
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    unint64_t v19 = *__error();
    id v20 = [v11 fileSystemRepresentation];
    unint64_t v21 = __error();
    uint64_t v32 = (uint64_t)v20;
    strerror(*v21);
    id v23 = @"Failed to open %s : %s";
    uint64_t v24 = 530;
  }
  else
  {
    if (!v10)
    {
LABEL_5:
      if (fcntl(v13, 64, v8))
      {
        unint64_t v15 = *__error();
        [v11 fileSystemRepresentation];
        uint64_t v16 = __error();
        strerror(*v16);
        sub_10003DAE4((uint64_t)"-[IXFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", 547, NSPOSIXErrorDomain, v15, 0, 0, @"Failed to setclass(%d) on file %s: %s", v17, v8);
        goto LABEL_11;
      }
LABEL_8:
      id v25 = 0;
      char v26 = 1;
LABEL_14:
      close(v13);
      BOOL v30 = v26;
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
    NSErrorDomain v18 = NSPOSIXErrorDomain;
    unint64_t v19 = *__error();
    id v27 = [v11 fileSystemRepresentation];
    BOOL v28 = __error();
    uint64_t v32 = (uint64_t)v27;
    strerror(*v28);
    id v23 = @"Failed to getclass of file %s: %s";
    uint64_t v24 = 538;
  }
  sub_10003DAE4((uint64_t)"-[IXFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", v24, v18, v19, 0, 0, v23, v22, v32);
  int v29 = LABEL_11:;
  id v25 = v29;
  if (a6) {
    *a6 = v29;
  }
  char v26 = 0;
  BOOL v30 = 0;
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_14;
  }
LABEL_15:

  return v30;
}

- (BOOL)setPermissionsOfItemAtURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = (const char *)[a3 fileSystemRepresentation];
  int v8 = lchmod(v7, a4);
  if (v8)
  {
    unint64_t v9 = *__error();
    int v10 = __error();
    strerror(*v10);
    int v12 = sub_10003DAE4((uint64_t)"-[IXFileManager setPermissionsOfItemAtURL:toMode:error:]", 567, NSPOSIXErrorDomain, v9, 0, 0, @"Failed to lchmod %s to mode 0%o : %s", v11, (uint64_t)v7);
    int v13 = v12;
    if (a5) {
      *a5 = v12;
    }
  }
  return v8 == 0;
}

- (id)_realPathWhatExistsInPath:(id)a3
{
  BOOL v4 = [a3 pathComponents];
  id v5 = (char *)[v4 count];
  ssize_t v6 = v5 - 1;
  if (v5 == (char *)1)
  {
    unint64_t v9 = 0;
  }
  else
  {
    do
    {
      id v7 = objc_msgSend(v4, "subarrayWithRange:", 0, v6 + 1);
      int v8 = +[NSURL fileURLWithPathComponents:v7];
      unint64_t v9 = 0;
      if ([(IXFileManager *)self itemExistsAtURL:v8])
      {
        int v10 = [(IXFileManager *)self _realPathForURL:v8 allowNonExistentPathComponents:0];
        if (v10)
        {
          uint64_t v11 = objc_msgSend(v4, "subarrayWithRange:", v6 + 1, (unsigned char *)objc_msgSend(v4, "count") - (v6 + 1));
          int v12 = +[NSString pathWithComponents:v11];
          int v13 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v15 = [v10 path];
            *(_DWORD *)buf = 136315650;
            uint64_t v17 = "-[IXFileManager _realPathWhatExistsInPath:]";
            __int16 v18 = 2112;
            unint64_t v19 = v15;
            __int16 v20 = 2112;
            unint64_t v21 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s: Realpathed %@ ; appending non-existing components %@",
              buf,
              0x20u);
          }
          unint64_t v9 = [v10 URLByAppendingPathComponent:v12 isDirectory:0];
        }
        else
        {
          unint64_t v9 = 0;
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
  bzero(v24, 0x400uLL);
  id v7 = [a3 path];
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], v24))
  {
    uint64_t v8 = +[NSURL fileURLWithFileSystemRepresentation:v24 isDirectory:0 relativeToURL:0];
LABEL_11:
    uint64_t v14 = (void *)v8;
    goto LABEL_12;
  }
  if (*__error() == 2 && v4)
  {
    uint64_t v8 = [(IXFileManager *)self _realPathWhatExistsInPath:v7];
    goto LABEL_11;
  }
  int v10 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v7 fileSystemRepresentation];
    int v12 = __error();
    int v13 = strerror(*v12);
    int v16 = 136315906;
    uint64_t v17 = "-[IXFileManager _realPathForURL:allowNonExistentPathComponents:]";
    __int16 v18 = 2080;
    id v19 = v11;
    __int16 v20 = 2080;
    unint64_t v21 = v13;
    __int16 v22 = 2080;
    id v23 = v24;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to realpath %s : %s at %s", (uint8_t *)&v16, 0x2Au);
  }

  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
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
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      signed int v13 = a4;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v15 isEqualToString:@".."])
          {
            --v13;
          }
          else if (([v15 isEqualToString:&stru_1000ED390] & 1) == 0 {
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
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
  ssize_t v6 = (char *)a3;
  id v7 = a4;
  bzero(v102, 0x400uLL);
  if (!v6 || !v7)
  {
    id v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315650;
    v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    __int16 v90 = 2112;
    id v91 = v7;
    __int16 v92 = 2112;
    v93 = v6;
    BOOL v28 = "%s: The base path %@ and/or suspicious path %@ were nil";
    int v29 = v23;
    uint32_t v30 = 32;
    goto LABEL_14;
  }
  uint64_t v8 = [v7 path];
  unsigned int v9 = [v8 hasPrefix:@"/private/"];

  if (v9)
  {
    id v10 = [v7 path];
    id v11 = [v10 substringFromIndex:objc_msgSend(@"/private", "length")];
    uint64_t v12 = +[NSURL fileURLWithPath:v11];

    id v7 = (id)v12;
  }
  signed int v13 = [v6 path];
  unsigned int v14 = [v13 hasPrefix:@"/private/"];

  if (v14)
  {
    unint64_t v15 = [v6 path];
    BOOL v16 = [v15 substringFromIndex:objc_msgSend(@"/private", "length")];
    uint64_t v17 = +[NSURL fileURLWithPath:v16];

    ssize_t v6 = (char *)v17;
  }
  __int16 v18 = [v6 path];
  long long v19 = [v7 path];
  unsigned __int8 v20 = [v18 hasPrefix:v19];

  if ((v20 & 1) == 0)
  {
    id v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v6 path];
      int v31 = [v7 path];
      *(_DWORD *)buf = 136315650;
      v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v90 = 2112;
      id v91 = v24;
      __int16 v92 = 2112;
      v93 = v31;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: supiscious path %@ does not contain base path %@ as a prefix", buf, 0x20u);

LABEL_22:
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  long long v21 = [v6 pathComponents];
  unsigned int v22 = [v21 containsObject:@".."];

  if (v22)
  {
    id v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v6 path];
      *(_DWORD *)buf = 136315394;
      v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v90 = 2112;
      id v91 = v24;
      id v25 = "%s: The suspicious path %@ contains '..' paths, which are invalid";
LABEL_11:
      char v26 = v23;
      uint32_t v27 = 22;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_22;
    }
LABEL_23:

    unint64_t v33 = 0;
    id v34 = 0;
LABEL_24:
    uint64_t v35 = 0;
LABEL_25:
    id v36 = 0;
LABEL_26:
    uint64_t v37 = 0;
    goto LABEL_27;
  }
  ssize_t v6 = v6;
  ssize_t v32 = readlink((const char *)[v6 fileSystemRepresentation], v102, 0x400uLL);
  if (v32 < 0)
  {
    if (*__error() == 22 || *__error() == 2)
    {
      id v34 = [v6 path];
      unint64_t v33 = 0;
      goto LABEL_35;
    }
    id v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    unint64_t v50 = __error();
    v51 = strerror(*v50);
    *(_DWORD *)buf = 136315394;
    v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    __int16 v90 = 2080;
    id v91 = v51;
    BOOL v28 = "%s: Readlink failed: %s";
    int v29 = v23;
    uint32_t v30 = 22;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
    goto LABEL_23;
  }
  if (v102[0] == 47)
  {
    id v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v6 path];
      *(_DWORD *)buf = 136315650;
      v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v90 = 2112;
      id v91 = v24;
      __int16 v92 = 2080;
      v93 = v102;
      id v25 = "%s: Rejecting %@ -> %s, as absolute symlinks are not allowed";
      char v26 = v23;
      uint32_t v27 = 32;
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  unsigned int v87 = 0;
  v40 = [v7 path];
  unsigned __int8 v41 = [(IXFileManager *)self _validateSymlink:v40 withStartingDepth:0 andEndingDepth:&v87];

  if ((v41 & 1) == 0)
  {
    id v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    uint64_t v24 = [v7 path];
    *(_DWORD *)buf = 136315394;
    v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    __int16 v90 = 2112;
    id v91 = v24;
    id v25 = "%s: Failed to retrieve depth of %@";
    goto LABEL_11;
  }
  uint64_t v42 = [v6 path];
  v43 = [v7 path];
  uint64_t v44 = objc_msgSend(v42, "substringFromIndex:", objc_msgSend(v43, "length"));

  unint64_t v33 = [v44 stringByDeletingLastPathComponent];

  v45 = +[NSString stringWithFileSystemRepresentation:v102 length:v32];
  id v34 = [v33 stringByAppendingPathComponent:v45];

  if (![(IXFileManager *)self _validateSymlink:v34 withStartingDepth:v87 andEndingDepth:0])
  {
    uint64_t v48 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [v6 path];
      uint64_t v54 = [v7 path];
      *(_DWORD *)buf = 136315906;
      v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v90 = 2112;
      id v91 = v49;
      __int16 v92 = 2112;
      v93 = v34;
      __int16 v94 = 2112;
      v95 = v54;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ -> %@, as it is points outside or to the base %@", buf, 0x2Au);

      goto LABEL_50;
    }
LABEL_51:

    goto LABEL_24;
  }
LABEL_35:
  uint64_t v46 = [(IXFileManager *)self _realPathForURL:v7 allowNonExistentPathComponents:0];
  if (!v46)
  {
    uint64_t v48 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [v7 path];
      *(_DWORD *)buf = 136315394;
      v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v90 = 2112;
      id v91 = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s: Failed to retrieve realpath for base path %@ ", buf, 0x16u);
LABEL_50:

      goto LABEL_51;
    }
    goto LABEL_51;
  }
  uint64_t v35 = (void *)v46;
  v47 = [(IXFileManager *)self _realPathForURL:v6 allowNonExistentPathComponents:1];
  if (!v47)
  {
    uint64_t v52 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = [v6 path];
      *(_DWORD *)buf = 136315394;
      v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v90 = 2112;
      id v91 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s: Failed to retrieve realpath for suspicious path %@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  id v36 = v47;
  if (v32 < 0)
  {
    uint64_t v55 = [v47 pathComponents];
    v85 = [v35 pathComponents];
    uint64_t v56 = (char *)[v85 count];
    v86 = v55;
    uint64_t v57 = (char *)[v55 count];
    if ((unint64_t)v57 < 2 || (unint64_t)v56 <= 1)
    {
      v63 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        [v6 path];
        v68 = loga = v63;
        v69 = [v7 path];
        v70 = [v36 path];
        v71 = [v35 path];
        *(_DWORD *)buf = 136316162;
        v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
        __int16 v90 = 2112;
        id v91 = v68;
        __int16 v92 = 2112;
        v93 = v69;
        __int16 v94 = 2112;
        v95 = v70;
        __int16 v96 = 2112;
        uint64_t v97 = (uint64_t)v71;
        _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ because real component counts don't make sense (reals %@ ; %@)",
          buf,
          0x34u);

        v63 = loga;
      }
    }
    else
    {
      v58 = v57;
      unint64_t v59 = 1;
      v60 = [v85 objectAtIndexedSubscript:1];
      if ([v60 isEqualToString:@"private"]) {
        unint64_t v59 = 2;
      }

      [v86 objectAtIndexedSubscript:1];
      v61 = v80 = v56;
      if ([v61 isEqualToString:@"private"]) {
        uint64_t v62 = 2;
      }
      else {
        uint64_t v62 = 1;
      }

      if (&v80[-v59] <= &v58[-v62])
      {
        if ((unint64_t)v80 <= v59)
        {
LABEL_67:

          goto LABEL_38;
        }
        while (1)
        {
          v72 = [v85 objectAtIndexedSubscript:v59];
          v73 = [v86 objectAtIndexedSubscript:v62];
          unsigned __int8 logb = [v72 isEqualToString:v73];

          if ((logb & 1) == 0) {
            break;
          }
          ++v59;
          ++v62;
          if (v80 == (char *)v59) {
            goto LABEL_67;
          }
        }
        v63 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t logc = [v6 path];
          v79 = [v7 path];
          v78 = [v36 path];
          v77 = [v35 path];
          v74 = [v85 objectAtIndexedSubscript:v59];
          uint64_t v75 = [v86 objectAtIndexedSubscript:v62];
          *(_DWORD *)buf = 136316674;
          v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
          __int16 v90 = 2112;
          id v91 = logc;
          __int16 v92 = 2112;
          v93 = v79;
          __int16 v94 = 2112;
          v95 = v78;
          __int16 v96 = 2112;
          uint64_t v97 = (uint64_t)v77;
          __int16 v98 = 2112;
          v99 = v74;
          __int16 v100 = 2112;
          uint64_t v101 = v75;
          v76 = (void *)v75;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ (reals %@ ; %@) because components diverge at %@ != %@",
            buf,
            0x48u);
        }
      }
      else
      {
        v63 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t log = [v6 path];
          v64 = [v7 path];
          v65 = [v36 path];
          uint64_t v66 = [v35 path];
          *(_DWORD *)buf = 136316162;
          v89 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
          __int16 v90 = 2112;
          id v91 = log;
          __int16 v92 = 2112;
          v93 = v64;
          __int16 v94 = 2112;
          v95 = v65;
          __int16 v96 = 2112;
          uint64_t v97 = v66;
          v67 = (void *)v66;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ because base component count is greater than child component count (reals %@ ; %@)",
            buf,
            0x34u);
        }
      }
    }

    goto LABEL_26;
  }
LABEL_38:
  id v36 = v36;
  uint64_t v37 = v36;
LABEL_27:
  id v38 = v37;

  return v38;
}

- (unint64_t)_diskUsageForDirectoryURL:(id)a3
{
  id v3 = (char *)a3;
  BOOL v4 = +[NSMutableSet setWithCapacity:0];
  id v5 = +[NSMutableArray arrayWithCapacity:1];
  int v58 = 0;
  int v60 = 0;
  unint64_t v57 = 0xA200000900000005;
  uint64_t v59 = 0x500000002;
  ssize_t v6 = (int *)malloc_type_malloc(0x8000uLL, 0xD1AD82F4uLL);
  v49 = v3;
  uint64_t v7 = [v3 path];
  uint64_t v48 = (void *)v7;
  if (v7)
  {
    [v5 addObject:v7];
  }
  else
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
      __int16 v63 = 2112;
      v64 = v49;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get path to url %@", buf, 0x16u);
    }
  }
  if ([v5 count])
  {
    unint64_t v55 = 0;
    v53 = v4;
    unint64_t v50 = v6;
    while (1)
    {
      id v10 = [v5 objectAtIndex:0];
      [v5 removeObjectAtIndex:0];
      id v56 = v10;
      int v11 = open((const char *)[v56 fileSystemRepresentation], 1048832);
      if (v11 < 0)
      {
        unsigned __int8 v41 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v42 = __error();
          v43 = strerror(*v42);
          *(_DWORD *)buf = 136315650;
          uint64_t v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
          __int16 v63 = 2112;
          v64 = (char *)v56;
          __int16 v65 = 2080;
          uint64_t v66 = v43;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: Failed to open directory %@ : %s", buf, 0x20u);
        }
      }
      else
      {
        int v52 = v11;
        v51 = v9;
        uint64_t v12 = 0;
LABEL_10:
        ssize_t v6 = v50;
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
                  id v25 = sub_100004B28((uint64_t)off_100109BB8);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    char v26 = __error();
                    uint32_t v27 = strerror(*v26);
                    *(_DWORD *)buf = 136315906;
                    uint64_t v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2080;
                    v64 = v27;
                    __int16 v65 = 2048;
                    uint64_t v66 = v12;
                    __int16 v67 = 2112;
                    v68 = (char *)v56;
                    BOOL v28 = v25;
                    int v29 = "%s: Got error %s while processing entry %llu in %@";
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
                  unsigned __int8 v20 = 0;
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
              unsigned __int8 v20 = (char *)v18 + *v18;
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
                  id v25 = sub_100004B28((uint64_t)off_100109BB8);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2112;
                    v64 = (char *)v56;
                    __int16 v65 = 2080;
                    uint64_t v66 = v20;
                    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s: skipping empty directory at %@/%s", buf, 0x20u);
                  }
                  goto LABEL_55;
                }
                if (!v20)
                {
                  id v25 = sub_100004B28((uint64_t)off_100109BB8);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2048;
                    v64 = v12;
                    __int16 v65 = 2112;
                    uint64_t v66 = (char *)v56;
                    BOOL v28 = v25;
                    int v29 = "%s: Failed to get name for directory item %llu in %@; not counting its children";
                    uint32_t v30 = 32;
LABEL_45:
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
                  }
                  goto LABEL_55;
                }
                ssize_t v32 = +[NSString stringWithFileSystemRepresentation:v20 length:(v19 - 1)];
                unint64_t v33 = [v56 stringByAppendingPathComponent:v32];

                if (v33)
                {
                  [v5 addObject:v33];
                }
                else
                {
                  v40 = sub_100004B28((uint64_t)off_100109BB8);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2080;
                    v64 = v20;
                    __int16 v65 = 2112;
                    uint64_t v66 = (char *)v56;
                    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s: Failed to create path to child directory by appending \"%s\" to %@", buf, 0x20u);
                  }
                }
                unint64_t v39 = v31;
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
                uint64_t v37 = +[NSNumber numberWithUnsignedLongLong:v23];
                if ([v53 containsObject:v37])
                {
                  id v38 = sub_100004B28((uint64_t)off_100109BB8);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v63 = 2112;
                    v64 = (char *)v56;
                    __int16 v65 = 2080;
                    uint64_t v66 = v20;
                    _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%s: Skipping hardlinked file at %@/%s", buf, 0x20u);
                  }
                }
                else
                {
                  v55 += v35;
                  [v53 addObject:v37];
                }

                unint64_t v39 = v54;
LABEL_52:
                goto LABEL_56;
              }
              v55 += v35;
LABEL_56:
              ssize_t v6 = (int *)((char *)v6 + v16);
              ++v12;
              if (!--v14) {
                goto LABEL_10;
              }
            }
          }
        }
        uint64_t v44 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = __error();
          uint64_t v46 = strerror(*v45);
          *(_DWORD *)buf = 136315906;
          uint64_t v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
          __int16 v63 = 2048;
          v64 = v12;
          __int16 v65 = 2112;
          uint64_t v66 = (char *)v56;
          __int16 v67 = 2080;
          v68 = v46;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s: getattrlistbulk on entry %llu in %@ returned error %s", buf, 0x2Au);
        }

LABEL_64:
        close(v52);
        BOOL v4 = v53;
        unsigned int v9 = v51;
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
  memset(&v11, 0, sizeof(v11));
  id v4 = a3;
  if (lstat((const char *)objc_msgSend(v4, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v11))
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 fileSystemRepresentation];
      uint64_t v7 = __error();
      uint64_t v8 = strerror(*v7);
      *(_DWORD *)buf = 136315650;
      int v13 = "-[IXFileManager diskUsageForURL:]";
      __int16 v14 = 2080;
      id v15 = v6;
      __int16 v16 = 2080;
      unsigned int v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to stat %s : %s", buf, 0x20u);
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

@end