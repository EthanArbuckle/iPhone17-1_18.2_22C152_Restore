@interface BLLockFile
+ (BLBackgroundTaskProviding)backgroundTaskDelegate;
+ (id)iTunesSyncLockFile;
+ (id)iTunesSyncLockFilePath;
+ (void)setBackgroundTaskDelegate:(id)a3;
- (BLLockFile)initWithPath:(id)a3;
- (BOOL)_lock:(BOOL)a3 blocking:(BOOL)a4;
- (BOOL)lock:(BOOL)a3;
- (BOOL)lockWithBlock:(id)a3 error:(id *)a4;
- (BOOL)locked;
- (BOOL)tryLock:(BOOL)a3;
- (NSString)path;
- (void)_registerBackgroundTask;
- (void)_unregisterBackgroundTask;
- (void)dealloc;
- (void)unlock;
@end

@implementation BLLockFile

- (BLLockFile)initWithPath:(id)a3
{
  id v5 = a3;
  uint64_t v9 = objc_msgSend_init(self, v6, v7, v8);
  v10 = (BLLockFile *)v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 32), a3);
    v10->_fd = -1;
    v10->_locked = 0;
    v10->_hasBackgroundTask = 0;
  }

  return v10;
}

- (void)dealloc
{
  objc_msgSend_unlock(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)BLLockFile;
  [(BLLockFile *)&v5 dealloc];
}

+ (id)iTunesSyncLockFile
{
  uint64_t v2 = [BLLockFile alloc];
  v6 = objc_msgSend_iTunesSyncLockFilePath(BLLockFile, v3, v4, v5);
  uint64_t v9 = objc_msgSend_initWithPath_(v2, v7, (uint64_t)v6, v8);

  return v9;
}

+ (id)iTunesSyncLockFilePath
{
  uint64_t v4 = objc_msgSend_bu_booksRepositoryURL(NSURL, a2, v2, v3);
  uint64_t v8 = objc_msgSend_path(v4, v5, v6, v7);
  v11 = objc_msgSend_stringByAppendingPathComponent_(v8, v9, @"Sync/.bookSync.lock", v10);

  return v11;
}

+ (void)setBackgroundTaskDelegate:(id)a3
{
}

+ (BLBackgroundTaskProviding)backgroundTaskDelegate
{
  id WeakRetained = objc_loadWeakRetained(&qword_26AB3FF20);

  return (BLBackgroundTaskProviding *)WeakRetained;
}

- (BOOL)_lock:(BOOL)a3 blocking:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (objc_msgSend_locked(self, a2, a3, a4)) {
    return objc_msgSend_locked(self, v7, v8, v9);
  }
  uint64_t v10 = objc_msgSend_path(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_length(v10, v11, v12, v13);

  if (!v14) {
    return objc_msgSend_locked(self, v7, v8, v9);
  }
  objc_msgSend__registerBackgroundTask(self, v7, v8, v9);
  objc_msgSend_path(self, v15, v16, v17);
  id v18 = objc_claimAutoreleasedReturnValue();
  v22 = (const char *)objc_msgSend_fileSystemRepresentation(v18, v19, v20, v21);
  self->_int fd = open(v22, 512, 438);

  int fd = self->_fd;
  if (fd == -1)
  {
LABEL_15:
    objc_msgSend__unregisterBackgroundTask(self, v23, v24, v25);
    return objc_msgSend_locked(self, v7, v8, v9);
  }
  fcntl(fd, 2, 1);
  if (v5) {
    int v27 = 2;
  }
  else {
    int v27 = 1;
  }
  if (v4) {
    int v28 = 0;
  }
  else {
    int v28 = 4;
  }
  self->_locked = flock(self->_fd, v28 | v27) != -1;
  if ((objc_msgSend_locked(self, v29, v30, v31) & 1) == 0)
  {
    close(self->_fd);
    self->_int fd = -1;
    goto LABEL_15;
  }
  v32 = BLDefaultLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v32, OS_LOG_TYPE_DEBUG, "Taking plist lock.", buf, 2u);
  }

  return objc_msgSend_locked(self, v7, v8, v9);
}

- (void)_registerBackgroundTask
{
  if (!self->_hasBackgroundTask)
  {
    objc_msgSend_backgroundTaskDelegate(BLLockFile, a2, v2, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v6 = objc_msgSend_bl_beginBackgroundTaskWithName_expirationHandler_(v7, v5, @"BLLockFile", (uint64_t)&unk_26CED3DD0);
    self->_hasBackgroundTask = 1;
    self->_backgroundTaskIdentifier = v6;
  }
}

- (void)_unregisterBackgroundTask
{
  if (self->_hasBackgroundTask)
  {
    objc_msgSend_backgroundTaskDelegate(BLLockFile, a2, v2, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bl_endBackgroundTask_(v7, v5, self->_backgroundTaskIdentifier, v6);
    self->_hasBackgroundTask = 0;
  }
}

- (BOOL)lock:(BOOL)a3
{
  return MEMORY[0x270F9A6D0](self, sel__lock_blocking_, a3, 1);
}

- (BOOL)tryLock:(BOOL)a3
{
  return MEMORY[0x270F9A6D0](self, sel__lock_blocking_, a3, 0);
}

- (void)unlock
{
  if (objc_msgSend_locked(self, a2, v2, v3))
  {
    flock(self->_fd, 8);
    close(self->_fd);
    self->_int fd = -1;
    self->_locked = 0;
    BOOL v5 = BLDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "Releasing plist lock.", v9, 2u);
    }

    objc_msgSend__unregisterBackgroundTask(self, v6, v7, v8);
  }
}

- (BOOL)lockWithBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = 1;
  if (objc_msgSend_tryLock_(self, v8, 1, v9))
  {
LABEL_8:
    uint64_t v14 = MEMORY[0x223C1EDC0](v6);
    v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }

    objc_msgSend_unlock(self, v16, v17, v18);
  }
  else
  {
    unint64_t v10 = -1;
    while (1)
    {
      v11 = BLDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEBUG, "Waiting for plist to get unlocked.", buf, 2u);
      }

      usleep(0x61A8u);
      if (v10 == 3) {
        break;
      }
      ++v10;
      if (objc_msgSend_tryLock_(self, v12, 1, v13))
      {
        BOOL v7 = v10 < 4;
        goto LABEL_8;
      }
    }
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v12, @"BLLockFileErrorDomain", -1001, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v19 = BLDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_21DFE3000, v19, OS_LOG_TYPE_ERROR, "Failed to obtain plist lock.", v21, 2u);
      }
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)locked
{
  return self->_locked;
}

- (void).cxx_destruct
{
}

@end