@interface CKDDownloadAssetsOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)_download;
- (BOOL)_postProcess;
- (BOOL)_prepareForDownload;
- (BOOL)makeStateTransition;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldDownloadAssetFromTranscoder:(id)a3;
- (BOOL)supportsClearAssetEncryption;
- (CKDCancelTokenGroup)cancelTokens;
- (CKDDownloadAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDMMCS)mmcs;
- (NSArray)MMCSItemsToDownload;
- (NSArray)MMCSItemsToDownloadInMemory;
- (NSArray)assetURLInfosToFillOut;
- (NSArray)assetsToDownload;
- (NSArray)assetsToDownloadInMemory;
- (NSMapTable)downloadTasksByPackages;
- (NSMutableArray)assetsToDownloadFromTranscoder;
- (NSMutableArray)assetsToDownloadFromTranscoderInMemory;
- (NSMutableDictionary)keyOrErrorForHostname;
- (OS_dispatch_queue)queue;
- (id)CKStatusReportLogGroups;
- (id)_tryToFillInTheDerivativeTemplateWithAsset:(id)a3;
- (id)activityCreate;
- (id)downloadCommandBlock;
- (id)downloadCompletionBlock;
- (id)downloadPreparationBlock;
- (id)downloadProgressBlock;
- (id)urlFilledOutBlock;
- (unint64_t)maxPackageDownloadsPerBatch;
- (void)_collectMetricsFromCompletedItemGroup:(id)a3;
- (void)_collectMetricsFromCompletedItemGroupSet:(id)a3;
- (void)_collectMetricsFromMMCSOperationMetrics:(id)a3;
- (void)_didCommandForAsset:(id)a3 command:(id)a4;
- (void)_didCommandForMMCSItem:(id)a3 command:(id)a4;
- (void)_didDownloadAsset:(id)a3 error:(id)a4;
- (void)_didDownloadMMCSItem:(id)a3 inMemory:(BOOL)a4 error:(id)a5;
- (void)_didDownloadMMCSItems:(id)a3 inMemory:(BOOL)a4 error:(id)a5;
- (void)_didDownloadMMCSSectionItem:(id)a3 task:(id)a4 error:(id)a5;
- (void)_didDownloadMMCSSectionItems:(id)a3 task:(id)a4 error:(id)a5;
- (void)_didMakeProgressForAsset:(id)a3 progress:(double)a4;
- (void)_didMakeProgressForMMCSItem:(id)a3 inMemory:(BOOL)a4;
- (void)_didMakeProgressForMMCSSectionItem:(id)a3 task:(id)a4;
- (void)_didPrepareAsset:(id)a3;
- (void)_downloadMMCSItems:(id)a3 downloadTasksByPackages:(id)a4 shouldFetchAssetContentInMemory:(BOOL)a5;
- (void)_downloadPackageSectionAtIndex:(int64_t)a3 task:(id)a4 completionBlock:(id)a5;
- (void)_downloadPackageSectionsWithPendingTasks:(id)a3 downloadingTasks:(id)a4 completedTasks:(id)a5;
- (void)_downloadPackageSectionsWithSectionEnumerator:(id)a3 task:(id)a4 completionBlock:(id)a5;
- (void)_downloadPackageSectionsWithTask:(id)a3 completionBlock:(id)a4;
- (void)_downloadTranscodedAsset:(id)a3 inMemory:(BOOL)a4;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_prepareAssetForDownload:(id)a3;
- (void)_preparePackageForDataDownload:(id)a3;
- (void)_preparePackageForDownload:(id)a3;
- (void)_preparePackageForMetadataDownload:(id)a3;
- (void)_removeUntrackedMMCSItems:(id)a3;
- (void)cancel;
- (void)main;
- (void)setAssetURLInfosToFillOut:(id)a3;
- (void)setAssetsToDownload:(id)a3;
- (void)setAssetsToDownloadFromTranscoder:(id)a3;
- (void)setAssetsToDownloadFromTranscoderInMemory:(id)a3;
- (void)setAssetsToDownloadInMemory:(id)a3;
- (void)setCancelTokens:(id)a3;
- (void)setDownloadCommandBlock:(id)a3;
- (void)setDownloadCompletionBlock:(id)a3;
- (void)setDownloadPreparationBlock:(id)a3;
- (void)setDownloadProgressBlock:(id)a3;
- (void)setDownloadTasksByPackages:(id)a3;
- (void)setKeyOrErrorForHostname:(id)a3;
- (void)setMMCSItemsToDownload:(id)a3;
- (void)setMMCSItemsToDownloadInMemory:(id)a3;
- (void)setMaxPackageDownloadsPerBatch:(unint64_t)a3;
- (void)setMmcs:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setUrlFilledOutBlock:(id)a3;
@end

@implementation CKDDownloadAssetsOperation

- (CKDDownloadAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKDDownloadAssetsOperation;
  v7 = [(CKDDatabaseOperation *)&v32 initWithOperationInfo:v6 container:a4];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_qos_class_t v11 = objc_msgSend_QOSClass(v7, v9, v10);
    v12 = dispatch_queue_attr_make_with_qos_class(v8, v11, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.cloudkit.download", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(CKDCancelTokenGroup);
    cancelTokens = v7->_cancelTokens;
    v7->_cancelTokens = v15;

    uint64_t v19 = objc_msgSend_assetsToDownload(v6, v17, v18);
    assetsToDownload = v7->_assetsToDownload;
    v7->_assetsToDownload = (NSArray *)v19;

    uint64_t v23 = objc_msgSend_assetsToDownloadInMemory(v6, v21, v22);
    assetsToDownloadInMemory = v7->_assetsToDownloadInMemory;
    v7->_assetsToDownloadInMemory = (NSArray *)v23;

    uint64_t v27 = objc_msgSend_assetURLInfosToFillOut(v6, v25, v26);
    assetURLInfosToFillOut = v7->_assetURLInfosToFillOut;
    v7->_assetURLInfosToFillOut = (NSArray *)v27;

    v7->_shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v6, v29, v30);
  }

  return v7;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/download-assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (id)CKStatusReportLogGroups
{
  v18.receiver = self;
  v18.super_class = (Class)CKDDownloadAssetsOperation;
  v3 = [(CKDOperation *)&v18 CKStatusReportLogGroups];
  p_prepareLock = &self->_prepareLock;
  if (os_unfair_lock_trylock(&self->_prepareLock))
  {
    if (!v3) {
      v3 = objc_opt_new();
    }
    v7 = objc_msgSend_MMCSItemsToDownload(self, v5, v6);
    v9 = objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1F20432D0);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, @"MMCS Items");

    dispatch_queue_t v13 = objc_msgSend_MMCSItemsToDownloadInMemory(self, v11, v12);
    v15 = objc_msgSend_CKMap_(v13, v14, (uint64_t)&unk_1F20432F0);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, @"MMCS In Memory Items");

    os_unfair_lock_unlock(p_prepareLock);
  }
  return v3;
}

- (BOOL)makeStateTransition
{
  v4 = objc_msgSend_cancelTokens(self, a2, v2);
  objc_msgSend_removeAllCancelTokens(v4, v5, v6);

  switch(objc_msgSend_state(self, v7, v8))
  {
    case 1:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_setState_(self, v11, 2);
      BOOL result = MEMORY[0x1F4181798](self, sel__prepareForDownload, v12);
      break;
    case 2:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_hash(self, v13, v14);
      kdebug_trace();
      objc_msgSend_setState_(self, v15, 3);
      BOOL result = MEMORY[0x1F4181798](self, sel__download, v16);
      break;
    case 3:
      objc_msgSend_setState_(self, v9, 4);
      BOOL result = MEMORY[0x1F4181798](self, sel__postProcess, v17);
      break;
    case 4:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_setState_(self, v18, 0xFFFFFFFFLL);
      v21 = objc_msgSend_error(self, v19, v20);
      objc_msgSend_finishWithError_(self, v22, (uint64_t)v21);

      goto LABEL_12;
    default:
LABEL_12:
      BOOL result = 1;
      break;
  }
  return result;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDDownloadAssetsOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F39E8[a3 - 2];
  }
  return v3;
}

- (void)_removeUntrackedMMCSItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v21, v25, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v3);
        }
        dispatch_qos_class_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend_fileURL(v11, v6, v7);
        if (v12)
        {
          dispatch_queue_t v13 = (void *)v12;
          uint64_t v14 = objc_msgSend_trackingUUID(v11, v6, v7);

          if (!v14)
          {
            v15 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v6, v7);
            objc_super v18 = objc_msgSend_fileURL(v11, v16, v17);
            objc_msgSend_removeItemAtURL_error_(v15, v19, (uint64_t)v18, 0);

            objc_msgSend_setFileURL_(v11, v20, 0);
          }
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v21, v25, 16);
    }
    while (v8);
  }
}

- (void)_didPrepareAsset:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 267, @"Expected non-nil asset for %@", self);
  }
  uint64_t v8 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E06634;
  block[3] = &unk_1E64F0948;
  block[4] = self;
  id v13 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)_didMakeProgressForAsset:(id)a3 progress:(double)a4
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 275, @"Expected non-nil asset for %@", self);
  }
  uint64_t v10 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E067C4;
  block[3] = &unk_1E64F19C0;
  block[4] = self;
  id v15 = v9;
  double v16 = a4;
  id v11 = v9;
  dispatch_async(v10, block);
}

- (void)_didCommandForAsset:(id)a3 command:(id)a4
{
  id v7 = a3;
  id v10 = a4;
  if (!v7)
  {
    v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 283, @"Expected non-nil asset for %@", self);
  }
  id v11 = v7;
  uint64_t v14 = objc_msgSend_mutableCopy(v10, v12, v13);
  uint64_t v17 = objc_msgSend_recordKey(v11, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v14, v18, (uint64_t)v17, @"RecordKey");

  uint64_t v19 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v22 = objc_msgSend_arrayIndex(v11, v20, v21);
  long long v24 = objc_msgSend_numberWithInteger_(v19, v23, v22);
  objc_msgSend_setObject_forKeyedSubscript_(v14, v25, (uint64_t)v24, @"ArrayIndex");

  v28 = objc_msgSend_callbackQueue(self, v26, v27);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E069FC;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v34 = v11;
  id v35 = v14;
  id v29 = v14;
  id v30 = v11;
  dispatch_async(v28, block);
}

- (void)_didDownloadAsset:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v10 = a4;
  if (!v7)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 294, @"Expected non-nil asset for %@", self);
  }
  id v11 = objc_msgSend_callbackQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E06BA8;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v17 = v7;
  id v18 = v10;
  id v12 = v10;
  id v13 = v7;
  dispatch_async(v11, block);
}

