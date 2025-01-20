@interface CKAssetRepairScheduler
+ (id)nameForEvent:(int64_t)a3;
+ (int64_t)canCopyFromFileURL:(id)a3 toDirectoryURL:(id)a4;
+ (int64_t)estimatedSizeForAssetOrPackage:(id)a3;
+ (unint64_t)remainingCapacityAtURL:(id)a3 error:(id *)a4;
- (BOOL)hasPendingWork;
- (CKAssetRepairScheduler)initWithContainer:(id)a3 repairContainerOverrides:(id)a4;
- (CKAssetRepairSchedulerDelegate)delegate;
- (NSURL)temporaryAssetDirectory;
- (double)defaultSuspensionTime;
- (double)requestTimeout;
- (id)allRemainingRequestableAssets;
- (id)allRemainingUploadableAssets;
- (id)clonedAsset:(id)a3 withError:(id *)a4;
- (int64_t)cacheCountLimit;
- (int64_t)repairBatchCountLimit;
- (int64_t)repairRetryCount;
- (void)addUploadRequestsWithMetadata:(id)a3 requestBlocks:(id)a4;
- (void)cancelAllOperations;
- (void)clearAssetCache;
- (void)dealloc;
- (void)removeUploadRequestWithRecordID:(id)a3;
- (void)setCacheCountLimit:(int64_t)a3;
- (void)setDefaultSuspensionTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setRepairBatchCountLimit:(int64_t)a3;
- (void)setRepairRetryCount:(int64_t)a3;
- (void)setRequestTimeout:(double)a3;
- (void)tickle;
@end

@implementation CKAssetRepairScheduler

- (double)requestTimeout
{
  double result = self->_requestTimeout;
  if (result == -1.0) {
    return 15.0;
  }
  return result;
}

- (int64_t)repairBatchCountLimit
{
  if (self->_repairBatchCountLimit == -1) {
    return 1;
  }
  else {
    return self->_repairBatchCountLimit;
  }
}

- (int64_t)cacheCountLimit
{
  if (self->_cacheCountLimit == -1) {
    return 5;
  }
  else {
    return self->_cacheCountLimit;
  }
}

- (double)defaultSuspensionTime
{
  double result = self->_defaultSuspensionTime;
  if (result == -1.0) {
    return 120.0;
  }
  return result;
}

- (int64_t)repairRetryCount
{
  if (self->_repairRetryCount == -1) {
    return 10;
  }
  else {
    return self->_repairRetryCount;
  }
}

+ (id)nameForEvent:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5464358[a3];
  }
}

