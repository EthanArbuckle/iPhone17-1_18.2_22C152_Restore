@interface CKDUploadMergeableDeltasURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (CKDUploadMergeableDeltasURLRequest)initWithOperation:(id)a3 deltas:(id)a4 replacementRequests:(id)a5;
- (NSArray)deltas;
- (NSArray)replacementRequests;
- (NSMutableDictionary)deltasByRequestID;
- (NSMutableDictionary)replacementRequestsByRequestID;
- (id)anonymousUserIDForHTTPHeader;
- (id)generateRequestOperations;
- (id)perDeltaCompletionBlock;
- (id)perReplaceDeltasRequestCompletionBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setDeltasByRequestID:(id)a3;
- (void)setPerDeltaCompletionBlock:(id)a3;
- (void)setPerReplaceDeltasRequestCompletionBlock:(id)a3;
- (void)setReplacementRequestsByRequestID:(id)a3;
@end

@implementation CKDUploadMergeableDeltasURLRequest

- (CKDUploadMergeableDeltasURLRequest)initWithOperation:(id)a3 deltas:(id)a4 replacementRequests:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKDUploadMergeableDeltasURLRequest;
  v12 = [(CKDURLRequest *)&v28 initWithOperation:a3];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v10, v11);
    deltas = v12->_deltas;
    v12->_deltas = (NSArray *)v13;

    uint64_t v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16);
    deltasByRequestID = v12->_deltasByRequestID;
    v12->_deltasByRequestID = (NSMutableDictionary *)v17;

    uint64_t v21 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v19, v20);
    replacementRequestsByRequestID = v12->_replacementRequestsByRequestID;
    v12->_replacementRequestsByRequestID = (NSMutableDictionary *)v21;

    uint64_t v25 = objc_msgSend_copy(v9, v23, v24);
    replacementRequests = v12->_replacementRequests;
    v12->_replacementRequests = (NSArray *)v25;
  }
  return v12;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDUploadMergeableDeltasURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = objc_msgSend_replacementRequests(self, v6, v7, v15.receiver, v15.super_class);
  uint64_t v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  uint64_t v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"requests");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_replacementRequests(self, v5, v6);
  id v9 = objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1F2042870);

  objc_msgSend_setModifyMergeableValueIDs_(v4, v10, (uint64_t)v9);
  v11.receiver = self;
  v11.super_class = (Class)CKDUploadMergeableDeltasURLRequest;
  [(CKDURLRequest *)&v11 fillOutRequestProperties:v4];
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)zoneIDsToLock
{
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_deltas(self, v4, v5);
  id v8 = objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1F2042890);
  objc_msgSend_addObjectsFromArray_(v3, v9, (uint64_t)v8);

  v12 = objc_msgSend_allObjects(v3, v10, v11);

  return v12;
}

- (id)requestOperationClasses
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = objc_opt_class();
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v15, 1);
  uint64_t v7 = objc_msgSend_replacementRequests(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_arrayByAddingObject_(v4, v12, v11);

    id v4 = (void *)v13;
  }
  return v4;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)anonymousUserIDForHTTPHeader
{
  v3 = objc_msgSend_zoneIDsToLock(self, a2, v2);
  uint64_t v6 = objc_msgSend_firstObject(v3, v4, v5);
  uint64_t v9 = objc_msgSend_anonymousCKUserID(v6, v7, v8);

  return v9;
}