- (id)_tryToFillInTheDerivativeTemplateWithAsset:(id)a3
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_deviceContext(self, v5, v6);
  id v10 = objc_msgSend_accountDataSecurityObserver(v7, v8, v9);
  id v13 = objc_msgSend_container(self, v11, v12);
  uint64_t v16 = objc_msgSend_account(v13, v14, v15);
  int v18 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v10, v17, (uint64_t)v16, 1);

  if (v18)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, *MEMORY[0x1E4F19DD8], 5013, @"Cannot fill in derivative template due to walrus enabled for asset %@", v4);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F19E50];
  long long v23 = objc_msgSend_constructedAssetDownloadURLTemplate(v4, v19, v20);
  v25 = objc_msgSend__canonicalizeTemplateURL_(v22, v24, (uint64_t)v23);

  uint64_t v27 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E4F29088], v26, (uint64_t)v25, 0);
  v28 = NSString;
  v31 = objc_msgSend_percentEncodedPath(v27, v29, v30);
  id v34 = objc_msgSend_percentEncodedQuery(v27, v32, v33);
  uint64_t v36 = objc_msgSend_stringWithFormat_(v28, v35, @"%@?%@", v31, v34);

  v39 = objc_msgSend_host(v25, v37, v38);
  v40 = (void *)MEMORY[0x1E4F19E50];
  v43 = objc_msgSend_constructedAssetDownloadURLTemplate(v4, v41, v42);
  LOBYTE(v40) = objc_msgSend__templateURLRequiresAssetKey_(v40, v44, (uint64_t)v43);

  v47 = (os_log_t *)MEMORY[0x1E4F1A500];
  v132 = (void *)v36;
  if ((v40 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v63 = v47;
    os_log_t v64 = *v47;
    if (os_log_type_enabled(*v47, OS_LOG_TYPE_DEBUG))
    {
      v94 = v64;
      v97 = objc_msgSend_signature(v4, v95, v96);
      *(_DWORD *)buf = 138412290;
      v138 = v97;
      _os_log_debug_impl(&dword_1C4CFF000, v94, OS_LOG_TYPE_DEBUG, "Not filling in key for constructed asset URL template for asset %@ because it doesn't require a key", buf, 0xCu);

      v63 = v47;
    }
    v67 = 0;
    v68 = 0;
    goto LABEL_40;
  }
  if (!v39)
  {
    v69 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v45, *MEMORY[0x1E4F19DD8], 1000, @"asset %@ has constructedAssetDownloadURLTemplate but cannot parse out host string", v4);
    v68 = 0;
    v67 = 0;
    v63 = v47;
    if (v69) {
      goto LABEL_54;
    }
LABEL_40:
    uint64_t v134 = (uint64_t)v68;
    v99 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v65, v66);
    objc_msgSend_setObject_forKeyedSubscript_(v99, v100, (uint64_t)&stru_1F2044F30, @"f");
    if (v67) {
      objc_msgSend_setObject_forKeyedSubscript_(v99, v101, (uint64_t)v67, @"uk");
    }
    v103 = (void *)MEMORY[0x1E4F19E50];
    v104 = objc_msgSend_constructedAssetDownloadURLTemplate(v4, v101, v102);
    v106 = objc_msgSend__expandTemplateURL_fieldValues_(v103, v105, (uint64_t)v104, v99);

    if (v134)
    {
      uint64_t v108 = objc_msgSend_stringByAppendingString_(v106, v107, v134);

      v106 = (void *)v108;
    }
    v109 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v107, (uint64_t)v106);
    objc_msgSend_setConstructedAssetDownloadURL_(v4, v110, (uint64_t)v109);

    v113 = objc_msgSend_constructedAssetDownloadURL(v4, v111, v112);

    if (v113)
    {
      v69 = 0;
    }
    else
    {
      v69 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v114, *MEMORY[0x1E4F19DD8], 1, @"Couldn't create asset download URL from template");
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v115 = *v63;
      if (!os_log_type_enabled(*v63, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      v125 = v115;
      v131 = objc_msgSend_constructedAssetDownloadURLTemplate(v4, v126, v127);
      *(_DWORD *)buf = 138543362;
      v138 = v131;
      _os_log_error_impl(&dword_1C4CFF000, v125, OS_LOG_TYPE_ERROR, "Couldn't create asset download URL from template %{public}@", buf, 0xCu);
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
LABEL_51:
    os_log_t v116 = *v63;
    if (os_log_type_enabled(*v63, OS_LOG_TYPE_INFO))
    {
      v117 = v116;
      objc_msgSend_constructedAssetDownloadURLTemplate(v4, v118, v119);
      v120 = v27;
      v121 = v25;
      v123 = v122 = v39;
      *(_DWORD *)buf = 138543362;
      v138 = v123;
      _os_log_impl(&dword_1C4CFF000, v117, OS_LOG_TYPE_INFO, "constructedAssetDownloadURL %{public}@", buf, 0xCu);

      v39 = v122;
      v25 = v121;
      uint64_t v27 = v120;
    }
    v68 = (void *)v134;
    goto LABEL_54;
  }
  v48 = objc_msgSend_keyOrErrorForHostname(self, v45, v46);
  v50 = objc_msgSend_objectForKeyedSubscript_(v48, v49, (uint64_t)v39);

  if (!v50)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v51, *MEMORY[0x1E4F19DD8], 1000, @"no public cert result for host %@ asset %@", v39, v4);
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v71 = v50;
LABEL_29:
      v69 = v71;
      v68 = 0;
      v67 = 0;
      v63 = v47;
      goto LABEL_39;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v70, *MEMORY[0x1E4F19DD8], 1000, @"unknown public cert result for host %@ asset %@", v39, v4);
LABEL_28:
    id v71 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  id v52 = v50;
  v130 = v52;
  if (objc_msgSend_useEncryption(self, v53, v54))
  {
    v57 = objc_msgSend_assetKey(v4, v55, v56);

    if (v57)
    {
      uint64_t v60 = objc_msgSend_assetKey(v4, v58, v59);
      v63 = v47;
      goto LABEL_23;
    }
    v63 = v47;
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v58, *MEMORY[0x1E4F19DD8], 1000, @"expected assetKey for asset %@", v4);
  }
  else
  {
    if (!objc_msgSend_useClearAssetEncryption(self, v55, v56)) {
      goto LABEL_59;
    }
    v63 = v47;
    v74 = objc_msgSend_clearAssetKey(v4, v72, v73);

    if (v74)
    {
      uint64_t v60 = objc_msgSend_clearAssetKey(v4, v75, v76);
LABEL_23:
      v128 = (void *)v60;
      if (v60)
      {
        v129 = v39;
        v77 = NSString;
        objc_msgSend_publicKey(v52, v61, v62);
        v79 = v78 = v52;
        v82 = objc_msgSend_CKBase64URLSafeString(v79, v80, v81);
        uint64_t v84 = objc_msgSend_stringWithFormat_(v77, v83, @"&pk=%@", v82);

        v133 = (void *)v84;
        v86 = objc_msgSend_stringByAppendingString_(v132, v85, v84);

        id v135 = 0;
        id v136 = 0;
        v132 = v86;
        LODWORD(v79) = CKEncryptWithPublicKey(v78, v128, v86, &v136, &v135);
        id v87 = v136;
        id v88 = v135;
        v91 = v88;
        if (v79 && v87)
        {
          v67 = objc_msgSend_CKBase64URLSafeString(v87, v89, v90);
          v69 = 0;
        }
        else
        {
          id v92 = v88;
          if (!v92)
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v93, *MEMORY[0x1E4F19DD8], 1, @"Couldn't wrap asset key: no error");
            id v92 = (id)objc_claimAutoreleasedReturnValue();
          }
          v69 = v92;
          v67 = 0;
        }

        v39 = v129;
        v68 = v133;
        goto LABEL_38;
      }
LABEL_59:
      __assert_rtn("-[CKDDownloadAssetsOperation _tryToFillInTheDerivativeTemplateWithAsset:]", "CKDDownloadAssetsOperation.m", 345, "assetKey && \"assetKey expected\"");
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v75, *MEMORY[0x1E4F19DD8], 1000, @"expected clearAssetKey for asset %@", v4);
  uint64_t v98 = };
  if (!v98) {
    goto LABEL_59;
  }
  v69 = (void *)v98;
  v68 = 0;
  v67 = 0;
LABEL_38:

LABEL_39:
  if (!v69) {
    goto LABEL_40;
  }
LABEL_54:
  id v21 = v69;

LABEL_55:
  return v21;
}

- (void)_prepareAssetForDownload:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_signature(v5, v6, v7);

  if (v8)
  {
    if (!objc_msgSend_paddedFileSize(v5, v9, v10)
      || (objc_msgSend_authToken(v5, v11, v12), uint64_t v8 = objc_claimAutoreleasedReturnValue(), (id)v8, v8))
    {
      id v13 = objc_msgSend_container(self, v11, v12);
      uint64_t v8 = MEMORY[0x1E4F1A3B8];
      uint64_t v16 = objc_msgSend_signature(v5, v14, v15);
      LODWORD(v8) = objc_msgSend_isValidV2Signature_((void *)v8, v17, (uint64_t)v16);

      uint64_t v20 = objc_msgSend_options(v13, v18, v19);
      char v23 = objc_msgSend_mmcsEncryptionSupport(v20, v21, v22);

      if (v8)
      {
        uint64_t v26 = objc_msgSend_options(v13, v24, v25);
        uint64_t v29 = objc_msgSend_mmcsEncryptionSupport(v26, v27, v28) & 2 | v23 & 1;

        if (v29) {
          goto LABEL_11;
        }
      }
      else if (v23)
      {
        goto LABEL_11;
      }
      if (objc_msgSend_size(v5, v24, v25)
        || (objc_msgSend_signature(v5, v30, v31),
            objc_super v32 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_zeroSizeFileSignature(CKDMMCS, v33, v34),
            id v35 = objc_claimAutoreleasedReturnValue(),
            char isEqualToData = objc_msgSend_isEqualToData_(v32, v36, (uint64_t)v35),
            v35,
            v32,
            (isEqualToData & 1) == 0))
      {
        uint64_t v39 = *MEMORY[0x1E4F19DD8];
        if (v8) {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v30, v39, 1000, @"Inconsistent signature type for asset %@, Asset was %@, container does not support", v5, @"V2");
        }
        else {
        uint64_t v38 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v30, v39, 1000, @"Inconsistent signature type for asset %@, Asset was %@, container does not support", v5, @"V1");
        }
LABEL_16:

        if (!v38) {
          goto LABEL_17;
        }
LABEL_21:
        objc_msgSend_shouldDownloadAssetFromTranscoder_(self, v40, (uint64_t)v5);
        goto LABEL_22;
      }
LABEL_11:
      uint64_t v38 = 0;
      goto LABEL_16;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 1000, @"Missing download token for asset %@", v5);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v9, *MEMORY[0x1E4F19DD8], 1000, @"Missing signature for asset %@", v5);
  uint64_t v38 = };
  if (v38) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v42 = objc_msgSend_constructedAssetDownloadURLTemplate(v5, v40, v41);

  if (v42)
  {
    uint64_t v38 = objc_msgSend__tryToFillInTheDerivativeTemplateWithAsset_(self, v43, (uint64_t)v5);
  }
  else
  {
    uint64_t v38 = 0;
  }
  int shouldDownloadAssetFromTranscoder = objc_msgSend_shouldDownloadAssetFromTranscoder_(self, v43, (uint64_t)v5);
  int v48 = shouldDownloadAssetFromTranscoder;
  if (v38 || (shouldDownloadAssetFromTranscoder & 1) != 0) {
    goto LABEL_39;
  }
  if (!objc_msgSend_paddedFileSize(v5, v44, v47))
  {
    v49 = objc_msgSend_constructedAssetDownloadURLTemplate(v5, v44, v47);

    if (!v49)
    {
      uint64_t v50 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v44, v47);
      v53 = objc_msgSend_container(self, v51, v52);
      uint64_t v56 = objc_msgSend_MMCS(v53, v54, v55);

      uint64_t v59 = objc_msgSend_assetCache(v56, v57, v58);
      uint64_t v62 = objc_msgSend_signature(v5, v60, v61);
      v99 = (void *)v50;
      id v100 = 0;
      uint64_t v45 = objc_msgSend_trackDownloadedData_signature_error_(v59, v63, v50, v62, &v100);
      uint64_t v38 = (uint64_t)v100;

      if (!(v45 | v38))
      {
        v82 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v64, v65);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v82, v83, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 438, @"Expected non-nil error for asset %@", v5);

        if (v48) {
          goto LABEL_41;
        }
        goto LABEL_43;
      }
      if (v45)
      {
        uint64_t v66 = objc_msgSend_fileURL((void *)v45, v64, v65);
        objc_msgSend_setFileURL_(v5, v67, (uint64_t)v66);

        v70 = objc_msgSend_trackingUUID((void *)v45, v68, v69);
        objc_msgSend_setUUID_(v5, v71, (uint64_t)v70);

        objc_msgSend_setWasCached_(v5, v72, 1);
        if (!v38)
        {
          v74 = objc_msgSend_fileURL(v5, v44, v73);
          objc_msgSend_setDownloaded_(v5, v75, v74 != 0);

          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v76 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v102 = v5;
            _os_log_debug_impl(&dword_1C4CFF000, v76, OS_LOG_TYPE_DEBUG, "Returning asset from cache: %@", buf, 0xCu);
          }
          objc_msgSend__didPrepareAsset_(self, v77, (uint64_t)v5);
          objc_msgSend__didMakeProgressForAsset_progress_(self, v78, (uint64_t)v5, 1.0);
          objc_msgSend__didDownloadAsset_error_(self, v79, (uint64_t)v5, 0);
          goto LABEL_24;
        }
LABEL_23:
        objc_msgSend__didDownloadAsset_error_(self, v44, (uint64_t)v5, v38);

        goto LABEL_24;
      }

LABEL_39:
      if (!v38) {
        goto LABEL_40;
      }
LABEL_22:
      uint64_t v45 = 0;
      goto LABEL_23;
    }
  }
