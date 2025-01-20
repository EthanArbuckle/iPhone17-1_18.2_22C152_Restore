@interface CKDFetchUserRecordURLRequest
- (CKRecord)userRecord;
- (id)generateRequestOperations;
- (id)recordFetchedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)setRecordFetchedBlock:(id)a3;
- (void)setUserRecord:(id)a3;
@end

@implementation CKDFetchUserRecordURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKDFetchUserRecordURLRequest;
  [(CKDURLRequest *)&v3 fillOutEquivalencyPropertiesBuilder:a3];
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  objc_super v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_operationType(self, a2, v2);
  v6 = objc_msgSend_operationRequestWithType_(self, v5, v4);
  v7 = objc_opt_new();
  objc_msgSend_setUserRetrieveRequest_(v6, v8, (uint64_t)v7);

  v12[0] = v6;
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v12, 1);

  return v10;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_hasUserRetrieveResponse(v4, v5, v6)
    && (objc_msgSend_userRetrieveResponse(v4, v7, v8),
        v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_user(v9, v10, v11),
        v12 = objc_claimAutoreleasedReturnValue(),
        v9,
        v12))
  {
    v15 = objc_msgSend_translator(self, v13, v14);
    id v51 = 0;
    objc_msgSend_recordFromPRecord_error_(v15, v16, (uint64_t)v12, &v51);
    v17 = (CKRecord *)objc_claimAutoreleasedReturnValue();
    id v18 = v51;
    userRecord = self->_userRecord;
    self->_userRecord = v17;

    if (!self->_userRecord)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v22 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v18;
        _os_log_error_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_ERROR, "Invalid user record response from server: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v23 = self->_userRecord;
    self->_userRecord = 0;

    v12 = 0;
    id v18 = 0;
  }
  if (self->_userRecord)
  {
    v24 = objc_msgSend_fakeResponseOperationResultByItemID(self, v20, v21);

    if (v24)
    {
      v25 = objc_msgSend_fakeResponseOperationResultByItemID(self, v20, v21);
      v28 = objc_msgSend_allValues(v25, v26, v27);
      v31 = objc_msgSend_firstObject(v28, v29, v30);

      if (v31)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v32 = (void *)*MEMORY[0x1E4F1A530];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
        {
          v47 = v32;
          v50 = objc_msgSend_requestUUID(self, v48, v49);
          *(_DWORD *)buf = 138543362;
          id v53 = v50;
          _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result\"", buf, 0xCu);
        }
        objc_msgSend_setResult_(v4, v33, (uint64_t)v31);
        v34 = self->_userRecord;
        self->_userRecord = 0;
      }
    }
  }
  v35 = objc_msgSend_recordFetchedBlock(self, v20, v21);

  if (v35)
  {
    objc_msgSend_recordFetchedBlock(self, v36, v37);
    v38 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v39 = self->_userRecord;
    v42 = objc_msgSend_recordID(v39, v40, v41);
    v45 = objc_msgSend_result(v4, v43, v44);
    ((void (**)(void, CKRecord *, void *, void *))v38)[2](v38, v39, v42, v45);
  }
  return v18;
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
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
  objc_storeStrong((id *)&self->_userRecord, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end