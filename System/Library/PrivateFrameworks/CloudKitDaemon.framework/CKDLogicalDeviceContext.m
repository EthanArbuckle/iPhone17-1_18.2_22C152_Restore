@interface CKDLogicalDeviceContext
+ (id)defaultContext;
+ (id)deviceContextForTestDeviceReference:(id)a3;
+ (id)existingDefaultContext;
- (BOOL)isLiveDevice;
- (CKDAccountDataSecurityObserver)accountDataSecurityObserver;
- (CKDLogicalDeviceScopedStateManager)deviceScopedStateManager;
- (CKDMetadataCache)metadataCache;
- (CKDOperationInfoCache)operationInfoCache;
- (CKDTestDeviceProtocol)testDevice;
- (CKDTestServerProtocol)testServer;
- (CKDThrottleManager)throttleManager;
- (CKDTokenRegistrationScheduler)tokenRegistrationScheduler;
- (CKSQLiteDatabase)deviceScopedDatabase;
- (CKTestDeviceReferenceProtocol)testDeviceReference;
- (NSHashTable)sharedPcsCaches;
- (NSURL)cacheDirectory;
- (id)_initWithTestDeviceReference:(id)a3;
- (id)deviceScopedPushTopic:(id)a3;
- (id)pcsCacheForContainerID:(id)a3 accountOverrideInfo:(id)a4 accountID:(id)a5 encryptionServiceName:(id)a6;
- (int64_t)pushBehavior;
- (void)clearPCSMemoryCaches;
- (void)setAccountDataSecurityObserver:(id)a3;
- (void)setSharedPcsCaches:(id)a3;
@end

@implementation CKDLogicalDeviceContext

- (CKDMetadataCache)metadataCache
{
  metadataCache = self->_metadataCache;
  if (!metadataCache)
  {
    v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDLogicalDeviceContext.m", 229, @"Detached test servers don't have metadata caches");

    metadataCache = self->_metadataCache;
  }
  return metadataCache;
}

- (CKDTestDeviceProtocol)testDevice
{
  v4 = objc_msgSend_testServer(self, a2, v2);
  v7 = objc_msgSend_testDeviceReference(self, v5, v6);
  v10 = objc_msgSend_deviceID(v7, v8, v9);
  v12 = objc_msgSend_deviceWithDeviceID_(v4, v11, (uint64_t)v10);

  return (CKDTestDeviceProtocol *)v12;
}

- (CKDTestServerProtocol)testServer
{
  v5 = objc_msgSend_testDeviceReference(self, a2, v2);

  if (!v5) {
    goto LABEL_3;
  }
  v8 = objc_msgSend_testDeviceReference(self, v6, v7);
  v11 = objc_msgSend_serverReferenceProtocol(v8, v9, v10);
  id v12 = sub_1C4E2FCC4();
  v15 = objc_msgSend_detachedTestServerReference(v12, v13, v14);
  char isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15);

  if ((isEqual & 1) == 0)
  {
    v19 = self;
    objc_sync_enter(v19);
    v18 = v19->_testServer;
    if (!v18)
    {
      if (CKRunningInClientProcess())
      {
        BOOL v22 = 0;
      }
      else
      {
        v23 = objc_msgSend_currentProcess(CKDDaemonProcess, v20, v21);
        BOOL v22 = objc_msgSend_processType(v23, v24, v25) == 2;
      }
      if ((CKIsRunningInTestHost() | v22) == 1)
      {
        Class v28 = NSClassFromString(&cfstr_Cloudkittestin.isa);
        if (!v28)
        {
          v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v26, v27);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, v19, @"CKDLogicalDeviceContext.m", 181, @"Couldn't find CKDTestServerManager in test process");
        }
        v29 = objc_msgSend_sharedManager(v28, v26, v27);
        v32 = objc_msgSend_testDeviceReference(v19, v30, v31);
        v35 = objc_msgSend_serverReferenceProtocol(v32, v33, v34);
        objc_msgSend_existingServerForReference_(v29, v36, (uint64_t)v35);
        v18 = (CKDTestServerProtocol *)objc_claimAutoreleasedReturnValue();

        if (v18) {
          BOOL v39 = 0;
        }
        else {
          BOOL v39 = v22;
        }
        if (v39)
        {
          v43 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v37, v38);
          v46 = objc_msgSend_testDeviceReference(v19, v44, v45);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v47, (uint64_t)a2, v19, @"CKDLogicalDeviceContext.m", 185, @"No such test device at %@", v46);
        }
        objc_storeStrong((id *)&v19->_testServer, v18);
      }
      else
      {
        v18 = 0;
      }
    }
    objc_sync_exit(v19);
  }
  else
  {
LABEL_3:
    v18 = 0;
  }
  return v18;
}