LABEL_40:
  if (v48)
  {
LABEL_41:
    v80 = objc_msgSend_assetsToDownloadFromTranscoder(self, v44, v47);
    objc_msgSend_addObject_(v80, v81, (uint64_t)v5);

    uint64_t v45 = 0;
    goto LABEL_24;
  }
LABEL_43:
  uint64_t v84 = [CKDMMCSItem alloc];
  uint64_t v45 = objc_msgSend_initWithAsset_(v84, v85, (uint64_t)v5);
  uint64_t v88 = objc_msgSend_paddedFileSize(v5, v86, v87);
  objc_msgSend_setPaddedFileSize_((void *)v45, v89, v88);
  if ((v8 & 1) == 0)
  {
    uint64_t v92 = objc_msgSend_size(v5, v90, v91);
    objc_msgSend_setFileSize_((void *)v45, v93, v92);
  }
  v94 = objc_msgSend_operationInfo(self, v90, v91);
  int v97 = objc_msgSend_usesAssetDownloadStagingManager(v94, v95, v96);

  if (v97) {
    objc_msgSend_setUsesAssetDownloadStagingManager_((void *)v45, v98, 1);
  }
  objc_msgSend_addObject_(self->_prepareMMCSItemsToDownload, v98, v45);
LABEL_24:
}

- (void)_preparePackageForDataDownload:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = objc_msgSend_assets(v4, v6, v7);
  uint64_t v11 = objc_msgSend_count(v8, v9, v10);
  id v13 = objc_msgSend_initWithCapacity_(v5, v12, v11);

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v16 = objc_msgSend_assets(v4, v14, v15);
  int v18 = (char *)objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v61, v65, 16);
  unint64_t v19 = 0x1E4F1A000uLL;
  uint64_t v20 = (uint64_t *)MEMORY[0x1E4F19DD8];
  if (v18)
  {
    uint64_t v59 = self;
    id v60 = v4;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v62;
    while (2)
    {
      long long v24 = 0;
      uint64_t v25 = &v22[(void)v18];
      do
      {
        if (*(void *)v62 != v23) {
          objc_enumerationMutation(v16);
        }
        uint64_t v26 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unint64_t v19 = 0x1E4F1A000uLL;
          uint64_t v20 = (uint64_t *)MEMORY[0x1E4F19DD8];
          id v4 = v60;
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, *MEMORY[0x1E4F19DD8], 1000, @"Invalid package manifest for package %@", v60);
          int v18 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = &v24[(void)v22];
          self = v59;
          goto LABEL_14;
        }
        if (&v24[(void)v22]) {
          objc_msgSend_addObject_(v13, v27, (uint64_t)v26);
        }
        v21 += objc_msgSend_size(v26, v27, v28);
        ++v24;
      }
      while (v18 != v24);
      int v18 = (char *)objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v29, (uint64_t)&v61, v65, 16);
      uint64_t v22 = v25;
      if (v18) {
        continue;
      }
      break;
    }
    self = v59;
    id v4 = v60;
    unint64_t v19 = 0x1E4F1A000;
    uint64_t v20 = (uint64_t *)MEMORY[0x1E4F19DD8];
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v25 = 0;
  }
LABEL_14:

  if (!v18 && !v25)
  {
    objc_msgSend_errorWithDomain_code_format_(*(void **)(v19 + 640), v30, *v20, 1000, @"No package manifest found for package %@", v4);
    int v18 = (char *)objc_claimAutoreleasedReturnValue();
  }
  if (v18)
  {
    objc_msgSend__didDownloadAsset_error_(self, v30, (uint64_t)v4, v18);
  }
  else
  {
    objc_msgSend_setSize_(v4, v30, v21);
    uint64_t v33 = objc_msgSend_assets(v4, v31, v32);
    uint64_t v36 = objc_msgSend_firstObject(v33, v34, v35);

    v37 = [CKDMMCSItem alloc];
    uint64_t v39 = objc_msgSend_initWithAsset_(v37, v38, (uint64_t)v36);
    uint64_t v42 = objc_msgSend_size(v36, v40, v41);
    objc_msgSend_setFileSize_(v39, v43, v42);
    objc_msgSend_setPackage_(v39, v44, (uint64_t)v4);
    objc_msgSend_setIsPackageManifest_(v39, v45, 1);
    objc_msgSend_addObject_(self->_prepareMMCSItemsToDownload, v46, (uint64_t)v39);
    uint64_t v47 = [CKPackageDownloadTask alloc];
    uint64_t v50 = objc_msgSend_downloadProgressBlock(self, v48, v49);
    uint64_t v52 = objc_msgSend_initWithPackage_trackProgress_(v47, v51, (uint64_t)v4, v50 != 0);

    objc_msgSend_setManifestAsset_(v52, v53, (uint64_t)v36);
    objc_msgSend_setSectionAssets_(v52, v54, (uint64_t)v13);
    v57 = objc_msgSend_downloadTasksByPackages(self, v55, v56);
    objc_msgSend_setObject_forKey_(v57, v58, (uint64_t)v52, v4);
  }
}

- (void)_preparePackageForMetadataDownload:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend_assets(a3, a2, (uint64_t)a3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, v15, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend__prepareAssetForDownload_(self, v7, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }
}

- (void)_preparePackageForDownload:(id)a3
{
  id v7 = a3;
  if (sub_1C4E07E88(self, v4, v5)) {
    objc_msgSend__preparePackageForMetadataDownload_(self, v6, (uint64_t)v7);
  }
  else {
    objc_msgSend__preparePackageForDataDownload_(self, v6, (uint64_t)v7);
  }
}

- (BOOL)_prepareForDownload
{
  uint64_t v206 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v163 = v3;
    v166 = objc_msgSend_assetsToDownload(self, v164, v165);
    v169 = objc_msgSend_assetsToDownloadInMemory(self, v167, v168);
    v172 = objc_msgSend_assetURLInfosToFillOut(self, v170, v171);
    v175 = objc_msgSend_operationID(self, v173, v174);
    *(_DWORD *)buf = 138413058;
    id v199 = v166;
    __int16 v200 = 2112;
    v201 = v169;
    __int16 v202 = 2112;
    v203 = v172;
    __int16 v204 = 2114;
    v205 = v175;
    _os_log_debug_impl(&dword_1C4CFF000, v163, OS_LOG_TYPE_DEBUG, "Downloading assets %@, in-memory assets %@, and publish assets %@ for operation %{public}@", buf, 0x2Au);
  }
  os_unfair_lock_lock(&self->_prepareLock);
  v184 = objc_msgSend_container(self, v4, v5);
  uint64_t v8 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v6, v7);
  objc_msgSend_setDownloadTasksByPackages_(self, v9, (uint64_t)v8);

  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  long long v13 = objc_msgSend_assetsToDownload(self, v11, v12);
  uint64_t v16 = objc_msgSend_count(v13, v14, v15);
  int v18 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v10, v17, v16);
  prepareMMCSItemsToDownload = self->_prepareMMCSItemsToDownload;
  self->_prepareMMCSItemsToDownload = v18;

  id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v23 = objc_msgSend_assetsToDownloadInMemory(self, v21, v22);
  uint64_t v26 = objc_msgSend_count(v23, v24, v25);
  uint64_t v28 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v20, v27, v26);
  prepareMMCSItemsToDownloadInMemory = self->_prepareMMCSItemsToDownloadInMemory;
  self->_prepareMMCSItemsToDownloadInMemory = v28;

  id v30 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v33 = objc_msgSend_assetsToDownload(self, v31, v32);
  uint64_t v36 = objc_msgSend_count(v33, v34, v35);
  v181 = objc_msgSend_initWithCapacity_(v30, v37, v36);

  id v38 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v41 = objc_msgSend_assetsToDownloadInMemory(self, v39, v40);
  uint64_t v44 = objc_msgSend_count(v41, v42, v43);
  v182 = objc_msgSend_initWithCapacity_(v38, v45, v44);

  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  int v48 = objc_msgSend_assetsToDownload(self, v46, v47);
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v190, v197, 16);
  if (v51)
  {
    uint64_t v52 = *(void *)v191;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v191 != v52) {
          objc_enumerationMutation(v48);
        }
        uint64_t v54 = *(void **)(*((void *)&v190 + 1) + 8 * i);
        id v55 = (id)objc_msgSend__prepareForDownloadWithOperation_(v54, v50, (uint64_t)self);
        objc_msgSend__didPrepareAsset_(self, v56, (uint64_t)v54);
      }
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v190, v197, 16);
    }
    while (v51);
  }

  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  uint64_t v59 = objc_msgSend_assetsToDownloadInMemory(self, v57, v58);
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v186, v196, 16);
  if (v61)
  {
    uint64_t v62 = *(void *)v187;
    uint64_t v183 = *MEMORY[0x1E4F19DD8];
    id obj = v59;
    do
    {
      uint64_t v63 = 0;
      do
      {
        if (*(void *)v187 != v62) {
          objc_enumerationMutation(obj);
        }
        long long v64 = *(void **)(*((void *)&v186 + 1) + 8 * v63);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v95 = 0;
          goto LABEL_50;
        }
        id v66 = v64;
        uint64_t v69 = objc_msgSend_signature(v66, v67, v68);
        BOOL v70 = v69 == 0;

        if (v70)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v71, v183, 1000, @"Missing signature for asset %@", v66);
          goto LABEL_33;
        }
        if (objc_msgSend_paddedFileSize(v66, v71, v72))
        {
          v75 = objc_msgSend_authToken(v66, v73, v74);
          BOOL v76 = v75 == 0;

          if (v76)
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v73, v183, 1000, @"Missing download token for asset %@", v66);
            goto LABEL_33;
          }
        }
        v77 = (void *)MEMORY[0x1E4F1A3B8];
        v78 = objc_msgSend_signature(v66, v73, v74);
        int isValidV2Signature = objc_msgSend_isValidV2Signature_(v77, v79, (uint64_t)v78);

        if (isValidV2Signature)
        {
          v83 = objc_msgSend_options(v184, v81, v82);
          char v86 = objc_msgSend_mmcsEncryptionSupport(v83, v84, v85);

          v89 = objc_msgSend_options(v184, v87, v88);
          unint64_t v92 = objc_msgSend_mmcsEncryptionSupport(v89, v90, v91);

          if ((v92 >> 1) & 1 | v86 & 1) {
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v96 = objc_msgSend_options(v184, v81, v82);
          BOOL v99 = (objc_msgSend_mmcsEncryptionSupport(v96, v97, v98) & 1) == 0;

          if (!v99) {
            goto LABEL_34;
          }
        }
        if (objc_msgSend_size(v66, v93, v94)
          || (objc_msgSend_signature(v66, v93, v100),
              v101 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_zeroSizeFileSignature(CKDMMCS, v102, v103),
              v104 = objc_claimAutoreleasedReturnValue(),
              char isEqualToData = objc_msgSend_isEqualToData_(v101, v105, (uint64_t)v104),
              v104,
              v101,
              (isEqualToData & 1) == 0))
        {
          if (isValidV2Signature) {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v93, v183, 1000, @"Inconsistent signature type for asset %@, Asset was %@, container does not support", v66, @"V2");
          }
          else {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v93, v183, 1000, @"Inconsistent signature type for asset %@, Asset was %@, container does not support", v66, @"V1");
          }
          v107 = LABEL_33:;
          if (v107) {
            goto LABEL_37;
          }
        }
LABEL_34:
        uint64_t v108 = objc_msgSend_constructedAssetDownloadURLTemplate(v66, v93, v94);
        BOOL v109 = v108 == 0;

        if (v109)
        {
          v107 = 0;
        }
        else
        {
          v107 = objc_msgSend__tryToFillInTheDerivativeTemplateWithAsset_(self, v93, (uint64_t)v66);
        }
