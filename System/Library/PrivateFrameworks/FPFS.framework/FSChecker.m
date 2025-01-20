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
  long long v8 = xmmword_24DCCEAE8;
  memset(v7, 0, 40);
  if (getattrlist((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0), &v8, v7, 0x28uLL, 0x21u) < 0)
  {
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FSChecker isDataProtectedFileAtPath:handle:](v6);
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
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v44 = a7;
  uint64_t v11 = [v10 count];
  v39[1] = v39;
  v12 = (void *)((char *)v39 - ((8 * v11 + 31) & 0xFFFFFFFFFFFFFFF0));
  bzero(v12, 8 * v11 + 16);
  id v43 = v9;
  uint64_t v13 = [v43 fileSystemRepresentation];
  v40 = (char *const *)v12;
  uint64_t *v12 = v13;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v69;
    *(void *)&long long v46 = v40 + 1;
    do
    {
      uint64_t v18 = 0;
      uint64_t v19 = (int)v16;
      uint64_t v20 = (v16 << 32) + 0x100000000;
      uint64_t v21 = v46 + 8 * (int)v16;
      do
      {
        if (*(void *)v69 != v17) {
          objc_enumerationMutation(v14);
        }
        id v22 = [*(id *)(*((void *)&v68 + 1) + 8 * v18) physicalLocation];
        *(void *)(v21 + 8 * v18) = [v22 fileSystemRepresentation];

        ++v18;
        v20 += 0x100000000;
      }
      while (v15 != v18);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v68 objects:v80 count:16];
      uint64_t v16 = v19 + v18;
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
  v66[3] = __Block_byref_object_copy_;
  v66[4] = __Block_byref_object_dispose_;
  id v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy_;
  v64[4] = __Block_byref_object_dispose_;
  id v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy_;
  v62[4] = __Block_byref_object_dispose_;
  id v63 = 0;
  v26 = fts_open(v24, 16, 0);
  if (v26)
  {
    v27 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
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
      v30 = [NSString stringWithUTF8String:v29->fts_path];
      uint64_t v79 = 0;
      memset(v78, 0, sizeof(v78));
      v31 = (void *)MEMORY[0x25332A4D0]();
      if (v29->fts_info == 8 && errorInjectionPointEnabled())
      {
        *__error() = 1;
      }
      else
      {
        uint64_t v47 = MEMORY[0x263EF8330];
        uint64_t v48 = 3221225472;
        v49 = __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke;
        v50 = &unk_265307068;
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
            _os_log_impl(&dword_24D3D0000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] FPCK checking %{public}@ (fileID=%llu) failed with %{errno}d", (uint8_t *)&v72, 0x1Cu);
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
    -[FSChecker enumerateItemsOnDiskAtURL:detachedRoots:usingFPFS:ioContext:delegate:](v38, v78, v27);
  }
LABEL_31:

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
}

uint64_t __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int16 *)(*(void *)(a1 + 96) + 88);
  if (v2 == 6)
  {
    [*(id *)(a1 + 64) removeLastObject];
    v3 = *(unsigned char **)(a1 + 32);
    if (v3[8])
    {
      v4 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      v5 = [NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 96) + 48)];
      LODWORD(v4) = [v4 isEqualToString:v5];

      v3 = *(unsigned char **)(a1 + 32);
      if (v4)
      {
        v3[8] = 0;
        v3 = *(unsigned char **)(a1 + 32);
      }
    }
    if (v3[9])
    {
      v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      v7 = [NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 96) + 48)];
      LODWORD(v6) = [v6 isEqualToString:v7];

      v3 = *(unsigned char **)(a1 + 32);
      if (v6)
      {
        v3[9] = 0;
        v3 = *(unsigned char **)(a1 + 32);
      }
    }
    if (v3[10])
    {
      long long v8 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      id v9 = [NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 96) + 48)];
      LODWORD(v8) = [v8 isEqualToString:v9];

      if (v8) {
        *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
      }
    }
  }
  else
  {
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0;
    uint64_t v31 = 0;
    int v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 64);
    int v10 = fpfs_fgetfileattrs();
    if ((v10 & 0x80000000) == 0)
    {
      if (*((unsigned char *)v32 + 24))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        if (!*(unsigned char *)(v11 + 8))
        {
          *(unsigned char *)(v11 + 8) = 1;
          uint64_t v12 = [NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 96) + 48)];
          uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
          id v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;
        }
      }
      if (v2 == 1)
      {
        if (*((unsigned char *)v28 + 24))
        {
          *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
          uint64_t v15 = [NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 96) + 48)];
          uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8);
          uint64_t v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;
        }
        uint64_t v18 = *(void **)(a1 + 64);
        uint64_t v19 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 96) + 72)];
        [v18 addObject:v19];
      }
    }

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v35, 8);
    if (v10 < 0) {
      return 0xFFFFFFFFLL;
    }
  }
  return 0;
}

