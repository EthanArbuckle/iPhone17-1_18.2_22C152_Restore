@interface CKDMMCSItemGroupContext
+ (MMCSItemReaderWriter)getMMCSItemReaderForItemID:(unint64_t)a3 MMCS:(id)a4 itemGroupContext:(id)a5 downloadChunkContext:(id)a6 error:(id *)a7;
- (BOOL)_setupGetMMCSItemsWithError:(id *)a3;
- (BOOL)_setupMMCSItemsWithError:(id *)a3;
- (BOOL)_setupPutMMCSItemsWithError:(id *)a3;
- (BOOL)_setupRegisterMMCSItemsWithError:(id *)a3;
- (BOOL)didReadFromItemReaderWriter:(id)a3 offset:(unint64_t)a4 bytes:(char *)a5 length:(unint64_t)a6 bytesRead:(unint64_t *)a7 error:(id *)a8;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldFetchAssetContentInMemory;
- (BOOL)shouldFetchAssetContentUsingAssetDownloadStagingManager;
- (BOOL)shouldFetchAssetContentWithReaderWriter;
- (BOOL)willCloseItemReaderWriter:(id)a3 error:(id *)a4;
- (BOOL)willGetFileMetadataItemReaderWriter:(id)a3 error:(id *)a4;
- (BOOL)willOpenItemReaderWriter:(id)a3 error:(id *)a4;
- (BOOL)willReadFromItemReaderWriter:(id)a3 offset:(unint64_t)a4 bytes:(char *)a5 length:(unint64_t)a6 bytesRead:(unint64_t *)a7 error:(id *)a8;
- (CKDMMCS)MMCS;
- (CKDMMCSItem)MMCSPackageSectionItem;
- (CKDMMCSItemGroup)itemGroup;
- (CKDMMCSItemGroupContext)initWithMMCS:(id)a3 itemGroup:(id)a4 operation:(id)a5 progress:(id)a6 command:(id)a7 start:(id)a8 groupCompletion:(id)a9;
- (CKDOperation)operation;
- (CKSignpost)signpost;
- (NSMapTable)MMCSItemsByItemID;
- (NSNumber)hasConformingOperation;
- (id)commandBlock;
- (id)completionBlock;
- (id)conformingOperation;
- (id)didGetFileMetadataItemReaderWriter:(id)a3 fileMetadata:(id)a4 error:(id)a5;
- (id)findTrackedMMCSItemByItemID:(unint64_t)a3;
- (id)getCKDMMCSItemReaderByPathForMMCSItem:(id)a3 error:(id *)a4;
- (id)operationInfo;
- (id)progressBlock;
- (id)startBlock;
- (int64_t)mmcsOperationType;
- (void)_cleanupMMCSItems;
- (void)_cleanupMMCSRegisterItems;
- (void)_startTrackingMMCSItems:(id)a3;
- (void)_stopTrackingMMCSItems:(id)a3;
- (void)cancel;
- (void)didCompleteRequestWithError:(id)a3;
- (void)didGetItemID:(unint64_t)a3 signature:(id)a4 path:(id)a5 error:(id)a6 results:(id)a7;
- (void)didGetMetricsForRequest:(id)a3;
- (void)didOpenItemReaderWriter:(id)a3 result:(BOOL)a4 error:(id)a5;
- (void)didPutItemID:(unint64_t)a3 signature:(id)a4 results:(id)a5;
- (void)didPutSectionWithSignature:(id)a3 results:(id)a4;
- (void)handleCommand:(id)a3 forItem:(id)a4;
- (void)setCommandBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setHasConformingOperation:(id)a3;
- (void)setItemGroup:(id)a3;
- (void)setMMCS:(id)a3;
- (void)setMMCSItemsByItemID:(id)a3;
- (void)setMMCSPackageSectionItem:(id)a3;
- (void)setMmcsOperationType:(int64_t)a3;
- (void)setOperation:(id)a3;
- (void)setOperationInfo:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setStartBlock:(id)a3;
- (void)start;
- (void)updateProgressForItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 error:(id)a6;
- (void)updateProgressForItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 results:(id)a6;
- (void)updateProgressForPackageSectionState:(int)a3 progress:(double)a4 results:(id)a5;
@end

@implementation CKDMMCSItemGroupContext

- (CKDMMCSItemGroupContext)initWithMMCS:(id)a3 itemGroup:(id)a4 operation:(id)a5 progress:(id)a6 command:(id)a7 start:(id)a8 groupCompletion:(id)a9
{
  id v47 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v48.receiver = self;
  v48.super_class = (Class)CKDMMCSItemGroupContext;
  v22 = [(CKDMMCSItemGroupContext *)&v48 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_MMCS, a3);
    objc_storeStrong((id *)&v23->_itemGroup, a4);
    objc_storeWeak((id *)&v23->_operation, v17);
    v24 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v26 = objc_msgSend_conformsToProtocol_(v17, v25, (uint64_t)&unk_1F2116138);
    uint64_t v28 = objc_msgSend_numberWithBool_(v24, v27, v26);
    hasConformingOperation = v23->_hasConformingOperation;
    v23->_hasConformingOperation = (NSNumber *)v28;

    v30 = _Block_copy(v18);
    id progressBlock = v23->_progressBlock;
    v23->_id progressBlock = v30;

    v32 = _Block_copy(v20);
    id startBlock = v23->_startBlock;
    v23->_id startBlock = v32;

    v34 = _Block_copy(v21);
    id completionBlock = v23->_completionBlock;
    v23->_id completionBlock = v34;

    v36 = _Block_copy(v19);
    id commandBlock = v23->_commandBlock;
    v23->_id commandBlock = v36;

    uint64_t v40 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v38, v39);
    MMCSItemsByItemID = v23->_MMCSItemsByItemID;
    v23->_MMCSItemsByItemID = (NSMapTable *)v40;

    id v42 = objc_alloc(MEMORY[0x1E4F1A3C0]);
    uint64_t v44 = objc_msgSend_initWithLog_(v42, v43, *MEMORY[0x1E4F1A518]);
    signpost = v23->_signpost;
    v23->_signpost = (CKSignpost *)v44;
  }
  return v23;
}

- (void)cancel
{
  objc_msgSend_MMCS(self, a2, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_MMCSEngineContext(v8, v4, v5);
  objc_msgSend_cancelRequestWithContext_(v6, v7, (uint64_t)self);
}

- (void)start
{
  uint64_t v5 = objc_msgSend_signpost(self, a2, v2);

  if (v5)
  {
    id v8 = objc_msgSend_signpost(self, v6, v7);
    v11 = objc_msgSend_log(v8, v9, v10);

    v14 = objc_msgSend_signpost(self, v12, v13);
    os_signpost_id_t v17 = objc_msgSend_identifier(v14, v15, v16);

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CKDMMCSItemGroupContext", "", buf, 2u);
    }
  }
  objc_msgSend_hash(self, v6, v7);
  kdebug_trace();
  id v20 = objc_msgSend_MMCS(self, v18, v19);
  v23 = objc_msgSend_MMCSEngineContext(v20, v21, v22);

  if (!v23)
  {
    v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v24, v25);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 76, @"Expected non-nil MMCS engine context");
  }
  uint64_t v26 = objc_msgSend_MMCS(self, v24, v25);
  v29 = objc_msgSend_MMCSEngineContext(v26, v27, v28);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4F23830;
  v33[3] = &unk_1E64F05C8;
  v33[4] = self;
  objc_msgSend_MMCSSerializeAsyncRecursive_(v29, v30, (uint64_t)v33);
}

- (BOOL)shouldFetchAssetContentInMemory
{
  if (objc_msgSend_mmcsOperationType(self, a2, v2) != 2) {
    return 0;
  }
  v6 = objc_msgSend_operationInfo(self, v4, v5);
  BOOL v9 = objc_msgSend_destination(v6, v7, v8) == 1;

  return v9;
}

- (BOOL)shouldFetchAssetContentUsingAssetDownloadStagingManager
{
  if (objc_msgSend_mmcsOperationType(self, a2, v2) != 2) {
    return 0;
  }
  v6 = objc_msgSend_operationInfo(self, v4, v5);
  BOOL v9 = objc_msgSend_destination(v6, v7, v8) == 2;

  return v9;
}

- (BOOL)shouldFetchAssetContentWithReaderWriter
{
  if (objc_msgSend_mmcsOperationType(self, a2, v2) != 2) {
    return 0;
  }
  v6 = objc_msgSend_operationInfo(self, v4, v5);
  BOOL v9 = v6;
  if (v6) {
    BOOL v10 = objc_msgSend_destination(v6, v7, v8) != 0;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_startTrackingMMCSItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_msgSend_MMCSItemsByItemID(self, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v5;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v30, v34, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (!objc_msgSend_itemID(v16, v11, v12))
        {
          v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 125, @"Expected non-nil itemID for %@", v16);
        }
        uint64_t v19 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v20 = objc_msgSend_itemID(v16, v17, v18);
        uint64_t v22 = objc_msgSend_numberWithUnsignedLongLong_(v19, v21, v20);
        objc_msgSend_setObject_forKey_(v8, v23, (uint64_t)v16, v22);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v30, v34, 16);
    }
    while (v13);
  }

  objc_sync_exit(v8);
  uint64_t v28 = objc_msgSend_MMCS(self, v26, v27);
  objc_msgSend_startTrackingItemIDsForMMCSItems_(v28, v29, (uint64_t)v9);
}

- (void)_stopTrackingMMCSItems:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_MMCS(self, v5, v6);
  objc_msgSend_stopTrackingItemIDsForMMCSItems_(v7, v8, (uint64_t)v4);

  objc_msgSend_MMCSItemsByItemID(self, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v4;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, v38, 16);
  if (v16)
  {
    uint64_t v18 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
    uint64_t v19 = *(void *)v33;
    uint64_t v20 = (os_log_t *)MEMORY[0x1E4F1A500];
    *(void *)&long long v17 = 138412290;
    long long v31 = v17;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v12);
        }
        uint64_t v22 = *(void **)(*((void *)&v32 + 1) + 8 * v21);
        if (objc_msgSend_itemID(v22, v14, v15, v31, (void)v32))
        {
          uint64_t v25 = (void *)MEMORY[0x1E4F28ED0];
          uint64_t v26 = objc_msgSend_itemID(v22, v23, v24);
          uint64_t v28 = objc_msgSend_numberWithUnsignedLongLong_(v25, v27, v26);
          objc_msgSend_removeObjectForKey_(v11, v29, (uint64_t)v28);
        }
        else
        {
          if (*v18 != -1) {
            dispatch_once(v18, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          long long v30 = *v20;
          if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            v37 = v22;
            _os_log_debug_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_DEBUG, "ignoring item with zero itemID in _stopTrackingMMCSItems %@", buf, 0xCu);
          }
        }
        ++v21;
      }
      while (v16 != v21);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v32, v38, 16);
    }
    while (v16);
  }

  objc_sync_exit(v11);
}

- (id)findTrackedMMCSItemByItemID:(unint64_t)a3
{
  objc_msgSend_MMCSItemsByItemID(self, a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  uint64_t v6 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v5, a3);
  id v8 = objc_msgSend_objectForKey_(v4, v7, (uint64_t)v6);

  objc_sync_exit(v4);
  return v8;
}