- (void)dealloc
{
  objc_msgSend_clearAssetCache(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKAssetRepairScheduler;
  [(CKAssetRepairScheduler *)&v5 dealloc];
}

- (CKAssetRepairScheduler)initWithContainer:(id)a3 repairContainerOverrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v93.receiver = self;
  v93.super_class = (Class)CKAssetRepairScheduler;
  v8 = [(CKAssetRepairScheduler *)&v93 init];
  v12 = v8;
  if (v8)
  {
    v8->_requestTimeout = -1.0;
    v8->_repairBatchCountLimit = -1;
    v8->_cacheCountLimit = -1;
    v8->_defaultSuspensionTime = -1.0;
    v8->_repairRetryCount = -1;
    v13 = NSString;
    v14 = objc_msgSend_containerIdentifier(v6, v9, v10, v11);
    objc_msgSend_stringWithFormat_(v13, v15, @"%@.%@", v16, @"com.apple.cloudkit.datarepair.internal", v14);
    id v17 = objc_claimAutoreleasedReturnValue();
    v21 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v23;

    v25 = NSString;
    v29 = objc_msgSend_containerIdentifier(v6, v26, v27, v28);
    objc_msgSend_stringWithFormat_(v25, v30, @"%@.%@", v31, @"com.apple.cloudkit.datarepair.callback", v29);
    id v32 = objc_claimAutoreleasedReturnValue();
    v36 = (const char *)objc_msgSend_UTF8String(v32, v33, v34, v35);
    v37 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v38 = dispatch_queue_create(v36, v37);
    callbackQueue = v12->_callbackQueue;
    v12->_callbackQueue = (OS_dispatch_queue *)v38;

    dispatch_queue_set_specific((dispatch_queue_t)v12->_internalQueue, &v12->_internalQueue, (void *)1, 0);
    dispatch_queue_set_specific((dispatch_queue_t)v12->_callbackQueue, &v12->_callbackQueue, (void *)1, 0);
    v40 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    requestOperationQueue = v12->_requestOperationQueue;
    v12->_requestOperationQueue = v40;

    objc_msgSend_setName_(v12->_requestOperationQueue, v42, @"com.apple.cloudkit.datarepair.request", v43);
    objc_msgSend_setQualityOfService_(v12->_requestOperationQueue, v44, 25, v45);
    v46 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    uploadOperationQueue = v12->_uploadOperationQueue;
    v12->_uploadOperationQueue = v46;

    objc_msgSend_setName_(v12->_uploadOperationQueue, v48, @"com.apple.cloudkit.datarepair.upload", v49);
    objc_msgSend_setQualityOfService_(v12->_uploadOperationQueue, v50, 25, v51);
    objc_msgSend_setMaxConcurrentOperationCount_(v12->_uploadOperationQueue, v52, 1, v53);
    objc_storeWeak((id *)&v12->_container, v6);
    uint64_t v57 = objc_msgSend_copy(v7, v54, v55, v56);
    repairContainerOverrides = v12->_repairContainerOverrides;
    v12->_repairContainerOverrides = (CKUploadRequestConfiguration *)v57;

    uint64_t v62 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v59, v60, v61);
    remainingAssetsToRequestCallbacks = v12->_remainingAssetsToRequestCallbacks;
    v12->_remainingAssetsToRequestCallbacks = (NSMutableDictionary *)v62;

    uint64_t v67 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v64, v65, v66);
    assetCache = v12->_assetCache;
    v12->_assetCache = (NSMutableDictionary *)v67;

    uint64_t v72 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v69, v70, v71);
    confirmedMissingAssets = v12->_confirmedMissingAssets;
    v12->_confirmedMissingAssets = (NSMutableSet *)v72;

    uint64_t v77 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v74, v75, v76);
    assetsBeingRequested = v12->_assetsBeingRequested;
    v12->_assetsBeingRequested = (NSMutableSet *)v77;

    uint64_t v82 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v79, v80, v81);
    assetsBeingUploaded = v12->_assetsBeingUploaded;
    v12->_assetsBeingUploaded = (NSMutableSet *)v82;

    uint64_t v87 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v84, v85, v86);
    retryCountForAssets = v12->_retryCountForAssets;
    v12->_retryCountForAssets = (NSMutableDictionary *)v87;

    objc_msgSend_clearAssetCache(v12, v89, v90, v91);
  }

  return v12;
}

- (void)addUploadRequestsWithMetadata:(id)a3 requestBlocks:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_18AF10000, "client/data-repair-add-to-scheduler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v12 = objc_msgSend_count(v6, v9, v10, v11);
  if (v12 != objc_msgSend_count(v7, v13, v14, v15))
  {
    v22 = [CKException alloc];
    id v24 = (id)objc_msgSend_initWithName_format_(v22, v23, *MEMORY[0x1E4F1C3C8], @"Arrays must have the same number of elements");
    objc_exception_throw(v24);
  }
  if (objc_msgSend_count(v6, v16, v17, v18))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v19 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v6;
      _os_log_debug_impl(&dword_18AF10000, v19, OS_LOG_TYPE_DEBUG, "Adding upload requests: %@", buf, 0xCu);
      if (self) {
        goto LABEL_7;
      }
    }
    else if (self)
    {
LABEL_7:
      internalQueue = self->_internalQueue;
LABEL_8:
      v21 = internalQueue;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_18B0E5BC0;
      v25[3] = &unk_1E54614E0;
      id v26 = v6;
      id v27 = v7;
      uint64_t v28 = self;
      ck_call_or_dispatch_sync_if_not_key(v21, &self->_internalQueue, v25);

      goto LABEL_9;
    }
    internalQueue = 0;
    goto LABEL_8;
  }
LABEL_9:
  os_activity_scope_leave(&state);
}

- (void)removeUploadRequestWithRecordID:(id)a3
{
  id v4 = a3;
  objc_super v5 = _os_activity_create(&dword_18AF10000, "client/data-repair-remove-from-scheduler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (v4)
  {
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    id v7 = internalQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_18B0E5F08;
    v8[3] = &unk_1E5461F80;
    v8[4] = self;
    id v9 = v4;
    ck_call_or_dispatch_sync_if_not_key(v7, &self->_internalQueue, v8);
  }
  os_activity_scope_leave(&state);
}

- (void)tickle
{
}

- (void)clearAssetCache
{
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_18B0E9618;
  v3[3] = &unk_1E5460350;
  v3[4] = self;
  ck_call_or_dispatch_sync_if_not_key(internalQueue, &self->_internalQueue, v3);
}

- (void)cancelAllOperations
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/data-repair-cancel-scheduler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  sub_18B0E6784((uint64_t)self, 3, 0);
  os_activity_scope_leave(&v4);
}

