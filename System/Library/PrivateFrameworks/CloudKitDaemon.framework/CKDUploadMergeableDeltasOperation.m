@interface CKDUploadMergeableDeltasOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (BOOL)supportsClearAssetEncryption;
- (CKDUploadMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)deltas;
- (NSArray)replacementRequests;
- (NSMutableArray)pendingDeltaUploads;
- (NSMutableArray)pendingReplacementRequests;
- (id)activityCreate;
- (id)replaceDeltasRequestCompletionBlock;
- (id)uploadDeltaCompletionBlock;
- (int)operationType;
- (void)_encryptMergeableDeltas;
- (void)_uploadAndReplaceDeltas;
- (void)_uploadAndReplaceDeltas:(id)a3;
- (void)handleDeltaUploaded:(id)a3 result:(id)a4;
- (void)handleReplaceDeltasRequest:(id)a3 result:(id)a4;
- (void)main;
- (void)setDeltas:(id)a3;
- (void)setPendingDeltaUploads:(id)a3;
- (void)setPendingReplacementRequests:(id)a3;
- (void)setReplaceDeltasRequestCompletionBlock:(id)a3;
- (void)setReplacementRequests:(id)a3;
- (void)setUploadDeltaCompletionBlock:(id)a3;
@end

@implementation CKDUploadMergeableDeltasOperation

- (CKDUploadMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKDUploadMergeableDeltasOperation;
  id v9 = [(CKDDatabaseOperation *)&v23 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_deltas(v6, v7, v8);
    v11 = (void *)*((void *)v9 + 59);
    *((void *)v9 + 59) = v10;

    uint64_t v14 = objc_msgSend_replacementRequests(v6, v12, v13);
    v15 = (void *)*((void *)v9 + 60);
    *((void *)v9 + 60) = v14;

    uint64_t v17 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v16, *((void *)v9 + 59));
    v18 = (void *)*((void *)v9 + 62);
    *((void *)v9 + 62) = v17;

    uint64_t v20 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v19, *((void *)v9 + 60));
    v21 = (void *)*((void *)v9 + 61);
    *((void *)v9 + 61) = v20;
  }
  return (CKDUploadMergeableDeltasOperation *)v9;
}

