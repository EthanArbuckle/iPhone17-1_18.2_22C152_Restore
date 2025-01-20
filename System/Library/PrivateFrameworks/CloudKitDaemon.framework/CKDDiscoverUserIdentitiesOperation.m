@interface CKDDiscoverUserIdentitiesOperation
+ (BOOL)adopterProvidedLookupInfos;
- (CKDDiscoverUserIdentitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)userIdentityLookupInfos;
- (id)activityCreate;
- (id)discoverUserIdentitiesProgressBlock;
- (int)operationType;
- (void)_discoverIdentitiesWithLookupInfos:(id)a3 completionBlock:(id)a4;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleDiscoveredIdentity:(id)a3 lookupInfo:(id)a4 responseCode:(id)a5;
- (void)main;
- (void)setDiscoverUserIdentitiesProgressBlock:(id)a3;
- (void)setUserIdentityLookupInfos:(id)a3;
@end

@implementation CKDDiscoverUserIdentitiesOperation

- (CKDDiscoverUserIdentitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDDiscoverUserIdentitiesOperation;
  v9 = [(CKDOperation *)&v13 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_userIdentityLookupInfos(v6, v7, v8);
    userIdentityLookupInfos = v9->_userIdentityLookupInfos;
    v9->_userIdentityLookupInfos = (NSArray *)v10;
  }
  return v9;
}

+ (BOOL)adopterProvidedLookupInfos
{
  return 1;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/discover-user-identities", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 401;
}

- (void)_handleDiscoveredIdentity:(id)a3 lookupInfo:(id)a4 responseCode:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v11 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "For lookup info %@, discovered identity %@", buf, 0x16u);
  }
  if (objc_msgSend_code(v10, v12, v13) == 1)
  {
    if (v8)
    {
      v16 = objc_msgSend_callbackQueue(self, v14, v15);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4DF7038;
      block[3] = &unk_1E64F0120;
      block[4] = self;
      id v33 = v9;
      id v34 = v8;
      dispatch_async(v16, block);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v18 = *MEMORY[0x1E4F19DD8];
    uint64_t v19 = sub_1C4E94D98(v10);
    v22 = objc_msgSend_request(self, v20, v21);
    v23 = sub_1C4E940D0(v22, v10);
    v25 = objc_msgSend_errorWithDomain_code_userInfo_format_(v17, v24, v18, v19, v23, @"Error discovering identity for lookup info %@", v9);
    objc_msgSend_setError_(self, v26, (uint64_t)v25);

    v29 = objc_msgSend_request(self, v27, v28);
    objc_msgSend_cancel(v29, v30, v31);
  }
}

- (void)_discoverIdentitiesWithLookupInfos:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_count(v6, v8, v9))
  {
    id v10 = [CKDDiscoverUserIdentitiesURLRequest alloc];
    v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_adopterProvidedLookupInfos(v11, v12, v13);
    v16 = objc_msgSend_initWithOperation_lookupInfos_adopterProvidedLookupInfos_(v10, v15, (uint64_t)self, v6, v14);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v16);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1C4DF72FC;
    v31[3] = &unk_1E64F3438;
    objc_copyWeak(&v32, &location);
    objc_msgSend_setProgressBlock_(v16, v17, (uint64_t)v31);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = sub_1C4DF73A0;
    v27 = &unk_1E64F3460;
    objc_copyWeak(&v29, &location);
    id v28 = v7;
    objc_copyWeak(&v30, &from);
    objc_msgSend_setCompletionBlock_(v16, v18, (uint64_t)&v24);
    objc_msgSend_setRequest_(self, v19, (uint64_t)v16, v24, v25, v26, v27);
    v22 = objc_msgSend_container(self, v20, v21);
    objc_msgSend_performRequest_(v22, v23, (uint64_t)v16);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)main
{
  v4 = objc_msgSend_userIdentityLookupInfos(self, a2, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4DF74F0;
  v6[3] = &unk_1E64F08D0;
  v6[4] = self;
  objc_msgSend__discoverIdentitiesWithLookupInfos_completionBlock_(self, v5, (uint64_t)v4, v6);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setDiscoverUserIdentitiesProgressBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDDiscoverUserIdentitiesOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)discoverUserIdentitiesProgressBlock
{
  return self->_discoverUserIdentitiesProgressBlock;
}

- (void)setDiscoverUserIdentitiesProgressBlock:(id)a3
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
  objc_storeStrong(&self->_discoverUserIdentitiesProgressBlock, 0);
}

@end