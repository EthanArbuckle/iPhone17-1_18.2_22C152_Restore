@interface CKDAssetCache
+ (CKDAssetCache)assetCacheWithApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 didInit:(BOOL *)a6 error:(id *)a7;
+ (id)_sharedCachesByDirectory;
+ (id)_sharedCachesQueue;
- (BOOL)didDrop;
- (BOOL)isEvictionScheduled;
- (BOOL)isNewEmptyCache;
- (BOOL)parseCachedPath:(id)a3 assetHandleUUID:(id *)a4 assetSignature:(id *)a5;
- (BOOL)parseCachedPath:(id)a3 assetHandleUUIDString:(id *)a4 assetSignatureString:(id *)a5;
- (BOOL)startTrackingGetAssetHandles:(id)a3 operationType:(int64_t)a4 error:(id *)a5;
- (BOOL)startTrackingRegisterOrPutAssetHandles:(id)a3 operationType:(int64_t)a4 error:(id *)a5;
- (BOOL)updateAssetHandlesForGetMMCSItems:(id)a3 cloneItems:(BOOL)a4 error:(id *)a5;
- (BOOL)updateAssetHandlesForPutMMCSItems:(id)a3 cloneItems:(BOOL)a4 error:(id *)a5;
- (CKDAssetCacheTableGroup)assetCacheTableGroup;
- (CKDAssetHandleTable)assetHandleTable;
- (CKDAssetVolumeTable)assetVolumeTable;
- (CKDDirectoryContext)directoryContext;
- (CKDMMCS)MMCS;
- (NSDate)oldestLastUsedTime;
- (NSString)applicationBundleID;
- (NSString)fileDownloadPath;
- (id)_evictAllFilesForced:(BOOL)a3;
- (id)_evictWithEvictionInfo:(id)a3;
- (id)_getAssetHandlesForCachedButNotRegisteredMMCSItems:(id)a3 error:(id *)a4;
- (id)_initWithApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 error:(id *)a6;
- (id)_saveData:(id)a3 error:(id *)a4;
- (id)assetHandleWithCachedPath:(id)a3;
- (id)clearForced:(BOOL)a3;
- (id)clonedFileCache;
- (id)deviceIDForVolumeIndex:(id)a3;
- (id)evictAllFilesForced:(BOOL)a3;
- (id)existingEntriesForRegisterOrPutHandles:(id)a3 volumeIndex:(id)a4;
- (id)findAssetHandleForItemID:(unint64_t)a3 error:(id *)a4;
- (id)mmcsEngineContext;
- (id)registeredMMCSItemForRereferencedAsset:(id)a3 copyBlock:(id)a4;
- (id)trackCachedButNotRegisteredMMCSItems:(id)a3 error:(id *)a4;
- (id)trackDownloadedData:(id)a3 signature:(id)a4 error:(id *)a5;
- (id)updateAssetHandlesForChunkedMMCSItems:(id)a3 error:(id *)a4;
- (id)updateAssetHandlesForRegisteredMMCSItems:(id)a3 error:(id *)a4;
- (id)volumeIndexForDeviceID:(id)a3;
- (int64_t)checkoutCount;
- (unint64_t)countAssetCacheItems;
- (void)_deleteAssetHandlesAndUnregisterItemsForUnmountedAssetVolumes;
- (void)_expireAssetHandlesWithExpiryDate:(id)a3;
- (void)_resetAssetInflight;
- (void)_scheduleEvictionForDownloadedFiles;
- (void)checkAssetHandlesForRegisteredMMCSItems:(id)a3;
- (void)clearAssetCache;
- (void)dealloc;
- (void)drop;
- (void)enumerateAssetHandlesSegregatedByVolume:(id)a3 block:(id)a4;
- (void)expireAssetHandlesIfNecessary;
- (void)setCheckoutCount:(int64_t)a3;
- (void)setDidDrop:(BOOL)a3;
- (void)setDirectoryContext:(id)a3;
- (void)setIsEvictionScheduled:(BOOL)a3;
- (void)setMMCS:(id)a3;
- (void)setOldestLastUsedTime:(id)a3;
- (void)setupPersistentStateAtStartup;
- (void)showAssetCacheInContainer:(id)a3;
- (void)stopTrackingAssetHandlesByItemIDs:(id)a3;
- (void)unregisterItemIDsAndDeleteAssetHandlesWithEvictionInfo:(id)a3;
- (void)unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs:(id)a3 deleteUnregisteredAssetHandlesWithIDs:(id)a4;
- (void)updateLastAccessTimeForUUID:(id)a3;
@end

@implementation CKDAssetCache

+ (id)_sharedCachesQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F08304;
  block[3] = &unk_1E64F1B50;
  block[4] = a1;
  if (qword_1EBBCDEA0 != -1) {
    dispatch_once(&qword_1EBBCDEA0, block);
  }
  v2 = (void *)qword_1EBBCDE98;
  return v2;
}

+ (id)_sharedCachesByDirectory
{
  if (qword_1EBBCDEB0 != -1) {
    dispatch_once(&qword_1EBBCDEB0, &unk_1F2044030);
  }
  v2 = (void *)qword_1EBBCDEA8;
  return v2;
}

+ (CKDAssetCache)assetCacheWithApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 didInit:(BOOL *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v17 = a5;
  if (!v13)
  {
    v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, a1, @"CKDAssetCache.m", 383, @"Expected non-nil application bundle ID");
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_1C4F07418;
  v48 = sub_1C4F07428;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_1C4F07418;
  v42 = sub_1C4F07428;
  id v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v18 = objc_msgSend__sharedCachesQueue(CKDAssetCache, v15, v16);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4F086CC;
  v27[3] = &unk_1E64F5E10;
  id v19 = v14;
  id v28 = v19;
  v31 = &v44;
  id v20 = v13;
  id v29 = v20;
  id v21 = v17;
  id v30 = v21;
  v32 = &v38;
  v33 = &v34;
  dispatch_sync(v18, v27);

  if (a6) {
    *a6 = *((unsigned char *)v35 + 24);
  }
  v22 = (void *)v45[5];
  if (a7 && !v22)
  {
    *a7 = (id) v39[5];
    v22 = (void *)v45[5];
  }
  id v23 = v22;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return (CKDAssetCache *)v23;
}

- (id)_initWithApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 error:(id *)a6
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v86.receiver = self;
  v86.super_class = (Class)CKDAssetCache;
  id v14 = [(CKDAssetCache *)&v86 init];
  if (!v14)
  {
    id v25 = 0;
    id v28 = 0;
    if (!a6) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t v15 = (uint64_t)v14;
  id v84 = v11;
  objc_storeStrong((id *)&v14->_directoryContext, a4);
  v18 = objc_msgSend_fileDownloadDirectory(v12, v16, v17);
  id v21 = objc_msgSend_path(v18, v19, v20);
  uint64_t v94 = *MEMORY[0x1E4F19C18];
  v95[0] = MEMORY[0x1E4F1CC38];
  id v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v95, &v94, 1);
  v85[1] = 0;
  char v24 = CKCreateDirectoryAtPathWithAttributes();
  id v25 = 0;

  if (v24)
  {
    objc_storeStrong((id *)(v15 + 56), a3);
    if (v25)
    {
      objc_msgSend_setDidDrop_((void *)v15, v26, 1);
      id v28 = 0;
      id v11 = v84;
    }
    else
    {
      id v30 = NSString;
      v31 = objc_msgSend_containerIdentifier(v12, v26, v27);
      uint64_t v34 = objc_msgSend_dataSeparationHash(v12, v32, v33);
      uint64_t v36 = objc_msgSend_stringWithFormat_(v30, v35, @"%@.%@", v31, v34);

      char v37 = (void *)MEMORY[0x1E4F1A378];
      uint64_t v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      v41 = objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(v37, v40, 2, v36, v39);

      uint64_t v44 = objc_msgSend_containerID(v12, v42, v43);
      uint64_t v47 = objc_msgSend_specialContainerType(v44, v45, v46);
      uint64_t v49 = objc_msgSend_tableGroupOptionsForContainerType_(CKDAssetCacheTableGroup, v48, v47);

      v85[0] = 0;
      uint64_t v51 = objc_msgSend_tableGroupInDatabase_withName_options_error_(CKDAssetCacheTableGroup, v50, (uint64_t)v13, v41, v49, v85);
      id v25 = v85[0];
      v52 = *(void **)(v15 + 32);
      *(void *)(v15 + 32) = v51;

      v55 = *(void **)(v15 + 32);
      if (v55)
      {
        int isNew = objc_msgSend_isNew(v55, v53, v54);
        *(unsigned char *)(v15 + 16) = isNew;
        if (isNew)
        {
          v82 = *(void **)(v15 + 32);
          uint64_t v88 = *MEMORY[0x1E4F19DA8];
          v83 = objc_msgSend_mmcsWorkingDirectory(v12, v57, v58);
          v61 = objc_msgSend_path(v83, v59, v60);
          v87 = v61;
          v63 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v62, (uint64_t)&v87, 1);
          v89 = v63;
          v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v64, (uint64_t)&v89, &v88, 1);
          id v67 = (id)objc_msgSend_updateGroupData_(v82, v66, (uint64_t)v65);
        }
        uint64_t v68 = objc_msgSend_assetHandleTable(*(void **)(v15 + 32), v57, v58);
        v69 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v68;

        uint64_t v72 = objc_msgSend_assetVolumeTable(*(void **)(v15 + 32), v70, v71);
        v73 = *(void **)(v15 + 48);
        *(void *)(v15 + 48) = v72;
      }
      else
      {
        v73 = (void *)v15;
        uint64_t v15 = 0;
      }
      id v11 = v84;
      id v28 = (void *)v15;

      uint64_t v15 = v36;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v11 = v84;
    id v29 = (void *)*MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_ERROR))
    {
      v75 = v29;
      v78 = objc_msgSend_fileDownloadDirectory(v12, v76, v77);
      v81 = objc_msgSend_CKSanitizedPath(v78, v79, v80);
      *(_DWORD *)buf = 138543618;
      v91 = v81;
      __int16 v92 = 2112;
      id v93 = v25;
      _os_log_error_impl(&dword_1C4CFF000, v75, OS_LOG_TYPE_ERROR, "Failed to create dir at %{public}@: %@", buf, 0x16u);
    }
    id v28 = 0;
  }

  if (a6)
  {
LABEL_19:
    if (!v28) {
      *a6 = v25;
    }
  }
