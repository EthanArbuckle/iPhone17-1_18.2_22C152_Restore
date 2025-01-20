@interface CKDFetchMergeableDeltaMetadataURLRequest
- (BOOL)allowsAnonymousAccount;
- (BOOL)handlesAnonymousCKUserIDPropagation;
- (CKDFetchMergeableDeltaMetadataURLRequest)initWithOperation:(id)a3 mergeableValueIDs:(id)a4 continuationTokens:(id)a5;
- (NSArray)mergeableValueIDs;
- (NSDictionary)continuationTokens;
- (NSMutableDictionary)mergeableValueIDByRequestID;
- (id)anonymousUserIDForHTTPHeader;
- (id)generateRequestOperations;
- (id)metadataFetchedBlock;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)zoneIDsToLock;
- (int)isolationLevel;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setContinuationTokens:(id)a3;
- (void)setMergeableValueIDByRequestID:(id)a3;
- (void)setMergeableValueIDs:(id)a3;
- (void)setMetadataFetchedBlock:(id)a3;
@end

@implementation CKDFetchMergeableDeltaMetadataURLRequest

- (CKDFetchMergeableDeltaMetadataURLRequest)initWithOperation:(id)a3 mergeableValueIDs:(id)a4 continuationTokens:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKDFetchMergeableDeltaMetadataURLRequest;
  v11 = [(CKDURLRequest *)&v18 initWithOperation:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mergeableValueIDs, a4);
    objc_storeStrong((id *)&v12->_continuationTokens, a5);
    uint64_t v15 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14);
    mergeableValueIDByRequestID = v12->_mergeableValueIDByRequestID;
    v12->_mergeableValueIDByRequestID = (NSMutableDictionary *)v15;
  }
  return v12;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchMergeableDeltaMetadataURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v15 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_mergeableValueIDs(self, v6, v7, v15.receiver, v15.super_class);
  v11 = objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v13 = objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"mvIDs");
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_mergeableValueIDs(self, v5, v6);
  objc_msgSend_setFetchMergeableValueIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchMergeableDeltaMetadataURLRequest;
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
  v8 = objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1F2044750);
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
  objc_super v9 = objc_msgSend_anonymousCKUserID(v6, v7, v8);

  return v9;
}

- (id)generateRequestOperations
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  objc_msgSend_mergeableValueIDs(self, v5, v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v87, v91, 16);
  if (v86)
  {
    uint64_t v10 = *(void *)v88;
    p_cache = CKDPRecordRetrieveChangesResponseShareChange.cache;
    while (2)
    {
      for (uint64_t i = 0; i != v86; ++i)
      {
        if (*(void *)v88 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_operationType(self, v8, v9);
        v16 = objc_msgSend_operationRequestWithType_(self, v15, v14);
        v19 = objc_msgSend_mergeableValueIDByRequestID(self, v17, v18);
        v22 = objc_msgSend_request(v16, v20, v21);
        v25 = objc_msgSend_operationUUID(v22, v23, v24);
        objc_msgSend_setObject_forKeyedSubscript_(v19, v26, (uint64_t)v13, v25);

        if (objc_msgSend_requiresCKAnonymousUserIDs(self, v27, v28))
        {
          v31 = objc_msgSend_zoneID(v13, v29, v30);
          v34 = objc_msgSend_anonymousCKUserID(v31, v32, v33);

          if (!v34)
          {
            v67 = objc_opt_new();
            v69 = objc_msgSend_stringWithFormat_(NSString, v68, @"An anonymousCKUserID is required to fetch metadata for %@ when using anonymous to server share participants", v13);
            objc_msgSend_setObject_forKeyedSubscript_(v67, v70, (uint64_t)v69, *MEMORY[0x1E4F28568]);
            v73 = objc_msgSend_operation(self, v71, v72);
            v76 = objc_msgSend_topmostParentOperation(v73, v74, v75);

            v80 = objc_msgSend_operationID(v76, v77, v78);
            if (v80) {
              objc_msgSend_setObject_forKeyedSubscript_(v67, v79, (uint64_t)v80, *MEMORY[0x1E4F19C50]);
            }
            v81 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v79, *MEMORY[0x1E4F19DD8], 5015, v67);
            objc_msgSend_finishWithError_(self, v82, (uint64_t)v81);

            id v66 = 0;
            goto LABEL_17;
          }
          v85 = objc_msgSend_zoneID(v13, v35, v36);
          v39 = objc_msgSend_anonymousCKUserID(v85, v37, v38);
          v42 = objc_msgSend_CKDPIdentifier_User(v39, v40, v41);
          objc_msgSend_request(v16, v43, v44);
          v45 = v16;
          v46 = self;
          v47 = p_cache;
          uint64_t v48 = v10;
          v50 = v49 = v4;
          objc_msgSend_setAnonymousCKUserID_(v50, v51, (uint64_t)v42);

          id v4 = v49;
          uint64_t v10 = v48;
          p_cache = v47;
          self = v46;
          v16 = v45;
        }
        v52 = objc_opt_new();
        v55 = objc_msgSend_translator(self, v53, v54);
        v57 = objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v55, v56, (uint64_t)v13);
        objc_msgSend_setIdentifier_(v52, v58, (uint64_t)v57);

        v61 = objc_msgSend_continuationTokens(self, v59, v60);
        v63 = objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)v13);

        if (v63) {
          objc_msgSend_setContinuation_(v52, v64, (uint64_t)v63);
        }
        objc_msgSend_setMergeableDeltaMetadataRetrieveRequest_(v16, v64, (uint64_t)v52);
        objc_msgSend_addObject_(v4, v65, (uint64_t)v16);
      }
      uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v87, v91, 16);
      if (v86) {
        continue;
      }
      break;
    }
  }

  id v66 = v4;
