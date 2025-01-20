@interface CKDUploadAssetsOperation
+ (id)nameForState:(unint64_t)a3;
+ (int64_t)isPredominatelyDownload;
- (BOOL)_didFetchUploadTokensForAssetTokenRequest:(id)a3 error:(id)a4 newError:(id *)a5;
- (BOOL)_fetchConfiguration;
- (BOOL)_fetchUploadTokens;
- (BOOL)_planPackageSectionItemsForMMCSItems:(id)a3;
- (BOOL)_planSectionsForPackage:(id)a3 error:(id *)a4;
- (BOOL)_prepareForUpload;
- (BOOL)_upload;
- (BOOL)atomic;
- (BOOL)makeStateTransition;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)supportsClearAssetEncryption;
- (BOOL)temporary;
- (CKDAssetRequestPlanner)assetRequestPlanner;
- (CKDCancelTokenGroup)cancelTokens;
- (CKDUploadAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)assetsToUpload;
- (NSDictionary)assetUUIDToExpectedProperties;
- (NSDictionary)packageUUIDToExpectedProperties;
- (NSMapTable)uploadTasksByPackages;
- (NSMutableArray)openedPackages;
- (OS_dispatch_queue)queue;
- (id)CKStatusReportLogGroups;
- (id)_openPackage:(id)a3;
- (id)_prepareAssetForUpload:(id)a3;
- (id)_preparePackageForUpload:(id)a3;
- (id)_prepareReferenceAssetForUpload:(id)a3;
- (id)_prepareReferencePackageForUpload:(id)a3;
- (id)uploadCompletionBlock;
- (id)uploadPreparationBlock;
- (id)uploadProgressBlock;
- (int)operationType;
- (unint64_t)maxPackageUploadsPerBatch;
- (void)_closeAllPackages;
- (void)_closePackage:(id)a3;
- (void)_collectMetricsFromCompletedItemGroup:(id)a3;
- (void)_collectMetricsFromCompletedItemGroupSet:(id)a3;
- (void)_collectMetricsFromMMCSOperationMetrics:(id)a3;
- (void)_didMakeProgressForAsset:(id)a3 progress:(double)a4;
- (void)_didMakeProgressForMMCSItem:(id)a3;
- (void)_didMakeProgressForMMCSSectionItem:(id)a3 task:(id)a4;
- (void)_didPrepareAsset:(id)a3;
- (void)_didPrepareAssetBatch:(id)a3 error:(id)a4;
- (void)_didUploadAsset:(id)a3 error:(id)a4;
- (void)_didUploadMMCSItem:(id)a3 error:(id)a4;
- (void)_didUploadMMCSItems:(id)a3 error:(id)a4;
- (void)_didUploadMMCSSectionItem:(id)a3 task:(id)a4 error:(id)a5;
- (void)_didUploadMMCSSectionItems:(id)a3 task:(id)a4 error:(id)a5;
- (void)_didUploadPackageWithTask:(id)a3;
- (void)_failAllItemsInAssetBatch:(id)a3 error:(id)a4;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_registerMMCSItems;
- (void)_removePackageManifests;
- (void)_uploadPackageSection:(id)a3 task:(id)a4 completionBlock:(id)a5;
- (void)_uploadPackageSectionsWithEnumerator:(id)a3 task:(id)a4 completionBlock:(id)a5;
- (void)_uploadPackageSectionsWithPendingTasks:(id)a3 uploadingTasks:(id)a4 completedTasks:(id)a5;
- (void)_uploadPackageSectionsWithTask:(id)a3 completionBlock:(id)a4;
- (void)cancel;
- (void)finishWithError:(id)a3;
- (void)main;
- (void)setAssetUUIDToExpectedProperties:(id)a3;
- (void)setAssetsToUpload:(id)a3;
- (void)setAtomic:(BOOL)a3;
- (void)setCancelTokens:(id)a3;
- (void)setMaxPackageUploadsPerBatch:(unint64_t)a3;
- (void)setOpenedPackages:(id)a3;
- (void)setPackageUUIDToExpectedProperties:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setTemporary:(BOOL)a3;
- (void)setUploadCompletionBlock:(id)a3;
- (void)setUploadPreparationBlock:(id)a3;
- (void)setUploadProgressBlock:(id)a3;
- (void)setUploadTasksByPackages:(id)a3;
@end

@implementation CKDUploadAssetsOperation

- (CKDUploadAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v62.receiver = self;
  v62.super_class = (Class)CKDUploadAssetsOperation;
  v8 = [(CKDDatabaseOperation *)&v62 initWithOperationInfo:v6 container:v7];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_qos_class_t v12 = objc_msgSend_QOSClass(v8, v10, v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v9, v12, 0);

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.cloudkit.upload", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    v18 = objc_msgSend_assetsToUpload(v6, v16, v17);
    uint64_t v20 = objc_msgSend_sortedArrayUsingComparator_(v18, v19, (uint64_t)&unk_1F2043550);
    assetsToUpload = v8->_assetsToUpload;
    v8->_assetsToUpload = (NSArray *)v20;

    v22 = objc_alloc_init(CKDCancelTokenGroup);
    cancelTokens = v8->_cancelTokens;
    v8->_cancelTokens = v22;

    v26 = objc_msgSend_containerID(v7, v24, v25);
    if (objc_msgSend_specialContainerType(v26, v27, v28) == 5)
    {
      v31 = objc_msgSend_group(v6, v29, v30);
      v34 = objc_msgSend_name(v31, v32, v33);
      int isEqualToString = objc_msgSend_isEqualToString_(v34, v35, @"Compute State Upload");

      if (isEqualToString)
      {
        v37 = [CKDAssetRequestPlanner alloc];
        v39 = (CKDAssetRequestPlanner *)objc_msgSend_initWithAssetTokenRequestSizeLimit_(v37, v38, 0xFFFFFFFFLL);
LABEL_7:
        assetRequestPlanner = v8->_assetRequestPlanner;
        v8->_assetRequestPlanner = v39;

        uint64_t v43 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v41, v42);
        uploadTasksByPackages = v8->_uploadTasksByPackages;
        v8->_uploadTasksByPackages = (NSMapTable *)v43;

        uint64_t v47 = objc_msgSend_assetUUIDToExpectedProperties(v6, v45, v46);
        assetUUIDToExpectedProperties = v8->_assetUUIDToExpectedProperties;
        v8->_assetUUIDToExpectedProperties = (NSDictionary *)v47;

        uint64_t v51 = objc_msgSend_packageUUIDToExpectedProperties(v6, v49, v50);
        packageUUIDToExpectedProperties = v8->_packageUUIDToExpectedProperties;
        v8->_packageUUIDToExpectedProperties = (NSDictionary *)v51;

        v8->_temporary = objc_msgSend_temporary(v6, v53, v54);
        v8->_shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v6, v55, v56);
        uint64_t v59 = objc_msgSend_cloneContextsBySignature(v6, v57, v58);
        cloneContextsBySignature = v8->_cloneContextsBySignature;
        v8->_cloneContextsBySignature = (NSDictionary *)v59;

        goto LABEL_8;
      }
    }
    else
    {
    }
    v39 = objc_alloc_init(CKDAssetRequestPlanner);
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (int)operationType
{
  return 0;
}

- (id)CKStatusReportLogGroups
{
  v19.receiver = self;
  v19.super_class = (Class)CKDUploadAssetsOperation;
  v3 = [(CKDOperation *)&v19 CKStatusReportLogGroups];
  id v6 = objc_msgSend_assetRequestPlanner(self, v4, v5);
  v9 = objc_msgSend_assetRegisterAndPutBatches(v6, v7, v8);
  uint64_t v11 = objc_msgSend_CKFlatMap_(v9, v10, (uint64_t)&unk_1F20434B0);

  if (objc_msgSend_count(v11, v12, v13))
  {
    if (!v3) {
      v3 = objc_opt_new();
    }
    v16 = objc_msgSend_mutableCopy(v11, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, @"MMCS Items");
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
      objc_msgSend_setState_(self, v9, 2);
      BOOL result = MEMORY[0x1F4181798](self, sel__fetchConfiguration, v11);
      break;
    case 2:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_setState_(self, v12, 3);
      BOOL result = objc_msgSend__prepareForUpload(self, v13, v14);
      break;
    case 3:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_hash(self, v15, v16);
      kdebug_trace();
      objc_msgSend_setState_(self, v17, 4);
      BOOL result = MEMORY[0x1F4181798](self, sel__fetchUploadTokens, v18);
      break;
    case 4:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_hash(self, v19, v20);
      kdebug_trace();
      objc_msgSend_setState_(self, v21, 5);
      BOOL result = MEMORY[0x1F4181798](self, sel__upload, v22);
      break;
    case 5:
      objc_msgSend_hash(self, v9, v10);
      kdebug_trace();
      objc_msgSend_setState_(self, v23, 0xFFFFFFFFLL);
      v26 = objc_msgSend_error(self, v24, v25);
      objc_msgSend_finishWithError_(self, v27, (uint64_t)v26);

      goto LABEL_15;
    default:
LABEL_15:
      BOOL result = 1;
      break;
  }
  return result;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 4)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDUploadAssetsOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F4128[a3 - 2];
  }
  return v3;
}

- (id)_openPackage:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 302, @"Expected non-nil package");
  }
  id v26 = 0;
  int v8 = objc_msgSend_openWithError_(v7, v5, (uint64_t)&v26);
  id v9 = v26;
  if (v8)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    uint64_t v13 = objc_msgSend_openedPackages(v10, v11, v12);
    BOOL v14 = v13 == 0;

    if (v14)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v17 = objc_msgSend_initWithObjects_(v20, v21, (uint64_t)v7, 0);
      objc_msgSend_setOpenedPackages_(v10, v22, (uint64_t)v17);
    }
    else
    {
      uint64_t v17 = objc_msgSend_openedPackages(v10, v15, v16);
      objc_msgSend_addObject_(v17, v18, (uint64_t)v7);
    }

    objc_sync_exit(v10);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    objc_super v19 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_error_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_ERROR, "Failed to open package %@: %@", buf, 0x16u);
    }
  }

  return v9;
}

- (void)_closePackage:(id)a3
{
  id v21 = a3;
  if (!v21)
  {
    objc_super v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 320, @"Expected non-nil package");
  }
  id v7 = self;
  objc_sync_enter(v7);
  uint64_t v10 = objc_msgSend_openedPackages(v7, v8, v9);
  int v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v21);

  if (v12)
  {
    uint64_t v15 = objc_msgSend_openedPackages(v7, v13, v14);
    objc_msgSend_removeObject_(v15, v16, (uint64_t)v21);

    objc_sync_exit(v7);
    objc_msgSend_close(v21, v17, v18);
  }
  else
  {
    objc_sync_exit(v7);
  }
}

- (void)_closeAllPackages
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  objc_super v5 = objc_msgSend_openedPackages(v2, v3, v4);
  objc_msgSend_setOpenedPackages_(v2, v6, 0);
  objc_sync_exit(v2);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_close(*(void **)(*((void *)&v14 + 1) + 8 * v13++), v9, v10, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v14, v18, 16);
    }
    while (v11);
  }
}

- (void)_didPrepareAsset:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 348, @"Expected non-nil asset for %@", self);
  }
  int v8 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E39C94;
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
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 356, @"Expected non-nil asset for %@", self);
  }
  uint64_t v10 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E39E24;
  block[3] = &unk_1E64F19C0;
  block[4] = self;
  id v15 = v9;
  double v16 = a4;
  id v11 = v9;
  dispatch_async(v10, block);
}

- (void)_didUploadAsset:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v11 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    id v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 364, @"Expected non-nil asset for %@", self);

    if (v11) {
      goto LABEL_5;
    }
  }
  if ((objc_msgSend_uploaded(v7, v9, v10) & 1) == 0)
  {
    long long v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 365, @"Expected asset %@ to be marked as uploaded for %@", v7, self);
  }
LABEL_5:
  uint64_t v12 = objc_msgSend_callbackQueue(self, v9, v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E3A028;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v20 = v7;
  id v21 = v11;
  id v13 = v11;
  id v14 = v7;
  dispatch_async(v12, block);
}

- (BOOL)_planSectionsForPackage:(id)a3 error:(id *)a4
{
  uint64_t v225 = *MEMORY[0x1E4F143B8];
  id v180 = a3;
  v191 = self;
  id v7 = objc_msgSend_container(self, v5, v6);
  v178 = objc_msgSend_MMCS(v7, v8, v9);

  unsigned int MaxChunkCountForSection = objc_msgSend_getMaxChunkCountForSection(v178, v10, v11);
  if (!MaxChunkCountForSection)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v12, *MEMORY[0x1E4F19DD8], 1000, @"Invalid maxSectionChunkCount value: %lu", 0);
      BOOL v145 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v145 = 0;
    }
    goto LABEL_83;
  }
  id v13 = [CKDMMCSPackageSignatureGenerator alloc];
  double v16 = objc_msgSend_boundaryKey(v180, v14, v15);
  v181 = objc_msgSend_initWithBoundaryKey_(v13, v17, (uint64_t)v16);

  uint64_t v18 = [CKDMMCSPackageSignatureGenerator alloc];
  id v21 = objc_msgSend_boundaryKey(v180, v19, v20);
  v196 = objc_msgSend_initWithBoundaryKey_(v18, v22, (uint64_t)v21);

  id v23 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v201 = objc_msgSend_initWithCapacity_(v23, v24, 100);
  v200 = objc_msgSend_itemEnumerator(v180, v25, v26);
  uint64_t v212 = 0;
  v213 = &v212;
  uint64_t v214 = 0x3032000000;
  v215 = sub_1C4E3AF8C;
  v216 = sub_1C4E3AF9C;
  id v217 = 0;
  uint64_t v185 = 0;
  uint64_t v186 = 0;
  uint64_t v197 = 0;
  uint64_t v198 = 0;
  unsigned int v193 = 0;
  unsigned int v199 = 0;
  unsigned int v195 = 0;
  dispatch_semaphore_t v177 = dispatch_semaphore_create(0);
  uint64_t v175 = *MEMORY[0x1E4F19DD8];
  do
  {
    if (objc_msgSend_isCancelled(v191, v27, v28))
    {
      uint64_t v146 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v29, v175, 1, @"Operation was cancelled");
      v147 = (void *)v213[5];
      v213[5] = v146;

      if (v213[5]) {
        goto LABEL_64;
      }
      goto LABEL_66;
    }
    while ((unint64_t)objc_msgSend_count(v201, v29, v30) <= 0x63 && v200)
    {
      v34 = objc_msgSend_nextObject(v200, v31, v32);
      if (!v34)
      {

        v200 = 0;
        break;
      }
      objc_msgSend_addObject_(v201, v33, (uint64_t)v34);
    }
    if (!objc_msgSend_count(v201, v31, v32)) {
      break;
    }
    v209[0] = MEMORY[0x1E4F143A8];
    v209[1] = 3221225472;
    v209[2] = sub_1C4E3AFA4;
    v209[3] = &unk_1E64F3FD0;
    id v194 = v180;
    id v210 = v194;
    v211 = v191;
    uint64_t v36 = objc_msgSend_CKMap_(v201, v35, (uint64_t)v209);
    v37 = [CKDMMCSItemGroupSet alloc];
    v184 = objc_msgSend_initWithItems_(v37, v38, v36);
    v182 = (void *)v36;
    if (objc_msgSend_useMMCSEncryptionV2(v194, v39, v40)) {
      uint64_t v41 = 66;
    }
    else {
      uint64_t v41 = 2;
    }
    v206[0] = MEMORY[0x1E4F143A8];
    v206[1] = 3221225472;
    v206[2] = sub_1C4E3B0F4;
    v206[3] = &unk_1E64F3FF8;
    v208 = &v212;
    uint64_t v42 = v177;
    v207 = v42;
    v189 = objc_msgSend_registerItemGroupSet_operation_options_completionHandler_(v178, v43, (uint64_t)v184, v191, v41, v206);
    uint64_t v46 = objc_msgSend_cancelTokens(v191, v44, v45);
    objc_msgSend_addCancelToken_withOperation_(v46, v47, (uint64_t)v189, v191);

    dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v50 = objc_msgSend_cancelTokens(v191, v48, v49);
    objc_msgSend_removeCancelToken_(v50, v51, (uint64_t)v189);

    uint64_t v179 = v213[5];
    if (v179)
    {
      int v52 = 1;
      goto LABEL_54;
    }
    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    id obj = v182;
    uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v202, v224, 16);
    if (!v54)
    {
      int v52 = 1;
      goto LABEL_53;
    }
    uint64_t v190 = 0;
    uint64_t v188 = *(void *)v203;
