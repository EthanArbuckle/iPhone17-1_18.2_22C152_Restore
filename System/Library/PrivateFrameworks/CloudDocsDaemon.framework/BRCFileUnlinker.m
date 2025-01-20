@interface BRCFileUnlinker
- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4;
- (BOOL)renameAndUnlinkInBackgroundItemAtPath:(id)a3;
- (BRCFileUnlinker)initWithCacheDirPath:(id)a3;
- (void)_purge;
- (void)dealloc;
- (void)forcePurgeWithCompletionBlock:(id)a3;
- (void)resume;
- (void)suspend;
@end

@implementation BRCFileUnlinker

- (BRCFileUnlinker)initWithCacheDirPath:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BRCFileUnlinker;
  v5 = [(BRCFileUnlinker *)&v27 init];
  v6 = v5;
  if (v5)
  {
    atomic_store(1u, (unsigned int *)&v5->_suspendCount);
    uint64_t v7 = [v4 stringByAppendingPathComponent:@"unlink"];
    unlinkRootPath = v6->_unlinkRootPath;
    v6->_unlinkRootPath = (NSString *)v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.bird.file-unlinker", v10);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)v6->_queue);
    cachePurgeSource = v6->_cachePurgeSource;
    v6->_cachePurgeSource = (OS_dispatch_source *)v13;

    objc_initWeak(&location, v6);
    v15 = v6->_cachePurgeSource;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __40__BRCFileUnlinker_initWithCacheDirPath___block_invoke;
    v24[3] = &unk_1E6993C50;
    objc_copyWeak(&v25, &location);
    v16 = v15;
    v17 = v24;
    v18 = v16;
    v19 = v17;
    v20 = v19;
    v21 = v19;
    if (*MEMORY[0x1E4F59658])
    {
      v21 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v19);
    }
    dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v21);
    dispatch_source_set_event_handler(v18, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __40__BRCFileUnlinker_initWithCacheDirPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)os_transaction_create();
    [WeakRetained _purge];
    id v2 = self;
  }
}

- (void)dealloc
{
  [(BRCFileUnlinker *)self suspend];
  v3 = self;
  objc_sync_enter(v3);
  cachePurgeSource = v3->_cachePurgeSource;
  if (cachePurgeSource)
  {
    dispatch_resume(cachePurgeSource);
    v5 = v3->_cachePurgeSource;
    v3->_cachePurgeSource = 0;
  }
  objc_sync_exit(v3);

  v6.receiver = v3;
  v6.super_class = (Class)BRCFileUnlinker;
  [(BRCFileUnlinker *)&v6 dealloc];
}

- (void)resume
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: suspendCount >= 0%@", (uint8_t *)&v2, 0xCu);
}

- (void)suspend
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a1 + 1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] suspending - suspendCount:%d->%d%@", (uint8_t *)v3, 0x18u);
}

- (BOOL)renameAndUnlinkInBackgroundItemAtPath:(id)a3
{
  return [(BRCFileUnlinker *)self renameAndUnlinkInBackgroundItemAt:0xFFFFFFFFLL path:a3];
}

- (void)_purge
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] removed '%@/*'%@", (uint8_t *)&v3, 0x16u);
}

- (void)forcePurgeWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__BRCFileUnlinker_forcePurgeWithCompletionBlock___block_invoke;
  v8[3] = &unk_1E6994600;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(queue, v7);
}