uint64_t __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (*(_DWORD *)(a2 + 44) & 0x200) != 0;
  char v4 = *(unsigned char *)(a1 + 132);
  if (v4)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      char v4 = 0;
    }
    else {
      char v4 = *(unsigned char *)(a2 + 45) & 1;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(_DWORD *)(a2 + 40) == 3;
  if (*(unsigned char *)(a1 + 132))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v5 + 9) && (*(unsigned char *)(a2 + 44) & 0x80) != 0)
    {
      *(unsigned char *)(v5 + 9) = 1;
      uint64_t v6 = [NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 112) + 48)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 96) + 8);
      long long v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
  long long v44 = 0u;
  *(_OWORD *)&v43[1] = 0u;
  v38[0] = *(unsigned char *)(a1 + 133);
  uint64_t v9 = *(void *)(a1 + 32);
  v38[1] = *(unsigned char *)(v9 + 8);
  __int16 v39 = *(_WORD *)(v9 + 9);
  uint64_t v10 = *(void *)(a1 + 80);
  char v40 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  char v41 = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  char v42 = *(unsigned char *)(*(void *)(v10 + 8) + 24);
  *(_WORD *)id v43 = 0;
  v43[2] = 0;
  *(void *)&v43[9] = a2;
  uint64_t v11 = *(void *)(a1 + 112);
  DWORD2(v44) = *(_DWORD *)(*(void *)(a1 + 120) + 8);
  uint64_t v12 = [NSString stringWithUTF8String:v11 + 104];
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v14 = *(void *)(v13 + 96);
  if (v14) {
    BOOL v15 = (*(unsigned char *)(v14 + 116) & 0x40) == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!*(_DWORD *)(a2 + 256)) {
    BOOL v15 = 0;
  }
  v43[3] = v15;
  *(void *)&long long v44 = v14;
  if ((*(_DWORD *)(a2 + 40) & 0xFFFFFFFE) == 2 && (*(unsigned char *)(a2 + 45) & 0x40) != 0)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
LABEL_18:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v34 + 1) + 8 * v20);
        if ([v21 inode] == *(void *)(v14 + 8)) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v18) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }
      id v22 = v21;
      v43[0] = 1;

      if (v22) {
        goto LABEL_32;
      }
    }
    else
    {
LABEL_24:
    }
    id v23 = NSURL;
    id v24 = [NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 112) + 48)];
    v25 = [v23 fileURLWithPath:v24 isDirectory:1];

    char v26 = [_TtC9libfssync16FPCKDetachedRoot alloc];
    uint64_t v27 = *(void *)(a1 + 48);
    id v33 = 0;
    id v22 = [(FPCKDetachedRoot *)v26 initWithPhysicalLocation:v25 rootURL:v27 error:&v33];
    id v28 = v33;
    if (v22)
    {
      v43[2] = [(FPCKDetachedRoot *)v22 shouldRefreshBookmark];
      uint64_t v29 = [(FPCKDetachedRoot *)v22 logicalLocation];
      v43[1] = v29 == 0;
    }
    else
    {
      char v30 = fp_current_or_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke_2_cold_1(v25, v28, v30);
      }

      v43[1] = 1;
    }

LABEL_32:
    uint64_t v13 = *(void *)(a1 + 112);
  }
  if ((checkInvariants(v13, *(unsigned int *)(a1 + 128), *(void *)(*(void *)(a1 + 104) + 8) + 24, (uint64_t)v38) & 0x80000000) != 0) {
    goto LABEL_37;
  }
  if (([*(id *)(a1 + 56) checker:*(void *)(a1 + 32) handleItem:*(unsigned int *)(a1 + 128) itemStatus:v38 under:*(void *)(a1 + 64) brokenInvariants:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)] & 1) == 0)
  {
    *__error() = 4;
LABEL_37:
    uint64_t v31 = 0xFFFFFFFFLL;
    goto LABEL_38;
  }
  uint64_t v31 = 0;
LABEL_38:

  return v31;
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

- (void)isDataProtectedFileAtPath:(NSObject *)a1 handle:.cold.1(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = __error();
  v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_24D3D0000, a1, OS_LOG_TYPE_ERROR, "[ERROR] Unable to getattrlist: %s", (uint8_t *)&v4, 0xCu);
}

- (void)enumerateItemsOnDiskAtURL:(os_log_t)log detachedRoots:usingFPFS:ioContext:delegate:.cold.1(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_24D3D0000, log, OS_LOG_TYPE_ERROR, "[ERROR] Couldn't open stream: %{errno}d", buf, 8u);
}

void __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke_2_cold_1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(a1, "fp_shortDescription");
  uint64_t v6 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  long long v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_24D3D0000, a3, OS_LOG_TYPE_ERROR, "[ERROR] cannot build descriptor for detached item %@: %@", (uint8_t *)&v7, 0x16u);
}

@end