LABEL_21:

  return v28;
}

- (id)mmcsEngineContext
{
  v5 = objc_msgSend_MMCS(self, a2, v2);
  v8 = objc_msgSend_MMCSEngineContext(v5, v6, v7);

  if (!v8)
  {
    id v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CKDAssetCache.m", 454, @"Expected non nil CKDMMCSEngineContext");
  }
  return v8;
}

- (NSString)fileDownloadPath
{
  v3 = objc_msgSend_directoryContext(self, a2, v2);
  v6 = objc_msgSend_fileDownloadDirectory(v3, v4, v5);
  v9 = objc_msgSend_path(v6, v7, v8);

  return (NSString *)v9;
}

- (void)drop
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = *MEMORY[0x1E4F1A4F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Dropping: %@", buf, 0xCu);
  }
  v6 = objc_msgSend_mmcsEngineContext(self, v4, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4F08ED8;
  v8[3] = &unk_1E64F05C8;
  v8[4] = self;
  objc_msgSend_MMCSSerializeSyncRecursive_(v6, v7, (uint64_t)v8);
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v4 = (os_log_t *)MEMORY[0x1E4F1A4F8];
  uint64_t v5 = *MEMORY[0x1E4F1A4F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Deallocating: %@", buf, 0xCu);
  }
  if ((objc_msgSend_didDrop(self, v6, v7) & 1) == 0)
  {
    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = self;
      _os_log_fault_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_FAULT, "Failed to drop: %@", buf, 0xCu);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKDAssetCache;
  [(CKDAssetCache *)&v9 dealloc];
}

- (void)_deleteAssetHandlesAndUnregisterItemsForUnmountedAssetVolumes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_mmcsEngineContext(self, a2, v2);
  objc_msgSend_assertMMCSSerialized(v5, v6, v7);

  if (objc_msgSend_didDrop(self, v8, v9))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v13 = (void *)*MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_ERROR))
    {
      id v14 = v13;
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDAssetCache _deleteAssetHandlesAndUnregisterItemsForUnmountedAssetVolumes]", "CKDAssetCache.m", 513, "0 && \"already dropped\"");
  }
  assetVolumeTable = self->_assetVolumeTable;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4F09550;
  v16[3] = &unk_1E64F5E68;
  v16[4] = self;
  id v12 = (id)objc_msgSend_performTransaction_(assetVolumeTable, v10, (uint64_t)v16);
}

- (id)deviceIDForVolumeIndex:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend_volumeUUIDWithVolumeIndex_(self->_assetVolumeTable, a2, (uint64_t)a3);
    uint64_t v5 = v3;
    if (v3)
    {
      v3 = objc_msgSend_deviceIDForVolumeUUID_(CKDVolumeManager, v4, (uint64_t)v3);
    }
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)volumeIndexForDeviceID:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_1C4F07418;
    __int16 v19 = sub_1C4F07428;
    id v20 = 0;
    uint64_t v7 = objc_msgSend_mmcsEngineContext(self, v4, v5);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1C4F09ADC;
    v11[3] = &unk_1E64F5E90;
    id v13 = self;
    id v14 = &v15;
    id v12 = v6;
    objc_msgSend_MMCSSerializeSyncRecursive_(v7, v8, (uint64_t)v11);

    id v9 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)clearForced:(BOOL)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1C4F07418;
  uint64_t v16 = sub_1C4F07428;
  id v17 = 0;
  id v6 = objc_msgSend_mmcsEngineContext(self, a2, a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4F09C8C;
  v10[3] = &unk_1E64F5EB8;
  v10[5] = &v12;
  v10[6] = a2;
  v10[4] = self;
  BOOL v11 = a3;
  objc_msgSend_MMCSSerializeSyncRecursive_(v6, v7, (uint64_t)v10);

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)clearAssetCache
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_1C4F07418;
  v22 = sub_1C4F07428;
  id v23 = 0;
  uint64_t v5 = objc_msgSend_mmcsEngineContext(self, a2, v2);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F0A014;
  v17[3] = &unk_1E64F2C10;
  v17[5] = &v18;
  v17[6] = a2;
  v17[4] = self;
  objc_msgSend_MMCSSerializeSyncRecursive_(v5, v6, (uint64_t)v17);

  uint64_t v9 = objc_msgSend_countAssetCacheItems(self, v7, v8);
  if (v9)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v10 = (id)*MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend_purgedBytesCount((void *)v19[5], v11, v12);
      uint64_t v16 = objc_msgSend_name(self->_assetCacheTableGroup, v14, v15);
      *(_DWORD *)buf = 134218498;
      uint64_t v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = v9;
      __int16 v28 = 2114;
      id v29 = v16;
      _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "After clearing asset cache of %lld bytes, still had %ld items remaining in %{public}@", buf, 0x20u);
    }
  }
  _Block_object_dispose(&v18, 8);
}

- (void)checkAssetHandlesForRegisteredMMCSItems:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_MMCS(self, v6, v7);
  uint64_t v9 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v10 = (os_log_t *)MEMORY[0x1E4F1A4F8];
  BOOL v11 = (void *)*MEMORY[0x1E4F1A4F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v11;
    uint64_t v15 = objc_msgSend_path(v8, v13, v14);
    *(_DWORD *)buf = 138543362;
    v31 = v15;
    _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "----\nChunk Registry Report for %{public}@", buf, 0xCu);

    if (*v9 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
  }
  uint64_t v16 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "itemID, file signature, status", buf, 2u);
  }
  __int16 v19 = objc_msgSend_MMCSEngineContext(v8, v17, v18);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4F0A5F8;
  v27[3] = &unk_1E64F19C0;
  void v27[4] = self;
  SEL v29 = a2;
  id v20 = v5;
  id v28 = v20;
  objc_msgSend_MMCSSerializeSyncRecursive_(v19, v21, (uint64_t)v27);

  if (*v9 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v22 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    id v23 = v22;
    __int16 v26 = objc_msgSend_path(v8, v24, v25);
    *(_DWORD *)buf = 138543362;
    v31 = v26;
    _os_log_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_INFO, "End Chunk Registry Report for %{public}@\n----", buf, 0xCu);
  }
}

- (unint64_t)countAssetCacheItems
{
  return MEMORY[0x1F4181798](self->_assetHandleTable, sel_count_, 0);
}

- (void)showAssetCacheInContainer:(id)a3
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_mmcsEngineContext(self, v6, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4F0AB58;
  v11[3] = &unk_1E64F19C0;
  id v12 = v5;
  SEL v13 = a2;
  void v11[4] = self;
  id v9 = v5;
  objc_msgSend_MMCSSerializeSyncRecursive_(v8, v10, (uint64_t)v11);
}

- (void)unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs:(id)a3 deleteUnregisteredAssetHandlesWithIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_mmcsEngineContext(self, v8, v9);
  objc_msgSend_assertMMCSSerialized(v10, v11, v12);

  uint64_t v15 = objc_msgSend_MMCS(self, v13, v14);
  if (!v15) {
    __assert_rtn("-[CKDAssetCache unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs:deleteUnregisteredAssetHandlesWithIDs:]", "CKDAssetCache.m", 770, "MMCS && \"nil MMCS object\"");
  }
  uint64_t v18 = (void *)v15;
  if (objc_msgSend_count(v6, v16, v17))
  {
    uint64_t v21 = objc_msgSend_array(v6, v19, v20);
    objc_msgSend_unregisterItemIDs_(v18, v22, (uint64_t)v21);

LABEL_5:
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetHandleTable = self->_assetHandleTable;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1C4F0BC04;
    v28[3] = &unk_1E64F5F88;
    id v29 = &unk_1F20AB7A8;
    id v30 = v23;
    v31 = self;
    id v32 = v6;
    id v33 = v7;
    id v25 = v23;
    id v27 = (id)objc_msgSend_performTransaction_(assetHandleTable, v26, (uint64_t)v28);

    goto LABEL_6;
  }
  if (objc_msgSend_count(v7, v19, v20)) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)unregisterItemIDsAndDeleteAssetHandlesWithEvictionInfo:(id)a3
{
  id v4 = a3;
  objc_msgSend_itemIDsToUnregister(v4, v5, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_assetHandleItemIDsToDelete(v4, v7, v8);

  objc_msgSend_unregisterItemsAndDeleteUnregisteredAssetHandlesWithIDs_deleteUnregisteredAssetHandlesWithIDs_(self, v10, (uint64_t)v11, v9);
}

- (id)_saveData:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    uint64_t v36 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, @"CKDAssetCache.m", 822, @"Expected non-nil data");
  }
  uint64_t v10 = objc_msgSend_MMCS(self, v7, v8);
  SEL v13 = objc_msgSend_temporaryDirectory(v10, v11, v12);

  uint64_t v16 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v14, v15);
  __int16 v19 = objc_msgSend_UUIDString(v16, v17, v18);
  uint64_t v21 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v13, v20, (uint64_t)v19, 0);

  if (v21)
  {
    id v38 = 0;
    char v23 = objc_msgSend_writeToURL_options_error_(v9, v22, (uint64_t)v21, 0, &v38);
    id v24 = v38;
    id v25 = v24;
    if (v23)
    {
      id v26 = v21;

      goto LABEL_16;
    }
    if (a4) {
      *a4 = v24;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v27 = (void *)*MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_ERROR))
    {
      id v29 = v27;
      uint64_t v32 = objc_msgSend_length(v9, v30, v31);
      v35 = objc_msgSend_CKSanitizedPath(v21, v33, v34);
      *(_DWORD *)buf = 134218498;
      uint64_t v40 = v32;
      __int16 v41 = 2114;
      v42 = v35;
      __int16 v43 = 2112;
      uint64_t v44 = v25;
      _os_log_error_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_ERROR, "Can't create temp file for data(length:%lu) at %{public}@: %@", buf, 0x20u);
    }
  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 1000, @"Invalid path");
    id v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  id v26 = 0;
