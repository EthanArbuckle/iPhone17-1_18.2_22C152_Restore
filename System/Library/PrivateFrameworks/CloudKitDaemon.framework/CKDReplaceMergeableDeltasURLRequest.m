@interface CKDReplaceMergeableDeltasURLRequest
+ (id)requestOperationsForRequest:(id)a3 replaceDeltasRequests:(id)a4 ignoreMissingDeltas:(BOOL)a5 error:(id *)a6;
- (BOOL)allowsAnonymousAccount;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (BOOL)ignoreMissingDeltas;
- (CKDReplaceMergeableDeltasURLRequest)initWithOperation:(id)a3 replaceDeltasRequests:(id)a4 ignoreMissingDeltas:(BOOL)a5;
- (NSArray)replaceDeltasRequests;
- (NSMutableDictionary)replacementRequestsByRequestID;
- (id)anonymousUserIDForHTTPHeader;
- (id)generateRequestOperations;
- (id)perReplacementCompletionBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (int)isolationLevel;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setIgnoreMissingDeltas:(BOOL)a3;
- (void)setPerReplacementCompletionBlock:(id)a3;
- (void)setReplaceDeltasRequests:(id)a3;
- (void)setReplacementRequestsByRequestID:(id)a3;
@end

@implementation CKDReplaceMergeableDeltasURLRequest

- (CKDReplaceMergeableDeltasURLRequest)initWithOperation:(id)a3 replaceDeltasRequests:(id)a4 ignoreMissingDeltas:(BOOL)a5
{
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKDReplaceMergeableDeltasURLRequest;
  v10 = [(CKDURLRequest *)&v17 initWithOperation:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_replaceDeltasRequests, a4);
    uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13);
    replacementRequestsByRequestID = v11->_replacementRequestsByRequestID;
    v11->_replacementRequestsByRequestID = (NSMutableDictionary *)v14;

    v11->_ignoreMissingDeltas = a5;
  }

  return v11;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDReplaceMergeableDeltasURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_replaceDeltasRequests(self, v6, v7, v15.receiver, v15.super_class);
  v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  uint64_t v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"requests");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_replaceDeltasRequests(self, v5, v6);
  id v9 = objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1F20448D0);

  objc_msgSend_setModifyMergeableValueIDs_(v4, v10, (uint64_t)v9);
  objc_msgSend_setDeleteMergeableValueIDs_(v4, v11, (uint64_t)v9);
  v12.receiver = self;
  v12.super_class = (Class)CKDReplaceMergeableDeltasURLRequest;
  [(CKDURLRequest *)&v12 fillOutRequestProperties:v4];
}

- (BOOL)allowsAnonymousAccount
{
  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)zoneIDsToLock
{
  v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_replaceDeltasRequests(self, v4, v5);
  v8 = objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1F20448F0);
  objc_msgSend_addObjectsFromArray_(v3, v9, (uint64_t)v8);

  objc_super v12 = objc_msgSend_allObjects(v3, v10, v11);

  return v12;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (int)isolationLevel
{
  return 2;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)anonymousUserIDForHTTPHeader
{
  v3 = objc_msgSend_zoneIDsToLock(self, a2, v2);
  uint64_t v6 = objc_msgSend_firstObject(v3, v4, v5);
  id v9 = objc_msgSend_anonymousCKUserID(v6, v7, v8);

  return v9;
}

- (id)generateRequestOperations
{
  v3 = objc_opt_class();
  uint64_t v6 = objc_msgSend_replaceDeltasRequests(self, v4, v5);
  uint64_t v9 = objc_msgSend_ignoreMissingDeltas(self, v7, v8);
  id v36 = 0;
  uint64_t v11 = objc_msgSend_requestOperationsForRequest_replaceDeltasRequests_ignoreMissingDeltas_error_(v3, v10, (uint64_t)self, v6, v9, &v36);
  id v12 = v36;

  if (!v11) {
    objc_msgSend_finishWithError_(self, v13, (uint64_t)v12);
  }
  if (objc_msgSend_count(v11, v13, v14))
  {
    unint64_t v17 = 0;
    do
    {
      v18 = objc_msgSend_replaceDeltasRequests(self, v15, v16);
      v20 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, v17);

      v22 = objc_msgSend_objectAtIndexedSubscript_(v11, v21, v17);
      v25 = objc_msgSend_replacementRequestsByRequestID(self, v23, v24);
      v28 = objc_msgSend_request(v22, v26, v27);
      v31 = objc_msgSend_operationUUID(v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v25, v32, (uint64_t)v20, v31);

      ++v17;
    }
    while (v17 < objc_msgSend_count(v11, v33, v34));
  }

  return v11;
}