LABEL_17:
    uint64_t v57 = 0;
    uint64_t v187 = v54;
    while (1)
    {
      if (*(void *)v203 != v188) {
        objc_enumerationMutation(obj);
      }
      uint64_t v58 = *(void **)(*((void *)&v202 + 1) + 8 * v57);
      uint64_t v59 = objc_msgSend_error(v58, v55, v56);
      v60 = (void *)v213[5];
      v213[5] = v59;

      if (v213[5]) {
        goto LABEL_52;
      }
      v63 = objc_msgSend_signature(v58, v61, v62);
      v66 = objc_msgSend_zeroSizeFileSignature(CKDMMCS, v64, v65);
      int isEqualToData = objc_msgSend_isEqualToData_(v63, v67, (uint64_t)v66);

      if ((isEqualToData & 1) != 0
        || !objc_msgSend_chunkCount(v58, v69, v70)
        || !objc_msgSend_fileSize(v58, v69, v70))
      {
        v71 = (void *)MEMORY[0x1E4F1A3B8];
        v72 = objc_msgSend_signature(v58, v69, v70);
        LODWORD(v71) = objc_msgSend_isValidV2Signature_(v71, v73, (uint64_t)v72);

        if ((v71 | isEqualToData))
        {
          if (objc_msgSend_chunkCount(v58, v74, v75))
          {
            int v173 = 465;
            v174 = "MMCSItem.chunkCount == 0 && \"Expected MMCSItem.chunkCount == 0\"";
          }
          else
          {
            if (!objc_msgSend_fileSize(v58, v76, v77))
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v78 = (id)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v138 = objc_msgSend_itemID(v58, v79, v80);
                *(_DWORD *)buf = 134217984;
                uint64_t v219 = v138;
                _os_log_debug_impl(&dword_1C4CFF000, v78, OS_LOG_TYPE_DEBUG, "Zero-length asset with itemID %llu", buf, 0xCu);
              }

              goto LABEL_32;
            }
            int v173 = 466;
            v174 = "MMCSItem.fileSize == 0 && \"Expected MMCSItem.size == 0\"";
          }
        }
        else
        {
          int v173 = 463;
          v174 = "isZeroFileSignature && \"Expected zeroSizeFileSignature\"";
        }
LABEL_88:
        __assert_rtn("-[CKDUploadAssetsOperation _planSectionsForPackage:error:]", "CKDUploadAssetsOperation.m", v173, v174);
      }
LABEL_32:
      if (v190 + v57 >= (unint64_t)objc_msgSend_count(v201, v69, v70))
      {
        int v173 = 470;
        v174 = "i < packageItems.count";
        goto LABEL_88;
      }
      v84 = objc_msgSend_objectAtIndexedSubscript_(v201, v81, v190 + v57);
      if (MaxChunkCountForSection < v199) {
        break;
      }
      if (MaxChunkCountForSection < objc_msgSend_chunkCount(v58, v82, v83) + v199)
      {
        v87 = objc_msgSend_dataByFinishingSignature(v196, v85, v86);
        v90 = objc_msgSend_dataByFinishingVerificationKey(v196, v88, v89);
        id v91 = objc_alloc(MEMORY[0x1E4F1A260]);
        v93 = objc_msgSend_initWithIndex_signature_size_paddedSize_verificationKey_(v91, v92, v193, v87, v197, v198, v90);
        objc_msgSend_addSection_(v194, v94, (uint64_t)v93);
        v97 = objc_msgSend_signature(v93, v95, v96);
        objc_msgSend_updateWithData_(v181, v98, (uint64_t)v97);

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v99 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v219 = (uint64_t)v93;
          __int16 v220 = 2048;
          uint64_t v221 = v195;
          __int16 v222 = 2048;
          uint64_t v223 = v199;
          _os_log_debug_impl(&dword_1C4CFF000, v99, OS_LOG_TYPE_DEBUG, "Added section %@ with %lu items and %lu chunks", buf, 0x20u);
        }
        v100 = [CKDMMCSPackageSignatureGenerator alloc];
        v103 = objc_msgSend_boundaryKey(v194, v101, v102);
        uint64_t v105 = objc_msgSend_initWithBoundaryKey_(v100, v104, (uint64_t)v103);

        unsigned int v195 = 0;
        unsigned int v199 = 0;
        ++v193;
        v186 += v197;
        v185 += v198;
        v196 = (void *)v105;
        uint64_t v197 = 0;
        uint64_t v198 = 0;
      }
      uint64_t v106 = objc_msgSend_fileSize(v58, v85, v86);
      v109 = objc_msgSend_assetZoneKey(v58, v107, v108);
      v112 = objc_msgSend_useMMCSEncryptionV2(v109, v110, v111);
      int v115 = objc_msgSend_BOOLValue(v112, v113, v114);

      if (v115) {
        uint64_t v118 = objc_msgSend_paddedFileSize(v58, v116, v117);
      }
      else {
        uint64_t v118 = 0;
      }
      int v119 = objc_msgSend_chunkCount(v58, v116, v117);
      v122 = objc_msgSend_signature(v58, v120, v121);
      objc_msgSend_updateWithData_(v196, v123, (uint64_t)v122);

      uint64_t v126 = objc_msgSend_packageIndex(v84, v124, v125);
      v129 = objc_msgSend_signature(v58, v127, v128);
      uint64_t v132 = objc_msgSend_fileSize(v58, v130, v131);
      uint64_t v135 = objc_msgSend_itemID(v58, v133, v134);
      objc_msgSend_updateItemAtIndex_withSignature_size_paddedSize_itemID_sectionIndex_(v194, v136, v126, v129, v132, v118, v135, v193);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v137 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v219 = (uint64_t)v58;
        __int16 v220 = 2048;
        uint64_t v221 = v193;
        _os_log_debug_impl(&dword_1C4CFF000, v137, OS_LOG_TYPE_DEBUG, "Added item %@ to section %lu", buf, 0x16u);
      }

      v197 += v106;
      v199 += v119;
      v198 += v118;
      ++v195;
      if (v187 == ++v57)
      {
        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v202, v224, 16);
        v190 += v57;
        int v52 = 1;
        if (!v54) {
          goto LABEL_53;
        }
        goto LABEL_17;
      }
    }
    uint64_t v139 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v82, v175, 1000, @"Invalid sectionChunkCount value: %lu", v199);
    v140 = (void *)v213[5];
    v213[5] = v139;

LABEL_52:
    int v52 = 0;
LABEL_53:

    objc_msgSend_removeAllObjects(v201, v141, v142);
LABEL_54:
  }
  while (!v179 && v52);
  if (!v213[5])
  {
LABEL_66:
    if (v195)
    {
      v148 = objc_msgSend_dataByFinishingSignature(v196, v27, v28);
      v151 = objc_msgSend_dataByFinishingVerificationKey(v196, v149, v150);
      id v152 = objc_alloc(MEMORY[0x1E4F1A260]);
      v154 = objc_msgSend_initWithIndex_signature_size_paddedSize_verificationKey_(v152, v153, v193, v148, v197, v198, v151);
      objc_msgSend_addSection_(v180, v155, (uint64_t)v154);
      v158 = objc_msgSend_signature(v154, v156, v157);
      objc_msgSend_updateWithData_(v181, v159, (uint64_t)v158);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v160 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v219 = (uint64_t)v154;
        __int16 v220 = 2048;
        uint64_t v221 = v195;
        __int16 v222 = 2048;
        uint64_t v223 = v199;
        _os_log_debug_impl(&dword_1C4CFF000, v160, OS_LOG_TYPE_DEBUG, "Added last section %@ with %lu items and %lu chunks", buf, 0x20u);
      }

      v186 += v197;
      v185 += v198;
    }
    v161 = objc_msgSend_dataByFinishingSignature(v181, v27, v28);
    objc_msgSend_setSignature_(v180, v162, (uint64_t)v161);

    if (objc_msgSend_useMMCSEncryptionV2(v180, v163, v164))
    {
      objc_msgSend_setPaddedSize_(v180, v165, v185);
      objc_msgSend_setSize_(v180, v166, v186);
      v169 = objc_msgSend_dataByFinishingVerificationKey(v181, v167, v168);
      objc_msgSend_setVerificationKey_(v180, v170, (uint64_t)v169);
    }
    else
    {
      objc_msgSend_setSize_(v180, v165, v186);
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v171 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v219 = (uint64_t)v180;
      _os_log_debug_impl(&dword_1C4CFF000, v171, OS_LOG_TYPE_DEBUG, "Created sections for package %@", buf, 0xCu);
    }
    BOOL v145 = 1;
    goto LABEL_82;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v143 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v144 = v213[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v219 = (uint64_t)v180;
    __int16 v220 = 2112;
    uint64_t v221 = v144;
    _os_log_error_impl(&dword_1C4CFF000, v143, OS_LOG_TYPE_ERROR, "Failed to create sections for package %@: %@", buf, 0x16u);
  }
LABEL_64:
  BOOL v145 = 0;
  if (a4) {
    *a4 = (id) v213[5];
  }
LABEL_82:

  _Block_object_dispose(&v212, 8);
LABEL_83:

  return v145;
}

- (void)_didPrepareAssetBatch:(id)a3 error:(id)a4
{
  uint64_t v210 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned int v193 = v7;
  id v194 = v6;
  if (v7)
  {
    id v12 = v7;
    goto LABEL_29;
  }
  objc_msgSend_firstMMCSItemError(v6, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    uint64_t v13 = objc_msgSend_packageUUIDToExpectedProperties(self, v10, v11);
    if (v13 && (v16 = (void *)v13, int v17 = objc_msgSend_isPackageSectionBatch(v6, v14, v15), v16, v17))
    {
      uint64_t v18 = objc_msgSend_allMMCSAndSectionItems(v6, v14, v15);
      uint64_t v21 = objc_msgSend_count(v18, v19, v20);

      if (v21)
      {
        uint64_t v22 = objc_msgSend_allMMCSAndSectionItems(v6, v10, v11);
        uint64_t v25 = objc_msgSend_firstObject(v22, v23, v24);
        uint64_t v28 = objc_msgSend_package(v25, v26, v27);

        uint64_t v31 = objc_msgSend_packageUUIDToExpectedProperties(self, v29, v30);
        v34 = objc_msgSend_UUID(v28, v32, v33);
        uint64_t v36 = objc_msgSend_objectForKey_(v31, v35, (uint64_t)v34);

        if (v36)
        {
          v39 = objc_msgSend_allMMCSAndSectionItems(v6, v37, v38);
          uint64_t v42 = objc_msgSend_count(v39, v40, v41);
          uint64_t v45 = objc_msgSend_count(v36, v43, v44);

          if (v42 != v45)
          {
            v113 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v114 = *MEMORY[0x1E4F19DD8];
            uint64_t v115 = objc_msgSend_count(v36, v46, v47);
            uint64_t v57 = objc_msgSend_allMMCSAndSectionItems(v6, v116, v117);
            uint64_t v120 = objc_msgSend_count(v57, v118, v119);
            objc_msgSend_errorWithDomain_code_format_(v113, v121, v114, 3012, @"Number of expected file signatures did not match number of assets in package %@ (%lu versus %lu)", v28, v115, v120);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

            goto LABEL_28;
          }
          v48 = objc_msgSend_allMMCSAndSectionItems(v6, v46, v47);
          uint64_t v51 = objc_msgSend_count(v48, v49, v50);

          if (v51)
          {
            unint64_t v54 = 0;
            while (1)
            {
              v55 = objc_msgSend_allMMCSAndSectionItems(v6, v52, v53);
              uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(v55, v56, v54);

              uint64_t v59 = objc_msgSend_objectAtIndexedSubscript_(v36, v58, v54);
              uint64_t v62 = objc_msgSend_fileSignature(v59, v60, v61);

              if (v62)
              {
                uint64_t v65 = objc_msgSend_signature(v57, v63, v64);
                char isEqualToData = objc_msgSend_isEqualToData_(v62, v66, (uint64_t)v65);

                if ((isEqualToData & 1) == 0) {
                  break;
                }
              }

              ++v54;
              id v6 = v194;
              v71 = objc_msgSend_allMMCSAndSectionItems(v194, v69, v70);
              unint64_t v74 = objc_msgSend_count(v71, v72, v73);

              if (v54 >= v74) {
                goto LABEL_14;
              }
            }
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v68, *MEMORY[0x1E4F19DD8], 3012, @"Did not find expected file signature for item %@ in package %@", v57, v28);
            id v12 = (id)objc_claimAutoreleasedReturnValue();

            id v6 = v194;
            goto LABEL_27;
          }
        }
LABEL_14:
        id v12 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v75 = objc_msgSend_assetUUIDToExpectedProperties(self, v14, v15);
      if (v75)
      {
        v76 = (void *)v75;
        char isPackageSectionBatch = objc_msgSend_isPackageSectionBatch(v6, v10, v11);

        if ((isPackageSectionBatch & 1) == 0)
        {
          v78 = objc_msgSend_allMMCSItems(v6, v10, v11);
          uint64_t v81 = objc_msgSend_count(v78, v79, v80);

          if (v81)
          {
            unint64_t v82 = 0;
            while (1)
            {
              uint64_t v83 = objc_msgSend_allMMCSItems(v6, v10, v11);
              v85 = objc_msgSend_objectAtIndexedSubscript_(v83, v84, v82);

              uint64_t v88 = objc_msgSend_asset(v85, v86, v87);
              if (v88)
              {
                id v91 = (void *)v88;
                v92 = objc_msgSend_assetUUIDToExpectedProperties(self, v89, v90);
                v95 = objc_msgSend_UUID(v91, v93, v94);
                v97 = objc_msgSend_objectForKey_(v92, v96, (uint64_t)v95);
                v100 = objc_msgSend_fileSignature(v97, v98, v99);

                if (v100)
                {
                  v103 = objc_msgSend_signature(v85, v101, v102);
                  int v105 = objc_msgSend_isEqualToData_(v100, v104, (uint64_t)v103);

                  if (!v105)
                  {
                    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v106, *MEMORY[0x1E4F19DD8], 3012, @"Did not find expected file signature for asset %@", v91);
                    id v12 = (id)objc_claimAutoreleasedReturnValue();

                    id v6 = v194;
                    goto LABEL_29;
                  }
                }

                id v6 = v194;
              }

              ++v82;
              v109 = objc_msgSend_allMMCSItems(v6, v107, v108);
              unint64_t v112 = objc_msgSend_count(v109, v110, v111);

              id v12 = 0;
              if (v82 >= v112) {
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
    id v12 = 0;
  }
LABEL_29:
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  objc_msgSend_allMMCSItems(v6, v10, v11);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v122, (uint64_t)&v197, v209, 16);
  uint64_t v126 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (!v123) {
    goto LABEL_57;
  }
  uint64_t v127 = v123;
  uint64_t v128 = *(void *)v198;
  uint64_t v195 = *MEMORY[0x1E4F19DD8];
  v129 = self;
  do
  {
    uint64_t v130 = 0;
    do
    {
      if (*(void *)v198 != v128) {
        objc_enumerationMutation(obj);
      }
      uint64_t v131 = *(void **)(*((void *)&v197 + 1) + 8 * v130);
      uint64_t v132 = objc_msgSend_package(v131, v124, v125);
      v137 = objc_msgSend_asset(v131, v133, v134);
      if (v12)
      {
        if (v132)
        {
          uint64_t v138 = objc_msgSend_uploadTasksByPackages(self, v135, v136);
          objc_msgSend_removeObjectForKey_(v138, v139, (uint64_t)v132);

          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          os_log_t v140 = *v126;
          if (os_log_type_enabled(*v126, OS_LOG_TYPE_ERROR))
          {
            v166 = v140;
            v169 = objc_msgSend_operationID(v129, v167, v168);
            *(_DWORD *)buf = 138413058;
            long long v202 = v131;
            __int16 v203 = 2112;
            uint64_t v204 = (uint64_t)v132;
            __int16 v205 = 2114;
            id v206 = v169;
            __int16 v207 = 2112;
            id v208 = v12;
            _os_log_error_impl(&dword_1C4CFF000, v166, OS_LOG_TYPE_ERROR, "Failed to register MMCS item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);

            uint64_t v126 = (os_log_t *)MEMORY[0x1E4F1A500];
          }
LABEL_40:
          self = v129;
          objc_msgSend__didUploadAsset_error_(v129, v141, (uint64_t)v132, v12);
          goto LABEL_50;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        os_log_t v156 = *v126;
        if (os_log_type_enabled(*v126, OS_LOG_TYPE_ERROR))
        {
          v170 = v156;
          int v173 = objc_msgSend_operationID(v129, v171, v172);
          *(_DWORD *)buf = 138412802;
          long long v202 = v131;
          __int16 v203 = 2114;
          uint64_t v204 = (uint64_t)v173;
          __int16 v205 = 2112;
          id v206 = v12;
          _os_log_error_impl(&dword_1C4CFF000, v170, OS_LOG_TYPE_ERROR, "Failed to register MMCS item %@ for operation %{public}@: %@", buf, 0x20u);

          uint64_t v126 = (os_log_t *)MEMORY[0x1E4F1A500];
        }
        self = v129;
        objc_msgSend__didUploadAsset_error_(v129, v157, (uint64_t)v137, v12);
      }
      else
      {
        if (v132)
        {
          if (!objc_msgSend_fileSize(v131, v135, v136))
          {
            v158 = objc_msgSend_uploadTasksByPackages(self, v142, v143);
            objc_msgSend_removeObjectForKey_(v158, v159, (uint64_t)v132);

            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v160, v195, 1000, @"Invalid size for the manifest for package %@", v132);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            os_log_t v161 = *v126;
            if (os_log_type_enabled(*v126, OS_LOG_TYPE_ERROR))
            {
              v162 = v161;
              v165 = objc_msgSend_operationID(v129, v163, v164);
              *(_DWORD *)buf = 138413058;
              long long v202 = v131;
              __int16 v203 = 2112;
              uint64_t v204 = (uint64_t)v132;
              __int16 v205 = 2114;
              id v206 = v165;
              __int16 v207 = 2112;
              id v208 = v12;
              _os_log_error_impl(&dword_1C4CFF000, v162, OS_LOG_TYPE_ERROR, "Invalid package manifest size for MMCS item %@, package %@ and operation %{public}@: %@", buf, 0x2Au);

              uint64_t v126 = (os_log_t *)MEMORY[0x1E4F1A500];
            }
            goto LABEL_40;
          }
          uint64_t v144 = objc_msgSend_size(v132, v142, v143);
          uint64_t v147 = objc_msgSend_fileSize(v131, v145, v146) + v144;
          uint64_t v150 = objc_msgSend_paddedSize(v132, v148, v149);
          uint64_t v153 = objc_msgSend_paddedFileSize(v131, v151, v152) + v150;
          uint64_t v126 = (os_log_t *)MEMORY[0x1E4F1A500];
          objc_msgSend_setPaddedSize_(v132, v154, v153);
          objc_msgSend_setSize_(v132, v155, v147);
        }
        id v12 = 0;
      }
LABEL_50:

      ++v130;
    }
    while (v127 != v130);
    uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v124, (uint64_t)&v197, v209, 16);
    uint64_t v127 = v174;
  }
  while (v174);
LABEL_57:

  if (v12) {
    objc_msgSend_failBatch_(self->_assetRequestPlanner, v175, (uint64_t)v194);
  }
  dispatch_semaphore_t v177 = objc_msgSend_authPutRequest(v194, v175, v176);
  unsigned int v180 = objc_msgSend_length(v177, v178, v179);
  unsigned int v183 = objc_msgSend_assetTokenRequestSizeLimit(self->_assetRequestPlanner, v181, v182);

  if (v183 < v180)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v184 = *v126;
    if (os_log_type_enabled(*v126, OS_LOG_TYPE_ERROR))
    {
      uint64_t v186 = v184;
      v189 = objc_msgSend_authPutRequest(v194, v187, v188);
      uint64_t v192 = objc_msgSend_length(v189, v190, v191);
      *(_DWORD *)buf = 138412546;
      long long v202 = v194;
      __int16 v203 = 2048;
      uint64_t v204 = v192;
      _os_log_error_impl(&dword_1C4CFF000, v186, OS_LOG_TYPE_ERROR, "Ignoring preAuthPutResponse for batch %@ : too big at %lu bytes", buf, 0x16u);
    }
    objc_msgSend_setAuthPutRequest_(v194, v185, 0);
  }
}

- (BOOL)_fetchConfiguration
{
  uint64_t v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  id v7 = objc_msgSend_container(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4E3BBB4;
  v10[3] = &unk_1E64F1CC8;
  v10[4] = self;
  objc_msgSend_fetchConfigurationForOperation_withCompletionHandler_(v7, v8, (uint64_t)self, v10);

  return 1;
}

- (id)_prepareAssetForUpload:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_fileURL(v4, v5, v6);
  uint64_t v12 = objc_msgSend_fileHandle(v4, v8, v9);
  if (!(v7 | v12) && (objc_msgSend_shouldReadAssetContentUsingClientProxy(v4, v10, v11) & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 1017, @"nil fileURL property");
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__didUploadAsset_error_(self, v30, (uint64_t)v4, v28);
    id v29 = 0;
    goto LABEL_20;
  }
  id v14 = [CKDMMCSItem alloc];
  uint64_t v17 = objc_msgSend_temporary(self, v15, v16);
  uint64_t v19 = objc_msgSend_initWithAsset_temporary_(v14, v18, (uint64_t)v4, v17);
  uint64_t v22 = objc_msgSend_UUID(v4, v20, v21);
  objc_msgSend_setTrackingUUID_(v19, v23, (uint64_t)v22);

  id v45 = 0;
  uint64_t v25 = objc_msgSend_getFileSizeWithOperation_error_(v19, v24, (uint64_t)self, &v45);
  id v28 = v45;
  if (!v25)
  {
    objc_msgSend__didUploadAsset_error_(self, v26, (uint64_t)v4, v28);
LABEL_18:
    id v29 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend_unsignedLongLongValue(v25, v26, v27))
  {
    uint64_t v31 = (void *)*MEMORY[0x1E4F1A548];
    if (v7)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v31);
      }
      uint64_t v32 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v35 = v32;
        uint64_t v38 = objc_msgSend_path((void *)v7, v36, v37);
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = (uint64_t)v38;
        _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Skipped uploading empty asset file at %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v31);
      }
      v39 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v12;
        _os_log_debug_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_DEBUG, "Skipped uploading empty asset file with filehandle %@", buf, 0xCu);
      }
    }
    uint64_t v40 = objc_msgSend_zeroSizeFileSignature(CKDMMCS, v33, v34);
    objc_msgSend_setSignature_(v4, v41, (uint64_t)v40);

    objc_msgSend_setUploaded_(v4, v42, 1);
    objc_msgSend__didUploadAsset_error_(self, v43, (uint64_t)v4, 0);
    goto LABEL_18;
  }
  id v29 = v19;
