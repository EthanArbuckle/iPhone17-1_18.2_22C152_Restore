@interface CKDMMCSEngineContext
+ (BOOL)hasCachedCKDMMCSEngineContextForPath:(id)a3;
+ (BOOL)tearDownMMCSEngineWithContext:(id)a3;
+ (id)_appID;
+ (id)setupMMCSEngineWithApplicationBundleID:(id)a3 path:(id)a4 wasCached:(BOOL *)a5 error:(id *)a6;
+ (id)sharedContextsByPath;
+ (id)sharedContextsQueue;
- (BOOL)_setupMMCSEngineWithError:(id *)a3;
- (BOOL)_setupMMCSEngineWithRetryCount:(unint64_t)a3 error:(id *)a4;
- (CKDMMCS)MMCS;
- (CKDMMCSEngineContext)initWithApplicationBundleID:(id)a3 path:(id)a4;
- (NSMutableIndexSet)inMemoryItemsIDs;
- (NSString)applicationBundleID;
- (NSString)path;
- (_mmcs_engine)MMCSEngine;
- (id)CKPropertiesDescription;
- (id)description;
- (int64_t)decRefCount;
- (int64_t)incRefCount;
- (int64_t)refCount;
- (int64_t)state;
- (unint64_t)nextAvailableItemID;
- (unsigned)maxChunkCountForSection;
- (void)MMCSRunSerialized:(id)a3;
- (void)MMCSSerializeAsyncRecursive:(id)a3;
- (void)MMCSSerializeSyncRecursive:(id)a3;
- (void)_tearDownMMCSEngine;
- (void)assertMMCSSerialized;
- (void)cancelRequestWithContext:(void *)a3;
- (void)dealloc;
- (void)setApplicationBundleID:(id)a3;
- (void)setInMemoryItemsIDs:(id)a3;
- (void)setMMCS:(id)a3;
- (void)setMMCSEngine:(_mmcs_engine *)a3;
- (void)setMaxChunkCountForSection:(unsigned int)a3;
- (void)setPath:(id)a3;
- (void)setRefCount:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)stopTrackingItemID:(unint64_t)a3;
@end

@implementation CKDMMCSEngineContext

+ (id)_appID
{
  v2 = CKBuildVersion();
  v4 = objc_msgSend_stringWithFormat_(NSString, v3, @"%@/%@", @"com.apple.CloudKit", v2);

  return v4;
}

+ (id)sharedContextsQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F20558;
  block[3] = &unk_1E64F1B50;
  block[4] = a1;
  if (qword_1EBBCFF40 != -1) {
    dispatch_once(&qword_1EBBCFF40, block);
  }
  v2 = (void *)qword_1EBBCFF38;
  return v2;
}

+ (id)sharedContextsByPath
{
  if (qword_1EBBCFF50 != -1) {
    dispatch_once(&qword_1EBBCFF50, &unk_1F2044250);
  }
  v2 = (void *)qword_1EBBCFF48;
  return v2;
}

- (CKDMMCSEngineContext)initWithApplicationBundleID:(id)a3 path:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v11 = a4;
  if (v11)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CKDMMCSEngineContext.m", 76, @"Expected non-nil path");

    if (v8) {
      goto LABEL_3;
    }
  }
  v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, @"CKDMMCSEngineContext.m", 77, @"Expected non-nil applicationBundleID");

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)CKDMMCSEngineContext;
  v12 = [(CKDMMCSEngineContext *)&v25 init];
  v13 = v12;
  if (v12)
  {
    *(_OWORD *)&v12->_refCount = xmmword_1C5080820;
    objc_storeStrong((id *)&v12->_applicationBundleID, a3);
    objc_storeStrong((id *)&v13->_path, a4);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("CKDMMCSEngineContext queue", v14);
    mmcsQueue = v13->_mmcsQueue;
    v13->_mmcsQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    inMemoryItemsIDs = v13->_inMemoryItemsIDs;
    v13->_inMemoryItemsIDs = v17;

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v19 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Initialized MMCS engine context: %@", buf, 0xCu);
    }
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v4 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_DEBUG, "Deallocating MMCS engine context: %@", buf, 0xCu);
  }
  if (objc_msgSend_refCount(self, v5, v6))
  {
    v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    uint64_t v12 = objc_msgSend_refCount(self, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v13, (uint64_t)a2, self, @"CKDMMCSEngineContext.m", 95, @"Expected refCount=0 (%ld)", v12);
  }
  v14.receiver = self;
  v14.super_class = (Class)CKDMMCSEngineContext;
  [(CKDMMCSEngineContext *)&v14 dealloc];
}