LABEL_37:
        int shouldDownloadAssetFromTranscoder = objc_msgSend_shouldDownloadAssetFromTranscoder_(self, v93, (uint64_t)v66);
        int v113 = shouldDownloadAssetFromTranscoder;
        if (v107) {
          char v114 = 1;
        }
        else {
          char v114 = shouldDownloadAssetFromTranscoder;
        }
        if (v114)
        {
          if (v107)
          {
            objc_msgSend__didDownloadAsset_error_(self, v111, (uint64_t)v66, v107);
            v95 = 0;
LABEL_43:

            goto LABEL_51;
          }
        }
        else if (!objc_msgSend_paddedFileSize(v66, v111, v112))
        {
          os_log_t v116 = objc_msgSend_constructedAssetDownloadURLTemplate(v66, v111, v115);
          BOOL v117 = v116 == 0;

          if (v117)
          {
            v95 = objc_alloc_init(CKDMMCSItem);
            if (!v95)
            {
              uint64_t v139 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v126, v127);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v139, v140, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 585, @"Expected non-nil asset");
            }
            objc_msgSend_setPaddedFileSize_(v95, v126, 0);
            objc_msgSend_setFileSize_(v95, v128, 0);
            objc_msgSend_setWasCached_(v66, v129, 1);
            objc_msgSend_setDownloaded_(v66, v130, 1);
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v131 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v199 = v66;
              _os_log_debug_impl(&dword_1C4CFF000, v131, OS_LOG_TYPE_DEBUG, "Returning asset from cache: %@", buf, 0xCu);
            }
            objc_msgSend__didPrepareAsset_(self, v132, (uint64_t)v66);
            v194[0] = @"Data";
            v133 = objc_opt_new();
            v194[1] = @"Offset";
            v195[0] = v133;
            v195[1] = &unk_1F20AC690;
            id v135 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v134, (uint64_t)v195, v194, 2);
            objc_msgSend__didCommandForAsset_command_(self, v136, (uint64_t)v66, v135);

            objc_msgSend__didMakeProgressForAsset_progress_(self, v137, (uint64_t)v66, 1.0);
            objc_msgSend__didDownloadAsset_error_(self, v138, (uint64_t)v66, 0);
            goto LABEL_43;
          }
        }
        if (v113)
        {
          objc_msgSend_addObject_(v182, v111, (uint64_t)v66);
          v95 = 0;
        }
        else
        {
          v118 = [CKDMMCSItem alloc];
          v95 = (CKDMMCSItem *)objc_msgSend_initWithAsset_(v118, v119, (uint64_t)v66);
          uint64_t v122 = objc_msgSend_size(v66, v120, v121);
          objc_msgSend_setFileSize_(v95, v123, v122);
          objc_msgSend_addObject_(self->_prepareMMCSItemsToDownloadInMemory, v124, (uint64_t)v95);
        }

LABEL_50:
        objc_msgSend__didPrepareAsset_(self, v65, (uint64_t)v64);
LABEL_51:

        ++v63;
      }
      while (v61 != v63);
      uint64_t v59 = obj;
      uint64_t v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v125, (uint64_t)&v186, v196, 16);
      uint64_t v61 = v141;
    }
    while (v141);
  }

  if (objc_msgSend_count(self->_prepareMMCSItemsToDownload, v142, v143)
    || objc_msgSend_count(self->_prepareMMCSItemsToDownloadInMemory, v144, v145))
  {
    goto LABEL_66;
  }
  v146 = objc_msgSend_assetURLInfosToFillOut(self, v144, v145);
  if (objc_msgSend_count(v146, v147, v148) || objc_msgSend_count(v181, v149, v150))
  {

LABEL_66:
    v153 = objc_msgSend_copy(self->_prepareMMCSItemsToDownload, v144, v145);
    objc_msgSend_setMMCSItemsToDownload_(self, v154, (uint64_t)v153);

    v157 = objc_msgSend_copy(self->_prepareMMCSItemsToDownloadInMemory, v155, v156);
    objc_msgSend_setMMCSItemsToDownloadInMemory_(self, v158, (uint64_t)v157);
    BOOL v159 = 1;
    goto LABEL_67;
  }
  BOOL v176 = objc_msgSend_count(v182, v151, v152) == 0;

  if (!v176) {
    goto LABEL_66;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v157 = (id)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
  {
    v179 = objc_msgSend_operationID(self, v177, v178);
    *(_DWORD *)buf = 138543362;
    id v199 = v179;
    _os_log_debug_impl(&dword_1C4CFF000, v157, OS_LOG_TYPE_DEBUG, "No assets to download for %{public}@", buf, 0xCu);
  }
  BOOL v159 = 0;
LABEL_67:

  v160 = self->_prepareMMCSItemsToDownload;
  self->_prepareMMCSItemsToDownload = 0;

  v161 = self->_prepareMMCSItemsToDownloadInMemory;
  self->_prepareMMCSItemsToDownloadInMemory = 0;

  os_unfair_lock_unlock(&self->_prepareLock);
  return v159;
}

- (void)_didDownloadMMCSItem:(id)a3 inMemory:(BOOL)a4 error:(id)a5
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_package(v8, v10, v11);
  uint64_t v15 = objc_msgSend_asset(v8, v13, v14);
  uint64_t v18 = objc_msgSend_error(v8, v16, v17);
  unint64_t v19 = (void *)v18;
  if (v18) {
    id v20 = (void *)v18;
  }
  else {
    id v20 = v9;
  }
  id v21 = v20;

  if (v21)
  {
    v103[0] = v8;
    long long v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v103, 1);
    objc_msgSend__removeUntrackedMMCSItems_(self, v25, (uint64_t)v24);

    if (v12)
    {
      uint64_t v28 = objc_msgSend_downloadTasksByPackages(self, v26, v27);
      id v30 = objc_msgSend_objectForKey_(v28, v29, (uint64_t)v12);

      objc_msgSend_setError_(v30, v31, (uint64_t)v21);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v32 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v83 = v32;
        char v86 = objc_msgSend_operationID(self, v84, v85);
        *(_DWORD *)buf = 138413058;
        id v96 = v8;
        __int16 v97 = 2112;
        uint64_t v98 = v12;
        __int16 v99 = 2114;
        id v100 = v86;
        __int16 v101 = 2112;
        id v102 = v21;
        _os_log_debug_impl(&dword_1C4CFF000, v83, OS_LOG_TYPE_DEBUG, "Failed to download MMCS item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);
      }
      objc_msgSend__didDownloadAsset_error_(self, v33, (uint64_t)v12, v21);
      uint64_t v36 = objc_msgSend_group(v30, v34, v35);
      dispatch_group_leave(v36);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v80 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v87 = v80;
        uint64_t v90 = objc_msgSend_operationID(self, v88, v89);
        *(_DWORD *)buf = 138412802;
        id v96 = v8;
        __int16 v97 = 2114;
        uint64_t v98 = v90;
        __int16 v99 = 2112;
        id v100 = v21;
        _os_log_debug_impl(&dword_1C4CFF000, v87, OS_LOG_TYPE_DEBUG, "Failed to download MMCS item %@ for operation %{public}@: %@", buf, 0x20u);
      }
      objc_msgSend__didDownloadAsset_error_(self, v81, (uint64_t)v15, v21);
    }
  }
  else
  {
    if (!v15)
    {
      uint64_t v91 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v91, v92, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 642, @"Expected non-nil asset for item %@", v8);
    }
    uint64_t v37 = objc_msgSend_fileSize(v8, v22, v23);
    objc_msgSend_setSize_(v15, v38, v37);
    uint64_t v41 = objc_msgSend_paddedFileSize(v8, v39, v40);
    objc_msgSend_setPaddedFileSize_(v15, v42, v41);
    uint64_t v45 = objc_msgSend_verificationKey(v8, v43, v44);
    objc_msgSend_setVerificationKey_(v15, v46, (uint64_t)v45);

    if (sub_1C4E07E88(self, v47, v48))
    {
      uint64_t v51 = objc_msgSend_itemID(v8, v49, v50);
      objc_msgSend_setReReferenceItemID_(v15, v52, v51);
    }
    if (!v8)
    {
      v93 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v49, v50);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v93, v94, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 667, @"Expected non-nil MMCS item");
    }
    v53 = objc_msgSend_trackingUUID(v8, v49, v50);
    objc_msgSend_setUUID_(v15, v54, (uint64_t)v53);

    if (objc_msgSend_downloadLooksOkay(v8, v55, v56))
    {
      objc_msgSend_setDownloaded_(v15, v57, 1);
      uint64_t v61 = objc_msgSend_fileURL(v8, v59, v60);
      objc_msgSend_setFileURL_(v15, v62, (uint64_t)v61);

      uint64_t v65 = objc_msgSend_fileHandle(v8, v63, v64);
      objc_msgSend_setFileHandle_(v15, v66, (uint64_t)v65);
    }
    if (v12)
    {
      v67 = objc_msgSend_downloadTasksByPackages(self, v57, v58);
      uint64_t v69 = objc_msgSend_objectForKey_(v67, v68, (uint64_t)v12);

      uint64_t v72 = objc_msgSend_progressTracker(v69, v70, v71);
      objc_msgSend_updateProgressWithItem_progress_(v72, v73, (uint64_t)v15, 1.0);
      double v75 = v74;

      objc_msgSend__didMakeProgressForAsset_progress_(self, v76, (uint64_t)v12, v75);
      v79 = objc_msgSend_group(v69, v77, v78);
      dispatch_group_leave(v79);
    }
    else
    {
      objc_msgSend__didMakeProgressForAsset_progress_(self, v57, (uint64_t)v15, 1.0);
      objc_msgSend__didDownloadAsset_error_(self, v82, (uint64_t)v15, 0);
    }
  }
}

- (void)_collectMetricsFromMMCSOperationMetrics:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1C4E08F78;
    v8[3] = &unk_1E64F1D18;
    id v9 = v4;
    objc_msgSend_updateMMCSMetrics_(self, v7, (uint64_t)v8);
  }
}

- (void)_collectMetricsFromCompletedItemGroup:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_metrics(a3, a2, (uint64_t)a3);
  uint64_t v6 = (void *)v4;
  if (v4)
  {
    v9[0] = v4;
    uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v9, 1);
    objc_msgSend__collectMetricsFromMMCSOperationMetrics_(self, v8, (uint64_t)v7);
  }
}

- (void)_collectMetricsFromCompletedItemGroupSet:(id)a3
{
  uint64_t v4 = objc_msgSend_allItemGroups(a3, a2, (uint64_t)a3);
  objc_msgSend_CKCompactMap_(v4, v5, (uint64_t)&unk_1F2043310);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__collectMetricsFromMMCSOperationMetrics_(self, v6, (uint64_t)v7);
}

- (void)_didDownloadMMCSItems:(id)a3 inMemory:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v27, v37, 16);
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ((objc_msgSend_finished(v17, v12, v13) & 1) == 0)
        {
          objc_msgSend_setFinished_(v17, v12, 1);
          objc_msgSend__didDownloadMMCSItem_inMemory_error_(self, v18, (uint64_t)v17, v6, v9);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v27, v37, 16);
    }
    while (v14);
  }
  if (v9)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    unint64_t v19 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      id v20 = v19;
      uint64_t v23 = objc_msgSend_count(v8, v21, v22);
      uint64_t v26 = objc_msgSend_operationID(self, v24, v25);
      *(_DWORD *)buf = 134218498;
      uint64_t v32 = v23;
      __int16 v33 = 2114;
      uint64_t v34 = v26;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_log_debug_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_DEBUG, "Failed to download %lu MMCS items for operation %{public}@: %@", buf, 0x20u);
    }
  }
}

- (void)_didMakeProgressForMMCSItem:(id)a3 inMemory:(BOOL)a4
{
  BOOL v4 = a4;
  id v36 = a3;
  int v8 = objc_msgSend_finished(v36, v6, v7);
  uint64_t v11 = objc_msgSend_error(v36, v9, v10);
  uint64_t v14 = (void *)v11;
  if (v8)
  {
    objc_msgSend__didDownloadMMCSItem_inMemory_error_(self, v12, (uint64_t)v36, v4, v11);
  }
  else if (!v11)
  {
    objc_msgSend_progress(v36, v12, v13);
    if (v17 < 0.0) {
      goto LABEL_10;
    }
    uint64_t v14 = objc_msgSend_package(v36, v15, v16);
    uint64_t v22 = objc_msgSend_asset(v36, v18, v19);
    if (v14)
    {
      uint64_t v23 = objc_msgSend_downloadTasksByPackages(self, v20, v21);
      uint64_t v25 = objc_msgSend_objectForKey_(v23, v24, (uint64_t)v14);

      long long v28 = objc_msgSend_progressTracker(v25, v26, v27);
      objc_msgSend_progress(v36, v29, v30);
      objc_msgSend_updateProgressWithItem_progress_(v28, v31, (uint64_t)v22);
      double v33 = v32;

      objc_msgSend__didMakeProgressForAsset_progress_(self, v34, (uint64_t)v14, v33);
    }
    else
    {
      objc_msgSend_progress(v36, v20, v21);
      objc_msgSend__didMakeProgressForAsset_progress_(self, v35, (uint64_t)v22);
    }
  }
LABEL_10:
}