- (CKTestDeviceReferenceProtocol)testDeviceReference
{
  return (CKTestDeviceReferenceProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (CKDAccountDataSecurityObserver)accountDataSecurityObserver
{
  accountDataSecurityObserver = self->_accountDataSecurityObserver;
  if (!accountDataSecurityObserver)
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDLogicalDeviceContext.m", 244, @"Detached test servers don't have throttle managers");

    accountDataSecurityObserver = self->_accountDataSecurityObserver;
  }
  return accountDataSecurityObserver;
}

+ (id)defaultContext
{
  if (qword_1EBBD00E8 != -1) {
    dispatch_once(&qword_1EBBD00E8, &unk_1F20449F0);
  }
  uint64_t v2 = (void *)qword_1EBBD00E0;
  return v2;
}

+ (id)existingDefaultContext
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBD00D8);
  id v2 = (id)qword_1EBBD00E0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBD00D8);
  return v2;
}

+ (id)deviceContextForTestDeviceReference:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 && *MEMORY[0x1E4F1A4E0])
  {
    if (qword_1EBBD00F0 != -1) {
      dispatch_once(&qword_1EBBD00F0, &unk_1F2044A10);
    }
    uint64_t v6 = objc_msgSend_deviceID(v5, v3, v4);
    uint64_t v9 = (void *)v6;
    uint64_t v10 = @"NO_DEVICE_ID";
    if (v6) {
      uint64_t v10 = (__CFString *)v6;
    }
    v25[0] = v10;
    v11 = objc_msgSend_serverReferenceProtocol(v5, v7, v8);
    v15 = objc_msgSend_dataDirectory(v11, v12, v13);
    v16 = v15;
    if (!v15)
    {
      v16 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v14, @"/dev/null");
    }
    v25[1] = v16;
    v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v25, 2);
    if (!v15) {

    }
    id v18 = (id)qword_1EBBD00F8;
    objc_sync_enter(v18);
    v20 = objc_msgSend_objectForKey_((void *)qword_1EBBD00F8, v19, (uint64_t)v17);
    if (!v20)
    {
      uint64_t v21 = [CKDLogicalDeviceContext alloc];
      v20 = objc_msgSend__initWithTestDeviceReference_(v21, v22, (uint64_t)v5);
      objc_msgSend_setObject_forKey_((void *)qword_1EBBD00F8, v23, (uint64_t)v20, v17);
    }
    objc_sync_exit(v18);
  }
  else
  {
    v20 = objc_msgSend_defaultContext(CKDLogicalDeviceContext, v3, v4);
  }

  return v20;
}

- (id)pcsCacheForContainerID:(id)a3 accountOverrideInfo:(id)a4 accountID:(id)a5 encryptionServiceName:(id)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v70 = a5;
  v68 = self;
  id v69 = a6;
  v15 = objc_msgSend_sharedPcsCaches(self, v13, v14);

  if (!v15)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v59 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v76 = v11;
      _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "%{public}@ creating pcsCache", buf, 0xCu);
    }
    v60 = [CKDPCSCache alloc];
    id v53 = (id)objc_msgSend_initWithDeviceContext_containerID_accountOverrideInfo_accountID_encryptionServiceName_(v60, v61, (uint64_t)v68, v11, v12, v70, v69);