- (id)CKPropertiesDescription
{
  v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 3);
  v4 = NSString;
  uint64_t v7 = objc_msgSend_state(self, v5, v6);
  uint64_t v10 = objc_msgSend_refCount(self, v8, v9);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v4, v11, @"state=%ld, refCount=%ld", v7, v10);
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  v16 = objc_msgSend_applicationBundleID(self, v14, v15);

  if (v16)
  {
    v19 = NSString;
    v20 = objc_msgSend_applicationBundleID(self, v17, v18);
    v22 = objc_msgSend_stringWithFormat_(v19, v21, @"applicationBundleID=%@", v20);
    objc_msgSend_addObject_(v3, v23, (uint64_t)v22);
  }
  v24 = objc_msgSend_path(self, v17, v18);

  if (v24)
  {
    v27 = NSString;
    uint64_t v28 = objc_msgSend_path(self, v25, v26);
    v31 = objc_msgSend_CKSanitizedPath(v28, v29, v30);
    v33 = objc_msgSend_stringWithFormat_(v27, v32, @"path=\"%@\"", v31);
    objc_msgSend_addObject_(v3, v34, (uint64_t)v33);
  }
  v35 = objc_msgSend_componentsJoinedByString_(v3, v25, @", ");

  return v35;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSEngineContext *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (int64_t)incRefCount
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = v2->_refCount + 1;
  v2->_refCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)decRefCount
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = v2->_refCount - 1;
  v2->_refCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_setupMMCSEngineWithError:(id *)a3
{
  v93[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, a2, (uint64_t)a3);
  dispatch_assert_queue_V2(v6);

  if (objc_msgSend_state(self, v7, v8) != 3)
  {
    v84 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v84, v85, (uint64_t)a2, self, @"CKDMMCSEngineContext.m", 266, @"Expected state %ld for MMCS engine context", 3, self);
  }
  if (objc_msgSend_MMCSEngine(self, v9, v10))
  {
    v86 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v86, v87, (uint64_t)a2, self, @"CKDMMCSEngineContext.m", 267, @"Expected nil MMCS engine for MMCS engine context %@", self);
  }
  uint64_t v13 = *MEMORY[0x1E4F73808];
  v92[0] = *MEMORY[0x1E4F73800];
  v92[1] = v13;
  v93[0] = MEMORY[0x1E4F1CC38];
  v93[1] = MEMORY[0x1E4F1CC38];
  v92[2] = *MEMORY[0x1E4F737F8];
  v93[2] = MEMORY[0x1E4F1CC38];
  objc_super v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v93, v92, 3);
  uint64_t v15 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v16 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v17 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v63 = v17;
    v66 = objc_msgSend_path(self, v64, v65);
    v69 = objc_msgSend_CKSanitizedPath(v66, v67, v68);
    *(_DWORD *)buf = 138543362;
    v89 = v69;
    _os_log_debug_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_DEBUG, "Creating MMCS engine at %{public}@", buf, 0xCu);
  }
  v20 = objc_msgSend_path(self, v18, v19);
  char v21 = CKCreateDirectoryAtPath();
  id v22 = 0;

  if (v21)
  {
    objc_super v25 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v26 = objc_msgSend_path(self, v23, v24);
    objc_msgSend_fileURLWithPath_isDirectory_(v25, v27, (uint64_t)v26, 1);
    objc_msgSend__appID(CKDMMCSEngineContext, v28, v29);
    uint64_t v30 = MMCSEngineCreateWithTargetDispatchQueue();
    objc_msgSend_setMMCSEngine_(self, v31, v30);

    if (objc_msgSend_MMCSEngine(self, v32, v33))
    {
      v36 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v34, v35);
      BOOL v37 = 1;
      objc_msgSend_enableMMCSMetricsWithDefaultValue_(v36, v38, 1);

      objc_msgSend_MMCSEngine(self, v39, v40);
      MMCSEngineSetMetricsEnabled();
      objc_msgSend_MMCSEngine(self, v41, v42);
      uint64_t v43 = MMCSGetMaxChunkCountForSection();
      objc_msgSend_setMaxChunkCountForSection_(self, v44, v43);
      objc_msgSend_setState_(self, v45, 1);
      goto LABEL_25;
    }
    if (*v15 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v60 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      v77 = v60;
      v80 = objc_msgSend_path(self, v78, v79);
      v83 = objc_msgSend_CKSanitizedPath(v80, v81, v82);
      *(_DWORD *)buf = 138543362;
      v89 = v83;
      _os_log_error_impl(&dword_1C4CFF000, v77, OS_LOG_TYPE_ERROR, "Failed creating MMCS engine at %{public}@", buf, 0xCu);
    }
    v59 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v61, *MEMORY[0x1E4F19DD8], 3001, @"MMCSEngineCreate failed");
  }
  else
  {
    if (*v15 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v46 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      v70 = v46;
      v73 = objc_msgSend_path(self, v71, v72);
      v76 = objc_msgSend_CKSanitizedPath(v73, v74, v75);
      *(_DWORD *)buf = 138543618;
      v89 = v76;
      __int16 v90 = 2112;
      id v91 = v22;
      _os_log_error_impl(&dword_1C4CFF000, v70, OS_LOG_TYPE_ERROR, "Error creating MMCS directory at %{public}@: %@", buf, 0x16u);
    }
    v49 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v50 = *MEMORY[0x1E4F19DD8];
    uint64_t v51 = objc_msgSend_path(self, v47, v48);
    v54 = objc_msgSend_path(self, v52, v53);
    v57 = objc_msgSend_CKSanitizedPath(v54, v55, v56);
    v59 = objc_msgSend_errorWithDomain_code_error_path_format_(v49, v58, v50, 1000, v22, v51, @"Error creating MMCS directory at %@", v57);

    id v22 = (id)v51;
  }

  if (a3)
  {
    id v22 = v59;
    BOOL v37 = 0;
    *a3 = v22;
  }
  else
  {
    BOOL v37 = 0;
    id v22 = v59;
  }