LABEL_16:

  return v26;
}

- (id)_getAssetHandlesForCachedButNotRegisteredMMCSItems:(id)a3 error:(id *)a4
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v149 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v149, v150, (uint64_t)a2, self, @"CKDAssetCache.m", 840, @"Expected non-nil MMCS items array");
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = objc_msgSend_count(v7, v9, v10);
  uint64_t v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id v14 = v7;
  uint64_t v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v163, v169, 16);
  if (!v158)
  {
    uint64_t v49 = 0;
    v144 = v14;
    goto LABEL_48;
  }
  v154 = a4;
  uint64_t v18 = 0;
  uint64_t v157 = *(void *)v164;
  id obj = v14;
  v156 = (void *)v13;
LABEL_5:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v164 != v157) {
      objc_enumerationMutation(obj);
    }
    uint64_t v20 = *(void **)(*((void *)&v163 + 1) + 8 * v19);
    uint64_t v21 = objc_msgSend_error(v20, v16, v17);

    if (v21)
    {
      uint64_t v49 = objc_msgSend_error(v20, v22, v23);

      goto LABEL_45;
    }
    id v24 = objc_msgSend_signature(v20, v22, v23);

    if (!v24)
    {
      v139 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v25, v26);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v139, v140, (uint64_t)a2, self, @"CKDAssetCache.m", 853, @"Expected non-nil signature for %@", v20);
    }
    id v27 = objc_msgSend_fileURL(v20, v25, v26);
    if (!objc_msgSend_fileSize(v20, v28, v29)) {
      break;
    }
    uint64_t v32 = objc_msgSend_fileURL(v20, v30, v31);

    id v27 = (void *)v32;
LABEL_17:
    uint64_t v49 = (uint64_t)v18;
LABEL_18:
    v50 = objc_msgSend_fileURL(v20, v33, v34);

    if (!v50)
    {
      v141 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v51, v52);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v141, v142, (uint64_t)a2, self, @"CKDAssetCache.m", 876, @"Expected non-nil fileURL for %@", v20);
    }
    if (objc_msgSend_itemID(v20, v51, v52))
    {
      v55 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v56 = objc_msgSend_itemID(v20, v53, v54);
      uint64_t v58 = objc_msgSend_numberWithUnsignedLongLong_(v55, v57, v56);
    }
    else
    {
      uint64_t v58 = 0;
    }
    v59 = (void *)MEMORY[0x1E4F19E50];
    uint64_t v60 = objc_msgSend_path(v27, v53, v54);
    id v161 = (id)v49;
    v62 = objc_msgSend_getFileMetadataAtPath_error_(v59, v61, (uint64_t)v60, &v161);
    id v63 = v161;

    if (!v62)
    {
      objc_msgSend_setError_(v20, v64, (uint64_t)v63);

      uint64_t v49 = (uint64_t)v63;
      goto LABEL_45;
    }
    id v160 = v63;
    v65 = [CKDAssetHandle alloc];
    id v67 = objc_msgSend_initWithItemID_UUID_path_(v65, v66, (uint64_t)v58, 0, 0);
    v70 = objc_msgSend_deviceID(v62, v68, v69);
    uint64_t v72 = objc_msgSend_volumeIndexForDeviceID_(self, v71, (uint64_t)v70);
    objc_msgSend_setVolumeIndex_(v67, v73, (uint64_t)v72);

    v76 = objc_msgSend_fileID(v62, v74, v75);
    objc_msgSend_setFileID_(v67, v77, (uint64_t)v76);

    uint64_t v80 = objc_msgSend_generationID(v62, v78, v79);
    objc_msgSend_setGenerationID_(v67, v81, (uint64_t)v80);

    id v84 = objc_msgSend_signature(v20, v82, v83);
    objc_msgSend_setFileSignature_(v67, v85, (uint64_t)v84);

    uint64_t v88 = objc_msgSend_modTimeInSeconds(v62, v86, v87);
    v91 = v88;
    if (v88)
    {
      __int16 v92 = (void *)MEMORY[0x1E4F1C9C8];
      objc_msgSend_doubleValue(v88, v89, v90);
      v95 = objc_msgSend_dateWithTimeIntervalSince1970_(v92, v93, v94);
      objc_msgSend_setModTime_(v67, v96, (uint64_t)v95);
    }
    v97 = objc_msgSend_fileSize(v62, v89, v90);
    objc_msgSend_setFileSize_(v67, v98, (uint64_t)v97);

    v101 = objc_msgSend_boundaryKey(v20, v99, v100);
    objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_(v67, v102, (uint64_t)v101);

    v105 = objc_msgSend_signature(v20, v103, v104);
    v108 = objc_msgSend_zeroSizeFileSignature(CKDMMCS, v106, v107);
    int isEqualToData = objc_msgSend_isEqualToData_(v105, v109, (uint64_t)v108);

    if ((isEqualToData & 1) != 0
      || !objc_msgSend_chunkCount(v20, v111, v112)
      || (objc_msgSend_fileSize(v62, v111, v112),
          v113 = objc_claimAutoreleasedReturnValue(),
          uint64_t v116 = objc_msgSend_unsignedLongLongValue(v113, v114, v115),
          v113,
          !v116))
    {
      v117 = (void *)MEMORY[0x1E4F1A3B8];
      v118 = objc_msgSend_signature(v20, v111, v112);
      LODWORD(v117) = objc_msgSend_isValidV2Signature_(v117, v119, (uint64_t)v118);

      if (((v117 | isEqualToData) & 1) == 0) {
        __assert_rtn("-[CKDAssetCache _getAssetHandlesForCachedButNotRegisteredMMCSItems:error:]", "CKDAssetCache.m", 903, "isZeroFileSignature && \"Expected zeroSizeFileSignature\"");
      }
      if (objc_msgSend_chunkCount(v20, v120, v121)) {
        __assert_rtn("-[CKDAssetCache _getAssetHandlesForCachedButNotRegisteredMMCSItems:error:]", "CKDAssetCache.m", 905, "MMCSItem.chunkCount == 0 && \"Expected MMCSItem.chunkCount == 0\"");
      }
      v124 = objc_msgSend_fileSize(v62, v122, v123);
      if (objc_msgSend_unsignedLongLongValue(v124, v125, v126)) {
        __assert_rtn("-[CKDAssetCache _getAssetHandlesForCachedButNotRegisteredMMCSItems:error:]", "CKDAssetCache.m", 906, "fileMetadata.fileSize.unsignedLongLongValue == 0 && \"Expected fileMetadata.fileSize.unsignedLongLongValue == 0\"");
      }

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v127 = *MEMORY[0x1E4F1A4F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v168 = v58;
        _os_log_debug_impl(&dword_1C4CFF000, v127, OS_LOG_TYPE_DEBUG, "Zero-length asset with itemID %{public}@", buf, 0xCu);
      }
    }
    v128 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v129 = objc_msgSend_chunkCount(v20, v111, v112);
    v131 = objc_msgSend_numberWithUnsignedInt_(v128, v130, v129);
    objc_msgSend_setChunkCount_(v67, v132, (uint64_t)v131);

    objc_msgSend_setStatus_(v67, v133, (uint64_t)&unk_1F20AC888);
    uint64_t v13 = (uint64_t)v156;
    objc_msgSend_addObject_(v156, v134, (uint64_t)v67);

    ++v19;
    uint64_t v18 = v160;
    if (v158 == v19)
    {
      id v14 = obj;
      uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v163, v169, 16);
      uint64_t v158 = v143;
      if (!v143)
      {
        v144 = obj;
        uint64_t v49 = (uint64_t)v160;
        goto LABEL_48;
      }
      goto LABEL_5;
    }
  }
  v35 = (void *)MEMORY[0x1E4F1A3B8];
  uint64_t v36 = objc_msgSend_signature(v20, v30, v31);
  if (objc_msgSend_isValidV2Signature_(v35, v37, (uint64_t)v36))
  {
  }
  else
  {
    v42 = objc_msgSend_signature(v20, v38, v39);
    uint64_t v45 = objc_msgSend_zeroSizeFileSignature(CKDMMCS, v43, v44);
    char v47 = objc_msgSend_isEqualToData_(v42, v46, (uint64_t)v45);

    if ((v47 & 1) == 0)
    {
      uint64_t v49 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v40, *MEMORY[0x1E4F19DD8], 1000, @"Invalid signature for zero size file");

      objc_msgSend_setError_(v20, v148, v49);
      goto LABEL_45;
    }
  }
  v48 = objc_msgSend_fileURL(v20, v40, v41);

  if (v48) {
    goto LABEL_17;
  }
  v135 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v33, v34);
  id v162 = v18;
  uint64_t v137 = objc_msgSend__saveData_error_(self, v136, (uint64_t)v135, &v162);
  uint64_t v49 = (uint64_t)v162;

  if (v137)
  {
    objc_msgSend_setFileURL_(v20, v138, v137);
    id v27 = (void *)v137;
    goto LABEL_18;
  }
  objc_msgSend_setError_(v20, v138, v49);
