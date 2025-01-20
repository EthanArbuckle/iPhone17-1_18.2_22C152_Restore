@interface CKDFetchRecordVersionsOperation
- (BOOL)isDeleted;
- (BOOL)shouldFetchAssetContent;
- (CKDDecryptRecordsOperation)recordDecryptOperation;
- (CKDFetchRecordVersionsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)desiredKeys;
- (NSArray)recordIDs;
- (NSString)minimumVersionETag;
- (OS_dispatch_group)fetchVersionsGroup;
- (id)activityCreate;
- (id)recordVersionFetchedBlock;
- (id)relevantZoneIDs;
- (int)operationType;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleRecordVersionsFetchedForID:(id)a3 isDeleted:(BOOL)a4 versions:(id)a5 responseCode:(id)a6;
- (void)finishDecryption;
- (void)main;
- (void)setDesiredKeys:(id)a3;
- (void)setFetchVersionsGroup:(id)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setMinimumVersionETag:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)setRecordVersionFetchedBlock:(id)a3;
- (void)setShouldFetchAssetContent:(BOOL)a3;
@end

@implementation CKDFetchRecordVersionsOperation

- (CKDFetchRecordVersionsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKDFetchRecordVersionsOperation;
  v9 = [(CKDDatabaseOperation *)&v33 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v10 = objc_msgSend_recordIDs(v6, v7, v8);
    objc_msgSend_setRecordIDs_(v9, v11, (uint64_t)v10);

    uint64_t v14 = objc_msgSend_desiredKeys(v6, v12, v13);
    if (v14
      && (v17 = (void *)v14,
          objc_msgSend_desiredKeys(v6, v15, v16),
          v18 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = objc_msgSend_count(v18, v19, v20),
          v18,
          v17,
          !v21))
    {
      v34[0] = *MEMORY[0x1E4F19D58];
      uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v34, 1);
    }
    else
    {
      uint64_t v22 = objc_msgSend_desiredKeys(v6, v15, v16);
    }
    desiredKeys = v9->_desiredKeys;
    v9->_desiredKeys = (NSArray *)v22;

    v26 = objc_msgSend_minimumVersionETag(v6, v24, v25);
    objc_msgSend_setMinimumVersionETag_(v9, v27, (uint64_t)v26);

    dispatch_group_t v28 = dispatch_group_create();
    objc_msgSend_setFetchVersionsGroup_(v9, v29, (uint64_t)v28);

    v9->_shouldFetchAssetContent = objc_msgSend_shouldFetchAssetContent(v6, v30, v31);
  }

  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-record-versions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (CKDDecryptRecordsOperation)recordDecryptOperation
{
  os_activity_t v2 = self;
  objc_sync_enter(v2);
  decryptOperation = v2->_decryptOperation;
  if (!decryptOperation || objc_msgSend_isFinished(decryptOperation, v3, v4))
  {
    id v6 = objc_opt_new();
    uint64_t v7 = objc_opt_class();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1C4FB7350;
    v11[3] = &unk_1E64F0210;
    v11[4] = v2;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v2, v8, v7, v6, v11);
  }
  objc_sync_exit(v2);

  v9 = v2->_decryptOperation;
  return v9;
}

- (void)finishDecryption
{
  obj = self;
  objc_sync_enter(obj);
  decryptOperation = obj->_decryptOperation;
  if (decryptOperation && (objc_msgSend_isFinished(decryptOperation, v2, v3) & 1) == 0) {
    objc_msgSend_finishDecryption(obj->_decryptOperation, v5, v6);
  }
  objc_sync_exit(obj);
}

- (void)_handleRecordVersionsFetchedForID:(id)a3 isDeleted:(BOOL)a4 versions:(id)a5 responseCode:(id)a6
{
  BOOL v57 = a4;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v58 = a5;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = sub_1C4FB7BD8;
  v88 = sub_1C4FB7BE8;
  id v89 = 0;
  id v59 = a6;
  int v10 = objc_msgSend_code(v59, v8, v9);
  if (v60 && v10 == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v11 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v54 = objc_msgSend_count(v58, v12, v13);
      v55 = @"false";
      *(_DWORD *)location = 134218498;
      *(void *)&location[4] = v54;
      __int16 v92 = 2114;
      if (v57) {
        v55 = @"true";
      }
      id v93 = v60;
      __int16 v94 = 2114;
      v95 = v55;
      _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Fetched %ld versions for record with ID %{public}@ (is deleted: %{public}@)", location, 0x20u);
    }

    if (objc_msgSend_count(v58, v14, v15))
    {
      v18 = objc_msgSend_fetchVersionsGroup(self, v16, v17);
      dispatch_group_enter(v18);

      objc_initWeak((id *)location, self);
      v19 = dispatch_group_create();
      uint64_t v20 = objc_opt_new();
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id obj = v58;
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v80, v90, 16);
      if (v22)
      {
        uint64_t v23 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v81 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void *)(*((void *)&v80 + 1) + 8 * i);
            dispatch_group_enter(v19);
            dispatch_group_t v28 = objc_msgSend_recordDecryptOperation(self, v26, v27);
            v75[0] = MEMORY[0x1E4F143A8];
            v75[1] = 3221225472;
            v75[2] = sub_1C4FB7BF0;
            v75[3] = &unk_1E64F7EE8;
            objc_copyWeak(&v79, (id *)location);
            id v76 = v20;
            v78 = &v84;
            v77 = v19;
            objc_msgSend_decryptRecord_withCompletion_(v28, v29, v25, v75);

            objc_destroyWeak(&v79);
          }
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v80, v90, 16);
        }
        while (v22);
      }

      uint64_t v31 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4FB7E40;
      block[3] = &unk_1E64F7F38;
      objc_copyWeak(&v73, (id *)location);
      id v32 = v60;
      BOOL v74 = v57;
      id v69 = v32;
      id v70 = v20;
      v72 = &v84;
      v71 = self;
      id v33 = v20;
      dispatch_group_notify(v19, v31, block);

      objc_destroyWeak(&v73);
      objc_destroyWeak((id *)location);
      goto LABEL_21;
    }
  }
  else
  {
    v34 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v35 = sub_1C4E94D98(v59);
    v38 = objc_msgSend_request(self, v36, v37);
    v39 = sub_1C4E940D0(v38, v59);
    v42 = objc_msgSend_error(v59, v40, v41);
    v45 = objc_msgSend_errorDescription(v42, v43, v44);
    uint64_t v47 = objc_msgSend_errorWithDomain_code_userInfo_format_(v34, v46, *MEMORY[0x1E4F19DD8], v35, v39, @"Error fetching versions for record %@ from server: %@", v60, v45);
    v48 = (void *)v85[5];
    v85[5] = v47;

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v49 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v56 = (void *)v85[5];
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v60;
      __int16 v92 = 2112;
      id v93 = v56;
      _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "Failed to fetch versions for record %@: %@", location, 0x16u);
    }
  }
  v50 = objc_msgSend_recordVersionFetchedBlock(self, v16, v17);

  if (v50)
  {
    v53 = objc_msgSend_callbackQueue(self, v51, v52);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = sub_1C4FB7FB4;
    v63[3] = &unk_1E64F7F10;
    v63[4] = self;
    id v64 = v60;
    BOOL v67 = v57;
    id v65 = v58;
    v66 = &v84;
    dispatch_async(v53, v63);
  }
