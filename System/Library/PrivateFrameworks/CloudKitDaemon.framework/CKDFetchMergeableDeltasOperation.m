@interface CKDFetchMergeableDeltasOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (BOOL)supportsClearAssetEncryption;
- (CKDFetchMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)mergeableValueIDs;
- (id)activityCreate;
- (id)deltasFetchedBlock;
- (int)operationType;
- (void)fetchMergeableDeltas;
- (void)fetchMergeableDeltasRecursivelyForValueIDs:(id)a3 continuationTokens:(id)a4 completionHandler:(id)a5;
- (void)handleMergeableDeltasFetchedForValueID:(id)a3 fetchedDeltas:(id)a4 result:(id)a5;
- (void)main;
- (void)setDeltasFetchedBlock:(id)a3;
- (void)setMergeableValueIDs:(id)a3;
@end

@implementation CKDFetchMergeableDeltasOperation

- (CKDFetchMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDFetchMergeableDeltasOperation;
  v9 = [(CKDDatabaseOperation *)&v13 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_mergeableValueIDs(v6, v7, v8);
    mergeableValueIDs = v9->_mergeableValueIDs;
    v9->_mergeableValueIDs = (NSArray *)v10;
  }
  return v9;
}

- (int)operationType
{
  return 314;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-mergeable-deltas", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    uint64_t v10 = objc_msgSend_error(self, v8, v9);
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);
  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend_fetchMergeableDeltas(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Fetch Deltas";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchMergeableDeltasOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)main
{
  uint64_t v4 = objc_msgSend_mergeableValueIDs(self, a2, v2);
  BOOL v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (void)fetchMergeableDeltas
{
  uint64_t v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  objc_initWeak(&location, self);
  BOOL v7 = objc_msgSend_mergeableValueIDs(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4E4AD7C;
  v9[3] = &unk_1E64F22C0;
  objc_copyWeak(&v10, &location);
  objc_msgSend_fetchMergeableDeltasRecursivelyForValueIDs_continuationTokens_completionHandler_(self, v8, (uint64_t)v7, 0, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fetchMergeableDeltasRecursivelyForValueIDs:(id)a3 continuationTokens:(id)a4 completionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v11 = *MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 138412546;
    *(void *)&location[4] = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Will fetch deltas recursively for values %@ with continuation tokens %@", location, 0x16u);
  }
  v12 = [CKDFetchMergeableDeltasURLRequest alloc];
  v14 = objc_msgSend_initWithOperation_mergeableValueIDs_previousContinuationTokens_(v12, v13, (uint64_t)self, v8, v9);
  v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16);
  objc_initWeak((id *)location, self);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C4E4B2FC;
  v34[3] = &unk_1E64F20E0;
  objc_copyWeak(&v36, (id *)location);
  id v18 = v17;
  id v35 = v18;
  objc_msgSend_setDeltasFetchedBlock_(v14, v19, (uint64_t)v34);
  objc_initWeak(&from, v14);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4E4B460;
  v28[3] = &unk_1E64F41D0;
  objc_copyWeak(&v31, (id *)location);
  objc_copyWeak(&v32, &from);
  id v20 = v10;
  id v30 = v20;
  id v21 = v18;
  id v29 = v21;
  objc_msgSend_setCompletionBlock_(v14, v22, (uint64_t)v28);
  objc_msgSend_setRequest_(self, v23, (uint64_t)v14);
  v26 = objc_msgSend_container(self, v24, v25);
  objc_msgSend_performRequest_(v26, v27, (uint64_t)v14);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)location);
}

- (void)handleMergeableDeltasFetchedForValueID:(id)a3 fetchedDeltas:(id)a4 result:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v13 = objc_msgSend_stateTransitionGroup(self, v11, v12);
  dispatch_group_enter(v13);

  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = sub_1C4E4BD54;
  v71 = sub_1C4E4BD64;
  id v72 = 0;
  if (objc_msgSend_code(v10, v14, v15) == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v16 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v74 = v8;
      _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Successfully fetched delta for %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v17 = sub_1C4E94D98(v10);
    id v20 = objc_msgSend_request(self, v18, v19);
    id v21 = sub_1C4E940D0(v20, v10);

    v22 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v25 = objc_msgSend_error(v10, v23, v24);
    v28 = objc_msgSend_errorDescription(v25, v26, v27);
    uint64_t v30 = objc_msgSend_errorWithDomain_code_userInfo_format_(v22, v29, *MEMORY[0x1E4F19DD8], v17, v21, @"Error fetching deltas for %@ from server: %@", v8, v28);
    id v31 = (void *)v68[5];
    v68[5] = v30;

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v32 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v55 = v68[5];
      *(_DWORD *)buf = 138412546;
      id v74 = v8;
      __int16 v75 = 2112;
      uint64_t v76 = v55;
      _os_log_error_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch deltas for %@: %@", buf, 0x16u);
    }
  }
  v33 = dispatch_group_create();
  if (objc_msgSend_useEncryption(self, v34, v35)
    && objc_msgSend_CKContains_(v9, v36, (uint64_t)&unk_1F2043590))
  {
    v56 = objc_msgSend_recordID(v8, v36, v37);
    if (v56)
    {
      dispatch_group_enter(v33);
      objc_initWeak((id *)buf, self);
      uint64_t v40 = objc_msgSend_container(self, v38, v39);
      v43 = objc_msgSend_pcsCache(v40, v41, v42);
      v46 = objc_msgSend_recordID(v8, v44, v45);
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = sub_1C4E4BD74;
      v61[3] = &unk_1E64F4218;
      objc_copyWeak(&v66, (id *)buf);
      id v62 = v8;
      v65 = &v67;
      id v63 = v9;
      v64 = v33;
      objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v43, v47, (uint64_t)v46, self, 0, v61);

      objc_destroyWeak(&v66);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v48 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v74 = v8;
        _os_log_error_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_ERROR, "Unable to determine record ID for value %@", buf, 0xCu);
      }
      uint64_t v50 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v49, *MEMORY[0x1E4F19DD8], 1017, 0, @"Unable to determine record ID for mergeable delta for value ID: %@", v8);
      v51 = (void *)v68[5];
      v68[5] = v50;
    }
  }
  v52 = objc_msgSend_callbackQueue(self, v36, v37);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E4C0F4;
  block[3] = &unk_1E64F4240;
  block[4] = self;
  id v58 = v8;
  id v59 = v9;
  v60 = &v67;
  id v53 = v9;
  id v54 = v8;
  dispatch_group_notify(v33, v52, block);

  _Block_object_dispose(&v67, 8);
}

- (id)deltasFetchedBlock
{
  return self->_deltasFetchedBlock;
}

- (void)setDeltasFetchedBlock:(id)a3
{
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
  objc_storeStrong(&self->_deltasFetchedBlock, 0);
}

@end