LABEL_45:
  id v14 = obj;

  if (v154)
  {
    uint64_t v49 = (uint64_t) (id) v49;
    id *v154 = (id)v49;
  }
  v144 = (void *)v13;
  uint64_t v13 = 0;
LABEL_48:

  if (!(v13 | v49))
  {
    v151 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v145, v146);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v151, v152, (uint64_t)a2, self, @"CKDAssetCache.m", 919, @"Expected non-nil error");
  }
  return (id)v13;
}

- (id)updateAssetHandlesForRegisteredMMCSItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  uint64_t v11 = objc_msgSend_mmcsEngineContext(self, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F0CD58;
  v17[3] = &unk_1E64F5FB0;
  id v20 = v8;
  SEL v21 = a2;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v12 = v8;
  id v13 = v7;
  id v14 = v6;
  objc_msgSend_MMCSSerializeSyncRecursive_(v11, v15, (uint64_t)v17);

  return 0;
}

- (id)updateAssetHandlesForChunkedMMCSItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v9 = objc_msgSend_mmcsEngineContext(self, v7, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4F0D810;
  v13[3] = &unk_1E64F19C0;
  id v14 = v6;
  SEL v15 = a2;
  v13[4] = self;
  id v10 = v6;
  objc_msgSend_MMCSSerializeSyncRecursive_(v9, v11, (uint64_t)v13);

  return 0;
}

- (id)clonedFileCache
{
  clonedFileCache = self->_clonedFileCache;
  if (!clonedFileCache)
  {
    id v5 = objc_msgSend_mmcsWorkingDirectory(self->_directoryContext, a2, v2);
    id v7 = objc_msgSend_URLByAppendingPathComponent_(v5, v6, @"ClonedFiles");

    uint64_t v8 = [CKDClonedFileCache alloc];
    id v10 = (CKDClonedFileCache *)objc_msgSend_initWithCacheDirectory_limit_(v8, v9, (uint64_t)v7, 10000);
    uint64_t v11 = self->_clonedFileCache;
    self->_clonedFileCache = v10;

    clonedFileCache = self->_clonedFileCache;
  }
  return clonedFileCache;
}

- (BOOL)updateAssetHandlesForGetMMCSItems:(id)a3 cloneItems:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_opt_new();
  id v10 = objc_opt_new();
  id v13 = objc_msgSend_mmcsEngineContext(self, v11, v12);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_1C4F0DC50;
  id v24 = &unk_1E64F5FF0;
  id v28 = v10;
  SEL v29 = a2;
  id v25 = self;
  id v26 = v8;
  BOOL v30 = a4;
  id v27 = v9;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  objc_msgSend_MMCSSerializeSyncRecursive_(v13, v17, (uint64_t)&v21);

  objc_msgSend__scheduleEvictionForDownloadedFiles(self, v18, v19, v21, v22, v23, v24, v25);
  return 1;
}

- (BOOL)updateAssetHandlesForPutMMCSItems:(id)a3 cloneItems:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_opt_new();
  id v10 = objc_opt_new();
  id v13 = objc_msgSend_mmcsEngineContext(self, v11, v12);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_1C4F0E8EC;
  id v24 = &unk_1E64F5FF0;
  id v28 = v10;
  SEL v29 = a2;
  id v25 = self;
  id v26 = v8;
  BOOL v30 = a4;
  id v27 = v9;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  objc_msgSend_MMCSSerializeSyncRecursive_(v13, v17, (uint64_t)&v21);

  objc_msgSend__scheduleEvictionForDownloadedFiles(self, v18, v19, v21, v22, v23, v24, v25);
  return 1;
}

- (id)trackCachedButNotRegisteredMMCSItems:(id)a3 error:(id *)a4
{
  id v9 = a3;
  if (!v9)
  {
    v35 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, self, @"CKDAssetCache.m", 1197, @"Expected non-nil cached but not registered MMCS items");
  }
  id v10 = objc_msgSend_fileDownloadPath(self, v7, v8);

  if (!v10)
  {
    char v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, self, @"CKDAssetCache.m", 1198, @"Expected non-nil file download path");
  }
  if (objc_msgSend_count(v9, v11, v12))
  {
    uint64_t v48 = 0;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x3032000000;
    uint64_t v51 = sub_1C4F07418;
    uint64_t v52 = sub_1C4F07428;
    id v53 = 0;
    id obj = 0;
    id v14 = objc_msgSend__getAssetHandlesForCachedButNotRegisteredMMCSItems_error_(self, v13, (uint64_t)v9, &obj);
    objc_storeStrong(&v53, obj);
    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v18 = objc_msgSend_count(v9, v16, v17);
      id v20 = objc_msgSend_initWithCapacity_(v15, v19, v18);
      uint64_t v23 = objc_msgSend_mmcsEngineContext(self, v21, v22);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_1C4F0F248;
      v41[3] = &unk_1E64F6018;
      v41[4] = self;
      uint64_t v45 = &v48;
      SEL v46 = a2;
      id v42 = v14;
      id v24 = v9;
      id v43 = v24;
      id v25 = v20;
      id v44 = v25;
      objc_msgSend_MMCSSerializeSyncRecursive_(v23, v26, (uint64_t)v41);

      id v28 = (void *)v49[5];
      if (v28)
      {
        if (a4) {
          *a4 = v28;
        }

        id v24 = 0;
      }
      else
      {
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v25, v27, (uint64_t)&unk_1F20440B0);
      }
      objc_msgSend__scheduleEvictionForDownloadedFiles(self, v29, v30);
      if (!v24 && !v49[5])
      {
        uint64_t v39 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v32, v33);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, self, @"CKDAssetCache.m", 1291, @"Expected non-nil error");
      }
      id v9 = v24;

      uint64_t v31 = v9;
    }
    else
    {
      uint64_t v31 = 0;
      if (a4) {
        *a4 = (id) v49[5];
      }
    }

    _Block_object_dispose(&v48, 8);
  }
  else
  {
    id v9 = v9;
    uint64_t v31 = v9;
  }

  return v31;
}

- (id)trackDownloadedData:(id)a3 signature:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = objc_msgSend__saveData_error_(self, v10, (uint64_t)v8, a5);
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(CKDMMCSItem);
    objc_msgSend_setFileURL_(v12, v13, (uint64_t)v11);
    objc_msgSend_setSignature_(v12, v14, (uint64_t)v9);
    uint64_t v17 = objc_msgSend_length(v8, v15, v16);
    objc_msgSend_setFileSize_(v12, v18, v17);
    v35[0] = v12;
    id v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v35, 1);
    uint64_t v22 = objc_msgSend_trackCachedButNotRegisteredMMCSItems_error_(self, v21, (uint64_t)v20, a5);

    if (v22
      || (objc_msgSend_fileURL(v12, v23, v24), (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0)
      || (id v28 = (void *)v27,
          objc_msgSend_trackingUUID(v12, v23, v24),
          SEL v29 = objc_claimAutoreleasedReturnValue(),
          v29,
          v28,
          v29))
    {
      id v25 = objc_msgSend_firstObject(v22, v23, v24);
    }
    else
    {
      uint64_t v30 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v23, v24);
      uint64_t v33 = objc_msgSend_fileURL(v12, v31, v32);
      objc_msgSend_removeItemAtURL_error_(v30, v34, (uint64_t)v33, 0);

      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (void)enumerateAssetHandlesSegregatedByVolume:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  id v10 = objc_msgSend_objectAtIndex_(v7, v9, 0);
  id v13 = objc_msgSend_volumeIndex(v10, v11, v12);
  uint64_t v16 = objc_msgSend_count(v7, v14, v15);
  if (v16 == 1)
  {
    v8[2](v8, v13, v7);
  }
  else
  {
    unint64_t v19 = v16;
    if (v16)
    {
      id v20 = 0;
      uint64_t v21 = 1;
      while (1)
      {
        uint64_t v22 = v20;
        id v20 = objc_msgSend_objectAtIndex_(v7, v17, v21);

        id v26 = objc_msgSend_volumeIndex(v20, v23, v24);
        if ((v13 != 0) == (v26 == 0) || v13 && !objc_msgSend_isEqualToNumber_(v13, v25, (uint64_t)v26)) {
          break;
        }

        if (v19 == ++v21) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      id v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, @"CKDAssetCache.m", 1319, @"no asset handles");
      id v20 = 0;
      uint64_t v21 = 1;
    }

    if (v21 == v19)
    {
LABEL_12:
      v8[2](v8, v13, v7);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v28 = *MEMORY[0x1E4F1A4F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Asset handles span multiple volumnes", buf, 2u);
      }
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend_replaceObjectsInRange_withObjectsFromArray_range_(v30, v31, 0, 0, v7, 0, v21);
      v62 = v30;
      id v63 = v10;
      if (v13)
      {
        objc_msgSend_setObject_forKey_(v29, v32, (uint64_t)v30, v13);
      }
      else
      {
        v35 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v32, v33);
        objc_msgSend_setObject_forKey_(v29, v36, (uint64_t)v30, v35);
      }
      char v37 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v34, (uint64_t)v20);
      id v42 = objc_msgSend_volumeIndex(v20, v38, v39);
      if (v42)
      {
        objc_msgSend_setObject_forKey_(v29, v40, (uint64_t)v37, v42);
      }
      else
      {
        id v43 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v40, v41);
        objc_msgSend_setObject_forKey_(v29, v44, (uint64_t)v37, v43);
      }
      unint64_t v46 = v21 + 1;
      if (v46 < v19)
      {
        do
        {
          char v47 = objc_msgSend_objectAtIndex_(v7, v45, v46);
          uint64_t v50 = objc_msgSend_volumeIndex(v47, v48, v49);
          id v53 = v50;
          if (v50)
          {
            id v54 = v50;
          }
          else
          {
            objc_msgSend_null(MEMORY[0x1E4F1CA98], v51, v52);
            id v54 = (id)objc_claimAutoreleasedReturnValue();
          }
          v55 = v54;

          v57 = objc_msgSend_objectForKey_(v29, v56, (uint64_t)v55);
          if (v57)
          {
            v59 = v57;
            objc_msgSend_addObject_(v57, v58, (uint64_t)v47);
          }
          else
          {
            v59 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v58, (uint64_t)v47);
            objc_msgSend_setObject_forKey_(v29, v60, (uint64_t)v59, v55);
          }

          ++v46;
        }
        while (v19 != v46);
      }
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = sub_1C4F10108;
      v64[3] = &unk_1E64F6060;
      v65 = v8;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v29, v61, (uint64_t)v64);

      id v10 = v63;
    }
  }
}

