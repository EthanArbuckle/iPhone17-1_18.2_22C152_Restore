@interface CKDDeclineSharesOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)_declineShares;
- (BOOL)makeStateTransition;
- (CKDDeclineSharesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSMutableArray)shareURLsToDecline;
- (NSMutableDictionary)clientProvidedMetadatasByURL;
- (id)activityCreate;
- (id)declineCompletionBlock;
- (int)operationType;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleShareURLDeclined:(id)a3 responseCode:(id)a4;
- (void)_performCallbackForURL:(id)a3 error:(id)a4;
- (void)main;
- (void)setClientProvidedMetadatasByURL:(id)a3;
- (void)setDeclineCompletionBlock:(id)a3;
- (void)setShareURLsToDecline:(id)a3;
@end

@implementation CKDDeclineSharesOperation

- (CKDDeclineSharesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CKDDeclineSharesOperation;
  v7 = [(CKDDatabaseOperation *)&v43 initWithOperationInfo:v6 container:a4];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    clientProvidedMetadatasByURL = v7->_clientProvidedMetadatasByURL;
    v7->_clientProvidedMetadatasByURL = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    shareURLsToDecline = v7->_shareURLsToDecline;
    v7->_shareURLsToDecline = (NSMutableArray *)v10;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v37 = v6;
    objc_msgSend_shareMetadatasToDecline(v6, v12, v13);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v39, v44, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v22 = v7->_clientProvidedMetadatasByURL;
          v23 = objc_msgSend_share(v21, v16, v17);
          v26 = objc_msgSend_URL(v23, v24, v25);
          objc_msgSend_setObject_forKeyedSubscript_(v22, v27, (uint64_t)v21, v26);

          v28 = v7->_shareURLsToDecline;
          v31 = objc_msgSend_share(v21, v29, v30);
          v34 = objc_msgSend_URL(v31, v32, v33);
          objc_msgSend_addObject_(v28, v35, (uint64_t)v34);
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v39, v44, 16);
      }
      while (v18);
    }

    id v6 = v37;
  }

  return v7;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/decline-shares", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    uint64_t v8 = objc_msgSend_shareURLsToDecline(self, v5, v6);
    uint64_t v11 = objc_msgSend_count(v8, v9, v10);

    if (!v11) {
      return 0;
    }
    BOOL v13 = 1;
    objc_msgSend_setState_(self, v12, 1);
    return v13;
  }
  if (v4 != 1) {
    return 1;
  }
  objc_msgSend_setState_(self, v5, 2);
  return MEMORY[0x1F4181798](self, sel__declineShares, v7);
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Declining Shares";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDDeclineSharesOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_performCallbackForURL:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_shareURLsToDecline(self, v8, v9);
  objc_msgSend_removeObject_(v10, v11, (uint64_t)v6);

  v14 = objc_msgSend_clientProvidedMetadatasByURL(self, v12, v13);
  objc_msgSend_removeObjectForKey_(v14, v15, (uint64_t)v6);

  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4ED0008;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v22 = v6;
  id v23 = v7;
  id v19 = v7;
  id v20 = v6;
  dispatch_async(v18, block);
}

- (void)_handleShareURLDeclined:(id)a3 responseCode:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_code(v7, v8, v9) == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v6;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Share with URL %@ was successfully declined", buf, 0xCu);
    }
    objc_msgSend__performCallbackForURL_error_(self, v13, (uint64_t)v6, 0);
  }
  else
  {
    v14 = objc_msgSend_error(v7, v10, v11);
    uint64_t v17 = objc_msgSend_clientError(v14, v15, v16);
    int v20 = objc_msgSend_type(v17, v18, v19);

    v21 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v22 = *MEMORY[0x1E4F1A550];
    if (v20 == 7)
    {
      if (v22 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v21);
      }
      id v23 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v6;
        _os_log_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_INFO, "Zone busy failure for share with url %@.", buf, 0xCu);
      }
    }
    else
    {
      if (v22 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v21);
      }
      v24 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = v24;
        v28 = objc_msgSend_error(v7, v26, v27);
        v31 = objc_msgSend_errorDescription(v28, v29, v30);
        *(_DWORD *)buf = 138412546;
        id v49 = v6;
        __int16 v50 = 2114;
        v51 = v31;
        _os_log_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_INFO, "Error declining share with URL %@: %{public}@", buf, 0x16u);
      }
      v32 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v33 = *MEMORY[0x1E4F19DD8];
      uint64_t v34 = sub_1C4E94D98(v7);
      id v37 = objc_msgSend_request(self, v35, v36);
      v38 = sub_1C4E940D0(v37, v7);
      long long v41 = objc_msgSend_error(v7, v39, v40);
      v44 = objc_msgSend_errorDescription(v41, v42, v43);
      v46 = objc_msgSend_errorWithDomain_code_userInfo_format_(v32, v45, v33, v34, v38, @"Error declining share %@: %@", v6, v44);

      objc_msgSend__performCallbackForURL_error_(self, v47, (uint64_t)v6, v46);
    }
  }
}