LABEL_46:
    id v53 = v53;
    uint64_t isEqual = (uint64_t)v53;
    goto LABEL_47;
  }
  objc_msgSend_sharedPcsCaches(v68, v16, v17);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v20 = objc_msgSend_sharedPcsCaches(v68, v18, v19);
  v23 = objc_msgSend_allObjects(v20, v21, v22);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v24 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v76 = v11;
    _os_log_debug_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ searching for eligible existing pcsCache", buf, 0xCu);
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v25 = v23;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v71, v79, 16);
  if (v29)
  {
    uint64_t v30 = *(void *)v72;
LABEL_8:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v72 != v30) {
        objc_enumerationMutation(v25);
      }
      v32 = *(void **)(*((void *)&v71 + 1) + 8 * v31);
      v33 = objc_msgSend_containerID(v32, v27, v28, obj);
      uint64_t isEqual = objc_msgSend_isEqual_(v33, v34, (uint64_t)v11);

      if ((isEqual & 1) == 0) {
        goto LABEL_22;
      }
      objc_msgSend_accountOverrideInfo(v32, v27, v28);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      if (v37 == v12)
      {
      }
      else
      {
        uint64_t isEqual = objc_msgSend_accountOverrideInfo(v32, v35, v36);
        int v39 = objc_msgSend_isEqual_((void *)isEqual, v38, (uint64_t)v12);

        if (!v39) {
          goto LABEL_22;
        }
      }
      objc_msgSend_accountID(v32, v27, v28);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      if (v42 == v70)
      {

LABEL_20:
        objc_msgSend_encryptionServiceName(v32, v27, v28);
        id v47 = (id)objc_claimAutoreleasedReturnValue();
        if (v47 == v69)
        {

LABEL_35:
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v62 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            id v76 = v11;
            __int16 v77 = 2114;
            v78 = v32;
            _os_log_debug_impl(&dword_1C4CFF000, v62, OS_LOG_TYPE_DEBUG, "%{public}@ found existing pcsCache %{public}@", buf, 0x16u);
          }
          if ((objc_msgSend_beginContentAccess(v32, v63, v64) & 1) == 0)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v65 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v76 = v32;
              _os_log_error_impl(&dword_1C4CFF000, v65, OS_LOG_TYPE_ERROR, "Failed to begin content access for pcsCache: %@", buf, 0xCu);
            }
          }
          uint64_t isEqual = v32;
          char v58 = 0;
          id v53 = 0;
          v56 = v25;
          goto LABEL_45;
        }
        uint64_t isEqual = objc_msgSend_encryptionServiceName(v32, v45, v46);
        int v49 = objc_msgSend_isEqual_((void *)isEqual, v48, (uint64_t)v69);

        if (v49) {
          goto LABEL_35;
        }
        goto LABEL_22;
      }
      uint64_t isEqual = objc_msgSend_accountID(v32, v40, v41);
      int v44 = objc_msgSend_isEqual_((void *)isEqual, v43, (uint64_t)v70);

      if (v44) {
        goto LABEL_20;
      }
LABEL_22:
      if (v29 == ++v31)
      {
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v71, v79, 16);
        if (v29) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v50 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v76 = v11;
    _os_log_debug_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_DEBUG, "%{public}@ creating pcsCache", buf, 0xCu);
  }
  v51 = [CKDPCSCache alloc];
  id v53 = (id)objc_msgSend_initWithDeviceContext_containerID_accountOverrideInfo_accountID_encryptionServiceName_(v51, v52, (uint64_t)v68, v11, v12, v70, v69);
  v56 = objc_msgSend_sharedPcsCaches(v68, v54, v55);
  objc_msgSend_addObject_(v56, v57, (uint64_t)v53);
  char v58 = 1;
LABEL_45:

  objc_sync_exit(obj);
  if (v58) {
    goto LABEL_46;
  }
LABEL_47:

  return (id)isEqual;
}

- (void)clearPCSMemoryCaches
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  objc_msgSend_sharedPcsCaches(self, a2, v2);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = objc_msgSend_sharedPcsCaches(self, v4, v5);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v29, v41, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v12 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          id v18 = objc_msgSend_containerID(v11, v13, v14);
          uint64_t v21 = objc_msgSend_accountOverrideInfo(v11, v19, v20);
          v24 = objc_msgSend_accountID(v11, v22, v23);
          uint64_t v27 = objc_msgSend_encryptionServiceName(v11, v25, v26);
          *(_DWORD *)buf = 138544130;
          uint64_t v34 = v18;
          __int16 v35 = 2114;
          uint64_t v36 = v21;
          __int16 v37 = 2112;
          uint64_t v38 = v24;
          __int16 v39 = 2114;
          v40 = v27;
          _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "Clearing in-memory PCS cache for containerID %{public}@, accountOverrideInfo %{public}@, accountID %@, encryptionServiceName %{public}@", buf, 0x2Au);
        }
        objc_msgSend_clearPCSMemoryCaches(v11, v15, v16);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v29, v41, 16);
    }
    while (v8);
  }

  objc_sync_exit(obj);
}

