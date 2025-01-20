@interface CKDFetchUserRecordOperation
- (CKRecord)userRecord;
- (id)analyticsPayload;
- (int)operationType;
- (void)fetchRecordsWithIDs:(id)a3 andFullRecords:(id)a4;
- (void)main;
- (void)setUserRecord:(id)a3;
@end

@implementation CKDFetchUserRecordOperation

- (int)operationType
{
  return 400;
}

- (void)fetchRecordsWithIDs:(id)a3 andFullRecords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [CKDFetchUserRecordURLRequest alloc];
  v10 = objc_msgSend_initWithOperation_(v8, v9, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4F95A50;
  v24[3] = &unk_1E64F7878;
  objc_copyWeak(&v25, &location);
  objc_msgSend_setRecordFetchedBlock_(v10, v11, (uint64_t)v24);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4F95AEC;
  v21[3] = &unk_1E64F0170;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  objc_msgSend_setCompletionBlock_(v10, v12, (uint64_t)v21);
  v15 = objc_msgSend_stateTransitionGroup(self, v13, v14);
  dispatch_group_enter(v15);

  objc_msgSend_setRequest_(self, v16, (uint64_t)v10);
  v19 = objc_msgSend_container(self, v17, v18);
  objc_msgSend_performRequest_(v19, v20, (uint64_t)v10);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v9 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    v12 = objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    uint64_t v14 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    v17 = objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    int v18 = 138544130;
    v19 = v7;
    __int16 v20 = 2048;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Starting fetch user record operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);
  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (id)analyticsPayload
{
  v38.receiver = self;
  v38.super_class = (Class)CKDFetchUserRecordOperation;
  v3 = [(CKDDatabaseOperation *)&v38 analyticsPayload];
  v4 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = objc_msgSend_recordIDsToFetch(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);
  v12 = objc_msgSend_numberWithUnsignedInteger_(v4, v11, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, 0x1F2058510);

  uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(self, v15, v16);
  v19 = objc_msgSend_numberWithBool_(v14, v18, AssetContent);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, 0x1F2058530);

  id v23 = objc_msgSend_desiredKeySet(self, v21, v22);
  uint64_t v26 = objc_msgSend_count(v23, v24, v25);

  if (v26)
  {
    v29 = (void *)MEMORY[0x1E4F28ED0];
    v30 = objc_msgSend_desiredKeySet(self, v27, v28);
    uint64_t v33 = objc_msgSend_count(v30, v31, v32);
    v35 = objc_msgSend_numberWithUnsignedInteger_(v29, v34, v33);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v36, (uint64_t)v35, 0x1F2058550);
  }
  return v3;
}

- (CKRecord)userRecord
{
  return self->_userRecord;
}

- (void)setUserRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end