- (BOOL)_setupRegisterMMCSItemsWithError:(id *)a3
{
  id v5 = self;
  uint64_t v317 = *MEMORY[0x1E4F143B8];
  id v8 = objc_msgSend_MMCS(self, a2, (uint64_t)a3);
  if (!v8)
  {
    v286 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v286, v287, (uint64_t)a2, v5, @"CKDMMCSItemGroupContext.m", 157, @"Expected non-nil MMCS engine wrapper for %@", v5);
  }
  id v9 = objc_msgSend_assetCache(v8, v6, v7);

  if (!v9)
  {
    v288 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v288, v289, (uint64_t)a2, v5, @"CKDMMCSItemGroupContext.m", 158, @"Expected non-nil asset cache for %@", v8);
  }
  id v12 = objc_msgSend_itemGroup(v5, v10, v11);
  uint64_t v15 = objc_msgSend_items(v12, v13, v14);
  uint64_t v18 = objc_msgSend_count(v15, v16, v17);

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v22 = objc_msgSend_initWithCapacity_(v20, v21, v18);
  id v23 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v297 = objc_msgSend_initWithCapacity_(v23, v24, v18);
  if (objc_msgSend_mmcsOperationType(v5, v25, v26) != 5 && objc_msgSend_mmcsOperationType(v5, v27, v28) != 6) {
    __assert_rtn("-[CKDMMCSItemGroupContext _setupRegisterMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 167, "isRegister && \"isRegister\"");
  }
  v290 = a3;
  v292 = v8;
  long long v309 = 0u;
  long long v310 = 0u;
  long long v307 = 0u;
  long long v308 = 0u;
  v29 = objc_msgSend_itemGroup(v5, v27, v28);
  long long v32 = objc_msgSend_items(v29, v30, v31);

  id obj = v32;
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v307, v316, 16);
  v293 = v5;
  id v291 = v19;
  v298 = v22;
  if (v34)
  {
    uint64_t v37 = v34;
    id v38 = 0;
    uint64_t v39 = *(void *)v308;
    uint64_t v295 = *(void *)v308;
    while (1)
    {
      uint64_t v40 = 0;
      uint64_t v294 = v37;
      do
      {
        if (*(void *)v308 != v39) {
          objc_enumerationMutation(obj);
        }
        v41 = *(void **)(*((void *)&v307 + 1) + 8 * v40);
        if (objc_msgSend_itemID(v41, v35, v36))
        {
          objc_msgSend_addObject_(v22, v42, (uint64_t)v41);
          goto LABEL_69;
        }
        uint64_t v44 = objc_msgSend_sectionItems(v41, v42, v43);
        uint64_t v47 = objc_msgSend_count(v44, v45, v46);

        if (v47)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v50 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v313 = v41;
            _os_log_error_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_ERROR, "setting up a package section? %@", buf, 0xCu);
          }
        }
        objc_msgSend_clearFileSize(v41, v48, v49);
        uint64_t v52 = objc_msgSend_setSignature_(v41, v51, 0);
        v53 = (void *)MEMORY[0x1C8789E70](v52);
        id v306 = v38;
        v55 = objc_msgSend_getCKDMMCSItemReaderByPathForMMCSItem_error_(v5, v54, (uint64_t)v41, &v306);
        id v56 = v306;

        if (v55)
        {
          id v305 = v56;
          int v58 = objc_msgSend_openWithError_(v55, v57, (uint64_t)&v305);
          id v38 = v305;

          if (v58)
          {
            id v304 = v38;
            v60 = objc_msgSend_getFileMetadataWithError_(v55, v59, (uint64_t)&v304);
            id v61 = v304;

            if (v60)
            {
              v64 = objc_msgSend_deviceID(v60, v62, v63);
              objc_msgSend_setDeviceID_(v41, v65, (uint64_t)v64);

              v68 = objc_msgSend_fileID(v60, v66, v67);
              objc_msgSend_setFileID_(v41, v69, (uint64_t)v68);

              v72 = objc_msgSend_generationID(v60, v70, v71);
              objc_msgSend_setGenerationID_(v41, v73, (uint64_t)v72);

              v76 = objc_msgSend_modTimeInSeconds(v60, v74, v75);
              objc_msgSend_setModTimeInSeconds_(v41, v77, (uint64_t)v76);

              v80 = objc_msgSend_fileSize(v60, v78, v79);
              uint64_t v83 = objc_msgSend_unsignedLongLongValue(v80, v81, v82);
              objc_msgSend_setFileSize_(v41, v84, v83);
            }
            else
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v89 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v313 = v41;
                __int16 v314 = 2112;
                id v315 = v61;
                _os_log_error_impl(&dword_1C4CFF000, v89, OS_LOG_TYPE_ERROR, "Unable to get info for %@: %@", buf, 0x16u);
              }
              v80 = v61;
              id v61 = 0;
            }

            id v303 = v61;
            char v91 = objc_msgSend_closeWithError_(v55, v90, (uint64_t)&v303);
            id v38 = v303;

            if (v91)
            {
              id v5 = v293;
              uint64_t v37 = v294;
              uint64_t v22 = v298;
              goto LABEL_46;
            }
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v92 = *MEMORY[0x1E4F1A500];
            uint64_t v22 = v298;
            uint64_t v37 = v294;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v313 = v41;
              __int16 v314 = 2112;
              id v315 = v38;
              _os_log_error_impl(&dword_1C4CFF000, v92, OS_LOG_TYPE_ERROR, "Unable to close for %@: %@", buf, 0x16u);
            }
            id v5 = v293;
          }
          else
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v5 = v293;
            v88 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v313 = v41;
              __int16 v314 = 2112;
              id v315 = v38;
              _os_log_error_impl(&dword_1C4CFF000, v88, OS_LOG_TYPE_ERROR, "Unable to open for %@: %@", buf, 0x16u);
            }
            v60 = 0;
          }

          id v38 = 0;
LABEL_46:

          if (v60)
          {
            v93 = objc_msgSend_deviceID(v60, v86, v87);
            objc_msgSend_setDeviceID_(v41, v94, (uint64_t)v93);

            v97 = objc_msgSend_fileID(v60, v95, v96);
            objc_msgSend_setFileID_(v41, v98, (uint64_t)v97);

            v101 = objc_msgSend_generationID(v60, v99, v100);
            objc_msgSend_setGenerationID_(v41, v102, (uint64_t)v101);

            v105 = objc_msgSend_modTimeInSeconds(v60, v103, v104);
            objc_msgSend_setModTimeInSeconds_(v41, v106, (uint64_t)v105);

            v109 = objc_msgSend_fileSize(v60, v107, v108);
            uint64_t v112 = objc_msgSend_unsignedLongLongValue(v109, v110, v111);
            objc_msgSend_setFileSize_(v41, v113, v112);
          }
          goto LABEL_48;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v85 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v313 = v41;
          __int16 v314 = 2112;
          id v315 = v56;
          _os_log_error_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_ERROR, "Unable to open reader for %@: %@", buf, 0x16u);
        }

        id v38 = 0;
        v60 = 0;
LABEL_48:
        if (!objc_msgSend_shouldReadAssetContentUsingClientProxy(v41, v86, v87))
        {
          v122 = [CKDAssetHandle alloc];
          v124 = objc_msgSend_initWithItemID_UUID_path_(v122, v123, 0, 0, 0);
          if ((objc_msgSend_shouldReadRawEncryptedData(v41, v125, v126) & 1) == 0)
          {
            v129 = objc_msgSend_deviceID(v41, v127, v128);
            if (!objc_msgSend_unsignedLongLongValue(v129, v130, v131))
            {

              goto LABEL_55;
            }
            v134 = objc_msgSend_fileID(v41, v132, v133);
            uint64_t v137 = objc_msgSend_unsignedLongLongValue(v134, v135, v136);

            if (!v137)
            {
LABEL_55:
              v140 = objc_msgSend_fileURL(v41, v138, v139);
              v143 = objc_msgSend_path(v140, v141, v142);
              objc_msgSend_setPath_(v124, v144, (uint64_t)v143);
            }
            v145 = objc_msgSend_MMCS(v293, v138, v139);
            v148 = objc_msgSend_assetCache(v145, v146, v147);
            v151 = objc_msgSend_deviceID(v41, v149, v150);
            v153 = objc_msgSend_volumeIndexForDeviceID_(v148, v152, (uint64_t)v151);
            objc_msgSend_setVolumeIndex_(v124, v154, (uint64_t)v153);

            id v5 = v293;
            v157 = objc_msgSend_fileID(v41, v155, v156);
            objc_msgSend_setFileID_(v124, v158, (uint64_t)v157);

            v161 = objc_msgSend_generationID(v41, v159, v160);
            objc_msgSend_setGenerationID_(v124, v162, (uint64_t)v161);

            v165 = objc_msgSend_signature(v41, v163, v164);
            objc_msgSend_setFileSignature_(v124, v166, (uint64_t)v165);

            v167 = (void *)MEMORY[0x1E4F1C9C8];
            v170 = objc_msgSend_modTimeInSeconds(v41, v168, v169);
            objc_msgSend_doubleValue(v170, v171, v172);
            v175 = objc_msgSend_dateWithTimeIntervalSince1970_(v167, v173, v174);
            objc_msgSend_setModTime_(v124, v176, (uint64_t)v175);

            id v19 = v291;
          }
          v177 = (void *)MEMORY[0x1E4F28ED0];
          uint64_t v178 = objc_msgSend_fileSize(v41, v127, v128);
          v180 = objc_msgSend_numberWithUnsignedLongLong_(v177, v179, v178);
          objc_msgSend_setFileSize_(v124, v181, (uint64_t)v180);

          v184 = objc_msgSend_fileSignature(v124, v182, v183);

          if (v184)
          {
            v187 = objc_msgSend_fileSignature(v124, v185, v186);
            v190 = objc_msgSend_zeroSizeFileSignature(CKDMMCS, v188, v189);
            int isEqualToData = objc_msgSend_isEqualToData_(v187, v191, (uint64_t)v190);

            if ((isEqualToData & 1) != 0
              || (objc_msgSend_fileSize(v124, v185, v186),
                  v193 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v196 = objc_msgSend_unsignedLongLongValue(v193, v194, v195),
                  v193,
                  !v196))
            {
              v197 = (void *)MEMORY[0x1E4F1A3B8];
              v198 = objc_msgSend_fileSignature(v124, v185, v186);
              LODWORD(v197) = objc_msgSend_isValidV2Signature_(v197, v199, (uint64_t)v198);

              if (((v197 | isEqualToData) & 1) == 0) {
                __assert_rtn("-[CKDMMCSItemGroupContext _setupRegisterMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 264, "isZeroFileSignature && \"Expected zeroSizeFileSignature\"");
              }
              if ((isEqualToData & 1) == 0) {
                __assert_rtn("-[CKDMMCSItemGroupContext _setupRegisterMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 266, "isZeroFileSignature && \"Expected zeroSizeFileSignature\"");
              }
              v202 = objc_msgSend_fileSize(v124, v200, v201);
              if (objc_msgSend_unsignedLongLongValue(v202, v203, v204)) {
                __assert_rtn("-[CKDMMCSItemGroupContext _setupRegisterMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 267, "assetHandle.fileSize.unsignedLongLongValue == 0 && \"assetHandle.fileSize.unsignedLongLongValue == 0\"");
              }

              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v205 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v313 = v41;
                _os_log_debug_impl(&dword_1C4CFF000, v205, OS_LOG_TYPE_DEBUG, "Zero-length asset with itemID %@", buf, 0xCu);
              }
            }
          }
          v206 = objc_msgSend_boundaryKey(v41, v185, v186);
          objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_(v124, v207, (uint64_t)v206);

          objc_msgSend_addObject_(v297, v208, (uint64_t)v124);
          objc_msgSend_addObject_(v19, v209, (uint64_t)v41);

          uint64_t v22 = v298;
          uint64_t v37 = v294;
          goto LABEL_68;
        }
        v116 = objc_msgSend_MMCSEngineContext(v292, v114, v115);
        uint64_t AvailableItemID = objc_msgSend_nextAvailableItemID(v116, v117, v118);
        objc_msgSend_setItemID_(v41, v120, AvailableItemID);

        objc_msgSend_addObject_(v22, v121, (uint64_t)v41);
LABEL_68:

        uint64_t v39 = v295;
LABEL_69:
        ++v40;
      }
      while (v37 != v40);
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v307, v316, 16);
      if (!v37) {
        goto LABEL_73;
      }
    }
  }
  id v38 = 0;
LABEL_73:

  v210 = v297;
  if (objc_msgSend_count(v297, v211, v212)
    && (objc_msgSend_assetCache(v292, v213, v214),
        v215 = objc_claimAutoreleasedReturnValue(),
        uint64_t v218 = objc_msgSend_mmcsOperationType(v5, v216, v217),
        int started = objc_msgSend_startTrackingRegisterOrPutAssetHandles_operationType_error_(v215, v219, (uint64_t)v297, v218, v290), v215, !started))
  {
    BOOL v284 = 0;
  }
  else
  {
    long long v301 = 0u;
    long long v302 = 0u;
    long long v299 = 0u;
    long long v300 = 0u;
    id v221 = v19;
    uint64_t v223 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v222, (uint64_t)&v299, v311, 16);
    if (v223)
    {
      uint64_t v225 = v223;
      uint64_t v226 = 0;
      uint64_t v227 = *(void *)v300;
      do
      {
        for (uint64_t i = 0; i != v225; ++i)
        {
          if (*(void *)v300 != v227) {
            objc_enumerationMutation(v221);
          }
          v229 = *(void **)(*((void *)&v299 + 1) + 8 * i);
          v230 = objc_msgSend_objectAtIndexedSubscript_(v297, v224, v226 + i);
          v233 = objc_msgSend_itemID(v230, v231, v232);
          uint64_t v236 = objc_msgSend_unsignedLongLongValue(v233, v234, v235);
          objc_msgSend_setItemID_(v229, v237, v236);

          v242 = objc_msgSend_status(v230, v238, v239);
          if (v242)
          {
            v243 = objc_msgSend_status(v230, v240, v241);
            BOOL v246 = objc_msgSend_unsignedIntegerValue(v243, v244, v245) == 2;
            objc_msgSend_setIsAlreadyRegistered_(v229, v247, v246);
          }
          else
          {
            objc_msgSend_setIsAlreadyRegistered_(v229, v240, 0);
          }

          if (objc_msgSend_isAlreadyRegistered(v229, v248, v249))
          {
            v252 = objc_msgSend_fileSize(v230, v250, v251);
            uint64_t v255 = objc_msgSend_unsignedLongLongValue(v252, v253, v254);
            objc_msgSend_setFileSize_(v229, v256, v255);

            v259 = objc_msgSend_fileSignature(v230, v257, v258);
            objc_msgSend_setSignature_(v229, v260, (uint64_t)v259);

            v263 = objc_msgSend_chunkCount(v230, v261, v262);
            uint64_t v266 = objc_msgSend_unsignedIntValue(v263, v264, v265);
            objc_msgSend_setChunkCount_(v229, v267, v266);

            v270 = objc_msgSend_signature(v229, v268, v269);
            v273 = objc_msgSend_asset(v229, v271, v272);
            objc_msgSend_setSignature_(v273, v274, (uint64_t)v270);

            uint64_t v277 = objc_msgSend_fileSize(v229, v275, v276);
            v280 = objc_msgSend_asset(v229, v278, v279);
            objc_msgSend_setSize_(v280, v281, v277);
          }
          else
          {
            objc_msgSend_setIsReaderReadFrom_(v229, v250, 0);
          }
          uint64_t v22 = v298;
          objc_msgSend_addObject_(v298, v282, (uint64_t)v229);
        }
        uint64_t v225 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v224, (uint64_t)&v299, v311, 16);
        v226 += i;
      }
      while (v225);
    }

    objc_msgSend__startTrackingMMCSItems_(v293, v283, (uint64_t)v22);
    BOOL v284 = 1;
    id v19 = v291;
    v210 = v297;
  }

  return v284;
}