+ (id)requestOperationsForRequest:(id)a3 replaceDeltasRequests:(id)a4 ignoreMissingDeltas:(BOOL)a5 error:(id *)a6
{
  BOOL v105 = a5;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11);
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obj = v9;
  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v114, v121, 16);
  if (!v106)
  {
    id v81 = 0;
    goto LABEL_32;
  }
  v101 = a6;
  v103 = v12;
  uint64_t v104 = *(void *)v115;
  while (2)
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v115 != v104) {
        objc_enumerationMutation(obj);
      }
      uint64_t v107 = v15;
      uint64_t v16 = *(void **)(*((void *)&v114 + 1) + 8 * v15);
      unint64_t v17 = objc_msgSend_operationRequestWithType_(v8, v14, 313);
      v108 = v17;
      if (objc_msgSend_requiresCKAnonymousUserIDs(v8, v18, v19))
      {
        v22 = objc_msgSend_valueID(v16, v20, v21);
        v25 = objc_msgSend_zoneID(v22, v23, v24);
        v28 = objc_msgSend_anonymousCKUserID(v25, v26, v27);

        if (!v28)
        {
          v45 = objc_opt_new();
          uint64_t v88 = objc_msgSend_stringWithFormat_(NSString, v87, @"An anonymousCKUserID is required to replace deltas for %@ when using anonymous to server share participants", v16);
          objc_msgSend_setObject_forKeyedSubscript_(v45, v89, v88, *MEMORY[0x1E4F28568]);
          v92 = objc_msgSend_operation(v8, v90, v91);
          v95 = objc_msgSend_topmostParentOperation(v92, v93, v94);
          v98 = objc_msgSend_operationID(v95, v96, v97);

          if (v98) {
            objc_msgSend_setObject_forKeyedSubscript_(v45, v99, (uint64_t)v98, *MEMORY[0x1E4F19C50]);
          }
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v99, *MEMORY[0x1E4F19DD8], 5015, v45);
          id v81 = (id)objc_claimAutoreleasedReturnValue();

          v85 = (void *)v88;
          unint64_t v17 = v108;
LABEL_30:

          id v12 = 0;
          goto LABEL_31;
        }
        v31 = objc_msgSend_valueID(v16, v29, v30);
        uint64_t v34 = objc_msgSend_zoneID(v31, v32, v33);
        v37 = objc_msgSend_anonymousCKUserID(v34, v35, v36);
        v40 = objc_msgSend_CKDPIdentifier_User(v37, v38, v39);
        v43 = objc_msgSend_request(v17, v41, v42);
        objc_msgSend_setAnonymousCKUserID_(v43, v44, (uint64_t)v40);
      }
      v45 = objc_opt_new();
      v48 = objc_msgSend_translator(v8, v46, v47);
      v51 = objc_msgSend_valueID(v16, v49, v50);
      v53 = objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v48, v52, (uint64_t)v51);
      objc_msgSend_setIdentifier_(v45, v54, (uint64_t)v53);

      v57 = objc_msgSend_deltaIdentifiersToReplace(v16, v55, v56);
      v60 = objc_msgSend_mutableCopy(v57, v58, v59);
      objc_msgSend_setDeltaIdentifiers_(v45, v61, (uint64_t)v60);

      objc_msgSend_setIgnoreMissingDeltas_(v45, v62, v105);
      uint64_t v65 = objc_msgSend_replacementDeltasContainNewData(v16, v63, v64);
      objc_msgSend_setContainsNewData_(v45, v66, v65);
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      v69 = objc_msgSend_replacementDeltas(v16, v67, v68);
      uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v110, v120, 16);
      if (v71)
      {
        uint64_t v74 = v71;
        uint64_t v75 = *(void *)v111;
LABEL_11:
        uint64_t v76 = 0;
        while (1)
        {
          if (*(void *)v111 != v75) {
            objc_enumerationMutation(v69);
          }
          uint64_t v77 = *(void *)(*((void *)&v110 + 1) + 8 * v76);
          v78 = objc_msgSend_translator(v8, v72, v73);
          id v109 = 0;
          v80 = objc_msgSend_pMergeableDeltaFromDelta_error_(v78, v79, v77, &v109);
          id v81 = v109;

          if (!v80) {
            break;
          }
          objc_msgSend_addDeltas_(v45, v82, (uint64_t)v80);

          if (v74 == ++v76)
          {
            uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v72, (uint64_t)&v110, v120, 16);
            unint64_t v17 = v108;
            if (v74) {
              goto LABEL_11;
            }
            goto LABEL_17;
          }
        }

        unint64_t v17 = v108;
        if (!v81) {
          goto LABEL_19;
        }
        v85 = v103;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v86 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v119 = v81;
          _os_log_fault_impl(&dword_1C4CFF000, v86, OS_LOG_TYPE_FAULT, "Error creating mergeable delta proto for replacement request: %@", buf, 0xCu);
        }
        goto LABEL_30;
      }
