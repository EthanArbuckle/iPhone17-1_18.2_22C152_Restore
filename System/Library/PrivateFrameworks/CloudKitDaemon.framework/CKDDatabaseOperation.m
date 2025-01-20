@interface CKDDatabaseOperation
- (BOOL)supportsClearAssetEncryption;
- (CKDDatabaseOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (id)CKStatusReportProperties;
- (id)activityCreate;
- (id)analyticsPayload;
- (int64_t)databaseScope;
- (void)_encryptMergeableDeltas:(id)a3 completionHandler:(id)a4;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setPCSData:(id)a3 forFetchedRecordID:(id)a4;
- (void)setPCSData:(id)a3 forFetchedShareID:(id)a4;
- (void)setPCSData:(id)a3 forFetchedZoneID:(id)a4;
- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 container:(id)a6 operationConfigurationBlock:(id)a7;
@end

@implementation CKDDatabaseOperation

- (CKDDatabaseOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)CKDDatabaseOperation;
  v10 = [(CKDOperation *)&v44 initWithOperationInfo:v6 container:v7];
  if (v10)
  {
    v10->_databaseScope = objc_msgSend_databaseScope(v6, v8, v9);
    if (objc_msgSend_databaseScope(v6, v11, v12) == 4)
    {
      objc_msgSend_setUseClearAssetEncryption_(v10, v13, 1);
    }
    else if (objc_msgSend_supportsClearAssetEncryption(v10, v13, v14))
    {
      v17 = objc_msgSend_options(v7, v15, v16);
      int v20 = objc_msgSend_useClearAssetEncryption(v17, v18, v19);

      if (v20)
      {
        v21 = objc_msgSend_containerID(v7, v15, v16);
        uint64_t v24 = objc_msgSend_specialContainerType(v21, v22, v23);

        if (v24 == 15
          || (objc_msgSend_containerID(v7, v25, v26),
              v27 = objc_claimAutoreleasedReturnValue(),
              int isTestContainer = objc_msgSend_isTestContainer(v27, v28, v29),
              v27,
              isTestContainer))
        {
          objc_msgSend_setUseClearAssetEncryption_(v10, v25, 1);
        }
        if ((objc_msgSend_useClearAssetEncryption(v10, v25, v31) & 1) == 0)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v32 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
          {
            v37 = v32;
            v40 = objc_msgSend_applicationBundleID(v7, v38, v39);
            v43 = objc_msgSend_containerID(v7, v41, v42);
            *(_DWORD *)buf = 138543618;
            v46 = v40;
            __int16 v47 = 2114;
            v48 = v43;
            _os_log_fault_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_FAULT, "Unauthorized client (%{public}@) is trying to use clear asset encryption in container (%{public}@)", buf, 0x16u);
          }
        }
      }
    }
    if (objc_msgSend_databaseScope(v6, v15, v16) == 1
      || objc_msgSend_databaseScope(v6, v33, v34) == 4
      || objc_msgSend_useClearAssetEncryption(v10, v33, v35))
    {
      objc_msgSend_setUseEncryption_(v10, v33, 0);
    }
  }

  return v10;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/db-operation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)spawnAndRunOperationOfClass:(Class)a3 operationInfo:(id)a4 spawnQueue:(id)a5 container:(id)a6 operationConfigurationBlock:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v18 = objc_msgSend_databaseScope(self, v16, v17);
  objc_msgSend_setDatabaseScope_(v15, v19, v18);
  v20.receiver = self;
  v20.super_class = (Class)CKDDatabaseOperation;
  [(CKDOperation *)&v20 spawnAndRunOperationOfClass:a3 operationInfo:v15 spawnQueue:v14 container:v13 operationConfigurationBlock:v12];
}

- (id)CKStatusReportProperties
{
  v12.receiver = self;
  v12.super_class = (Class)CKDDatabaseOperation;
  v3 = [(CKDOperation *)&v12 CKStatusReportProperties];
  v4 = NSString;
  objc_msgSend_databaseScope(self, v5, v6);
  id v7 = CKDatabaseScopeString();
  uint64_t v9 = objc_msgSend_stringWithFormat_(v4, v8, @"scope: %@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  return v3;
}

- (id)analyticsPayload
{
  v12.receiver = self;
  v12.super_class = (Class)CKDDatabaseOperation;
  v3 = [(CKDOperation *)&v12 analyticsPayload];
  v4 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v7 = objc_msgSend_databaseScope(self, v5, v6);
  uint64_t v9 = objc_msgSend_numberWithInteger_(v4, v8, v7);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, 0x1F2045190);

  return v3;
}