- (int)operationType
{
  return 311;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/upload-mergeable-deltas", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
      objc_msgSend__uploadAndReplaceDeltas(self, v12, v13);
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
  if (a3 == 2)
  {
    v5 = @"Encrypt Deltas";
  }
  else if (a3 == 3)
  {
    v5 = @"Upload Deltas";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDUploadMergeableDeltasOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)main
{
  uint64_t v4 = objc_msgSend_deltas(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6))
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend_replacementRequests(self, v7, v8);
    BOOL v9 = objc_msgSend_count(v10, v11, v12) == 0;
  }
  objc_msgSend_makeStateTransition_(self, v13, v9);
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (void)_encryptMergeableDeltas
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_pendingDeltaUploads(self, a2, v2);
  objc_super v7 = objc_msgSend_mutableCopy(v4, v5, v6);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = objc_msgSend_replacementRequests(self, v8, v9);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, v35, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v18 = objc_msgSend_replacementDeltas(v17, v12, v13);
        BOOL v21 = objc_msgSend_count(v18, v19, v20) == 0;

        if (!v21)
        {
          v22 = objc_msgSend_replacementDeltas(v17, v12, v13);
          objc_msgSend_addObjectsFromArray_(v7, v23, (uint64_t)v22);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v31, v35, 16);
    }
    while (v14);
  }

  objc_initWeak(&location, self);
  v26 = objc_msgSend_stateTransitionGroup(self, v24, v25);
  dispatch_group_enter(v26);

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4DF9B4C;
  v28[3] = &unk_1E64F22C0;
  objc_copyWeak(&v29, &location);
  objc_msgSend__encryptMergeableDeltas_completionHandler_(self, v27, (uint64_t)v7, v28);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)_uploadAndReplaceDeltas
{
  uint64_t v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4DF9CA4;
  v6[3] = &unk_1E64F09E0;
  objc_copyWeak(&v7, &location);
  objc_msgSend__uploadAndReplaceDeltas_(self, v5, (uint64_t)v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_uploadAndReplaceDeltas:(id)a3
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  v112 = (void (**)(void))a3;
  val = self;
  uint64_t v6 = objc_msgSend_error(self, v4, v5);
  if (v6)
  {

LABEL_3:
    uint64_t v9 = v112;
    v112[2](v112);
    goto LABEL_57;
  }
  uint64_t v10 = objc_msgSend_pendingDeltaUploads(self, v7, v8);
  if (objc_msgSend_count(v10, v11, v12))
  {
  }
  else
  {
    uint64_t v17 = objc_msgSend_pendingReplacementRequests(val, v13, v14);
    uint64_t v20 = objc_msgSend_count(v17, v18, v19);

    if (!v20) {
      goto LABEL_3;
    }
  }
  BOOL v21 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v15, v16);
  unint64_t v115 = objc_msgSend_maximumMergeableDeltaRequestSize(v21, v22, v23);

  v26 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v24, v25);
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v29 = objc_msgSend_pendingDeltaUploads(val, v27, v28);
  unint64_t v31 = 0;
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v134, v149, 16);
  if (v33)
  {
    uint64_t v34 = *(void *)v135;
    unint64_t v35 = *MEMORY[0x1E4F19CB0];
    while (2)
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v135 != v34) {
          objc_enumerationMutation(v29);
        }
        v37 = *(void **)(*((void *)&v134 + 1) + 8 * v36);
        id v132 = 0;
        id location = 0;
        char v38 = objc_msgSend_protobufSize_error_(v37, v32, (uint64_t)&location, &v132);
        id v41 = v132;
        if ((v38 & 1) == 0)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v42 = *MEMORY[0x1E4F1A510];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v41;
            _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "Failed to get protobuf size for delta, but moving on: %@", buf, 0xCu);
          }
        }
        if (((unint64_t)location + v31 > v115 || objc_msgSend_count(v26, v39, v40) >= v35)
          && objc_msgSend_count(v26, v39, v40))
        {

          goto LABEL_24;
        }
        objc_msgSend_addObject_(v26, v39, (uint64_t)v37);
        id v43 = location;

        v31 += (unint64_t)v43;
        ++v36;
      }
      while (v33 != v36);
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v134, v149, 16);
      if (v33) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  v46 = objc_msgSend_pendingDeltaUploads(val, v44, v45);
  objc_msgSend_removeObjectsInArray_(v46, v47, (uint64_t)v26);

  v113 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v48, v49);
  objc_msgSend_pendingReplacementRequests(val, v50, v51);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(obj, v52, v53) || v31 >= v115) {
    goto LABEL_51;
  }
  v56 = objc_msgSend_pendingDeltaUploads(val, v54, v55);
  BOOL v59 = objc_msgSend_count(v56, v57, v58) == 0;

  if (v59)
  {
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    objc_msgSend_pendingReplacementRequests(val, v60, v61);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v62, (uint64_t)&v128, v148, 16);
    if (v110)
    {
      uint64_t v109 = *(void *)v129;
      unint64_t v108 = *MEMORY[0x1E4F19CB0];
      *(void *)&long long v65 = 138412290;
      long long v107 = v65;
LABEL_29:
      uint64_t v66 = 0;
      while (1)
      {
        if (*(void *)v129 != v109) {
          objc_enumerationMutation(obj);
        }
        v67 = *(void **)(*((void *)&v128 + 1) + 8 * v66);
        long long v124 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        v68 = objc_msgSend_replacementDeltas(v67, v63, v64, v107);
        uint64_t v70 = 0;
        uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v124, v147, 16);
        if (v72)
        {
          uint64_t v73 = *(void *)v125;
          do
          {
            for (uint64_t i = 0; i != v72; ++i)
            {
              if (*(void *)v125 != v73) {
                objc_enumerationMutation(v68);
              }
              v75 = *(void **)(*((void *)&v124 + 1) + 8 * i);
              *(void *)buf = 0;
              int v76 = objc_msgSend_protobufSize_error_(v75, v71, (uint64_t)buf, 0);
              uint64_t v77 = *(void *)buf;
              if (!v76) {
                uint64_t v77 = 0;
              }
              v70 += v77;
            }
            uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v71, (uint64_t)&v124, v147, 16);
          }
          while (v72);
        }

        if ((v70 + v31 > v115 || objc_msgSend_count(v26, v78, v79) >= v108)
          && (objc_msgSend_count(v26, v78, v79) || objc_msgSend_count(v113, v80, v81)))
        {
          break;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v82 = *MEMORY[0x1E4F1A510];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v107;
          *(void *)&buf[4] = v67;
          _os_log_debug_impl(&dword_1C4CFF000, v82, OS_LOG_TYPE_DEBUG, "Will add replacement request %@", buf, 0xCu);
        }
        objc_msgSend_addObject_(v113, v83, (uint64_t)v67);
        if (++v66 == v110)
        {
          uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v128, v148, 16);
          if (v110) {
            goto LABEL_29;
          }
          break;
        }
      }
    }