- (BOOL)_setupPutMMCSItemsWithError:(id *)a3
{
  uint64_t v243 = *MEMORY[0x1E4F143B8];
  id v8 = objc_msgSend_MMCS(self, a2, (uint64_t)a3);
  if (!v8)
  {
    id v221 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v221, v222, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 308, @"Expected non-nil MMCS engine wrapper for %@", self);
  }
  id v9 = objc_msgSend_assetCache(v8, v6, v7);

  if (!v9)
  {
    uint64_t v223 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v223, v224, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 309, @"Expected non-nil asset cache for %@", v8);
  }
  id v12 = objc_msgSend_itemGroup(self, v10, v11);
  uint64_t v15 = objc_msgSend_items(v12, v13, v14);
  uint64_t v18 = objc_msgSend_count(v15, v16, v17);

  id v229 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v21 = objc_msgSend_initWithCapacity_(v19, v20, v18);
  id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v24 = objc_msgSend_initWithCapacity_(v22, v23, v18);
  if (objc_msgSend_mmcsOperationType(self, v25, v26) == 2 || objc_msgSend_mmcsOperationType(self, v27, v28) == 4) {
    __assert_rtn("-[CKDMMCSItemGroupContext _setupPutMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 318, "!isGet && \"isGet\"");
  }
  uint64_t v225 = a3;
  long long v237 = 0u;
  long long v238 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  uint64_t v227 = self;
  uint64_t v31 = objc_msgSend_itemGroup(self, v29, v30);
  uint64_t v34 = objc_msgSend_items(v31, v32, v33);

  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v235, v242, 16);
  uint64_t v226 = v8;
  v230 = v24;
  if (v36)
  {
    uint64_t v39 = v36;
    uint64_t v40 = *(void *)v236;
    v228 = v34;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v236 != v40) {
          objc_enumerationMutation(v34);
        }
        id v42 = *(void **)(*((void *)&v235 + 1) + 8 * v41);
        if (objc_msgSend_itemID(v42, v37, v38)) {
          goto LABEL_20;
        }
        v45 = objc_msgSend_sectionItems(v42, v43, v44);
        uint64_t v48 = objc_msgSend_count(v45, v46, v47);

        if (v48)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v51 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v241 = v42;
            _os_log_error_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_ERROR, "setting up a package section? %@", buf, 0xCu);
          }
        }
        if (objc_msgSend_shouldReadAssetContentUsingClientProxy(v42, v49, v50))
        {
          v54 = objc_msgSend_MMCSEngineContext(v8, v52, v53);
          uint64_t AvailableItemID = objc_msgSend_nextAvailableItemID(v54, v55, v56);
          objc_msgSend_setItemID_(v42, v58, AvailableItemID);

LABEL_20:
          objc_msgSend_addObject_(v21, v43, (uint64_t)v42);
          goto LABEL_21;
        }
        v59 = [CKDAssetHandle alloc];
        id v61 = objc_msgSend_initWithItemID_UUID_path_(v59, v60, 0, 0, 0);
        if ((objc_msgSend_shouldReadRawEncryptedData(v42, v62, v63) & 1) == 0)
        {
          v66 = objc_msgSend_deviceID(v42, v64, v65);
          if (objc_msgSend_unsignedLongLongValue(v66, v67, v68))
          {
            uint64_t v71 = objc_msgSend_fileID(v42, v69, v70);
            uint64_t v74 = objc_msgSend_unsignedLongLongValue(v71, v72, v73);

            if (!v74)
            {
LABEL_28:
              v77 = objc_msgSend_fileURL(v42, v75, v76);
              v80 = objc_msgSend_path(v77, v78, v79);
              objc_msgSend_setPath_(v61, v81, (uint64_t)v80);
            }
            uint64_t v82 = objc_msgSend_MMCS(v227, v75, v76);
            v85 = objc_msgSend_assetCache(v82, v83, v84);
            v88 = objc_msgSend_deviceID(v42, v86, v87);
            v90 = objc_msgSend_volumeIndexForDeviceID_(v85, v89, (uint64_t)v88);
            objc_msgSend_setVolumeIndex_(v61, v91, (uint64_t)v90);

            v94 = objc_msgSend_fileID(v42, v92, v93);
            objc_msgSend_setFileID_(v61, v95, (uint64_t)v94);

            v98 = objc_msgSend_generationID(v42, v96, v97);
            objc_msgSend_setGenerationID_(v61, v99, (uint64_t)v98);

            v102 = objc_msgSend_signature(v42, v100, v101);
            objc_msgSend_setFileSignature_(v61, v103, (uint64_t)v102);

            uint64_t v104 = (void *)MEMORY[0x1E4F1C9C8];
            v107 = objc_msgSend_modTimeInSeconds(v42, v105, v106);
            objc_msgSend_doubleValue(v107, v108, v109);
            uint64_t v112 = objc_msgSend_dateWithTimeIntervalSince1970_(v104, v110, v111);
            objc_msgSend_setModTime_(v61, v113, (uint64_t)v112);

            id v8 = v226;
            goto LABEL_30;
          }

          goto LABEL_28;
        }
LABEL_30:
        v114 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v115 = objc_msgSend_fileSize(v42, v64, v65);
        v117 = objc_msgSend_numberWithUnsignedLongLong_(v114, v116, v115);
        objc_msgSend_setFileSize_(v61, v118, (uint64_t)v117);

        v121 = objc_msgSend_fileSignature(v61, v119, v120);

        if (v121)
        {
          v124 = objc_msgSend_fileSignature(v61, v122, v123);
          v127 = objc_msgSend_zeroSizeFileSignature(CKDMMCS, v125, v126);
          int isEqualToData = objc_msgSend_isEqualToData_(v124, v128, (uint64_t)v127);

          if ((isEqualToData & 1) != 0
            || (objc_msgSend_fileSize(v61, v122, v123),
                v130 = objc_claimAutoreleasedReturnValue(),
                uint64_t v133 = objc_msgSend_unsignedLongLongValue(v130, v131, v132),
                v130,
                !v133))
          {
            v134 = (void *)MEMORY[0x1E4F1A3B8];
            v135 = objc_msgSend_fileSignature(v61, v122, v123);
            LODWORD(v134) = objc_msgSend_isValidV2Signature_(v134, v136, (uint64_t)v135);

            if (((v134 | isEqualToData) & 1) == 0) {
              __assert_rtn("-[CKDMMCSItemGroupContext _setupPutMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 356, "isZeroFileSignature && \"Expected zeroSizeFileSignature\"");
            }
            uint64_t v139 = objc_msgSend_fileSize(v61, v137, v138);
            if (objc_msgSend_unsignedLongLongValue(v139, v140, v141)) {
              __assert_rtn("-[CKDMMCSItemGroupContext _setupPutMMCSItemsWithError:]", "CKDMMCSItemGroupContext.m", 358, "assetHandle.fileSize.unsignedLongLongValue == 0 && \"assetHandle.fileSize.unsignedLongLongValue == 0\"");
            }

            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v142 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v241 = v42;
              _os_log_debug_impl(&dword_1C4CFF000, v142, OS_LOG_TYPE_DEBUG, "Zero-length asset with itemID %@", buf, 0xCu);
            }
          }
        }
        v143 = objc_msgSend_boundaryKey(v42, v122, v123);
        objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_(v61, v144, (uint64_t)v143);

        uint64_t v24 = v230;
        objc_msgSend_addObject_(v230, v145, (uint64_t)v61);
        objc_msgSend_addObject_(v229, v146, (uint64_t)v42);

        uint64_t v34 = v228;
LABEL_21:
        ++v41;
      }
      while (v39 != v41);
      uint64_t v147 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v235, v242, 16);
      uint64_t v39 = v147;
    }
    while (v147);
  }

  if (!objc_msgSend_count(v24, v148, v149)
    || (objc_msgSend_assetCache(v8, v150, v151),
        v152 = objc_claimAutoreleasedReturnValue(),
        uint64_t v155 = objc_msgSend_mmcsOperationType(v227, v153, v154),
        int started = objc_msgSend_startTrackingRegisterOrPutAssetHandles_operationType_error_(v152, v156, (uint64_t)v24, v155, v225), v152, started))
  {
    long long v233 = 0u;
    long long v234 = 0u;
    long long v231 = 0u;
    long long v232 = 0u;
    id v158 = v229;
    uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v159, (uint64_t)&v231, v239, 16);
    if (v160)
    {
      uint64_t v162 = v160;
      uint64_t v163 = 0;
      uint64_t v164 = *(void *)v232;
      do
      {
        for (uint64_t i = 0; i != v162; ++i)
        {
          if (*(void *)v232 != v164) {
            objc_enumerationMutation(v158);
          }
          v166 = *(void **)(*((void *)&v231 + 1) + 8 * i);
          v167 = objc_msgSend_objectAtIndexedSubscript_(v230, v161, v163 + i);
          v170 = objc_msgSend_itemID(v167, v168, v169);
          uint64_t v173 = objc_msgSend_unsignedLongLongValue(v170, v171, v172);
          objc_msgSend_setItemID_(v166, v174, v173);

          v179 = objc_msgSend_status(v167, v175, v176);
          if (v179)
          {
            v180 = objc_msgSend_status(v167, v177, v178);
            BOOL v183 = objc_msgSend_unsignedIntegerValue(v180, v181, v182) == 2;
            objc_msgSend_setIsAlreadyRegistered_(v166, v184, v183);
          }
          else
          {
            objc_msgSend_setIsAlreadyRegistered_(v166, v177, 0);
          }

          if (objc_msgSend_isAlreadyRegistered(v166, v185, v186))
          {
            uint64_t v189 = objc_msgSend_fileSize(v167, v187, v188);
            uint64_t v192 = objc_msgSend_unsignedLongLongValue(v189, v190, v191);
            objc_msgSend_setFileSize_(v166, v193, v192);

            uint64_t v196 = objc_msgSend_fileSignature(v167, v194, v195);
            objc_msgSend_setSignature_(v166, v197, (uint64_t)v196);

            v200 = objc_msgSend_chunkCount(v167, v198, v199);
            uint64_t v203 = objc_msgSend_unsignedIntValue(v200, v201, v202);
            objc_msgSend_setChunkCount_(v166, v204, v203);

            v207 = objc_msgSend_signature(v166, v205, v206);
            v210 = objc_msgSend_asset(v166, v208, v209);
            objc_msgSend_setSignature_(v210, v211, (uint64_t)v207);

            uint64_t v214 = objc_msgSend_fileSize(v166, v212, v213);
            uint64_t v217 = objc_msgSend_asset(v166, v215, v216);
            objc_msgSend_setSize_(v217, v218, v214);
          }
          objc_msgSend_addObject_(v21, v187, (uint64_t)v166);
        }
        uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v161, (uint64_t)&v231, v239, 16);
        v163 += i;
      }
      while (v162);
    }

    objc_msgSend__startTrackingMMCSItems_(v227, v219, (uint64_t)v21);
    LOBYTE(started) = 1;
    id v8 = v226;
    uint64_t v24 = v230;
  }

  return started;
}