- (id)_initWithTestDeviceReference:(id)a3
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v6, v7);
  objc_msgSend_assertAvailability_(v8, v9, 2);

  v46.receiver = self;
  v46.super_class = (Class)CKDLogicalDeviceContext;
  uint64_t v10 = [(CKDLogicalDeviceContext *)&v46 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_testDeviceReference, a3);
    id v12 = [CKDAccountDataSecurityObserver alloc];
    uint64_t v14 = objc_msgSend_initWithDeviceContext_(v12, v13, (uint64_t)v11);
    accountDataSecurityObserver = v11->_accountDataSecurityObserver;
    v11->_accountDataSecurityObserver = (CKDAccountDataSecurityObserver *)v14;

    if (!v5) {
      goto LABEL_4;
    }
    id v18 = objc_msgSend_serverReferenceProtocol(v5, v16, v17);
    id v19 = sub_1C4E2FCC4();
    uint64_t v22 = objc_msgSend_detachedTestServerReference(v19, v20, v21);
    char isEqual = objc_msgSend_isEqual_(v18, v23, (uint64_t)v22);

    if ((isEqual & 1) == 0)
    {
LABEL_4:
      id v25 = [CKDMetadataCache alloc];
      uint64_t v27 = objc_msgSend_initWithDeviceContext_(v25, v26, (uint64_t)v11);
      metadataCache = v11->_metadataCache;
      v11->_metadataCache = (CKDMetadataCache *)v27;

      long long v29 = [CKDOperationInfoCache alloc];
      uint64_t v31 = objc_msgSend_initWithDeviceContext_(v29, v30, (uint64_t)v11);
      operationInfoCache = v11->_operationInfoCache;
      v11->_operationInfoCache = (CKDOperationInfoCache *)v31;

      v33 = [CKDTokenRegistrationScheduler alloc];
      uint64_t v35 = objc_msgSend_initWithDeviceContext_(v33, v34, (uint64_t)v11);
      tokenRegistrationScheduler = v11->_tokenRegistrationScheduler;
      v11->_tokenRegistrationScheduler = (CKDTokenRegistrationScheduler *)v35;

      __int16 v37 = [CKDThrottleManager alloc];
      uint64_t v39 = objc_msgSend_initWithDeviceContext_(v37, v38, (uint64_t)v11);
      throttleManager = v11->_throttleManager;
      v11->_throttleManager = (CKDThrottleManager *)v39;

      uint64_t v43 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v41, v42);
      sharedPcsCaches = v11->_sharedPcsCaches;
      v11->_sharedPcsCaches = (NSHashTable *)v43;
    }
  }

  return v11;
}

- (BOOL)isLiveDevice
{
  uint64_t v6 = objc_msgSend_testDeviceReference(self, a2, v2);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_testDeviceReference(self, v4, v5);
    uint64_t v10 = objc_msgSend_deviceID(v7, v8, v9);
    char isEqualToString = objc_msgSend_isEqualToString_(v10, v11, @"__live_device__");
  }
  else
  {
    char isEqualToString = 1;
  }

  return isEqualToString;
}

- (NSURL)cacheDirectory
{
  uint64_t v5 = objc_msgSend_testDeviceReference(self, a2, v2);

  if (v5)
  {
    uint64_t v8 = objc_msgSend_testDeviceReference(self, v6, v7);
    id v11 = objc_msgSend_serverReferenceProtocol(v8, v9, v10);
    id v12 = sub_1C4E2FCC4();
    v15 = objc_msgSend_detachedTestServerReference(v12, v13, v14);
    int isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15);

    if (isEqual)
    {
      long long v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, @"CKDLogicalDeviceContext.m", 210, @"Detached test servers don't have a filesystem presence");
    }
    uint64_t v20 = objc_msgSend_testDevice(self, v18, v19);
    uint64_t v23 = objc_msgSend_deviceDirectory(v20, v21, v22);
    id v25 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v23, v24, @"CloudKitCaches", 1);
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v20 = CKGetHomeCacheDir();
    id v25 = objc_msgSend_fileURLWithPath_isDirectory_(v26, v27, (uint64_t)v20, 1);
  }

  return (NSURL *)v25;
}

