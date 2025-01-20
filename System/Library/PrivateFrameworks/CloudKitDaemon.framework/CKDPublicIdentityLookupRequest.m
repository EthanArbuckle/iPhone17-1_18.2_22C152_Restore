@interface CKDPublicIdentityLookupRequest
- (BOOL)_tryComplete;
- (BOOL)hasPerformed;
- (BOOL)isCancelled;
- (CKDPublicIdentityLookupRequest)initWithOperation:(id)a3 lookupInfos:(id)a4;
- (id)ckShortDescription;
- (id)description;
- (id)lookupCompletionBlock;
- (id)perLookupInfoProgressBlock;
- (id)spawnURLRequests;
- (unint64_t)fetchBatchSize;
- (void)_receivedUserIdentity:(id)a3 forLookupInfo:(id)a4 error:(id)a5;
- (void)_saveUserIdentity:(id)a3 forLookupInfo:(id)a4;
- (void)cancel;
- (void)finishWithError:(id)a3;
- (void)performRequest;
- (void)setFetchBatchSize:(unint64_t)a3;
- (void)setHasPerformed:(BOOL)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setLookupCompletionBlock:(id)a3;
- (void)setPerLookupInfoProgressBlock:(id)a3;
@end

@implementation CKDPublicIdentityLookupRequest

- (CKDPublicIdentityLookupRequest)initWithOperation:(id)a3 lookupInfos:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKDPublicIdentityLookupRequest;
  v8 = [(CKDPublicIdentityLookupRequest *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_operation, v6);
    uint64_t v12 = objc_msgSend_copy(v7, v10, v11);
    lookupInfosToFetch = v9->_lookupInfosToFetch;
    v9->_lookupInfosToFetch = (NSArray *)v12;
  }
  return v9;
}

- (void)cancel
{
}

- (void)_saveUserIdentity:(id)a3 forLookupInfo:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_publicSharingKey(v6, v8, v9);

  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    v14 = objc_msgSend_container(WeakRetained, v12, v13);

    v17 = objc_msgSend_publicIdentitiesDiskCache(v14, v15, v16);
    if (v17)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v18 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v22 = v18;
        v25 = objc_msgSend_ckShortDescription(v7, v23, v24);
        int v26 = 138412546;
        id v27 = v25;
        __int16 v28 = 2112;
        v29 = v17;
        _os_log_debug_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_DEBUG, "Caching PILS entry for \"%@\" in %@", (uint8_t *)&v26, 0x16u);
      }
      objc_msgSend_cacheUserIdentity_forLookupInfo_container_(v17, v19, (uint64_t)v6, v7, v14);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v21 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412290;
      id v27 = v6;
      _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "Not caching user identity without a public sharing key: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  objc_msgSend__receivedUserIdentity_forLookupInfo_error_(self, v20, (uint64_t)v6, v7, 0);
}

- (void)_receivedUserIdentity:(id)a3 forLookupInfo:(id)a4 error:(id)a5
{
  perLookupInfoProgressBlock = (void (**)(id, id, id, id))self->_perLookupInfoProgressBlock;
  if (perLookupInfoProgressBlock) {
    perLookupInfoProgressBlock[2](perLookupInfoProgressBlock, a4, a3, a5);
  }
}