- (id)generateRequestOperations
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_1C4D4F0B8;
  v50 = sub_1C4D4F0C8;
  id v51 = 0;
  id v4 = objc_msgSend_deltas(self, a2, v2);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = sub_1C4D4F0D0;
  v45[3] = &unk_1E64F0630;
  v45[4] = self;
  v45[5] = &v46;
  uint64_t v6 = objc_msgSend_CKCompactMap_(v4, v5, (uint64_t)v45);
  id v9 = (id)objc_msgSend_mutableCopy(v6, v7, v8);

  if (v47[5])
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      uint64_t v42 = v47[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v42;
      _os_log_fault_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_FAULT, "Failed to generate requestOperations for MergeableDeltaSaveRequest: %@", buf, 0xCu);
    }
    objc_msgSend_finishWithError_(self, v13, v47[5]);
    v14 = 0;
  }
  else
  {
    objc_super v15 = objc_msgSend_replacementRequests(self, v10, v11);
    uint64_t v16 = (id *)(v47 + 5);
    id obj = (id)v47[5];
    v18 = objc_msgSend_requestOperationsForRequest_replaceDeltasRequests_ignoreMissingDeltas_error_(CKDReplaceMergeableDeltasURLRequest, v17, (uint64_t)self, v15, 1, &obj);
    objc_storeStrong(v16, obj);

    if (v18 && !v47[5])
    {
      for (unint64_t i = 0; i < objc_msgSend_count(v18, v19, v20); ++i)
      {
        uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v18, v24, i);
        objc_super v28 = objc_msgSend_replacementRequests(self, v26, v27);
        v30 = objc_msgSend_objectAtIndexedSubscript_(v28, v29, i);
        v33 = objc_msgSend_replacementRequestsByRequestID(self, v31, v32);
        v36 = objc_msgSend_request(v25, v34, v35);
        v39 = objc_msgSend_operationUUID(v36, v37, v38);
        objc_msgSend_setObject_forKeyedSubscript_(v33, v40, (uint64_t)v30, v39);
      }
      objc_msgSend_addObjectsFromArray_(v9, v24, (uint64_t)v18);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v21 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
      {
        uint64_t v43 = v47[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = v43;
        _os_log_fault_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_FAULT, "Failed to create mergeable delta proto for replacement request: %@", buf, 0xCu);
      }

      objc_msgSend_finishWithError_(self, v22, v47[5]);
      id v9 = 0;
    }
    id v9 = v9;

    v14 = v9;
  }

  _Block_object_dispose(&v46, 8);
  return v14;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v5 = a3;
  if (objc_msgSend_hasMergeableDeltaSaveResponse(v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_deltasByRequestID(self, v8, v9);
    uint64_t v13 = objc_msgSend_response(v5, v11, v12);
    uint64_t v16 = objc_msgSend_operationUUID(v13, v14, v15);
    v18 = objc_msgSend_objectForKeyedSubscript_(v10, v17, (uint64_t)v16);

    if (!v18)
    {
      v45 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, @"CKDUploadMergeableDeltasURLRequest.m", 164, @"Expected non-nil delta for response %@", v5);
    }
    uint64_t v21 = objc_msgSend_perDeltaCompletionBlock(self, v19, v20);

    if (!v21) {
      goto LABEL_12;
    }
    uint64_t v24 = objc_msgSend_perDeltaCompletionBlock(self, v22, v23);
LABEL_11:
    uint64_t v42 = (void (**)(void, void, void))v24;
    uint64_t v43 = objc_msgSend_result(v5, v25, v26);
    ((void (**)(void, void *, void *))v42)[2](v42, v18, v43);

LABEL_12:
    goto LABEL_13;
  }
  if (objc_msgSend_hasMergeableDeltaReplaceResponse(v5, v8, v9))
  {
    v29 = objc_msgSend_replacementRequestsByRequestID(self, v27, v28);
    uint64_t v32 = objc_msgSend_response(v5, v30, v31);
    uint64_t v35 = objc_msgSend_operationUUID(v32, v33, v34);
    v18 = objc_msgSend_objectForKeyedSubscript_(v29, v36, (uint64_t)v35);

    if (!v18)
    {
      v47 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v37, v38);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v47, v48, (uint64_t)a2, self, @"CKDUploadMergeableDeltasURLRequest.m", 170, @"Expected non-nil replacement request for response %@", v5);
    }
    v39 = objc_msgSend_perReplaceDeltasRequestCompletionBlock(self, v37, v38);

    if (!v39) {
      goto LABEL_12;
    }
    uint64_t v24 = objc_msgSend_perReplaceDeltasRequestCompletionBlock(self, v40, v41);
    goto LABEL_11;
  }
LABEL_13:

  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v5 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v42 = v5;
    v45 = objc_msgSend_requestUUID(self, v43, v44);
    int v46 = 138412546;
    v47 = v45;
    __int16 v48 = 2112;
    id v49 = v4;
    _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "Node failure in upload deltas request %@: %@", (uint8_t *)&v46, 0x16u);
  }
  uint64_t v8 = objc_msgSend_deltasByRequestID(self, v6, v7);
  uint64_t v11 = objc_msgSend_response(v4, v9, v10);
  v14 = objc_msgSend_operationUUID(v11, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);

  if (v16)
  {
    v19 = objc_msgSend_perDeltaCompletionBlock(self, v17, v18);

    if (v19)
    {
      objc_msgSend_perDeltaCompletionBlock(self, v17, v18);
      uint64_t v20 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v23 = objc_msgSend_result(v4, v21, v22);
      ((void (**)(void, void *, void *))v20)[2](v20, v16, v23);
    }
  }
  uint64_t v24 = objc_msgSend_replacementRequestsByRequestID(self, v17, v18);
  uint64_t v27 = objc_msgSend_response(v4, v25, v26);
  v30 = objc_msgSend_operationUUID(v27, v28, v29);
  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v24, v31, (uint64_t)v30);

  if (v32)
  {
    uint64_t v35 = objc_msgSend_perReplaceDeltasRequestCompletionBlock(self, v33, v34);

    if (v35)
    {
      objc_msgSend_perReplaceDeltasRequestCompletionBlock(self, v36, v37);
      uint64_t v38 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v41 = objc_msgSend_result(v4, v39, v40);
      ((void (**)(void, void *, void *))v38)[2](v38, v32, v41);
    }
  }
}

- (NSArray)deltas
{
  return self->_deltas;
}

- (NSArray)replacementRequests
{
  return self->_replacementRequests;
}

- (id)perDeltaCompletionBlock
{
  return self->_perDeltaCompletionBlock;
}

- (void)setPerDeltaCompletionBlock:(id)a3
{
}

- (id)perReplaceDeltasRequestCompletionBlock
{
  return self->_perReplaceDeltasRequestCompletionBlock;
}

- (void)setPerReplaceDeltasRequestCompletionBlock:(id)a3
{
}

- (NSMutableDictionary)deltasByRequestID
{
  return self->_deltasByRequestID;
}

- (void)setDeltasByRequestID:(id)a3
{
}

- (NSMutableDictionary)replacementRequestsByRequestID
{
  return self->_replacementRequestsByRequestID;
}

- (void)setReplacementRequestsByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, 0);
  objc_storeStrong((id *)&self->_deltasByRequestID, 0);
  objc_storeStrong(&self->_perReplaceDeltasRequestCompletionBlock, 0);
  objc_storeStrong(&self->_perDeltaCompletionBlock, 0);
  objc_storeStrong((id *)&self->_replacementRequests, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
}

@end