- (void)_didCommandForMMCSItem:(id)a3 command:(id)a4
{
  id v6 = a4;
  objc_msgSend_asset(a3, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__didCommandForAsset_command_(self, v9, (uint64_t)v10, v6);
}

- (void)_didDownloadMMCSSectionItem:(id)a3 task:(id)a4 error:(id)a5
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v14 = objc_msgSend_mmcs(self, v12, v13);
  double v17 = objc_msgSend_container(self, v15, v16);

  if (v17)
  {
    id v20 = objc_msgSend_assetCache(v14, v18, v19);

    if (!v20)
    {
      uint64_t v115 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
      v118 = objc_msgSend_container(self, v116, v117);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v115, v119, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 746, @"Expected non-nil assetCache for %@", v118);
    }
  }
  v128 = objc_msgSend_package(v10, v18, v19);
  uint64_t v23 = objc_msgSend_error(v9, v21, v22);
  long long v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = (void *)v23;
  }
  else {
    uint64_t v25 = v11;
  }
  id v26 = v25;

  if (v26)
  {
LABEL_8:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v29 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v107 = v29;
      v110 = objc_msgSend_operationID(self, v108, v109);
      *(_DWORD *)buf = 138413058;
      uint64_t v136 = (uint64_t)v9;
      __int16 v137 = 2112;
      v138 = v128;
      __int16 v139 = 2114;
      v140 = v110;
      __int16 v141 = 2112;
      id v142 = v26;
      _os_log_debug_impl(&dword_1C4CFF000, v107, OS_LOG_TYPE_DEBUG, "Failed to download MMCS section item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);
    }
    objc_msgSend_setError_(v10, v30, (uint64_t)v26);
    double v33 = objc_msgSend_sectionItems(v9, v31, v32);
    objc_msgSend__removeUntrackedMMCSItems_(self, v34, (uint64_t)v33);

    goto LABEL_49;
  }
  if (sub_1C4E07E88(self, v27, v28)) {
    goto LABEL_44;
  }
  SEL v124 = a2;
  v125 = self;
  v120 = v14;
  id v121 = v11;
  id v122 = v10;
  id v35 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v37 = objc_msgSend_initWithCapacity_(v35, v36, 100);
  id v38 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v40 = objc_msgSend_initWithCapacity_(v38, v39, 100);
  id v123 = v9;
  uint64_t v43 = objc_msgSend_sectionItems(v9, v41, v42);
  uint64_t v127 = objc_msgSend_objectEnumerator(v43, v44, v45);

  uint64_t v48 = 0;
  uint64_t v49 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
  v126 = v37;
  while (1)
  {
    while (1)
    {
      uint64_t v50 = v48;
      uint64_t v48 = objc_msgSend_nextObject(v127, v46, v47);

      if (!v48)
      {
LABEL_26:
        id v26 = 0;
        goto LABEL_27;
      }
      uint64_t v51 = objc_msgSend_error(v48, v46, v47);

      if (v51) {
        break;
      }
      id v55 = objc_msgSend_fileURL(v48, v52, v53);
      if (!v55)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v56 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v136 = (uint64_t)v48;
          _os_log_debug_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_DEBUG, "Expected non-nil fileURL for %@", buf, 0xCu);
        }
        uint64_t v59 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v57, v58);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v60, (uint64_t)v124, v125, @"CKDDownloadAssetsOperation.m", 770, @"Expected non-nil fileURL for %@", v48);
      }
      objc_msgSend_addObject_(v40, v54, (uint64_t)v55);
      uint64_t v61 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v64 = objc_msgSend_packageIndex(v48, v62, v63);
      id v66 = objc_msgSend_numberWithInteger_(v61, v65, v64);
      objc_msgSend_addObject_(v37, v67, (uint64_t)v66);

      unint64_t v70 = objc_msgSend_count(v37, v68, v69);
      BOOL v71 = v70 >= 0x64;
      uint64_t v49 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
      if (v71) {
        goto LABEL_26;
      }
    }
    objc_msgSend_error(v48, v52, v53);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    uint64_t v72 = objc_msgSend_count(v37, v46, v47);
    if (v26 || !v72) {
      break;
    }
    unint64_t v129 = v72;
    v130 = v48;
    objc_msgSend_updateItemsAtIndexes_fileURLs_(v128, v73, (uint64_t)v37, v40);
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v74 = v37;
    uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v131, v143, 16);
    if (v76)
    {
      uint64_t v78 = v76;
      uint64_t v79 = 0;
      uint64_t v80 = *(void *)v132;
      do
      {
        uint64_t v81 = 0;
        do
        {
          if (*(void *)v132 != v80) {
            objc_enumerationMutation(v74);
          }
          uint64_t v82 = *(void **)(*((void *)&v131 + 1) + 8 * v81);
          v83 = objc_msgSend_objectAtIndex_(v40, v77, v79 + v81);
          if (*v49 != -1) {
            dispatch_once(v49, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v84 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            uint64_t v85 = v84;
            uint64_t v88 = objc_msgSend_unsignedIntegerValue(v82, v86, v87);
            uint64_t v91 = objc_msgSend_path(v83, v89, v90);
            *(_DWORD *)buf = 134218242;
            uint64_t v136 = v88;
            __int16 v137 = 2114;
            v138 = v91;
            _os_log_debug_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_DEBUG, "Updated package item with index:%lu and path:%{public}@", buf, 0x16u);

            uint64_t v49 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
          }

          ++v81;
        }
        while (v78 != v81);
        uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v131, v143, 16);
        v79 += v81;
      }
      while (v78);
    }

    objc_msgSend_removeAllObjects(v40, v92, v93);
    objc_msgSend_removeAllObjects(v74, v94, v95);

    uint64_t v48 = 0;
    id v26 = 0;
    uint64_t v37 = v126;
    if (v129 <= 0x63) {
      goto LABEL_43;
    }
  }

LABEL_43:
  id v10 = v122;
  id v9 = v123;
  uint64_t v14 = v120;
  id v11 = v121;
  self = v125;
  if (v26) {
    goto LABEL_8;
  }
LABEL_44:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v96 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v111 = v96;
    char v114 = objc_msgSend_operationID(self, v112, v113);
    *(_DWORD *)buf = 138413058;
    uint64_t v136 = (uint64_t)v9;
    __int16 v137 = 2112;
    v138 = v128;
    __int16 v139 = 2114;
    v140 = v114;
    __int16 v141 = 2112;
    id v142 = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v111, OS_LOG_TYPE_DEBUG, "Downloaded MMCS section item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);
  }
  objc_msgSend_asset(v9, v97, v98);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDownloaded_(v26, v99, 1);
  id v102 = objc_msgSend_progressTracker(v10, v100, v101);
  objc_msgSend_updateProgressWithItem_progress_(v102, v103, (uint64_t)v26, 1.0);
  double v105 = v104;

  objc_msgSend__didMakeProgressForAsset_progress_(self, v106, (uint64_t)v128, v105);
LABEL_49:
}

- (void)_didDownloadMMCSSectionItems:(id)a3 task:(id)a4 error:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, v33, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend_finished(v18, v13, v14) & 1) == 0)
        {
          objc_msgSend_setFinished_(v18, v13, 1);
          objc_msgSend__didDownloadMMCSSectionItem_task_error_(self, v19, (uint64_t)v18, v9, v10);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v13, (uint64_t)&v25, v33, 16);
    }
    while (v15);
  }
  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v20 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = v20;
      uint64_t v24 = objc_msgSend_count(v8, v22, v23);
      *(_DWORD *)buf = 134218242;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "Failed to download %lu MMCS section items: %@", buf, 0x16u);
    }
  }
}