LABEL_17:

LABEL_19:
      objc_msgSend_setMergeableDeltaReplaceRequest_(v17, v83, (uint64_t)v45);
      id v12 = v103;
      objc_msgSend_addObject_(v103, v84, (uint64_t)v17);

      uint64_t v15 = v107 + 1;
    }
    while (v107 + 1 != v106);
    uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v114, v121, 16);
    if (v106) {
      continue;
    }
    break;
  }
  id v81 = 0;
LABEL_31:
  a6 = v101;
LABEL_32:

  if (a6) {
    *a6 = v81;
  }

  return v12;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v8 = objc_msgSend_replacementRequestsByRequestID(self, v6, v7);
  uint64_t v11 = objc_msgSend_response(v5, v9, v10);
  uint64_t v14 = objc_msgSend_operationUUID(v11, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);

  if (!v16)
  {
    v41 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, @"CKDReplaceMergeableDeltasURLRequest.m", 176, @"Expected non-nil replacement request for response: %@", v5);
  }
  char hasMergeableDeltaReplaceResponse = objc_msgSend_hasMergeableDeltaReplaceResponse(v5, v17, v18);
  v20 = (void *)*MEMORY[0x1E4F1A548];
  if (hasMergeableDeltaReplaceResponse)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v20);
    }
    uint64_t v21 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = v21;
      uint64_t v36 = objc_msgSend_requestUUID(self, v34, v35);
      *(_DWORD *)buf = 138543618;
      v44 = v36;
      __int16 v45 = 2112;
      v46 = v16;
      _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received response for request %@\"", buf, 0x16u);
    }
    uint64_t v24 = objc_msgSend_perReplacementCompletionBlock(self, v22, v23);

    if (v24)
    {
      objc_msgSend_perReplacementCompletionBlock(self, v25, v26);
      uint64_t v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v30 = objc_msgSend_result(v5, v28, v29);
      ((void (**)(void, void *, void *))v27)[2](v27, v16, v30);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v20);
    }
    v31 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      v37 = v31;
      v40 = objc_msgSend_requestUUID(self, v38, v39);
      *(_DWORD *)buf = 138412290;
      v44 = v40;
      _os_log_fault_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_FAULT, "No mergeableDeltaReplaceResponse for mergeableDeltaReplaceRequest in request UUID %@", buf, 0xCu);
    }
  }

  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = v6;
    uint64_t v30 = objc_msgSend_requestUUID(self, v28, v29);
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v30;
    __int16 v35 = 2112;
    id v36 = v5;
    _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Node failure in replace deltas request: %@\"", buf, 0x16u);
  }
  id v9 = objc_msgSend_replacementRequestsByRequestID(self, v7, v8);
  id v12 = objc_msgSend_response(v5, v10, v11);
  uint64_t v15 = objc_msgSend_operationUUID(v12, v13, v14);
  unint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v9, v16, (uint64_t)v15);

  if (!v17)
  {
    v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, @"CKDReplaceMergeableDeltasURLRequest.m", 194, @"Expected non-nil replacement request for response: %@", v5);
  }
  v20 = objc_msgSend_perReplacementCompletionBlock(self, v18, v19);

  if (v20)
  {
    objc_msgSend_perReplacementCompletionBlock(self, v21, v22);
    uint64_t v23 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v26 = objc_msgSend_result(v5, v24, v25);
    ((void (**)(void, void *, void *))v23)[2](v23, v17, v26);
  }
}

- (NSArray)replaceDeltasRequests
{
  return self->_replaceDeltasRequests;
}

- (void)setReplaceDeltasRequests:(id)a3
{
}

- (id)perReplacementCompletionBlock
{
  return self->_perReplacementCompletionBlock;
}

- (void)setPerReplacementCompletionBlock:(id)a3
{
}

- (NSMutableDictionary)replacementRequestsByRequestID
{
  return self->_replacementRequestsByRequestID;
}

- (void)setReplacementRequestsByRequestID:(id)a3
{
}

- (BOOL)ignoreMissingDeltas
{
  return self->_ignoreMissingDeltas;
}

- (void)setIgnoreMissingDeltas:(BOOL)a3
{
  self->_ignoreMissingDeltas = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, 0);
  objc_storeStrong(&self->_perReplacementCompletionBlock, 0);
  objc_storeStrong((id *)&self->_replaceDeltasRequests, 0);
}

@end