LABEL_19:

LABEL_20:
  return v29;
}

- (id)_prepareReferenceAssetForUpload:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_container(self, v5, v6);
  uint64_t v10 = objc_msgSend_MMCS(v7, v8, v9);

  if (objc_msgSend_size(v4, v11, v12)
    || (objc_msgSend_signature(v4, v13, v14),
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_zeroSizeFileSignature(CKDMMCS, v16, v17),
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        int isEqualToData = objc_msgSend_isEqualToData_(v15, v19, (uint64_t)v18),
        v18,
        v15,
        !isEqualToData))
  {
    uint64_t v24 = objc_msgSend_registeredMMCSItemForRereferencedAsset_(v10, v13, (uint64_t)v4);
    uint64_t v27 = v24;
    if (v24) {
      objc_msgSend_error(v24, v25, v26);
    }
    else {
    uint64_t v30 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v25, *MEMORY[0x1E4F19DD8], 1017, @"failed to create MMCS item for re-referenced asset");
    }
    if (v30)
    {
      objc_msgSend__didUploadAsset_error_(self, v28, (uint64_t)v4, v30);
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v31 = objc_msgSend_databaseScope(self, v28, v29);
    objc_msgSend_setupForReReferenceWithAsset_destinationDatabaseScope_(v27, v32, (uint64_t)v4, v31);
    v35 = objc_msgSend_assetZoneKey(v27, v33, v34);
    if (objc_msgSend_isCrossOwner(v35, v36, v37))
    {
      cloneContextsBySignature = self->_cloneContextsBySignature;
      uint64_t v41 = objc_msgSend_signature(v27, v38, v39);
      uint64_t v43 = objc_msgSend_objectForKey_(cloneContextsBySignature, v42, (uint64_t)v41);

      if (!v43)
      {
        uint64_t v30 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v44, *MEMORY[0x1E4F19DD8], 1017, @"no clone context for asset clone");
        objc_msgSend__didUploadAsset_error_(self, v49, (uint64_t)v4, v30);
        goto LABEL_17;
      }
      objc_msgSend_setCloneContext_(v35, v44, (uint64_t)v43);
    }
    id v45 = objc_msgSend_UUID(v4, v38, v39);
    objc_msgSend_setTrackingUUID_(v27, v46, (uint64_t)v45);

    objc_msgSend_addMMCSItem_(self->_assetRequestPlanner, v47, (uint64_t)v27);
    uint64_t v30 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v21 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v50 = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "Skiped rereference of empty asset", v50, 2u);
  }
  objc_msgSend_setUploaded_(v4, v22, 1);
  objc_msgSend__didUploadAsset_error_(self, v23, (uint64_t)v4, 0);
LABEL_19:

  return 0;
}

- (id)_preparePackageForUpload:(id)a3
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_container(self, v5, v6);
  uint64_t v9 = objc_msgSend__openPackage_(self, v8, (uint64_t)v4);
  if (v9)
  {
    id v11 = (id)v9;
    objc_msgSend__didUploadAsset_error_(self, v10, (uint64_t)v4, v9);
LABEL_8:
    id v63 = 0;
    goto LABEL_9;
  }
  id v156 = 0;
  char v12 = objc_msgSend__planSectionsForPackage_error_(self, v10, (uint64_t)v4, &v156);
  id v11 = v156;
  if ((v12 & 1) == 0)
  {
    objc_msgSend__didUploadAsset_error_(self, v13, (uint64_t)v4, v11);
    goto LABEL_8;
  }
  uint64_t v15 = objc_msgSend_directoryContext(v7, v13, v14);
  uint64_t v18 = objc_msgSend_temporaryDirectory(v15, v16, v17);
  uint64_t v19 = CKCreateGUID();
  uint64_t v21 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v18, v20, (uint64_t)v19, 0);

  uint64_t v22 = [CKDMMCSItem alloc];
  uint64_t v24 = objc_msgSend_initWithPackage_temporary_(v22, v23, (uint64_t)v4, 1);
  objc_msgSend_setManifestItem_(v4, v25, (uint64_t)v24);
  id v28 = objc_msgSend_UUID(v4, v26, v27);
  objc_msgSend_setTrackingUUID_(v24, v29, (uint64_t)v28);

  objc_msgSend_setFileURL_(v24, v30, (uint64_t)v21);
  objc_msgSend_setShouldReadRawEncryptedData_(v24, v31, 0);
  objc_msgSend_setIsPackageManifest_(v24, v32, 1);
  if (objc_msgSend_useEncryption(self, v33, v34))
  {
    uint64_t v152 = v21;
    uint64_t v153 = v24;
    uint64_t v37 = objc_msgSend_packageUUIDToExpectedProperties(self, v35, v36);
    uint64_t v40 = objc_msgSend_UUID(v4, v38, v39);
    uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v37, v41, (uint64_t)v40);
    uint64_t v45 = objc_msgSend_count(v42, v43, v44);
    if (v45 == objc_msgSend_sectionCount(v4, v46, v47) + 1)
    {
      v148 = objc_msgSend_packageUUIDToExpectedProperties(self, v48, v49);
      int v52 = objc_msgSend_UUID(v4, v50, v51);
      objc_msgSend_objectForKeyedSubscript_(v148, v53, (uint64_t)v52);
      unint64_t v54 = v150 = v37;
      uint64_t v57 = objc_msgSend_firstObject(v54, v55, v56);
      objc_msgSend_assetKey(v57, v58, v59);
      uint64_t v61 = v60 = v7;

      uint64_t v37 = v150;
      uint64_t v62 = (void *)v61;
      uint64_t v7 = v60;
    }
    else
    {
      uint64_t v62 = 0;
    }

    unsigned int v70 = objc_msgSend_useMMCSEncryptionV2(v4, v68, v69);
    if (v62)
    {
      uint64_t v24 = v153;
      objc_msgSend_setAssetKey_(v153, v71, (uint64_t)v62);
      id v74 = 0;
    }
    else
    {
      id v155 = 0;
      v76 = objc_msgSend_assetKeyWithType_error_(CKDMMCS, v71, v70, &v155);
      id v74 = v155;
      uint64_t v24 = v153;
      objc_msgSend_setAssetKey_(v153, v77, (uint64_t)v76);
    }
    uint64_t v21 = v152;
    v78 = objc_msgSend_assetKey(v24, v72, v73);

    if (v78 && !v74)
    {
      uint64_t v81 = objc_msgSend_packageUUIDToExpectedProperties(self, v79, v80);
      v84 = objc_msgSend_UUID(v4, v82, v83);
      uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v81, v85, (uint64_t)v84);
      uint64_t v89 = objc_msgSend_count(v86, v87, v88);
      if (v89 == objc_msgSend_sectionCount(v4, v90, v91) + 1)
      {
        uint64_t v147 = objc_msgSend_packageUUIDToExpectedProperties(self, v92, v93);
        objc_msgSend_UUID(v4, v94, v95);
        uint64_t v149 = v62;
        uint64_t v96 = v151 = v7;
        v98 = objc_msgSend_objectForKeyedSubscript_(v147, v97, (uint64_t)v96);
        objc_msgSend_firstObject(v98, v99, v100);
        uint64_t v102 = v101 = v81;
        int v105 = objc_msgSend_referenceSignature(v102, v103, v104);

        uint64_t v81 = v101;
        uint64_t v62 = v149;
        uint64_t v7 = v151;
      }
      else
      {
        int v105 = 0;
      }

      if (v105)
      {
        objc_msgSend_setReferenceSignature_(v153, v106, (uint64_t)v105);
      }
      else
      {
        uint64_t v108 = objc_msgSend_assetKey(v153, v106, v107);
        v110 = objc_msgSend_referenceSignatureFromAssetKey_(CKDMMCS, v109, (uint64_t)v108);
        objc_msgSend_setReferenceSignature_(v153, v111, (uint64_t)v110);
      }
      uint64_t v21 = v152;

      uint64_t v24 = v153;
      goto LABEL_32;
    }
    objc_msgSend__didUploadAsset_error_(self, v79, (uint64_t)v4, v11);

    id v63 = 0;
  }
  else
  {
    if (!objc_msgSend_useClearAssetEncryption(self, v35, v36))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v75 = *MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_DEBUG, "skipping asset keys on manifest item because encryption is disabled", buf, 2u);
LABEL_32:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
LABEL_34:
      unint64_t v112 = (os_log_t *)MEMORY[0x1E4F1A500];
      v113 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v135 = v113;
        uint64_t v138 = objc_msgSend_operationID(self, v136, v137);
        *(_DWORD *)buf = 138412546;
        id v158 = v4;
        __int16 v159 = 2114;
        v160 = v138;
        _os_log_debug_impl(&dword_1C4CFF000, v135, OS_LOG_TYPE_DEBUG, "Creating manifest for package %@ and operation %{public}@", buf, 0x16u);
      }
      v116 = objc_msgSend_path(v21, v114, v115);
      id v154 = v11;
      char v118 = objc_msgSend_writePackage_toFile_error_(CKDPackageManifest, v117, (uint64_t)v4, v116, &v154);
      id v119 = v154;

      uint64_t v120 = (void *)*MEMORY[0x1E4F1A548];
      if (v118)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v120);
        }
        os_log_t v121 = *v112;
        if (os_log_type_enabled(*v112, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v139 = v121;
          uint64_t v142 = objc_msgSend_operationID(self, v140, v141);
          *(_DWORD *)buf = 138412802;
          id v158 = v4;
          __int16 v159 = 2114;
          v160 = v142;
          __int16 v161 = 2114;
          id v162 = v21;
          _os_log_debug_impl(&dword_1C4CFF000, v139, OS_LOG_TYPE_DEBUG, "Wrote the package manifest for package %@ and operation %{public}@: %{public}@", buf, 0x20u);
        }
        v122 = [CKDPackageUploadTask alloc];
        uint64_t v125 = objc_msgSend_uploadProgressBlock(self, v123, v124);
        uint64_t v127 = objc_msgSend_initWithPackage_trackProgress_(v122, v126, (uint64_t)v4, v125 != 0);

        objc_msgSend_setMMCSManifestItem_(v127, v128, (uint64_t)v24);
        uint64_t v131 = objc_msgSend_uploadTasksByPackages(self, v129, v130);
        objc_msgSend_setObject_forKey_(v131, v132, (uint64_t)v127, v4);

        id v63 = v24;
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v120);
        }
        os_log_t v133 = *v112;
        if (os_log_type_enabled(*v112, OS_LOG_TYPE_ERROR))
        {
          uint64_t v143 = v133;
          uint64_t v146 = objc_msgSend_operationID(self, v144, v145);
          *(_DWORD *)buf = 138412802;
          id v158 = v4;
          __int16 v159 = 2114;
          v160 = v146;
          __int16 v161 = 2112;
          id v162 = v119;
          _os_log_error_impl(&dword_1C4CFF000, v143, OS_LOG_TYPE_ERROR, "Failed to create the manifest for package %@ and operation %{public}@: %@", buf, 0x20u);
        }
        objc_msgSend__didUploadAsset_error_(self, v134, (uint64_t)v4, v119);
        id v63 = 0;
      }
      id v11 = v119;
      goto LABEL_48;
    }
    uint64_t v66 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v65, *MEMORY[0x1E4F19DD8], 1000, @"clear asset key not supported for package manifests");

    objc_msgSend__didUploadAsset_error_(self, v67, (uint64_t)v4, v66);
    id v63 = 0;
    id v11 = (id)v66;
  }