- (BOOL)_setupGetMMCSItemsWithError:(id *)a3
{
  uint64_t v260 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_MMCS(self, a2, (uint64_t)a3);
  id v9 = objc_msgSend_itemGroup(self, v7, v8);
  id v12 = objc_msgSend_items(v9, v10, v11);
  uint64_t v15 = objc_msgSend_count(v12, v13, v14);

  if (objc_msgSend_shouldFetchAssetContentInMemory(self, v16, v17))
  {
    id v20 = objc_msgSend_itemGroup(self, v18, v19);
    id v23 = objc_msgSend_items(v20, v21, v22);
    uint64_t v26 = objc_msgSend_copy(v23, v24, v25);

    long long v253 = 0u;
    long long v254 = 0u;
    long long v251 = 0u;
    long long v252 = 0u;
    v29 = objc_msgSend_itemGroup(self, v27, v28);
    long long v32 = objc_msgSend_items(v29, v30, v31);

    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v251, v259, 16);
    if (v34)
    {
      uint64_t v37 = v34;
      uint64_t v38 = *(void *)v252;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v252 != v38) {
            objc_enumerationMutation(v32);
          }
          uint64_t v40 = *(void **)(*((void *)&v251 + 1) + 8 * i);
          if (!objc_msgSend_itemID(v40, v35, v36))
          {
            uint64_t v41 = objc_msgSend_MMCSEngineContext(v6, v35, v36);
            uint64_t AvailableItemID = objc_msgSend_nextAvailableItemID(v41, v42, v43);
            objc_msgSend_setItemID_(v40, v45, AvailableItemID);
          }
        }
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v251, v259, 16);
      }
      while (v37);
    }

    id v46 = (id)v26;
    objc_msgSend__startTrackingMMCSItems_(self, v47, v26);
    LOBYTE(AssetHandles_operationType_error) = 1;
    goto LABEL_57;
  }
  if (!v6)
  {
    long long v232 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v232, v233, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 408, @"Expected non-nil MMCS engine wrapper for %@", self);
  }
  long long v236 = a3;
  uint64_t v49 = objc_msgSend_assetCache(v6, v18, v19);

  if (!v49)
  {
    long long v234 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v50, v51);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v234, v235, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 409, @"Expected non-nil asset cache for %@", v6);
  }
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v52 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v54 = objc_msgSend_initWithCapacity_(v52, v53, v15);
  id v55 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v242 = objc_msgSend_initWithCapacity_(v55, v56, v15);
  long long v247 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  uint64_t v239 = self;
  v59 = objc_msgSend_itemGroup(self, v57, v58);
  v62 = objc_msgSend_items(v59, v60, v61);

  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v247, v258, 16);
  id v237 = v46;
  long long v238 = v6;
  if (v64)
  {
    uint64_t v67 = v64;
    uint64_t v68 = *(void *)v248;
    id obj = v62;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v248 != v68) {
          objc_enumerationMutation(v62);
        }
        uint64_t v70 = *(void **)(*((void *)&v247 + 1) + 8 * v69);
        if (objc_msgSend_itemID(v70, v65, v66)) {
          goto LABEL_24;
        }
        uint64_t v73 = objc_msgSend_constructedAssetDownloadURL(v70, v71, v72);

        if (v73)
        {
          uint64_t v76 = objc_msgSend_MMCSEngineContext(v6, v74, v75);
          uint64_t v79 = objc_msgSend_nextAvailableItemID(v76, v77, v78);
          objc_msgSend_setItemID_(v70, v80, v79);

          uint64_t v83 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v81, v82);
          v86 = objc_msgSend_UUIDString(v83, v84, v85);
          objc_msgSend_setTrackingUUID_(v70, v87, (uint64_t)v86);

LABEL_24:
          objc_msgSend_addObject_(v54, v71, (uint64_t)v70);
          goto LABEL_25;
        }
        v88 = objc_msgSend_sectionItems(v70, v74, v75);
        uint64_t v91 = objc_msgSend_count(v88, v89, v90);

        if (v91)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v92 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v257 = v70;
            _os_log_error_impl(&dword_1C4CFF000, v92, OS_LOG_TYPE_ERROR, "setting up a package section? %@", buf, 0xCu);
          }
        }
        uint64_t v93 = [CKDAssetHandle alloc];
        v95 = objc_msgSend_initWithItemID_UUID_path_(v93, v94, 0, 0, 0);
        if ((objc_msgSend_shouldReadRawEncryptedData(v70, v96, v97) & 1) == 0)
        {
          uint64_t v100 = objc_msgSend_deviceID(v70, v98, v99);
          if (objc_msgSend_unsignedLongLongValue(v100, v101, v102))
          {
            v105 = objc_msgSend_fileID(v70, v103, v104);
            uint64_t v108 = objc_msgSend_unsignedLongLongValue(v105, v106, v107);

            if (!v108)
            {
LABEL_37:
              uint64_t v111 = objc_msgSend_fileURL(v70, v109, v110);
              v114 = objc_msgSend_path(v111, v112, v113);
              objc_msgSend_setPath_(v95, v115, (uint64_t)v114);
            }
            v116 = objc_msgSend_MMCS(v239, v109, v110);
            v119 = objc_msgSend_assetCache(v116, v117, v118);
            v122 = objc_msgSend_deviceID(v70, v120, v121);
            v124 = objc_msgSend_volumeIndexForDeviceID_(v119, v123, (uint64_t)v122);
            objc_msgSend_setVolumeIndex_(v95, v125, (uint64_t)v124);

            uint64_t v128 = objc_msgSend_fileID(v70, v126, v127);
            objc_msgSend_setFileID_(v95, v129, (uint64_t)v128);

            uint64_t v132 = objc_msgSend_generationID(v70, v130, v131);
            objc_msgSend_setGenerationID_(v95, v133, (uint64_t)v132);

            uint64_t v136 = objc_msgSend_signature(v70, v134, v135);
            objc_msgSend_setFileSignature_(v95, v137, (uint64_t)v136);

            uint64_t v138 = (void *)MEMORY[0x1E4F1C9C8];
            uint64_t v141 = objc_msgSend_modTimeInSeconds(v70, v139, v140);
            objc_msgSend_doubleValue(v141, v142, v143);
            v146 = objc_msgSend_dateWithTimeIntervalSince1970_(v138, v144, v145);
            objc_msgSend_setModTime_(v95, v147, (uint64_t)v146);

            id v46 = v237;
            uint64_t v6 = v238;
            goto LABEL_39;
          }

          goto LABEL_37;
        }
LABEL_39:
        v148 = objc_msgSend_boundaryKey(v70, v98, v99);
        objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_(v95, v149, (uint64_t)v148);

        objc_msgSend_addObject_(v242, v150, (uint64_t)v95);
        objc_msgSend_addObject_(v46, v151, (uint64_t)v70);

        v62 = obj;
LABEL_25:
        ++v69;
      }
      while (v67 != v69);
      uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v247, v258, 16);
      uint64_t v67 = v152;
    }
    while (v152);
  }

  v153 = v242;
  if (!objc_msgSend_count(v242, v154, v155)
    || (objc_msgSend_assetCache(v6, v156, v157),
        id v158 = objc_claimAutoreleasedReturnValue(),
        uint64_t v161 = objc_msgSend_mmcsOperationType(v239, v159, v160),
        int AssetHandles_operationType_error = objc_msgSend_startTrackingGetAssetHandles_operationType_error_(v158, v162, (uint64_t)v242, v161, v236), v158, AssetHandles_operationType_error))
  {
    long long v245 = 0u;
    long long v246 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    id obja = v46;
    uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v163, (uint64_t)&v243, v255, 16);
    if (v164)
    {
      uint64_t v166 = v164;
      uint64_t v167 = 0;
      uint64_t v168 = *(void *)v244;
      do
      {
        for (uint64_t j = 0; j != v166; ++j)
        {
          if (*(void *)v244 != v168) {
            objc_enumerationMutation(obja);
          }
          v170 = *(void **)(*((void *)&v243 + 1) + 8 * j);
          v171 = objc_msgSend_objectAtIndexedSubscript_(v153, v165, v167 + j);
          uint64_t v174 = objc_msgSend_UUID(v171, v172, v173);
          v177 = objc_msgSend_UUIDString(v174, v175, v176);
          objc_msgSend_setTrackingUUID_(v170, v178, (uint64_t)v177);

          v181 = objc_msgSend_itemID(v171, v179, v180);
          uint64_t v184 = objc_msgSend_unsignedLongLongValue(v181, v182, v183);
          objc_msgSend_setItemID_(v170, v185, v184);

          v190 = objc_msgSend_status(v171, v186, v187);
          if (v190)
          {
            uint64_t v191 = objc_msgSend_status(v171, v188, v189);
            BOOL v194 = objc_msgSend_unsignedIntegerValue(v191, v192, v193) == 2;
            objc_msgSend_setIsAlreadyRegistered_(v170, v195, v194);
          }
          else
          {
            objc_msgSend_setIsAlreadyRegistered_(v170, v188, 0);
          }

          if (objc_msgSend_isAlreadyRegistered(v170, v196, v197))
          {
            v200 = objc_msgSend_fileSize(v171, v198, v199);
            uint64_t v203 = objc_msgSend_unsignedLongLongValue(v200, v201, v202);
            objc_msgSend_setFileSize_(v170, v204, v203);

            v207 = objc_msgSend_fileSignature(v171, v205, v206);
            objc_msgSend_setSignature_(v170, v208, (uint64_t)v207);

            v211 = objc_msgSend_chunkCount(v171, v209, v210);
            uint64_t v214 = objc_msgSend_unsignedIntValue(v211, v212, v213);
            objc_msgSend_setChunkCount_(v170, v215, v214);

            uint64_t v218 = objc_msgSend_signature(v170, v216, v217);
            id v221 = objc_msgSend_asset(v170, v219, v220);
            objc_msgSend_setSignature_(v221, v222, (uint64_t)v218);

            uint64_t v225 = objc_msgSend_fileSize(v170, v223, v224);
            v228 = objc_msgSend_asset(v170, v226, v227);
            objc_msgSend_setSize_(v228, v229, v225);
          }
          objc_msgSend_addObject_(v54, v198, (uint64_t)v170);

          v153 = v242;
        }
        uint64_t v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v165, (uint64_t)&v243, v255, 16);
        v167 += j;
      }
      while (v166);
    }

    objc_msgSend__startTrackingMMCSItems_(v239, v230, (uint64_t)v54);
    LOBYTE(AssetHandles_operationType_error) = 1;
    id v46 = v237;
    uint64_t v6 = v238;
  }

LABEL_57:
  return AssetHandles_operationType_error;
}

- (BOOL)_setupMMCSItemsWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_MMCS(self, a2, (uint64_t)a3);
  if (!v7)
  {
    id v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 475, @"Expected non-nil MMCS engine wrapper for %@", self);
  }
  uint64_t v8 = objc_msgSend_assetCache(v7, v5, v6);

  if (!v8)
  {
    uint64_t v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 476, @"Expected non-nil asset cache for %@", v7);
  }
  unint64_t v11 = objc_msgSend_mmcsOperationType(self, v9, v10);
  if (v11 <= 6)
  {
    if (((1 << v11) & 0xA) != 0)
    {
      uint64_t v25 = 0;
      char MMCSItemsWithError = objc_msgSend__setupPutMMCSItemsWithError_(self, v12, (uint64_t)&v25);
      uint64_t v14 = v25;
      goto LABEL_12;
    }
    if (((1 << v11) & 0x14) != 0)
    {
      uint64_t v24 = 0;
      char MMCSItemsWithError = objc_msgSend__setupGetMMCSItemsWithError_(self, v12, (uint64_t)&v24);
      uint64_t v14 = v24;
      goto LABEL_12;
    }
    if (((1 << v11) & 0x60) != 0)
    {
      uint64_t v26 = 0;
      char MMCSItemsWithError = objc_msgSend__setupRegisterMMCSItemsWithError_(self, v12, (uint64_t)&v26);
      uint64_t v14 = v26;
LABEL_12:

      goto LABEL_13;
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v16 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = v16;
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = objc_msgSend_mmcsOperationType(self, v18, v19);
    _os_log_error_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_ERROR, "Invalid mmcs operation type %ld", buf, 0xCu);
  }
  char MMCSItemsWithError = 1;
LABEL_13:

  return MMCSItemsWithError;
}

- (void)_cleanupMMCSRegisterItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend_itemGroup(self, a2, v2, 0);
  uint64_t v6 = objc_msgSend_items(v3, v4, v5);

  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_setIsAlreadyRegistered_(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v9, 0);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v13, v17, 16);
    }
    while (v10);
  }
}