- (void)_didMakeProgressForMMCSSectionItem:(id)a3 task:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  if (objc_msgSend_finished(v30, v7, v8))
  {
    id v11 = objc_msgSend_error(v30, v9, v10);
    objc_msgSend__didDownloadMMCSSectionItem_task_error_(self, v12, (uint64_t)v30, v6, v11);
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend_progress(v30, v9, v10);
  double v14 = v13;
  double v17 = objc_msgSend_error(v30, v15, v16);

  if (!v17 && v14 >= 0.0)
  {
    id v11 = objc_msgSend_package(v30, v18, v19);
    uint64_t v22 = objc_msgSend_progressTracker(v6, v20, v21);
    long long v25 = objc_msgSend_asset(v30, v23, v24);
    objc_msgSend_updateProgressWithItem_progress_(v22, v26, (uint64_t)v25, v14);
    double v28 = v27;

    objc_msgSend__didMakeProgressForAsset_progress_(self, v29, (uint64_t)v11, v28);
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_downloadPackageSectionAtIndex:(int64_t)a3 task:(id)a4 completionBlock:(id)a5
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v12 = (void (**)(void))a5;
  if (a3 < 0)
  {
    id v122 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v122, v123, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 839, @"Expected a valid sectionIndex: %ld", a3);
  }
  if (!objc_msgSend_isCancelled(self, v10, v11))
  {
    unint64_t v129 = objc_msgSend_mmcs(self, v13, v14);
    uint64_t v19 = objc_msgSend_package(v9, v17, v18);
    v130 = objc_msgSend_downloadItemIndices(v19, v20, v21);
    long long v131 = objc_msgSend_sectionAtIndex_(v19, v22, a3);
    if (!v131)
    {
      uint64_t v50 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v23, *MEMORY[0x1E4F19DD8], 1000, @"Couldn't find section at index %ld for package %@", a3, v19);
      objc_msgSend_setError_(v9, v51, (uint64_t)v50);

      if (v12) {
        v12[2](v12);
      }
      goto LABEL_29;
    }
    uint64_t v158 = 0;
    BOOL v159 = &v158;
    uint64_t v160 = 0x3032000000;
    v161 = sub_1C4E0A948;
    v162 = sub_1C4E0A958;
    id v163 = (id)objc_opt_new();
    uint64_t v152 = 0;
    v153 = &v152;
    uint64_t v154 = 0x3032000000;
    v155 = sub_1C4E0A948;
    uint64_t v156 = sub_1C4E0A958;
    id v157 = (id)objc_opt_new();
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = sub_1C4E0A960;
    v147[3] = &unk_1E64F3788;
    id v24 = v19;
    id v148 = v24;
    id v25 = v131;
    id v149 = v25;
    uint64_t v150 = &v158;
    v151 = &v152;
    objc_msgSend_enumerateIndexesUsingBlock_(v130, v26, (uint64_t)v147);
    if (objc_msgSend_size(v25, v27, v28))
    {
      if (objc_msgSend_index(v25, v29, v30) < 0
        || (objc_msgSend_assets(v24, v31, v32),
            double v33 = objc_claimAutoreleasedReturnValue(),
            unint64_t v36 = objc_msgSend_count(v33, v34, v35),
            LOBYTE(v36) = v36 > objc_msgSend_index(v25, v37, v38) + 1,
            v33,
            (v36 & 1) == 0))
      {
        uint64_t v52 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v53 = objc_msgSend_index(v25, v31, v32);
        uint64_t v56 = objc_msgSend_assets(v24, v54, v55);
        uint64_t v59 = objc_msgSend_count(v56, v57, v58);
        uint64_t v61 = objc_msgSend_errorWithDomain_code_format_(v52, v60, *MEMORY[0x1E4F19DD8], 1000, @"Invalid section index %ld(%lu) for package %@", v53, v59, v24);
        objc_msgSend_setError_(v9, v62, (uint64_t)v61);

        if (v12) {
          v12[2](v12);
        }
        id v47 = 0;
        goto LABEL_28;
      }
      uint64_t v39 = objc_msgSend_assets(v24, v31, v32);
      uint64_t v42 = objc_msgSend_index(v25, v40, v41);
      uint64_t v44 = objc_msgSend_objectAtIndex_(v39, v43, v42 + 1);

      uint64_t v45 = [CKDMMCSItem alloc];
      id v47 = (id)objc_msgSend_initWithAsset_(v45, v46, (uint64_t)v44);
      objc_msgSend_setPackage_(v47, v48, (uint64_t)v24);
    }
    else
    {
      uint64_t v63 = [CKDMMCSItem alloc];
      id v47 = (id)objc_msgSend_initWithPackage_(v63, v64, (uint64_t)v24);
    }
    objc_msgSend_setSectionItems_(v47, v49, v159[5]);
    uint64_t v67 = objc_msgSend_size(v25, v65, v66);
    objc_msgSend_setFileSize_(v47, v68, v67);
    uint64_t v71 = objc_msgSend_paddedSize(v25, v69, v70);
    objc_msgSend_setPaddedFileSize_(v47, v72, v71);
    if (objc_msgSend_fileSize(v47, v73, v74) && objc_msgSend_count((void *)v159[5], v75, v76))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v77 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v120 = v159[5];
        id v121 = objc_msgSend_operationID(self, v78, v79);
        *(_DWORD *)location = 138413314;
        *(void *)&location[4] = v47;
        __int16 v165 = 2048;
        int64_t v166 = a3;
        __int16 v167 = 2112;
        uint64_t v168 = v120;
        __int16 v169 = 2112;
        id v170 = v24;
        __int16 v171 = 2114;
        v172 = v121;
        _os_log_debug_impl(&dword_1C4CFF000, v77, OS_LOG_TYPE_DEBUG, "Downloading MMCS section item %@ at index %lu with MMCS items %@ for package %@ and operation %{public}@", location, 0x34u);
      }
      id v127 = [NSString alloc];
      uint64_t v82 = objc_msgSend_recordKey(v24, v80, v81);
      uint64_t v85 = objc_msgSend_record(v24, v83, v84);
      uint64_t v88 = objc_msgSend_recordID(v85, v86, v87);
      uint64_t v91 = objc_msgSend_recordName(v88, v89, v90);
      v128 = objc_msgSend_initWithFormat_(v127, v92, @"down|%@|%@|section:%lu", v82, v91, a3);

      uint64_t v93 = [CKDProgressTracker alloc];
      uint64_t v95 = objc_msgSend_initWithTrackingID_(v93, v94, (uint64_t)v128);
      objc_msgSend_startTrackingItems_(v95, v96, v159[5]);
      __int16 v97 = dispatch_group_create();
      dispatch_group_enter(v97);
      objc_initWeak((id *)location, self);
      id v100 = objc_msgSend_MMCSRequestOptions(v9, v98, v99);
      v142[0] = MEMORY[0x1E4F143A8];
      v142[1] = 3221225472;
      v142[2] = sub_1C4E0ABA8;
      v142[3] = &unk_1E64F37B0;
      id v126 = v95;
      id v143 = v126;
      id v144 = v47;
      objc_copyWeak(&v146, (id *)location);
      id v145 = v9;
      v136[0] = MEMORY[0x1E4F143A8];
      v136[1] = 3221225472;
      v136[2] = sub_1C4E0AC54;
      v136[3] = &unk_1E64F3800;
      v136[4] = self;
      __int16 v141 = &v152;
      id v137 = v129;
      id v47 = v144;
      id v138 = v47;
      id v101 = v145;
      id v139 = v101;
      id v102 = v97;
      v140 = v102;
      double v104 = objc_msgSend_getSectionItem_operation_options_progress_completionHandler_(v137, v103, (uint64_t)v47, self, v100, v142, v136);

      v107 = objc_msgSend_cancelTokens(v101, v105, v106);
      objc_msgSend_addCancelToken_withOperation_(v107, v108, (uint64_t)v104, self);

      objc_msgSend_qualityOfService(self, v109, v110);
      v111 = CKGetGlobalQueue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4E0AE90;
      block[3] = &unk_1E64F0FA0;
      id v133 = v101;
      id v134 = v104;
      id v135 = v12;
      id v112 = v104;
      dispatch_group_notify(v102, v111, block);

      objc_destroyWeak(&v146);
      objc_destroyWeak((id *)location);
    }
    else
    {
      if (objc_msgSend_count((void *)v159[5], v75, v76))
      {
        SEL v124 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v113, v114);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v124, v125, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 906, @"Expected 0 non-empty items in the empty section %@", v47);
      }
      uint64_t v115 = objc_msgSend_assetCache(v129, v113, v114);
      id v117 = (id)objc_msgSend_trackCachedButNotRegisteredMMCSItems_error_(v115, v116, v153[5], 0);

      objc_msgSend_setSectionItems_(v47, v118, v153[5]);
      objc_msgSend__didDownloadMMCSSectionItem_task_error_(self, v119, (uint64_t)v47, v9, 0);
      if (v12) {
        v12[2](v12);
      }
    }
LABEL_28:

    _Block_object_dispose(&v152, 8);
    _Block_object_dispose(&v158, 8);

LABEL_29:
    goto LABEL_30;
  }
  uint64_t v15 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 1, @"Operation was cancelled");
  objc_msgSend_setError_(v9, v16, (uint64_t)v15);

  if (v12) {
    v12[2](v12);
  }
LABEL_30:
}

- (void)_downloadPackageSectionsWithSectionEnumerator:(id)a3 task:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  double v13 = objc_msgSend_error(v9, v11, v12);

  if (v13 || (objc_msgSend_nextObject(v8, v14, v15), (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    uint64_t v19 = v16;
    uint64_t v20 = objc_msgSend_integerValue(v16, v17, v18);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1C4E0B044;
    v22[3] = &unk_1E64F1B98;
    v22[4] = self;
    id v23 = v8;
    id v24 = v9;
    id v25 = v10;
    objc_msgSend__downloadPackageSectionAtIndex_task_completionBlock_(self, v21, v20, v24, v22);
  }
}

- (void)_downloadPackageSectionsWithTask:(id)a3 completionBlock:(id)a4
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (objc_msgSend_isCancelled(self, v8, v9))
  {
    uint64_t v12 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 1, @"Operation was cancelled");
    objc_msgSend_setError_(v6, v13, (uint64_t)v12);

    if (!v7) {
      goto LABEL_37;
    }
    goto LABEL_6;
  }
  uint64_t v14 = objc_msgSend_error(v6, v10, v11);

  if (v14)
  {
    if (v7) {
LABEL_6:
    }
      v7[2](v7);
  }
  else
  {
    uint64_t v107 = 0;
    uint64_t v108 = &v107;
    uint64_t v109 = 0x3032000000;
    uint64_t v110 = sub_1C4E0A948;
    v111 = sub_1C4E0A958;
    id v112 = 0;
    double v17 = objc_msgSend_package(v6, v15, v16);
    uint64_t v20 = objc_msgSend_manifestAsset(v6, v18, v19);
    id v23 = objc_msgSend_fileURL(v20, v21, v22);
    long long v26 = objc_msgSend_path(v23, v24, v25);

    if (v26)
    {
      uint64_t v28 = (id *)(v108 + 5);
      id obj = (id)v108[5];
      char v29 = objc_msgSend_readContentsOfFile_intoPackage_error_(CKDPackageManifest, v27, (uint64_t)v26, v17, &obj);
      objc_storeStrong(v28, obj);
      if (v29)
      {
        uint64_t v32 = objc_msgSend_itemCount(v17, v30, v31);
        uint64_t v93 = objc_msgSend_sectionCount(v17, v33, v34);
        uint64_t v35 = (void *)MEMORY[0x1E4F1A550];
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        unint64_t v36 = (id *)MEMORY[0x1E4F1A500];
        uint64_t v37 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          uint64_t v115 = v32;
          __int16 v116 = 2048;
          uint64_t v117 = v93;
          __int16 v118 = 2112;
          uint64_t v119 = v17;
          __int16 v120 = 2114;
          id v121 = v26;
          _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Read the package manifest with %lu items and %lu sections for package %@ at %{public}@", buf, 0x2Au);
        }
        uint64_t v94 = objc_msgSend_downloadItemIndices(v17, v38, v39);
        if (*v35 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v40 = *v36;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v85 = objc_msgSend_count(v94, v41, v42);
          uint64_t v88 = objc_msgSend_operationID(self, v86, v87);
          *(_DWORD *)buf = 134219010;
          uint64_t v115 = v85;
          __int16 v116 = 2048;
          uint64_t v117 = v32;
          __int16 v118 = 2112;
          uint64_t v119 = v17;
          __int16 v120 = 2114;
          id v121 = v88;
          __int16 v122 = 2114;
          id v123 = v94;
          _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Downloading %lu/%lu package items for package %@ and operation %{public}@: %{public}@", buf, 0x34u);
        }
        uint64_t v43 = (void *)v108[5];
        v108[5] = 0;

        id v44 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        v102[0] = MEMORY[0x1E4F143A8];
        v102[1] = 3221225472;
        v102[2] = sub_1C4E0B8A8;
        v102[3] = &unk_1E64F3828;
        id v45 = v17;
        id v103 = v45;
        double v105 = &v107;
        id v46 = v44;
        id v104 = v46;
        objc_msgSend_enumerateIndexesUsingBlock_(v94, v47, (uint64_t)v102);
        uint64_t v49 = v108[5];
        if (v49)
        {
          objc_msgSend_setError_(v6, v48, v49);
          if (v7) {
            v7[2](v7);
          }
        }
        else
        {
          uint64_t v89 = objc_msgSend_CKMap_(v46, v48, (uint64_t)&unk_1F2043330);
          uint64_t v60 = [CKDMMCSRequestOptions alloc];
          unint64_t v92 = objc_msgSend_initWithOperation_(v60, v61, (uint64_t)self);
          uint64_t v64 = objc_msgSend_record(v45, v62, v63);
          uint64_t v67 = objc_msgSend_recordID(v64, v65, v66);
          uint64_t v70 = objc_msgSend_zoneID(v67, v68, v69);
          uint64_t v91 = objc_msgSend_zoneName(v70, v71, v72);

          if (v91)
          {
            uint64_t v113 = v91;
            uint64_t v74 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v73, (uint64_t)&v113, 1);
            objc_msgSend_setZoneNames_(v92, v75, (uint64_t)v74);
          }
          objc_msgSend_setMMCSRequestOptions_(v6, v73, (uint64_t)v92, v89);
          objc_msgSend_setSectionIndices_(v6, v76, (uint64_t)v46);
          uint64_t v79 = objc_msgSend_objectEnumerator(v90, v77, v78);
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = sub_1C4E0B97C;
          v95[3] = &unk_1E64F3870;
          id v96 = v6;
          uint64_t v101 = v93;
          id v97 = v45;
          id v98 = v46;
          uint64_t v99 = self;
          id v100 = v7;
          objc_msgSend__downloadPackageSectionsWithSectionEnumerator_task_completionBlock_(self, v80, (uint64_t)v79, v96, v95);
        }
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v56 = (id)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v83 = objc_msgSend_operationID(self, v57, v58);
          uint64_t v84 = (void *)v108[5];
          *(_DWORD *)buf = 138413058;
          uint64_t v115 = (uint64_t)v26;
          __int16 v116 = 2112;
          uint64_t v117 = (uint64_t)v17;
          __int16 v118 = 2114;
          uint64_t v119 = v83;
          __int16 v120 = 2112;
          id v121 = v84;
          _os_log_error_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_ERROR, "Failed to read the manifest file at %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);
        }
        objc_msgSend_setError_(v6, v59, v108[5]);
        if (v7) {
          v7[2](v7);
        }
      }
    }
    else
    {
      uint64_t v50 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, *MEMORY[0x1E4F19DD8], 1017, @"Missing path for the package manifest");
      uint64_t v51 = (void *)v108[5];
      v108[5] = v50;

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v52 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        uint64_t v81 = objc_msgSend_operationID(self, v53, v54);
        uint64_t v82 = (void *)v108[5];
        *(_DWORD *)buf = 138412802;
        uint64_t v115 = (uint64_t)v17;
        __int16 v116 = 2114;
        uint64_t v117 = (uint64_t)v81;
        __int16 v118 = 2112;
        uint64_t v119 = v82;
        _os_log_error_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_ERROR, "Missing path for package manifest for package %@ and operation %{public}@: %@", buf, 0x20u);
      }
      objc_msgSend_setError_(v6, v55, v108[5]);
      if (v7) {
        v7[2](v7);
      }
    }

    _Block_object_dispose(&v107, 8);
  }
LABEL_37:
}