- (id)existingEntriesForRegisterOrPutHandles:(id)a3 volumeIndex:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v37 = 0;
    goto LABEL_26;
  }
  id v54 = self;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v11 = objc_msgSend_count(v6, v9, v10);
  id v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v56 = v6;
  id v14 = v6;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v63, v70, 16);
  if (!v16) {
    goto LABEL_14;
  }
  uint64_t v19 = v16;
  uint64_t v20 = *(void *)v64;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v64 != v20) {
        objc_enumerationMutation(v14);
      }
      uint64_t v22 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      uint64_t v23 = objc_msgSend_volumeIndex(v22, v17, v18);
      if (v23)
      {
        uint64_t v24 = (void *)v23;
        uint64_t v25 = objc_msgSend_fileID(v22, v17, v18);
        if (v25)
        {
          id v28 = (void *)v25;
          id v29 = objc_msgSend_generationID(v22, v26, v27);

          if (!v29) {
            continue;
          }
          uint64_t v24 = objc_msgSend_fileID(v22, v17, v18);
          objc_msgSend_addObject_(v13, v30, (uint64_t)v24);
        }
      }
    }
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v63, v70, 16);
  }
  while (v19);
LABEL_14:

  v68[0] = @"VOL";
  v68[1] = @"STATUS";
  v69[0] = v7;
  v69[1] = &unk_1F20AC8B8;
  uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)v69, v68, 2);
  assetHandleTable = v54->_assetHandleTable;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = sub_1C4F104B8;
  v61[3] = &unk_1E64F0370;
  id v34 = v13;
  id v62 = v34;
  v55 = (void *)v32;
  uint64_t v36 = objc_msgSend_entriesWithValues_label_error_setupBlock_(assetHandleTable, v35, v32, 0, 0, v61);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v38 = v36;
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v57, v67, 16);
  if (v40)
  {
    uint64_t v43 = v40;
    uint64_t v44 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v58 != v44) {
          objc_enumerationMutation(v38);
        }
        unint64_t v46 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        char v47 = objc_msgSend_fileID(v46, v41, v42);
        uint64_t v49 = objc_msgSend_objectForKey_(v37, v48, (uint64_t)v47);
        if (v49)
        {
          uint64_t v51 = v49;
          objc_msgSend_addObject_(v49, v50, (uint64_t)v46);
        }
        else
        {
          uint64_t v51 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v50, (uint64_t)v46);
          objc_msgSend_setObject_forKey_(v37, v52, (uint64_t)v51, v47);
        }
      }
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v57, v67, 16);
    }
    while (v43);
  }

  id v6 = v56;
LABEL_26:

  return v37;
}

- (BOOL)startTrackingRegisterOrPutAssetHandles:(id)a3 operationType:(int64_t)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_1C4F07418;
  id v37 = sub_1C4F07428;
  id v38 = 0;
  BOOL v10 = a4 == 6;
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = objc_opt_new();
  uint64_t v15 = objc_msgSend_mmcsEngineContext(self, v13, v14);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1C4F10868;
  v26[3] = &unk_1E64F60D8;
  v26[4] = self;
  SEL v31 = a2;
  id v16 = v9;
  id v27 = v16;
  id v30 = &v33;
  BOOL v32 = v10;
  id v17 = v11;
  id v28 = v17;
  id v18 = v12;
  id v29 = v18;
  objc_msgSend_MMCSSerializeSyncRecursive_(v15, v19, (uint64_t)v26);

  uint64_t v20 = (void *)v34[5];
  if (v20)
  {
    if (a5) {
      *a5 = v20;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v21 = *MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = v34[5];
      *(_DWORD *)buf = 138412546;
      id v40 = v16;
      __int16 v41 = 2112;
      uint64_t v42 = v22;
      _os_log_error_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_ERROR, "Failed to start tracking asset handles %@: %@", buf, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v23 = *MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v16;
      _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Started tracking register/put asset handles %@", buf, 0xCu);
    }
  }
  BOOL v24 = v34[5] == 0;

  _Block_object_dispose(&v33, 8);
  return v24;
}

- (BOOL)startTrackingGetAssetHandles:(id)a3 operationType:(int64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_1C4F07418;
  id v28 = sub_1C4F07428;
  id v29 = 0;
  uint64_t v11 = objc_msgSend_mmcsEngineContext(self, v9, v10);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4F11314;
  v20[3] = &unk_1E64F6140;
  uint64_t v22 = &v24;
  SEL v23 = a2;
  v20[4] = self;
  id v12 = v8;
  id v21 = v12;
  objc_msgSend_MMCSSerializeSyncRecursive_(v11, v13, (uint64_t)v20);

  uint64_t v14 = (void *)v25[5];
  if (v14)
  {
    if (a5) {
      *a5 = v14;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = *MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v25[5];
      *(_DWORD *)buf = 138412546;
      id v31 = v12;
      __int16 v32 = 2112;
      uint64_t v33 = v16;
      _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "Failed to start tracking asset handles %@: %@", buf, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v17 = *MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v12;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Started tracking get asset handles %@", buf, 0xCu);
    }
  }
  BOOL v18 = v25[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v18;
}

- (void)updateLastAccessTimeForUUID:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v8 = objc_msgSend_mmcsEngineContext(self, v5, v6);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1C4F11900;
    v10[3] = &unk_1E64F19C0;
    v10[4] = self;
    SEL v12 = a2;
    id v11 = v7;
    objc_msgSend_MMCSSerializeSyncRecursive_(v8, v9, (uint64_t)v10);
  }
}

- (void)stopTrackingAssetHandlesByItemIDs:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_msgSend_count(v5, v6, v7))
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = sub_1C4F07418;
    v32[4] = sub_1C4F07428;
    id v33 = 0;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v8 = (id)*MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v13 = v5;
      uint64_t v16 = objc_msgSend_string(MEMORY[0x1E4F28E78], v14, v15);
      objc_msgSend_appendString_(v16, v17, @"(");
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v18 = v13;
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v34, v40, 16);
      uint64_t v26 = self;
      id v27 = a2;
      if (v21)
      {
        uint64_t v22 = *(void *)v35;
        char v23 = 1;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v18);
            }
            if (v23) {
              objc_msgSend_appendFormat_(v16, v20, @"%@", *(void *)(*((void *)&v34 + 1) + 8 * i));
            }
            else {
              objc_msgSend_appendFormat_(v16, v20, @", %@", *(void *)(*((void *)&v34 + 1) + 8 * i));
            }
            char v23 = 0;
          }
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v34, v40, 16);
          char v23 = 0;
        }
        while (v21);
      }

      self = v26;
      a2 = v27;
      objc_msgSend_appendString_(v16, v25, @""));

      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v16;
      _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Stopping tracking asset handles for itemIDs %{public}@", buf, 0xCu);
    }
    id v11 = objc_msgSend_mmcsEngineContext(self, v9, v10);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1C4F11DFC;
    v28[3] = &unk_1E64F6140;
    void v28[4] = self;
    SEL v31 = a2;
    id v29 = v5;
    id v30 = v32;
    objc_msgSend_MMCSSerializeSyncRecursive_(v11, v12, (uint64_t)v28);

    _Block_object_dispose(v32, 8);
  }
}

- (id)findAssetHandleForItemID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_1C4F07418;
  id v29 = sub_1C4F07428;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1C4F07418;
  char v23 = sub_1C4F07428;
  id v24 = 0;
  id v8 = objc_msgSend_mmcsEngineContext(self, a2, a3);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4F1237C;
  v18[3] = &unk_1E64F6180;
  v18[4] = self;
  v18[5] = &v25;
  v18[7] = a2;
  v18[8] = a3;
  v18[6] = &v19;
  objc_msgSend_MMCSSerializeSyncRecursive_(v8, v9, (uint64_t)v18);

  SEL v12 = (void *)v26[5];
  if (v12)
  {
    id v13 = objc_msgSend_UUID(v12, v10, v11);

    if (v13)
    {
      id v14 = (id)v26[5];
      goto LABEL_9;
    }
  }
  if (v20[5])
  {
    if (a4)
    {
LABEL_6:
      id v14 = 0;
      *a4 = (id) v20[5];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 3002, @"couldn't find item ID %llu", a3);
    uint64_t v16 = (void *)v20[5];
    void v20[5] = v15;

    if (a4) {
      goto LABEL_6;
    }
  }
  id v14 = 0;