- (void)_cleanupMMCSItems
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_MMCS(self, a2, v2);
  if (!v7)
  {
    uint64_t v73 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v73, v74, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 509, @"Expected non-nil MMCS engine wrapper for %@", self);
  }
  uint64_t v8 = objc_msgSend_assetCache(v7, v5, v6);

  if (!v8)
  {
    uint64_t v75 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v75, v76, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 510, @"Expected non-nil asset cache for %@", v7);
  }
  unint64_t v11 = objc_msgSend_mmcsOperationType(self, v9, v10);
  if (v11 > 6) {
    goto LABEL_29;
  }
  if (((1 << v11) & 0xA) == 0)
  {
    if (((1 << v11) & 0x14) != 0)
    {
      if (!objc_msgSend_shouldFetchAssetContentInMemory(self, v12, v13)) {
        goto LABEL_32;
      }
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v48 = objc_msgSend_itemGroup(self, v14, v15);
      uint64_t v51 = objc_msgSend_items(v48, v49, v50);

      uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v78, v89, 16);
      if (v53)
      {
        uint64_t v56 = v53;
        uint64_t v57 = *(void *)v79;
        do
        {
          for (uint64_t i = 0; i != v56; ++i)
          {
            if (*(void *)v79 != v57) {
              objc_enumerationMutation(v51);
            }
            v59 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            v60 = objc_msgSend_MMCSEngineContext(v7, v54, v55);
            uint64_t v63 = objc_msgSend_itemID(v59, v61, v62);
            objc_msgSend_stopTrackingItemID_(v60, v64, v63);
          }
          uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v78, v89, 16);
        }
        while (v56);
      }
      goto LABEL_28;
    }
    if (((1 << v11) & 0x60) != 0)
    {
      objc_msgSend__cleanupMMCSRegisterItems(self, v12, v13);
      goto LABEL_32;
    }
LABEL_29:
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v65 = (void *)*MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v51 = v65;
    *(_DWORD *)buf = 134217984;
    uint64_t v88 = objc_msgSend_mmcsOperationType(self, v71, v72);
    _os_log_error_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_ERROR, "Invalid mmcs operation type %ld", buf, 0xCu);
LABEL_28:

    goto LABEL_32;
  }
  long long v16 = objc_msgSend_assetCache(v7, v12, v13);
  uint64_t v19 = objc_msgSend_itemGroup(self, v17, v18);
  uint64_t v22 = objc_msgSend_items(v19, v20, v21);
  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v23, v24);
  id v86 = 0;
  objc_msgSend_updateAssetHandlesForPutMMCSItems_cloneItems_error_(v16, v26, (uint64_t)v22, shouldCloneFileInAssetCache, &v86);
  id v77 = v86;

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v29 = objc_msgSend_itemGroup(self, v27, v28);
  long long v32 = objc_msgSend_items(v29, v30, v31);

  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v82, v91, 16);
  if (v34)
  {
    uint64_t v37 = v34;
    uint64_t v38 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v83 != v38) {
          objc_enumerationMutation(v32);
        }
        uint64_t v40 = *(void **)(*((void *)&v82 + 1) + 8 * j);
        if (objc_msgSend_shouldReadAssetContentUsingClientProxy(v40, v35, v36))
        {
          uint64_t v41 = (void *)MEMORY[0x1E4F28ED0];
          uint64_t v42 = objc_msgSend_itemID(v40, v35, v36);
          uint64_t v44 = objc_msgSend_numberWithUnsignedLongLong_(v41, v43, v42);
          uint64_t v90 = v44;
          id v46 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v45, (uint64_t)&v90, 1);
          objc_msgSend_unregisterItemIDs_(v7, v47, (uint64_t)v46);
        }
      }
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v82, v91, 16);
    }
    while (v37);
  }

LABEL_32:
  uint64_t v66 = objc_msgSend_itemGroup(self, v14, v15);
  uint64_t v69 = objc_msgSend_items(v66, v67, v68);
  objc_msgSend__stopTrackingMMCSItems_(self, v70, (uint64_t)v69);
}

- (void)didCompleteRequestWithError:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  id v9 = objc_msgSend_itemGroup(self, v7, v8);
  int v12 = objc_msgSend_complete(v9, v10, v11);

  if (v12)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = self;
      _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "The group is already complete: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v16 = objc_msgSend_itemGroup(self, v13, v14);
    objc_msgSend_setComplete_(v16, v17, 1);

    if (v4)
    {
      id v20 = objc_msgSend_itemGroup(self, v18, v19);
      objc_msgSend_setError_(v20, v21, (uint64_t)v4);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v22 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        id v23 = v22;
        objc_msgSend_itemGroup(self, v24, v25);
        uint64_t v26 = (CKDMMCSItemGroupContext *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v60 = v26;
        __int16 v61 = 2112;
        id v62 = v4;
        _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Completed MMCS item group %@ with error: %@", buf, 0x16u);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v27 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v48 = v27;
        objc_msgSend_itemGroup(self, v49, v50);
        uint64_t v51 = (CKDMMCSItemGroupContext *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v60 = v51;
        _os_log_debug_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_DEBUG, "Completed MMCS item group %@", buf, 0xCu);
      }
    }
    uint64_t v28 = self;
    objc_sync_enter(v28);
    objc_msgSend_progressBlock(v28, v29, v30);
    uint64_t v31 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProgressBlock_(v28, v32, 0);
    objc_sync_exit(v28);

    if (v4)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v35 = objc_msgSend_itemGroup(v28, v33, v34);
      uint64_t v38 = objc_msgSend_items(v35, v36, v37);

      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v54, v58, 16);
      if (v42)
      {
        uint64_t v43 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v55 != v43) {
              objc_enumerationMutation(v38);
            }
            v45 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            if ((objc_msgSend_finished(v45, v40, v41) & 1) == 0)
            {
              objc_msgSend_setError_(v45, v40, (uint64_t)v4);
              objc_msgSend_setFinished_(v45, v46, 1);
              if (v31) {
                ((void (**)(void, void *))v31)[2](v31, v45);
              }
            }
          }
          uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v54, v58, 16);
        }
        while (v42);
      }
    }
    objc_msgSend__cleanupMMCSItems(v28, v33, v34);
    uint64_t v47 = CKGetGlobalQueue();
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = sub_1C4F26C78;
    v52[3] = &unk_1E64F0948;
    v52[4] = v28;
    id v53 = v4;
    dispatch_async(v47, v52);
  }
}

- (void)updateProgressForItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 results:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v13 = objc_msgSend_findTrackedMMCSItemByItemID_(self, v11, a3);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x1E4F739D8]);
    long long v16 = objc_msgSend_objectForKeyedSubscript_(v10, v15, *MEMORY[0x1E4F737D8]);
    id v20 = objc_msgSend_objectForKeyedSubscript_(v10, v17, *MEMORY[0x1E4F73838]);
    if (v16)
    {
      uint64_t v21 = objc_msgSend_unsignedIntValue(v16, v18, v19);
      objc_msgSend_setChunkCount_(v13, v22, v21);
    }
    id v23 = (void *)MEMORY[0x1E4F1A550];
    if (v20)
    {
      if (objc_msgSend_unsignedLongLongValue(v20, v18, v19))
      {
        uint64_t v26 = objc_msgSend_unsignedLongLongValue(v20, v24, v25);
        objc_msgSend_setFileSize_(v13, v27, v26);
      }
      if (v16)
      {
        BOOL v28 = objc_msgSend_unsignedIntValue(v16, v24, v25) == 0;
        if (v28 != (objc_msgSend_unsignedLongLongValue(v20, v29, v30) == 0))
        {
          if (*v23 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v31 = *MEMORY[0x1E4F1A500];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            if (!v14)
            {
LABEL_26:
              long long v35 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
              {
                int v41 = 134218496;
                unint64_t v42 = a3;
                __int16 v43 = 1024;
                *(_DWORD *)uint64_t v44 = a4;
                *(_WORD *)&v44[4] = 2048;
                *(double *)&v44[6] = a5;
                _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Progress of MMCS item %llu: s:%d p:%0.4f", (uint8_t *)&v41, 0x1Cu);
              }
              if (a5 >= 0.0)
              {
                objc_msgSend_setProgress_(v13, v36, v37, a5);
                objc_msgSend_progressBlock(self, v38, v39);
                uint64_t v40 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
                ((void (**)(void, void *))v40)[2](v40, v13);
              }
LABEL_30:

              goto LABEL_31;
            }
            goto LABEL_22;
          }
          int v41 = 138543618;
          unint64_t v42 = (unint64_t)v16;
          __int16 v43 = 2114;
          *(void *)uint64_t v44 = v20;
          _os_log_error_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_ERROR, "Chunk count %{public}@ and file size %{public}@ inconsistent", (uint8_t *)&v41, 0x16u);
        }
      }
    }
    uint64_t v33 = (void *)*MEMORY[0x1E4F1A548];
    if (!v14)
    {
      if (*v23 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v33);
      }
      goto LABEL_26;
    }
    if (*v23 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v33);
    }
LABEL_22:
    uint64_t v34 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v41 = 134218754;
      unint64_t v42 = a3;
      __int16 v43 = 1024;
      *(_DWORD *)uint64_t v44 = a4;
      *(_WORD *)&v44[4] = 2048;
      *(double *)&v44[6] = a5;
      __int16 v45 = 2112;
      id v46 = v14;
      _os_log_error_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_ERROR, "Progress of MMCS item %llu: s:%d p:%0.4f error:%@", (uint8_t *)&v41, 0x26u);
    }
    goto LABEL_30;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  long long v32 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    int v41 = 134217984;
    unint64_t v42 = a3;
    _os_log_error_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_ERROR, "Can't find MMCS item for itemID %llu", (uint8_t *)&v41, 0xCu);
  }
LABEL_31:
}

- (void)updateProgressForPackageSectionState:(int)a3 progress:(double)a4 results:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v11 = objc_msgSend_MMCSPackageSectionItem(self, v9, v10);
  if (!v11) {
    __assert_rtn("-[CKDMMCSItemGroupContext updateProgressForPackageSectionState:progress:results:]", "CKDMMCSItemGroupContext.m", 626, "item && \"nil self.MMCSPackageSectionItem\"");
  }
  uint64_t v13 = (void *)v11;
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v8, v12, *MEMORY[0x1E4F739D8]);
  uint64_t v15 = (void *)*MEMORY[0x1E4F1A548];
  if (v14)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v15);
    }
    long long v16 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v16;
      id v20 = objc_msgSend_putPackageSectionIdentifier(v13, v18, v19);
      int v31 = 138544130;
      long long v32 = v20;
      __int16 v33 = 1024;
      int v34 = a3;
      __int16 v35 = 2048;
      double v36 = a4;
      __int16 v37 = 2112;
      uint64_t v38 = v14;
      _os_log_error_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_ERROR, "Progress of MMCS package section %{public}@: s:%d p:%0.2f error:%@", (uint8_t *)&v31, 0x26u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v15);
    }
    uint64_t v21 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = v21;
      uint64_t v30 = objc_msgSend_putPackageSectionIdentifier(v13, v28, v29);
      int v31 = 138543874;
      long long v32 = v30;
      __int16 v33 = 1024;
      int v34 = a3;
      __int16 v35 = 2048;
      double v36 = a4;
      _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Progress of MMCS package section %{public}@: s:%d p:%0.2f", (uint8_t *)&v31, 0x1Cu);
    }
    if (a4 >= 0.0)
    {
      objc_msgSend_setProgress_(v13, v22, v23, a4);
      objc_msgSend_progressBlock(self, v24, v25);
      uint64_t v26 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v26)[2](v26, v13);
    }
  }
}

- (void)updateProgressForItemID:(unint64_t)a3 state:(int)a4 progress:(double)a5 error:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  int v12 = objc_msgSend_findTrackedMMCSItemByItemID_(self, v11, a3);
  if (v12)
  {
    uint64_t v13 = (void *)*MEMORY[0x1E4F1A548];
    if (v10)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v13);
      }
      uint64_t v14 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        int v25 = 134218754;
        unint64_t v26 = a3;
        __int16 v27 = 1024;
        int v28 = a4;
        __int16 v29 = 2048;
        double v30 = a5;
        __int16 v31 = 2112;
        id v32 = v10;
        uint64_t v15 = "Progress of MMCS item %llu: s:%d p:%0.4f error:%@";
        long long v16 = v14;
        uint32_t v17 = 38;
LABEL_11:
        _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v25, v17);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v13);
      }
      uint64_t v19 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        int v25 = 134218496;
        unint64_t v26 = a3;
        __int16 v27 = 1024;
        int v28 = a4;
        __int16 v29 = 2048;
        double v30 = a5;
        _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Progress of MMCS item %llu: s:%d p:%0.4f", (uint8_t *)&v25, 0x1Cu);
      }
      if (a5 >= 0.0)
      {
        objc_msgSend_setProgress_(v12, v20, v21, a5);
        objc_msgSend_progressBlock(self, v22, v23);
        uint64_t v24 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void *))v24)[2](v24, v12);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v25 = 134217984;
      unint64_t v26 = a3;
      uint64_t v15 = "Can't find MMCS item for itemID %llu";
      long long v16 = v18;
      uint32_t v17 = 12;
      goto LABEL_11;
    }
  }
}

- (void)handleCommand:(id)a3 forItem:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_commandBlock(self, v7, v8);

  if (v9)
  {
    objc_msgSend_commandBlock(self, v10, v11);
    int v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id))v12)[2](v12, v6, v13);
  }
}