LABEL_21:
  _Block_object_dispose(&v84, 8);
}

- (int)operationType
{
  return 212;
}

- (void)main
{
  uint64_t v4 = objc_msgSend_recordIDs(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    uint64_t v9 = [CKDFetchRecordVersionsRequest alloc];
    v12 = objc_msgSend_recordIDs(self, v10, v11);
    uint64_t v15 = objc_msgSend_desiredKeys(self, v13, v14);
    v18 = objc_msgSend_minimumVersionETag(self, v16, v17);
    uint64_t v20 = objc_msgSend_initWithOperation_recordIDs_desiredKeys_minimumVersionETag_(v9, v19, (uint64_t)self, v12, v15, v18);

    uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v21, v22);
    objc_msgSend_setShouldFetchAssetContent_(v20, v24, AssetContent);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v20);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1C4FB82A8;
    v35[3] = &unk_1E64F7F60;
    objc_copyWeak(&v36, &location);
    objc_msgSend_setRecordVersionsFetchedBlock_(v20, v25, (uint64_t)v35);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1C4FB8344;
    v32[3] = &unk_1E64F0170;
    objc_copyWeak(&v33, &location);
    objc_copyWeak(&v34, &from);
    objc_msgSend_setCompletionBlock_(v20, v26, (uint64_t)v32);
    objc_msgSend_setRequest_(self, v27, (uint64_t)v20);
    v30 = objc_msgSend_container(self, v28, v29);
    objc_msgSend_performRequest_(v30, v31, (uint64_t)v20);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend_finishWithError_(self, v8, 0);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v5 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = v5;
    v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    dispatch_group_t v28 = objc_msgSend_ckShortDescription(self, v26, v27);
    *(_DWORD *)buf = 138544130;
    v38 = v25;
    __int16 v39 = 2048;
    v40 = self;
    __int16 v41 = 2114;
    v42 = v28;
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Fetch record versions operation <%{public}@: %p; %{public}@> finished with error %@",
      buf,
      0x2Au);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v9 = objc_msgSend_recordIDs(self, v7, v8);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v32, v36, 16);
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = objc_msgSend_zoneID(*(void **)(*((void *)&v32 + 1) + 8 * i), v12, v13);
        objc_msgSend_addObject_(v6, v18, (uint64_t)v17);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v32, v36, 16);
    }
    while (v14);
  }

  if (objc_msgSend_count(v6, v19, v20))
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1C4FB8708;
    v30[3] = &unk_1E64F1D18;
    id v31 = v6;
    objc_msgSend_updateCloudKitMetrics_(self, v22, (uint64_t)v30);
  }
  objc_msgSend_setRecordVersionFetchedBlock_(self, v21, 0);
  v29.receiver = self;
  v29.super_class = (Class)CKDFetchRecordVersionsOperation;
  [(CKDOperation *)&v29 _finishOnCallbackQueueWithError:v4];
}

- (id)relevantZoneIDs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_recordIDs(self, a2, v2);
  if (objc_msgSend_count(v3, v4, v5))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v22, 16);
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v16 = objc_msgSend_zoneID(*(void **)(*((void *)&v18 + 1) + 8 * i), v10, v11, (void)v18);
          if (v16) {
            objc_msgSend_addObject_(v6, v15, (uint64_t)v16);
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v18, v22, 16);
      }
      while (v12);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)recordVersionFetchedBlock
{
  return self->_recordVersionFetchedBlock;
}

- (void)setRecordVersionFetchedBlock:(id)a3
{
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (NSString)minimumVersionETag
{
  return self->_minimumVersionETag;
}

- (void)setMinimumVersionETag:(id)a3
{
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchuint64_t AssetContent = a3;
}

- (OS_dispatch_group)fetchVersionsGroup
{
  return self->_fetchVersionsGroup;
}

- (void)setFetchVersionsGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchVersionsGroup, 0);
  objc_storeStrong((id *)&self->_minimumVersionETag, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_recordVersionFetchedBlock, 0);
  objc_storeStrong((id *)&self->_decryptOperation, 0);
}

@end