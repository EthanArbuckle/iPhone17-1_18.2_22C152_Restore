@interface CKDFetchWebAuthTokenOperation
- (CKDFetchWebAuthTokenOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSString)APIToken;
- (NSString)webAuthToken;
- (id)activityCreate;
- (int)operationType;
- (void)main;
- (void)setAPIToken:(id)a3;
- (void)setWebAuthToken:(id)a3;
@end

@implementation CKDFetchWebAuthTokenOperation

- (CKDFetchWebAuthTokenOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKDFetchWebAuthTokenOperation;
  v9 = [(CKDDatabaseOperation *)&v16 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    v10 = objc_msgSend_APIToken(v6, v7, v8);
    uint64_t v13 = objc_msgSend_copy(v10, v11, v12);
    APIToken = v9->_APIToken;
    v9->_APIToken = (NSString *)v13;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-web-auth-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 250;
}

- (void)main
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v18 = v3;
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v22 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v21, 1, 0, 0);
    v25 = objc_msgSend_CKPropertiesStyleString(v22, v23, v24);
    v27 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v26, 0, 1, 0);
    v30 = objc_msgSend_CKPropertiesStyleString(v27, v28, v29);
    *(_DWORD *)location = 138544130;
    *(void *)&location[4] = v20;
    __int16 v42 = 2048;
    v43 = self;
    __int16 v44 = 2114;
    v45 = v25;
    __int16 v46 = 2112;
    v47 = v30;
    _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Fetch web auth token operation <%{public}@: %p; %{public}@, %@> is starting",
      location,
      0x2Au);
  }
  v4 = [CKDFetchWebAuthTokenURLRequest alloc];
  id v6 = objc_msgSend_initWithOperation_(v4, v5, (uint64_t)self);
  v9 = objc_msgSend_APIToken(self, v7, v8);
  objc_msgSend_setAPIToken_(v6, v10, (uint64_t)v9);

  objc_initWeak((id *)location, self);
  objc_initWeak(&from, v6);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1C4F1DC40;
  v37[3] = &unk_1E64F6450;
  objc_copyWeak(&v38, (id *)location);
  v37[4] = self;
  objc_copyWeak(&v39, &from);
  objc_msgSend_setTokenFetchedBlock_(v6, v11, (uint64_t)v37);
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = sub_1C4F1DE8C;
  v34 = &unk_1E64F0170;
  objc_copyWeak(&v35, (id *)location);
  objc_copyWeak(&v36, &from);
  objc_msgSend_setCompletionBlock_(v6, v12, (uint64_t)&v31);
  objc_msgSend_setRequest_(self, v13, (uint64_t)v6, v31, v32, v33, v34);
  objc_super v16 = objc_msgSend_container(self, v14, v15);
  objc_msgSend_performRequest_(v16, v17, (uint64_t)v6);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);
}

- (NSString)webAuthToken
{
  return self->_webAuthToken;
}

- (void)setWebAuthToken:(id)a3
{
}

- (NSString)APIToken
{
  return self->_APIToken;
}

- (void)setAPIToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APIToken, 0);
  objc_storeStrong((id *)&self->_webAuthToken, 0);
}

@end