- (void)didGetItemID:(unint64_t)a3 signature:(id)a4 path:(id)a5 error:(id)a6 results:(id)a7
{
  uint64_t v278 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = (void *)MEMORY[0x1C8789E70]();
  uint64_t v19 = objc_msgSend_operation(self, v17, v18);
  uint64_t v22 = objc_msgSend_findTrackedMMCSItemByItemID_(self, v20, a3);
  if (v22)
  {
    uint64_t v262 = v16;
    id v263 = v12;
    id v23 = v13;
    uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v15, v21, *MEMORY[0x1E4F73838]);
    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v15, v25, *MEMORY[0x1E4F73890]);
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v15, v27, *MEMORY[0x1E4F739F0]);
    id v260 = v15;
    uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v15, v29, *MEMORY[0x1E4F737D8]);
    uint64_t v265 = v19;
    uint64_t v33 = objc_msgSend_operationInfo(v19, v31, v32);
    char v36 = objc_msgSend_fetchingAssetsForRereference(v33, v34, v35);

    v264 = (void *)v24;
    id v261 = v14;
    if (v14)
    {
      uint64_t v39 = objc_msgSend_mmcsOperationType(self, v37, v38);
      uint64_t v41 = objc_msgSend__errorWithMMCSError_description_operationType_(CKDMMCS, v40, (uint64_t)v14, @"Fetching asset failed", v39);
LABEL_18:
      long long v54 = (void *)v41;
      __int16 v45 = (void *)v26;
LABEL_19:
      id v13 = v23;
LABEL_20:
      uint64_t v48 = (void *)v28;
      objc_msgSend_setError_(v22, v42, (uint64_t)v54);

      id v53 = (void *)v30;
LABEL_21:
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v15 = v260;
      id v14 = v261;
      long long v55 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        v95 = v55;
        v98 = objc_msgSend_error(v22, v96, v97);
        *(_DWORD *)buf = 138412546;
        unint64_t v275 = (unint64_t)v22;
        __int16 v276 = 2112;
        uint64_t v277 = v98;
        _os_log_error_impl(&dword_1C4CFF000, v95, OS_LOG_TYPE_ERROR, "Error completing MMCS item %@ : %@", buf, 0x16u);
      }
      objc_msgSend_setDownloadLooksOkay_(v22, v56, 0);
      v59 = objc_msgSend_error(v22, v57, v58);

      if (!v59)
      {
        id v62 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v60, *MEMORY[0x1E4F19DD8], 1000, 0, @"Unknown error completing item %@", v22);
        objc_msgSend_setError_(v22, v63, (uint64_t)v62);
      }
      uint64_t v64 = objc_msgSend_fileURL(v22, v60, v61);

      if (v64)
      {
        uint64_t v67 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v65, v66);
        uint64_t v70 = objc_msgSend_fileURL(v22, v68, v69);
        objc_msgSend_removeItemAtURL_error_(v67, v71, (uint64_t)v70, 0);

        objc_msgSend_setFileURL_(v22, v72, 0);
      }
      objc_msgSend_setFileHandle_(v22, v65, 0);
      objc_msgSend_setDeviceID_(v22, v73, 0);
      objc_msgSend_setFileID_(v22, v74, 0);
      objc_msgSend_setGenerationID_(v22, v75, 0);
      objc_msgSend_setModTimeInSeconds_(v22, v76, 0);
      objc_msgSend_setFileSize_(v22, v77, 0);
LABEL_30:
      objc_msgSend_setProgress_(v22, v78, v79, 1.0);
      objc_msgSend_setFinished_(v22, v80, 1);
      objc_msgSend_setWriter_(v22, v81, 0);
      if ((objc_msgSend_shouldFetchAssetContentInMemory(self, v82, v83) & 1) == 0)
      {
        id v86 = objc_msgSend_constructedAssetDownloadURL(v22, v84, v85);

        if (!v86)
        {
          uint64_t v87 = objc_msgSend_assetCache(self->_MMCS, v84, v85);
          v273 = v22;
          v89 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v88, (uint64_t)&v273, 1);
          uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v90, v91);
          objc_msgSend_updateAssetHandlesForGetMMCSItems_cloneItems_error_(v87, v93, (uint64_t)v89, shouldCloneFileInAssetCache, 0);
        }
      }
      objc_msgSend_progressBlock(self, v84, v85);
      v94 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v94)[2](v94, v22);

      long long v16 = v262;
      id v12 = v263;
      uint64_t v19 = v265;
      goto LABEL_34;
    }
    if (v24) {
      char v44 = 1;
    }
    else {
      char v44 = v36;
    }
    if ((v44 & 1) == 0)
    {
      uint64_t v41 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v37, *MEMORY[0x1E4F19DD8], 1000, 0, @"fileSize not set.");
      goto LABEL_18;
    }
    __int16 v45 = (void *)v26;
    if (!v26)
    {
      long long v54 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v37, *MEMORY[0x1E4F19DD8], 1000, 0, @"paddedFileSize not set.");
      goto LABEL_19;
    }
    id v13 = v23;
    if (!v265)
    {
      long long v54 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v37, *MEMORY[0x1E4F19DD8], 1000, 0, @"CKOperation was gone on MMCS callback.");
      goto LABEL_20;
    }
    uint64_t v48 = (void *)v28;
    if (objc_msgSend_shouldFetchAssetContentInMemory(self, v37, v38))
    {
      uint64_t v49 = objc_msgSend_writer(v22, v46, v47);
      int isContiguous = objc_msgSend_isContiguous(v49, v50, v51);

      id v53 = (void *)v30;
      if (isContiguous) {
        objc_msgSend_setDownloadLooksOkay_(v22, v46, 1);
      }
      goto LABEL_72;
    }
    if (v13) {
      char v99 = 0;
    }
    else {
      char v99 = v36;
    }
    id v53 = (void *)v30;
    if (v99)
    {
LABEL_72:
      uint64_t v199 = objc_msgSend_unsignedLongLongValue(v264, v46, v47);
      objc_msgSend_setFileSize_(v22, v200, v199);
      uint64_t v203 = objc_msgSend_unsignedLongLongValue(v45, v201, v202);
      objc_msgSend_setPaddedFileSize_(v22, v204, v203);
      objc_msgSend_setVerificationKey_(v22, v205, (uint64_t)v48);
      if (v53 && objc_msgSend_unsignedIntValue(v53, v206, v207))
      {
        uint64_t v210 = objc_msgSend_unsignedIntValue(v53, v208, v209);
        objc_msgSend_setChunkCount_(v22, v211, v210);
      }
      id v15 = v260;
      id v14 = 0;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v212 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v275 = (unint64_t)v22;
        _os_log_debug_impl(&dword_1C4CFF000, v212, OS_LOG_TYPE_DEBUG, "Finished getting MMCS item %@", buf, 0xCu);
      }
      goto LABEL_30;
    }
    if (objc_msgSend_shouldFetchAssetContentUsingAssetDownloadStagingManager(self, v46, v47))
    {
      id v102 = objc_alloc(MEMORY[0x1E4F19E60]);
      v103 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v106 = objc_msgSend_itemID(v22, v104, v105);
      uint64_t v108 = objc_msgSend_numberWithUnsignedLongLong_(v103, v107, v106);
      uint64_t v111 = objc_msgSend_trackingUUID(v22, v109, v110);
      v114 = objc_msgSend_signature(v22, v112, v113);
      long long v254 = objc_msgSend_initWithItemID_trackingUUID_signature_(v102, v115, (uint64_t)v108, v111, v114);

      id v272 = 0;
      v117 = objc_msgSend_openWithOperation_error_(v22, v116, (uint64_t)v265, &v272);
      id v120 = v272;
      long long v252 = v117;
      if (v117
        && (objc_msgSend_fileHandle(v117, v118, v119),
            uint64_t v121 = objc_claimAutoreleasedReturnValue(),
            v121,
            v121)
        && !v120)
      {
        uint64_t v123 = objc_msgSend_container(v265, v118, v122);
        uint64_t v126 = objc_msgSend_fileHandle(v117, v124, v125);
        id v271 = 0;
        uint64_t v128 = objc_msgSend_getFileMetadataWithContainer_fileHandle_error_(v22, v127, (uint64_t)v123, v126, &v271);
        id v129 = v271;

        uint64_t v258 = (void *)v128;
        if (v128 && !v129)
        {
          id v269 = 0;
          id v270 = 0;
          id v268 = 0;
          char v131 = objc_msgSend_finishWithAssetDownloadStagingInfo_fileURL_fileHandle_error_(v265, v130, (uint64_t)v254, &v270, &v269, &v268);
          id v132 = v270;
          id v250 = v269;
          id v133 = v268;
          if (v133) {
            char v135 = 0;
          }
          else {
            char v135 = v131;
          }
          if (!v132) {
            char v135 = 0;
          }
          id v53 = (void *)v30;
          char v248 = v135;
          id v249 = v133;
          if (v135)
          {
            objc_msgSend_setFileURL_(v22, v134, (uint64_t)v132);
            uint64_t v136 = v250;
            objc_msgSend_setFileHandle_(v22, v137, (uint64_t)v250);
            int v138 = 0;
          }
          else
          {
            uint64_t v225 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v134, *MEMORY[0x1E4F19DD8], 1000, v133, @"Failed to finish downloaded file.");
            objc_msgSend_setError_(v22, v226, (uint64_t)v225);

            int v138 = 4;
            uint64_t v136 = v250;
          }

          id v251 = 0;
          v165 = 0;
          uint64_t v187 = v249;
          if ((v248 & 1) == 0)
          {
LABEL_71:

            if (v138) {
              goto LABEL_21;
            }
            goto LABEL_72;
          }
LABEL_58:
          uint64_t v174 = objc_msgSend_fileURL(v22, v172, v173);
          v177 = objc_msgSend_asset(v22, v175, v176);
          objc_msgSend_setFileURL_(v177, v178, (uint64_t)v174);

          v181 = objc_msgSend_fileURL(v22, v179, v180);

          if (v181)
          {
            if (!v258)
            {
              uint64_t v187 = v251;
              uint64_t v197 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v182, *MEMORY[0x1E4F19DD8], 1000, v251, @"Getting file metadata for downloaded asset failed");
              objc_msgSend_setError_(v22, v198, (uint64_t)v197);

              uint64_t v258 = 0;
              goto LABEL_70;
            }
            uint64_t v184 = objc_msgSend_constructedAssetDownloadURL(v22, v182, v183);

            if (v184)
            {
LABEL_61:
              objc_msgSend_setDownloadLooksOkay_(v22, v185, 1);
              int v138 = 0;
              uint64_t v187 = v251;
              goto LABEL_71;
            }
            uint64_t v256 = objc_msgSend_unsignedLongLongValue(v264, v185, v186);
            v215 = objc_msgSend_fileSize(v258, v213, v214);
            uint64_t v218 = objc_msgSend_unsignedLongLongValue(v215, v216, v217);

            if (v256 != v218)
            {
              v257 = (void *)MEMORY[0x1E4F1A280];
              uint64_t v227 = *MEMORY[0x1E4F19DD8];
              uint64_t v195 = objc_msgSend_fileSize(v258, v219, v220);
              uint64_t v187 = v251;
              id v229 = objc_msgSend_errorWithDomain_code_error_format_(v257, v228, v227, 1000, v251, @"File size mismatch for item %@ : %@ != %@", v22, v264, v195);
              objc_msgSend_setError_(v22, v230, (uint64_t)v229);

              goto LABEL_67;
            }
            unint64_t v221 = objc_msgSend_unsignedLongLongValue(v264, v219, v220);
            if (v221 <= objc_msgSend_unsignedLongLongValue(v45, v222, v223))
            {
              long long v231 = objc_msgSend_deviceID(v258, v182, v224);
              objc_msgSend_setDeviceID_(v22, v232, (uint64_t)v231);

              long long v235 = objc_msgSend_fileID(v258, v233, v234);
              objc_msgSend_setFileID_(v22, v236, (uint64_t)v235);

              uint64_t v239 = objc_msgSend_generationID(v258, v237, v238);
              objc_msgSend_setGenerationID_(v22, v240, (uint64_t)v239);

              long long v243 = objc_msgSend_modTimeInSeconds(v258, v241, v242);
              objc_msgSend_setModTimeInSeconds_(v22, v244, (uint64_t)v243);

              goto LABEL_61;
            }
            uint64_t v192 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v193 = *MEMORY[0x1E4F19DD8];
            long long v246 = v264;
            long long v247 = v45;
            BOOL v194 = @"File size mismatch for item %@ : %@ > %@";
            long long v245 = v22;
          }
          else
          {
            uint64_t v192 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v193 = *MEMORY[0x1E4F19DD8];
            BOOL v194 = @"Failed to set destination fileURL";
          }
          uint64_t v187 = v251;
          uint64_t v195 = objc_msgSend_errorWithDomain_code_error_format_(v192, v182, v193, 1000, v251, v194, v245, v246, v247);
          objc_msgSend_setError_(v22, v196, (uint64_t)v195);
LABEL_67:

          goto LABEL_70;
        }
        uint64_t v187 = v129;
        uint64_t v189 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v130, *MEMORY[0x1E4F19DD8], 1000, v129, @"Failed to get metadata for downloaded file.");
      }
      else
      {
        uint64_t v187 = v120;
        uint64_t v189 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v118, *MEMORY[0x1E4F19DD8], 1000, v120, @"Failed to open downloaded file.");
        uint64_t v258 = 0;
      }
      id v53 = (void *)v30;
      objc_msgSend_setError_(v22, v188, (uint64_t)v189);

      v165 = 0;
    }
    else
    {
      uint64_t v139 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v100, v101);
      uint64_t v142 = objc_msgSend_trackingUUID(v22, v140, v141);
      if (!v142) {
        __assert_rtn("-[CKDMMCSItemGroupContext didGetItemID:signature:path:error:results:]", "CKDMMCSItemGroupContext.m", 726, "item.trackingUUID && \"item.trackingUUID\"");
      }
      uint64_t v255 = (void *)v139;

      uint64_t v145 = objc_msgSend_signature(v22, v143, v144);
      if (!v145) {
        __assert_rtn("-[CKDMMCSItemGroupContext didGetItemID:signature:path:error:results:]", "CKDMMCSItemGroupContext.m", 727, "item.signature && \"item.signature\"");
      }

      id v259 = [NSString alloc];
      v148 = objc_msgSend_trackingUUID(v22, v146, v147);
      uint64_t v151 = objc_msgSend_signature(v22, v149, v150);
      uint64_t v152 = CKStringWithData();
      uint64_t v154 = objc_msgSend_initWithFormat_(v259, v153, @"%@.%@", v148, v152);

      uint64_t v157 = objc_msgSend_MMCS(self, v155, v156);
      uint64_t v160 = objc_msgSend_assetCache(v157, v158, v159);
      uint64_t v163 = objc_msgSend_fileDownloadPath(v160, v161, v162);
      long long v253 = (void *)v154;
      v165 = objc_msgSend_stringByAppendingPathComponent_(v163, v164, v154);

      id v267 = 0;
      LODWORD(v163) = objc_msgSend_moveItemAtPath_toPath_error_(v255, v166, (uint64_t)v13, v165, &v267);
      id v168 = v267;
      if (v163)
      {
        uint64_t v169 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v167, (uint64_t)v165, 0);
        objc_msgSend_setFileURL_(v22, v170, (uint64_t)v169);

        id v266 = 0;
        uint64_t v258 = objc_msgSend_getFileMetadataAtPath_error_(MEMORY[0x1E4F19E50], v171, (uint64_t)v165, &v266);
        id v251 = v266;

        goto LABEL_58;
      }
      v190 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v167, *MEMORY[0x1E4F19DD8], 1000, v168, @"Moving downloaded asset failed");
      objc_msgSend_setError_(v22, v191, (uint64_t)v190);

      uint64_t v258 = 0;
      uint64_t v187 = 0;
    }