LABEL_9:
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (BOOL)parseCachedPath:(id)a3 assetHandleUUIDString:(id *)a4 assetSignatureString:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v11 = objc_msgSend_lastPathComponent(v8, v9, v10);
  id v14 = objc_msgSend_stringByDeletingLastPathComponent(v8, v12, v13);
  id v17 = objc_msgSend_fileDownloadPath(self, v15, v16);
  char isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v14);

  if ((isEqualToString & 1) == 0)
  {
    uint64_t v22 = objc_msgSend_fileDownloadPath(self, v20, v21);
    uint64_t v25 = objc_msgSend_stringByStandardizingPath(v14, v23, v24);
    int v27 = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

    if (!v27)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v40 = (void *)*MEMORY[0x1E4F1A4F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_ERROR))
      {
        unint64_t v46 = v40;
        uint64_t v49 = objc_msgSend_CKSanitizedPath(v8, v47, v48);
        uint64_t v52 = objc_msgSend_fileDownloadPath(self, v50, v51);
        v55 = objc_msgSend_CKSanitizedPath(v52, v53, v54);
        int v56 = 138543618;
        long long v57 = v49;
        __int16 v58 = 2114;
        long long v59 = v55;
        _os_log_error_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_ERROR, "Attempt to find asset by path that is not in the asset cache fileDownloadPath %{public}@ vs. %{public}@", (uint8_t *)&v56, 0x16u);
      }
      goto LABEL_20;
    }
  }
  id v28 = objc_msgSend_zeroSizeFileSignature(CKDMMCS, v20, v21);
  uint64_t v31 = 2 * objc_msgSend_length(v28, v29, v30) + 37;
  if (v31 != objc_msgSend_length(v11, v32, v33))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v39 = (void *)*MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = v39;
      uint64_t v45 = objc_msgSend_CKSanitizedPath(v8, v43, v44);
      int v56 = 138543362;
      long long v57 = v45;
      _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "Attempt to find asset by path that is not parsable %{public}@", (uint8_t *)&v56, 0xCu);
    }
LABEL_20:
    BOOL v38 = 0;
    long long v35 = 0;
    id v37 = 0;
    goto LABEL_21;
  }
  long long v35 = objc_msgSend_substringToIndex_(v11, v34, 36);
  objc_msgSend_substringFromIndex_(v11, v36, 37);
  id v37 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v38 = 0;
  if (v35 && v37)
  {
    if (a4) {
      *a4 = v35;
    }
    if (a5)
    {
      id v37 = v37;
      *a5 = v37;
    }
    BOOL v38 = 1;
  }
LABEL_21:

  return v38;
}

- (BOOL)parseCachedPath:(id)a3 assetHandleUUID:(id *)a4 assetSignature:(id *)a5
{
  id v20 = 0;
  id v21 = 0;
  int v7 = objc_msgSend_parseCachedPath_assetHandleUUIDString_assetSignatureString_(self, a2, (uint64_t)a3, &v21, &v20);
  id v8 = v21;
  id v9 = v20;
  uint64_t v10 = v9;
  BOOL v11 = 0;
  if (v7)
  {
    if (v8 && v9 != 0)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F29128]);
      id v15 = (id)objc_msgSend_initWithUUIDString_(v13, v14, (uint64_t)v8);
      uint64_t v17 = objc_msgSend_CKDataWithHexString_stringIsUppercase_(MEMORY[0x1E4F1C9B8], v16, (uint64_t)v10, 0);
      id v18 = (id)v17;
      BOOL v11 = 0;
      if (a5 && a4 && v15 && v17)
      {
        id v15 = v15;
        *a4 = v15;
        id v18 = v18;
        *a5 = v18;
        BOOL v11 = 1;
      }
    }
  }

  return v11;
}

- (id)assetHandleWithCachedPath:(id)a3
{
  id v5 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1C4F07418;
  id v21 = sub_1C4F07428;
  id v22 = 0;
  id v8 = objc_msgSend_mmcsEngineContext(self, v6, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4F12BD8;
  v13[3] = &unk_1E64F6140;
  v13[4] = self;
  SEL v16 = a2;
  id v9 = v5;
  id v14 = v9;
  id v15 = &v17;
  objc_msgSend_MMCSSerializeSyncRecursive_(v8, v10, (uint64_t)v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)registeredMMCSItemForRereferencedAsset:(id)a3 copyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDMMCSItem alloc];
  uint64_t v10 = objc_msgSend_initWithAsset_temporary_(v8, v9, (uint64_t)v6, 1);
  if (objc_msgSend_isReference(v6, v11, v12))
  {
    uint64_t v15 = objc_msgSend_reReferenceItemID(v6, v13, v14);
    assetHandleTable = self->_assetHandleTable;
    id v102 = 0;
    uint64_t v18 = objc_msgSend_assetHandleWithItemID_error_(assetHandleTable, v17, v15, &v102);
    uint64_t v21 = (uint64_t)v102;
    if (!(v18 | v21))
    {
      uint64_t v21 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, *MEMORY[0x1E4F19DD8], 1017, @"no such itemID %ld", v15);
    }
    if (v21)
    {

LABEL_12:
      objc_msgSend_setError_(v10, v22, v21);

      goto LABEL_13;
    }
    char v23 = objc_msgSend_status((void *)v18, v19, v20);
    uint64_t v26 = objc_msgSend_integerValue(v23, v24, v25);

    if (v26 == 3)
    {
      id v29 = objc_msgSend_itemID((void *)v18, v27, v28);
      objc_msgSend_setItemID_((void *)v18, v30, 0);
      uint64_t v33 = objc_msgSend_boundaryKey(v6, v31, v32);
      objc_msgSend_setBoundaryKeyHashUsingBoundaryKey_((void *)v18, v34, (uint64_t)v33);

      uint64_t v96 = 0;
      v97 = &v96;
      uint64_t v98 = 0x3032000000;
      v99 = sub_1C4F07418;
      uint64_t v100 = sub_1C4F07428;
      id v101 = 0;
      long long v35 = self->_assetHandleTable;
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = sub_1C4F1329C;
      v91[3] = &unk_1E64F61A8;
      v91[4] = self;
      id v36 = (id)v18;
      id v92 = v36;
      v95 = &v96;
      id v94 = v7;
      id v37 = v29;
      id v93 = v37;
      uint64_t v21 = objc_msgSend_performTransaction_(v35, v38, (uint64_t)v91);
      if (!v21)
      {
        uint64_t v41 = objc_msgSend_volumeIndex(v36, v39, v40);
        uint64_t v43 = objc_msgSend_deviceIDForVolumeIndex_(self, v42, (uint64_t)v41);
        objc_msgSend_setDeviceID_(v10, v44, (uint64_t)v43);

        char v47 = objc_msgSend_fileID(v36, v45, v46);
        objc_msgSend_setFileID_(v10, v48, (uint64_t)v47);

        uint64_t v51 = objc_msgSend_generationID(v36, v49, v50);
        objc_msgSend_setGenerationID_(v10, v52, (uint64_t)v51);

        id v53 = (void *)MEMORY[0x1E4F28ED0];
        int v56 = objc_msgSend_modTime(v36, v54, v55);
        objc_msgSend_timeIntervalSince1970(v56, v57, v58);
        v61 = objc_msgSend_numberWithDouble_(v53, v59, v60);
        objc_msgSend_setModTimeInSeconds_(v10, v62, (uint64_t)v61);

        long long v65 = objc_msgSend_fileSize(v36, v63, v64);
        uint64_t v68 = objc_msgSend_unsignedLongLongValue(v65, v66, v67);
        objc_msgSend_setFileSize_(v10, v69, v68);

        uint64_t v72 = objc_msgSend_unsignedLongLongValue((void *)v97[5], v70, v71);
        objc_msgSend_setItemID_(v10, v73, v72);
        v76 = objc_msgSend_chunkCount(v36, v74, v75);
        uint64_t v79 = objc_msgSend_unsignedLongValue(v76, v77, v78);
        objc_msgSend_setChunkCount_(v10, v80, v79);

        objc_msgSend_setIsAlreadyRegistered_(v10, v81, 1);
        id v84 = objc_msgSend_UUID(v6, v82, v83);
        objc_msgSend_setTrackingUUID_(v10, v85, (uint64_t)v84);

        uint64_t v88 = objc_msgSend_boundaryKey(v6, v86, v87);
        objc_msgSend_setBoundaryKey_(v10, v89, (uint64_t)v88);
      }
      _Block_object_dispose(&v96, 8);
    }
    else
    {
      uint64_t v21 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, *MEMORY[0x1E4F19DD8], 3015, @"Asset handle not registered for itemID %ld", v15);
    }

    if (v21) {
      goto LABEL_12;
    }
  }
LABEL_13:

  return v10;
}