- (void)_downloadPackageSectionsWithPendingTasks:(id)a3 downloadingTasks:(id)a4 completedTasks:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!objc_msgSend_maxPackageDownloadsPerBatch(self, v12, v13))
  {
    uint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 1064, @"Expected non-0 maxPackageDownloadsPerBatch");
  }
  unint64_t v16 = objc_msgSend_count(v10, v14, v15);
  if (v16 > objc_msgSend_maxPackageDownloadsPerBatch(self, v17, v18))
  {
    double v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 1065, @"Expected max downloading tasks: %@", v10);

    if (!v11) {
      goto LABEL_7;
    }
  }
  else if (!v11)
  {
    goto LABEL_7;
  }
  if (!objc_msgSend_count(v11, v19, v20))
  {
    char v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, @"CKDDownloadAssetsOperation.m", 1066, @"Expected completed tasks: %@", v11);
  }
LABEL_7:
  uint64_t v21 = objc_msgSend_queue(self, v19, v20);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E0BD1C;
  block[3] = &unk_1E64F0DF0;
  id v32 = v10;
  id v33 = v11;
  uint64_t v34 = self;
  id v35 = v9;
  id v22 = v9;
  id v23 = v11;
  id v24 = v10;
  dispatch_async(v21, block);
}

- (BOOL)_download
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_MMCSItemsToDownload(self, a2, v2);
  uint64_t v7 = objc_msgSend_MMCSItemsToDownloadInMemory(self, v5, v6);
  if (objc_msgSend_count(v4, v8, v9) || objc_msgSend_count(v7, v10, v11)) {
    goto LABEL_7;
  }
  uint64_t v12 = objc_msgSend_assetsToDownloadFromTranscoder(self, v10, v11);
  if (objc_msgSend_count(v12, v13, v14)) {
    goto LABEL_6;
  }
  double v17 = objc_msgSend_assetsToDownloadFromTranscoderInMemory(self, v15, v16);
  if (objc_msgSend_count(v17, v18, v19))
  {

LABEL_6:
LABEL_7:
    if (objc_msgSend_count(v4, v10, v11))
    {
      id v24 = objc_msgSend_downloadTasksByPackages(self, v22, v23);
      objc_msgSend__downloadMMCSItems_downloadTasksByPackages_shouldFetchAssetContentInMemory_(self, v25, (uint64_t)v4, v24, 0);
    }
    if (objc_msgSend_count(v7, v22, v23)) {
      objc_msgSend__downloadMMCSItems_downloadTasksByPackages_shouldFetchAssetContentInMemory_(self, v26, (uint64_t)v7, 0, 1);
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v28 = objc_msgSend_assetsToDownloadFromTranscoder(self, v26, v27);
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v59, v64, 16);
    if (v30)
    {
      uint64_t v32 = v30;
      uint64_t v33 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v60 != v33) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend__downloadTranscodedAsset_inMemory_(self, v31, *(void *)(*((void *)&v59 + 1) + 8 * i), 0);
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v59, v64, 16);
      }
      while (v32);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v37 = objc_msgSend_assetsToDownloadFromTranscoderInMemory(self, v35, v36, 0);
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v55, v63, 16);
    if (v39)
    {
      uint64_t v41 = v39;
      uint64_t v42 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v56 != v42) {
            objc_enumerationMutation(v37);
          }
          objc_msgSend__downloadTranscodedAsset_inMemory_(self, v40, *(void *)(*((void *)&v55 + 1) + 8 * j), 1);
        }
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v55, v63, 16);
      }
      while (v41);
    }

    BOOL v44 = 1;
    goto LABEL_26;
  }
  id v46 = objc_msgSend_assetURLInfosToFillOut(self, v20, v21);
  uint64_t v49 = objc_msgSend_count(v46, v47, v48);

  if (v49) {
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v50 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = v50;
    uint64_t v54 = objc_msgSend_operationID(self, v52, v53);
    *(_DWORD *)buf = 138543362;
    uint64_t v66 = v54;
    _os_log_debug_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_DEBUG, "No files or packages to download for %{public}@", buf, 0xCu);
  }
  BOOL v44 = 0;
LABEL_26:

  return v44;
}

- (void)_downloadMMCSItems:(id)a3 downloadTasksByPackages:(id)a4 shouldFetchAssetContentInMemory:(BOOL)a5
{
  BOOL v134 = a5;
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v132 = a4;
  val = self;
  id v133 = objc_msgSend_mmcs(self, v8, v9);
  group = dispatch_group_create();
  uint64_t v12 = objc_msgSend_stateTransitionGroup(self, v10, v11);
  dispatch_group_enter(v12);

  dispatch_group_enter(group);
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id obj = v7;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v167, v176, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v168;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v168 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = objc_msgSend_package(*(void **)(*((void *)&v167 + 1) + 8 * i), v14, v15);
        if (v21)
        {
          id v22 = objc_msgSend_downloadTasksByPackages(val, v19, v20);
          id v24 = objc_msgSend_objectForKey_(v22, v23, (uint64_t)v21);

          uint64_t v27 = objc_msgSend_group(v24, v25, v26);
          dispatch_group_enter(v27);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v167, v176, 16);
    }
    while (v16);
  }

  uint64_t v30 = objc_msgSend_downloadTasksByPackages(val, v28, v29);
  uint64_t v33 = objc_msgSend_count(v30, v31, v32);

  if (v33)
  {
    uint64_t v36 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v34, v35);
    unint64_t v38 = objc_msgSend_maxPackageDownloadsPerBatchWithDefaultValue_(v36, v37, 6);

    if (v38 <= 1) {
      unint64_t v40 = 1;
    }
    else {
      unint64_t v40 = v38;
    }
    if (v40 >= 0x64) {
      objc_msgSend_setMaxPackageDownloadsPerBatch_(val, v39, 100);
    }
    else {
      objc_msgSend_setMaxPackageDownloadsPerBatch_(val, v39, v40);
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v41 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v128 = v41;
      uint64_t v131 = objc_msgSend_maxPackageDownloadsPerBatch(val, v129, v130);
      *(_DWORD *)location = 134218240;
      *(void *)&location[4] = v131;
      __int16 v174 = 2048;
      unint64_t v175 = v38;
      _os_log_debug_impl(&dword_1C4CFF000, v128, OS_LOG_TYPE_DEBUG, "maxPackageDownloadsPerBatch:%lu (%lu)", location, 0x16u);
    }
    id v42 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v45 = objc_msgSend_downloadTasksByPackages(val, v43, v44);
    uint64_t v48 = objc_msgSend_count(v45, v46, v47);
    uint64_t v50 = objc_msgSend_initWithCapacity_(v42, v49, v48);

    id v51 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v54 = objc_msgSend_maxPackageDownloadsPerBatch(val, v52, v53);
    long long v56 = objc_msgSend_initWithCapacity_(v51, v55, v54);
    long long v59 = objc_msgSend_downloadTasksByPackages(val, v57, v58);
    long long v62 = objc_msgSend_objectEnumerator(v59, v60, v61);

    uint64_t v65 = objc_msgSend_nextObject(v62, v63, v64);
    if (v65)
    {
      uint64_t v66 = MEMORY[0x1E4F143A8];
      do
      {
        dispatch_group_enter(group);
        uint64_t v69 = objc_msgSend_group(v65, v67, v68);
        uint64_t v72 = objc_msgSend_queue(val, v70, v71);
        block[0] = v66;
        block[1] = 3221225472;
        block[2] = sub_1C4E0CD70;
        block[3] = &unk_1E64F0198;
        id v162 = v65;
        id v163 = val;
        v164 = group;
        id v165 = v50;
        id v166 = v56;
        id v73 = v65;
        dispatch_group_notify(v69, v72, block);

        uint64_t v65 = objc_msgSend_nextObject(v62, v74, v75);
      }
      while (v65);
    }
  }
  uint64_t v76 = [CKDMMCSItemGroupSet alloc];
  id v135 = objc_msgSend_initWithItems_(v76, v77, (uint64_t)obj);
  uint64_t v78 = [CKDMMCSRequestOptions alloc];
  uint64_t v136 = objc_msgSend_initWithOperation_(v78, v79, (uint64_t)val);
  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(val, v80, v81);
  objc_msgSend_setShouldCloneFileInAssetCache_(v136, v83, shouldCloneFileInAssetCache);
  uint64_t v84 = objc_opt_new();
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  objc_msgSend_allItemGroups(v135, v85, v86);
  id v138 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v87, (uint64_t)&v157, v172, 16);
  if (v90)
  {
    uint64_t v139 = *(void *)v158;
    do
    {
      for (uint64_t j = 0; j != v90; ++j)
      {
        if (*(void *)v158 != v139) {
          objc_enumerationMutation(v138);
        }
        unint64_t v92 = *(void **)(*((void *)&v157 + 1) + 8 * j);
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        uint64_t v93 = objc_msgSend_items(v92, v88, v89);
        uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v153, v171, 16);
        if (v97)
        {
          uint64_t v98 = *(void *)v154;
          do
          {
            for (uint64_t k = 0; k != v97; ++k)
            {
              if (*(void *)v154 != v98) {
                objc_enumerationMutation(v93);
              }
              id v100 = objc_msgSend_recordID(*(void **)(*((void *)&v153 + 1) + 8 * k), v95, v96);
              id v103 = objc_msgSend_zoneID(v100, v101, v102);
              uint64_t v106 = objc_msgSend_zoneName(v103, v104, v105);

              if (v106) {
                objc_msgSend_addObject_(v84, v107, (uint64_t)v106);
              }
            }
            uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v95, (uint64_t)&v153, v171, 16);
          }
          while (v97);
        }
      }
      uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v88, (uint64_t)&v157, v172, 16);
    }
    while (v90);
  }

  uint64_t v110 = objc_msgSend_allObjects(v84, v108, v109);
  objc_msgSend_setZoneNames_(v136, v111, (uint64_t)v110);

  if (*MEMORY[0x1E4F1A4E0]
    && (objc_msgSend_unitTestOverrides(val, v112, v113),
        uint64_t v114 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v114, v115, @"DownloadAssetsFakeMMCSError"),
        __int16 v116 = objc_claimAutoreleasedReturnValue(),
        v114,
        v116))
  {
    objc_msgSend__didDownloadMMCSItems_inMemory_error_(val, v117, (uint64_t)obj, v134, v116);
    dispatch_group_leave(group);

    __int16 v120 = 0;
  }
  else
  {
    objc_initWeak((id *)location, val);
    v150[0] = MEMORY[0x1E4F143A8];
    v150[1] = 3221225472;
    v150[2] = sub_1C4E0D058;
    v150[3] = &unk_1E64F3898;
    objc_copyWeak(&v151, (id *)location);
    BOOL v152 = v134;
    v148[0] = MEMORY[0x1E4F143A8];
    v148[1] = 3221225472;
    v148[2] = sub_1C4E0D0C4;
    v148[3] = &unk_1E64F38C0;
    objc_copyWeak(&v149, (id *)location);
    v144[0] = MEMORY[0x1E4F143A8];
    v144[1] = 3221225472;
    v144[2] = sub_1C4E0D154;
    v144[3] = &unk_1E64F38E8;
    v144[4] = val;
    id v145 = obj;
    BOOL v147 = v134;
    id v146 = group;
    __int16 v120 = objc_msgSend_getItemGroupSet_operation_shouldFetchAssetContentInMemory_options_progress_command_completionHandler_(v133, v121, (uint64_t)v135, val, v134, v136, v150, v148, v144);
    uint64_t v124 = objc_msgSend_cancelTokens(val, v122, v123);
    objc_msgSend_addCancelToken_withOperation_(v124, v125, (uint64_t)v120, val);

    objc_destroyWeak(&v149);
    objc_destroyWeak(&v151);
    objc_destroyWeak((id *)location);
  }
  objc_msgSend_qualityOfService(val, v118, v119);
  id v126 = CKGetGlobalQueue();
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = sub_1C4E0D3A8;
  v142[3] = &unk_1E64F0948;
  void v142[4] = val;
  id v143 = v120;
  id v127 = v120;
  dispatch_group_notify(group, v126, v142);
}