- (id)clonedAsset:(id)a3 withError:(id *)a4
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v10 = objc_msgSend_temporaryAssetDirectory(self, v6, v7, v8);

  if (!v10) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v48 = v9;
      id v137 = 0;
      uint64_t v19 = objc_msgSend_packageWithError_(CKPackage, v49, (uint64_t)&v137, v50);
      id v51 = v137;
      if (v51)
      {
        id v46 = v51;
        if (a4)
        {
          id v46 = v51;
          id v47 = 0;
          *a4 = v46;
        }
        else
        {
          id v47 = 0;
        }
        goto LABEL_17;
      }
      v127 = a4;
      id v128 = v9;
      v130 = v19;
      id v136 = 0;
      uint64_t v58 = objc_msgSend_itemCountWithError_(v48, v52, (uint64_t)&v136, v53);
      id v59 = v136;
      id v63 = v59;
      uint64_t v129 = v58;
      if (v58)
      {
        uint64_t v64 = 0;
        while (1)
        {
          id v65 = v48;
          uint64_t v66 = objc_msgSend_itemAtIndex_(v48, v60, v64, v62);
          uint64_t v70 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v67, v68, v69);
          v74 = objc_msgSend_UUIDString(v70, v71, v72, v73);

          v78 = objc_msgSend_temporaryAssetDirectory(self, v75, v76, v77);
          uint64_t v80 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v78, v79, (uint64_t)v74, 0);

          uint64_t v81 = objc_opt_class();
          uint64_t v85 = objc_msgSend_fileURL(v66, v82, v83, v84);
          v89 = objc_msgSend_temporaryAssetDirectory(self, v86, v87, v88);
          uint64_t canCopyFromFileURL_toDirectoryURL = objc_msgSend_canCopyFromFileURL_toDirectoryURL_(v81, v90, (uint64_t)v85, (uint64_t)v89);

          if (canCopyFromFileURL_toDirectoryURL)
          {
            v95 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v92, v93, v94);
            v99 = objc_msgSend_fileURL(v66, v96, v97, v98);
            id v135 = v63;
            objc_msgSend_copyItemAtURL_toURL_error_(v95, v100, (uint64_t)v99, (uint64_t)v80, &v135);
            id v101 = v135;

            id v63 = v95;
          }
          else
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v92, @"CKErrorDomain", 10001, @"Not enough space left on device to attempt asset clone");
            id v101 = (id)objc_claimAutoreleasedReturnValue();
          }

          if (v101) {
            break;
          }
          v102 = [CKPackageItem alloc];
          v105 = objc_msgSend_initWithFileURL_(v102, v103, (uint64_t)v80, v104);
          objc_msgSend_addItem_(v130, v106, (uint64_t)v105, v107);

          id v63 = 0;
          ++v64;
          id v48 = v65;
          if (v129 == v64) {
            goto LABEL_31;
          }
        }

        id v63 = v101;
      }
      else if (!v59)
      {
LABEL_31:
        uint64_t v19 = v130;
        id v47 = v130;
        id v63 = 0;
        id v9 = v128;
LABEL_43:

        id v46 = 0;
        goto LABEL_17;
      }
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      uint64_t v19 = v130;
      v108 = objc_msgSend_itemEnumerator(v130, v60, v61, v62);
      uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v109, (uint64_t)&v131, (uint64_t)v139, 16);
      if (v110)
      {
        uint64_t v114 = v110;
        uint64_t v115 = *(void *)v132;
        do
        {
          for (uint64_t i = 0; i != v114; ++i)
          {
            if (*(void *)v132 != v115) {
              objc_enumerationMutation(v108);
            }
            v117 = *(void **)(*((void *)&v131 + 1) + 8 * i);
            v118 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v111, v112, v113);
            v122 = objc_msgSend_fileURL(v117, v119, v120, v121);
            objc_msgSend_removeItemAtURL_error_(v118, v123, (uint64_t)v122, 0);
          }
          uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v111, (uint64_t)&v131, (uint64_t)v139, 16);
        }
        while (v114);
      }

      objc_msgSend_removeDB(v130, v124, v125, v126);
      id v9 = v128;
      if (v127)
      {
        id v63 = v63;
        id v47 = 0;
        id *v127 = v63;
      }
      else
      {
        id v47 = 0;
      }
      goto LABEL_43;
    }