- (void)_scheduleEvictionForDownloadedFiles
{
  id v5 = objc_msgSend_mmcsEngineContext(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4F133D4;
  v7[3] = &unk_1E64F1998;
  v7[4] = self;
  v7[5] = a2;
  objc_msgSend_MMCSSerializeSyncRecursive_(v5, v6, (uint64_t)v7);
}

- (id)_evictWithEvictionInfo:(id)a3
{
  v226[2] = *MEMORY[0x1E4F143B8];
  id v172 = a3;
  v178 = self;
  id v6 = objc_msgSend_mmcsEngineContext(self, v4, v5);
  objc_msgSend_assertMMCSSerialized(v6, v7, v8);

  uint64_t v213 = 0;
  v214 = &v213;
  uint64_t v215 = 0x2020000000;
  uint64_t v216 = 0;
  if (objc_msgSend_didDrop(v178, v9, v10))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v151 = (id)*MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
    {
      v152 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v178;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v152;
      _os_log_error_impl(&dword_1C4CFF000, v151, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDAssetCache _evictWithEvictionInfo:]", "CKDAssetCache.m", 1757, "0 && \"already dropped\"");
  }
  v174 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v11, v12);
  char v212 = 0;
  uint64_t v17 = objc_msgSend_fileDownloadPath(v178, v13, v14);
  if (!v17) {
    goto LABEL_28;
  }
  uint64_t v18 = objc_msgSend_fileDownloadPath(v178, v15, v16);
  v171 = (void *)v17;
  if (objc_msgSend_fileExistsAtPath_isDirectory_(v174, v19, (uint64_t)v18, &v212))
  {
    BOOL v20 = v212 == 0;

    if (!v20)
    {
      char v23 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v24 = objc_msgSend_fileDownloadPath(v178, v21, v22);
      v171 = objc_msgSend_fileURLWithPath_isDirectory_(v23, v25, (uint64_t)v24, 1);

      context = (void *)MEMORY[0x1C8789E70]();
      uint64_t v26 = *MEMORY[0x1E4F1C5F8];
      uint64_t v27 = *MEMORY[0x1E4F1C5C0];
      v226[0] = *MEMORY[0x1E4F1C5F8];
      v226[1] = v27;
      id v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v226, 2);
      uint64_t v31 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v174, v30, (uint64_t)v171, v29, 1, &unk_1F20440F0);

      unint64_t v173 = 0;
      unint64_t v170 = 0;
      v175 = (void *)*MEMORY[0x1E4F1C5D0];
      do
      {
        uint64_t v32 = (void *)MEMORY[0x1C8789E70]();
        long long v35 = objc_msgSend_nextObject(v31, v33, v34);
        id v37 = v35;
        if (v35)
        {
          id v210 = 0;
          id v211 = 0;
          int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v35, v36, (uint64_t)&v211, v27, &v210);
          id v39 = v211;
          id v41 = v210;
          if (v39) {
            int v42 = ResourceValue_forKey_error;
          }
          else {
            int v42 = 0;
          }
          if (v42 == 1 && objc_msgSend_isEqualToString_(v175, v40, (uint64_t)v39))
          {
            id v208 = 0;
            id v209 = 0;
            int v44 = objc_msgSend_getResourceValue_forKey_error_(v37, v43, (uint64_t)&v209, v26, &v208);
            id v45 = v209;
            id v46 = v208;

            if (v45) {
              int v49 = v44;
            }
            else {
              int v49 = 0;
            }
            if (v49 == 1) {
              v170 += objc_msgSend_unsignedLongLongValue(v45, v47, v48);
            }

            ++v173;
            id v41 = v46;
          }
        }
      }
      while (v37);

      if ((objc_msgSend_forced(v172, v50, v51) & 1) != 0 || v173 > 0x64 || v170 > 0xA00000)
      {
        long long v166 = (void *)MEMORY[0x1C8789E70]();
        v225[0] = v26;
        v225[1] = v27;
        uint64_t v58 = (void *)*MEMORY[0x1E4F1C528];
        v225[2] = *MEMORY[0x1E4F1C528];
        uint64_t v60 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v59, (uint64_t)v225, 3);
        contexta = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v174, v61, (uint64_t)v171, v60, 1, &unk_1F2044110);

        uint64_t v64 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v62, v63);
        int v67 = objc_msgSend_useModTimeInAssetCacheEviction(v64, v65, v66);

        uint64_t v68 = (void *)*MEMORY[0x1E4F1C530];
        if (!v67) {
          uint64_t v68 = v58;
        }
        id v167 = v68;
        *(void *)&long long v69 = 138543362;
        long long v165 = v69;
        do
        {
          v70 = (void *)MEMORY[0x1C8789E70]();
          v73 = objc_msgSend_nextObject(contexta, v71, v72);
          uint64_t v75 = v73;
          if (v73)
          {
            id v206 = 0;
            id v207 = 0;
            int v76 = objc_msgSend_getResourceValue_forKey_error_(v73, v74, (uint64_t)&v207, v27, &v206);
            id v77 = v207;
            id v79 = v206;
            if (v77) {
              int v80 = v76;
            }
            else {
              int v80 = 0;
            }
            if (v80 == 1 && objc_msgSend_isEqualToString_(v175, v78, (uint64_t)v77))
            {
              uint64_t v83 = objc_msgSend_path(v75, v81, v82);
              id v204 = 0;
              id v205 = 0;
              int v85 = objc_msgSend_parseCachedPath_assetHandleUUID_assetSignature_(v178, v84, (uint64_t)v83, &v205, &v204);
              id v86 = v205;
              id v169 = v204;

              if (v85)
              {
                if (!v86 || !v169)
                {
                  uint64_t v115 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v87, v88, v165);
                  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v115, v116, (uint64_t)a2, v178, @"CKDAssetCache.m", 1833, @"should have thrown by now");
                }
                id v202 = 0;
                id v203 = 0;
                int v89 = objc_msgSend_getResourceValue_forKey_error_(v75, v87, (uint64_t)&v203, v167, &v202, v165);
                uint64_t v90 = v203;
                id v91 = v202;

                if (v90) {
                  int v93 = v89;
                }
                else {
                  int v93 = 0;
                }
                if (v93 == 1)
                {
                  id v94 = objc_msgSend_assetHandleWithUUID_(v178->_assetHandleTable, v92, (uint64_t)v86);
                  v97 = v94;
                  if (v94)
                  {
                    uint64_t v98 = objc_msgSend_lastUsedTime(v94, v95, v96);
                    uint64_t v100 = objc_msgSend_laterDate_(v90, v99, (uint64_t)v98);
                    BOOL v101 = v100 == v90;

                    if (v101)
                    {
                      objc_msgSend_setLastUsedTime_(v97, v102, (uint64_t)v90);
                      id v104 = (id)objc_msgSend_saveLastUsedTime_(v178->_assetHandleTable, v103, (uint64_t)v97);
                    }
                  }
                  else
                  {
                    uint64_t v107 = [CKDAssetHandle alloc];
                    v97 = objc_msgSend_initWithItemID_UUID_path_(v107, v108, 0, v86, 0);
                    objc_msgSend_setFileSignature_(v97, v109, (uint64_t)v169);
                    objc_msgSend_setStatus_(v97, v110, (uint64_t)&unk_1F20AC888);
                    objc_msgSend_setLastUsedTime_(v97, v111, (uint64_t)v90);
                    id v113 = (id)objc_msgSend_insertObject_(v178->_assetHandleTable, v112, (uint64_t)v97);
                  }
                }
              }
              else
              {
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                uint64_t v90 = (id)*MEMORY[0x1E4F1A4F8];
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                {
                  v114 = objc_msgSend_path(v75, v105, v106);
                  *(_DWORD *)buf = v165;
                  *(void *)&uint8_t buf[4] = v114;
                  _os_log_debug_impl(&dword_1C4CFF000, v90, OS_LOG_TYPE_DEBUG, "Ignoring file in cache %{public}@", buf, 0xCu);
                }
                id v91 = v79;
              }
            }
            else
            {
              id v91 = v79;
            }
          }
        }
        while (v75);

        v119 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v117, v118);
        char v122 = objc_msgSend_evictRecentAssets(v119, v120, v121);

        v125 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v123, v124);
        unint64_t v127 = objc_msgSend_assetEvictionGracePeriodWithDefaultValue_(v125, v126, 14400);

        v130 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v128, v129);
        unint64_t v132 = objc_msgSend_assetEvictionGracePeriodOnHighWatermarkWithDefaultValue_(v130, v131, 7200);

        if (v132 >= v127) {
          unint64_t v133 = v127;
        }
        else {
          unint64_t v133 = v132;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v134 = (id)*MEMORY[0x1E4F1A4F8];
        if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v157 = objc_msgSend_fileDownloadPath(v178, v135, v136);
          objc_msgSend_CKSanitizedPath(v157, v158, v159);
          id v160 = (id)objc_claimAutoreleasedReturnValue();
          int v163 = objc_msgSend_forced(v172, v161, v162);
          long long v164 = @"NO";
          *(_DWORD *)buf = 134219266;
          *(void *)&uint8_t buf[4] = v173;
          *(_WORD *)&buf[12] = 2048;
          if (v163) {
            long long v164 = @"YES";
          }
          *(void *)&buf[14] = v170;
          *(_WORD *)&buf[22] = 2114;
          id v218 = v160;
          __int16 v219 = 2114;
          v220 = v164;
          __int16 v221 = 2048;
          unint64_t v222 = v127;
          __int16 v223 = 2048;
          unint64_t v224 = v133;
          _os_log_debug_impl(&dword_1C4CFF000, v134, OS_LOG_TYPE_DEBUG, "Evicting %llu files (%llu bytes) at %{public}@ (forced:%{public}@, gracePeriod:%lu, gracePeriodOnHighWatermark:%lu)", buf, 0x3Eu);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        id v218 = 0;
        uint64_t v198 = 0;
        v199 = &v198;
        uint64_t v200 = 0x2020000000;
        unint64_t v201 = v173;
        uint64_t v194 = 0;
        v195 = &v194;
        uint64_t v196 = 0x2020000000;
        unint64_t v197 = v170;
        id v137 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
        assetHandleTable = v178->_assetHandleTable;
        v181[0] = MEMORY[0x1E4F143A8];
        v181[1] = 3221225472;
        v181[2] = sub_1C4F14860;
        v181[3] = &unk_1E64F6210;
        v181[4] = v178;
        id v139 = v137;
        id v182 = v139;
        id v140 = v172;
        char v193 = v122;
        id v183 = v140;
        v185 = &v198;
        v186 = &v194;
        unint64_t v189 = v127;
        unint64_t v190 = v133;
        id v184 = v174;
        v187 = buf;
        v188 = &v213;
        unint64_t v191 = v173;
        unint64_t v192 = v170;
        id v142 = (id)objc_msgSend_performTransaction_(assetHandleTable, v141, (uint64_t)v181);
        if (objc_msgSend_clearRegisteredItems(v140, v143, v144))
        {
          v145 = v178->_assetHandleTable;
          v179[0] = MEMORY[0x1E4F143A8];
          v179[1] = 3221225472;
          v179[2] = sub_1C4F150CC;
          v179[3] = &unk_1E64F2090;
          v179[4] = v178;
          id v180 = v140;
          id v147 = (id)objc_msgSend_performTransaction_(v145, v146, (uint64_t)v179);
        }
        v148 = [CKDAssetCacheEvictionResult alloc];
        long long v57 = objc_msgSend_initWithBytesCount_purgedBytesCount_purgeableByteCount_filesCount_purgedFilesCount_purgeableFilesCount_(v148, v149, v170, v214[3], v195[3], v173, *(void *)(*(void *)&buf[8] + 24), v199[3]);

        _Block_object_dispose(&v194, 8);
        _Block_object_dispose(&v198, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v52 = (id)*MEMORY[0x1E4F1A4F8];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          v153 = objc_msgSend_fileDownloadPath(v178, v53, v54);
          v156 = objc_msgSend_CKSanitizedPath(v153, v154, v155);
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v173;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v170;
          *(_WORD *)&buf[22] = 2114;
          id v218 = v156;
          _os_log_debug_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_DEBUG, "Skipped evicting %llu files (%llu bytes) at %{public}@", buf, 0x20u);
        }
        uint64_t v55 = [CKDAssetCacheEvictionResult alloc];
        long long v57 = objc_msgSend_initWithBytesCount_purgedBytesCount_purgeableByteCount_filesCount_purgedFilesCount_purgeableFilesCount_(v55, v56, 0, 0, 0, 0, 0, 0);
      }
      goto LABEL_71;
    }