LABEL_51:
  }
  v84 = objc_msgSend_pendingReplacementRequests(val, v60, v61);
  objc_msgSend_removeObjectsInArray_(v84, v85, (uint64_t)v113);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v86 = (void *)*MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_INFO))
  {
    v87 = v86;
    uint64_t v90 = objc_msgSend_count(v26, v88, v89);
    v91 = (objc_class *)objc_opt_class();
    v92 = NSStringFromClass(v91);
    v95 = objc_msgSend_ckShortDescription(val, v93, v94);
    *(_DWORD *)buf = 134219010;
    *(void *)&buf[4] = v90;
    __int16 v139 = 2048;
    unint64_t v140 = v31;
    __int16 v141 = 2114;
    v142 = v92;
    __int16 v143 = 2048;
    v144 = val;
    __int16 v145 = 2114;
    v146 = v95;
    _os_log_impl(&dword_1C4CFF000, v87, OS_LOG_TYPE_INFO, "Starting delta upload request with %tu deltas (%tu bytes) for operation <%{public}@: %p; %{public}@>",
      buf,
      0x34u);
  }
  v96 = [CKDUploadMergeableDeltasURLRequest alloc];
  v98 = objc_msgSend_initWithOperation_deltas_replacementRequests_(v96, v97, (uint64_t)val, v26, v113);
  objc_initWeak((id *)buf, val);
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = sub_1C4DFA620;
  v122[3] = &unk_1E64F3520;
  objc_copyWeak(&v123, (id *)buf);
  objc_msgSend_setPerDeltaCompletionBlock_(v98, v99, (uint64_t)v122);
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = sub_1C4DFA698;
  v120[3] = &unk_1E64F3548;
  objc_copyWeak(&v121, (id *)buf);
  objc_msgSend_setPerReplaceDeltasRequestCompletionBlock_(v98, v100, (uint64_t)v120);
  objc_initWeak(&location, v98);
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = sub_1C4DFA710;
  v116[3] = &unk_1E64F3570;
  objc_copyWeak(&v118, (id *)buf);
  objc_copyWeak(&v119, &location);
  v117 = v112;
  objc_msgSend_setCompletionBlock_(v98, v101, (uint64_t)v116);
  objc_msgSend_setRequest_(val, v102, (uint64_t)v98);
  v105 = objc_msgSend_container(val, v103, v104);
  objc_msgSend_performRequest_(v105, v106, (uint64_t)v98);

  objc_destroyWeak(&v119);
  objc_destroyWeak(&v118);
  objc_destroyWeak(&location);
  objc_destroyWeak(&v121);
  objc_destroyWeak(&v123);
  objc_destroyWeak((id *)buf);

  uint64_t v9 = v112;
LABEL_57:
}