LABEL_48:

LABEL_9:
  return v63;
}

- (id)_prepareReferencePackageForUpload:(id)a3
{
  id v4 = objc_msgSend_assets(a3, a2, (uint64_t)a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4E3CABC;
  v7[3] = &unk_1E64F4020;
  v7[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v7);

  return 0;
}

- (BOOL)_planPackageSectionItemsForMMCSItems:(id)a3
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id obj = a3;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v154, v162, 16);
  if (!v5)
  {
    BOOL v132 = 1;
    goto LABEL_55;
  }
  uint64_t v8 = v5;
  uint64_t v9 = *(void *)v155;
  uint64_t v10 = &OBJC_IVAR___CKDPRealTimeMessageAssociatedMergeableDeltas__identifier;
  unint64_t v11 = 0x1E64EE000uLL;
  char v12 = (os_log_t *)MEMORY[0x1E4F1A500];
  *(void *)&long long v7 = 138412546;
  long long v140 = v7;
  uint64_t v145 = self;
  uint64_t v141 = *(void *)v155;
LABEL_3:
  uint64_t v13 = 0;
  uint64_t v142 = v8;
  while (1)
  {
    if (*(void *)v155 != v9) {
      objc_enumerationMutation(obj);
    }
    uint64_t v14 = *(void **)(*((void *)&v154 + 1) + 8 * v13);
    uint64_t v148 = v10[35];
    objc_msgSend_addMMCSItem_(*(void **)((char *)&self->super.super.super.super.isa + v148), v6, (uint64_t)v14, v140);
    uint64_t v152 = objc_msgSend_package(v14, v15, v16);
    if (!v152) {
      goto LABEL_41;
    }
    uint64_t v143 = v13;
    uint64_t v19 = objc_msgSend_sectionCount(v152, v17, v18);
    id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v22 = objc_msgSend_initWithCapacity_(v20, v21, v19);
    uint64_t v25 = (void *)v22;
    if (v19) {
      break;
    }
LABEL_40:
    uint64_t v128 = objc_msgSend_uploadTasksByPackages(self, v23, v24);
    uint64_t v130 = objc_msgSend_objectForKey_(v128, v129, (uint64_t)v152);

    objc_msgSend_setMMCSSectionItems_(v130, v131, (uint64_t)v25);
    uint64_t v9 = v141;
    uint64_t v8 = v142;
    uint64_t v10 = &OBJC_IVAR___CKDPRealTimeMessageAssociatedMergeableDeltas__identifier;
    uint64_t v13 = v143;
LABEL_41:

    if (++v13 == v8)
    {
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v154, v162, 16);
      BOOL v132 = 1;
      if (!v8) {
        goto LABEL_55;
      }
      goto LABEL_3;
    }
  }
  uint64_t v26 = 0;
  uint64_t v150 = v19 + 1;
  uint64_t v146 = v19;
  uint64_t v147 = (void *)v22;
  while (1)
  {
    uint64_t v27 = objc_msgSend_sectionAtIndex_(v152, v23, v26);
    id v28 = objc_alloc(*(Class *)(v11 + 3456));
    uint64_t v30 = objc_msgSend_initWithPackage_(v28, v29, (uint64_t)v152);
    uint64_t v33 = objc_msgSend_UUID(v152, v31, v32);
    objc_msgSend_setTrackingUUID_(v30, v34, (uint64_t)v33);

    uint64_t v37 = objc_msgSend_signature(v27, v35, v36);
    objc_msgSend_setSignature_(v30, v38, (uint64_t)v37);

    uint64_t v43 = objc_msgSend_useMMCSEncryptionV2(v152, v39, v40)
        ? objc_msgSend_paddedSize(v27, v41, v42)
        : objc_msgSend_size(v27, v41, v42);
    objc_msgSend_setPaddedFileSize_(v30, v44, v43);
    uint64_t v47 = objc_msgSend_size(v27, v45, v46);
    objc_msgSend_setFileSize_(v30, v48, v47);
    uint64_t v51 = objc_msgSend_verificationKey(v27, v49, v50);
    objc_msgSend_setVerificationKey_(v30, v52, (uint64_t)v51);

    objc_msgSend_addObject_(v25, v53, (uint64_t)v30);
    if (!objc_msgSend_useEncryption(self, v54, v55)) {
      break;
    }
    uint64_t v58 = objc_msgSend_packageUUIDToExpectedProperties(self, v56, v57);
    uint64_t v61 = objc_msgSend_UUID(v152, v59, v60);
    id v63 = objc_msgSend_objectForKeyedSubscript_(v58, v62, (uint64_t)v61);
    v151 = v27;
    if (objc_msgSend_count(v63, v64, v65) == v150)
    {
      v68 = objc_msgSend_packageUUIDToExpectedProperties(self, v66, v67);
      v71 = objc_msgSend_UUID(v152, v69, v70);
      uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(v68, v72, (uint64_t)v71);
      uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(v73, v74, v26 + 1);
      v78 = objc_msgSend_assetKey(v75, v76, v77);

      uint64_t v27 = v151;
      self = v145;
    }
    else
    {
      v78 = 0;
    }

    unsigned int v84 = objc_msgSend_useMMCSEncryptionV2(v152, v82, v83);
    if (v78)
    {
      objc_msgSend_setAssetKey_(v30, v85, (uint64_t)v78);
      id v88 = 0;
    }
    else
    {
      id v153 = 0;
      uint64_t v89 = objc_msgSend_assetKeyWithType_error_(CKDMMCS, v85, v84, &v153);
      id v88 = v153;
      objc_msgSend_setAssetKey_(v30, v90, (uint64_t)v89);
    }
    uint64_t v91 = objc_msgSend_assetKey(v30, v86, v87);

    if (!v91 || v88)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v134 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v136 = v134;
        uint64_t v139 = objc_msgSend_trackingUUID(v30, v137, v138);
        *(_DWORD *)buf = 138543618;
        __int16 v159 = v139;
        __int16 v160 = 2112;
        id v161 = v88;
        _os_log_error_impl(&dword_1C4CFF000, v136, OS_LOG_TYPE_ERROR, "error creating asset key for manifest item %{public}@: %@", buf, 0x16u);

        uint64_t v27 = v151;
      }

      uint64_t v25 = v147;
      goto LABEL_54;
    }
    uint64_t v149 = v78;
    uint64_t v94 = objc_msgSend_packageUUIDToExpectedProperties(self, v92, v93);
    v97 = objc_msgSend_UUID(v152, v95, v96);
    uint64_t v99 = objc_msgSend_objectForKeyedSubscript_(v94, v98, (uint64_t)v97);
    if (objc_msgSend_count(v99, v100, v101) == v150)
    {
      uint64_t v104 = objc_msgSend_packageUUIDToExpectedProperties(self, v102, v103);
      uint64_t v107 = objc_msgSend_UUID(v152, v105, v106);
      v109 = objc_msgSend_objectForKeyedSubscript_(v104, v108, (uint64_t)v107);
      uint64_t v111 = objc_msgSend_objectAtIndexedSubscript_(v109, v110, v26 + 1);
      uint64_t v114 = objc_msgSend_referenceSignature(v111, v112, v113);

      uint64_t v115 = (void *)v114;
      self = v145;

      uint64_t v27 = v151;
    }
    else
    {
      uint64_t v115 = 0;
    }
    uint64_t v25 = v147;

    if (v115)
    {
      objc_msgSend_setReferenceSignature_(v30, v116, (uint64_t)v115);
    }
    else
    {
      char v118 = objc_msgSend_assetKey(v30, v116, v117);
      uint64_t v120 = objc_msgSend_referenceSignatureFromAssetKey_(CKDMMCS, v119, (uint64_t)v118);
      objc_msgSend_setReferenceSignature_(v30, v121, (uint64_t)v120);

      uint64_t v27 = v151;
    }
    char v12 = (os_log_t *)MEMORY[0x1E4F1A500];
    unint64_t v11 = 0x1E64EE000;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v122 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v124 = v122;
      uint64_t v127 = objc_msgSend_referenceSignature(v30, v125, v126);
      *(_DWORD *)buf = v140;
      __int16 v159 = v127;
      __int16 v160 = 2112;
      id v161 = v30;
      _os_log_debug_impl(&dword_1C4CFF000, v124, OS_LOG_TYPE_DEBUG, "created asset key with reference identifier %@ for mmcs section %@", buf, 0x16u);

      uint64_t v27 = v151;
    }

    uint64_t v19 = v146;
LABEL_37:
    if (objc_msgSend_paddedFileSize(v30, v80, v81)) {
      objc_msgSend_addMMCSSectionItem_(*(void **)((char *)&self->super.super.super.super.isa + v148), v123, (uint64_t)v30);
    }

    if (v19 == ++v26) {
      goto LABEL_40;
    }
  }
  if (!objc_msgSend_useClearAssetEncryption(self, v56, v57))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v79 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v79, OS_LOG_TYPE_DEBUG, "skipping asset keys on section item because encryption is disabled", buf, 2u);
    }
    goto LABEL_37;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v133 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C4CFF000, v133, OS_LOG_TYPE_ERROR, "clear asset key not supported for package sections.", buf, 2u);
  }
LABEL_54:

  BOOL v132 = 0;
LABEL_55:

  return v132;
}

- (void)_registerMMCSItems
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_container(self, a2, v2);
  uint64_t v53 = objc_msgSend_MMCS(v4, v5, v6);

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  objc_msgSend_assetRegisterAndPutBatches(self->_assetRequestPlanner, v7, v8);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v59, v63, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v60;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v59 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend_allMMCSItems(v16, v11, v12);
        if (objc_msgSend_count(v17, v18, v19))
        {
          uint64_t v22 = objc_msgSend_stateTransitionGroup(self, v20, v21);
          dispatch_group_enter(v22);

          id v23 = [CKDMMCSItemGroupSet alloc];
          uint64_t v25 = objc_msgSend_initWithItems_(v23, v24, (uint64_t)v17);
          id v28 = objc_msgSend_allItemGroups(v25, v26, v27);
          if (objc_msgSend_count(v28, v29, v30) != 1) {
            __assert_rtn("-[CKDUploadAssetsOperation _registerMMCSItems]", "CKDUploadAssetsOperation.m", 857, "itemGroupSet.allItemGroups.count == 1");
          }

          if (objc_msgSend_isRereferenceAssetBatch(v16, v31, v32))
          {
            v35 = objc_msgSend_assetZone(v16, v33, v34);
            uint64_t v38 = objc_msgSend_assetZoneKey(v35, v36, v37);
            uint64_t v41 = objc_msgSend_cloneContext(v38, v39, v40);
            objc_msgSend_setCloneContext_(v25, v42, (uint64_t)v41);

            uint64_t v43 = 16;
          }
          else if (objc_msgSend_useMMCSEncryptionV2(v16, v33, v34))
          {
            uint64_t v43 = 82;
          }
          else
          {
            uint64_t v43 = 18;
          }
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = sub_1C4E3D61C;
          v54[3] = &unk_1E64F4048;
          id v55 = v25;
          uint64_t v56 = v16;
          uint64_t v57 = self;
          id v45 = v25;
          uint64_t v47 = objc_msgSend_registerItemGroupSet_operation_options_completionHandler_(v53, v46, (uint64_t)v45, self, v43, v54);
          uint64_t v50 = objc_msgSend_cancelTokens(self, v48, v49);
          objc_msgSend_addCancelToken_withOperation_(v50, v51, (uint64_t)v47, self);
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v44 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_ERROR, "Skipping empty upload batch", buf, 2u);
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v59, v63, 16);
    }
    while (v13);
  }
}

- (BOOL)_prepareForUpload
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_isCancelled(self, a2, v2) & 1) == 0)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = objc_msgSend_assetsToUpload(self, v6, v7);
    uint64_t v11 = objc_msgSend_count(v8, v9, v10);
    uint64_t v13 = objc_msgSend_initWithCapacity_(v5, v12, v11);

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v16 = objc_msgSend_assetsToUpload(self, v14, v15, 0);
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v50, v58, 16);
    if (v18)
    {
      uint64_t v20 = v18;
      char v21 = 0;
      uint64_t v22 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v51 != v22) {
            objc_enumerationMutation(v16);
          }
          uint64_t v24 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend__prepareForUploadWithOperation_(v24, v19, (uint64_t)self);
          char isReference = objc_msgSend_isReference(v24, v26, v27);
          if (v25) {
            objc_msgSend_addObject_(v13, v28, (uint64_t)v25);
          }
          v21 |= isReference;
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v50, v58, 16);
      }
      while (v20);
    }
    else
    {
      char v21 = 0;
    }

    if (objc_msgSend_count(v13, v30, v31) || (v21 & 1) != 0)
    {
      if (objc_msgSend__planPackageSectionItemsForMMCSItems_(self, v32, (uint64_t)v13))
      {
        objc_msgSend_resetAssetTokenRequests(self->_assetRequestPlanner, v38, v39);
        objc_msgSend_planRegisterBatches(self->_assetRequestPlanner, v40, v41);
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v42 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v46 = v42;
          uint64_t v49 = objc_msgSend_operationID(self, v47, v48);
          *(_DWORD *)buf = 138412546;
          id v55 = v13;
          __int16 v56 = 2114;
          uint64_t v57 = v49;
          _os_log_debug_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_DEBUG, "Registering MMCS items %@ for operation %{public}@", buf, 0x16u);
        }
        objc_msgSend__registerMMCSItems(self, v43, v44);
        BOOL v4 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v33 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = v33;
        uint64_t v37 = objc_msgSend_operationID(self, v35, v36);
        *(_DWORD *)buf = 138543362;
        id v55 = v37;
        _os_log_debug_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_DEBUG, "No assets to upload for operation %{public}@", buf, 0xCu);
      }
    }
    BOOL v4 = 0;
LABEL_27:

    return v4;
  }
  return 0;
}

- (void)_failAllItemsInAssetBatch:(id)a3 error:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    __assert_rtn("-[CKDUploadAssetsOperation _failAllItemsInAssetBatch:error:]", "CKDUploadAssetsOperation.m", 931, "error");
  }
  uint64_t v10 = v7;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v41 = v6;
  uint64_t v11 = objc_msgSend_allRegularAndSectionAndRereferenceItems(v6, v8, v9);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v43, v55, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v44;
    uint64_t v42 = v11;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void **)(*((void *)&v43 + 1) + 8 * v18);
        uint64_t v20 = objc_msgSend_package(v19, v14, v15);
        uint64_t v25 = objc_msgSend_asset(v19, v21, v22);
        if (v20)
        {
          uint64_t v26 = objc_msgSend_uploadTasksByPackages(self, v23, v24);
          objc_msgSend_removeObjectForKey_(v26, v27, (uint64_t)v20);

          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v28 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = v28;
            v35 = objc_msgSend_operationID(self, v33, v34);
            *(_DWORD *)buf = 138413058;
            uint64_t v48 = v19;
            __int16 v49 = 2112;
            long long v50 = v20;
            __int16 v51 = 2114;
            long long v52 = v35;
            __int16 v53 = 2112;
            unint64_t v54 = v10;
            _os_log_error_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_ERROR, "Failed MMCS item %@, package %@ and operation %{public}@: %@", buf, 0x2Au);

            uint64_t v11 = v42;
          }
          objc_msgSend__didUploadAsset_error_(self, v29, (uint64_t)v20, v10);
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v30 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = v30;
            uint64_t v39 = objc_msgSend_operationID(self, v37, v38);
            *(_DWORD *)buf = 138412802;
            uint64_t v48 = v19;
            __int16 v49 = 2114;
            long long v50 = v39;
            __int16 v51 = 2112;
            long long v52 = v10;
            _os_log_error_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_ERROR, "Failed MMCS item %@ and operation %{public}@: %@", buf, 0x20u);

            uint64_t v11 = v42;
          }
          objc_msgSend__didUploadAsset_error_(self, v31, (uint64_t)v25, v10);
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v43, v55, 16);
    }
    while (v16);
  }

  objc_msgSend_failBatch_(self->_assetRequestPlanner, v40, (uint64_t)v41);
}

