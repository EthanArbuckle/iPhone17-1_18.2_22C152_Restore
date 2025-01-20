@interface CKDFetchMergeableDeltasURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (CKDFetchMergeableDeltasURLRequest)initWithOperation:(id)a3 mergeableValueIDs:(id)a4 previousContinuationTokens:(id)a5;
- (NSArray)mergeableValueIDs;
- (NSDictionary)previousContinuationTokens;
- (NSMutableDictionary)mergeableValueIDsByRequestID;
- (id)anonymousUserIDForHTTPHeader;
- (id)deltasFetchedBlock;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setDeltasFetchedBlock:(id)a3;
- (void)setMergeableValueIDs:(id)a3;
- (void)setMergeableValueIDsByRequestID:(id)a3;
@end

@implementation CKDFetchMergeableDeltasURLRequest

- (CKDFetchMergeableDeltasURLRequest)initWithOperation:(id)a3 mergeableValueIDs:(id)a4 previousContinuationTokens:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CKDFetchMergeableDeltasURLRequest;
  v12 = [(CKDURLRequest *)&v24 initWithOperation:a3];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v10, v11);
    mergeableValueIDs = v12->_mergeableValueIDs;
    v12->_mergeableValueIDs = (NSArray *)v13;

    uint64_t v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16);
    mergeableValueIDsByRequestID = v12->_mergeableValueIDsByRequestID;
    v12->_mergeableValueIDsByRequestID = (NSMutableDictionary *)v17;

    uint64_t v21 = objc_msgSend_copy(v9, v19, v20);
    previousContinuationTokens = v12->_previousContinuationTokens;
    v12->_previousContinuationTokens = (NSDictionary *)v21;
  }
  return v12;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchMergeableDeltasURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = objc_msgSend_mergeableValueIDs(self, v6, v7, v15.receiver, v15.super_class);
  uint64_t v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  uint64_t v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"mvIDs");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_mergeableValueIDs(self, v5, v6);
  objc_msgSend_setFetchMergeableValueIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchMergeableDeltasURLRequest;
  [(CKDURLRequest *)&v9 fillOutRequestProperties:v4];
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)zoneIDsToLock
{
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_mergeableValueIDs(self, v4, v5);
  id v8 = objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1F20449D0);
  objc_msgSend_addObjectsFromArray_(v3, v9, (uint64_t)v8);

  v12 = objc_msgSend_allObjects(v3, v10, v11);

  return v12;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)anonymousUserIDForHTTPHeader
{
  v3 = objc_msgSend_zoneIDsToLock(self, a2, v2);
  uint64_t v6 = objc_msgSend_firstObject(v3, v4, v5);
  objc_super v9 = objc_msgSend_anonymousCKUserID(v6, v7, v8);

  return v9;
}

