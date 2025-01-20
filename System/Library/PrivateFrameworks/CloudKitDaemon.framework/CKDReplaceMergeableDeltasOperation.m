@interface CKDReplaceMergeableDeltasOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (BOOL)supportsClearAssetEncryption;
- (CKDReplaceMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)replaceDeltasRequests;
- (id)activityCreate;
- (id)perReplacementCompletionBlock;
- (int)operationType;
- (void)_encryptMergeableDeltas;
- (void)_replaceMergeableDeltas;
- (void)handleReplaceDeltasRequest:(id)a3 result:(id)a4;
- (void)main;
- (void)setPerReplacementCompletionBlock:(id)a3;
- (void)setReplaceDeltasRequests:(id)a3;
@end

@implementation CKDReplaceMergeableDeltasOperation

- (CKDReplaceMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDReplaceMergeableDeltasOperation;
  v9 = [(CKDDatabaseOperation *)&v13 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_replaceDeltasRequests(v6, v7, v8);
    replaceDeltasRequests = v9->_replaceDeltasRequests;
    v9->_replaceDeltasRequests = (NSArray *)v10;
  }
  return v9;
}

- (int)operationType
{
  return 313;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/replace-mergeable-deltas", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      uint64_t v10 = objc_msgSend_error(self, v8, v9);
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__replaceMergeableDeltas(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__encryptMergeableDeltas(self, v6, v7);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 3)
  {
    v5 = @"Replace Deltas";
  }
  else if (a3 == 2)
  {
    v5 = @"Encrypt Deltas";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDReplaceMergeableDeltasOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)main
{
  uint64_t v4 = objc_msgSend_replaceDeltasRequests(self, a2, v2);
  BOOL v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (void)_encryptMergeableDeltas
{
  uint64_t v4 = objc_msgSend_replaceDeltasRequests(self, a2, v2);
  uint64_t v6 = objc_msgSend_CKFlatMap_(v4, v5, (uint64_t)&unk_1F2044B30);

  objc_initWeak(&location, self);
  uint64_t v9 = objc_msgSend_stateTransitionGroup(self, v7, v8);
  dispatch_group_enter(v9);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C501182C;
  v11[3] = &unk_1E64F22C0;
  objc_copyWeak(&v12, &location);
  objc_msgSend__encryptMergeableDeltas_completionHandler_(self, v10, (uint64_t)v6, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_replaceMergeableDeltas
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v5 = (void *)*MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
  {
    v19 = v5;
    v22 = objc_msgSend_replaceDeltasRequests(self, v20, v21);
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v22;
    _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Will replace deltas with requests: %@", (uint8_t *)location, 0xCu);
  }
  uint64_t v6 = [CKDReplaceMergeableDeltasURLRequest alloc];
  uint64_t v9 = objc_msgSend_replaceDeltasRequests(self, v7, v8);
  v11 = objc_msgSend_initWithOperation_replaceDeltasRequests_ignoreMissingDeltas_(v6, v10, (uint64_t)self, v9, 0);

  objc_initWeak(location, self);
  objc_initWeak(&from, v11);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C5011B8C;
  v29[3] = &unk_1E64F3548;
  objc_copyWeak(&v30, location);
  objc_msgSend_setPerReplacementCompletionBlock_(v11, v12, (uint64_t)v29);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = sub_1C5011C74;
  v26 = &unk_1E64F0170;
  objc_copyWeak(&v27, location);
  objc_copyWeak(&v28, &from);
  objc_msgSend_setCompletionBlock_(v11, v13, (uint64_t)&v23);
  objc_msgSend_setRequest_(self, v14, (uint64_t)v11, v23, v24, v25, v26);
  v17 = objc_msgSend_container(self, v15, v16);
  objc_msgSend_performRequest_(v17, v18, (uint64_t)v11);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

- (void)handleReplaceDeltasRequest:(id)a3 result:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_perReplacementCompletionBlock(self, v8, v9);

  if (v10)
  {
    if (objc_msgSend_code(v7, v11, v12) == 1)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v13 = *MEMORY[0x1E4F1A510];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v6;
        _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "Successfully replaced deltas with request %@", buf, 0xCu);
      }
      objc_msgSend_perReplacementCompletionBlock(self, v14, v15);
      uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, void))v16)[2](v16, v6, 0);

      goto LABEL_18;
    }
    uint64_t v22 = sub_1C4E94D98(v7);
    v25 = objc_msgSend_request(self, v23, v24);
    v18 = sub_1C4E940D0(v25, v7);

    v26 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v27 = *MEMORY[0x1E4F19DD8];
    id v30 = objc_msgSend_error(v7, v28, v29);
    v33 = objc_msgSend_errorDescription(v30, v31, v32);
    v35 = objc_msgSend_errorWithDomain_code_userInfo_format_(v26, v34, v27, v22, v18, @"Error performing replace deltas request: %@", v33);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v36 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v6;
      __int16 v42 = 2112;
      v43 = v35;
      _os_log_error_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_ERROR, "Failed to replace deltas for request %@: %@", buf, 0x16u);
    }
    objc_msgSend_perReplacementCompletionBlock(self, v37, v38);
    v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void *))v39)[2](v39, v6, v35);

LABEL_17:
    goto LABEL_18;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v17 = (void *)*MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    uint64_t v21 = objc_msgSend_operationID(self, v19, v20);
    *(_DWORD *)buf = 138412290;
    id v41 = v21;
    _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "No per-request completion block for operation %@", buf, 0xCu);

    goto LABEL_17;
  }
LABEL_18:
}

- (id)perReplacementCompletionBlock
{
  return self->_perReplacementCompletionBlock;
}

- (void)setPerReplacementCompletionBlock:(id)a3
{
}

- (NSArray)replaceDeltasRequests
{
  return self->_replaceDeltasRequests;
}

- (void)setReplaceDeltasRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceDeltasRequests, 0);
  objc_storeStrong(&self->_perReplacementCompletionBlock, 0);
}

@end