- (BOOL)_didFetchUploadTokensForAssetTokenRequest:(id)a3 error:(id)a4 newError:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v11 = objc_msgSend_assetBatches(a3, v9, v10);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v49, v54, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v50;
    uint64_t v42 = self;
    uint64_t v43 = *MEMORY[0x1E4F19DD8];
    int v18 = 1;
    uint64_t v40 = *(void *)v50;
    uint64_t v41 = v11;
    while (1)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (v8)
        {
          id v21 = v8;
          objc_msgSend__failAllItemsInAssetBatch_error_(self, v22, (uint64_t)v20, v21);
          goto LABEL_29;
        }
        objc_msgSend_firstMMCSItemError(*(void **)(*((void *)&v49 + 1) + 8 * i), v14, v15);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          int v44 = v18;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          uint64_t v25 = objc_msgSend_allRegularAndSectionAndRereferenceItems(v20, v23, v24);
          id v21 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v45, v53, 16);
          if (v21)
          {
            uint64_t v29 = *(void *)v46;
            while (2)
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v46 != v29) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v31 = objc_msgSend_authToken(*(void **)(*((void *)&v45 + 1) + 8 * (void)j), v27, v28);

                if (!v31)
                {
                  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, v43, 1000, @"No authToken received for asset");
                  id v21 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_19;
                }
              }
              id v21 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v45, v53, 16);
              if (v21) {
                continue;
              }
              break;
            }
LABEL_19:
            uint64_t v11 = v41;
            self = v42;
            uint64_t v17 = v40;
          }

          if (objc_msgSend_isRereferenceAssetBatch(v20, v32, v33))
          {
            v35 = objc_msgSend_authPutResponse(v20, v23, v34);
            int v18 = v44;
            if (v35) {
              goto LABEL_24;
            }
            if ((objc_msgSend_useMMCSEncryptionV2(v20, v36, v37) & 1) == 0)
            {
              uint64_t v38 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v23, v43, 1000, @"No authPutResponse received for re-referenced asset");
              v35 = v21;
              id v21 = (id)v38;
LABEL_24:
            }
            if (!v21) {
              goto LABEL_32;
            }
            goto LABEL_28;
          }
          int v18 = v44;
          if (!v21) {
            goto LABEL_32;
          }
        }
LABEL_28:
        objc_msgSend__failAllItemsInAssetBatch_error_(self, v23, (uint64_t)v20, v21);
LABEL_29:
        if (a5)
        {
          id v21 = v21;
          int v18 = 0;
          *a5 = v21;
        }
        else
        {
          int v18 = 0;
        }
LABEL_32:
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v49, v54, 16);
      if (!v16) {
        goto LABEL_36;
      }
    }
  }
  LOBYTE(v18) = 1;
LABEL_36:

  return v18 & 1;
}

- (BOOL)_fetchUploadTokens
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_atomic(self, a2, v2))
  {
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    objc_msgSend_assetRegisterAndPutBatches(self->_assetRequestPlanner, v4, v5);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v156, v168, 16);
    if (v7)
    {
      uint64_t v10 = v7;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v157;
      uint64_t v13 = *MEMORY[0x1E4F19DD8];
      uint64_t v122 = *(void *)v157;
      do
      {
        uint64_t v14 = 0;
        uint64_t v124 = v10;
        do
        {
          if (*(void *)v157 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v129 = v14;
          uint64_t v15 = *(void **)(*((void *)&v156 + 1) + 8 * v14);
          if (objc_msgSend_isFailed(v15, v8, v9))
          {
            uint64_t v16 = objc_msgSend_assetBatchesByZoneID(self->_assetRequestPlanner, v8, v9);
            uint64_t v19 = objc_msgSend_assetZone(v15, v17, v18);
            uint64_t v22 = objc_msgSend_assetZoneKey(v19, v20, v21);
            uint64_t v25 = objc_msgSend_destinationZoneID(v22, v23, v24);
            uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v16, v26, (uint64_t)v25);

            long long v154 = 0u;
            long long v155 = 0u;
            long long v152 = 0u;
            long long v153 = 0u;
            id v28 = v27;
            uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v152, v167, 16);
            if (v30)
            {
              uint64_t v33 = v30;
              uint64_t v34 = *(void *)v153;
              do
              {
                for (uint64_t i = 0; i != v33; ++i)
                {
                  if (*(void *)v153 != v34) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v36 = *(void **)(*((void *)&v152 + 1) + 8 * i);
                  if ((objc_msgSend_isFailed(v36, v31, v32) & 1) == 0)
                  {
                    if (!v11)
                    {
                      uint64_t v11 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v31, v13, 1000, @"Atomic zone yo something in the batch failed.");;
                    }
                    objc_msgSend__failAllItemsInAssetBatch_error_(self, v31, (uint64_t)v36, v11);
                  }
                }
                uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v152, v167, 16);
              }
              while (v33);
            }

            uint64_t v12 = v122;
            uint64_t v10 = v124;
          }
          uint64_t v14 = v129 + 1;
        }
        while (v129 + 1 != v10);
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v156, v168, 16);
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  objc_msgSend_planAssetRequests(self->_assetRequestPlanner, v4, v5);
  char hasSuccessfulAssetTokenRequests = objc_msgSend_hasSuccessfulAssetTokenRequests(self->_assetRequestPlanner, v37, v38);
  BOOL v42 = hasSuccessfulAssetTokenRequests;
  if (hasSuccessfulAssetTokenRequests)
  {
    BOOL v119 = hasSuccessfulAssetTokenRequests;
    uint64_t v43 = objc_msgSend_uploadPreparationBlock(self, v40, v41);

    if (v43)
    {
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      objc_msgSend_assetTokenRequests(self->_assetRequestPlanner, v44, v45);
      id v120 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v46, (uint64_t)&v148, v164, 16);
      if (v123)
      {
        uint64_t v121 = *(void *)v149;
        do
        {
          uint64_t v49 = 0;
          do
          {
            if (*(void *)v149 != v121) {
              objc_enumerationMutation(v120);
            }
            uint64_t v125 = v49;
            long long v50 = *(void **)(*((void *)&v148 + 1) + 8 * v49);
            long long v144 = 0u;
            long long v145 = 0u;
            long long v146 = 0u;
            long long v147 = 0u;
            objc_msgSend_successfulBatches(v50, v47, v48);
            id obja = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v51, (uint64_t)&v144, v163, 16);
            if (v52)
            {
              uint64_t v55 = v52;
              uint64_t v130 = *(void *)v145;
              do
              {
                for (uint64_t j = 0; j != v55; ++j)
                {
                  if (*(void *)v145 != v130) {
                    objc_enumerationMutation(obja);
                  }
                  uint64_t v57 = *(void **)(*((void *)&v144 + 1) + 8 * j);
                  long long v140 = 0u;
                  long long v141 = 0u;
                  long long v142 = 0u;
                  long long v143 = 0u;
                  uint64_t v58 = objc_msgSend_allMMCSItems(v57, v53, v54);
                  uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v140, v162, 16);
                  if (v60)
                  {
                    uint64_t v63 = v60;
                    uint64_t v64 = *(void *)v141;
                    do
                    {
                      for (uint64_t k = 0; k != v63; ++k)
                      {
                        if (*(void *)v141 != v64) {
                          objc_enumerationMutation(v58);
                        }
                        uint64_t v66 = *(void **)(*((void *)&v140 + 1) + 8 * k);
                        uint64_t v67 = objc_msgSend_error(v66, v61, v62);

                        if (v67)
                        {
                          v76 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v68, v69);
                          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v77, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 1014, @"Expected nil error for %@", v66);
                        }
                        uint64_t v70 = objc_msgSend_package(v66, v68, v69);
                        uint64_t v73 = objc_msgSend_asset(v66, v71, v72);
                        uint64_t v75 = (void *)v73;
                        if (v70) {
                          objc_msgSend__didPrepareAsset_(self, v74, (uint64_t)v70);
                        }
                        else {
                          objc_msgSend__didPrepareAsset_(self, v74, v73);
                        }
                      }
                      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v140, v162, 16);
                    }
                    while (v63);
                  }

                  long long v138 = 0u;
                  long long v139 = 0u;
                  long long v136 = 0u;
                  long long v137 = 0u;
                  uint64_t v80 = objc_msgSend_allRereferenceMMCSPackageItems(v57, v78, v79);
                  uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v136, v161, 16);
                  if (v82)
                  {
                    uint64_t v85 = v82;
                    uint64_t v86 = *(void *)v137;
                    do
                    {
                      for (uint64_t m = 0; m != v85; ++m)
                      {
                        if (*(void *)v137 != v86) {
                          objc_enumerationMutation(v80);
                        }
                        id v88 = *(void **)(*((void *)&v136 + 1) + 8 * m);
                        uint64_t v89 = objc_msgSend_error(v88, v83, v84);

                        if (v89)
                        {
                          v98 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v90, v91);
                          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v98, v99, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 1020, @"Expected nil error for %@", v88);
                        }
                        v92 = objc_msgSend_package(v88, v90, v91);
                        uint64_t v95 = objc_msgSend_asset(v88, v93, v94);
                        v97 = (void *)v95;
                        if (v92) {
                          objc_msgSend__didPrepareAsset_(self, v96, (uint64_t)v92);
                        }
                        else {
                          objc_msgSend__didPrepareAsset_(self, v96, v95);
                        }
                      }
                      uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v83, (uint64_t)&v136, v161, 16);
                    }
                    while (v85);
                  }
                }
                uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v53, (uint64_t)&v144, v163, 16);
              }
              while (v55);
            }

            uint64_t v49 = v125 + 1;
          }
          while (v125 + 1 != v123);
          uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v47, (uint64_t)&v148, v164, 16);
        }
        while (v123);
      }
    }
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    uint64_t v100 = objc_msgSend_assetTokenRequests(self->_assetRequestPlanner, v44, v45);
    uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, (uint64_t)&v132, v160, 16);
    if (v102)
    {
      uint64_t v105 = v102;
      uint64_t v106 = *(void *)v133;
      do
      {
        for (uint64_t n = 0; n != v105; ++n)
        {
          if (*(void *)v133 != v106) {
            objc_enumerationMutation(v100);
          }
          uint64_t v108 = *(void **)(*((void *)&v132 + 1) + 8 * n);
          if (objc_msgSend_hasSuccessfulBatches(v108, v103, v104))
          {
            v109 = objc_opt_new();
            objc_msgSend_setAssetTokenRequest_(v109, v110, (uint64_t)v108);
            uint64_t v111 = objc_opt_class();
            v131[0] = MEMORY[0x1E4F143A8];
            v131[1] = 3221225472;
            v131[2] = sub_1C4E3E89C;
            v131[3] = &unk_1E64F0260;
            v131[4] = self;
            v131[5] = v108;
            objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v112, v111, v109, v131);
          }
        }
        uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v103, (uint64_t)&v132, v160, 16);
      }
      while (v105);
    }

    return v119;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v113 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v115 = v113;
      char v118 = objc_msgSend_operationID(self, v116, v117);
      *(_DWORD *)buf = 138543362;
      v166 = v118;
      _os_log_debug_impl(&dword_1C4CFF000, v115, OS_LOG_TYPE_DEBUG, "No assets to upload for operation %{public}@", buf, 0xCu);
    }
  }
  return v42;
}

- (void)_didUploadMMCSSectionItem:(id)a3 task:(id)a4 error:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_package(v9, v11, v12);
  uint64_t v16 = objc_msgSend_error(v8, v14, v15);
  uint64_t v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = (void *)v16;
  }
  else {
    uint64_t v18 = v10;
  }
  id v19 = v18;

  if (v19)
  {
LABEL_15:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v38 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = v38;
      uint64_t v43 = objc_msgSend_operationID(self, v41, v42);
      *(_DWORD *)buf = 138413058;
      id v49 = v8;
      __int16 v50 = 2112;
      long long v51 = v13;
      __int16 v52 = 2114;
      __int16 v53 = v43;
      __int16 v54 = 2112;
      id v55 = v19;
      _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Failed to upload MMCS section item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);
    }
    objc_msgSend_setError_(v9, v39, (uint64_t)v19);
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v22 = objc_msgSend_sectionItems(v8, v20, v21, 0);
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v44, v56, 16);
    if (v24)
    {
      uint64_t v27 = v24;
      uint64_t v28 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v22);
          }
          uint64_t v30 = objc_msgSend_error(*(void **)(*((void *)&v44 + 1) + 8 * i), v25, v26);
          if (v30)
          {
            id v19 = (id)v30;

            goto LABEL_15;
          }
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v44, v56, 16);
        if (v27) {
          continue;
        }
        break;
      }
    }

    uint64_t v33 = objc_msgSend_progressTracker(v9, v31, v32);
    objc_msgSend_updateProgressWithItem_progress_(v33, v34, (uint64_t)v8, 1.0);
    double v36 = v35;

    objc_msgSend__didMakeProgressForAsset_progress_(self, v37, (uint64_t)v13, v36);
  }
}

- (void)_didUploadMMCSSectionItems:(id)a3 task:(id)a4 error:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v28, v38, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ((objc_msgSend_finished(v18, v13, v14) & 1) == 0)
        {
          objc_msgSend_setFinished_(v18, v13, 1);
          objc_msgSend__didUploadMMCSSectionItem_task_error_(self, v19, (uint64_t)v18, v9, v10);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v13, (uint64_t)&v28, v38, 16);
    }
    while (v15);
  }
  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v20 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = v20;
      uint64_t v24 = objc_msgSend_count(v8, v22, v23);
      uint64_t v27 = objc_msgSend_operationID(self, v25, v26);
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v24;
      __int16 v34 = 2114;
      double v35 = v27;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "Failed to upload %lu MMCS section items for operation %{public}@: %@", buf, 0x20u);
    }
  }
}

- (void)_didMakeProgressForMMCSSectionItem:(id)a3 task:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  int v9 = objc_msgSend_finished(v28, v7, v8);
  uint64_t v12 = objc_msgSend_error(v28, v10, v11);
  uint64_t v15 = (void *)v12;
  if (v9)
  {
    objc_msgSend__didUploadMMCSSectionItem_task_error_(self, v13, (uint64_t)v28, v6, v12);
  }
  else if (!v12)
  {
    objc_msgSend_progress(v28, v13, v14);
    if (v18 < 0.0) {
      goto LABEL_7;
    }
    uint64_t v15 = objc_msgSend_package(v6, v16, v17);
    uint64_t v21 = objc_msgSend_progressTracker(v6, v19, v20);
    objc_msgSend_progress(v28, v22, v23);
    objc_msgSend_updateProgressWithItem_progress_(v21, v24, (uint64_t)v28);
    double v26 = v25;

    objc_msgSend__didMakeProgressForAsset_progress_(self, v27, (uint64_t)v15, v26);
  }

LABEL_7:
}