- (void)performRequest
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_hasPerformed(self, a2, v2))
  {
    v70 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    v71 = (objc_class *)objc_opt_class();
    v72 = NSStringFromClass(v71);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v70, v73, (uint64_t)a2, self, @"CKDPublicIdentityLookupRequest.m", 71, @"A %@ may only be performed once", v72);
  }
  objc_msgSend_setHasPerformed_(self, v5, 1);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  v10 = objc_msgSend_container(WeakRetained, v8, v9);

  uint64_t v13 = objc_msgSend_publicIdentitiesDiskCache(v10, v11, v12);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obj = self->_lookupInfosToFetch;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v91, v100, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v92;
    uint64_t v74 = *MEMORY[0x1E4F19DD8];
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v92 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v91 + 1) + 8 * v18);
        v22 = objc_msgSend_cachedIdentityForLookupInfo_container_(v13, v15, (uint64_t)v19, v10);
        if (*MEMORY[0x1E4F1A4E0]
          && (objc_msgSend_phoneNumber(v19, v20, v21),
              v23 = objc_claimAutoreleasedReturnValue(),
              int hasPrefix = objc_msgSend_hasPrefix_(v23, v24, @"UNIT_TEST_FAILED_LOOKUP_"),
              v23,
              hasPrefix))
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          int v26 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v44 = v26;
            v47 = objc_msgSend_phoneNumber(v19, v45, v46);
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v47;
            _os_log_debug_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_DEBUG, "Returning a fake empty response for participant \"%@\". You asked for it!", buf, 0xCu);
          }
          __int16 v28 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, v74, 1000, @"Unit-test-requested error fetching share participant");
          objc_msgSend__receivedUserIdentity_forLookupInfo_error_(self, v29, 0, v19, v28);
        }
        else if (v22)
        {
          objc_msgSend_setLookupInfo_(v22, v20, (uint64_t)v19);
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v30 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v37 = v30;
            objc_msgSend_publicSharingKey(v22, v38, v39);
            v40 = (void *(*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            uint64_t v43 = objc_msgSend_publicKeyVersion(v22, v41, v42);
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2114;
            v98 = v40;
            LOWORD(v99) = 2048;
            *(void *)((char *)&v99 + 2) = v43;
            _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Found lookup info key %@ in cache, injected it into cached identity %@. Public key is %{public}@/%lu", buf, 0x2Au);
          }
          objc_msgSend__receivedUserIdentity_forLookupInfo_error_(self, v31, (uint64_t)v22, v19, 0);
        }
        else
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v32 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v48 = v32;
            v51 = objc_msgSend_ckShortDescription(v19, v49, v50);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v51;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v13;
            _os_log_debug_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_DEBUG, "Found no PILS cache entry for \"%@\" in %@", buf, 0x16u);
          }
          missingLookupInfos = self->_missingLookupInfos;
          if (!missingLookupInfos)
          {
            v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v36 = self->_missingLookupInfos;
            self->_missingLookupInfos = v35;

            missingLookupInfos = self->_missingLookupInfos;
          }
          objc_msgSend_addObject_(missingLookupInfos, v33, (uint64_t)v19);
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v91, v100, 16);
    }
    while (v16);
  }

  if ((objc_msgSend__tryComplete(self, v52, v53) & 1) == 0)
  {
    v56 = objc_msgSend_spawnURLRequests(self, v54, v55);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v98 = sub_1C4F75A9C;
    *(void *)&long long v99 = sub_1C4F75AC8;
    *((void *)&v99 + 1) = 0;
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x3032000000;
    v88 = sub_1C4F75A9C;
    v89 = sub_1C4F75AC8;
    id v90 = 0;
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x3032000000;
    v83[3] = sub_1C4F75AD0;
    v83[4] = sub_1C4F75AE0;
    id v84 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1C4F75AE8;
    aBlock[3] = &unk_1E64F71C0;
    id v57 = v56;
    id v77 = v57;
    v80 = v83;
    v81 = buf;
    v82 = &v85;
    id v58 = v10;
    id v78 = v58;
    v79 = self;
    v59 = _Block_copy(aBlock);
    v60 = (void *)v86[5];
    v86[5] = (uint64_t)v59;

    v62 = objc_msgSend_objectAtIndex_(v57, v61, 0);
    uint64_t v65 = objc_msgSend_completionBlock(v62, v63, v64);
    v66 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v65;

    objc_msgSend_setCompletionBlock_(v62, v67, v86[5]);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v68 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v95 = 138412290;
      v96 = v62;
      _os_log_debug_impl(&dword_1C4CFF000, v68, OS_LOG_TYPE_DEBUG, "Starting execution of batched requests, triggering %@", v95, 0xCu);
    }
    objc_msgSend_performRequest_(v58, v69, (uint64_t)v62);

    _Block_object_dispose(v83, 8);
    _Block_object_dispose(&v85, 8);

    _Block_object_dispose(buf, 8);
  }
}

- (id)spawnURLRequests
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  v4 = self->_missingLookupInfos;
  unint64_t v7 = objc_msgSend_count(v4, v5, v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  if (v7)
  {
    *(void *)&long long v10 = 134218240;
    long long v35 = v10;
    do
    {
      unint64_t fetchBatchSize = self->_fetchBatchSize;
      if (v7 <= fetchBatchSize)
      {
        uint64_t v12 = v4;
        missingLookupInfos = self->_missingLookupInfos;
        self->_missingLookupInfos = 0;
      }
      else
      {
        objc_msgSend_subarrayWithRange_(v4, v8, 0, self->_fetchBatchSize);
        uint64_t v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectsInRange_(v4, v13, 0, fetchBatchSize);
      }
      uint64_t v17 = objc_msgSend_count(v12, v14, v15, v35);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v18 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        id v27 = v18;
        uint64_t v30 = objc_msgSend_count(v12, v28, v29);
        uint64_t BatchSize = objc_msgSend_fetchBatchSize(self, v31, v32);
        *(_DWORD *)from = v35;
        *(void *)&from[4] = v30;
        __int16 v42 = 2048;
        uint64_t v43 = BatchSize;
        _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Creating request to fetch public identity for %lu infos (batch size is %lu)", from, 0x16u);
      }
      v19 = [CKDDiscoverUserIdentitiesURLRequest alloc];
      uint64_t v21 = objc_msgSend_initWithOperation_lookupInfos_adopterProvidedLookupInfos_(v19, v20, (uint64_t)WeakRetained, v12, 1);
      objc_msgSend_setWantsProtectionInfo_(v21, v22, 1);
      *(void *)from = 0;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1C4F760B8;
      v37[3] = &unk_1E64F71E8;
      id v23 = WeakRetained;
      id v38 = v23;
      uint64_t v39 = self;
      objc_copyWeak(&v40, (id *)from);
      objc_msgSend_setProgressBlock_(v21, v24, (uint64_t)v37);
      objc_msgSend_configureRequest_(v23, v25, (uint64_t)v21);
      objc_msgSend_addObject_(v36, v26, (uint64_t)v21);
      objc_destroyWeak(&v40);

      objc_destroyWeak((id *)from);
      v7 -= v17;
    }
    while (v7);
  }

  return v36;
}

