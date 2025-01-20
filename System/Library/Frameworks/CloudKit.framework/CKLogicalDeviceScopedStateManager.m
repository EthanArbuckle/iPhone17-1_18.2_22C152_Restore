@interface CKLogicalDeviceScopedStateManager
- (CKLogicalDeviceContext)deviceContext;
- (CKLogicalDeviceScopedStateManager)initWithDeviceContext:(id)a3;
- (NSMapTable)assetsByUUID;
- (NSMutableSet)completedLongLivedOperationIDs;
- (NSMutableSet)outstandingOperationIDs;
- (id)trackedAssetForUUID:(id)a3;
- (void)addThrottle:(id)a3;
- (void)openFileWithOpenInfo:(id)a3 reply:(id)a4;
- (void)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 reply:(id)a6;
- (void)registerLongLivedOperationWithIDAsCompleted:(id)a3 allowResumingCompletedLongLivedOperations:(BOOL)a4;
- (void)registerLongLivedOperationWithIDAsOutstanding:(id)a3;
- (void)resetThrottles;
- (void)trackAssets:(id)a3;
@end

@implementation CKLogicalDeviceScopedStateManager

- (CKLogicalDeviceScopedStateManager)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKLogicalDeviceScopedStateManager;
  v8 = [(CKLogicalDeviceScopedStateManager *)&v16 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E4F28E10], v5, v6, v7);
    assetsByUUID = v8->_assetsByUUID;
    v8->_assetsByUUID = (NSMapTable *)v9;

    uint64_t v11 = objc_opt_new();
    outstandingOperationIDs = v8->_outstandingOperationIDs;
    v8->_outstandingOperationIDs = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_new();
    completedLongLivedOperationIDs = v8->_completedLongLivedOperationIDs;
    v8->_completedLongLivedOperationIDs = (NSMutableSet *)v13;

    objc_storeWeak((id *)&v8->_deviceContext, v4);
  }

  return v8;
}

- (void)trackAssets:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_assetsByUUID(self, v5, v6, v7);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          v20 = objc_msgSend_UUID(v13, v14, v15, v16);
          if (!v20)
          {
            v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18, v19);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, @"CKLogicalDeviceScopedStateManager.m", 56, @"Expected non-nil UUID for %@", v13);
          }
          v21 = objc_msgSend_assetsByUUID(self, v17, v18, v19);
          objc_msgSend_setObject_forKey_(v21, v22, (uint64_t)v13, (uint64_t)v20);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v10);
  }

  objc_sync_exit(obj);
}

- (id)trackedAssetForUUID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_assetsByUUID(self, v5, v6, v7);
  objc_sync_enter(v8);
  uint64_t v12 = objc_msgSend_assetsByUUID(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_objectForKey_(v12, v13, (uint64_t)v4, v14);

  objc_sync_exit(v8);

  return v15;
}

- (void)registerLongLivedOperationWithIDAsOutstanding:(id)a3
{
  long long v29 = (char *)a3;
  if (!v29)
  {
    v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)self, @"CKLogicalDeviceScopedStateManager.m", 69, @"Expected a non-nil operationID to register");
  }
  id v8 = objc_msgSend_outstandingOperationIDs(self, v5, v6, v7);
  objc_sync_enter(v8);
  uint64_t v12 = objc_msgSend_outstandingOperationIDs(self, v9, v10, v11);
  int v15 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v29, v14);

  if (v15)
  {
    long long v28 = objc_msgSend_initWithCode_format_([CKException alloc], v29, 12, @"Long-lived operation %@ attempted to start, but another instance of it is already running. Your code should only fetch and re-enqueue long-lived operations on app launch.", v29);
    goto LABEL_11;
  }
  if (CKCurrentProcessLinkCheck5dbf91c3fd1d871f0bcfe60afeb451e3e708d350())
  {
    uint64_t v19 = objc_msgSend_completedLongLivedOperationIDs(self, v16, v17, v18);
    int v22 = objc_msgSend_containsObject_(v19, v20, (uint64_t)v29, v21);

    if (v22)
    {
      long long v28 = objc_msgSend_initWithCode_format_([CKException alloc], v29, 12, @"Long-lived operation %@ attempted to start, but another instance of it had already completed in this process. Your code should only fetch and re-enqueue long-lived operations on app launch.", v29);
LABEL_11:
      objc_exception_throw(v28);
    }
  }
  v23 = objc_msgSend_outstandingOperationIDs(self, v16, v17, v18);
  objc_msgSend_addObject_(v23, v24, (uint64_t)v29, v25);

  objc_sync_exit(v8);
}