LABEL_17:

  return v66;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_mergeableValueIDByRequestID(self, v6, v7);
  uint64_t v11 = objc_msgSend_response(v5, v9, v10);
  uint64_t v14 = objc_msgSend_operationUUID(v11, v12, v13);
  v16 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);

  if (!v16)
  {
    v102 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v102, v103, (uint64_t)a2, self, @"CKDFetchMergeableDeltaMetadataURLRequest.m", 131, @"Expected non-nil value ID for response %@", v5);
  }
  if (objc_msgSend_hasMergeableDeltaMetadataRetrieveResponse(v5, v17, v18))
  {
    uint64_t v21 = objc_msgSend_mergeableDeltaMetadataRetrieveResponse(v5, v19, v20);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v22 = (void *)*MEMORY[0x1E4F1A530];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_DEBUG))
    {
      v85 = v22;
      long long v88 = objc_msgSend_requestUUID(self, v86, v87);
      v91 = objc_msgSend_metadatas(v21, v89, v90);
      uint64_t v94 = objc_msgSend_count(v91, v92, v93);
      v97 = objc_msgSend_continuation(v21, v95, v96);
      *(_DWORD *)buf = 138544130;
      id v113 = v88;
      __int16 v114 = 2112;
      v115 = v16;
      __int16 v116 = 2048;
      uint64_t v117 = v94;
      __int16 v118 = 2112;
      v119 = v97;
      _os_log_debug_impl(&dword_1C4CFF000, v85, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received response for value %@ metadataCount=%ld continuation=%@\"", buf, 0x2Au);
    }
    id v23 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v26 = objc_msgSend_metadatasCount(v21, v24, v25);
    uint64_t v28 = objc_msgSend_initWithCapacity_(v23, v27, v26);
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v31 = objc_msgSend_metadatas(v21, v29, v30);
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v107, v111, 16);
    if (v33)
    {
      uint64_t v36 = v33;
      v104 = v21;
      id v105 = v5;
      uint64_t v37 = *(void *)v108;
      while (2)
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v108 != v37) {
            objc_enumerationMutation(v31);
          }
          uint64_t v39 = *(void *)(*((void *)&v107 + 1) + 8 * i);
          v40 = objc_msgSend_translator(self, v34, v35);
          id v106 = 0;
          v42 = objc_msgSend_mergeableDeltaMetadataFromPMetadata_mergeableValueID_error_(v40, v41, v39, v16, &v106);
          id v43 = v106;

          if (v42) {
            BOOL v45 = v43 == 0;
          }
          else {
            BOOL v45 = 0;
          }
          if (!v45)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v21 = v104;
            id v5 = v105;
            v47 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v113 = v43;
              _os_log_error_impl(&dword_1C4CFF000, v47, OS_LOG_TYPE_ERROR, "Error parsing delta metadata: %@", buf, 0xCu);
            }

            goto LABEL_32;
          }
          objc_msgSend_addObject_(v28, v44, (uint64_t)v42);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v107, v111, 16);
        if (v36) {
          continue;
        }
        break;
      }
      id v43 = 0;
      uint64_t v21 = v104;
      id v5 = v105;
    }
    else
    {
      id v43 = 0;
    }