- (id)generateRequestOperations
{
  id v4 = objc_msgSend_mergeableValueIDs(self, a2, v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4FE79B4;
  v8[3] = &unk_1E64F8588;
  v8[4] = self;
  uint64_t v6 = objc_msgSend_CKCompactMap_(v4, v5, (uint64_t)v8);

  return v6;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_mergeableValueIDsByRequestID(self, v6, v7);
  uint64_t v11 = objc_msgSend_response(v5, v9, v10);
  v14 = objc_msgSend_operationUUID(v11, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);

  if (!v16)
  {
    v59 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v60, (uint64_t)a2, self, @"CKDFetchMergeableDeltasURLRequest.m", 119, @"Expected non-nil mergeable ID for response %@", v5);
  }
  v19 = objc_opt_new();
  if (objc_msgSend_hasMergeableDeltaRetrieveResponse(v5, v20, v21))
  {
    id v63 = v5;
    objc_super v24 = objc_msgSend_mergeableDeltaRetrieveResponse(v5, v22, v23);
    objc_msgSend_continuation(v24, v25, v26);
    uint64_t v62 = v61 = v24;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    objc_msgSend_deltas(v24, v27, v28);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v67, v75, 16);
    if (v30)
    {
      uint64_t v33 = v30;
      v34 = 0;
      uint64_t v35 = *(void *)v68;
      uint64_t v64 = *MEMORY[0x1E4F19DD8];
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v68 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void *)(*((void *)&v67 + 1) + 8 * v36);
          v38 = self;
          v39 = objc_msgSend_translator(self, v31, v32);
          id v66 = v34;
          v40 = v16;
          v42 = objc_msgSend_mergeableDeltaFromPDelta_valueID_error_(v39, v41, v37, v16, &v66);
          id v43 = v66;

          if (v42)
          {
            objc_msgSend_addObject_(v19, v44, (uint64_t)v42);
          }
          else
          {
            if (!v43)
            {
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v44, v64, 1000, @"Failed to load fetched delta");
              id v43 = (id)objc_claimAutoreleasedReturnValue();
            }
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v45 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v72 = v40;
              __int16 v73 = 2112;
              id v74 = v43;
              _os_log_error_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_ERROR, "Failed to load fetched delta for mergeable %@: %@", buf, 0x16u);
            }
          }
          v34 = v43;

          ++v36;
          uint64_t v16 = v40;
          self = v38;
        }
        while (v33 != v36);
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v67, v75, 16);
      }
      while (v33);
    }
    else
    {
      v34 = 0;
    }

    v49 = (void *)v62;
    id v5 = v63;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v46 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_FAULT, "Expected MergeableDeltaRetrieveResponse for MergeableDeltaRetrieveRequest", buf, 2u);
    }
    v49 = 0;
    v34 = 0;
  }
  v50 = objc_msgSend_deltasFetchedBlock(self, v47, v48);

  if (v50)
  {
    objc_msgSend_deltasFetchedBlock(self, v51, v52);
    v53 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_result(v5, v54, v55);
    ((void (**)(void, void *, void *, void *, void *))v53)[2](v53, v16, v19, v49, v56);
  }
  id v57 = v34;

  return v57;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v33 = v6;
    uint64_t v36 = objc_msgSend_requestUUID(self, v34, v35);
    *(_DWORD *)buf = 138412546;
    v40 = v36;
    __int16 v41 = 2112;
    id v42 = v5;
    _os_log_error_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_ERROR, "Node failure in atom sync request %@: %@", buf, 0x16u);
  }
  objc_super v9 = objc_msgSend_response(v5, v7, v8);
  v12 = objc_msgSend_operationUUID(v9, v10, v11);

  if (v12)
  {
    objc_super v15 = objc_msgSend_mergeableValueIDsByRequestID(self, v13, v14);
    uint64_t v18 = objc_msgSend_response(v5, v16, v17);
    uint64_t v21 = objc_msgSend_operationUUID(v18, v19, v20);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v15, v22, (uint64_t)v21);

    if (!v23)
    {
      uint64_t v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v24, v25);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, self, @"CKDFetchMergeableDeltasURLRequest.m", 158, @"Expected non-nil mergeable ID for response %@", v5);
    }
    uint64_t v26 = objc_msgSend_deltasFetchedBlock(self, v24, v25);

    if (v26)
    {
      objc_msgSend_deltasFetchedBlock(self, v27, v28);
      v29 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v32 = objc_msgSend_result(v5, v30, v31);
      ((void (**)(void, void *, void, void, void *))v29)[2](v29, v23, 0, 0, v32);
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
}

- (NSDictionary)previousContinuationTokens
{
  return self->_previousContinuationTokens;
}

- (id)deltasFetchedBlock
{
  return self->_deltasFetchedBlock;
}

- (void)setDeltasFetchedBlock:(id)a3
{
}

- (NSMutableDictionary)mergeableValueIDsByRequestID
{
  return self->_mergeableValueIDsByRequestID;
}

- (void)setMergeableValueIDsByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDsByRequestID, 0);
  objc_storeStrong(&self->_deltasFetchedBlock, 0);
  objc_storeStrong((id *)&self->_previousContinuationTokens, 0);
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
}

@end