- (void)registerLongLivedOperationWithIDAsCompleted:(id)a3 allowResumingCompletedLongLivedOperations:(BOOL)a4
{
  id v43 = a3;
  if (!v43)
  {
    v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, @"CKLogicalDeviceScopedStateManager.m", 83, @"Expected a non-nil operationID to mark as completed");
  }
  uint64_t v10 = objc_msgSend_outstandingOperationIDs(self, v7, v8, v9);
  objc_sync_enter(v10);
  uint64_t v14 = objc_msgSend_outstandingOperationIDs(self, v11, v12, v13);
  char v17 = objc_msgSend_containsObject_(v14, v15, (uint64_t)v43, v16);

  if ((v17 & 1) == 0)
  {
    v39 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, (uint64_t)self, @"CKLogicalDeviceScopedStateManager.m", 86, @"Asked to unregister unknown operation %@", v43);
  }
  uint64_t v21 = objc_msgSend_completedLongLivedOperationIDs(self, v18, v19, v20);
  int v24 = objc_msgSend_containsObject_(v21, v22, (uint64_t)v43, v23);

  if (v24)
  {
    v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v25, v26, v27);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, (uint64_t)self, @"CKLogicalDeviceScopedStateManager.m", 87, @"Asked to re-register completed long-lived operation %@", v43);
  }
  long long v28 = objc_msgSend_outstandingOperationIDs(self, v25, v26, v27);
  objc_msgSend_removeObject_(v28, v29, (uint64_t)v43, v30);

  if (!a4)
  {
    v34 = objc_msgSend_completedLongLivedOperationIDs(self, v31, v32, v33);
    objc_msgSend_addObject_(v34, v35, (uint64_t)v43, v36);
  }
  objc_sync_exit(v10);
}

- (void)openFileWithOpenInfo:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v13 = objc_msgSend_UUID(v6, v8, v9, v10);
  if (v13)
  {
    int v15 = objc_msgSend_trackedAssetForUUID_(self, v11, (uint64_t)v13, v12);
    if (!v15) {
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (int RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v15, v16, v17, v18),
          RawEncryptedData != objc_msgSend_shouldReadRawEncryptedData(v6, v20, v21, v22)))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, @"CKInternalErrorDomain", 1017, 0);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v7) {
        v7[2](v7, 0, v23);
      }
      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v31 = 0;
      uint64_t v25 = (id *)&v31;
      uint64_t v26 = objc_msgSend_openWithError_(v15, v14, (uint64_t)&v31, v24);
    }
    else
    {
LABEL_12:
      uint64_t v30 = 0;
      uint64_t v25 = (id *)&v30;
      uint64_t v26 = objc_msgSend_openWithOpenInfo_error_(CKAsset, v14, (uint64_t)v6, (uint64_t)&v30);
    }
    uint64_t v27 = (void *)v26;
    id v23 = *v25;
    if (!v27)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      long long v29 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v33 = v6;
        __int16 v34 = 2112;
        id v35 = v23;
        _os_log_debug_impl(&dword_18AF10000, v29, OS_LOG_TYPE_DEBUG, "Failed to open %@: %@", buf, 0x16u);
        if (!v7) {
          goto LABEL_24;
        }
      }
      else if (!v7)
      {
        goto LABEL_24;
      }
      v7[2](v7, 0, v23);
      goto LABEL_24;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    long long v28 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_debug_impl(&dword_18AF10000, v28, OS_LOG_TYPE_DEBUG, "Opened %@", buf, 0xCu);
      if (!v7) {
        goto LABEL_24;
      }
    }
    else if (!v7)
    {
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    ((void (**)(id, void *, id))v7)[2](v7, v27, 0);
    goto LABEL_24;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, @"CKInternalErrorDomain", 1017, 0);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v7) {
    v7[2](v7, 0, v23);
  }