LABEL_32:

    v52 = objc_msgSend_result(v5, v48, v49);
    if (v43)
    {
      v53 = objc_opt_new();

      objc_msgSend_setCode_(v53, v54, 3);
      v55 = objc_opt_new();
      objc_msgSend_setError_(v53, v56, (uint64_t)v55);

      v57 = objc_opt_new();
      uint64_t v60 = objc_msgSend_error(v53, v58, v59);
      objc_msgSend_setClientError_(v60, v61, (uint64_t)v57);

      v64 = objc_msgSend_error(v53, v62, v63);
      v67 = objc_msgSend_clientError(v64, v65, v66);
      objc_msgSend_setType_(v67, v68, 1);

      v71 = objc_msgSend_error(v53, v69, v70);
      objc_msgSend_setErrorKey_(v71, v72, @"Unable to parse delta metadata from server response");

      uint64_t v75 = objc_msgSend_error(v53, v73, v74);
      objc_msgSend_setErrorDescription_(v75, v76, @"Unable to parse delta metadata");

      v52 = v53;
    }
    v77 = objc_msgSend_metadataFetchedBlock(self, v50, v51);

    if (v77)
    {
      objc_msgSend_metadataFetchedBlock(self, v78, v79);
      v80 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend_continuation(v21, v81, v82);
      ((void (**)(void, void *, void *, void *, void *))v80)[2](v80, v16, v28, v83, v52);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v46 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      v98 = v46;
      v101 = objc_msgSend_requestUUID(self, v99, v100);
      *(_DWORD *)buf = 138412290;
      id v113 = v101;
      _os_log_fault_impl(&dword_1C4CFF000, v98, OS_LOG_TYPE_FAULT, "No mergeableDeltaMetadataRetrieveResponse for mergeableDeltaMetadataRetrieveRequest in request UUID %@", buf, 0xCu);
    }
    id v43 = 0;
  }

  return v43;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_ERROR))
  {
    v34 = v6;
    uint64_t v37 = objc_msgSend_requestUUID(self, v35, v36);
    int v38 = 138543618;
    uint64_t v39 = v37;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_error_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Node failure in list metadatas request: %@\"", (uint8_t *)&v38, 0x16u);
  }
  uint64_t v9 = objc_msgSend_response(v4, v7, v8);
  v12 = objc_msgSend_operationUUID(v9, v10, v11);

  if (!v12) {
    goto LABEL_9;
  }
  objc_super v15 = objc_msgSend_mergeableValueIDByRequestID(self, v13, v14);
  uint64_t v18 = objc_msgSend_response(v4, v16, v17);
  uint64_t v21 = objc_msgSend_operationUUID(v18, v19, v20);
  id v23 = objc_msgSend_objectForKeyedSubscript_(v15, v22, (uint64_t)v21);

  if (v23)
  {
    uint64_t v26 = objc_msgSend_metadataFetchedBlock(self, v24, v25);

    if (v26)
    {
      objc_msgSend_metadataFetchedBlock(self, v27, v28);
      v29 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_result(v4, v30, v31);
      ((void (**)(void, void *, void, void, void *))v29)[2](v29, v23, 0, 0, v32);
    }
  }
  else
  {
LABEL_9:
    if (*v5 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v33 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v38) = 0;
      _os_log_fault_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_FAULT, "No value ID for list metadatas node failure response", (uint8_t *)&v38, 2u);
    }
    id v23 = 0;
  }
}

- (NSArray)mergeableValueIDs
{
  return self->_mergeableValueIDs;
}

- (void)setMergeableValueIDs:(id)a3
{
}

- (NSDictionary)continuationTokens
{
  return self->_continuationTokens;
}

- (void)setContinuationTokens:(id)a3
{
}

- (id)metadataFetchedBlock
{
  return self->_metadataFetchedBlock;
}

- (void)setMetadataFetchedBlock:(id)a3
{
}

- (NSMutableDictionary)mergeableValueIDByRequestID
{
  return self->_mergeableValueIDByRequestID;
}

- (void)setMergeableValueIDByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValueIDByRequestID, 0);
  objc_storeStrong(&self->_metadataFetchedBlock, 0);
  objc_storeStrong((id *)&self->_continuationTokens, 0);
  objc_storeStrong((id *)&self->_mergeableValueIDs, 0);
}

@end