LABEL_13:
    id v47 = 0;
    goto LABEL_18;
  }
  id v11 = v9;
  uint64_t v15 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v12, v13, v14);
  uint64_t v19 = objc_msgSend_UUIDString(v15, v16, v17, v18);

  dispatch_queue_t v23 = objc_msgSend_temporaryAssetDirectory(self, v20, v21, v22);
  v25 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v23, v24, (uint64_t)v19, 0);

  id v26 = objc_opt_class();
  v30 = objc_msgSend_fileURL(v11, v27, v28, v29);
  uint64_t v34 = objc_msgSend_temporaryAssetDirectory(self, v31, v32, v33);
  uint64_t v36 = objc_msgSend_canCopyFromFileURL_toDirectoryURL_(v26, v35, (uint64_t)v30, (uint64_t)v34);

  if (v36)
  {
    v40 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v37, v38, v39);
    v44 = objc_msgSend_fileURL(v11, v41, v42, v43);
    id v138 = 0;
    objc_msgSend_copyItemAtURL_toURL_error_(v40, v45, (uint64_t)v44, (uint64_t)v25, &v138);
    id v46 = v138;

    if (v46) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v37, @"CKErrorDomain", 10001, @"Not enough space left on device to attempt asset clone");
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
LABEL_7:
      id v47 = 0;
      if (a4) {
        *a4 = v46;
      }
      goto LABEL_16;
    }
  }
  v54 = [CKAsset alloc];
  id v47 = (id)objc_msgSend_initWithFileURL_(v54, v55, (uint64_t)v25, v56);
LABEL_16:

LABEL_17:
LABEL_18:

  return v47;
}

- (BOOL)hasPendingWork
{
  objc_super v5 = objc_msgSend_allRemainingRequestableAssets(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_allRemainingUploadableAssets(self, v10, v11, v12);
  LOBYTE(v9) = v9 + objc_msgSend_count(v13, v14, v15, v16) != 0;

  return v9;
}

- (id)allRemainingRequestableAssets
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_18AF13EA8;
  uint64_t v12 = sub_18AF13918;
  id v13 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  os_activity_scope_state_s v4 = internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B0EA9BC;
  v7[3] = &unk_1E5464310;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_internalQueue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)allRemainingUploadableAssets
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_18AF13EA8;
  uint64_t v12 = sub_18AF13918;
  id v13 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  os_activity_scope_state_s v4 = internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B0EABAC;
  v7[3] = &unk_1E5464310;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_internalQueue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSURL)temporaryAssetDirectory
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_18AF13EA8;
  uint64_t v12 = sub_18AF13918;
  id v13 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  os_activity_scope_state_s v4 = internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B0EAF34;
  v7[3] = &unk_1E5464310;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_internalQueue, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSURL *)v5;
}

+ (int64_t)estimatedSizeForAssetOrPackage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64_t v10 = 0;
      goto LABEL_9;
    }
    if (!objc_msgSend_hasSize(v3, v11, v12, v13))
    {
      self;
      self;
      int64_t v10 = 2048000;
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (objc_msgSend_hasSize(v3, v4, v5, v6))
  {
LABEL_6:
    int64_t v10 = objc_msgSend_size(v3, v7, v8, v9);
    goto LABEL_9;
  }
  int64_t v10 = 102400;
  self;
LABEL_9:

  return v10;
}