LABEL_26:
}

- (void)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 reply:(id)a6
{
  v45 = (char *)a3;
  uint64_t v12 = (void (**)(id, void *, void))a6;
  if (v45)
  {
    objc_msgSend_trackedAssetForUUID_(self, v10, (uint64_t)v45, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v13;
        if (objc_msgSend_shouldReadAssetContentUsingClientProxy(v13, v14, v15, v16)
          && (objc_msgSend_assetContent(v13, v17, v18, v19),
              uint64_t v20 = objc_claimAutoreleasedReturnValue(),
              v20,
              v20))
        {
          uint64_t v24 = objc_msgSend_assetContent(v13, v21, v22, v23);
          unint64_t v28 = objc_msgSend_length(v24, v25, v26, v27);

          if (v28 >= a4)
          {
            __int16 v34 = objc_msgSend_assetContent(v13, v29, v30, v31);
            unint64_t v38 = objc_msgSend_length(v34, v35, v36, v37) - a4;

            if (v38 < a5) {
              a5 = v38;
            }
            v42 = objc_msgSend_assetContent(v13, v39, v40, v41);
            id v33 = objc_msgSend_subdataWithRange_(v42, v43, a4, a5);

            if (v33)
            {
              if (v12) {
                v12[2](v12, v33, 0);
              }
            }
            else
            {
              v44 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, @"CKInternalErrorDomain", 1017, @"Failed to read data for asset with UUID: %@", v45);
              if (v12) {
                ((void (**)(id, void *, void *))v12)[2](v12, 0, v44);
              }

              id v33 = 0;
            }
            goto LABEL_16;
          }
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, @"CKInternalErrorDomain", 1017, @"Requested offset is greater than content length for asset with UUID: %@", v45);
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, @"CKInternalErrorDomain", 1017, @"Asset is not initialized for in-memory upload for UUID: %@", v45);
        id v33 = };
        if (v12) {
          ((void (**)(id, void *, void *))v12)[2](v12, 0, v33);
        }
LABEL_16:

        goto LABEL_17;
      }
    }
    uint64_t v32 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, @"CKInternalErrorDomain", 1017, @"Could not find tracked asset with UUID: %@", v45);
    if (v12) {
      ((void (**)(id, void *, void *))v12)[2](v12, 0, v32);
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, @"CKInternalErrorDomain", 1017, @"nil UUID");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12) {
      ((void (**)(id, void *, id))v12)[2](v12, 0, v13);
    }
  }
LABEL_17:
}

- (void)resetThrottles
{
  objc_msgSend_deviceContext(self, a2, v2, v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_throttleManager(v11, v4, v5, v6);
  objc_msgSend_resetThrottles(v7, v8, v9, v10);
}

- (void)addThrottle:(id)a3
{
  id v4 = a3;
  objc_msgSend_deviceContext(self, v5, v6, v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = objc_msgSend_throttleManager(v14, v8, v9, v10);
  objc_msgSend_addThrottle_(v11, v12, (uint64_t)v4, v13);
}

- (NSMapTable)assetsByUUID
{
  return self->_assetsByUUID;
}

- (CKLogicalDeviceContext)deviceContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceContext);

  return (CKLogicalDeviceContext *)WeakRetained;
}

- (NSMutableSet)completedLongLivedOperationIDs
{
  return self->_completedLongLivedOperationIDs;
}

- (NSMutableSet)outstandingOperationIDs
{
  return self->_outstandingOperationIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingOperationIDs, 0);
  objc_storeStrong((id *)&self->_completedLongLivedOperationIDs, 0);
  objc_destroyWeak((id *)&self->_deviceContext);

  objc_storeStrong((id *)&self->_assetsByUUID, 0);
}

@end