- (BOOL)supportsClearAssetEncryption
{
  return 0;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (void)setPCSData:(id)a3 forFetchedRecordID:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
    dispatch_group_enter(v10);
    id v13 = objc_msgSend_container(self, v11, v12);
    uint64_t v16 = objc_msgSend_pcsCache(v13, v14, v15);
    uint64_t v19 = objc_msgSend_databaseScope(self, v17, v18);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1C4FF1AF8;
    v22[3] = &unk_1E64F08D0;
    uint64_t v23 = v10;
    objc_super v20 = v10;
    objc_msgSend__setPCSData_forFetchedRecordID_withScope_withCompletionHandler_(v16, v21, (uint64_t)v7, v6, v19, v22);
  }
}

- (void)setPCSData:(id)a3 forFetchedZoneID:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
    dispatch_group_enter(v10);
    id v13 = objc_msgSend_container(self, v11, v12);
    uint64_t v16 = objc_msgSend_pcsCache(v13, v14, v15);
    uint64_t v19 = objc_msgSend_databaseScope(self, v17, v18);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1C4FF1C14;
    v22[3] = &unk_1E64F08D0;
    uint64_t v23 = v10;
    objc_super v20 = v10;
    objc_msgSend__setPCSData_forFetchedZoneID_withScope_withCompletionHandler_(v16, v21, (uint64_t)v7, v6, v19, v22);
  }
}

- (void)setPCSData:(id)a3 forFetchedShareID:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
    dispatch_group_enter(v10);
    id v13 = objc_msgSend_container(self, v11, v12);
    uint64_t v16 = objc_msgSend_pcsCache(v13, v14, v15);
    uint64_t v19 = objc_msgSend_databaseScope(self, v17, v18);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1C4FF1D30;
    v22[3] = &unk_1E64F08D0;
    uint64_t v23 = v10;
    objc_super v20 = v10;
    objc_msgSend__setPCSData_forFetchedShareID_withScope_withCompletionHandler_(v16, v21, (uint64_t)v7, v6, v19, v22);
  }
}

- (void)_encryptMergeableDeltas:(id)a3 completionHandler:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  __int16 v47 = sub_1C503D304;
  v48 = sub_1C503D314;
  id v49 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1C503D31C;
  v43[3] = &unk_1E64F8C28;
  v43[4] = &v44;
  uint64_t v9 = objc_msgSend_CKCompactReduceIntoDictionary_(v6, v8, (uint64_t)v43);
  uint64_t v12 = v9;
  if (v45[5])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v13 = (id)*MEMORY[0x1E4F1A510];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = objc_msgSend_operationID(self, v14, v15);
      uint64_t v32 = v45[5];
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v31;
      __int16 v51 = 2112;
      uint64_t v52 = v32;
      _os_log_error_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_ERROR, "Invalid encrypted deltas for operation %{public}@: %@", location, 0x16u);
    }
    if (v7)
    {
      uint64_t v16 = v45[5];
LABEL_8:
      v7[2](v7, v16);
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend_count(v9, v10, v11);
    uint64_t v18 = (void *)*MEMORY[0x1E4F1A548];
    if (v17)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v18);
      }
      uint64_t v19 = (id)*MEMORY[0x1E4F1A510];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v33 = objc_msgSend_operationID(self, v20, v21);
        *(_DWORD *)location = 138543362;
        *(void *)&location[4] = v33;
        _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Will encrypt deltas for operation %{public}@", location, 0xCu);
      }
      objc_initWeak((id *)location, self);
      dispatch_group_t v22 = dispatch_group_create();
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_1C503D440;
      v38[3] = &unk_1E64F8C78;
      uint64_t v23 = v22;
      uint64_t v39 = v23;
      v40 = self;
      objc_copyWeak(&v42, (id *)location);
      v41 = &v44;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v24, (uint64_t)v38);
      v27 = objc_msgSend_callbackQueue(self, v25, v26);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = sub_1C503D95C;
      v35[3] = &unk_1E64F8CA0;
      v35[4] = self;
      v36 = v7;
      v37 = &v44;
      dispatch_group_notify(v23, v27, v35);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)location);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v18);
      }
      v28 = (id)*MEMORY[0x1E4F1A510];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = objc_msgSend_operationID(self, v29, v30);
        *(_DWORD *)location = 138543362;
        *(void *)&location[4] = v34;
        _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "No deltas to encrypt for operation %{public}@", location, 0xCu);
      }
      if (v7)
      {
        uint64_t v16 = 0;
        goto LABEL_8;
      }
    }
  }

  _Block_object_dispose(&v44, 8);
}

@end