- (int)operationType
{
  return 221;
}

- (BOOL)_declineShares
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_shareURLsToDecline(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v67 = objc_msgSend_container(self, v8, v9);
    v68 = objc_opt_new();
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v12 = objc_msgSend_clientProvidedMetadatasByURL(self, v10, v11);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v76, v80, 16);
    if (v16)
    {
      uint64_t v17 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v77 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v76 + 1) + 8 * i);
          int v20 = objc_msgSend_clientProvidedMetadatasByURL(self, v14, v15);
          uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v20, v21, v19);

          if (objc_msgSend_participantRole(v22, v23, v24) != 4)
          {
            uint64_t v25 = objc_opt_new();
            objc_msgSend_setShareURL_(v25, v26, v19);
            v29 = objc_msgSend_share(v22, v27, v28);
            v32 = objc_msgSend_recordID(v29, v30, v31);
            objc_msgSend_setShareRecordID_(v25, v33, (uint64_t)v32);

            uint64_t v36 = objc_msgSend_options(v67, v34, v35);
            LODWORD(v32) = objc_msgSend_useAnonymousToServerShareParticipants(v36, v37, v38);

            if (v32)
            {
              v47 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v39, v40);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v47, v48, (uint64_t)a2, self, @"CKDDeclineSharesOperation.m", 139, @"Anonymous to Apple shares not supported by decline");
            }
            long long v41 = objc_msgSend_callingParticipant(v22, v39, v40);
            v44 = objc_msgSend_participantID(v41, v42, v43);
            objc_msgSend_setParticipantID_(v25, v45, (uint64_t)v44);

            objc_msgSend_addObject_(v68, v46, (uint64_t)v25);
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v76, v80, 16);
      }
      while (v16);
    }

    uint64_t v51 = objc_msgSend_count(v68, v49, v50);
    BOOL v52 = v51 != 0;
    if (v51)
    {
      v53 = [CKDDeclineSharesURLRequest alloc];
      v55 = objc_msgSend_initWithOperation_shareMetadatasToDecline_(v53, v54, (uint64_t)self, v68);
      objc_initWeak(location, self);
      objc_initWeak(&from, v55);
      v58 = objc_msgSend_stateTransitionGroup(self, v56, v57);
      dispatch_group_enter(v58);

      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = sub_1C4ED08FC;
      v72[3] = &unk_1E64F0148;
      objc_copyWeak(&v73, location);
      objc_msgSend_setShareDeclinedBlock_(v55, v59, (uint64_t)v72);
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = sub_1C4ED0974;
      v69[3] = &unk_1E64F0170;
      objc_copyWeak(&v70, location);
      objc_copyWeak(&v71, &from);
      objc_msgSend_setCompletionBlock_(v55, v60, (uint64_t)v69);
      objc_msgSend_setRequest_(self, v61, (uint64_t)v55);
      objc_msgSend_performRequest_(v67, v62, (uint64_t)v55);
      objc_destroyWeak(&v71);
      objc_destroyWeak(&v70);
      objc_destroyWeak(&v73);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v64 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_INFO, "No shares to decline", (uint8_t *)location, 2u);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v63 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1C4CFF000, v63, OS_LOG_TYPE_INFO, "No shares to decline", (uint8_t *)location, 2u);
    }
    return 0;
  }
  return v52;
}

- (void)main
{
  uint64_t v4 = objc_msgSend_shareURLsToDecline(self, a2, v2);
  BOOL v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setDeclineCompletionBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDDeclineSharesOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)declineCompletionBlock
{
  return self->_declineCompletionBlock;
}

- (void)setDeclineCompletionBlock:(id)a3
{
}

- (NSMutableDictionary)clientProvidedMetadatasByURL
{
  return self->_clientProvidedMetadatasByURL;
}

- (void)setClientProvidedMetadatasByURL:(id)a3
{
}

- (NSMutableArray)shareURLsToDecline
{
  return self->_shareURLsToDecline;
}

- (void)setShareURLsToDecline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLsToDecline, 0);
  objc_storeStrong((id *)&self->_clientProvidedMetadatasByURL, 0);
  objc_storeStrong(&self->_declineCompletionBlock, 0);
}

@end