uint64_t __49__BRCFileUnlinker_forcePurgeWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _purge];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  memset(&v46, 0, sizeof(v46));
  id v6 = a4;
  if ((fstatat(a3, (const char *)[v6 fileSystemRepresentation], &v46, 32) & 0x80000000) == 0)
  {
    dispatch_block_t v7 = self->_unlinkRootPath;
    if ((BRCMkdirAt(-1, v7, 511) & 0x80000000) != 0 && *__error() != 17)
    {
      uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
    }
    id v9 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", *(void *)&v46.st_dev);
    v10 = [v9 UUIDString];
    dispatch_queue_t v11 = [(NSString *)v7 stringByAppendingPathComponent:v10];

    if ((BRCRenameAt(a3, v6, -1, v11, 0) & 0x80000000) == 0)
    {
      v12 = brc_bread_crumbs();
      dispatch_source_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v26 = aPcDBLSW[(unint64_t)v46.st_mode >> 12];
        if ((v46.st_mode & 0x100) != 0) {
          int v27 = 114;
        }
        else {
          int v27 = 45;
        }
        if ((v46.st_mode & 0x80) != 0) {
          int v28 = 119;
        }
        else {
          int v28 = 45;
        }
        if ((v46.st_mode & 0x40) != 0) {
          int v29 = 120;
        }
        else {
          int v29 = 45;
        }
        if ((v46.st_mode & 0x20) != 0) {
          int v30 = 114;
        }
        else {
          int v30 = 45;
        }
        if ((v46.st_mode & 0x10) != 0) {
          int v31 = 119;
        }
        else {
          int v31 = 45;
        }
        if ((v46.st_mode & 8) != 0) {
          int v32 = 120;
        }
        else {
          int v32 = 45;
        }
        if ((v46.st_mode & 4) != 0) {
          int v33 = 114;
        }
        else {
          int v33 = 45;
        }
        if ((v46.st_mode & 2) != 0) {
          int v34 = 119;
        }
        else {
          int v34 = 45;
        }
        if (v46.st_mode) {
          int v35 = 120;
        }
        else {
          int v35 = 45;
        }
        *(_DWORD *)buf = 138417922;
        *(void *)v48 = v6;
        *(_WORD *)&v48[8] = 2112;
        *(void *)&v48[10] = v11;
        *(_WORD *)&v48[18] = 1024;
        *(_DWORD *)&v48[20] = v46.st_dev;
        __int16 v49 = 2048;
        *(void *)v50 = v46.st_ino;
        *(_WORD *)&v50[8] = 1024;
        *(_DWORD *)&v50[10] = v26;
        __int16 v51 = 1024;
        int v52 = v27;
        __int16 v53 = 1024;
        int v54 = v28;
        __int16 v55 = 1024;
        int v56 = v29;
        __int16 v57 = 1024;
        int v58 = v30;
        __int16 v59 = 1024;
        int v60 = v31;
        __int16 v61 = 1024;
        int v62 = v32;
        __int16 v63 = 1024;
        int v64 = v33;
        __int16 v65 = 1024;
        int v66 = v34;
        __int16 v67 = 1024;
        int v68 = v35;
        __int16 v69 = 1024;
        int st_nlink = v46.st_nlink;
        __int16 v71 = 1024;
        uid_t st_uid = v46.st_uid;
        __int16 v73 = 1024;
        gid_t st_gid = v46.st_gid;
        __int16 v75 = 2048;
        *(void *)v76 = v46.st_atimespec.tv_sec;
        *(_WORD *)&v76[8] = 2048;
        *(void *)&v76[10] = v46.st_mtimespec.tv_sec;
        *(_WORD *)&v76[18] = 2048;
        *(void *)&v76[20] = v46.st_ctimespec.tv_sec;
        *(_WORD *)&v76[28] = 2048;
        *(void *)&v76[30] = v46.st_size;
        *(_WORD *)&v76[38] = 1024;
        *(_DWORD *)&v76[40] = v46.st_flags;
        __int16 v77 = 2112;
        *(void *)v78 = v12;
        _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed '%@' to '%@' deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xACu);
      }

      id v14 = v11;
      if (chflags((const char *)[v14 fileSystemRepresentation], 0) < 0)
      {
        v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAt:path:]((uint64_t)v14, (uint64_t)v15, v16);
        }
      }
      cachePurgeSource = self->_cachePurgeSource;
      BOOL v18 = 1;
      dispatch_source_merge_data(cachePurgeSource, 1uLL);

      goto LABEL_19;
    }
    int v22 = *__error();
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
    {
      int v36 = aPcDBLSW[(unint64_t)v46.st_mode >> 12];
      if ((v46.st_mode & 0x100) != 0) {
        int v37 = 114;
      }
      else {
        int v37 = 45;
      }
      if ((v46.st_mode & 0x80) != 0) {
        int v38 = 119;
      }
      else {
        int v38 = 45;
      }
      if ((v46.st_mode & 0x40) != 0) {
        int v39 = 120;
      }
      else {
        int v39 = 45;
      }
      if ((v46.st_mode & 0x20) != 0) {
        int v40 = 114;
      }
      else {
        int v40 = 45;
      }
      if ((v46.st_mode & 0x10) != 0) {
        int v41 = 119;
      }
      else {
        int v41 = 45;
      }
      if ((v46.st_mode & 8) != 0) {
        int v42 = 120;
      }
      else {
        int v42 = 45;
      }
      if ((v46.st_mode & 4) != 0) {
        int v43 = 114;
      }
      else {
        int v43 = 45;
      }
      if ((v46.st_mode & 2) != 0) {
        int v44 = 119;
      }
      else {
        int v44 = 45;
      }
      if (v46.st_mode) {
        int v45 = 120;
      }
      else {
        int v45 = 45;
      }
      *(_DWORD *)buf = 67115266;
      *(_DWORD *)v48 = a3;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v6;
      *(_WORD *)&v48[14] = 2112;
      *(void *)&v48[16] = v11;
      __int16 v49 = 1024;
      *(_DWORD *)v50 = v46.st_dev;
      *(_WORD *)&v50[4] = 2048;
      *(void *)&v50[6] = v46.st_ino;
      __int16 v51 = 1024;
      int v52 = v36;
      __int16 v53 = 1024;
      int v54 = v37;
      __int16 v55 = 1024;
      int v56 = v38;
      __int16 v57 = 1024;
      int v58 = v39;
      __int16 v59 = 1024;
      int v60 = v40;
      __int16 v61 = 1024;
      int v62 = v41;
      __int16 v63 = 1024;
      int v64 = v42;
      __int16 v65 = 1024;
      int v66 = v43;
      __int16 v67 = 1024;
      int v68 = v44;
      __int16 v69 = 1024;
      int st_nlink = v45;
      __int16 v71 = 1024;
      uid_t st_uid = v46.st_nlink;
      __int16 v73 = 1024;
      gid_t st_gid = v46.st_uid;
      __int16 v75 = 1024;
      *(_DWORD *)v76 = v46.st_gid;
      *(_WORD *)&v76[4] = 2048;
      *(void *)&v76[6] = v46.st_atimespec.tv_sec;
      *(_WORD *)&v76[14] = 2048;
      *(void *)&v76[16] = v46.st_mtimespec.tv_sec;
      *(_WORD *)&v76[24] = 2048;
      *(void *)&v76[26] = v46.st_ctimespec.tv_sec;
      *(_WORD *)&v76[34] = 2048;
      *(void *)&v76[36] = v46.st_size;
      __int16 v77 = 1024;
      *(_DWORD *)v78 = v46.st_flags;
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v22;
      __int16 v79 = 2112;
      v80 = v23;
      _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] renameat(%d, '%@', -1, '%@' deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x failed %{errno}d%@", buf, 0xB8u);
    }

    *__error() = v22;
LABEL_18:
    BOOL v18 = 0;
    goto LABEL_19;
  }
  if (*__error() == 2) {
    goto LABEL_18;
  }
  int v19 = *__error();
  v20 = brc_bread_crumbs();
  v21 = brc_default_log();
  if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)v48 = v6;
    *(_WORD *)&v48[8] = 1024;
    *(_DWORD *)&v48[10] = v19;
    *(_WORD *)&v48[14] = 2112;
    *(void *)&v48[16] = v20;
    _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] lstat('%@') failed %{errno}d%@", buf, 0x1Cu);
  }

  BOOL v18 = 0;
  *__error() = v19;
LABEL_19:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlinkRootPath, 0);
  objc_storeStrong((id *)&self->_cachePurgeSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)renameAndUnlinkInBackgroundItemAt:(NSObject *)a3 path:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = __error();
  dispatch_block_t v7 = strerror(*v6);
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  dispatch_queue_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] failed removing documentID for %@ (%s)%@", (uint8_t *)&v8, 0x20u);
}

@end