- (void)handleDeltaUploaded:(id)a3 result:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_code(v7, v8, v9) == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v10 = (void *)*MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      v30 = v10;
      uint64_t v33 = objc_msgSend_metadata(v6, v31, v32);
      uint64_t v36 = objc_msgSend_identifier(v33, v34, v35);
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = v36;
      _os_log_debug_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_DEBUG, "Successfully uploaded delta: %@", buf, 0xCu);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = sub_1C4E94D98(v7);
    uint64_t v17 = objc_msgSend_request(self, v15, v16);
    v18 = sub_1C4E940D0(v17, v7);

    uint64_t v19 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v20 = *MEMORY[0x1E4F19DD8];
    uint64_t v23 = objc_msgSend_error(v7, v21, v22);
    v26 = objc_msgSend_errorDescription(v23, v24, v25);
    uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_format_(v19, v27, v20, v14, v18, @"Error uploading mergeable delta, %@, from server: %@", v6, v26);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v28 = (void *)*MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
    {
      v37 = v28;
      uint64_t v40 = objc_msgSend_metadata(v6, v38, v39);
      id v43 = objc_msgSend_identifier(v40, v41, v42);
      *(_DWORD *)buf = 138412546;
      uint64_t v45 = v43;
      __int16 v46 = 2112;
      v47 = v13;
      _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Failed to upload delta, %@, with error: %@", buf, 0x16u);
    }
  }
  objc_msgSend_uploadDeltaCompletionBlock(self, v11, v12);
  id v29 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, void *))v29)[2](v29, v6, v13);
}

- (void)handleReplaceDeltasRequest:(id)a3 result:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_code(v7, v8, v9) == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v10 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_debug_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_DEBUG, "Successfully replaced deltas for request: %@", buf, 0xCu);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = sub_1C4E94D98(v7);
    uint64_t v17 = objc_msgSend_request(self, v15, v16);
    v18 = sub_1C4E940D0(v17, v7);

    uint64_t v19 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v20 = *MEMORY[0x1E4F19DD8];
    uint64_t v23 = objc_msgSend_error(v7, v21, v22);
    v26 = objc_msgSend_errorDescription(v23, v24, v25);
    uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_format_(v19, v27, v20, v14, v18, @"Error replacing mergeable deltas %@: %@", v6, v26);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v28 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v13;
      _os_log_error_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_ERROR, "Failed to replace deltas with error: %@", buf, 0xCu);
    }
  }
  id v29 = objc_msgSend_replaceDeltasRequestCompletionBlock(self, v11, v12);

  if (v29)
  {
    objc_msgSend_replaceDeltasRequestCompletionBlock(self, v30, v31);
    uint64_t v32 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void *))v32)[2](v32, v6, v13);
  }
}

- (id)uploadDeltaCompletionBlock
{
  return self->_uploadDeltaCompletionBlock;
}

- (void)setUploadDeltaCompletionBlock:(id)a3
{
}

- (id)replaceDeltasRequestCompletionBlock
{
  return self->_replaceDeltasRequestCompletionBlock;
}

- (void)setReplaceDeltasRequestCompletionBlock:(id)a3
{
}

- (NSArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
}

- (NSArray)replacementRequests
{
  return self->_replacementRequests;
}

- (void)setReplacementRequests:(id)a3
{
}

- (NSMutableArray)pendingReplacementRequests
{
  return self->_pendingReplacementRequests;
}

- (void)setPendingReplacementRequests:(id)a3
{
}

- (NSMutableArray)pendingDeltaUploads
{
  return self->_pendingDeltaUploads;
}

- (void)setPendingDeltaUploads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDeltaUploads, 0);
  objc_storeStrong((id *)&self->_pendingReplacementRequests, 0);
  objc_storeStrong((id *)&self->_replacementRequests, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
  objc_storeStrong(&self->_replaceDeltasRequestCompletionBlock, 0);
  objc_storeStrong(&self->_uploadDeltaCompletionBlock, 0);
}

@end