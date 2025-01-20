@interface CKDFetchShareParticipantsOperation
- (CKDFetchShareParticipantsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDPublicIdentityLookupRequest)pendingRequest;
- (NSArray)userIdentityLookupInfos;
- (id)activityCreate;
- (id)shareParticipantFetchedBlock;
- (int)operationType;
- (void)_fetchIdentities;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleFetchedInfo:(id)a3 withIdentity:(id)a4 error:(id)a5;
- (void)finishWithError:(id)a3;
- (void)main;
- (void)setPendingRequest:(id)a3;
- (void)setShareParticipantFetchedBlock:(id)a3;
- (void)setUserIdentityLookupInfos:(id)a3;
@end

@implementation CKDFetchShareParticipantsOperation

- (CKDFetchShareParticipantsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDFetchShareParticipantsOperation;
  v9 = [(CKDOperation *)&v13 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_userIdentityLookupInfos(v6, v7, v8);
    userIdentityLookupInfos = v9->_userIdentityLookupInfos;
    v9->_userIdentityLookupInfos = (NSArray *)v10;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-share-participants", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_handleFetchedInfo:(id)a3 withIdentity:(id)a4 error:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v11 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v57 = v8;
    __int16 v58 = 2112;
    id v59 = v9;
    __int16 v60 = 2112;
    id v61 = v10;
    _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "For fetch info %@, found user identity %@, error %@", buf, 0x20u);
  }
  v14 = objc_msgSend_shareParticipantFetchedBlock(self, v12, v13);

  if (v14)
  {
    if (v9)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1A3B0]);
      inited = objc_msgSend_initInternalWithUserIdentity_(v17, v18, (uint64_t)v9);
      v22 = objc_msgSend_userRecordID(v9, v20, v21);
      v25 = objc_msgSend_recordName(v22, v23, v24);
      v28 = objc_msgSend_container(self, v26, v27);
      v31 = objc_msgSend_orgAdminUserID(v28, v29, v30);
      uint64_t isEqualToString = objc_msgSend_isEqualToString_(v25, v32, (uint64_t)v31);
      objc_msgSend_setIsOrgAdminUser_(inited, v34, isEqualToString);

      v37 = objc_msgSend_userRecordID(v9, v35, v36);
      v40 = objc_msgSend_recordName(v37, v38, v39);
      v43 = objc_msgSend_container(self, v41, v42);
      v46 = objc_msgSend_containerScopedUserID(v43, v44, v45);
      uint64_t v48 = objc_msgSend_isEqualToString_(v40, v47, (uint64_t)v46);
      objc_msgSend_setIsCurrentUser_(inited, v49, v48);
    }
    else
    {
      inited = 0;
    }
    v50 = objc_msgSend_callbackQueue(self, v15, v16);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = sub_1C4E8CDDC;
    v52[3] = &unk_1E64F0DF0;
    v52[4] = self;
    id v53 = v8;
    id v54 = inited;
    id v55 = v10;
    id v51 = inited;
    dispatch_async(v50, v52);
  }
}

- (int)operationType
{
  return 401;
}

- (void)_fetchIdentities
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend_usesBackgroundSession(self, a2, v2);
  v7 = objc_msgSend_container(self, v5, v6);
  id v10 = v7;
  if (v4) {
    objc_msgSend_backgroundPublicIdentityLookupService(v7, v8, v9);
  }
  else {
  v11 = objc_msgSend_foregroundPublicIdentityLookupService(v7, v8, v9);
  }

  v12 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v13 = (id *)MEMORY[0x1E4F1A500];
  v14 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v11;
    _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Got lookup service for identity fetch operation: %@", buf, 0xCu);
  }
  v15 = [CKDPublicIdentityLookupRequest alloc];
  v18 = objc_msgSend_userIdentityLookupInfos(self, v16, v17);
  v20 = objc_msgSend_initWithOperation_lookupInfos_(v15, v19, (uint64_t)self, v18);
  objc_msgSend_setPendingRequest_(self, v21, (uint64_t)v20);

  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1C4E8D1B0;
  v40[3] = &unk_1E64F4890;
  objc_copyWeak(&v41, &location);
  uint64_t v24 = objc_msgSend_pendingRequest(self, v22, v23);
  objc_msgSend_setPerLookupInfoProgressBlock_(v24, v25, (uint64_t)v40);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1C4E8D23C;
  v38[3] = &unk_1E64F22C0;
  objc_copyWeak(&v39, &location);
  v28 = objc_msgSend_pendingRequest(self, v26, v27);
  objc_msgSend_setLookupCompletionBlock_(v28, v29, (uint64_t)v38);

  if (*v12 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v30 = *v13;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v37 = objc_msgSend_pendingRequest(self, v31, v32);
    *(_DWORD *)buf = 138412290;
    v44 = v37;
    _os_log_debug_impl(&dword_1C4CFF000, v30, OS_LOG_TYPE_DEBUG, "Scheduling a request %@ to the lookup service", buf, 0xCu);
  }
  v35 = objc_msgSend_pendingRequest(self, v33, v34);
  objc_msgSend_scheduleRequest_(v11, v36, (uint64_t)v35);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)main
{
  int v4 = objc_msgSend_userIdentityLookupInfos(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "Performing identities lookup with the lookup service", v12, 2u);
    }
    objc_msgSend__fetchIdentities(self, v10, v11);
  }
  else
  {
    objc_msgSend_finishWithError_(self, v8, 0);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setShareParticipantFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchShareParticipantsOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setPendingRequest_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchShareParticipantsOperation;
  [(CKDOperation *)&v6 finishWithError:v4];
}

- (id)shareParticipantFetchedBlock
{
  return self->_shareParticipantFetchedBlock;
}

- (void)setShareParticipantFetchedBlock:(id)a3
{
}

- (CKDPublicIdentityLookupRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong(&self->_shareParticipantFetchedBlock, 0);
}

@end