LABEL_70:
    int v138 = 4;
    goto LABEL_71;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  __int16 v43 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v275 = a3;
    _os_log_error_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_ERROR, "Can't find MMCS item for itemID %llu", buf, 0xCu);
  }
LABEL_34:
}

- (void)didPutItemID:(unint64_t)a3 signature:(id)a4 results:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v10 = objc_msgSend_findTrackedMMCSItemByItemID_(self, v8, a3);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F739D8]);
    id v13 = objc_msgSend_objectForKeyedSubscript_(v7, v12, *MEMORY[0x1E4F73898]);
    id v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, *MEMORY[0x1E4F738A0]);
    uint32_t v17 = objc_msgSend_objectForKeyedSubscript_(v7, v16, *MEMORY[0x1E4F737D8]);
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v7, v18, *MEMORY[0x1E4F73838]);
    if (v17 && objc_msgSend_unsignedIntValue(v17, v19, v20))
    {
      uint64_t v22 = objc_msgSend_unsignedIntValue(v17, v19, v20);
      objc_msgSend_setChunkCount_(v10, v23, v22);
    }
    if (v21 && objc_msgSend_unsignedLongLongValue(v21, v19, v20))
    {
      uint64_t v25 = objc_msgSend_unsignedLongLongValue(v21, v19, v24);
      objc_msgSend_setFileSize_(v10, v26, v25);
    }
    if (v11)
    {
      v60 = v17;
      __int16 v27 = v13;
      uint64_t v28 = v15;
      objc_msgSend_setFinished_(v10, v19, 1);
      __int16 v31 = objc_msgSend_fileURL(v10, v29, v30);
      int v34 = objc_msgSend_path(v31, v32, v33);
      uint64_t v37 = objc_msgSend_mmcsOperationType(self, v35, v36);
      uint64_t v39 = objc_msgSend__errorWithMMCSError_path_description_operationType_(CKDMMCS, v38, (uint64_t)v11, v34, @"Saving asset failed", v37);
      objc_msgSend_setError_(v10, v40, (uint64_t)v39);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v15 = v28;
      uint64_t v41 = *MEMORY[0x1E4F1A500];
      id v13 = v27;
      uint32_t v17 = v60;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v62 = (unint64_t)v10;
        _os_log_debug_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_DEBUG, "Error putting MMCS item %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_setFinished_(v10, v19, 1);
      if (v13)
      {
        objc_msgSend_setProgress_(v10, v45, v46, 1.0);
        objc_msgSend_setUploadReceipt_(v10, v47, (uint64_t)v13);
        objc_msgSend_doubleValue(v15, v48, v49);
        objc_msgSend_setUploadReceiptExpiration_(v10, v50, v51);
        objc_msgSend_setError_(v10, v52, 0);
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v53 = (void *)*MEMORY[0x1E4F1A500];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG)) {
          goto LABEL_24;
        }
        long long v54 = v53;
        long long v57 = objc_msgSend_asset(v10, v55, v56);
        *(_DWORD *)buf = 138412546;
        unint64_t v62 = (unint64_t)v10;
        __int16 v63 = 2112;
        uint64_t v64 = v57;
        _os_log_debug_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_DEBUG, "Finished putting MMCS item %@ and asset %@", buf, 0x16u);
      }
      else
      {
        long long v54 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v45, *MEMORY[0x1E4F19C40], 1, @"Expected either an error or a putReceipt on the completion of the upload");
        objc_msgSend_setError_(v10, v58, (uint64_t)v54);
      }
    }
LABEL_24:
    objc_msgSend_progressBlock(self, v42, v43);
    v59 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v59)[2](v59, v10);

    goto LABEL_25;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v44 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v62 = a3;
    _os_log_error_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_ERROR, "Can't find MMCS item for itemID %llu", buf, 0xCu);
  }
LABEL_25:
}

- (void)didPutSectionWithSignature:(id)a3 results:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_MMCSPackageSectionItem(self, v8, v9);
  if (!v10) {
    __assert_rtn("-[CKDMMCSItemGroupContext didPutSectionWithSignature:results:]", "CKDMMCSItemGroupContext.m", 849, "item && \"nil self.MMCSPackageSectionItem\"");
  }
  id v12 = (void *)v10;
  id v13 = objc_msgSend_objectForKeyedSubscript_(v7, v11, *MEMORY[0x1E4F739D8]);
  id v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, *MEMORY[0x1E4F73898]);
  uint32_t v17 = objc_msgSend_objectForKeyedSubscript_(v7, v16, *MEMORY[0x1E4F738A0]);
  objc_msgSend_setFinished_(v12, v18, 1);
  if (v13)
  {
    uint64_t v21 = objc_msgSend_fileURL(v12, v19, v20);
    uint64_t v24 = objc_msgSend_path(v21, v22, v23);
    uint64_t v27 = objc_msgSend_mmcsOperationType(self, v25, v26);
    __int16 v29 = objc_msgSend__errorWithMMCSError_path_description_operationType_(CKDMMCS, v28, (uint64_t)v13, v24, @"Saving asset failed", v27);
    objc_msgSend_setError_(v12, v30, (uint64_t)v29);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v31 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)unint64_t v42 = 138412290;
      *(void *)&v42[4] = v12;
      int v34 = "Error putting MMCS item %@";
LABEL_12:
      _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, v34, v42, 0xCu);
    }
  }
  else
  {
    objc_msgSend_setProgress_(v12, v19, v20, 1.0);
    objc_msgSend_setUploadReceipt_(v12, v35, (uint64_t)v15);
    objc_msgSend_doubleValue(v17, v36, v37);
    objc_msgSend_setUploadReceiptExpiration_(v12, v38, v39);
    objc_msgSend_setError_(v12, v40, 0);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v31 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)unint64_t v42 = 138412290;
      *(void *)&v42[4] = v12;
      int v34 = "Finished putting MMCS item %@";
      goto LABEL_12;
    }
  }
  objc_msgSend_progressBlock(self, v32, v33, *(_OWORD *)v42);
  uint64_t v41 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v41)[2](v41, v12);
}