LABEL_25:

  return v37;
}

- (BOOL)_setupMMCSEngineWithRetryCount:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7 = objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, a2, a3);
  dispatch_assert_queue_V2(v7);

  if (a3)
  {
    id v23 = 0;
    char v9 = objc_msgSend__setupMMCSEngineWithError_(self, v8, (uint64_t)&v23);
    id v12 = v23;
    if (v9)
    {
      BOOL v13 = 1;
      goto LABEL_14;
    }
    unint64_t v14 = 0;
    while (1)
    {
      if (!v14)
      {
        uint64_t v15 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v10, v11);
        uint64_t v18 = objc_msgSend_path(self, v16, v17);
        objc_msgSend_removeItemAtPath_error_(v15, v19, (uint64_t)v18, 0);
      }
      if (a3 - 1 == v14) {
        break;
      }

      id v23 = 0;
      char v21 = objc_msgSend__setupMMCSEngineWithError_(self, v20, (uint64_t)&v23);
      id v12 = v23;
      ++v14;
      if (v21)
      {
        BOOL v13 = v14 < a3;
        goto LABEL_14;
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  if (a4)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_14:

  return v13;
}

- (void)_tearDownMMCSEngine
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, a2, v2);
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "Tearing down MMCS engine: %@", buf, 0xCu);
  }
  if (objc_msgSend_MMCSEngine(self, v8, v9))
  {
    if (*v5 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_debug_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEBUG, "Destroying MMCS engine %@", buf, 0xCu);
    }
    objc_msgSend_setState_(self, v11, 2);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1C4F21BFC;
    v14[3] = &unk_1E64F05C8;
    v14[4] = self;
    objc_msgSend_MMCSSerializeSyncRecursive_(self, v12, (uint64_t)v14);
    objc_msgSend_setState_(self, v13, 3);
  }
}

+ (BOOL)hasCachedCKDMMCSEngineContextForPath:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v4, v5);
  dispatch_assert_queue_V2(v6);

  uint64_t v9 = objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v3);

  return v11 != 0;
}