- (void)_uploadPackageSection:(id)a3 task:(id)a4 completionBlock:(id)a5
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  id v156 = a3;
  id v157 = a4;
  long long v155 = (void (**)(void))a5;
  id v10 = objc_msgSend_container(self, v8, v9);
  long long v153 = objc_msgSend_MMCS(v10, v11, v12);

  uint64_t v15 = objc_msgSend_package(v157, v13, v14);
  long long v154 = objc_msgSend_MMCSSectionItems(v157, v16, v17);
  uint64_t v20 = objc_msgSend_index(v156, v18, v19);
  if (!objc_msgSend_isCancelled(self, v21, v22))
  {
    id v159 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v158 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    unint64_t v152 = v20;
    uint64_t v27 = objc_msgSend_itemEnumeratorForSectionAtIndex_(v15, v26, v20);
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v173, v184, 16);
    if (v29)
    {
      uint64_t v30 = *(void *)v174;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v174 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v173 + 1) + 8 * i);
          uint64_t v33 = [CKDMMCSItem alloc];
          uint64_t v36 = objc_msgSend_temporary(self, v34, v35);
          uint64_t v38 = objc_msgSend_initWithPackage_temporary_(v33, v37, (uint64_t)v15, v36);
          uint64_t v41 = objc_msgSend_UUID(v15, v39, v40);
          objc_msgSend_setTrackingUUID_(v38, v42, (uint64_t)v41);

          uint64_t v45 = objc_msgSend_itemID(v32, v43, v44);
          objc_msgSend_setItemID_(v38, v46, v45);
          id v49 = objc_msgSend_fileURL(v32, v47, v48);
          objc_msgSend_setFileURL_(v38, v50, (uint64_t)v49);

          __int16 v53 = objc_msgSend_deviceID(v32, v51, v52);
          objc_msgSend_setDeviceID_(v38, v54, (uint64_t)v53);

          uint64_t v57 = objc_msgSend_fileID(v32, v55, v56);
          objc_msgSend_setFileID_(v38, v58, (uint64_t)v57);

          long long v61 = objc_msgSend_generationID(v32, v59, v60);
          objc_msgSend_setGenerationID_(v38, v62, (uint64_t)v61);

          uint64_t v65 = objc_msgSend_itemTypeHint(v32, v63, v64);
          objc_msgSend_setItemTypeHint_(v38, v66, (uint64_t)v65);

          uint64_t v69 = objc_msgSend_packageIndex(v32, v67, v68);
          objc_msgSend_setPackageIndex_(v38, v70, v69);
          if (objc_msgSend_size(v32, v71, v72)) {
            objc_msgSend_addObject_(v159, v73, (uint64_t)v38);
          }
          else {
            objc_msgSend_addObject_(v158, v73, (uint64_t)v38);
          }
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v74, (uint64_t)&v173, v184, 16);
      }
      while (v29);
    }

    if (objc_msgSend_count(v154, v75, v76) <= v152)
    {
      uint64_t v122 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v123 = objc_msgSend_count(v154, v77, v152);
      uint64_t v125 = objc_msgSend_errorWithDomain_code_format_(v122, v124, *MEMORY[0x1E4F19DD8], 1000, @"Invalid section %@ at index %lu/%lu", v156, v152, v123);
      objc_msgSend_setError_(v157, v126, (uint64_t)v125);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v127 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        long long v137 = v127;
        uint64_t v140 = objc_msgSend_count(v154, v138, v139);
        *(_DWORD *)locatiouint64_t n = 134218498;
        *(void *)&location[4] = v152;
        __int16 v178 = 2048;
        unint64_t v179 = v140;
        __int16 v180 = 2112;
        id v181 = v156;
        _os_log_error_impl(&dword_1C4CFF000, v137, OS_LOG_TYPE_ERROR, "Invalid section index %lu/%lu for section %@", location, 0x20u);
      }
      if (v155) {
        v155[2]();
      }
      goto LABEL_41;
    }
    v78 = objc_msgSend_objectAtIndex_(v154, v77, v152);
    uint64_t v81 = objc_msgSend_size(v156, v79, v80);
    if (v81 == objc_msgSend_fileSize(v78, v82, v83)
      && (objc_msgSend_signature(v156, v84, v85),
          uint64_t v86 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_signature(v78, v87, v88),
          uint64_t v89 = objc_claimAutoreleasedReturnValue(),
          char isEqualToData = objc_msgSend_isEqualToData_(v86, v90, (uint64_t)v89),
          v89,
          v86,
          (isEqualToData & 1) != 0))
    {
      v92 = CKCreateGUID();
      objc_msgSend_setPutPackageSectionIdentifier_(v78, v93, (uint64_t)v92);

      objc_msgSend_setSectionItems_(v78, v94, (uint64_t)v159);
      if ((objc_msgSend_useEncryption(self, v95, v96) & 1) != 0
        || objc_msgSend_useClearAssetEncryption(self, v97, v98))
      {
        if (objc_msgSend_fileSize(v78, v97, v98))
        {
          uint64_t v99 = objc_msgSend_referenceSignature(v78, v97, v98);
          BOOL v100 = v99 == 0;

          if (v100)
          {
            uint64_t v101 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v97, v98);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v101, v102, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 1166, @"Expected non-nil reference signature for %@", v78);
          }
        }
      }
      if (objc_msgSend_fileSize(v78, v97, v98))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v105 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          long long v145 = v105;
          long long v148 = objc_msgSend_operationID(self, v146, v147);
          *(_DWORD *)locatiouint64_t n = 138413058;
          *(void *)&location[4] = v78;
          __int16 v178 = 2048;
          unint64_t v179 = v152;
          __int16 v180 = 2112;
          id v181 = v15;
          __int16 v182 = 2114;
          unsigned int v183 = v148;
          _os_log_debug_impl(&dword_1C4CFF000, v145, OS_LOG_TYPE_DEBUG, "Uploading MMCS section item %@ at index %lu for package %@ and operation %{public}@", location, 0x2Au);
        }
        uint64_t v106 = dispatch_group_create();
        dispatch_group_enter(v106);
        objc_initWeak((id *)location, self);
        v109 = objc_msgSend_MMCSRequestOptions(v157, v107, v108);
        v170[0] = MEMORY[0x1E4F143A8];
        v170[1] = 3221225472;
        v170[2] = sub_1C4E3FB84;
        v170[3] = &unk_1E64F4098;
        objc_copyWeak(&v172, (id *)location);
        id v171 = v157;
        v164[0] = MEMORY[0x1E4F143A8];
        v164[1] = 3221225472;
        v164[2] = sub_1C4E3FBF0;
        v164[3] = &unk_1E64F40C0;
        id v165 = v78;
        id v166 = v158;
        v167 = self;
        id v110 = v171;
        id v168 = v110;
        uint64_t v111 = v106;
        uint64_t v169 = v111;
        uint64_t v113 = objc_msgSend_putSectionItem_operation_options_progress_completionHandler_(v153, v112, (uint64_t)v165, self, v109, v170, v164);

        v116 = objc_msgSend_cancelTokens(v110, v114, v115);
        objc_msgSend_addCancelToken_withOperation_(v116, v117, (uint64_t)v113, self);

        objc_msgSend_qualityOfService(self, v118, v119);
        id v120 = CKGetGlobalQueue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4E3FCD8;
        block[3] = &unk_1E64F0FA0;
        id v161 = v110;
        id v162 = v113;
        uint64_t v163 = v155;
        id v121 = v113;
        dispatch_group_notify(v111, v120, block);

        objc_destroyWeak(&v172);
        objc_destroyWeak((id *)location);

        goto LABEL_40;
      }
      if (objc_msgSend_count(v159, v103, v104))
      {
        long long v149 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v134, v135);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v149, v150, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 1169, @"Expected 0 non-empty items in the empty section %@", v78);
      }
      objc_msgSend_setSectionItems_(v78, v134, (uint64_t)v158);
      objc_msgSend__didUploadMMCSSectionItem_task_error_(self, v136, (uint64_t)v78, v157, 0);
      if (!v155) {
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v128 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v129 = objc_msgSend_count(v154, v84, v85);
      uint64_t v131 = objc_msgSend_errorWithDomain_code_format_(v128, v130, *MEMORY[0x1E4F19DD8], 1000, @"Invalid section %@ at index %lu/%lu", v156, v152, v129);
      objc_msgSend_setError_(v157, v132, (uint64_t)v131);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      long long v133 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        long long v141 = v133;
        uint64_t v144 = objc_msgSend_count(v154, v142, v143);
        *(_DWORD *)locatiouint64_t n = 134218754;
        *(void *)&location[4] = v152;
        __int16 v178 = 2048;
        unint64_t v179 = v144;
        __int16 v180 = 2112;
        id v181 = v156;
        __int16 v182 = 2112;
        unsigned int v183 = v78;
        _os_log_error_impl(&dword_1C4CFF000, v141, OS_LOG_TYPE_ERROR, "Invalid section at index %lu/%lu for section %@: %@", location, 0x2Au);
      }
      if (!v155) {
        goto LABEL_40;
      }
    }
    v155[2]();
LABEL_40:

LABEL_41:
    goto LABEL_42;
  }
  uint64_t v24 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v23, *MEMORY[0x1E4F19DD8], 1, @"Operation was cancelled");
  objc_msgSend_setError_(v157, v25, (uint64_t)v24);

  if (v155) {
    v155[2]();
  }
LABEL_42:
}

- (void)_uploadPackageSectionsWithEnumerator:(id)a3 task:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  uint64_t v13 = objc_msgSend_error(v9, v11, v12);

  if (v13 || (objc_msgSend_nextObject(v8, v14, v15), (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    uint64_t v17 = (void *)v16;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1C4E3FE7C;
    v19[3] = &unk_1E64F1B98;
    v19[4] = self;
    id v20 = v8;
    id v21 = v9;
    uint64_t v22 = v10;
    objc_msgSend__uploadPackageSection_task_completionBlock_(self, v18, (uint64_t)v17, v21, v19);
  }
}

- (void)_uploadPackageSectionsWithTask:(id)a3 completionBlock:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v10 = objc_msgSend_package(v6, v8, v9);
  uint64_t v13 = objc_msgSend_MMCSSectionItems(v6, v11, v12);
  uint64_t v16 = objc_msgSend_sectionCount(v10, v14, v15);
  if (objc_msgSend_isCancelled(self, v17, v18))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, *MEMORY[0x1E4F19DD8], 1, @"Operation was cancelled");
    goto LABEL_16;
  }
  if (v16 == objc_msgSend_count(v13, v19, v20))
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v24 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v63 = v24;
      uint64_t v66 = objc_msgSend_operationID(self, v64, v65);
      *(_DWORD *)buf = 138412802;
      uint64_t v78 = (uint64_t)v13;
      __int16 v79 = 2112;
      uint64_t v80 = v10;
      __int16 v81 = 2114;
      uint64_t v82 = v66;
      _os_log_debug_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_DEBUG, "Uploading MMCS section items %@ for package %@ and operation %{public}@", buf, 0x20u);
    }
    id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v28 = objc_msgSend_initWithCapacity_(v25, v26, v16);
    if (!v16)
    {
LABEL_12:
      uint64_t v72 = v13;
      uint64_t v33 = [CKDMMCSRequestOptions alloc];
      uint64_t v35 = objc_msgSend_initWithOperation_(v33, v34, (uint64_t)self);
      uint64_t v38 = objc_msgSend_record(v10, v36, v37);
      uint64_t v41 = objc_msgSend_recordID(v38, v39, v40);
      uint64_t v44 = objc_msgSend_zoneID(v41, v42, v43);
      long long v47 = objc_msgSend_zoneName(v44, v45, v46);

      if (v47)
      {
        uint64_t v76 = v47;
        id v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)&v76, 1);
        objc_msgSend_setZoneNames_(v35, v50, (uint64_t)v49);
      }
      objc_msgSend_setMMCSRequestOptions_(v6, v48, (uint64_t)v35);
      __int16 v53 = objc_msgSend_objectEnumerator(v28, v51, v52);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = sub_1C4E40354;
      v73[3] = &unk_1E64F0FA0;
      v73[4] = self;
      id v74 = v10;
      uint64_t v75 = v7;
      objc_msgSend__uploadPackageSectionsWithEnumerator_task_completionBlock_(self, v54, (uint64_t)v53, v6, v73);

      uint64_t v13 = v72;
      goto LABEL_23;
    }
    uint64_t v29 = 0;
    while (1)
    {
      uint64_t v30 = objc_msgSend_sectionAtIndex_(v10, v27, v29);
      if (!v30) {
        break;
      }
      uint64_t v32 = (void *)v30;
      objc_msgSend_addObject_(v28, v31, v30);

      if (v16 == ++v29) {
        goto LABEL_12;
      }
    }
    uint64_t v60 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v31, *MEMORY[0x1E4F19DD8], 1000, @"Can't find section at index %lu", v29);
    objc_msgSend_setError_(v6, v61, (uint64_t)v60);

    if (*v23 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v62 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v67 = v62;
      uint64_t v70 = objc_msgSend_operationID(self, v68, v69);
      *(_DWORD *)buf = 134218498;
      uint64_t v78 = v29;
      __int16 v79 = 2112;
      uint64_t v80 = v10;
      __int16 v81 = 2114;
      uint64_t v82 = v70;
      _os_log_error_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_ERROR, "Can't find section at index %lu for package %@ and operation %{public}@", buf, 0x20u);

      if (!v7) {
        goto LABEL_23;
      }
    }
    else if (!v7)
    {
LABEL_23:

      goto LABEL_24;
    }
    v7[2](v7);
    goto LABEL_23;
  }
  id v55 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v56 = *MEMORY[0x1E4F19DD8];
  uint64_t v71 = objc_msgSend_count(v13, v21, v22);
  objc_msgSend_errorWithDomain_code_format_(v55, v57, v56, 1000, @"Invalid section count %lu/%lu", v16, v71);
  uint64_t v58 = LABEL_16:;
  objc_msgSend_setError_(v6, v59, (uint64_t)v58);

  if (v7) {
    v7[2](v7);
  }
LABEL_24:
}

- (void)_uploadPackageSectionsWithPendingTasks:(id)a3 uploadingTasks:(id)a4 completedTasks:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!objc_msgSend_maxPackageUploadsPerBatch(self, v12, v13))
  {
    id v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 1256, @"Expected non-0 maxPackageUploadsPerBatch");
  }
  unint64_t v16 = objc_msgSend_count(v10, v14, v15);
  if (v16 > objc_msgSend_maxPackageUploadsPerBatch(self, v17, v18))
  {
    uint64_t v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 1257, @"Expected max uploading tasks: %@", v10);

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
    uint64_t v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 1258, @"Expected completed tasks: %@", v11);
  }
LABEL_7:
  id v21 = objc_msgSend_queue(self, v19, v20);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E405A8;
  block[3] = &unk_1E64F0DF0;
  id v32 = v10;
  id v33 = v11;
  __int16 v34 = self;
  id v35 = v9;
  id v22 = v9;
  id v23 = v11;
  id v24 = v10;
  dispatch_async(v21, block);
}

- (void)_didUploadMMCSItem:(id)a3 error:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_error(v7, v9, v10);
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (void *)v11;
  }
  else {
    uint64_t v13 = v8;
  }
  id v14 = v13;

  uint64_t v17 = objc_msgSend_package(v7, v15, v16);
  id v22 = objc_msgSend_asset(v7, v18, v19);
  if (v14)
  {
    id v23 = (void *)*MEMORY[0x1E4F1A548];
    if (v17)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v23);
      }
      id v24 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v59 = v24;
        uint64_t v62 = objc_msgSend_operationID(self, v60, v61);
        *(_DWORD *)buf = 138413058;
        id v70 = v7;
        __int16 v71 = 2112;
        uint64_t v72 = v17;
        __int16 v73 = 2114;
        id v74 = v62;
        __int16 v75 = 2112;
        id v76 = v14;
        _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "Failed to upload MMCS item %@ for package %@ and operation %{public}@: %@", buf, 0x2Au);
      }
      uint64_t v27 = objc_msgSend_uploadTasksByPackages(self, v25, v26);
      uint64_t v29 = objc_msgSend_objectForKey_(v27, v28, (uint64_t)v17);

      objc_msgSend_setError_(v29, v30, (uint64_t)v14);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v23);
      }
      uint64_t v44 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v63 = v44;
        uint64_t v66 = objc_msgSend_operationID(self, v64, v65);
        *(_DWORD *)buf = 138412802;
        id v70 = v7;
        __int16 v71 = 2114;
        uint64_t v72 = v66;
        __int16 v73 = 2112;
        id v74 = v14;
        _os_log_debug_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_DEBUG, "Failed to upload MMCS item %@ for operation %{public}@: %@", buf, 0x20u);
      }
      objc_msgSend__didUploadAsset_error_(self, v45, (uint64_t)v22, v14);
    }
  }
  else
  {
    uint64_t v31 = objc_msgSend_fileSize(v7, v20, v21);
    if (v17)
    {
      if (!v31)
      {
        uint64_t v67 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v32, v33);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v67, v68, (uint64_t)a2, self, @"CKDUploadAssetsOperation.m", 1309, @"Expected non-0 size for the manifest for package %@", v17);
      }
      __int16 v34 = objc_msgSend_uploadTasksByPackages(self, v32, v33);
      uint64_t v36 = objc_msgSend_objectForKey_(v34, v35, (uint64_t)v17);

      uint64_t v39 = objc_msgSend_progressTracker(v36, v37, v38);
      objc_msgSend_updateProgressWithItem_progress_(v39, v40, (uint64_t)v7, 1.0);
      double v42 = v41;

      objc_msgSend__didMakeProgressForAsset_progress_(self, v43, (uint64_t)v17, v42);
    }
    else
    {
      if (v31)
      {
        uint64_t v46 = objc_msgSend_uploadReceipt(v7, v32, v33);
        objc_msgSend_setUploadReceipt_(v22, v47, (uint64_t)v46);
        objc_msgSend_setUploaded_(v22, v48, v46 != 0);
      }
      else
      {
        objc_msgSend_setUploadReceipt_(v22, v32, 0);
      }
      objc_msgSend_uploadReceiptExpiration(v7, v49, v50);
      objc_msgSend_setUploadReceiptExpiration_(v22, v51, v52);
      uint64_t v55 = objc_msgSend_paddedFileSize(v7, v53, v54);
      objc_msgSend_setPaddedFileSize_(v22, v56, v55);
      objc_msgSend__didMakeProgressForAsset_progress_(self, v57, (uint64_t)v22, 1.0);
      objc_msgSend__didUploadAsset_error_(self, v58, (uint64_t)v22, 0);
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
    v8[2] = sub_1C4E40E1C;
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
    id v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v9, 1);
    objc_msgSend__collectMetricsFromMMCSOperationMetrics_(self, v8, (uint64_t)v7);
  }
}

