@interface CKDFetchMergeableDeltaMetadataOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDFetchMergeableDeltaMetadataOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)mergeableValueIDs;
- (id)activityCreate;
- (id)metadataFetchedBlock;
- (int)operationType;
- (void)fetchMetadata;
- (void)fetchMetadataRecursivelyForMergeableValueIDs:(id)a3 continuationTokens:(id)a4 completionHandler:(id)a5;
- (void)handleFetchedMetadatasForMergeableValueID:(id)a3 metadatas:(id)a4 result:(id)a5;
- (void)main;
- (void)setMergeableValueIDs:(id)a3;
- (void)setMetadataFetchedBlock:(id)a3;
@end

@implementation CKDFetchMergeableDeltaMetadataOperation

- (CKDFetchMergeableDeltaMetadataOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDFetchMergeableDeltaMetadataOperation;
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
  return 312;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-mergeable-delta-metadata", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
    objc_msgSend_fetchMetadata(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Fetch Metadata";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchMergeableDeltaMetadataOperation;
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

- (void)fetchMetadata
{
  uint64_t v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  objc_initWeak(&location, self);
  BOOL v7 = objc_msgSend_mergeableValueIDs(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D99930;
  v9[3] = &unk_1E64F20B8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend_fetchMetadataRecursivelyForMergeableValueIDs_continuationTokens_completionHandler_(self, v8, (uint64_t)v7, 0, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fetchMetadataRecursivelyForMergeableValueIDs:(id)a3 continuationTokens:(id)a4 completionHandler:(id)a5
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
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Will fetch delta metadata recursively for value IDs %@ with continuation tokens %@", location, 0x16u);
  }
  v12 = [CKDFetchMergeableDeltaMetadataURLRequest alloc];
  v14 = objc_msgSend_initWithOperation_mergeableValueIDs_continuationTokens_(v12, v13, (uint64_t)self, v8, v9);
  v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16);
  objc_initWeak((id *)location, v14);
  objc_initWeak(&from, self);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4D99EB8;
  v33[3] = &unk_1E64F20E0;
  objc_copyWeak(&v35, &from);
  id v18 = v17;
  id v34 = v18;
  objc_msgSend_setMetadataFetchedBlock_(v14, v19, (uint64_t)v33);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4D9A098;
  v28[3] = &unk_1E64F2108;
  objc_copyWeak(&v31, &from);
  id v20 = v18;
  id v29 = v20;
  id v21 = v10;
  id v30 = v21;
  objc_copyWeak(&v32, (id *)location);
  objc_msgSend_setCompletionBlock_(v14, v22, (uint64_t)v28);
  objc_msgSend_setRequest_(self, v23, (uint64_t)v14);
  v26 = objc_msgSend_container(self, v24, v25);
  objc_msgSend_performRequest_(v26, v27, (uint64_t)v14);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);
}

- (void)handleFetchedMetadatasForMergeableValueID:(id)a3 metadatas:(id)a4 result:(id)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v76 = a5;
  id v10 = self;
  objc_super v13 = objc_msgSend_metadataFetchedBlock(self, v11, v12);

  if (v13)
  {
    if (objc_msgSend_code(v76, v14, v15) == 1)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v16 = (void *)*MEMORY[0x1E4F1A510];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
      {
        v72 = v16;
        *(_DWORD *)v97 = 134218242;
        *(void *)&v97[4] = objc_msgSend_count(v9, v73, v74);
        *(_WORD *)&v97[12] = 2112;
        *(void *)&v97[14] = v8;
        _os_log_debug_impl(&dword_1C4CFF000, v72, OS_LOG_TYPE_DEBUG, "Successfully fetched %ld delta metadatas for value %@", v97, 0x16u);
      }
      v77 = objc_msgSend_recordID(v8, v17, v18);
      v75 = objc_msgSend_key(v8, v19, v20);
      if (v77 && v75)
      {
        *(void *)v97 = 0;
        *(void *)&v97[8] = v97;
        *(void *)&v97[16] = 0x3032000000;
        v98 = sub_1C4D9AB78;
        v99 = sub_1C4D9AB88;
        id v100 = 0;
        group = dispatch_group_create();
        objc_initWeak(&location, self);
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v21 = v9;
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v89, v96, 16);
        if (v25)
        {
          uint64_t v26 = *(void *)v90;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v90 != v26) {
                objc_enumerationMutation(v21);
              }
              v28 = *(void **)(*((void *)&v89 + 1) + 8 * v27);
              if (objc_msgSend_isEncrypted(v8, v23, v24)
                && objc_msgSend_needsDecryption(v28, v23, v24))
              {
                dispatch_group_enter(group);
                id v31 = objc_msgSend_stateTransitionGroup(v10, v29, v30);
                dispatch_group_enter(v31);

                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                id v32 = *MEMORY[0x1E4F1A510];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v95 = v28;
                  _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Need to decrypt timestamps for metadata %@", buf, 0xCu);
                }
                id v35 = objc_msgSend_container(v10, v33, v34);
                __int16 v38 = objc_msgSend_pcsCache(v35, v36, v37);
                v83[0] = MEMORY[0x1E4F143A8];
                v83[1] = 3221225472;
                v83[2] = sub_1C4D9AB90;
                v83[3] = &unk_1E64F2130;
                objc_copyWeak(&v88, &location);
                v87 = v97;
                id v84 = v8;
                v85 = v28;
                v86 = group;
                objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v38, v39, (uint64_t)v77, v10, 0, v83);

                objc_destroyWeak(&v88);
              }
              ++v27;
            }
            while (v25 != v27);
            uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v89, v96, 16);
          }
          while (v25);
        }

        if (*(void *)(*(void *)&v97[8] + 40))
        {

          id v21 = 0;
        }
        v42 = objc_msgSend_callbackQueue(v10, v40, v41);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4D9AEF8;
        block[3] = &unk_1E64F2158;
        block[4] = v10;
        id v80 = v8;
        id v9 = v21;
        id v81 = v9;
        v82 = v97;
        dispatch_group_notify(group, v42, block);

        objc_destroyWeak(&location);
        _Block_object_dispose(v97, 8);
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v66 = *MEMORY[0x1E4F1A510];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v97 = 138412290;
          *(void *)&v97[4] = v8;
          _os_log_error_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_ERROR, "No record ID for delta metadata on value ID %@", v97, 0xCu);
        }
        v68 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v67, *MEMORY[0x1E4F19DD8], 1017, 0, @"Must specify a record ID and field name for value %@", v8);
        objc_msgSend_metadataFetchedBlock(self, v69, v70);
        v71 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id, void, void *))v71)[2](v71, v8, 0, v68);
      }
    }
    else
    {
      uint64_t v48 = sub_1C4E94D98(v76);
      v51 = objc_msgSend_request(self, v49, v50);
      v52 = sub_1C4E940D0(v51, v76);

      v53 = (void *)MEMORY[0x1E4F1A280];
      v56 = objc_msgSend_error(v76, v54, v55);
      v59 = objc_msgSend_errorDescription(v56, v57, v58);
      v61 = objc_msgSend_errorWithDomain_code_userInfo_format_(v53, v60, *MEMORY[0x1E4F19DD8], v48, v52, @"Error fetching delta for value %@ from server: %@", v8, v59);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v62 = *MEMORY[0x1E4F1A510];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v97 = 138412546;
        *(void *)&v97[4] = v8;
        *(_WORD *)&v97[12] = 2112;
        *(void *)&v97[14] = v61;
        _os_log_error_impl(&dword_1C4CFF000, v62, OS_LOG_TYPE_ERROR, "Failed to fetch metadatas for value %@: %@", v97, 0x16u);
      }
      objc_msgSend_metadataFetchedBlock(v10, v63, v64);
      v65 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, void, void *))v65)[2](v65, v8, 0, v61);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v43 = (void *)*MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_INFO))
    {
      v44 = v43;
      v47 = objc_msgSend_operationID(self, v45, v46);
      *(_DWORD *)v97 = 138412290;
      *(void *)&v97[4] = v47;
      _os_log_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_INFO, "No per-valueID fetch block for operation %@", v97, 0xCu);
    }
  }
}

- (id)metadataFetchedBlock
{
  return self->_metadataFetchedBlock;
}

- (void)setMetadataFetchedBlock:(id)a3
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
  objc_storeStrong(&self->_metadataFetchedBlock, 0);
}

@end