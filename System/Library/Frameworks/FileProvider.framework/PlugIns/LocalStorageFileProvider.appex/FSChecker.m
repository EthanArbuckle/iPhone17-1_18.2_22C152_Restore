@interface FSChecker
- (BOOL)isDataProtectedFileAtPath:(id)a3 handle:(fpfs_item_handle *)a4;
- (BOOL)itemIsInsideAPackage;
- (BOOL)itemIsInsideAPinnedFolder;
- (BOOL)itemIsInsideAnIgnoredFolder;
- (void)enumerateItemsOnDiskAtURL:(id)a3 detachedRoots:(id)a4 usingFPFS:(BOOL)a5 ioContext:(id *)a6 delegate:(id)a7;
- (void)setItemIsInsideAPackage:(BOOL)a3;
- (void)setItemIsInsideAPinnedFolder:(BOOL)a3;
- (void)setItemIsInsideAnIgnoredFolder:(BOOL)a3;
@end

@implementation FSChecker

- (BOOL)isDataProtectedFileAtPath:(id)a3 handle:(fpfs_item_handle *)a4
{
  uint64_t v9 = 0;
  long long v8 = xmmword_100975B30;
  memset(v7, 0, 40);
  if (getattrlist((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0), &v8, v7, 0x28uLL, 0x21u) < 0)
  {
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100968DE4(v6);
    }
  }
  else if (DWORD2(v7[0]) == 1 && (DWORD1(v7[2]) - 3) >= 0xFFFFFFFE)
  {
    a4->var5 = DWORD1(v7[0]);
    *(_OWORD *)&a4->var0 = *(_OWORD *)((char *)&v7[1] + 4);
    *(int32x2_t *)&a4->var2 = vrev64_s32(*(int32x2_t *)((char *)v7 + 12));
    a4->var4 = 0;
    return 1;
  }
  return 0;
}

- (void)enumerateItemsOnDiskAtURL:(id)a3 detachedRoots:(id)a4 usingFPFS:(BOOL)a5 ioContext:(id *)a6 delegate:(id)a7
{
  v42 = a6;
  BOOL v41 = a5;
  v45 = self;
  id v9 = a3;
  id v10 = a4;
  id v44 = a7;
  id v11 = [v10 count];
  v39[1] = v39;
  v12 = (void *)((char *)v39 - ((8 * (void)v11 + 31) & 0xFFFFFFFFFFFFFFF0));
  bzero(v12, 8 * (void)v11 + 16);
  id v43 = v9;
  id v13 = [v43 fileSystemRepresentation];
  v40 = (char *const *)v12;
  void *v12 = v13;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v15)
  {
    v16 = 0;
    uint64_t v17 = *(void *)v69;
    *(void *)&long long v46 = v40 + 1;
    do
    {
      v18 = 0;
      uint64_t v19 = (int)v16;
      uint64_t v20 = (uint64_t)&_mh_execute_header + ((void)v16 << 32);
      uint64_t v21 = v46 + 8 * (int)v16;
      do
      {
        if (*(void *)v69 != v17) {
          objc_enumerationMutation(v14);
        }
        id v22 = [*(id *)(*((void *)&v68 + 1) + 8 * (void)v18) physicalLocation];
        *(void *)(v21 + 8 * (void)v18) = [v22 fileSystemRepresentation];

        v18 = (char *)v18 + 1;
        v20 += (uint64_t)&_mh_execute_header;
      }
      while (v15 != v18);
      id v15 = [v14 countByEnumeratingWithState:&v68 objects:v80 count:16];
      v16 = (char *)v18 + v19;
    }
    while (v15);
    uint64_t v23 = v20 >> 32;
  }
  else
  {
    uint64_t v23 = 1;
  }

  v24 = v40;
  v40[v23] = 0;
  v25 = v45;
  *(_WORD *)&v45->_itemIsInsideAPackage = 0;
  v25->_itemIsInsideAnIgnoredFolder = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = sub_100084064;
  v66[4] = sub_100084074;
  id v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = sub_100084064;
  v64[4] = sub_100084074;
  id v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_100084064;
  v62[4] = sub_100084074;
  id v63 = 0;
  v26 = fts_open(v24, 16, 0);
  if (v26)
  {
    v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:10];
    *(void *)&long long v28 = 138543874;
    long long v46 = v28;
    while (1)
    {
      v29 = fts_read(v26);
      if (!v29)
      {
LABEL_28:
        fts_close(v26);
        goto LABEL_31;
      }
      v30 = +[NSString stringWithUTF8String:v29->fts_path];
      uint64_t v79 = 0;
      memset(v78, 0, sizeof(v78));
      if (v29->fts_info == 8 && errorInjectionPointEnabled())
      {
        *__error() = 1;
      }
      else
      {
        v47 = _NSConcreteStackBlock;
        uint64_t v48 = 3221225472;
        v49 = sub_10008407C;
        v50 = &unk_100A698A0;
        v59 = v29;
        v60 = v42;
        v51 = v45;
        v56 = v64;
        BOOL v61 = v41;
        id v52 = v14;
        id v53 = v43;
        id v54 = v44;
        v55 = v27;
        v57 = v66;
        v58 = v62;
        int v32 = fpfs_open();

        if (!v32) {
          goto LABEL_26;
        }
      }
      if (*__error() != 4)
      {
        if (*__error() != 1
          || ![(FSChecker *)v45 isDataProtectedFileAtPath:v30 handle:v78])
        {
          v34 = fp_current_or_default_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = objc_msgSend(v30, "fp_obfuscatedPath");
            ino_t fts_ino = v29->fts_ino;
            int v37 = *__error();
            int v72 = v46;
            v73 = v35;
            __int16 v74 = 2048;
            ino_t v75 = fts_ino;
            __int16 v76 = 1024;
            int v77 = v37;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] FPCK checking %{public}@ (fileID=%llu) failed with %{errno}d", (uint8_t *)&v72, 0x1Cu);
          }
LABEL_26:
          char v33 = 1;
          goto LABEL_27;
        }
        if ([v44 checker:v45 handleLockedItemAtPath:v30 handle:v78]) {
          goto LABEL_26;
        }
      }
      char v33 = 0;
LABEL_27:

      if ((v33 & 1) == 0) {
        goto LABEL_28;
      }
    }
  }
  v27 = fp_current_or_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v38 = __error();
    sub_100968E78(v38, v78, v27);
  }
LABEL_31:

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
}

- (BOOL)itemIsInsideAPackage
{
  return self->_itemIsInsideAPackage;
}

- (void)setItemIsInsideAPackage:(BOOL)a3
{
  self->_itemIsInsideAPackage = a3;
}

- (BOOL)itemIsInsideAPinnedFolder
{
  return self->_itemIsInsideAPinnedFolder;
}

- (void)setItemIsInsideAPinnedFolder:(BOOL)a3
{
  self->_itemIsInsideAPinnedFolder = a3;
}

- (BOOL)itemIsInsideAnIgnoredFolder
{
  return self->_itemIsInsideAnIgnoredFolder;
}

- (void)setItemIsInsideAnIgnoredFolder:(BOOL)a3
{
  self->_itemIsInsideAnIgnoredFolder = a3;
}

@end