+ (id)setupMMCSEngineWithApplicationBundleID:(id)a3 path:(id)a4 wasCached:(BOOL *)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v15 = objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v13, v14);
  dispatch_assert_queue_V2(v15);

  if (a5) {
    *a5 = 0;
  }
  if (v12)
  {
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    v39 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, a1, @"CKDMMCSEngineContext.m", 391, @"Expected non-nil path");

    if (v11) {
      goto LABEL_5;
    }
  }
  v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, a1, @"CKDMMCSEngineContext.m", 392, @"Expected non-nil applicationBundleID");

LABEL_5:
  uint64_t v18 = objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v16, v17);
  v20 = objc_msgSend_objectForKey_(v18, v19, (uint64_t)v12);

  if (v20)
  {
    objc_msgSend_incRefCount(v20, v21, v22);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v23 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v20;
      _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Found a cached engine context %@", buf, 0xCu);
    }
    id v24 = 0;
    if (a5) {
      *a5 = 1;
    }
  }
  else
  {
    objc_super v25 = [CKDMMCSEngineContext alloc];
    v20 = objc_msgSend_initWithApplicationBundleID_path_(v25, v26, (uint64_t)v11, v12);
    id v43 = 0;
    int v28 = objc_msgSend__setupMMCSEngineWithRetryCount_error_(v20, v27, 2, &v43);
    id v24 = v43;
    if (v28)
    {
      objc_msgSend_incRefCount(v20, v29, v30);
      uint64_t v33 = objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v31, v32);
      v36 = objc_msgSend_path(v20, v34, v35);
      objc_msgSend_setObject_forKey_(v33, v37, (uint64_t)v20, v36);
    }
    else
    {

      if (a6)
      {
        id v24 = v24;
        v20 = 0;
        *a6 = v24;
      }
      else
      {
        v20 = 0;
      }
    }
  }

  return v20;
}

+ (BOOL)tearDownMMCSEngineWithContext:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v6 = objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v4, v5);
  dispatch_assert_queue_V2(v6);

  if (v3 && !objc_msgSend_decRefCount(v3, v7, v8))
  {
    objc_msgSend__tearDownMMCSEngine(v3, v9, v10);
    uint64_t v14 = objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v12, v13);
    uint64_t v17 = objc_msgSend_path(v3, v15, v16);
    objc_msgSend_objectForKey_(v14, v18, (uint64_t)v17);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    v20 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v21 = *MEMORY[0x1E4F1A550];
    if (v19 == v3)
    {
      if (v21 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v20);
      }
      uint64_t v30 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        BOOL v37 = v30;
        uint64_t v40 = objc_msgSend_path(v3, v38, v39);
        int v41 = 138412546;
        id v42 = v3;
        __int16 v43 = 2114;
        v44 = v40;
        _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Removing context %@ for path %{public}@ from sharedContextsByPath", (uint8_t *)&v41, 0x16u);
      }
      id v23 = objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v31, v32);
      uint64_t v26 = objc_msgSend_path(v3, v33, v34);
      objc_msgSend_removeObjectForKey_(v23, v35, (uint64_t)v26);
    }
    else
    {
      if (v21 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v20);
      }
      uint64_t v22 = (void *)*MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      id v23 = v22;
      uint64_t v26 = objc_msgSend_sharedContextsByPath(CKDMMCSEngineContext, v24, v25);
      uint64_t v29 = objc_msgSend_path(v3, v27, v28);
      int v41 = 138412802;
      id v42 = v3;
      __int16 v43 = 2112;
      v44 = v26;
      __int16 v45 = 2114;
      uint64_t v46 = v29;
      _os_log_error_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_ERROR, "context %@ not in sharedContextsByPath %@ for key %{public}@", (uint8_t *)&v41, 0x20u);
    }
LABEL_15:
    BOOL v11 = 1;
    goto LABEL_16;
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (void)cancelRequestWithContext:(void *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (const void *)objc_msgSend_MMCSEngine(self, a2, (uint64_t)a3);
  if (!v8)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKDMMCSEngineContext.m", 448, @"Expected non-nil MMCS engine");
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v10 = (os_log_t *)MEMORY[0x1E4F1A500];
  BOOL v11 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    v20 = a3;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Cancelling requests for MMCS engine wrapper %@ and context %@", buf, 0x16u);
  }
  CFRetain(v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4F2243C;
  v16[3] = &unk_1E64F3C20;
  v16[5] = v8;
  v16[6] = a3;
  v16[4] = self;
  objc_msgSend_MMCSSerializeSyncRecursive_(self, v12, (uint64_t)v16);
  if (*v9 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v13 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    v20 = a3;
    _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "Waiting for MMCS engine wrapper %@ to cancel the requests for %@", buf, 0x16u);
  }
  CFRelease(v8);
}