- (void)_collectMetricsFromCompletedItemGroupSet:(id)a3
{
  uint64_t v4 = objc_msgSend_allItemGroups(a3, a2, (uint64_t)a3);
  objc_msgSend_CKCompactMap_(v4, v5, (uint64_t)&unk_1F20434F0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__collectMetricsFromMMCSOperationMetrics_(self, v6, (uint64_t)v7);
}

- (void)_didUploadMMCSItems:(id)a3 error:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v25, v35, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend_finished(v15, v10, v11) & 1) == 0)
        {
          objc_msgSend_setFinished_(v15, v10, 1);
          objc_msgSend__didUploadMMCSItem_error_(self, v16, (uint64_t)v15, v7);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v25, v35, 16);
    }
    while (v12);
  }
  if (v7)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v17 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = v17;
      uint64_t v21 = objc_msgSend_count(v6, v19, v20);
      id v24 = objc_msgSend_operationID(self, v22, v23);
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v21;
      __int16 v31 = 2114;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Failed to upload %lu MMCS items for operation %{public}@: %@", buf, 0x20u);
    }
  }
}

- (void)_didMakeProgressForMMCSItem:(id)a3
{
  id v34 = a3;
  int v6 = objc_msgSend_finished(v34, v4, v5);
  uint64_t v9 = objc_msgSend_error(v34, v7, v8);
  uint64_t v12 = (void *)v9;
  if (v6)
  {
    objc_msgSend__didUploadMMCSItem_error_(self, v10, (uint64_t)v34, v9);
  }
  else if (!v9)
  {
    objc_msgSend_progress(v34, v10, v11);
    if (v15 < 0.0) {
      goto LABEL_10;
    }
    uint64_t v12 = objc_msgSend_package(v34, v13, v14);
    if (v12)
    {
      uint64_t v18 = objc_msgSend_uploadTasksByPackages(self, v16, v17);
      uint64_t v20 = objc_msgSend_objectForKey_(v18, v19, (uint64_t)v12);

      uint64_t v23 = objc_msgSend_progressTracker(v20, v21, v22);
      objc_msgSend_progress(v34, v24, v25);
      objc_msgSend_updateProgressWithItem_progress_(v23, v26, (uint64_t)v34);
      double v28 = v27;

      objc_msgSend__didMakeProgressForAsset_progress_(self, v29, (uint64_t)v12, v28);
    }
    else
    {
      uint64_t v20 = objc_msgSend_asset(v34, v16, v17);
      objc_msgSend_progress(v34, v30, v31);
      objc_msgSend__didMakeProgressForAsset_progress_(self, v32, (uint64_t)v20, v33);
    }
  }
LABEL_10:
}

- (void)_didUploadPackageWithTask:(id)a3
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_package(v4, v5, v6);
  uint64_t v10 = objc_msgSend_error(v4, v8, v9);

  if (v10)
  {
    objc_msgSend_setUploaded_(v7, v11, 0);
    objc_msgSend_setAssets_(v7, v13, 0);
    uint64_t v16 = objc_msgSend_error(v4, v14, v15);
    objc_msgSend__didUploadAsset_error_(self, v17, (uint64_t)v7, v16);

    goto LABEL_46;
  }
  uint64_t v18 = objc_msgSend_MMCSSectionItems(v4, v11, v12);
  uint64_t v21 = objc_msgSend_MMCSManifestItem(v4, v19, v20);
  id v24 = objc_msgSend_record(v7, v22, v23);
  uint64_t v27 = objc_msgSend_count(v18, v25, v26) + 1;
  id v28 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v156 = objc_msgSend_initWithCapacity_(v28, v29, v27);
  id v30 = objc_alloc(MEMORY[0x1E4F19E50]);
  inited = objc_msgSend_initInternal(v30, v31, v32);
  objc_msgSend_setRecord_(inited, v34, (uint64_t)v24);
  id v35 = v7;
  uint64_t v38 = objc_msgSend_recordKey(v7, v36, v37);
  objc_msgSend_setRecordKey_(inited, v39, (uint64_t)v38);

  double v42 = objc_msgSend_signature(v21, v40, v41);
  objc_msgSend_setSignature_(inited, v43, (uint64_t)v42);

  uint64_t v46 = objc_msgSend_fileSize(v21, v44, v45);
  objc_msgSend_setSize_(inited, v47, v46);
  uint64_t v50 = objc_msgSend_paddedFileSize(v21, v48, v49);
  objc_msgSend_setPaddedFileSize_(inited, v51, v50);
  uint64_t v54 = objc_msgSend_uploadReceipt(v21, v52, v53);
  objc_msgSend_setUploadReceipt_(inited, v55, (uint64_t)v54);

  objc_msgSend_uploadReceiptExpiration(v21, v56, v57);
  objc_msgSend_setUploadReceiptExpiration_(inited, v58, v59);
  uint64_t v62 = objc_msgSend_uploadReceipt(v21, v60, v61);
  objc_msgSend_setUploaded_(inited, v63, v62 != 0);

  int v66 = objc_msgSend_useEncryption(self, v64, v65);
  uint64_t v69 = (void **)MEMORY[0x1E4F1A548];
  id v70 = (void *)MEMORY[0x1E4F1A550];
  long long v153 = v21;
  id v154 = v4;
  if (v66)
  {
    __int16 v71 = objc_msgSend_assetKey(v21, v67, v68);
    objc_msgSend_setAssetKey_(inited, v72, (uint64_t)v71);

    __int16 v75 = objc_msgSend_assetKey(inited, v73, v74);
    uint64_t v77 = objc_msgSend_referenceSignatureFromAssetKey_(CKDMMCS, v76, (uint64_t)v75);
    objc_msgSend_setReferenceSignature_(inited, v78, (uint64_t)v77);
  }
  else
  {
    int v80 = objc_msgSend_useClearAssetEncryption(self, v67, v68);
    __int16 v81 = *v69;
    if (v80)
    {
      if (*v70 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v81);
      }
      uint64_t v82 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C4CFF000, v82, OS_LOG_TYPE_ERROR, "Clear Asset Key Not Supported For Package Manifests.", buf, 2u);
      }
    }
    else
    {
      if (*v70 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v81);
      }
      uint64_t v83 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v83, OS_LOG_TYPE_DEBUG, "Skipping asset keys on manifest item because encryption is disabled", buf, 2u);
      }
    }
  }
  objc_msgSend_addObject_(v156, v79, (uint64_t)inited);
  unint64_t v152 = inited;
  uint64_t v86 = objc_msgSend_uploaded(inited, v84, v85);
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id obj = v18;
  uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v87, (uint64_t)&v157, v162, 16);
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v158;
    do
    {
      uint64_t v91 = 0;
      do
      {
        if (*(void *)v158 != v90) {
          objc_enumerationMutation(obj);
        }
        v92 = *(void **)(*((void *)&v157 + 1) + 8 * v91);
        id v93 = objc_alloc(MEMORY[0x1E4F19E50]);
        uint64_t v96 = objc_msgSend_initInternal(v93, v94, v95);
        objc_msgSend_setRecord_(v96, v97, (uint64_t)v24);
        BOOL v100 = objc_msgSend_recordKey(v35, v98, v99);
        objc_msgSend_setRecordKey_(v96, v101, (uint64_t)v100);

        uint64_t v104 = objc_msgSend_signature(v92, v102, v103);
        objc_msgSend_setSignature_(v96, v105, (uint64_t)v104);

        uint64_t v108 = objc_msgSend_fileSize(v92, v106, v107);
        objc_msgSend_setSize_(v96, v109, v108);
        uint64_t v112 = objc_msgSend_paddedFileSize(v92, v110, v111);
        objc_msgSend_setPaddedFileSize_(v96, v113, v112);
        if (objc_msgSend_fileSize(v92, v114, v115))
        {
          char v118 = objc_msgSend_uploadReceipt(v92, v116, v117);
          objc_msgSend_setUploadReceipt_(v96, v119, (uint64_t)v118);
        }
        else
        {
          objc_msgSend_setUploadReceipt_(v96, v116, 0);
        }
        objc_msgSend_uploadReceiptExpiration(v92, v120, v121);
        objc_msgSend_setUploadReceiptExpiration_(v96, v122, v123);
        if (objc_msgSend_useEncryption(self, v124, v125))
        {
          uint64_t v128 = objc_msgSend_assetKey(v92, v126, v127);
          objc_msgSend_setAssetKey_(v96, v129, (uint64_t)v128);

          long long v132 = objc_msgSend_referenceSignature(v92, v130, v131);
          objc_msgSend_setReferenceSignature_(v96, v133, (uint64_t)v132);
        }
        else
        {
          int v136 = objc_msgSend_useClearAssetEncryption(self, v126, v127);
          long long v137 = (void *)*MEMORY[0x1E4F1A548];
          if (v136)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v137);
            }
            long long v138 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C4CFF000, v138, OS_LOG_TYPE_ERROR, "Clear Asset Key Not Supported For Package Section.", buf, 2u);
            }
          }
          else
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], v137);
            }
            uint64_t v139 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C4CFF000, v139, OS_LOG_TYPE_DEBUG, "Skipping asset keys on section item because encryption is disabled", buf, 2u);
            }
          }
        }
        if (objc_msgSend_fileSize(v92, v134, v135))
        {
          long long v142 = objc_msgSend_uploadReceipt(v92, v140, v141);
          objc_msgSend_setUploaded_(v96, v143, v142 != 0);

          if (v86) {
            goto LABEL_35;
          }
        }
        else
        {
          objc_msgSend_setUploaded_(v96, v140, 1);
          if (v86)
          {
LABEL_35:
            uint64_t v86 = objc_msgSend_uploaded(v96, v144, v145);
            goto LABEL_38;
          }
        }
        uint64_t v86 = 0;
LABEL_38:
        if (objc_msgSend_fileSize(v92, v144, v145)) {
          objc_msgSend_addObject_(v156, v146, (uint64_t)v96);
        }

        ++v91;
      }
      while (v89 != v91);
      uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v147, (uint64_t)&v157, v162, 16);
    }
    while (v89);
  }

  if (v86) {
    uint64_t v149 = (uint64_t)v156;
  }
  else {
    uint64_t v149 = 0;
  }
  id v7 = v35;
  objc_msgSend_setAssets_(v35, v148, v149);
  objc_msgSend_setUploaded_(v35, v150, v86);
  objc_msgSend__didUploadAsset_error_(self, v151, (uint64_t)v35, 0);

  id v4 = v154;
LABEL_46:
}