- (CKSQLiteDatabase)deviceScopedDatabase
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_cacheDirectory(self, a2, v2);
  uint64_t v5 = objc_msgSend_URLByAppendingPathComponent_(v3, v4, @"cloudd_db");
  uint64_t v8 = objc_msgSend_path(v5, v6, v7);

  id v28 = 0;
  uint64_t v10 = objc_msgSend_databaseInDirectory_registryDatabase_options_error_(MEMORY[0x1E4F1A370], v9, (uint64_t)v8, 0, 8, &v28);
  id v11 = v28;
  if (v11)
  {
    uint64_t v27 = v11;
    if (objc_msgSend_CKIsDiskFullError_(MEMORY[0x1E4F28C58], v12, (uint64_t)v11)) {
      goto LABEL_8;
    }
    uint64_t v16 = objc_msgSend_domain(v27, v14, v15);
    if (objc_msgSend_isEqual_(v16, v17, *MEMORY[0x1E4F281F8]))
    {
      uint64_t v20 = objc_msgSend_code(v27, v18, v19);

      if (v20 == 640)
      {
LABEL_8:
        if (*MEMORY[0x1E4F1A550] == -1) {
          goto LABEL_9;
        }
        goto LABEL_18;
      }
    }
    else
    {
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v30 = v27;
      _os_log_error_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_ERROR, "failed to create database: %@", buf, 0xCu);
    }
    v24 = objc_msgSend_stringWithFormat_(NSString, v23, @"failed to create database: %@", v27);
    objc_msgSend_UTF8String(v24, v25, v26);
    _os_crash();
    __break(1u);
LABEL_18:
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
LABEL_9:
    uint64_t v21 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v30 = v27;
      _os_log_error_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_ERROR, "-deviceScopedDatabase failed due to disk full. Cloudd will now exit. error = %{public}@", buf, 0xCu);
    }
    exit(1);
  }

  return (CKSQLiteDatabase *)v10;
}

- (CKDOperationInfoCache)operationInfoCache
{
  operationInfoCache = self->_operationInfoCache;
  if (!operationInfoCache)
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDLogicalDeviceContext.m", 234, @"Detached test servers don't have operation info caches");

    operationInfoCache = self->_operationInfoCache;
  }
  return operationInfoCache;
}

- (CKDThrottleManager)throttleManager
{
  throttleManager = self->_throttleManager;
  if (!throttleManager)
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDLogicalDeviceContext.m", 239, @"Detached test servers don't have throttle managers");

    throttleManager = self->_throttleManager;
  }
  return throttleManager;
}

- (CKDTokenRegistrationScheduler)tokenRegistrationScheduler
{
  tokenRegistrationScheduler = self->_tokenRegistrationScheduler;
  if (!tokenRegistrationScheduler)
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDLogicalDeviceContext.m", 249, @"Detached test servers don't have token registration schedulers");

    tokenRegistrationScheduler = self->_tokenRegistrationScheduler;
  }
  return tokenRegistrationScheduler;
}

- (CKDLogicalDeviceScopedStateManager)deviceScopedStateManager
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_deviceScopedStateManager);
  if (!WeakRetained)
  {
    uint64_t v4 = [CKDLogicalDeviceScopedStateManager alloc];
    WeakRetained = objc_msgSend_initWithDeviceContext_(v4, v5, (uint64_t)v2);
    objc_storeWeak((id *)&v2->_deviceScopedStateManager, WeakRetained);
  }
  objc_sync_exit(v2);

  return (CKDLogicalDeviceScopedStateManager *)WeakRetained;
}

- (int64_t)pushBehavior
{
  v3 = objc_msgSend_testDevice(self, a2, v2);
  uint64_t v6 = v3;
  if (v3)
  {
    unint64_t v7 = objc_msgSend_pushBehavior(v3, v4, v5);
    if (v7 >= 3) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = v7;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (id)deviceScopedPushTopic:(id)a3
{
  id v4 = a3;
  objc_msgSend_pushBehavior(self, v5, v6);
  uint64_t v9 = objc_msgSend_testDeviceReference(self, v7, v8);
  id v12 = objc_msgSend_deviceID(v9, v10, v11);
  uint64_t v15 = objc_msgSend_testDeviceReference(self, v13, v14);
  id v18 = objc_msgSend_serverReferenceProtocol(v15, v16, v17);
  uint64_t v21 = objc_msgSend_dataDirectory(v18, v19, v20);
  v24 = objc_msgSend_path(v21, v22, v23);
  id v25 = CKPushTopicForPushBehavior();

  return v25;
}

- (void)setAccountDataSecurityObserver:(id)a3
{
}

- (NSHashTable)sharedPcsCaches
{
  return self->_sharedPcsCaches;
}

- (void)setSharedPcsCaches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedPcsCaches, 0);
  objc_storeStrong((id *)&self->_testDeviceReference, 0);
  objc_storeStrong((id *)&self->_accountDataSecurityObserver, 0);
  objc_storeStrong((id *)&self->_tokenRegistrationScheduler, 0);
  objc_destroyWeak((id *)&self->_deviceScopedStateManager);
  objc_storeStrong((id *)&self->_throttleManager, 0);
  objc_storeStrong((id *)&self->_operationInfoCache, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_testServer, 0);
}

@end