- (void)didGetMetricsForRequest:(id)a3
{
  id v4 = a3;
  objc_msgSend_itemGroup(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetrics_(v8, v7, (uint64_t)v4);
}

- (id)conformingOperation
{
  if (objc_msgSend_BOOLValue(self->_hasConformingOperation, a2, v2))
  {
    uint64_t v6 = objc_msgSend_operation(self, v4, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

+ (MMCSItemReaderWriter)getMMCSItemReaderForItemID:(unint64_t)a3 MMCS:(id)a4 itemGroupContext:(id)a5 downloadChunkContext:(id)a6 error:(id *)a7
{
  v191[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v17 = a6;
  if (!v13)
  {
    uint64_t v166 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v166, v167, (uint64_t)a2, a1, @"CKDMMCSItemGroupContext.m", 1026, @"Expected non-nil MMCS for %@", a1);
  }
  uint64_t v20 = objc_msgSend_assetCache(v13, v15, v16);
  if (!v20)
  {
    id v168 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v168, v169, (uint64_t)a2, a1, @"CKDMMCSItemGroupContext.m", 1028, @"Expected non-nil asset cache for %@", v13);
  }
  uint64_t v21 = objc_msgSend_conformingOperation(v14, v18, v19);
  if (!v21
    || (uint64_t v24 = (void *)v21,
        objc_msgSend_conformingOperation(v14, v22, v23),
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        char MMCSItemReaderForItemID = objc_msgSend_itemGroupContext_willGetMMCSItemReaderForItemID_(v25, v26, (uint64_t)v14, a3), v25, v24, (MMCSItemReaderForItemID & 1) != 0))
  {
    uint64_t v28 = objc_msgSend_findTrackedMMCSItemByItemID_(v14, v22, a3);
    if (v28)
    {
      __int16 v31 = (void *)v28;
      if (objc_msgSend_shouldFetchAssetContentInMemory(v14, v29, v30))
      {
        int v34 = [CKDMMCSItemCommandWriter alloc];
        *(void *)&long long buf = 3;
        id v36 = (id)objc_msgSend_initWithMMCSItem_MMCSRequest_(v34, v35, (uint64_t)v31, v14);
        *((void *)&buf + 1) = v36;
        v175 = @"not an itemTypeHint";
        uint64_t v177 = 0;
        uint64_t v178 = 0;
        uint64_t v176 = @"not an itemDescription";
        v179 = sub_1C4F29944;
        uint64_t v180 = sub_1C4F29B14;
        v181 = sub_1C4F29E98;
        uint64_t v183 = 0;
        uint64_t v184 = 0;
        uint64_t v182 = sub_1C4F29F44;
        v185 = sub_1C4F29FC0;
        uint64_t v186 = sub_1C4F2A09C;
        uint64_t v187 = 0;
        uint64_t v38 = (MMCSItemReaderWriter *)MMCSItemReaderWriterCreate();
        if (v38)
        {
          objc_msgSend_setWriter_(v31, v37, (uint64_t)v36);
        }
        else if (a7)
        {
          objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v37, *MEMORY[0x1E4F19DD8], 3001, 0, @"nil reader");
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_44;
      }
      id v172 = v17;
      uint64_t v173 = a7;
LABEL_31:
      char v99 = objc_msgSend_fileURL(v31, v32, v33);
      id v102 = objc_msgSend_path(v99, v100, v101);

      objc_msgSend_CKSanitizedPath(v102, v103, v104);
      uint64_t v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v110 = objc_msgSend_itemTypeHint(v31, v106, v107);
      id v171 = v14;
      if (v110) {
        objc_msgSend_itemTypeHint(v31, v108, v109);
      }
      else {
      uint64_t v111 = objc_msgSend_pathExtension(v102, v108, v109);
      }

      if (v31
        && objc_msgSend_itemID(v31, v112, v113)
        && (objc_msgSend_trackingUUID(v31, v112, v113),
            v114 = objc_claimAutoreleasedReturnValue(),
            v114,
            v114))
      {
        v170 = (__CFString *)v111;
        if (objc_msgSend_shouldReadRawEncryptedData(v31, v112, v113))
        {
          v117 = [CKDMMCSEncryptedItemReader alloc];
          uint64_t v119 = objc_msgSend_initWithMMCSItem_MMCSRequest_(v117, v118, (uint64_t)v31, v14);
        }
        else if (objc_msgSend_shouldReadAssetContentUsingClientProxy(v31, v115, v116))
        {
          v134 = [CKDMMCSClientProxyItemReader alloc];
          uint64_t v119 = objc_msgSend_initWithMMCSItem_MMCSRequest_(v134, v135, (uint64_t)v31, v14);
        }
        else
        {
          v153 = [CKDMMCSItemReaderWriter alloc];
          uint64_t v119 = objc_msgSend_initWithMMCSItem_MMCSRequest_downloadChunkContext_(v153, v154, (uint64_t)v31, v14, v172);
        }
        uint64_t v155 = (void *)v119;
        uint64_t v156 = objc_msgSend_conformingOperation(v14, v120, v121);

        if (v156
          && (objc_msgSend_conformingOperation(v14, v157, v158),
              uint64_t v159 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_itemGroupContext_didGetItemReader_itemID_(v159, v160, (uint64_t)v14, v155, a3),
              uint64_t v161 = objc_claimAutoreleasedReturnValue(),
              v155,
              v159,
              (uint64_t v155 = (void *)v161) == 0))
        {
          if (v173)
          {
            objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v162, *MEMORY[0x1E4F19DD8], 3001, 0, @"delegate said no");
            id v36 = 0;
            uint64_t v38 = 0;
            id *v173 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v36 = 0;
            uint64_t v38 = 0;
          }
          id v132 = v170;
        }
        else
        {
          *(void *)&long long buf = 5;
          id v163 = v155;
          id v132 = v170;
          *((void *)&buf + 1) = v163;
          v175 = v170;
          uint64_t v177 = 0;
          uint64_t v178 = 0;
          uint64_t v176 = v105;
          v179 = sub_1C4F29944;
          uint64_t v180 = sub_1C4F29B14;
          v181 = sub_1C4F29E98;
          uint64_t v183 = 0;
          uint64_t v184 = 0;
          uint64_t v182 = sub_1C4F29F44;
          v185 = sub_1C4F29FC0;
          uint64_t v186 = sub_1C4F2A09C;
          uint64_t v187 = 0;
          uint64_t v188 = 0;
          uint64_t v189 = 0;
          v190 = sub_1C4F2A148;
          uint64_t v164 = MMCSItemReaderWriterCreate();
          uint64_t v38 = (MMCSItemReaderWriter *)v164;
          if (v173 && !v164)
          {
            objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v165, *MEMORY[0x1E4F19DD8], 3001, v105, @"nil reader");
            id *v173 = (id)objc_claimAutoreleasedReturnValue();
          }

          id v36 = 0;
        }
      }
      else
      {
        id v122 = v13;
        uint64_t v123 = v20;
        v124 = (__CFString *)v111;
        uint64_t v125 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v126 = *MEMORY[0x1E4F19DD8];
        uint64_t v127 = objc_msgSend_itemID(v31, v112, v113);
        v130 = objc_msgSend_trackingUUID(v31, v128, v129);
        objc_msgSend_errorWithDomain_code_path_format_(v125, v131, v126, 3001, v105, @"Invalid arguments, MMCSItem:%@, itemID:%llu, UUID:%@", v31, v127, v130);
        id v36 = (id)objc_claimAutoreleasedReturnValue();

        if (v173)
        {
          id v36 = v36;
          uint64_t v38 = 0;
          id *v173 = v36;
        }
        else
        {
          uint64_t v38 = 0;
        }
        id v132 = v124;
        uint64_t v20 = v123;
        id v13 = v122;
        id v14 = v171;
      }

      id v17 = v172;
      goto LABEL_44;
    }
    objc_msgSend_findAssetHandleForItemID_error_(v20, v29, a3, a7);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      id v172 = v17;
      uint64_t v173 = a7;
      uint64_t v39 = [CKDMMCSItem alloc];
      unint64_t v42 = objc_msgSend_path(v36, v40, v41);
      __int16 v31 = objc_msgSend_init_(v39, v43, v42 == 0);

      uint64_t v46 = objc_msgSend_itemID(v36, v44, v45);
      uint64_t v49 = objc_msgSend_unsignedLongLongValue(v46, v47, v48);
      objc_msgSend_setItemID_(v31, v50, v49);

      id v53 = objc_msgSend_UUID(v36, v51, v52);
      uint64_t v56 = objc_msgSend_UUIDString(v53, v54, v55);
      objc_msgSend_setTrackingUUID_(v31, v57, (uint64_t)v56);

      uint64_t v61 = objc_msgSend_path(v36, v58, v59);
      if (v61)
      {
        id v62 = objc_alloc(MEMORY[0x1E4F1CB10]);
        uint64_t v65 = objc_msgSend_path(v36, v63, v64);
        isDirectory = objc_msgSend_initFileURLWithPath_isDirectory_(v62, v66, (uint64_t)v65, 0);
        objc_msgSend_setFileURL_(v31, v68, (uint64_t)isDirectory);
      }
      else
      {
        objc_msgSend_setFileURL_(v31, v60, 0);
      }

      id v77 = objc_msgSend_assetCache(v13, v75, v76);
      long long v80 = objc_msgSend_volumeIndex(v36, v78, v79);
      long long v82 = objc_msgSend_deviceIDForVolumeIndex_(v77, v81, (uint64_t)v80);
      objc_msgSend_setDeviceID_(v31, v83, (uint64_t)v82);

      id v86 = objc_msgSend_fileID(v36, v84, v85);
      objc_msgSend_setFileID_(v31, v87, (uint64_t)v86);

      uint64_t v90 = objc_msgSend_generationID(v36, v88, v89);
      objc_msgSend_setGenerationID_(v31, v91, (uint64_t)v90);

      v94 = objc_msgSend_fileURL(v31, v92, v93);
      if (v94 || (objc_msgSend_deviceID(v31, v95, v96), (v94 = objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_30:
        goto LABEL_31;
      }
      uint64_t v136 = objc_msgSend_volumeIndex(v36, v97, v98);

      if (!v136) {
        goto LABEL_30;
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v137 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v36;
        _os_log_debug_impl(&dword_1C4CFF000, v137, OS_LOG_TYPE_DEBUG, "Cannot find deviceID for asset handle. Deleting %@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v140 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v141 = objc_msgSend_itemID(v36, v138, v139);
      uint64_t v71 = objc_msgSend_orderedSetWithObject_(v140, v142, (uint64_t)v141);

      objc_msgSend_unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs_deleteUnregisteredAssetHandlesWithIDs_(v20, v143, (uint64_t)v71, 0);
      uint64_t v144 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v145 = *MEMORY[0x1E4F19DD8];
      uint64_t v148 = objc_msgSend_itemID(v31, v146, v147);
      uint64_t v151 = objc_msgSend_volumeIndex(v36, v149, v150);
      objc_msgSend_errorWithDomain_code_format_(v144, v152, v145, 3002, @"Unable to open file for MMCSItem:%@ itemID:%llu on unmounted volume with volumeIndex=%@", v31, v148, v151);
      id v73 = (id)objc_claimAutoreleasedReturnValue();

      if (v173)
      {
        id v73 = v73;
        id *v173 = v73;
      }
      id v17 = v172;
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v69 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = a3;
        _os_log_error_impl(&dword_1C4CFF000, v69, OS_LOG_TYPE_ERROR, "Unregistering item without an asset handle for itemID=%llu", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v71 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v70, a3);
      v191[0] = v71;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v72, (uint64_t)v191, 1);
      id v73 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unregisterItemIDs_(v13, v74, (uint64_t)v73);
      __int16 v31 = 0;
    }

    uint64_t v38 = 0;
LABEL_44:

    goto LABEL_45;
  }
  if (a7)
  {
    objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 3001, 0, @"delegate said no");
    uint64_t v38 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v38 = 0;
  }
LABEL_45:

  return v38;
}

- (id)getCKDMMCSItemReaderByPathForMMCSItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_MMCS(self, v7, v8);
  if (!v11)
  {
    uint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 1171, @"Expected non-nil MMCS for %@", self);
  }
  id v14 = objc_msgSend_assetCache(v11, v9, v10);
  if (!v14)
  {
    uint64_t v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, @"CKDMMCSItemGroupContext.m", 1173, @"Expected non-nil asset cache for %@", v11);
  }
  if (objc_msgSend_shouldReadRawEncryptedData(v6, v12, v13))
  {
    id v17 = CKDMMCSEncryptedItemReader;
LABEL_9:
    id v18 = [v17 alloc];
    uint64_t v20 = objc_msgSend_initWithMMCSItem_MMCSRequest_(v18, v19, (uint64_t)v6, self);
    goto LABEL_11;
  }
  if (objc_msgSend_shouldReadAssetContentUsingClientProxy(v6, v15, v16))
  {
    id v17 = CKDMMCSClientProxyItemReader;
    goto LABEL_9;
  }
  uint64_t v21 = [CKDMMCSItemReaderWriter alloc];
  uint64_t v20 = objc_msgSend_initWithMMCSItem_MMCSRequest_downloadChunkContext_(v21, v22, (uint64_t)v6, self, 0);
LABEL_11:
  uint64_t v23 = (void *)v20;

  return v23;
}

- (BOOL)willOpenItemReaderWriter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_conformingOperation(self, v7, v8);

  if (v9)
  {
    id v12 = objc_msgSend_conformingOperation(self, v10, v11);
    char v14 = objc_msgSend_itemGroupContext_willOpenItemReaderWriter_error_(v12, v13, (uint64_t)self, v6, a4);
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (void)didOpenItemReaderWriter:(id)a3 result:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v16 = a3;
  id v8 = a5;
  uint64_t v11 = objc_msgSend_conformingOperation(self, v9, v10);

  if (v11)
  {
    char v14 = objc_msgSend_conformingOperation(self, v12, v13);
    objc_msgSend_itemGroupContext_didOpenItemReaderWriter_result_error_(v14, v15, (uint64_t)self, v16, v6, v8);
  }
}

- (BOOL)willCloseItemReaderWriter:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)willGetFileMetadataItemReaderWriter:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)didGetFileMetadataItemReaderWriter:(id)a3 fileMetadata:(id)a4 error:(id)a5
{
  return a4;
}

- (BOOL)willReadFromItemReaderWriter:(id)a3 offset:(unint64_t)a4 bytes:(char *)a5 length:(unint64_t)a6 bytesRead:(unint64_t *)a7 error:(id *)a8
{
  return 1;
}

- (BOOL)didReadFromItemReaderWriter:(id)a3 offset:(unint64_t)a4 bytes:(char *)a5 length:(unint64_t)a6 bytesRead:(unint64_t *)a7 error:(id *)a8
{
  return 1;
}

- (CKDOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  return (CKDOperation *)WeakRetained;
}

- (void)setOperation:(id)a3
{
}

- (id)operationInfo
{
  return self->_operationInfo;
}

- (void)setOperationInfo:(id)a3
{
}

- (NSNumber)hasConformingOperation
{
  return self->_hasConformingOperation;
}

- (void)setHasConformingOperation:(id)a3
{
}

- (CKSignpost)signpost
{
  return self->_signpost;
}

- (CKDMMCS)MMCS
{
  return self->_MMCS;
}

- (void)setMMCS:(id)a3
{
}

- (CKDMMCSItemGroup)itemGroup
{
  return self->_itemGroup;
}

- (void)setItemGroup:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (id)commandBlock
{
  return self->_commandBlock;
}

- (void)setCommandBlock:(id)a3
{
}

- (id)startBlock
{
  return self->_startBlock;
}

- (void)setStartBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (CKDMMCSItem)MMCSPackageSectionItem
{
  return self->_MMCSPackageSectionItem;
}

- (void)setMMCSPackageSectionItem:(id)a3
{
}

- (NSMapTable)MMCSItemsByItemID
{
  return self->_MMCSItemsByItemID;
}

- (void)setMMCSItemsByItemID:(id)a3
{
}

- (int64_t)mmcsOperationType
{
  return self->_mmcsOperationType;
}

- (void)setMmcsOperationType:(int64_t)a3
{
  self->_mmcsOperationType = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSItemsByItemID, 0);
  objc_storeStrong((id *)&self->_MMCSPackageSectionItem, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong(&self->_commandBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_itemGroup, 0);
  objc_storeStrong((id *)&self->_MMCS, 0);
  objc_storeStrong((id *)&self->_signpost, 0);
  objc_storeStrong((id *)&self->_hasConformingOperation, 0);
  objc_storeStrong(&self->_operationInfo, 0);
  objc_destroyWeak((id *)&self->_operation);
}

@end