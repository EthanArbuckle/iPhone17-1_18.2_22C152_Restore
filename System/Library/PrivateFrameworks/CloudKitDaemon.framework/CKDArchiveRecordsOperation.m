@interface CKDArchiveRecordsOperation
- (CKDArchiveRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)recordIDs;
- (id)activityCreate;
- (id)recordArchivedBlock;
- (id)relevantZoneIDs;
- (int)operationType;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleRecordArchived:(id)a3 responseCode:(id)a4;
- (void)main;
- (void)setRecordArchivedBlock:(id)a3;
- (void)setRecordIDs:(id)a3;
@end

@implementation CKDArchiveRecordsOperation

- (CKDArchiveRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDArchiveRecordsOperation;
  v9 = [(CKDDatabaseOperation *)&v13 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_recordIDs(v6, v7, v8);
    recordIDs = v9->_recordIDs;
    v9->_recordIDs = (NSArray *)v10;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/archive-records", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setRecordArchivedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDArchiveRecordsOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (void)_handleRecordArchived:(id)a3 responseCode:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v10 = objc_msgSend_code(v7, v8, v9);
  v11 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v12 = *MEMORY[0x1E4F1A550];
  if (v10 == 1)
  {
    if (v12 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    objc_super v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v6;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Record with ID %@ was successfully archived", buf, 0xCu);
    }
    v16 = 0;
  }
  else
  {
    if (v12 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    v17 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      v21 = objc_msgSend_error(v7, v19, v20);
      v24 = objc_msgSend_errorDescription(v21, v22, v23);
      *(_DWORD *)buf = 138412546;
      id v46 = v6;
      __int16 v47 = 2114;
      v48 = v24;
      _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Error archiving record with ID %@: %{public}@", buf, 0x16u);
    }
    v25 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v26 = *MEMORY[0x1E4F19DD8];
    uint64_t v27 = sub_1C4E94D98(v7);
    v30 = objc_msgSend_request(self, v28, v29);
    v31 = sub_1C4E940D0(v30, v7);
    v34 = objc_msgSend_error(v7, v32, v33);
    v37 = objc_msgSend_errorDescription(v34, v35, v36);
    v16 = objc_msgSend_errorWithDomain_code_userInfo_format_(v25, v38, v26, v27, v31, @"Error archiving record with ID %@: %@", v6, v37);
  }
  v39 = objc_msgSend_callbackQueue(self, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F97884;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v43 = v6;
  id v44 = v16;
  id v40 = v16;
  id v41 = v6;
  dispatch_async(v39, block);
}

- (int)operationType
{
  return 900;
}

- (void)main
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = v3;
    v32 = objc_msgSend_operationID(self, v30, v31);
    v35 = objc_msgSend_recordIDs(self, v33, v34);
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = v32;
    __int16 v45 = 2112;
    id v46 = v35;
    _os_log_debug_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_DEBUG, "Starting archive records operation %{public}@ for record IDs %@", location, 0x16u);
  }
  id v6 = objc_msgSend_recordIDs(self, v4, v5);
  BOOL v9 = objc_msgSend_count(v6, v7, v8) == 0;

  if (v9)
  {
    objc_msgSend_finishWithError_(self, v10, 0);
  }
  else
  {
    v11 = dispatch_group_create();
    uint64_t v12 = [CKDArchiveRecordsURLRequest alloc];
    uint64_t v15 = objc_msgSend_recordIDs(self, v13, v14);
    v17 = objc_msgSend_initWithOperation_recordIDsToArchive_(v12, v16, (uint64_t)self, v15);

    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v17);
    dispatch_group_enter(v11);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1C4F97CC0;
    v41[3] = &unk_1E64F7910;
    objc_copyWeak(&v42, (id *)location);
    objc_msgSend_setRecordArchivedBlock_(v17, v18, (uint64_t)v41);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = sub_1C4F97D38;
    v37[3] = &unk_1E64F33C0;
    objc_copyWeak(&v39, &from);
    objc_copyWeak(&v40, (id *)location);
    v19 = v11;
    v38 = v19;
    objc_msgSend_setCompletionBlock_(v17, v20, (uint64_t)v37);
    objc_msgSend_setRequest_(self, v21, (uint64_t)v17);
    v24 = objc_msgSend_container(self, v22, v23);
    objc_msgSend_performRequest_(v24, v25, (uint64_t)v17);

    v28 = objc_msgSend_callbackQueue(self, v26, v27);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1C4F97DD0;
    v36[3] = &unk_1E64F05C8;
    v36[4] = self;
    dispatch_group_notify(v19, v28, v36);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
}

- (id)relevantZoneIDs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_recordIDs(self, a2, v2);
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
          v16 = objc_msgSend_zoneID(*(void **)(*((void *)&v18 + 1) + 8 * i), v10, v11, (void)v18);
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

- (id)recordArchivedBlock
{
  return self->_recordArchivedBlock;
}

- (void)setRecordArchivedBlock:(id)a3
{
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_recordArchivedBlock, 0);
}

@end