- (BOOL)_tryComplete
{
  if (objc_msgSend_isCancelled(self, a2, v2))
  {
    uint64_t v6 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v4, *MEMORY[0x1E4F19C40], 20, @"This request was cancelled");
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (objc_msgSend_count(self->_missingLookupInfos, v4, v5)) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = !v8;
  if (!v8) {
    objc_msgSend_finishWithError_(self, v7, (uint64_t)v6);
  }

  return v9;
}

- (void)finishWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_perLookupInfoProgressBlock)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = self->_missingLookupInfos;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v22, 16);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          (*((void (**)(id))self->_perLookupInfoProgressBlock + 2))(self->_perLookupInfoProgressBlock);
        }
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v16, v22, 16);
      }
      while (v8);
    }
  }
  lookupCompletionBlock = (void (**)(id, id))self->_lookupCompletionBlock;
  if (lookupCompletionBlock)
  {
    lookupCompletionBlock[2](lookupCompletionBlock, v4);
    id v13 = self->_lookupCompletionBlock;
  }
  else
  {
    id v13 = 0;
  }
  self->_lookupCompletionBlock = 0;

  id perLookupInfoProgressBlock = self->_perLookupInfoProgressBlock;
  self->_id perLookupInfoProgressBlock = 0;

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v15 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = self;
    _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "Completed request: %@", buf, 0xCu);
  }
}

- (id)description
{
  return (id)((uint64_t (*)(CKDPublicIdentityLookupRequest *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)ckShortDescription
{
  id v4 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2);
  unint64_t v8 = objc_msgSend_count(self->_lookupInfosToFetch, v5, v6);
  uint64_t v9 = NSString;
  if (v8 < 4)
  {
    long long v10 = objc_msgSend_stringWithFormat_(NSString, v7, @"lookupInfos=%@", self->_lookupInfosToFetch);
    objc_msgSend_addObject_(v4, v17, (uint64_t)v10);
  }
  else
  {
    long long v10 = objc_msgSend_subarrayWithRange_(self->_lookupInfosToFetch, v7, 0, 3);
    uint64_t v13 = objc_msgSend_count(self->_lookupInfosToFetch, v11, v12);
    uint64_t v15 = objc_msgSend_stringWithFormat_(v9, v14, @"lookupInfos=%@ + %ld more", v10, v13 - 3);
    objc_msgSend_addObject_(v4, v16, (uint64_t)v15);
  }
  long long v19 = objc_msgSend_componentsJoinedByString_(v4, v18, @", ");

  return v19;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (unint64_t)fetchBatchSize
{
  return self->_fetchBatchSize;
}

- (void)setFetchBatchSize:(unint64_t)a3
{
  self->_unint64_t fetchBatchSize = a3;
}

- (id)perLookupInfoProgressBlock
{
  return self->_perLookupInfoProgressBlock;
}

- (void)setPerLookupInfoProgressBlock:(id)a3
{
}

- (id)lookupCompletionBlock
{
  return self->_lookupCompletionBlock;
}

- (void)setLookupCompletionBlock:(id)a3
{
}

- (BOOL)hasPerformed
{
  return self->_hasPerformed;
}

- (void)setHasPerformed:(BOOL)a3
{
  self->_hasPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lookupCompletionBlock, 0);
  objc_storeStrong(&self->_perLookupInfoProgressBlock, 0);
  objc_storeStrong((id *)&self->_missingLookupInfos, 0);
  objc_storeStrong((id *)&self->_lookupInfosToFetch, 0);
  objc_destroyWeak((id *)&self->_operation);
}

@end