@interface CKDSQLiteCache
+ (id)sharedCache;
- (CKDLogicalDeviceContext)deviceContext;
- (CKDSQLiteCache)initWithCacheDir:(id)a3;
- (CKDSQLiteCache)initWithDeviceContext:(id)a3;
- (id)initOrExitWithPath:(id)a3 isSharedCache:(BOOL)a4;
- (void)setDeviceContext:(id)a3;
@end

@implementation CKDSQLiteCache

- (id)initOrExitWithPath:(id)a3 isSharedCache:(BOOL)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v8 = objc_msgSend_initWithCacheDir_(self, v7, (uint64_t)v6);
  id v38 = 0;
  LOBYTE(self) = objc_msgSend_openWithError_(v8, v9, (uint64_t)&v38);
  id v10 = v38;
  v12 = v10;
  if (self)
  {
    id v13 = v10;
  }
  else
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v18 = objc_msgSend_CKSanitizedPath(v6, v16, v17);
    v19 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v20 = (os_log_t *)MEMORY[0x1E4F1A500];
    v21 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v40 = v15;
      __int16 v41 = 2112;
      v42 = v18;
      __int16 v43 = 2112;
      id v44 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_ERROR, "%@ failed to open at path %@: %@", buf, 0x20u);
    }
    objc_msgSend_remove(v8, v22, v23);
    id v24 = objc_alloc((Class)objc_opt_class());
    v26 = objc_msgSend_initWithCacheDir_(v24, v25, (uint64_t)v6);

    id v37 = v12;
    char v28 = objc_msgSend_openWithError_(v26, v27, (uint64_t)&v37);
    id v13 = v37;

    if ((v28 & 1) == 0)
    {
      pthread_mutex_unlock(&stru_1EBBCDC78);
      int v31 = objc_msgSend_CKIsDiskFullError_(MEMORY[0x1E4F28C58], v30, (uint64_t)v13);
      v32 = (void *)*MEMORY[0x1E4F1A548];
      if (v31)
      {
        if (*v19 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v32);
        }
        v33 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v40 = v15;
          __int16 v41 = 2114;
          v42 = v18;
          __int16 v43 = 2114;
          id v44 = v13;
          _os_log_error_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_ERROR, "Exiting due to disk full error creating shared database for %{public}@ at path %{public}@: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        if (*v19 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v32);
        }
        v34 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          v40 = v15;
          __int16 v41 = 2114;
          v42 = v18;
          __int16 v43 = 2114;
          id v44 = v13;
          _os_log_fault_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_FAULT, "Exiting due to error creating shared database for %{public}@ at path %{public}@: %{public}@", buf, 0x20u);
        }
      }
      exit(1);
    }

    v8 = v26;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1C4E3890C;
  v35[3] = &unk_1E64F3F88;
  BOOL v36 = a4;
  objc_msgSend_setInvalidationHandler_(v8, v11, (uint64_t)v35);

  return v8;
}

+ (id)sharedCache
{
  pthread_mutex_lock(&stru_1EBBCDC78);
  isSharedCache = objc_msgSend_objectForKey_((void *)qword_1EBBD0198, v3, (uint64_t)a1);
  if (!isSharedCache)
  {
    if (!qword_1EBBD0198)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = (void *)qword_1EBBD0198;
      qword_1EBBD0198 = (uint64_t)v7;
    }
    v9 = objc_msgSend_cacheDirectory(a1, v4, v5);
    uint64_t v12 = objc_msgSend_dbFileName(a1, v10, v11);
    v14 = objc_msgSend_stringByAppendingPathComponent_(v9, v13, v12);

    uint64_t v17 = objc_msgSend_currentProcess(CKDDaemonProcess, v15, v16);
    LOBYTE(v12) = objc_msgSend_isSystemInstalledBinary(v17, v18, v19);

    if ((v12 & 1) == 0)
    {
      uint64_t v21 = objc_msgSend_stringByAppendingString_(v14, v20, @"_debug");

      v14 = (void *)v21;
    }
    id v22 = objc_alloc((Class)a1);
    isSharedCache = objc_msgSend_initOrExitWithPath_isSharedCache_(v22, v23, (uint64_t)v14, 1);
    objc_msgSend_setObject_forKey_((void *)qword_1EBBD0198, v24, (uint64_t)isSharedCache, a1);
  }
  pthread_mutex_unlock(&stru_1EBBCDC78);
  return isSharedCache;
}

- (CKDSQLiteCache)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_dbFileName(v5, v6, v7);
  uint64_t v11 = objc_msgSend_currentProcess(CKDDaemonProcess, v9, v10);
  char isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v11, v12, v13);

  if ((isSystemInstalledBinary & 1) == 0)
  {
    uint64_t v17 = objc_msgSend_stringByAppendingString_(v8, v15, @"_debug");

    v8 = (void *)v17;
  }
  v18 = objc_msgSend_cacheDirectory(v4, v15, v16);
  v20 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v18, v19, (uint64_t)v8, 0);

  uint64_t v23 = objc_msgSend_path(v20, v21, v22);
  isSharedCache = (CKDSQLiteCache *)objc_msgSend_initOrExitWithPath_isSharedCache_(self, v24, (uint64_t)v23, 0);

  objc_msgSend_setDeviceContext_(isSharedCache, v26, (uint64_t)v4);
  return isSharedCache;
}

- (CKDSQLiteCache)initWithCacheDir:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_cacheDatabaseSchema(v5, v6, v7);
  v11.receiver = self;
  v11.super_class = (Class)CKDSQLiteCache;
  v9 = [(CKSQLite *)&v11 initWithPath:v4 schema:v8];

  return v9;
}

- (CKDLogicalDeviceContext)deviceContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceContext);
  return (CKDLogicalDeviceContext *)WeakRetained;
}

- (void)setDeviceContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end