LABEL_28:
    long long v57 = 0;
    goto LABEL_72;
  }

  long long v57 = 0;
LABEL_71:

LABEL_72:
  _Block_object_dispose(&v213, 8);

  return v57;
}

- (id)_evictAllFilesForced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend_mmcsEngineContext(self, a2, a3);
  objc_msgSend_assertMMCSSerialized(v5, v6, v7);

  uint64_t v8 = [CKDAssetCacheEvictionInfo alloc];
  uint64_t v10 = objc_msgSend_initWithForced_(v8, v9, v3);
  uint64_t v12 = objc_msgSend__evictWithEvictionInfo_(self, v11, (uint64_t)v10);
  objc_msgSend_unregisterItemIDsAndDeleteAssetHandlesWithEvictionInfo_(self, v13, (uint64_t)v10);

  return v12;
}

- (id)evictAllFilesForced:(BOOL)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4F07418;
  uint64_t v15 = sub_1C4F07428;
  id v16 = 0;
  uint64_t v5 = objc_msgSend_mmcsEngineContext(self, a2, a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4F15488;
  v9[3] = &unk_1E64F0D28;
  v9[4] = self;
  v9[5] = &v11;
  BOOL v10 = a3;
  objc_msgSend_MMCSSerializeSyncRecursive_(v5, v6, (uint64_t)v9);

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void)_expireAssetHandlesWithExpiryDate:(id)a3
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_mmcsEngineContext(self, v5, v6);
  objc_msgSend_assertMMCSSerialized(v7, v8, v9);

  BOOL v10 = [CKDAssetCacheEvictionInfo alloc];
  uint64_t v12 = objc_msgSend_initWithForced_(v10, v11, 0);
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  v49[0] = @"EXPIRYDATE";
  v49[1] = @"NOT_REGISTERED";
  v50[0] = v4;
  v50[1] = &unk_1F20AC888;
  uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v50, v49, 2);
  uint64_t v16 = objc_msgSend_deleteEntriesMatching_label_error_predicate_(self->_assetHandleTable, v15, (uint64_t)v14, off_1E64F6230, 0, &unk_1F2044150);
  v40[3] = v16;
  assetHandleTable = self->_assetHandleTable;
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  uint64_t v33 = sub_1C4F157DC;
  uint64_t v34 = &unk_1E64F6268;
  id v18 = v4;
  id v35 = v18;
  id v36 = self;
  BOOL v38 = &v39;
  id v19 = v12;
  id v37 = v19;
  id v21 = (id)objc_msgSend_performTransaction_(assetHandleTable, v20, (uint64_t)&v31);
  id v22 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend_setDateFormat_(v22, v23, @"yyyy-MM-dd HH:mm:ss", v31, v32, v33, v34);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v24 = (id)*MEMORY[0x1E4F1A4F8];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = v40[3];
    uint64_t v28 = objc_msgSend_applicationBundleID(self, v25, v26);
    uint64_t v30 = objc_msgSend_stringFromDate_(v22, v29, (uint64_t)v18);
    *(_DWORD *)buf = 134218498;
    uint64_t v44 = v27;
    __int16 v45 = 2114;
    id v46 = v28;
    __int16 v47 = 2112;
    uint64_t v48 = v30;
    _os_log_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_INFO, "Expired %lu asset handles for %{public}@ with lastUsedTime before \"%@\"", buf, 0x20u);
  }
  _Block_object_dispose(&v39, 8);
}

- (void)expireAssetHandlesIfNecessary
{
  id v4 = objc_msgSend_mmcsEngineContext(self, a2, v2);
  objc_msgSend_assertMMCSSerialized(v4, v5, v6);

  if ((objc_msgSend_didDrop(self, v7, v8) & 1) == 0)
  {
    if (!self->_oldestLastUsedTime)
    {
      objc_msgSend_oldestLastUsedTime(self->_assetHandleTable, v9, v10);
      uint64_t v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
      oldestLastUsedTime = self->_oldestLastUsedTime;
      self->_oldestLastUsedTime = v11;
    }
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v9, v10, -28800.0);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_earlierDate_(self->_oldestLastUsedTime, v13, (uint64_t)v18);
    uint64_t v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = self->_oldestLastUsedTime;

    if (v14 == v15)
    {
      uint64_t v16 = self->_oldestLastUsedTime;
      self->_oldestLastUsedTime = 0;

      objc_msgSend__expireAssetHandlesWithExpiryDate_(self, v17, (uint64_t)v18);
    }
  }
}

- (void)_resetAssetInflight
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_mmcsEngineContext(self, a2, v2);
  objc_msgSend_assertMMCSSerialized(v5, v6, v7);

  if (objc_msgSend_didDrop(self, v8, v9))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v17 = (void *)*MEMORY[0x1E4F1A4F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A4F8], OS_LOG_TYPE_ERROR))
    {
      id v18 = v17;
      id v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      char v23 = self;
      __int16 v24 = 2114;
      uint64_t v25 = v19;
      _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDAssetCache _resetAssetInflight]", "CKDAssetCache.m", 2040, "0 && \"already dropped\"");
  }
  uint64_t v12 = objc_msgSend_MMCS(self, v10, v11);
  if (!v12) {
    __assert_rtn("-[CKDAssetCache _resetAssetInflight]", "CKDAssetCache.m", 2042, "MMCS && \"nil MMCS object\"");
  }
  assetHandleTable = self->_assetHandleTable;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C4F15DCC;
  v20[3] = &unk_1E64F2090;
  v20[4] = self;
  id v21 = v12;
  id v14 = v12;
  id v16 = (id)objc_msgSend_performTransaction_(assetHandleTable, v15, (uint64_t)v20);
}

- (void)setupPersistentStateAtStartup
{
  uint64_t v5 = objc_msgSend_mmcsEngineContext(self, a2, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4F16230;
  v7[3] = &unk_1E64F1998;
  v7[4] = self;
  v7[5] = a2;
  objc_msgSend_MMCSSerializeSyncRecursive_(v5, v6, (uint64_t)v7);
}

- (CKDMMCS)MMCS
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_MMCS);
  return (CKDMMCS *)WeakRetained;
}

- (void)setMMCS:(id)a3
{
}

- (BOOL)isNewEmptyCache
{
  return self->_isNewEmptyCache;
}

- (CKDAssetCacheTableGroup)assetCacheTableGroup
{
  return self->_assetCacheTableGroup;
}

- (CKDAssetHandleTable)assetHandleTable
{
  return self->_assetHandleTable;
}

- (CKDAssetVolumeTable)assetVolumeTable
{
  return self->_assetVolumeTable;
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (CKDDirectoryContext)directoryContext
{
  return self->_directoryContext;
}

- (void)setDirectoryContext:(id)a3
{
}

- (BOOL)isEvictionScheduled
{
  return self->_isEvictionScheduled;
}

- (void)setIsEvictionScheduled:(BOOL)a3
{
  self->_isEvictionScheduled = a3;
}

- (BOOL)didDrop
{
  return self->_didDrop;
}

- (void)setDidDrop:(BOOL)a3
{
  self->_didDrop = a3;
}

- (int64_t)checkoutCount
{
  return self->_checkoutCount;
}

- (void)setCheckoutCount:(int64_t)a3
{
  self->_checkoutCount = a3;
}

- (NSDate)oldestLastUsedTime
{
  return self->_oldestLastUsedTime;
}

- (void)setOldestLastUsedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestLastUsedTime, 0);
  objc_storeStrong((id *)&self->_directoryContext, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_assetVolumeTable, 0);
  objc_storeStrong((id *)&self->_assetHandleTable, 0);
  objc_storeStrong((id *)&self->_assetCacheTableGroup, 0);
  objc_destroyWeak((id *)&self->_MMCS);
  objc_storeStrong((id *)&self->_clonedFileCache, 0);
}

@end