- (void)MMCSSerializeSyncRecursive:(id)a3
{
  v4 = (void (**)(void))a3;
  serializedThread = (_opaque_pthread_t *)self->_serializedThread;
  if (serializedThread == pthread_self())
  {
    v4[2](v4);
  }
  else
  {
    mmcsQueue = self->_mmcsQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1C4F225FC;
    v7[3] = &unk_1E64F0E18;
    v7[4] = self;
    uint64_t v8 = v4;
    dispatch_sync(mmcsQueue, v7);
  }
}

- (void)MMCSSerializeAsyncRecursive:(id)a3
{
  id v5 = a3;
  if (!objc_msgSend_MMCSEngine(self, v6, v7))
  {
    id v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDMMCSEngineContext.m", 481, @"Expected non-nil MMCS engine");
  }
  mmcsQueue = self->_mmcsQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4F22740;
  v14[3] = &unk_1E64F0E18;
  v14[4] = self;
  id v15 = v5;
  id v11 = v5;
  dispatch_async(mmcsQueue, v14);
}

- (void)MMCSRunSerialized:(id)a3
{
  id v5 = a3;
  v4 = (void *)MEMORY[0x1C8789E70]();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_mmcsQueue);
  sub_1C4F22608((pthread_t *)&self->_serializedThread, v5);
}

- (void)assertMMCSSerialized
{
  serializedThread = (_opaque_pthread_t *)self->_serializedThread;
  if (serializedThread != pthread_self())
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v7, (uint64_t)a2, self, @"CKDMMCSEngineContext.m", 496, @"Expected to be serialized");
  }
}

- (unint64_t)nextAvailableItemID
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  id v3 = self->_inMemoryItemsIDs;
  objc_sync_enter(v3);
  CKNSIndexSet_enumerateInverseRangesInRange_options_usingBlock();
  uint64_t v5 = v9[3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    __assert_rtn("-[CKDMMCSEngineContext nextAvailableItemID]", "CKDMMCSEngineContext.m", 512, "0 && \"itemID overflow\"");
  }
  objc_msgSend_addIndex_(self->_inMemoryItemsIDs, v4, v5);
  objc_sync_exit(v3);

  unint64_t v6 = v9[3] - 0x331272800;
  _Block_object_dispose(&v8, 8);
  return v6;
}

- (void)stopTrackingItemID:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->_inMemoryItemsIDs;
  objc_sync_enter(v5);
  if (objc_msgSend_containsIndex_(self->_inMemoryItemsIDs, v6, a3 + 0x331272800))
  {
    objc_msgSend_removeIndex_(self->_inMemoryItemsIDs, v7, a3 + 0x331272800);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v8 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      unint64_t v10 = a3;
      _os_log_error_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_ERROR, "Attempted to stop tracking untracked itemID %llu", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_sync_exit(v5);
}

- (int64_t)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(int64_t)a3
{
  self->_refCount = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CKDMMCS)MMCS
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_MMCS);
  return (CKDMMCS *)WeakRetained;
}

- (void)setMMCS:(id)a3
{
}

- (_mmcs_engine)MMCSEngine
{
  return self->_MMCSEngine;
}

- (void)setMMCSEngine:(_mmcs_engine *)a3
{
  self->_MMCSEngine = a3;
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unsigned)maxChunkCountForSection
{
  return self->_maxChunkCountForSection;
}

- (void)setMaxChunkCountForSection:(unsigned int)a3
{
  self->_maxChunkCountForSection = a3;
}

- (NSMutableIndexSet)inMemoryItemsIDs
{
  return self->_inMemoryItemsIDs;
}

- (void)setInMemoryItemsIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inMemoryItemsIDs, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_destroyWeak((id *)&self->_MMCS);
  objc_storeStrong((id *)&self->_mmcsQueue, 0);
}

@end