+ (int64_t)canCopyFromFileURL:(id)a3 toDirectoryURL:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v54 = 0;
  uint64_t v8 = *MEMORY[0x1E4F1C820];
  id v53 = 0;
  objc_msgSend_getResourceValue_forKey_error_(v6, v9, (uint64_t)&v54, v8, &v53);
  id v10 = v54;
  id v51 = 0;
  id v52 = 0;
  id v11 = v53;
  objc_msgSend_getResourceValue_forKey_error_(v7, v12, (uint64_t)&v52, v8, &v51);
  id v13 = v52;
  id v14 = v51;

  int v17 = 0;
  if (v10 && v13)
  {
    if (objc_msgSend_isEqual_(v10, v15, (uint64_t)v13, v16))
    {
      id v50 = 0;
      uint64_t v19 = *MEMORY[0x1E4F1C8E8];
      id v49 = 0;
      objc_msgSend_getResourceValue_forKey_error_(v6, v18, (uint64_t)&v50, v19, &v49);
      id v20 = v50;
      id v21 = v49;

      if (v20) {
        int v17 = objc_msgSend_BOOLValue(v20, v22, v23, v24);
      }
      else {
        int v17 = 0;
      }

      id v14 = v21;
    }
    else
    {
      int v17 = 0;
    }
  }

  id v48 = 0;
  unint64_t v26 = objc_msgSend_remainingCapacityAtURL_error_(a1, v25, (uint64_t)v7, (uint64_t)&v48);
  id v27 = v48;
  if (v27)
  {
    id v29 = v27;
    int64_t v30 = -1;
LABEL_11:
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v31 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v29;
      _os_log_error_impl(&dword_18AF10000, v31, OS_LOG_TYPE_ERROR, "Error determining clonability of repair asset: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (v17)
  {
    self;
    if (v26 >> 22 <= 0x7C)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v45 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v56 = v6;
        __int16 v57 = 2112;
        id v58 = v7;
        __int16 v59 = 2048;
        unint64_t v60 = v26;
        _os_log_impl(&dword_18AF10000, v45, OS_LOG_TYPE_INFO, "Cannot clone repair asset from %@: destination %@ has limited capacity: %ld", buf, 0x20u);
      }
      int64_t v30 = 0;
      id v29 = 0;
    }
    else
    {
      id v29 = 0;
      int64_t v30 = 1;
    }
  }
  else
  {
    id v47 = 0;
    uint64_t v33 = *MEMORY[0x1E4F1C5F8];
    id v46 = 0;
    objc_msgSend_getResourceValue_forKey_error_(v6, v28, (uint64_t)&v47, v33, &v46);
    id v34 = v47;
    id v29 = v46;
    if (v34)
    {
      uint64_t v38 = objc_msgSend_unsignedIntegerValue(v34, v35, v36, v37);
      self;
      if (v26 >= v38 + 524288000)
      {
        int64_t v30 = 1;
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v39 = (void *)ck_log_facility_data_repair;
        if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
        {
          v40 = v39;
          uint64_t v44 = objc_msgSend_longValue(v34, v41, v42, v43);
          *(_DWORD *)buf = 138413058;
          id v56 = v6;
          __int16 v57 = 2112;
          id v58 = v7;
          __int16 v59 = 2048;
          unint64_t v60 = v26;
          __int16 v61 = 2048;
          uint64_t v62 = v44;
          _os_log_impl(&dword_18AF10000, v40, OS_LOG_TYPE_INFO, "Cannot copy repair asset from %@: destination %@ has limited capacity: %ld (source size %ld)", buf, 0x2Au);
        }
        int64_t v30 = 0;
      }
    }
    else
    {
      int64_t v30 = -1;
    }

    if (v29) {
      goto LABEL_11;
    }
  }
LABEL_15:

  return v30;
}

+ (unint64_t)remainingCapacityAtURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  id v10 = objc_msgSend_defaultManager(v5, v7, v8, v9);
  id v14 = objc_msgSend_path(v6, v11, v12, v13);

  id v27 = 0;
  uint64_t v16 = objc_msgSend_attributesOfFileSystemForPath_error_(v10, v15, (uint64_t)v14, (uint64_t)&v27);
  id v17 = v27;

  id v20 = objc_msgSend_objectForKey_(v16, v18, *MEMORY[0x1E4F283A0], v19);
  uint64_t v24 = v20;
  if (a4 && v17)
  {
    unint64_t v25 = 0;
    *a4 = v17;
  }
  else if (v17)
  {
    unint64_t v25 = 0;
  }
  else
  {
    unint64_t v25 = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23);
  }

  return v25;
}

- (CKAssetRepairSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAssetRepairSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setRequestTimeout:(double)a3
{
  self->_requestTimeout = a3;
}

- (void)setRepairBatchCountLimit:(int64_t)a3
{
  self->_repairBatchCountLimit = a3;
}

- (void)setCacheCountLimit:(int64_t)a3
{
  self->_cacheCountLimit = a3;
}

- (void)setDefaultSuspensionTime:(double)a3
{
  self->_defaultSuspensionTime = a3;
}

- (void)setRepairRetryCount:(int64_t)a3
{
  self->_repairRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCountForAssets, 0);
  objc_storeStrong((id *)&self->_uploadSuspensionTimer, 0);
  objc_storeStrong((id *)&self->_uploadPendingRequestTimer, 0);
  objc_storeStrong((id *)&self->_uploadOperationQueue, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_repairContainerOverrides, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_temporaryAssetDirectory, 0);
  objc_storeStrong((id *)&self->_assetsBeingUploaded, 0);
  objc_storeStrong((id *)&self->_assetsBeingRequested, 0);
  objc_storeStrong((id *)&self->_confirmedMissingAssets, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);

  objc_storeStrong((id *)&self->_remainingAssetsToRequestCallbacks, 0);
}

@end