- (BOOL)_postProcess
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  objc_msgSend_assetURLInfosToFillOut(self, a2, v2);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v47, v51, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v45 = *(void *)v48;
    uint64_t v43 = *MEMORY[0x1E4F19DD8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend_asset(v10, v6, v7);
        uint64_t v14 = objc_msgSend_recordPCS(v10, v12, v13);
        uint64_t v17 = objc_msgSend_recordKey(v11, v15, v16);
        uint64_t v20 = objc_msgSend_container(self, v18, v19);
        uint64_t v23 = objc_msgSend_pcsManager(v20, v21, v22);
        uint64_t v26 = objc_msgSend_useEncryption(self, v24, v25);
        uint64_t v29 = objc_msgSend_useClearAssetEncryption(self, v27, v28);
        id v46 = 0;
        LOBYTE(v42) = 0;
        LOBYTE(v26) = objc_msgSend_fillInDownloadURLsForAssetWithFieldName_fileName_recordPCS_pcsManager_useEncryption_useClearAssetEncryption_alwaysAllowKeyExport_outError_(v11, v30, (uint64_t)v17, 0, v14, v23, v26, v29, v42, &v46);
        id v31 = v46;

        if ((v26 & 1) == 0 && !v31)
        {
          uint64_t v34 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v35 = objc_msgSend_asset(v10, v32, v33);
          objc_msgSend_errorWithDomain_code_format_(v34, v36, v43, 1000, @"Failed to fill out download URL for asset %@", v35);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v37 = objc_msgSend_urlFilledOutBlock(self, v32, v33);

        if (v37)
        {
          objc_msgSend_urlFilledOutBlock(self, v38, v39);
          unint64_t v40 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void *, id))v40)[2](v40, v10, v31);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v47, v51, 16);
    }
    while (v8);
  }

  return 1;
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CKDDownloadAssetsOperation;
  [(CKDOperation *)&v8 cancel];
  uint64_t v5 = objc_msgSend_cancelTokens(self, v3, v4);
  objc_msgSend_cancel(v5, v6, v7);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  objc_msgSend_setDownloadPreparationBlock_(self, v7, 0);
  objc_msgSend_setDownloadProgressBlock_(self, v8, 0);
  objc_msgSend_setDownloadCommandBlock_(self, v9, 0);
  objc_msgSend_setDownloadCompletionBlock_(self, v10, 0);
  objc_msgSend_setUrlFilledOutBlock_(self, v11, 0);
  uint64_t v14 = objc_msgSend_mmcs(self, v12, v13);
  objc_msgSend_performOperationCleanup(v14, v15, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKDDownloadAssetsOperation;
  [(CKDOperation *)&v17 _finishOnCallbackQueueWithError:v4];
}

- (void)main
{
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  uint64_t v6 = objc_msgSend_mmcs(self, v4, v5);

  id v9 = 0;
  if (!v6)
  {
    id v10 = objc_msgSend_container(self, v7, v8);
    id v35 = 0;
    char v12 = objc_msgSend_setupAssetTransfers_(v10, v11, (uint64_t)&v35);
    id v9 = v35;

    if ((v12 & 1) == 0)
    {
      objc_msgSend_finishWithError_(self, v13, (uint64_t)v9);
      goto LABEL_12;
    }
    uint64_t v15 = objc_msgSend_container(self, v13, v14);
    uint64_t v18 = objc_msgSend_MMCS(v15, v16, v17);
    objc_msgSend_setMmcs_(self, v19, (uint64_t)v18);
  }
  uint64_t v20 = objc_msgSend_assetsToDownload(self, v7, v8);
  if (objc_msgSend_count(v20, v21, v22))
  {
    BOOL v25 = 0;
  }
  else
  {
    uint64_t v26 = objc_msgSend_assetsToDownloadInMemory(self, v23, v24);
    if (objc_msgSend_count(v26, v27, v28))
    {
      BOOL v25 = 0;
    }
    else
    {
      id v31 = objc_msgSend_assetURLInfosToFillOut(self, v29, v30);
      BOOL v25 = objc_msgSend_count(v31, v32, v33) == 0;
    }
  }

  objc_msgSend_makeStateTransition_(self, v34, v25);
LABEL_12:
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)shouldDownloadAssetFromTranscoder:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = objc_msgSend_constructedAssetDownloadParameters(v4, v5, v6);
    int v8 = v7 != 0;
  }
  else
  {
    int v8 = 0;
  }
  if (*MEMORY[0x1E4F1A4E0])
  {
    id v9 = objc_msgSend_unitTestOverrides(self, v5, v6);
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"DownloadAssetsFromTranscodingService");
    v8 |= objc_msgSend_BOOLValue(v11, v12, v13);
  }
  return v8;
}

- (void)_downloadTranscodedAsset:(id)a3 inMemory:(BOOL)a4
{
  BOOL v4 = a4;
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v6;
    _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "Downloading transcoded asset %@", (uint8_t *)location, 0xCu);
  }
  int v8 = objc_opt_new();
  id v9 = objc_alloc(MEMORY[0x1E4F19EB8]);
  char v12 = objc_msgSend_record(v6, v10, v11);
  uint64_t v14 = objc_msgSend_initWithRecord_(v9, v13, (uint64_t)v12);
  objc_msgSend_setRecord_(v8, v15, (uint64_t)v14);

  uint64_t v78 = objc_msgSend_constructedAssetDownloadParameters(v6, v16, v17);
  uint64_t v20 = (unsigned char *)MEMORY[0x1E4F1A4E0];
  if (*MEMORY[0x1E4F1A4E0])
  {
    uint64_t v21 = objc_msgSend_unitTestOverrides(self, v18, v19);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"FakeConstructedAssetDownloadParameters");

    if (v23)
    {
      id v24 = v23;

      uint64_t v78 = v24;
    }
  }
  objc_msgSend_setConstructedAssetDownloadParameters_(v8, v18, (uint64_t)v78);
  uint64_t v27 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v25, v26);
  objc_msgSend_transcoderServiceName(v27, v28, v29);
  uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (*v20 && !v30)
  {
    uint64_t v33 = objc_msgSend_unitTestOverrides(self, v31, v32);
    objc_msgSend_objectForKeyedSubscript_(v33, v34, @"TranscoderServiceName");
    uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!v30) {
    uint64_t v30 = @"ProtectedTranscodingService";
  }
  id v35 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v31, v32);
  objc_msgSend_transcoderFunctionName(v35, v36, v37);
  unint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (*v20 && !v38)
  {
    uint64_t v41 = objc_msgSend_unitTestOverrides(self, v39, v40);
    objc_msgSend_objectForKeyedSubscript_(v41, v42, @"TranscoderFunctionName");
    unint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!v38) {
    unint64_t v38 = @"transcode";
  }
  uint64_t v43 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v39, v40);
  objc_msgSend_transcoderPermittedRemoteMeasurement(v43, v44, v45);
  id v46 = (id)objc_claimAutoreleasedReturnValue();

  if (*v20 && !v46)
  {
    long long v49 = objc_msgSend_unitTestOverrides(self, v47, v48);
    objc_msgSend_objectForKeyedSubscript_(v49, v50, @"TranscoderPermittedRemoteMeasurement");
    id v46 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v46)
  {
    if (qword_1EBBCDD60 != -1) {
      dispatch_once(&qword_1EBBCDD60, &unk_1F2043350);
    }
    id v46 = (id)qword_1EBBCDD58;
  }
  id v51 = objc_opt_new();
  uint64_t v54 = objc_msgSend_databaseScope(self, v52, v53);
  objc_msgSend_setDatabaseScope_(v51, v55, v54);
  objc_msgSend_setServiceName_(v51, v56, (uint64_t)v30);
  objc_msgSend_setFunctionName_(v51, v57, (uint64_t)v38);
  objc_msgSend_setPermittedRemoteMeasurement_(v51, v58, (uint64_t)v46);
  objc_msgSend_setDataProtectionType_(v51, v59, 1);
  objc_msgSend_setShouldFetchAssetContentInMemory_(v51, v60, v4);
  objc_msgSend_setShouldSendRecordPCSKeys_(v51, v61, 1);
  uint64_t v64 = objc_msgSend_record(v8, v62, v63);
  uint64_t v67 = objc_msgSend_localSerialization(v64, v65, v66);
  v83 = v67;
  uint64_t v69 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v68, (uint64_t)&v83, 1);
  objc_msgSend_setRequestLocalSerializations_(v51, v70, (uint64_t)v69);

  objc_initWeak(location, self);
  id v73 = objc_msgSend_stateTransitionGroup(self, v71, v72);
  dispatch_group_enter(v73);

  uint64_t v74 = objc_opt_class();
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = sub_1C4E0DF38;
  v79[3] = &unk_1E64F39C8;
  objc_copyWeak(&v82, location);
  id v75 = v6;
  id v80 = v75;
  id v76 = v8;
  id v81 = v76;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v77, v74, v51, v79);

  objc_destroyWeak(&v82);
  objc_destroyWeak(location);
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
}

- (id)downloadPreparationBlock
{
  return self->_downloadPreparationBlock;
}

- (void)setDownloadPreparationBlock:(id)a3
{
}

- (id)downloadProgressBlock
{
  return self->_downloadProgressBlock;
}

- (void)setDownloadProgressBlock:(id)a3
{
}

- (id)downloadCommandBlock
{
  return self->_downloadCommandBlock;
}

- (void)setDownloadCommandBlock:(id)a3
{
}

- (id)downloadCompletionBlock
{
  return self->_downloadCompletionBlock;
}

- (void)setDownloadCompletionBlock:(id)a3
{
}

- (id)urlFilledOutBlock
{
  return self->_urlFilledOutBlock;
}

- (void)setUrlFilledOutBlock:(id)a3
{
}

- (NSMutableDictionary)keyOrErrorForHostname
{
  return self->_keyOrErrorForHostname;
}

- (void)setKeyOrErrorForHostname:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
}

- (NSArray)assetsToDownloadInMemory
{
  return self->_assetsToDownloadInMemory;
}

- (void)setAssetsToDownloadInMemory:(id)a3
{
}

- (NSArray)assetURLInfosToFillOut
{
  return self->_assetURLInfosToFillOut;
}

- (void)setAssetURLInfosToFillOut:(id)a3
{
}

- (NSArray)MMCSItemsToDownload
{
  return self->_MMCSItemsToDownload;
}

- (void)setMMCSItemsToDownload:(id)a3
{
}

- (NSArray)MMCSItemsToDownloadInMemory
{
  return self->_MMCSItemsToDownloadInMemory;
}

- (void)setMMCSItemsToDownloadInMemory:(id)a3
{
}

- (NSMutableArray)assetsToDownloadFromTranscoder
{
  return self->_assetsToDownloadFromTranscoder;
}

- (void)setAssetsToDownloadFromTranscoder:(id)a3
{
}

- (NSMutableArray)assetsToDownloadFromTranscoderInMemory
{
  return self->_assetsToDownloadFromTranscoderInMemory;
}

- (void)setAssetsToDownloadFromTranscoderInMemory:(id)a3
{
}

- (NSMapTable)downloadTasksByPackages
{
  return self->_downloadTasksByPackages;
}

- (void)setDownloadTasksByPackages:(id)a3
{
}

- (CKDCancelTokenGroup)cancelTokens
{
  return self->_cancelTokens;
}

- (void)setCancelTokens:(id)a3
{
}

- (unint64_t)maxPackageDownloadsPerBatch
{
  return self->_maxPackageDownloadsPerBatch;
}

- (void)setMaxPackageDownloadsPerBatch:(unint64_t)a3
{
  self->_maxPackageDownloadsPerBatch = a3;
}

- (CKDMMCS)mmcs
{
  return self->_mmcs;
}

- (void)setMmcs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmcs, 0);
  objc_storeStrong((id *)&self->_cancelTokens, 0);
  objc_storeStrong((id *)&self->_downloadTasksByPackages, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadFromTranscoderInMemory, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadFromTranscoder, 0);
  objc_storeStrong((id *)&self->_MMCSItemsToDownloadInMemory, 0);
  objc_storeStrong((id *)&self->_MMCSItemsToDownload, 0);
  objc_storeStrong((id *)&self->_assetURLInfosToFillOut, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadInMemory, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keyOrErrorForHostname, 0);
  objc_storeStrong(&self->_urlFilledOutBlock, 0);
  objc_storeStrong(&self->_downloadCompletionBlock, 0);
  objc_storeStrong(&self->_downloadCommandBlock, 0);
  objc_storeStrong(&self->_downloadProgressBlock, 0);
  objc_storeStrong(&self->_downloadPreparationBlock, 0);
  objc_storeStrong((id *)&self->_prepareMMCSItemsToDownloadInMemory, 0);
  objc_storeStrong((id *)&self->_prepareMMCSItemsToDownload, 0);
}

@end