- (BOOL)_upload
{
  uint64_t v291 = *MEMORY[0x1E4F143B8];
  char hasSuccessfulBatches = objc_msgSend_hasSuccessfulBatches(self->_assetRequestPlanner, a2, v2);
  if (hasSuccessfulBatches)
  {
    uint64_t v6 = objc_msgSend_container(self, v4, v5);
    v229 = objc_msgSend_MMCS(v6, v7, v8);

    group = dispatch_group_create();
    dispatch_group_enter(group);
    uint64_t v11 = objc_msgSend_stateTransitionGroup(self, v9, v10);
    dispatch_group_enter(v11);

    objc_msgSend_qualityOfService(self, v12, v13);
    uint64_t v14 = CKGetGlobalQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4E427D0;
    block[3] = &unk_1E64F05C8;
    void block[4] = self;
    dispatch_group_notify(group, v14, block);

    long long v278 = 0u;
    long long v279 = 0u;
    long long v276 = 0u;
    long long v277 = 0u;
    objc_msgSend_assetRegisterAndPutBatches(self->_assetRequestPlanner, v15, v16);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v276, v290, 16);
    if (v20)
    {
      id v242 = *(id *)v277;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(id *)v277 != v242) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v276 + 1) + 8 * i);
          if ((objc_msgSend_isFailed(v22, v18, v19) & 1) == 0)
          {
            long long v274 = 0u;
            long long v275 = 0u;
            long long v272 = 0u;
            long long v273 = 0u;
            uint64_t v23 = objc_msgSend_allMMCSAndSectionItems(v22, v18, v19);
            uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v272, v289, 16);
            if (v27)
            {
              uint64_t v28 = *(void *)v273;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v273 != v28) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v32 = objc_msgSend_package(*(void **)(*((void *)&v272 + 1) + 8 * j), v25, v26);
                  if (v32)
                  {
                    double v33 = objc_msgSend_uploadTasksByPackages(self, v30, v31);
                    id v35 = objc_msgSend_objectForKey_(v33, v34, (uint64_t)v32);

                    uint64_t v38 = objc_msgSend_group(v35, v36, v37);
                    dispatch_group_enter(v38);
                  }
                }
                uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v272, v289, 16);
              }
              while (v27);
            }
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v276, v290, 16);
      }
      while (v20);
    }

    uint64_t v41 = objc_msgSend_uploadTasksByPackages(self, v39, v40);
    uint64_t v44 = objc_msgSend_count(v41, v42, v43);

    if (v44)
    {
      long long v47 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v45, v46);
      unint64_t v49 = objc_msgSend_maxPackageUploadsPerBatchWithDefaultValue_(v47, v48, 6);

      if (v49 <= 1) {
        unint64_t v51 = 1;
      }
      else {
        unint64_t v51 = v49;
      }
      if (v51 >= 0x64) {
        objc_msgSend_setMaxPackageUploadsPerBatch_(self, v50, 100);
      }
      else {
        objc_msgSend_setMaxPackageUploadsPerBatch_(self, v50, v51);
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v52 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v225 = v52;
        uint64_t v228 = objc_msgSend_maxPackageUploadsPerBatch(self, v226, v227);
        *(_DWORD *)locatiouint64_t n = 134218240;
        *(void *)&location[4] = v228;
        __int16 v287 = 2048;
        unint64_t v288 = v49;
        _os_log_debug_impl(&dword_1C4CFF000, v225, OS_LOG_TYPE_DEBUG, "maxPackageUploadsPerBatch:%lu (%lu)", location, 0x16u);
      }
      id v53 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v56 = objc_msgSend_uploadTasksByPackages(self, v54, v55);
      uint64_t v59 = objc_msgSend_count(v56, v57, v58);
      id obja = (id)objc_msgSend_initWithCapacity_(v53, v60, v59);

      id v61 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v64 = objc_msgSend_maxPackageUploadsPerBatch(self, v62, v63);
      v236 = objc_msgSend_initWithCapacity_(v61, v65, v64);
      uint64_t v68 = objc_msgSend_uploadTasksByPackages(self, v66, v67);
      __int16 v71 = objc_msgSend_objectEnumerator(v68, v69, v70);
      uint64_t v74 = objc_msgSend_allObjects(v71, v72, v73);
      id v76 = objc_msgSend_sortedArrayUsingComparator_(v74, v75, (uint64_t)&unk_1F2043550);

      long long v270 = 0u;
      long long v271 = 0u;
      long long v268 = 0u;
      long long v269 = 0u;
      id v243 = v76;
      uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v243, v77, (uint64_t)&v268, v285, 16);
      if (v78)
      {
        uint64_t v79 = *(void *)v269;
        uint64_t v80 = MEMORY[0x1E4F143A8];
        do
        {
          for (uint64_t k = 0; k != v78; ++k)
          {
            if (*(void *)v269 != v79) {
              objc_enumerationMutation(v243);
            }
            uint64_t v82 = *(void **)(*((void *)&v268 + 1) + 8 * k);
            dispatch_group_enter(group);
            uint64_t v85 = objc_msgSend_package(v82, v83, v84);
            char isReference = objc_msgSend_isReference(v85, v86, v87);

            if ((isReference & 1) == 0)
            {
              objc_msgSend_addObject_(obja, v89, (uint64_t)v82);
              id v93 = objc_msgSend_group(v82, v91, v92);
              dispatch_group_enter(v93);
            }
            uint64_t v94 = objc_msgSend_group(v82, v89, v90);
            v97 = objc_msgSend_queue(self, v95, v96);
            v266[0] = v80;
            v266[1] = 3221225472;
            v266[2] = sub_1C4E42838;
            v266[3] = &unk_1E64F0120;
            v266[4] = self;
            v266[5] = v82;
            v267 = group;
            dispatch_group_notify(v94, v97, v266);
          }
          uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v243, v98, (uint64_t)&v268, v285, 16);
        }
        while (v78);
      }

      objc_msgSend__uploadPackageSectionsWithPendingTasks_uploadingTasks_completedTasks_(self, v99, (uint64_t)obja, v236, 0);
    }
    long long v264 = 0u;
    long long v265 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    objc_msgSend_assetRegisterAndPutBatches(self->_assetRequestPlanner, v45, v46);
    id v230 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v233 = objc_msgSend_countByEnumeratingWithState_objects_count_(v230, v100, (uint64_t)&v262, v284, 16);
    if (v233)
    {
      uint64_t v231 = *(void *)v263;
      do
      {
        for (uint64_t m = 0; m != v233; ++m)
        {
          if (*(void *)v263 != v231) {
            objc_enumerationMutation(v230);
          }
          v235 = *(void **)(*((void *)&v262 + 1) + 8 * m);
          v237 = objc_msgSend_allMMCSItems(v235, v101, v102);
          if (!objc_msgSend_count(v237, v103, v104)) {
            goto LABEL_88;
          }
          char isFailed = objc_msgSend_isFailed(v235, v105, v106);

          if (isFailed) {
            continue;
          }
          dispatch_group_enter(group);
          uint64_t v108 = [CKDMMCSItemGroupSet alloc];
          uint64_t v111 = objc_msgSend_allMMCSItems(v235, v109, v110);
          v237 = objc_msgSend_initWithItems_(v108, v112, (uint64_t)v111);

          if (_os_feature_enabled_impl())
          {
            uint64_t v115 = objc_msgSend_allMMCSItems(v235, v113, v114);
            objc_msgSend_CKFilter_(v115, v116, (uint64_t)&unk_1F2043510);
            id v117 = (id)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_count(v117, v118, v119))
            {
              objc_msgSend__didUploadMMCSItems_error_(self, v120, (uint64_t)v117, 0);
              long long v260 = 0u;
              long long v261 = 0u;
              long long v258 = 0u;
              long long v259 = 0u;
              id v122 = v117;
              uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v123, (uint64_t)&v258, v283, 16);
              if (v126)
              {
                uint64_t v127 = *(void *)v259;
                do
                {
                  for (uint64_t n = 0; n != v126; ++n)
                  {
                    if (*(void *)v259 != v127) {
                      objc_enumerationMutation(v122);
                    }
                    uint64_t v131 = objc_msgSend_package(*(void **)(*((void *)&v258 + 1) + 8 * n), v124, v125);
                    if (v131)
                    {
                      long long v132 = objc_msgSend_uploadTasksByPackages(self, v129, v130);
                      long long v134 = objc_msgSend_objectForKey_(v132, v133, (uint64_t)v131);

                      long long v137 = objc_msgSend_group(v134, v135, v136);
                      dispatch_group_leave(v137);
                    }
                  }
                  uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v124, (uint64_t)&v258, v283, 16);
                }
                while (v126);
              }
            }
            long long v138 = objc_msgSend_allMMCSItems(v235, v120, v121);
            uint64_t v140 = objc_msgSend_CKFilter_(v138, v139, (uint64_t)&unk_1F2043530);

            if (!objc_msgSend_count(v140, v141, v142)) {
              goto LABEL_87;
            }
            uint64_t v143 = [CKDMMCSItemGroupSet alloc];
            uint64_t v145 = objc_msgSend_initWithItems_(v143, v144, (uint64_t)v140);

            v237 = (void *)v145;
          }
          long long v146 = objc_msgSend_assetZone(v235, v113, v114);
          uint64_t v149 = objc_msgSend_assetZoneKey(v146, v147, v148);
          unint64_t v152 = objc_msgSend_cloneContext(v149, v150, v151);
          objc_msgSend_setCloneContext_(v237, v153, (uint64_t)v152);

          id v156 = objc_msgSend_allItemGroups(v237, v154, v155);
          if (objc_msgSend_count(v156, v157, v158) != 1) {
            __assert_rtn("-[CKDUploadAssetsOperation _upload]", "CKDUploadAssetsOperation.m", 1537, "putItemGroupSet.allItemGroups.count == 1");
          }

          id v117 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v256 = 0u;
          long long v257 = 0u;
          long long v254 = 0u;
          long long v255 = 0u;
          objc_msgSend_allItemGroups(v237, v159, v160);
          id v238 = (id)objc_claimAutoreleasedReturnValue();
          id v244 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v238, v161, (uint64_t)&v254, v282, 16);
          if (v244)
          {
            id objb = *(id *)v255;
            do
            {
              for (iuint64_t i = 0; ii != v244; iuint64_t i = (char *)ii + 1)
              {
                if (*(id *)v255 != objb) {
                  objc_enumerationMutation(v238);
                }
                id v165 = *(void **)(*((void *)&v254 + 1) + 8 * (void)ii);
                long long v250 = 0u;
                long long v251 = 0u;
                long long v252 = 0u;
                long long v253 = 0u;
                id v166 = objc_msgSend_items(v165, v162, v163);
                uint64_t v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(v166, v167, (uint64_t)&v250, v281, 16);
                if (v170)
                {
                  uint64_t v171 = *(void *)v251;
                  do
                  {
                    for (juint64_t j = 0; jj != v170; ++jj)
                    {
                      if (*(void *)v251 != v171) {
                        objc_enumerationMutation(v166);
                      }
                      long long v173 = objc_msgSend_recordID(*(void **)(*((void *)&v250 + 1) + 8 * jj), v168, v169);
                      long long v176 = objc_msgSend_zoneID(v173, v174, v175);
                      unint64_t v179 = objc_msgSend_zoneName(v176, v177, v178);

                      if (v179) {
                        objc_msgSend_addObject_(v117, v180, (uint64_t)v179);
                      }
                    }
                    uint64_t v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(v166, v168, (uint64_t)&v250, v281, 16);
                  }
                  while (v170);
                }
              }
              id v244 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v238, v162, (uint64_t)&v254, v282, 16);
            }
            while (v244);
          }

          id v181 = [CKDMMCSRequestOptions alloc];
          uint64_t v140 = objc_msgSend_initWithOperation_(v181, v182, (uint64_t)self);
          uint64_t v185 = objc_msgSend_allObjects(v117, v183, v184);
          objc_msgSend_setZoneNames_(v140, v186, (uint64_t)v185);

          v189 = objc_msgSend_assetZone(v235, v187, v188);
          uint64_t v192 = objc_msgSend_assetZoneKey(v189, v190, v191);

          uint64_t v195 = objc_msgSend_useMMCSEncryptionV2(v192, v193, v194);
          int v198 = objc_msgSend_BOOLValue(v195, v196, v197);

          v201 = objc_msgSend_cloneContext(v192, v199, v200);
          if (v201) {
            char v202 = v198;
          }
          else {
            char v202 = 0;
          }

          if ((v202 & 1) == 0)
          {
            __int16 v205 = objc_msgSend_authPutResponse(v235, v203, v204);
            objc_msgSend_setAuthPutResponse_(v140, v206, (uint64_t)v205);
          }
          if (v198) {
            objc_msgSend_setUseFORD_(v140, v203, 1);
          }
          __int16 v207 = objc_msgSend_authPutResponseHeaders(v235, v203, v204);
          objc_msgSend_setAuthPutResponseHeaders_(v140, v208, (uint64_t)v207);

          uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v209, v210);
          objc_msgSend_setShouldCloneFileInAssetCache_(v140, v212, shouldCloneFileInAssetCache);
          objc_initWeak((id *)location, self);
          v248[0] = MEMORY[0x1E4F143A8];
          v248[1] = 3221225472;
          v248[2] = sub_1C4E428E8;
          v248[3] = &unk_1E64F4108;
          objc_copyWeak(&v249, (id *)location);
          v246[0] = MEMORY[0x1E4F143A8];
          v246[1] = 3221225472;
          v246[2] = sub_1C4E42944;
          v246[3] = &unk_1E64F4048;
          v246[4] = self;
          v246[5] = v235;
          v247 = group;
          uint64_t v214 = objc_msgSend_putItemGroupSet_operation_options_progress_completionHandler_(v229, v213, (uint64_t)v237, self, v140, v248, v246);
          id v217 = objc_msgSend_cancelTokens(self, v215, v216);
          objc_msgSend_addCancelToken_withOperation_(v217, v218, (uint64_t)v214, self);

          objc_destroyWeak(&v249);
          objc_destroyWeak((id *)location);

LABEL_87:
LABEL_88:
        }
        uint64_t v233 = objc_msgSend_countByEnumeratingWithState_objects_count_(v230, v101, (uint64_t)&v262, v284, 16);
      }
      while (v233);
    }

    dispatch_group_leave(group);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v219 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v221 = v219;
      v224 = objc_msgSend_operationID(self, v222, v223);
      *(_DWORD *)locatiouint64_t n = 138543362;
      *(void *)&location[4] = v224;
      _os_log_debug_impl(&dword_1C4CFF000, v221, OS_LOG_TYPE_DEBUG, "No files or packages to upload for operation %{public}@", location, 0xCu);
    }
  }
  return hasSuccessfulBatches;
}

- (void)_removePackageManifests
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, v2);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = objc_msgSend_assetsToUpload(self, v4, v5);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v47, v55, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v48;
    *(void *)&long long v9 = 138543618;
    long long v42 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v47 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v13;
          uint64_t v18 = objc_msgSend_manifestItem(v15, v16, v17);
          uint64_t v21 = v18;
          if (v18)
          {
            uint64_t v22 = (void *)MEMORY[0x1E4F28ED0];
            uint64_t v23 = objc_msgSend_itemID(v18, v19, v20);
            uint64_t v25 = objc_msgSend_numberWithUnsignedLongLong_(v22, v24, v23);
            objc_msgSend_addObject_(v45, v26, (uint64_t)v25);

            id v30 = objc_msgSend_fileURL(v21, v27, v28);
            if (v30)
            {
              id v46 = 0;
              char v31 = objc_msgSend_removeItemAtURL_error_(v44, v29, (uint64_t)v30, &v46);
              id v32 = v46;
              double v33 = (void *)*MEMORY[0x1E4F1A548];
              if (v31)
              {
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], v33);
                }
                id v34 = (void *)*MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
                {
                  id v35 = v34;
                  uint64_t v43 = objc_msgSend_path(v30, v36, v37);
                  *(_DWORD *)buf = 138543362;
                  uint64_t v52 = v43;
                  _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Removed package manifest at %{public}@", buf, 0xCu);
                  goto LABEL_23;
                }
              }
              else
              {
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], v33);
                }
                uint64_t v38 = (void *)*MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
                {
                  id v35 = v38;
                  uint64_t v43 = objc_msgSend_path(v30, v39, v40);
                  *(_DWORD *)buf = v42;
                  uint64_t v52 = v43;
                  __int16 v53 = 2112;
                  id v54 = v32;
                  _os_log_error_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_ERROR, "Failed to remove package manifest at %{public}@: %@", buf, 0x16u);
LABEL_23:
                }
              }
            }
            else
            {
              id v32 = 0;
            }
            objc_msgSend_setManifestItem_(v15, v29, 0, v42);
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v47, v55, 16);
      uint64_t v10 = v41;
    }
    while (v41);
  }
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)CKDUploadAssetsOperation;
  [(CKDOperation *)&v8 cancel];
  uint64_t v5 = objc_msgSend_cancelTokens(self, v3, v4);
  objc_msgSend_cancel(v5, v6, v7);
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend__closeAllPackages(self, v5, v6);
  objc_msgSend__removePackageManifests(self, v7, v8);
  uint64_t v11 = objc_msgSend_cancelTokens(self, v9, v10);
  objc_msgSend_removeAllCancelTokens(v11, v12, v13);

  v14.receiver = self;
  v14.super_class = (Class)CKDUploadAssetsOperation;
  [(CKDOperation *)&v14 finishWithError:v4];
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  objc_msgSend_setUploadPreparationBlock_(self, v7, 0);
  objc_msgSend_setUploadProgressBlock_(self, v8, 0);
  objc_msgSend_setUploadCompletionBlock_(self, v9, 0);
  uint64_t v12 = objc_msgSend_container(self, v10, v11);
  id v15 = objc_msgSend_MMCS(v12, v13, v14);
  objc_msgSend_performOperationCleanup(v15, v16, v17);

  v18.receiver = self;
  v18.super_class = (Class)CKDUploadAssetsOperation;
  [(CKDOperation *)&v18 _finishOnCallbackQueueWithError:v4];
}

- (void)main
{
  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  uint64_t v6 = objc_msgSend_container(self, v4, v5);
  id v17 = 0;
  char v8 = objc_msgSend_setupAssetTransfers_(v6, v7, (uint64_t)&v17);
  id v9 = v17;

  if (v8)
  {
    uint64_t v12 = objc_msgSend_assetsToUpload(self, v10, v11);
    BOOL v15 = objc_msgSend_count(v12, v13, v14) == 0;

    objc_msgSend_makeStateTransition_(self, v16, v15);
  }
  else
  {
    objc_msgSend_finishWithError_(self, v10, (uint64_t)v9);
  }
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (id)uploadPreparationBlock
{
  return self->_uploadPreparationBlock;
}

- (void)setUploadPreparationBlock:(id)a3
{
}

- (id)uploadProgressBlock
{
  return self->_uploadProgressBlock;
}

- (void)setUploadProgressBlock:(id)a3
{
}

- (id)uploadCompletionBlock
{
  return self->_uploadCompletionBlock;
}

- (void)setUploadCompletionBlock:(id)a3
{
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)assetsToUpload
{
  return self->_assetsToUpload;
}

- (void)setAssetsToUpload:(id)a3
{
}

- (NSMapTable)uploadTasksByPackages
{
  return self->_uploadTasksByPackages;
}

- (void)setUploadTasksByPackages:(id)a3
{
}

- (NSMutableArray)openedPackages
{
  return self->_openedPackages;
}

- (void)setOpenedPackages:(id)a3
{
}

- (CKDCancelTokenGroup)cancelTokens
{
  return self->_cancelTokens;
}

- (void)setCancelTokens:(id)a3
{
}

- (unint64_t)maxPackageUploadsPerBatch
{
  return self->_maxPackageUploadsPerBatch;
}

- (void)setMaxPackageUploadsPerBatch:(unint64_t)a3
{
  self->_maxPackageUploadsPerBatch = a3;
}

- (CKDAssetRequestPlanner)assetRequestPlanner
{
  return self->_assetRequestPlanner;
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
}

- (NSDictionary)packageUUIDToExpectedProperties
{
  return self->_packageUUIDToExpectedProperties;
}

- (void)setPackageUUIDToExpectedProperties:(id)a3
{
}

- (BOOL)temporary
{
  return self->_temporary;
}

- (void)setTemporary:(BOOL)a3
{
  self->_temporary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetRequestPlanner, 0);
  objc_storeStrong((id *)&self->_cancelTokens, 0);
  objc_storeStrong((id *)&self->_openedPackages, 0);
  objc_storeStrong((id *)&self->_uploadTasksByPackages, 0);
  objc_storeStrong((id *)&self->_assetsToUpload, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_uploadCompletionBlock, 0);
  objc_storeStrong(&self->_uploadProgressBlock, 0);
  objc_storeStrong(&self->_uploadPreparationBlock, 0);
  objc_storeStrong((id *)&self->_cloneContextsBySignature, 0);
}

@end